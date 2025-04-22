@echo off
echo Running Maven build and install...

mvn install

REM Extract project name
FOR /F "tokens=*" %%i IN ('mvn -q -DforceStdout help:evaluate -Dexpression=project.name') DO set NAME=%%i

REM Extract project version
FOR /F "tokens=*" %%i IN ('mvn -q -DforceStdout help:evaluate -Dexpression=project.version') DO set VERSION=%%i

echo Running generated JAR...
java -jar target\%NAME%-%VERSION%.jar