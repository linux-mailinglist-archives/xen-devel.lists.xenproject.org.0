Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946C93CC07
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 02:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765187.1175776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX8em-0005Ht-FM; Fri, 26 Jul 2024 00:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765187.1175776; Fri, 26 Jul 2024 00:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX8em-0005FM-CH; Fri, 26 Jul 2024 00:18:00 +0000
Received: by outflank-mailman (input) for mailman id 765187;
 Fri, 26 Jul 2024 00:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HdqS=O2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sX8ek-0005FG-TO
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 00:17:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 819a235e-4ae4-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 02:17:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 192ABCE149E;
 Fri, 26 Jul 2024 00:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C24FC116B1;
 Fri, 26 Jul 2024 00:17:51 +0000 (UTC)
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
X-Inumbo-ID: 819a235e-4ae4-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721953072;
	bh=LBVW3dzU89gbMUGTP1Ub4+WEJmEzM3nZ4iu+JrhXksk=;
	h=Date:From:To:cc:Subject:From;
	b=Cw0k75SOBYVrNODW+zi4K3Hi5CiwzdsWeRGHoqDmko4BCWo/oih/LEbtiGOrXdRej
	 XIOryrt7JEpPo8RydloMwdyBQfXahNgMT4BTRkCSJlVps9sIqvii3fRy9dDOcd31WB
	 z2on8fVoB9X8IBNfhgsxBFrufuwELVEPehgpRY6n194orz5hodBtUeC1x/3f3uWAK1
	 /bKPSgydT6OpDlYTz2lGbJzFx6CjUMXrkpLQMBQBpVnFHRMd/m8R+OZRTriN8zNzjx
	 zZnjC1xVMbrF19aCtlprBIp2taVe8lVaQ5SDH2a1XJ1Kr7wU/dtZne5EC0JDnZ+TED
	 t/RgVd7rzKNuA==
Date: Thu, 25 Jul 2024 17:17:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, marmarek@invisiblethingslab.com, 
    andrew.cooper3@citrix.com, cardoe@cardoe.com
Subject: [PATCH] automation: upgrade Yocto to scarthgap
Message-ID: <alpine.DEB.2.22.394.2407251715040.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Upgrade Yocto to a newer version. Use ext4 as image format for testing
with QEMU on ARM and ARM64 as the default is WIC and it is not available
for our xen-image-minimal target.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
I am running one last test (that takes hours) I'll make sure it passes
before I commit anything.
---
 automation/build/yocto/build-yocto.sh | 9 +++++++--
 automation/build/yocto/yocto.inc      | 4 ++--
 automation/gitlab-ci/build.yaml       | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
index 93ce81ce82..e7a03c4b10 100755
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -25,6 +25,7 @@ TARGET_SUPPORTED="qemuarm qemuarm64 qemux86-64"
 VERBOSE="n"
 TARGETLIST=""
 BUILDJOBS="8"
+EXT4="ext4"
 
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
@@ -83,6 +85,9 @@ function run_task() {
 function project_create() {
     target="${1:?}"
     destdir="${BUILDDIR}/${target}"
+    if [ $target = "qemux86-64" ]; then
+        EXT4=""
+    fi
 
     (
         # init yocto project
@@ -196,7 +201,7 @@ function project_run() {
 
         /usr/bin/expect <<EOF
 set timeout 1000
-spawn bash -c "runqemu serialstdio nographic slirp"
+spawn bash -c "runqemu serialstdio nographic slirp ${EXT4}"
 
 expect_after {
     -re "(.*)\r" {
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
-- 
2.25.1


