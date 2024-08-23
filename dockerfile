# Start with the official Jenkins base image
FROM jenkins/jenkins:lts

# Switch to the root user to install JDK 17
USER root

# Install JDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get clean

# Set the JAVA_HOME environment variable to JDK 17
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Switch back to the Jenkins user
USER jenkins

# Expose the default Jenkins port
EXPOSE 8080

# Define the default command to start Jenkins
CMD ["jenkins.sh"]
