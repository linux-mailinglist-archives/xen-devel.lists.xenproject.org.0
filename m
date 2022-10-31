Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6ED61389C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432886.685579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM4-0004cT-T0; Mon, 31 Oct 2022 14:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432886.685579; Mon, 31 Oct 2022 14:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM4-0004aW-Pb; Mon, 31 Oct 2022 14:01:32 +0000
Received: by outflank-mailman (input) for mailman id 432886;
 Mon, 31 Oct 2022 14:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+oh=3A=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1opVM2-0004Ib-OI
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 14:01:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 82f2a89d-5924-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 15:01:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A826523A;
 Mon, 31 Oct 2022 07:01:35 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B48333F5A1;
 Mon, 31 Oct 2022 07:01:28 -0700 (PDT)
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
X-Inumbo-ID: 82f2a89d-5924-11ed-8fd0-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/4] automation: Add yocto containers with cache
Date: Mon, 31 Oct 2022 14:00:54 +0000
Message-Id: <6538dd8bc1fce8f6848567a0a7fbab00d49bd2ae.1667224593.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667224593.git.bertrand.marquis@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
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
Changes in v3:
- Copy build-yocto.sh inside the container before running it to generate
the cache.
Changes in v2:
- pass --dump-log option to build-yocto.sh during the image generation
so that we have more info when there is an error during the image
creation.
Changes in v1:
- fix dependency in Makefile
---
 automation/build/Makefile                     |  2 ++
 .../build/yocto/kirkstone-qemuarm.dockerfile  | 29 +++++++++++++++++++
 .../yocto/kirkstone-qemuarm64.dockerfile      | 29 +++++++++++++++++++
 .../yocto/kirkstone-qemux86-64.dockerfile     | 29 +++++++++++++++++++
 4 files changed, 89 insertions(+)
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
index 000000000000..e4540021d0af
--- /dev/null
+++ b/automation/build/yocto/kirkstone-qemuarm.dockerfile
@@ -0,0 +1,29 @@
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
+COPY ./build-yocto.sh /
+RUN /build-yocto.sh --dump-log $target
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
index 000000000000..aea3fc1f3e5d
--- /dev/null
+++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
@@ -0,0 +1,29 @@
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
+COPY ./build-yocto.sh /
+RUN /build-yocto.sh --dump-log $target
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
index 000000000000..9b2277a65e33
--- /dev/null
+++ b/automation/build/yocto/kirkstone-qemux86-64.dockerfile
@@ -0,0 +1,29 @@
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
+COPY ./build-yocto.sh /
+RUN /build-yocto.sh --dump-log $target
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


