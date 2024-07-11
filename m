Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BE92E5CB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757333.1166270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrm2-0002gC-Mk; Thu, 11 Jul 2024 11:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757333.1166270; Thu, 11 Jul 2024 11:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrm2-0002dB-AB; Thu, 11 Jul 2024 11:15:42 +0000
Received: by outflank-mailman (input) for mailman id 757333;
 Thu, 11 Jul 2024 11:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlz-0007rD-Ur
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e745a80c-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:39 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77e5929033so110996866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:39 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:36 -0700 (PDT)
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
X-Inumbo-ID: e745a80c-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696538; x=1721301338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/58JNO+Inrk9wj+NdeQQj6nZyBQF1LcNhJ0B6w0/d4Y=;
        b=Sonh6Fh1hD1yLaUP98DAVGAaDnxP6/43lYczFbB9hUU5POzbQz+tMXnDE4cUom/jqz
         XzMy5XoiVVRHgjdF5/h4NVVhIchCsbnmYUSpKPbZEp0TZPsY9ILz30JCCNzDNSf/SiSR
         m2MV+0Vp50W8f657h/Mv2Gn/J4PLm/ZZ5Jq1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696538; x=1721301338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/58JNO+Inrk9wj+NdeQQj6nZyBQF1LcNhJ0B6w0/d4Y=;
        b=d0ZcigWPsgdBJbT8gCjDvmSnc3wwEfvAIvgi7J1UPom+cr5FC3vVWHO0THDZbzcpOj
         NFdansCvoAWl/iM0kkg/6f6p1Z519NOzkpYUR0TsepA1aiJpNQpbQfrTxW2muxHhJJaL
         xrprUnp4uN9PLWhRy61mw3sfSv+og9bdPHNtsOJUoKWWf2Jhel2z05LzQ++rpnEJtYQd
         R4T2VBhoj5VRdhCq0LhcKUduxyulDymi13GMtR26qSJsL7GEquL5KxZdf4IFE3dfNIkp
         CZQGvZz7l1RIcXaL6RiYLx3kodsDFH4bJY5cY9iQbCUlbtJu6N4Ad8dPA/vTttvjbl3Q
         hLlw==
X-Gm-Message-State: AOJu0Yx8tJpr8h8vTkgxqNseLgQo45hWo/pq+YSrDlK45pOSXszsqvsN
	d5QUd2G4B3U0Nvru4eMaSX5inaAy14dK/6NlarYvuYUshFG9fMnr9JsX+H/XZGueSYn9p8tSzt5
	4
X-Google-Smtp-Source: AGHT+IFUhjpe6I7SpkUuVRldLMGG9DNg5sTjpySDOkwmu/oP04WKHAaoix/XKfmfMefITqm1OqwgkQ==
X-Received: by 2002:a17:906:1808:b0:a77:c96b:a113 with SMTP id a640c23a62f3a-a780b881c98mr515861566b.60.1720696538294;
        Thu, 11 Jul 2024 04:15:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 11/12] CI: Swap to debian for riscv64 build and test
Date: Thu, 11 Jul 2024 12:15:16 +0100
Message-Id: <20240711111517.3064810-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The containers are both much smaller, with stable toolchains over time, and
this at least means we're not doing all testing with a single compiler.

Rename the jobs to follow to sort coherently ($DISTRO-$VERSION-$ARCH-*) and
reposition the jobs to optimise starting the smoke test.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 .../archlinux/current-riscv64.dockerfile      | 22 -----
 automation/gitlab-ci/build.yaml               | 83 +++++++++++--------
 automation/gitlab-ci/test.yaml                |  4 +-
 automation/scripts/containerize               |  3 +-
 4 files changed, 52 insertions(+), 60 deletions(-)
 delete mode 100644 automation/build/archlinux/current-riscv64.dockerfile

