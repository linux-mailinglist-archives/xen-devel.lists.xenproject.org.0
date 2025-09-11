Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A404BB53EFD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 01:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121000.1465622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSq-00088L-Iq; Thu, 11 Sep 2025 23:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121000.1465622; Thu, 11 Sep 2025 23:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSq-00080K-CD; Thu, 11 Sep 2025 23:12:28 +0000
Received: by outflank-mailman (input) for mailman id 1121000;
 Thu, 11 Sep 2025 23:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwqSo-0007EP-Ly
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 23:12:26 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c705ed73-8f64-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 01:12:24 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3dce6eed889so1194382f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 16:12:24 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e03729c76sm40014715e9.6.2025.09.11.16.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 16:12:23 -0700 (PDT)
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
X-Inumbo-ID: c705ed73-8f64-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757632344; x=1758237144; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeLwzviMpfWDaMr+4cJyL8clwYsQTKK8d3VCevZ5LjE=;
        b=ML4MkSgyHGC/sgYT6FLxg9VUW+zyXmpsJCd7UGbVyMDJOx6HSsIb/Sq18eSiD1xXGW
         mpR6Le4shfJ+W7ItvYBc+88myI4j7Z8vz0I5sOKuoCcQoR5u0ewxhMkyrv9anVfYf/WA
         q8ArHNNDmrnYFqGhjC/L2txr9PFmQOMSd0yrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757632344; x=1758237144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeLwzviMpfWDaMr+4cJyL8clwYsQTKK8d3VCevZ5LjE=;
        b=Z3evbaNUvzOhSx/uUFJYVpPHsNYN2e4lkJshhDyjJsl0lVESmCl+Bs8s6ASAoU0/tV
         syF6rKG/mTFcQ2kPy6n+BS+NyMs+Bpz5kuyt/NDCXTQgPuwjlNb8Vt04OLmDxDP02USa
         VW5Jc89HNc87XOrAGsR/jCA4b4W4w1/vJVpsQOVTZzrNRg6HB5e4wZ4yJHDnr5j5WHfG
         l/klE3MoRFNI7/9C4OcBFG8GgmC8F3/sErm5P1eY9bllVsB8whbzx+4UwSsqEYsY6Bgz
         A3I+vfnHFJWExOkH2J39noegb2OAgtqYUU70Ur6TQ4EgGQvQZHuEGpuYxp03KyTl1l6C
         xqzA==
X-Gm-Message-State: AOJu0YzZCx6g5RNEOoxu/QP72sYH0PxOrSMKoFlx6WGXSqziKwwbtd5v
	WtMMMAeYaJpX4k/B/tTMIoVLO6BPNYtmxDzHf2x1ixRoCaRDMuAZ/VCccWPCh6u4rw48JSoNM0l
	EoVBc
X-Gm-Gg: ASbGncvvfI0tlNF1GB7C7P3y53q0A0BYOU1WeZIHEfZMyer2Xb0a4w5qu6HHWpxDTKx
	4wQREVkDD4sMaTu5SNGujGweHE9SrY0xq/GESOlWu/3Idh12+WlzLc990EnC4akDi70LrzUdk/C
	0bqH1+5z0rhzx1z2y6OrG6Wbs/6GbVePsmDac801Hpkv8/sxLgYi/UADZa+a8p9DapDfPY3pPzo
	OWrUSGgRUpUArpI3nCJf0lwLqVu0NfT4Pu/9MZuB/COI3K0s2DujFiqOs6SsNWox1nnWPxVOrRx
	EGRpF+nWNzgDBFAjD7m1PKbHn1Z/FwVWtrQQgU2mrDgaXyWb1HClbdmQxQqau5V6iiKCBLzK9tf
	LEoIOtbmOSBycfhdLpVtUaqxrv1kTL/VeE/hN0Wdio+M8ZDf0TYxPdGn0QAHbhLpGpAJNdQc3ok
	qwLjxhFMjGuOg=
X-Google-Smtp-Source: AGHT+IFX23G7QN0g3dE2sYV/MnY6dXS7qgjlt2Aw6ZFq9rRDcdGw2dFEWCLCyJHH/WZaILosgsFjww==
X-Received: by 2002:a05:6000:40c9:b0:3e7:42c5:ea46 with SMTP id ffacd0b85a97d-3e765a03801mr718781f8f.55.1757632343917;
        Thu, 11 Sep 2025 16:12:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH v3 4/5] CI: Update x86 to use Debian Trixie
