Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9D654F91
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 12:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468890.728127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2h-000372-Cm; Fri, 23 Dec 2022 11:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468890.728127; Fri, 23 Dec 2022 11:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2h-00033k-8f; Fri, 23 Dec 2022 11:16:47 +0000
Received: by outflank-mailman (input) for mailman id 468890;
 Fri, 23 Dec 2022 11:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2p1Y=4V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1p8g2g-0001vi-BA
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 11:16:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48fdefe1-82b3-11ed-8fd4-01056ac49cbb;
 Fri, 23 Dec 2022 12:16:45 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so303838wmb.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Dec 2022 03:16:45 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm4015400wmb.28.2022.12.23.03.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 03:16:44 -0800 (PST)
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
X-Inumbo-ID: 48fdefe1-82b3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVyGLZWjJ9kbK2S5/NmxoXvE/MItjsZJIic+Vk1nkXc=;
        b=BYq17mjcOlyfPQg4benY4Uz7Kb1cvBW+qS541FQAZjzUk64U19IKpIZEUXkuZhav3x
         VZxxfRHDK6agxW3YiHCWbgasGQUbjI9IwfukBBF6BfCtARb/tTAwO2QCejyMpPb+UfwT
         bBQor/imfNBAYPVz0iGyW7PVPZTgfllbSsIWMn2hYwgzu1LQw0fUQv2/gRU5sy/LnDg1
         VcgbMB8oIWAkRF4ofE2NY+R7ic+T4VrW3zYimzF6OIqMacsyCAyr7ayz/LqvC1bWT2Wu
         qW+CeeKwkbwyyCHQxjA9dm3uI0/xom18MxsSRfp0LcIctbEcv7B+cmK4qZlGbLnUp1by
         tHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVyGLZWjJ9kbK2S5/NmxoXvE/MItjsZJIic+Vk1nkXc=;
        b=1rSfcBwbEO0U9sWg+eZdicmhKLYgbIkJW1Bn+REe6WPpv1Tqkpo30wJT+UQ5BBY0sc
         QlS2nO55HpG/cmgUh6g/WNqz1eKSujETeDXp1NjGW8skIu1tsZtKm9bvm99ibzuwqf69
         v6ocme9pp2upeYOcWeeISO68w6ozKMr9o3vLA2M026he5arnUeeMCn3rzZ1f4QVAgARP
         c4DHVxf3pXdHdeIEpM+6vnKh4SpxFDAUki6M/PBt6paE9CoJQ1YSIf0+B+TtJmtXM1IL
         Y59F+3s60rchI5Qo3IAkR9pufzkpl4NX1ID5eD4kBtB+mtrQHMcOeh89DvAD0Dlaj6Qg
         oJWw==
X-Gm-Message-State: AFqh2ko1m9rWT881hJUVusXWGTm5KP2MgwumuCuG7uHsuuluf9aqFULT
	OcW02vHhVTC5jmGJw0YuniPLW+Vkc0rdnTcZ
X-Google-Smtp-Source: AMrXdXtvhTIgBi0ObNo2e+NrFKzemWZGmn4EFBa4HZLVmgbpn8vnvHkFFkFWBmqS3zydtBfN/xQBAQ==
X-Received: by 2002:a05:600c:d1:b0:3d3:4d21:704d with SMTP id u17-20020a05600c00d100b003d34d21704dmr6827553wmm.14.1671794204919;
        Fri, 23 Dec 2022 03:16:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v1 4/4] automation: add RISC-V 64 cross-build tests for Xen
Date: Fri, 23 Dec 2022 13:16:23 +0200
Message-Id: <c16097445ce25700b3464d3813c7cbc69d998dd7.1671789736.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671789736.git.oleksii.kurochko@gmail.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add build jobs to cross-compile Xen-only for RISC-V 64.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/gitlab-ci/build.yaml | 43 +++++++++++++++++++++++++++++++++
 automation/scripts/build        |  4 +--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 93d9ff69a9..d97b2aa788 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -172,6 +172,33 @@
   variables:
     <<: *gcc
 
+.riscv64-cross-build-tmpl:
+  <<: *build
+  variables:
+    XEN_TARGET_ARCH: riscv64
+  tags:
+    - x86_64
+
+.riscv64-cross-build:
+  extends: .riscv64-cross-build-tmpl
+  variables:
+    debug: n
+
+.riscv64-cross-build-debug:
+  extends: .riscv64-cross-build-tmpl
+  variables:
+    debug: y
+
+.gcc-riscv64-cross-build:
+  extends: .riscv64-cross-build
+  variables:
+    <<: *gcc
+
+.gcc-riscv64-cross-build-debug:
+  extends: .riscv64-cross-build-debug
+  variables:
+    <<: *gcc
+
 # Jobs below this line
 
 archlinux-gcc:
@@ -615,6 +642,19 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
+# RISC-V 64 cross-build
+riscv64-cross-gcc:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: archlinux:riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+
+riscv64-cross-gcc-debug:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: archlinux:riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:
@@ -690,3 +730,6 @@ kernel-5.10.74-export:
       - binaries/bzImage
   tags:
     - x86_64
+
+# # RISC-V 64 test artificats
+# # TODO: add RISC-V 64 test artitifacts
diff --git a/automation/scripts/build b/automation/scripts/build
index 026f480e76..d0632a2bd5 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -34,8 +34,8 @@ fi
 # to exit early -- bash is invoked with -e.
 cp xen/.config xen-config
 
-# arm32 only cross-compiles the hypervisor
-if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
+# arm32 & riscv64 only cross-compiles the hypervisor
+if [[ "${XEN_TARGET_ARCH}" = "arm32" ]] || [[ "${XEN_TARGET_ARCH}" = "riscv64" ]]; then
     hypervisor_only="y"
 fi
 
-- 
2.38.1


