Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B16645FF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 17:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474806.736170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHRQ-0001Ep-Ou; Tue, 10 Jan 2023 16:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474806.736170; Tue, 10 Jan 2023 16:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHRQ-0001C0-Lr; Tue, 10 Jan 2023 16:25:36 +0000
Received: by outflank-mailman (input) for mailman id 474806;
 Tue, 10 Jan 2023 16:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFHRO-0001Bu-KF
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 16:25:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 675bf3d7-9103-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 17:25:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id tz12so30093187ejc.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 08:25:32 -0800 (PST)
Received: from 2a02.2378.1019.479a.ip.kyivstar.net
 ([2a02:2378:1019:479a:6357:b59e:a085:4bb7])
 by smtp.gmail.com with ESMTPSA id
 gn19-20020a1709070d1300b00816edcb4e59sm5124252ejc.146.2023.01.10.08.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:25:31 -0800 (PST)
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
X-Inumbo-ID: 675bf3d7-9103-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlw7+zZsV9HauSQ/SQ7cPTLqSUwEPYqT2Dxcx8+og0U=;
        b=hb4Foy4vLmPXkGwIKWaQt/tC6ky+ux0Q1UhIGphk0mSolL2r/AzmOfmSfRJsyIcyfu
         XHuNLHUuUeu4PFdfQol+mSln9HSNpDJCquRVXeIDW+SIgElApSyT+IuL6p/E8TKm4I7S
         cYIGgaFN4+ILVIzHDs2NmhYXOyP1R2grnPgvZL5seSLfpaseqrT+jgER2Z/zCs9sUdXf
         NhaMuVZiXdAy2I+gm/vh1m0R1LioLiOCb9/HQ8l6/ZVhEZaHFQpM4+r++fhdOOy8x6pf
         7DooVt+qOxTN+KbWZ3MkhSAaIPQTJK3sNQ70kn8GHWb9bnEUJ3t17eNR4Cq7TrDqYrc5
         BpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlw7+zZsV9HauSQ/SQ7cPTLqSUwEPYqT2Dxcx8+og0U=;
        b=oWBVGhB8szmk1/PnwavCvR7jj2ZX2HOYNGsfBPMcxH+IA+2uwwwMZfblzLyM1eIhoB
         Mw3U9jWKGDi3DzKRG5RfWEArogjGl6y+WBwDR8I11EON5DCoQxVvBxqum758kTDX1AjI
         rWOkXQ8X85naU2kG4plmZrJ35Yn279o+v6JYjpEapsu4KWnerY39gf/5Ils0aoct7+4G
         iNKE5/Rzo3EFhL6HunKMO+2F5WJwVD39Zd0yArl+3Cva3p/yv8qITQGejiTtO0S8nGk3
         ZZxFbTFMqOmDZZ64FWZWSUKje1H1jS1gwVlLbAfhjwcNpLNxE2S7dqFTAvb8xHP8v57V
         2v7Q==
X-Gm-Message-State: AFqh2kp/s9u7ylFxkXeG/FFAhHc80ZczGuTSLEbdlsMFlv5fjHPHSTWd
	C1K90YsW9uQxgI3Pv5+Sat+oWnU2E3TjNQ==
X-Google-Smtp-Source: AMrXdXuyPgoH9gFzS8SK3KK4mYnl0Z/eZqsMjUP2WjuoFP+9PXyOZrzw8qmLceDgTUJyKQWVgFDdhQ==
X-Received: by 2002:a17:906:3084:b0:7c1:5ee1:4c57 with SMTP id 4-20020a170906308400b007c15ee14c57mr56274536ejv.8.1673367931694;
        Tue, 10 Jan 2023 08:25:31 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] automation: rename RISCV_64 container and jobs
Date: Tue, 10 Jan 2023 18:25:23 +0200
Message-Id: <cea2d287fd65033d8631bf9905ad00652bf11035.1673367923.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All RISCV_64-related stuff was renamed to be consistent with
ARM (arm32 is cross build as RISCV_64).

The patch is based on the following patch series:
[PATCH *] Basic early_printk and smoke test implementation

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 ...v64.dockerfile => current-riscv64.dockerfile} |  0
 automation/gitlab-ci/build.yaml                  | 16 ++++++++--------
 automation/gitlab-ci/test.yaml                   |  4 ++--
 automation/scripts/containerize                  |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)
 rename automation/build/archlinux/{riscv64.dockerfile => current-riscv64.dockerfile} (100%)

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/current-riscv64.dockerfile
similarity index 100%
rename from automation/build/archlinux/riscv64.dockerfile
rename to automation/build/archlinux/current-riscv64.dockerfile
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6784974619..7ccd153375 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -647,31 +647,31 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
 # RISC-V 64 cross-build
-riscv64-cross-gcc:
+archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
   variables:
-    CONTAINER: archlinux:riscv64
+    CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
 
-riscv64-cross-gcc-debug:
+archlinux-current-gcc-riscv64-debug:
   extends: .gcc-riscv64-cross-build-debug
   variables:
-    CONTAINER: archlinux:riscv64
+    CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
 
-riscv64-cross-gcc-randconfig:
+archlinux-current-gcc-riscv64-randconfig:
   extends: .gcc-riscv64-cross-build
   variables:
-    CONTAINER: archlinux:riscv64
+    CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
 
-riscv64-cross-gcc-debug-randconfig:
+archlinux-current-gcc-riscv64-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
   variables:
-    CONTAINER: archlinux:riscv64
+    CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 64f47a0ab9..4ca3e54862 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -57,7 +57,7 @@
 .qemu-riscv64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: archlinux:riscv64
+    CONTAINER: archlinux:current-riscv64
     LOGFILE: qemu-smoke-riscv64.log
   artifacts:
     paths:
@@ -252,7 +252,7 @@ qemu-smoke-riscv64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
   needs:
-    - riscv64-cross-gcc
+    - archlinux-current-gcc-riscv64
 
 # Yocto test jobs
 yocto-qemuarm64:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 0f4645c4cc..9e508918bf 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -27,7 +27,7 @@ case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
-    _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
+    _riscv64) CONTAINER="${BASE}/archlinux:current-riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _centos72) CONTAINER="${BASE}/centos:7.2" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
-- 
2.38.1