Date: Fri, 12 Sep 2025 00:12:15 +0100
Message-Id: <20250911231216.1886818-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the exception of the custom IBT job, copy all Debian 12 jobs making
Debian 13 versions, then trim the Debian 12 ranconfig jobs.

Update the test jobs using Debian 12 to use 13.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>

v3:
 * Update .qemu-x86-64 too.
 * Rebase over cleanup to 12-x86_64
v2:
 * Make 13-x86_64 be root-less
 * Update containerize
---
 ...x86_32.dockerfile => 13-x86_32.dockerfile} |  2 +-
 ...x86_64.dockerfile => 13-x86_64.dockerfile} |  2 +-
 automation/gitlab-ci/build.yaml               | 54 ++++++++++++++-----
 automation/gitlab-ci/test.yaml                | 12 ++---
 automation/scripts/containerize               |  3 +-
 5 files changed, 52 insertions(+), 21 deletions(-)
 copy automation/build/debian/{12-x86_32.dockerfile => 13-x86_32.dockerfile} (95%)
 copy automation/build/debian/{12-x86_64.dockerfile => 13-x86_64.dockerfile} (96%)

diff --git a/automation/build/debian/12-x86_32.dockerfile b/automation/build/debian/13-x86_32.dockerfile
similarity index 95%
copy from automation/build/debian/12-x86_32.dockerfile
copy to automation/build/debian/13-x86_32.dockerfile
index ef7a2571556b..2bd11af5a0c3 100644
--- a/automation/build/debian/12-x86_32.dockerfile
+++ b/automation/build/debian/13-x86_32.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/i386 debian:bookworm
+FROM --platform=linux/i386 debian:trixie-slim
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
similarity index 96%
copy from automation/build/debian/12-x86_64.dockerfile
copy to automation/build/debian/13-x86_64.dockerfile
index 4e533ee879fd..2c6c9d4a5098 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bookworm
+FROM --platform=linux/amd64 debian:trixie-slim
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f8e45f3467c8..4cb52fe59715 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -309,15 +309,15 @@ alpine-3.18-gcc-debug:
       CONFIG_UCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
-debian-12-x86_64-gcc-debug:
+debian-13-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
 
-debian-12-x86_64-clang-debug:
+debian-13-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
 
 debian-13-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
@@ -545,24 +545,20 @@ debian-12-x86_64-clang:
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-x86_64-clang-randconfig:
-  extends: .clang-x86-64-build
+debian-12-x86_64-clang-debug:
+  extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG: |
-      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
 
 debian-12-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-x86_64-gcc-randconfig:
-  extends: .gcc-x86-64-build
+debian-12-x86_64-gcc-debug:
+  extends: .gcc-x86-64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
-    RANDCONFIG: y
 
 debian-12-x86_32-clang-debug:
   extends: .clang-x86-32-build-debug
@@ -574,6 +570,40 @@ debian-12-x86_32-gcc-debug:
   variables:
     CONTAINER: debian:12-x86_32
 
+debian-13-x86_64-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+
+debian-13-x86_64-clang-randconfig:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
+
+debian-13-x86_64-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+
+debian-13-x86_64-gcc-randconfig:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+    RANDCONFIG: y
+
+debian-13-x86_32-clang-debug:
+  extends: .clang-x86-32-build-debug
+  variables:
+    CONTAINER: debian:13-x86_32
+
+debian-13-x86_32-gcc-debug:
+  extends: .gcc-x86-32-build-debug
+  variables:
+    CONTAINER: debian:13-x86_32
+
 fedora-41-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index e8946e15dc3a..8d8f62c8d04d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -59,7 +59,7 @@
 .qemu-x86-64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
     LOGFILE: qemu-smoke-x86-64.log
   artifacts:
     paths:
@@ -661,35 +661,35 @@ qemu-smoke-x86-64-gcc:
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-clang-debug
+    - debian-13-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-clang-debug
+    - debian-13-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-efi:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64-efi pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-xtf-argo-x86_64-gcc-debug:
   extends: .qemu-smoke-x86-64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 65c8804ce5f3..743567cb772a 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -35,7 +35,8 @@ case "_${CONTAINER}" in
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _trixie-riscv64) CONTAINER="${BASE}/debian:13-riscv64" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
-    _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
+    _bookworm|_bookworm-x86_64) CONTAINER="${BASE}/debian:12-x86_64" ;;
+    _trixie-x86_64|_) CONTAINER="${BASE}/debian:13-x86_64" ;;
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
-- 
2.39.5


