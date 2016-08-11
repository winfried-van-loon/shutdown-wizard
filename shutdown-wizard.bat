@ECHO OFF

:Begin
CLS
ECHO.
ECHO # Step 1/2
ECHO.
CHOICE /C sh /N /M "Would you like to shutdown or hibernate? [S,H] "
CLS

SET shutdownType=%ERRORLEVEL%

ECHO.
ECHO # Step 2/2
ECHO.
CHOICE /C 123456789 /N /M "Enter the waiting time in hours."
CLS

SET hours=%ERRORLEVEL%
SET /a seconds=%hours%*3600


IF [%shutdownType%] == [1] GOTO doShutdown
IF [%shutdownType%] == [2] GOTO doHibernate

:doShutdown
ECHO.
ECHO Alright, waiting for %hours% hours, the computer will then be shutting down.
ECHO.
timeout /t %seconds% /nobreak && shutdown /s
GOTO End

:doHibernate
ECHO.
ECHO Alright, waiting for %hours% hours, the computer will then hibernate.
ECHO.
timeout /t %seconds% /nobreak && shutdown /h
GOTO End

:End
