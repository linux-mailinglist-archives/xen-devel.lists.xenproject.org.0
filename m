Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42867857CD2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682187.1061279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV2-0006yA-N3; Fri, 16 Feb 2024 12:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682187.1061279; Fri, 16 Feb 2024 12:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV2-0006qU-Jx; Fri, 16 Feb 2024 12:39:28 +0000
Received: by outflank-mailman (input) for mailman id 682187;
 Fri, 16 Feb 2024 12:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV2-0006oP-40
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:28 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b26746a-ccc8-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 13:39:26 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3d159220c7so98507866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:24 -0800 (PST)
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
X-Inumbo-ID: 6b26746a-ccc8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087164; x=1708691964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2suBialpU5BjJzL1fdKyYOY1IMWl7vfTqJIHrpvRUSg=;
        b=kywOSd+l4VGNdqU+kApN/F421auBEquX1WyElNedeKBax9VippHO0XkPqQeSDc/nOa
         AoasIQxYca6GmAqgoHS8IIxwYPhePbpyDstrxQ9rUPMx05STAFrzCDc7rnYouIpkDpI9
         sqaSC3iJXZatqeYGtOgkD+NCB5pweAtpy9872iz6uEo8xPqO1ajGJlYIZIj7pN7/n3F7
         qgJTbspeVi5jct3Rf4Hk0/G0GrHPsgR/fyjS02QiUXMAb74L2gyzUBmFEzgfAqCiBk9c
         umbUmVh8rg4ywEoz+7+GPbzhZoOyu+ekSbP11V5S6kapj0IrOzwfru5F0/8jCD3M6FrT
         cEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087164; x=1708691964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2suBialpU5BjJzL1fdKyYOY1IMWl7vfTqJIHrpvRUSg=;
        b=LXdJcDOQntXxfcQsg/V1qhhNlXZI+udy0CdsuAECO2MsrbNfmpLQa1fyRp2ZK4VegZ
         cIevqZrZeYYw3r23l4/GwtN0wRVHGWGCpR7ukEzX78sjnnxgXELZT+3WlXYotajACyQO
         d9BNvJz+IQZipucKu2xjS68KXJlIZzsUM/kl4TG7RQT/u+IEHW1ZdzdFQ8PfJacwJb92
         chjLOvvWOjM4cTjTwBIcikGI3LG2VnsmhCLikOJrYqA3RUrrS0t7Ke+wXMUgun1Wv9t+
         exEWrmEgUSYwiRmGaol16VuQbmvTGQh0Z/XAxyGouzXGTxuMhA3kzLJXYoqWubWfuVAw
         rJGA==
X-Gm-Message-State: AOJu0YxMOYsB5dMCcLZoTNeiDOE89ZLmEKoM05qq7C6TD+rCehq1hGEj
	zpskEcB6rvdqpSTz+QqPwRwciOjogSHs7cKk/Hs71QPcK1XQwZamOnbFooZj
X-Google-Smtp-Source: AGHT+IF+gJdo062UNYdwzzpd3f0cRJp8HoZz6cESOee4FvYvkdZq8KaInyjt7Ehjy6GZCWBEY2tQ+g==
X-Received: by 2002:a17:906:3e09:b0:a3d:1cdf:19eb with SMTP id k9-20020a1709063e0900b00a3d1cdf19ebmr3361862eji.11.1708087164440;
        Fri, 16 Feb 2024 04:39:24 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v9 1/7] automation: introduce fixed randconfig for RISC-V
Date: Fri, 16 Feb 2024 13:39:13 +0100
Message-ID: <d8e330c26394d9415a0d76b2d951bf57b0b6dd4b.1708086092.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708086091.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the anchor riscv-fixed-randconfig,
which includes all configurations that should be disabled for
randconfig builds.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
The patch were introduced after discussion in a topic:
 https://lore.kernel.org/xen-devel/cover.1701966261.git.oleksii.kurochko@gmail.com/
---
Changes in V9:
 - add '|' symbol after EXTRA_FIXED_RANDCONFIG to make variables in EXTRA_FIXED_RANDCONFIG
   be separated by new line.
 - instead of introduction of new file for riscv-fixed-randconfig, introduce an anchor
   inside build.yaml
---
Changes in V8:
 - Nothing changed. Only rebase
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - The patch was introduced in this version of patch series.
---
 automation/gitlab-ci/build.yaml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6d2cb18b88..aac29ee13a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -512,6 +512,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
 # RISC-V 64 cross-build
+.riscv-fixed-randconfig:
+  variables: &riscv-fixed-randconfig
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_COVERAGE=n
+      CONFIG_EXPERT=y
+      CONFIG_GRANT_TABLE=n
+      CONFIG_MEM_ACCESS=n
+
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
   variables:
@@ -532,8 +540,7 @@ archlinux-current-gcc-riscv64-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    <<: *riscv-fixed-randconfig
 
 archlinux-current-gcc-riscv64-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
@@ -541,8 +548,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    <<: *riscv-fixed-randconfig
 
 # Power cross-build
 debian-bullseye-gcc-ppc64le:
-- 
2.43.0


