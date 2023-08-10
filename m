Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C341776D72
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 03:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581775.911192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTuJa-000653-6Y; Thu, 10 Aug 2023 01:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581775.911192; Thu, 10 Aug 2023 01:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTuJa-00063T-2p; Thu, 10 Aug 2023 01:18:14 +0000
Received: by outflank-mailman (input) for mailman id 581775;
 Thu, 10 Aug 2023 01:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TqLc=D3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTuJY-0005zH-4f
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 01:18:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3d13540-371b-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 03:18:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A76864D23;
 Thu, 10 Aug 2023 01:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41C6C433CA;
 Thu, 10 Aug 2023 01:18:06 +0000 (UTC)
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
X-Inumbo-ID: c3d13540-371b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691630287;
	bh=crHnn0Bq/eixmDIAlOgACBFKpTbRLyaaGW8boXXtf88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XdFxW5hfkrVceBkw56P8vvnT7f+YOeZFW1DVrKImOL5kJeH0VelYhj68qazSJzMn1
	 VHBghTz5vijJSnxDk3tXpVsyGBG98dXAIe+N+YVL0+cRFg4fr4M0rKac2qGHWYQJmC
	 4xOy2g1D6s0RkG2ioM4tlSQV76zQwug6z9/sihI2LiY/wyHKeB0XUj+NdfGCUJxlZn
	 CrY89z/5nRlX6Ule0FeFsieG0kmjhL80czmcldOzc9AHqAAZFgS0+GPytZnTwHwUUQ
	 wNB3HQAXOfKO+4G37pBrLPZb6vnx5GEOqN3fuJcvHxovkGF+RicXHLQrYwiCFaWv9R
	 B+xfEOTXGSQWA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: michal.orzel@amd.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	cardoe@cardoe.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 2/2] automation: use Alpine 3.18 instead of 3.12 for all gitlab jobs
Date: Wed,  9 Aug 2023 18:18:03 -0700
Message-Id: <20230810011803.311832-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2308091814450.2127516@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2308091814450.2127516@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/build.yaml | 64 ++++++++++++++++-----------------
 automation/gitlab-ci/test.yaml  | 56 ++++++++++++++---------------
 2 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index af64a53ead..173613567c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -273,9 +273,9 @@
 
 # Arm test artifacts
 
-alpine-3.12-arm64-rootfs-export:
+alpine-3.18-arm64-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18-arm64v8
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -319,9 +319,9 @@ qemu-system-aarch64-6.0.0-arm32-export:
 
 # x86_64 test artifacts
 
-alpine-3.12-rootfs-export:
+alpine-3.18-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -345,15 +345,15 @@ kernel-6.1.19-export:
 
 # Build jobs needed for tests
 
-alpine-3.12-gcc:
+alpine-3.18-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: alpine:3.12
+    CONTAINER: alpine:3.18
 
-alpine-3.12-gcc-debug:
+alpine-3.18-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: alpine:3.12
+    CONTAINER: alpine:3.18
 
 debian-stretch-gcc-debug:
   extends: .gcc-x86-64-build-debug
@@ -437,78 +437,78 @@ debian-unstable-gcc-debug-arm64-randconfig:
     CONTAINER: debian:unstable-arm64v8
     RANDCONFIG: y
 
-alpine-3.12-gcc-arm64:
+alpine-3.18-gcc-arm64:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
 
-alpine-3.12-gcc-debug-arm64:
+alpine-3.18-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
 
-alpine-3.12-gcc-arm64-randconfig:
+alpine-3.18-gcc-arm64-randconfig:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     RANDCONFIG: y
 
-alpine-3.12-gcc-debug-arm64-randconfig:
+alpine-3.18-gcc-debug-arm64-randconfig:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     RANDCONFIG: y
 
-alpine-3.12-gcc-arm64-staticmem:
+alpine-3.18-gcc-arm64-staticmem:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-alpine-3.12-gcc-debug-arm64-staticmem:
+alpine-3.18-gcc-debug-arm64-staticmem:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-alpine-3.12-gcc-arm64-static-shared-mem:
+alpine-3.18-gcc-arm64-static-shared-mem:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
       CONFIG_STATIC_SHM=y
 
-alpine-3.12-gcc-debug-arm64-static-shared-mem:
+alpine-3.18-gcc-debug-arm64-static-shared-mem:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
       CONFIG_STATIC_SHM=y
 
-alpine-3.12-gcc-arm64-boot-cpupools:
+alpine-3.18-gcc-arm64-boot-cpupools:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_SCHED_NULL=y
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
-alpine-3.12-gcc-debug-arm64-boot-cpupools:
+alpine-3.18-gcc-debug-arm64-boot-cpupools:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
@@ -622,15 +622,15 @@ debian-unstable-gcc-arm64-cppcheck:
 
 # Build jobs not needed for tests
 
-alpine-3.12-clang:
+alpine-3.18-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: alpine:3.12
+    CONTAINER: alpine:3.18
 
-alpine-3.12-clang-debug:
+alpine-3.18-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: alpine:3.12
+    CONTAINER: alpine:3.18
 
 archlinux-gcc:
   extends: .gcc-x86-64-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 45e8ddb7a3..8ccce1fe26 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -8,7 +8,7 @@
     - /^stable-.*/
 
 .arm64-test-needs: &arm64-test-needs
