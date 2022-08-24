Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6259FDA5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392781.631363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrpK-0004fc-Uw; Wed, 24 Aug 2022 14:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392781.631363; Wed, 24 Aug 2022 14:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrpK-0004al-KP; Wed, 24 Aug 2022 14:57:54 +0000
Received: by outflank-mailman (input) for mailman id 392781;
 Wed, 24 Aug 2022 14:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oQrpJ-0004EH-7f
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:57:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 20b1e5c8-23bd-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 16:57:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDA451596;
 Wed, 24 Aug 2022 07:57:55 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43B0A3F67D;
 Wed, 24 Aug 2022 07:57:51 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 20b1e5c8-23bd-11ed-9250-1f966e50362f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/4] automation: Add yocto containers with cache
Date: Wed, 24 Aug 2022 15:57:19 +0100
Message-Id: <4d0141062aaec36a7c74182729c2dcef95deded3.1661352827.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661352827.git.bertrand.marquis@arm.com>
References: <cover.1661352827.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create yocto containers for kirkstone with a builder step to fill the
yocto cache by running the build script once.
Those containers depend on the kirkstone.dockerfile container to be
created and use it as base image.

To run a build test on one image the following command must be called
inside the container:
build-yocto.sh --xen-dir=XENSRC TARGET where
- XENSRC is the directory where xen sources are available in the
container
- TARGET is the build target (qemuarm64, qemuarm or qemux86_64)

In case of error, the script will return an error code and the logs will
be in /home/docker-build/logs.

!!!
The build of each container can take several hours depending on the
network bandwith (for downloading all sources) and the amount of
computing power on the machine where the docker images are created.
!!!

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- fix dependency in Makefile
---
 automation/build/Makefile                     |  2 ++
 .../build/yocto/kirkstone-qemuarm.dockerfile  | 28 +++++++++++++++++++
 .../yocto/kirkstone-qemuarm64.dockerfile      | 28 +++++++++++++++++++
 .../yocto/kirkstone-qemux86-64.dockerfile     | 28 +++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 automation/build/yocto/kirkstone-qemuarm.dockerfile
 create mode 100644 automation/build/yocto/kirkstone-qemuarm64.dockerfile
 create mode 100644 automation/build/yocto/kirkstone-qemux86-64.dockerfile

diff --git a/automation/build/Makefile b/automation/build/Makefile
index a4b2b85178cf..b0dc68f00b70 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -16,5 +16,7 @@ help:
 		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
 	fi
 
+$(subst .dockerfile,,$(wildcard yocto/kirkstone-*)): yocto/kirkstone
+
 .PHONY: all
 all: $(CONTAINERS)
diff --git a/automation/build/yocto/kirkstone-qemuarm.dockerfile b/automation/build/yocto/kirkstone-qemuarm.dockerfile
new file mode 100644
index 000000000000..e3cdc4dcf333
--- /dev/null
+++ b/automation/build/yocto/kirkstone-qemuarm.dockerfile
@@ -0,0 +1,28 @@
+# Docker file to populate the initial sstate and download cache for yocto
+# for a specific target
+#
+# This requires the build-yocto.sh script to be in the same directory as this
+# dockerfile during the image creation
+#
+# Arguments that can be passed during image creation using --build-arg:
+# "from_image=img" to select the docker image and tag to start from
+# "target=qemuxxx": to select which target to build in this image
+
+ARG from_image=registry.gitlab.com/xen-project/xen/yocto:kirkstone
+
+FROM $from_image AS builder
+
+ARG target=qemuarm
+
+# This step can take one to several hours depending on your download bandwith
+# and the speed of your computer
+RUN /home/$USER_NAME/bin/build-yocto.sh $target
+
+FROM $from_image
+
+# Only copy the cache status
+COPY --from=builder /home/$USER_NAME/yocto-cache /home/$USER_NAME/yocto-cache/.
+
+LABEL maintainer.name="The Xen Project " \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
diff --git a/automation/build/yocto/kirkstone-qemuarm64.dockerfile b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
new file mode 100644
index 000000000000..6045b6ac249f
--- /dev/null
+++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
@@ -0,0 +1,28 @@
+# Docker file to populate the initial sstate and download cache for yocto
+# for a specific target
+#
+# This requires the build-yocto.sh script to be in the same directory as this
+# dockerfile during the image creation
+#
+# Arguments that can be passed during image creation using --build-arg:
+# "from_image=img" to select the docker image and tag to start from
+# "target=qemuxxx": to select which target to build in this image
+
+ARG from_image=registry.gitlab.com/xen-project/xen/yocto:kirkstone
+
+FROM $from_image AS builder
+
+ARG target=qemuarm64
+
+# This step can take one to several hours depending on your download bandwith
+# and the speed of your computer
+RUN /home/$USER_NAME/bin/build-yocto.sh $target
+
+FROM $from_image
+
+# Only copy the cache status
+COPY --from=builder /home/$USER_NAME/yocto-cache /home/$USER_NAME/yocto-cache/.
+
+LABEL maintainer.name="The Xen Project " \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
diff --git a/automation/build/yocto/kirkstone-qemux86-64.dockerfile b/automation/build/yocto/kirkstone-qemux86-64.dockerfile
new file mode 100644
index 000000000000..35e2fdeb1e82
--- /dev/null
+++ b/automation/build/yocto/kirkstone-qemux86-64.dockerfile
@@ -0,0 +1,28 @@
+# Docker file to populate the initial sstate and download cache for yocto
+# for a specific target
+#
+# This requires the build-yocto.sh script to be in the same directory as this
+# dockerfile during the image creation
+#
+# Arguments that can be passed during image creation using --build-arg:
+# "from_image=img" to select the docker image and tag to start from
+# "target=qemuxxx": to select which target to build in this image
+
+ARG from_image=registry.gitlab.com/xen-project/xen/yocto:kirkstone
+
+FROM $from_image AS builder
+
+ARG target=qemux86-64
+
+# This step can take one to several hours depending on your download bandwith
+# and the speed of your computer
+RUN /home/$USER_NAME/bin/build-yocto.sh $target
+
+FROM $from_image
+
+# Only copy the cache status
+COPY --from=builder /home/$USER_NAME/yocto-cache /home/$USER_NAME/yocto-cache/.
+
+LABEL maintainer.name="The Xen Project " \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
-- 
2.25.1


