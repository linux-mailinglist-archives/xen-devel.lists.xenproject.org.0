Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582E1C04AF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 20:27:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUDuR-0007zK-0s; Thu, 30 Apr 2020 18:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VdV=6O=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jUDuQ-0007z6-48
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 18:27:42 +0000
X-Inumbo-ID: 46be0406-8b10-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46be0406-8b10-11ea-b9cf-bc764e2007e4;
 Thu, 30 Apr 2020 18:27:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 24AABAC4A;
 Thu, 30 Apr 2020 18:27:40 +0000 (UTC)
Subject: [PATCH 3/3] automation: implement (rootless) podman support in
 containerize
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 30 Apr 2020 20:27:39 +0200
Message-ID: <158827125993.19371.14414402068069346455.stgit@Palanthas>
In-Reply-To: <158827088416.19371.17008531228521109457.stgit@Palanthas>
References: <158827088416.19371.17008531228521109457.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Right now only docker is supported, when using the containerize script
for building inside containers. Enable podman as well.

Note that podman can be use in rootless mode too, but for that to work
the files /etc/subuid and /etc/subgid must be properly configured.

For instance:

dario@localhost> cat /etc/subuid
dario:100000:65536

dario@localhost:> cat /etc/subgid
dario:100000:65536

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
---
 automation/build/README.md      |   10 ++++++++++
 automation/scripts/containerize |   17 +++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/automation/build/README.md b/automation/build/README.md
index 8cda2b65a5..e1fb3124de 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -34,6 +34,16 @@ the default shell.
 There are several environment variables which the containerize script
 understands.
 
+- DOCKED_CMD: Whether to use docker or podman for running the containers.
+  podman can be used as a regular user (rootless podman), but for that
+  to work, /etc/subuid and /etc/subgid needs to containe the proper
+  entries, for such user.
+  docker is the default, for running with podman, do:
+
+  ```
+  DOCKER_CMD=podman ./automation/scripts/containerize make
+  ```
+
 - CONTAINER: This overrides the container to use. For CentOS 7.2, use:
 
   ```
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index eb805bf96c..04b9fc7ba4 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -1,5 +1,14 @@
 #!/bin/bash
 
+#
+# DOCKER_CMD should be either `docker` or `podman`.
+#
+# if using (rootless) podman, remember to set /etc/subuid
+# and /etc/subgid.
+#
+docker_cmd=${DOCKER_CMD:-"docker"}
+[ "$DOCKER_CMD" = "podman" ] && userns_podman="--userns=keep-id"
+
 einfo() {
     echo "$*" >&2
 }
@@ -31,7 +40,7 @@ esac
 # Use this variable to control whether root should be used
 case "_${CONTAINER_UID0}" in
     _1)   userarg= ;;
-    _0|_) userarg="-u $(id -u)" ;;
+    _0|_) userarg="-u $(id -u) $userns_podman" ;;
 esac
 
 # Save the commands for future use
@@ -49,8 +58,8 @@ tty -s && termint=t
 #
 if [[ "_${CONTAINER_NO_PULL}" != "_1" ]]; then
     einfo "*** Ensuring ${CONTAINER} is up to date"
-    docker pull ${CONTAINER} > /dev/null ||     \
-        die "Failed to update docker container"
+    ${docker_cmd} pull ${CONTAINER} > /dev/null ||     \
+        die "Failed to update container"
 fi
 
 if hash greadlink > /dev/null 2>&1; then
@@ -82,7 +91,7 @@ fi
 
 # Kick off Docker
 einfo "*** Launching container ..."
-exec docker run \
+exec ${docker_cmd} run \
     ${userarg} \
     ${SSH_AUTH_SOCK:+-e SSH_AUTH_SOCK="/tmp/ssh-agent/${SSH_AUTH_NAME}"} \
     -v "${CONTAINER_PATH}":/build:rw \


