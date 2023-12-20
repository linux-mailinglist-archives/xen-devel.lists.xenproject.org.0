Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC5281A0BD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657915.1027018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFa-00053a-Bo; Wed, 20 Dec 2023 14:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657915.1027018; Wed, 20 Dec 2023 14:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFa-0004uT-8D; Wed, 20 Dec 2023 14:08:42 +0000
Received: by outflank-mailman (input) for mailman id 657915;
 Wed, 20 Dec 2023 14:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFZ-0004kf-6P
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:41 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 461b5e48-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:39 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cc3f5e7451so68861941fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:39 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:36 -0800 (PST)
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
X-Inumbo-ID: 461b5e48-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081318; x=1703686118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbOdTmbCCEcvxPnbxe8rBqPtsYTBci17wzfXbyUXaIQ=;
        b=QysgtT4Ae57tHcC/OiLeVvkK3W2mzzuvnPqai1lJ0y1JPVuRQwJ1XBEsXX3QiF9IVK
         soThG7LUSkgyI97Fxua2qzaWtSHt1EQCTuLEWH/U1EoHQJt7gDYu1zx3UEd6fbnTsyZu
         nHbesKWrAn1kRPFrMuFEMArWfTBnorSeQkoo0CpM8hkCkgj77BFEji+1lz4RtTJzpqT+
         dooKKUYNi/QDA7jEhRf5iZ2vSOCxl1t//y/2EykTp7sHsQtL3HBWPZeUQWSdt6Ag6Zr4
         NhWx4vD7Acy7iFpJ73n0t4otDkbwAT7xy+wy5cdjebWIXWFL7XSLlb9cpMma1+rkmUJt
         sS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081318; x=1703686118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbOdTmbCCEcvxPnbxe8rBqPtsYTBci17wzfXbyUXaIQ=;
        b=XOSRsGsUmrzkjo/G/GJ3bDVuBGUkgnuZMxPNTwV1x//e+na2KI962v2eGrBzXEvhnC
         tsWcU6LnG12PMxvruWzc7i/4WRr5Y5+/VPv3HB/u+3WrHq7q7g0tK6kxhmqcNZbAJduL
         Bg+4Ft42lC8ApdLw9d+trT87ZN/Sm0mHHi4zKARf6lQNAKq4Nxe261H58thWMcACwJBT
         BaWw0BXqdMOH9VJdpZuPZuGgC7DB0OdzM0NfyLA6P4azP3Itm38VEFI74T9aN03+AVYc
         h+0/5Pyu1IZN8OfH77pxOLyBeJaWXARog3JJQ/h30NSXqR5lv89ZIsuiFlCJ6hU+0vDL
         yjkw==
X-Gm-Message-State: AOJu0YyQJv86DnD14kyX1rwaEm8k2wTRdXeFXBEPHGtqmjGOidfsUsa2
	TexOIDRFvzV1ZXn2MyWdEc/i20zbxW7ENA==
X-Google-Smtp-Source: AGHT+IE2N6rkvzCeAgJXFcDfWuLf8mZGnEZo88+ZBSSqUXhFXDmgFImm23TXiOTZuEiNyLbK8uEgKg==
X-Received: by 2002:a2e:8611:0:b0:2cc:70e8:bd6a with SMTP id a17-20020a2e8611000000b002cc70e8bd6amr2781632lji.83.1703081318050;
        Wed, 20 Dec 2023 06:08:38 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 2/9] automation: introduce fixed randconfig for RISC-V
Date: Wed, 20 Dec 2023 16:08:24 +0200
Message-ID: <db2c3d36b25b686bf07ac23f8ee8c879e0e9e81d.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the file riscv-fixed-randconfig.yaml,
which includes all configurations that should be disabled for
randconfig builds.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - The patch was introduced in this version of patch series.
---
 automation/gitlab-ci/build.yaml                  | 8 ++++----
 automation/gitlab-ci/riscv-fixed-randconfig.yaml | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)
 create mode 100644 automation/gitlab-ci/riscv-fixed-randconfig.yaml

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30cced..38cd93c306 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -516,6 +516,8 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
 # RISC-V 64 cross-build
+include: 'automation/gitlab-ci/riscv-fixed-randconfig.yaml'
+
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
   variables:
@@ -536,8 +538,7 @@ archlinux-current-gcc-riscv64-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig, variables, EXTRA_FIXED_RANDCONFIG]
 
 archlinux-current-gcc-riscv64-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
@@ -545,8 +546,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig, variables, EXTRA_FIXED_RANDCONFIG]
 
 # Power cross-build
 debian-bullseye-gcc-ppc64le:
diff --git a/automation/gitlab-ci/riscv-fixed-randconfig.yaml b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
new file mode 100644
index 0000000000..f1282b40c9
--- /dev/null
+++ b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
@@ -0,0 +1,7 @@
+.riscv-fixed-randconfig:
+  variables:
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
+      CONFIG_EXPERT=y
+      CONFIG_GRANT_TABLE=n
+      CONFIG_MEM_ACCESS=n
-- 
2.43.0