-  - alpine-3.12-arm64-rootfs-export
+  - alpine-3.18-arm64-rootfs-export
   - kernel-5.19-arm64-export
   - qemu-system-aarch64-6.0.0-arm64-export
 
@@ -16,7 +16,7 @@
   - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
-  - alpine-3.12-rootfs-export
+  - alpine-3.18-rootfs-export
   - kernel-6.1.19-export
 
 .qemu-arm64:
@@ -105,7 +105,7 @@
   extends: .test-jobs-common
   variables:
     # the test controller runs on RPi4
-    CONTAINER: alpine:3.12-arm64v8
+    CONTAINER: alpine:3.18-arm64v8
     LOGFILE: smoke-test.log
     PCIDEV: "03:00.0"
     PCIDEV_INTR: "MSI-X"
@@ -155,7 +155,7 @@ xilinx-smoke-dom0less-arm64-gcc:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-arm64
+    - alpine-3.18-gcc-arm64
 
 xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
   extends: .xilinx-arm64
@@ -163,7 +163,7 @@ xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-arm64
+    - alpine-3.18-gcc-arm64
 
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -171,7 +171,7 @@ adl-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 adl-smoke-x86-64-dom0pvh-gcc-debug:
   extends: .adl-x86-64
@@ -179,7 +179,7 @@ adl-smoke-x86-64-dom0pvh-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 adl-suspend-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -187,7 +187,7 @@ adl-suspend-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 adl-pci-pv-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -195,7 +195,7 @@ adl-pci-pv-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 adl-pci-hvm-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -205,7 +205,7 @@ adl-pci-hvm-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 zen3p-smoke-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -213,7 +213,7 @@ zen3p-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 zen3p-smoke-x86-64-dom0pvh-gcc-debug:
   extends: .zen3p-x86-64
@@ -221,7 +221,7 @@ zen3p-smoke-x86-64-dom0pvh-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 zen3p-pci-hvm-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -229,7 +229,7 @@ zen3p-pci-hvm-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc-debug
+    - alpine-3.18-gcc-debug
 
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
@@ -237,7 +237,7 @@ qemu-smoke-dom0-arm64-gcc:
     - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-arm64
+    - alpine-3.18-gcc-arm64
 
 qemu-smoke-dom0-arm64-gcc-debug:
   extends: .qemu-arm64
@@ -245,7 +245,7 @@ qemu-smoke-dom0-arm64-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-debug-arm64
+    - alpine-3.18-gcc-debug-arm64
 
 qemu-smoke-dom0less-arm64-gcc:
   extends: .qemu-arm64
@@ -253,7 +253,7 @@ qemu-smoke-dom0less-arm64-gcc:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-arm64
+    - alpine-3.18-gcc-arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug:
   extends: .qemu-arm64
@@ -261,7 +261,7 @@ qemu-smoke-dom0less-arm64-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-debug-arm64
+    - alpine-3.18-gcc-debug-arm64
 
 qemu-smoke-dom0less-arm64-gcc-staticmem:
   extends: .qemu-arm64
@@ -269,7 +269,7 @@ qemu-smoke-dom0less-arm64-gcc-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-arm64-staticmem
+    - alpine-3.18-gcc-arm64-staticmem
 
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
@@ -277,7 +277,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-debug-arm64-staticmem
+    - alpine-3.18-gcc-debug-arm64-staticmem
 
 qemu-smoke-dom0less-arm64-gcc-staticheap:
  extends: .qemu-arm64
@@ -285,7 +285,7 @@ qemu-smoke-dom0less-arm64-gcc-staticheap:
    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
  needs:
    - *arm64-test-needs
-   - alpine-3.12-gcc-arm64
+   - alpine-3.18-gcc-arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
  extends: .qemu-arm64
@@ -293,7 +293,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
  needs:
    - *arm64-test-needs
-   - alpine-3.12-gcc-debug-arm64
+   - alpine-3.18-gcc-debug-arm64
 
 qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
   extends: .qemu-arm64
@@ -301,7 +301,7 @@ qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-arm64-static-shared-mem
+    - alpine-3.18-gcc-arm64-static-shared-mem
 
 qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
   extends: .qemu-arm64
@@ -309,7 +309,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-debug-arm64-static-shared-mem
+    - alpine-3.18-gcc-debug-arm64-static-shared-mem
 
 qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
   extends: .qemu-arm64
@@ -317,7 +317,7 @@ qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-arm64-boot-cpupools
+    - alpine-3.18-gcc-arm64-boot-cpupools
 
 qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
   extends: .qemu-arm64
@@ -325,14 +325,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.12-gcc-debug-arm64-boot-cpupools
+    - alpine-3.18-gcc-debug-arm64-boot-cpupools
 
 qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
   extends: .qemu-arm64
   script:
     - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
-    - alpine-3.12-gcc-arm64
+    - alpine-3.18-gcc-arm64
     - qemu-system-aarch64-6.0.0-arm64-export
 
 qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
@@ -340,7 +340,7 @@ qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
   script:
     - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
-    - alpine-3.12-gcc-debug-arm64
+    - alpine-3.18-gcc-debug-arm64
     - qemu-system-aarch64-6.0.0-arm64-export
 
 qemu-smoke-dom0-arm32-gcc:
@@ -421,7 +421,7 @@ qemu-alpine-x86_64-gcc:
     - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.12-gcc
+    - alpine-3.18-gcc
 
 qemu-smoke-x86-64-gcc:
   extends: .qemu-x86-64
-- 
2.25.1


