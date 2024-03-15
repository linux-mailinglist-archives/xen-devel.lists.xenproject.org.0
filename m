Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E4D87D33D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693988.1082699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwn-0006CI-Vw; Fri, 15 Mar 2024 18:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693988.1082699; Fri, 15 Mar 2024 18:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwn-00068K-Q3; Fri, 15 Mar 2024 18:06:25 +0000
Received: by outflank-mailman (input) for mailman id 693988;
 Fri, 15 Mar 2024 18:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwm-0005yV-Nz
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:24 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baa43a90-e2f6-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 19:06:22 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so28945411fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:22 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:20 -0700 (PDT)
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
X-Inumbo-ID: baa43a90-e2f6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525980; x=1711130780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnZCS2jkOQG1OwG5+NnDvOYWHQ+YyiN+63x/P+hS844=;
        b=CkqH++FjYYpEW1Pu7IAlD3oX9jh7rYJoI6qwTDFCDABGF6/1i9/7uo+jhJmE1QczsK
         TdJ8gBNBSU5/cbWDYT+/IHgpUxDWhomcNrbGGYPLBOancy10gFvw/xZHgCosRRFqFXOu
         SnRWUuxIbZ3KO4F6VEbacPYmlmbsWl/T1S9Thal99gri8FQP5HNl49gvX581WGi212OD
         LlAQM4wiNLQhXSVJpF8VAhYGzWVk/c68VbbGmIXPLGmJRgQBfCEFbGaoKYtt8562gfZP
         P+q7h2mYs/a9wkvy6HQbqpLX1bjV8iENyHSOqvi3NA57TwfjaplpObI9/KMxeC8yDuuH
         77Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525980; x=1711130780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnZCS2jkOQG1OwG5+NnDvOYWHQ+YyiN+63x/P+hS844=;
        b=JcjpHj6KGG2HoGslKj2OCky/nnkdz9caWuuEq1GdnND5tTme39n3urh9bp4TuF2MM8
         qtvsFtCLhEamCbd5kAjjhQUfgfewo5mDAUxjvk4mg+i3DAnrKt7YCPwoTx1AHQvYO/sx
         BV/pptfRTkLEeJJIhEwYxrDnIS1VNY/agXZKYzsoXtvJpg3FKRO2/lEHwN9nBlJCp/p+
         HAf60s2wWZ8JOUasTj3F89xtEgfaWD1Yx7WKrPoptKUIA/vmABsk+Z4ckQyKPB3txjDK
         DgzCh0qUctzwTEX3plq+a8TzoEwDWbFmZrI4xgpkQQtvNre1234Kbjfv/OmPpglVye31
         gYjQ==
X-Gm-Message-State: AOJu0Yxz/BEBUXJwJkiuNODgXh2QTOWDZMttjXK6VRgqEABGFB4d5fci
	4rpKdUVfpAmj42nK2NiaMKyxYC7br280AJNQ8yjoKXVtvF7+wj2LC9VjXqOcXNw=
X-Google-Smtp-Source: AGHT+IE7CXomGSgKuwJJpH8tAd57HXXdUUH5gqwKlDD0cS04ArIqQSpMGEqHTi7M7Y1tC2d2O80frw==
X-Received: by 2002:a2e:8011:0:b0:2d4:6910:2ee5 with SMTP id j17-20020a2e8011000000b002d469102ee5mr2530317ljg.8.1710525980466;
        Fri, 15 Mar 2024 11:06:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v6 01/20] automation: introduce fixed randconfig for RISC-V
Date: Fri, 15 Mar 2024 19:05:57 +0100
Message-ID: <d0812213d126ade5f99aec32802941f1b153fc31.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the anchor riscv-fixed-randconfig,
which includes all configurations that should be disabled for
randconfig builds.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in V6:
 - new patch for this patch series
 - Reviewed-by and Acked-by was added. ( in another patch series they were
   recieved. )
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


