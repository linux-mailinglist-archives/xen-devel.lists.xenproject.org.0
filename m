Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E893DC5C
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 02:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765789.1176439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXVAA-0000cZ-0U; Sat, 27 Jul 2024 00:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765789.1176439; Sat, 27 Jul 2024 00:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXVA9-0000aS-Tx; Sat, 27 Jul 2024 00:19:53 +0000
Received: by outflank-mailman (input) for mailman id 765789;
 Sat, 27 Jul 2024 00:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sXVA8-0000Sf-P3
 for xen-devel@lists.xenproject.org; Sat, 27 Jul 2024 00:19:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f03dffaa-4bad-11ef-bc00-fd08da9f4363;
 Sat, 27 Jul 2024 02:19:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9379FCE0ED1;
 Sat, 27 Jul 2024 00:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0E3C32782;
 Sat, 27 Jul 2024 00:19:43 +0000 (UTC)
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
X-Inumbo-ID: f03dffaa-4bad-11ef-bc00-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722039584;
	bh=caF8ZEnVQAiNG73dG8gwlbc6P0P+Qerrz+YIN+0RoYY=;
	h=Date:From:To:cc:Subject:From;
	b=SZ27PMHYdp2E7lT6S0L+6NG+gmYrcpAEga6X1bWDXZk3Tel2b+3VRAR+nm4wQyKxo
	 YlGBCyzfrS6POgwYWaX9CEYEGBWtvNJvUcevhy9Dn6SMHWwzJPYIQYG04/IIS7vnnM
	 qg0oh/UHBMorJwGEGLflhmQAxGBrpy6clmv6KQfS9uta+mhAvHSTBdLMyjz1coixql
	 zPtASQ9F7xVUulvs55dMJk2IbBEVpO5hPpgbM2+MMZlPddaO2J478X91dFsL2WCjFC
	 DrbX3/f2grgTGXM4lqYkgV3a7uPSQGxfqSo1EWXFilQSKbv78qhkbp73ehKxk7gNb2
	 p9xOriynMsM9g==
Date: Fri, 26 Jul 2024 17:19:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, marmarek@invisiblethingslab.com, 
    andrew.cooper3@citrix.com, cardoe@cardoe.com
Subject: [PATCH v2] automation: upgrade Yocto to scarthgap
Message-ID: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Upgrade Yocto to a newer version. Use ext4 as image format for testing
with QEMU on ARM and ARM64 as the default is WIC and it is not available
for our xen-image-minimal target.

Also update the tar.bz2 filename for the rootfs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

all yocto tests pass:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1390081173

Changes in v2:
- s/EXT4/IMAGE_FMT/
- set IMAGE_FMT before the call to project_build
- also update the filename xen-image-minimal-qemuarm.rootfs.tar.bz2
---
 automation/build/yocto/build-yocto.sh       | 15 ++++++++++++---
 automation/build/yocto/yocto.inc            |  4 ++--
 automation/gitlab-ci/build.yaml             |  2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh |  2 +-
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
index 93ce81ce82..e1e69f2bb5 100755
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -25,6 +25,7 @@ TARGET_SUPPORTED="qemuarm qemuarm64 qemux86-64"
 VERBOSE="n"
 TARGETLIST=""
 BUILDJOBS="8"
+IMAGE_FMT=""
 
 # actions to do
 do_clean="n"
@@ -38,8 +39,9 @@ build_result=0
 # layers to include in the project
 build_layerlist="poky/meta poky/meta-poky poky/meta-yocto-bsp \
                  meta-openembedded/meta-oe meta-openembedded/meta-python \
+                 meta-openembedded/meta-networking \
                  meta-openembedded/meta-filesystems \
-                 meta-openembedded/meta-networking meta-virtualization"
+                 meta-virtualization"
 
 # yocto image to build
 build_image="xen-image-minimal"
@@ -175,7 +177,7 @@ function project_build() {
                 mkdir -p $OUTPUTDIR
                 cp $BUILDDIR/tmp/deploy/images/qemuarm/zImage $OUTPUTDIR
                 cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-qemuarm $OUTPUTDIR
-                cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal-qemuarm.tar.bz2 $OUTPUTDIR
+                cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal-qemuarm.rootfs.tar.bz2 $OUTPUTDIR
             fi
         fi
     ) || return 1
@@ -196,7 +198,7 @@ function project_run() {
 
         /usr/bin/expect <<EOF
 set timeout 1000
-spawn bash -c "runqemu serialstdio nographic slirp"
+spawn bash -c "runqemu serialstdio nographic slirp ${IMAGE_FMT}"
 
 expect_after {
     -re "(.*)\r" {
@@ -356,6 +358,13 @@ for f in ${TARGETLIST}; do
         run_task project_create "${f}"
     fi
     if [ -f "${BUILDDIR}/${f}/conf/local.conf" ]; then
+        # Set the right image target
+        if [ "$f" = "qemux86-64" ]; then
+            IMAGE_FMT=""
+        else
+            IMAGE_FMT="ext4"
+        fi
+
         if [ "${do_build}" = "y" ]; then
             run_task project_build "${f}"
         fi
diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yocto.inc
index 2f3b1a5b2a..209df7dde9 100644
--- a/automation/build/yocto/yocto.inc
+++ b/automation/build/yocto/yocto.inc
@@ -6,10 +6,10 @@
 # YOCTOVERSION-TARGET for x86_64 hosts
 # YOCTOVERSION-TARGET-arm64v8 for arm64 hosts
 # For example you can build an arm64 container with the following command:
-# make yocto/kirkstone-qemuarm64-arm64v8
+# make yocto/scarthgap-qemuarm64-arm64v8
 
 # Yocto versions we are currently using.
-YOCTO_VERSION = kirkstone
+YOCTO_VERSION = scarthgap
 
 # Yocto BSPs we want to build for.
 YOCTO_TARGETS = qemuarm64 qemuarm qemux86-64
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 7ce88d38e7..32045cef0c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -212,7 +212,7 @@
   script:
     - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
   variables:
-    YOCTO_VERSION: kirkstone
+    YOCTO_VERSION: scarthgap
     CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}${YOCTO_HOST}
   artifacts:
     paths:
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 31c05cc840..eaaea5a982 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -8,7 +8,7 @@ cd binaries
 
 mkdir rootfs
 cd rootfs
-tar xvf ../xen-image-minimal-qemuarm.tar.bz2
+tar xvf ../xen-image-minimal-qemuarm.rootfs.tar.bz2
 mkdir -p ./root
 echo "name=\"test\"
 memory=400
-- 
2.25.1