diff --git a/automation/build/archlinux/current-riscv64.dockerfile b/automation/build/archlinux/current-riscv64.dockerfile
deleted file mode 100644
index f7770bf82a78..000000000000
--- a/automation/build/archlinux/current-riscv64.dockerfile
+++ /dev/null
@@ -1,22 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 archlinux
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-# Packages needed for the build
-RUN pacman --noconfirm --needed -Syu \
-    base-devel \
-    git \
-    inetutils \
-    riscv64-linux-gnu-binutils \
-    riscv64-linux-gnu-gcc \
-    riscv64-linux-gnu-glibc \
-    # For test phase
-    qemu-system-riscv
-
-# Add compiler path
-ENV CROSS_COMPILE=riscv64-linux-gnu-
-
-RUN useradd --create-home user
-USER user
-WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index e081664c4e95..4b9d80cc5632 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -357,6 +357,13 @@ debian-12-ppc64le-gcc-debug:
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
+debian-12-riscv64-gcc-debug:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: debian:12-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
 # Arm32 cross-build
 
 debian-bookworm-gcc-arm32:
@@ -458,41 +465,6 @@ alpine-3.18-gcc-debug-arm64-earlyprintk:
       CONFIG_EARLY_UART_CHOICE_PL011=y
       CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
 
-# RISC-V 64 cross-build
-.riscv-fixed-randconfig:
-  variables: &riscv-fixed-randconfig
-    EXTRA_FIXED_RANDCONFIG: |
-      CONFIG_BOOT_TIME_CPUPOOLS=n
-      CONFIG_COVERAGE=n
-      CONFIG_EXPERT=y
-      CONFIG_GRANT_TABLE=n
-      CONFIG_MEM_ACCESS=n
-      CONFIG_PERF_COUNTERS=n
-      CONFIG_LIVEPATCH=n
-      CONFIG_XSM=n
-
-archlinux-current-gcc-riscv64:
-  extends: .gcc-riscv64-cross-build
-  variables:
-    CONTAINER: archlinux:current-riscv64
-    KBUILD_DEFCONFIG: tiny64_defconfig
-    HYPERVISOR_ONLY: y
-
-archlinux-current-gcc-riscv64-debug:
-  extends: .gcc-riscv64-cross-build-debug
-  variables:
-    CONTAINER: archlinux:current-riscv64
-    KBUILD_DEFCONFIG: tiny64_defconfig
-    HYPERVISOR_ONLY: y
-
-archlinux-current-gcc-riscv64-randconfig:
-  extends: .gcc-riscv64-cross-build
-  variables:
-    CONTAINER: archlinux:current-riscv64
-    KBUILD_DEFCONFIG: tiny64_defconfig
-    RANDCONFIG: y
-    <<: *riscv-fixed-randconfig
-
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64
@@ -739,3 +711,44 @@ debian-12-ppc64le-gcc:
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
+# RISC-V 64 cross-build
+debian-11-riscv64-gcc:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: debian:11-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-11-riscv64-gcc-debug:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: debian:11-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-12-riscv64-gcc:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: debian:12-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
+.riscv-fixed-randconfig:
+  variables: &riscv-fixed-randconfig
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_BOOT_TIME_CPUPOOLS=n
+      CONFIG_COVERAGE=n
+      CONFIG_EXPERT=y
+      CONFIG_GRANT_TABLE=n
+      CONFIG_MEM_ACCESS=n
+      CONFIG_PERF_COUNTERS=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_XSM=n
+
+debian-12-riscv64-gcc-randconfig:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: debian:12-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    RANDCONFIG: y
+    <<: *riscv-fixed-randconfig
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 70c946f87799..f7e1753ead34 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -56,7 +56,7 @@
 .qemu-riscv64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: archlinux:current-riscv64
+    CONTAINER: debian:12
     LOGFILE: qemu-smoke-riscv64.log
   artifacts:
     paths:
@@ -440,7 +440,7 @@ qemu-smoke-riscv64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
   needs:
-    - archlinux-current-gcc-riscv64-debug
+    - debian-12-riscv64-gcc-debug
 
 qemu-smoke-ppc64le-powernv9-gcc:
   extends: .qemu-ppc64le
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 5c3f6782d9cd..6dbf55c8f89a 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -27,12 +27,13 @@ case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.18" ;;
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
-    _riscv64) CONTAINER="${BASE}/archlinux:current-riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
+    _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
+    _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _bookworm|_) CONTAINER="${BASE}/debian:bookworm" ;;
     _bookworm-i386) CONTAINER="${BASE}/debian:bookworm-i386" ;;
-- 
2.39.2


