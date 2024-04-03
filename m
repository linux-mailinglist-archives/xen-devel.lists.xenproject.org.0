Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0CC896BFD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700393.1093461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjC-0007iS-U5; Wed, 03 Apr 2024 10:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700393.1093461; Wed, 03 Apr 2024 10:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjC-0007f4-NW; Wed, 03 Apr 2024 10:20:22 +0000
Received: by outflank-mailman (input) for mailman id 700393;
 Wed, 03 Apr 2024 10:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjA-0007Ob-JX
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:20 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4b2d085-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:17 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso10560086e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:17 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:16 -0700 (PDT)
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
X-Inumbo-ID: c4b2d085-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139616; x=1712744416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH6TUwBLuOJHUIi6nrJkkEdBWNueDnvGpQKaWKuDLWo=;
        b=PO2feGd+c/P+KCeYSh8BVczfB7fdsq7021/6dV0TASQSZQNCZGbdaqnkGoEbug0FVa
         6h5ISKU5QjlR66NdhKneYolTqL7p7lUtbTuB+syiw9Jl7rbC1Wbf6pVZI5qyoa//DCHt
         sKVVI9XWbYJyXb2Tno1GrdZJZR/gL+WBWEwwid1xxMRgI9Is06BoJ+1qAeO8Z2jD8CCd
         yrmBAwqVI7hRpKoXFbVey7dZ4CEdzHbH0K3PwdipCVbmjWesGFqemEfyivkNi+kN6D2x
         2bzKXlDqinPH2eXlubx+vQgzlg0RuYqbbws2LYi/x/FZWs9pRDGcpf+Lhca/lCxfYszZ
         9iBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139616; x=1712744416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH6TUwBLuOJHUIi6nrJkkEdBWNueDnvGpQKaWKuDLWo=;
        b=ZauYBEB/gy4P4XcBJMP4zxZu6w3rq5X70ZXO66iOegfvynC3jz6gKoovwlQXW8qTIV
         n6n8091tZYOTMH6GWf/wyDonx/MQNXJCKEFalmTu7e1ssGZ7ClRjX3zZK6ARwU4JfzGP
         wxG2jnypSJqyW3NKzp/z2tvG/9dVzX9E/rqBHBn0X8kv+/Gs0tEac5T5HyAXgYyz06s+
         JLXKkSxXiKRix3XvOXm2oRRq/s7A3GHkLlZM9V33uce1pbGQM5dE7o/JjkEMXLNb3jIN
         5id2aUahtx8t52Gln6NEk3zgXfnmGNFvD/iZ/CSp7qnPBCRl6sR6Kr7D5jmuzHoYagIA
         6n1w==
X-Gm-Message-State: AOJu0Yz6TtXudfjsb7rOAPnSutS72gWQbfzUhdJfwDCxQ0rb/eLfOqc5
	rM+0bp0H9bOtgJ3GdjMGprozwBS+Zj5yv2ewubdQhcn1DumhnDoRFE4EGYJi
X-Google-Smtp-Source: AGHT+IGfnu6RXTh9RU7pq02Wr+aTLHeN63ufncsL4yPYbREHH6AmANJPT11YZUcPTVHUXvFwzskKKg==
X-Received: by 2002:a05:6512:1287:b0:516:be9d:11ac with SMTP id u7-20020a056512128700b00516be9d11acmr1645286lfs.13.1712139616428;
        Wed, 03 Apr 2024 03:20:16 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v7 01/19] automation: introduce fixed randconfig for RISC-V
Date: Wed,  3 Apr 2024 12:19:54 +0200
Message-ID: <6e604205e4b815f4f66574d9680f5effb86fa673.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
 - Nothing changed. Only rebase.
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


