Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3451028E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 18:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314040.531915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNhZ-0007dz-Ig; Tue, 26 Apr 2022 16:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314040.531915; Tue, 26 Apr 2022 16:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNhZ-0007aj-FC; Tue, 26 Apr 2022 16:06:09 +0000
Received: by outflank-mailman (input) for mailman id 314040;
 Tue, 26 Apr 2022 16:06:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOtE=VE=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1njNhY-0007ad-3d
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 16:06:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4b1748d-c57a-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 18:06:02 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 u9-20020a05600c00c900b00393e729e655so1897782wmm.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 09:06:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a7bc08a000000b0039049f8b3f9sm11378886wmh.27.2022.04.26.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:05:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 150621FFB7;
 Tue, 26 Apr 2022 17:05:59 +0100 (BST)
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
X-Inumbo-ID: c4b1748d-c57a-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hh56RWc6gtXA2z6EUyK7Tz0GoSjRWtZffKf8c4j7OtA=;
        b=zXfKHGVCeCGOr1jTvH9lgimkEkGlncrojjkrWGXtbijpA1UCpw9CnlLpqHlxBaW7Wk
         5PtvmkDz4dJekc/HCHkMywb8e2mNKBuFx4XjjQokmq9iGbz5R2asZsHS+ycVJabIXL0m
         ezHXhG0I2BsEmKAuFI9Q+qwjTwWQ+9JmyM8NExFCN8EYgQvdpvVZSJ9atdD6rfkAUtBL
         q11A6KB0Sy59ImliEskLR3BW3GG54VI0itO5eJA1CjyIYQz355t5UADul81zeaf2pJhU
         BsQ4eluDfIGTz01OZwxX0ZtMDXU3QhQI1qfnOU5fvMj+IGDsXjq/nWD16XruGC8CMGjF
         L9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hh56RWc6gtXA2z6EUyK7Tz0GoSjRWtZffKf8c4j7OtA=;
        b=MAYLLuFuO6jj/5MZqtd4+Pbeokq25vwKtTyheLkydf7jJcIaNGzGB/kd4a/79tmucG
         7hiZ2C4+g7G8B/jBxY/AEajAAXbVYbtDmJJ5KzfH1IEqA/Cs+ahNajkknln1RWO0FP4D
         lMNPCc9rv6Om+ntFU8odlBDEzhUBEdEh72895Gtck51tWm7c1TvrhVxeOkMq/sb5MsE+
         JSMwp2TH2HqZ2iQAEGUyIJZYzx4ppXBE/WoL5t0kTXdCDNlpqVlGU383BcoGU5TQuPQY
         Dlw0pfl1jipAc3OTIWR60aUpvqj0Xj77D5P91eS0AVBaHJzHhJK5et3aIRn2vdjIZsVc
         7LIw==
X-Gm-Message-State: AOAM532+ziBn77AmQpAzif8rVRo06XYdVq3dEcXhhb7+B6vgcXrdL3xI
	pn91787C3QL0Z6HJvQrtZ/0nZg==
X-Google-Smtp-Source: ABdhPJxuOifDtw16drRhavIhgXI9N5/w9xRdfPjmcPMaJpX8kFneUoW/8IpdgEIaeuYoPOlVqR5TRg==
X-Received: by 2002:a05:600c:4808:b0:393:fbd3:f1fa with SMTP id i8-20020a05600c480800b00393fbd3f1famr2233860wmo.100.1650989161449;
        Tue, 26 Apr 2022 09:06:01 -0700 (PDT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC PATCH] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
Date: Tue, 26 Apr 2022 17:05:48 +0100
Message-Id: <20220426160548.2020794-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When we introduced FEAT_LPA to QEMU's -cpu max we discovered older
kernels had a bug where the physical address was copied directly from
ID_AA64MMFR0_EL1.PARange field. The early cpu_init code of Xen commits
the same error by blindly copying across the max supported range.

Unsurprisingly when the page tables aren't set up for these greater
ranges hilarity ensues and the hypervisor crashes fairly early on in
the boot-up sequence. This happens when we write to the control
register in enable_mmu().

Attempt to fix this the same way as the Linux kernel does by gating
PARange to the maximum the hypervisor can handle. I also had to fix up
code in p2m which panics when it sees an "invalid" entry in PARange.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/arm64/head.S | 6 ++++++
 xen/arch/arm/p2m.c        | 9 ++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index aa1f88c764..057dd5d925 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -473,6 +473,12 @@ cpu_init:
         ldr   x0, =(TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(64-48))
         /* ID_AA64MMFR0_EL1[3:0] (PARange) corresponds to TCR_EL2[18:16] (PS) */
         mrs   x1, ID_AA64MMFR0_EL1
+        /* Limit to 48 bits, 256TB PA range (#5) */
+        ubfm  x1, x1, #0, #3
+        mov   x2, #5
+        cmp   x1, x2
+        csel  x1, x1, x2, lt
+
         bfi   x0, x1, #16, #3
 
         msr   tcr_el2, x0
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb71fa4c1c..e5a88095f8 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2030,7 +2030,7 @@ void __init setup_virt_paging(void)
         unsigned int root_order; /* Page order of the root of the p2m */
         unsigned int sl0;    /* Desired SL0, maximum in comment */
     } pa_range_info[] = {
-        /* T0SZ minimum and SL0 maximum from ARM DDI 0487A.b Table D4-5 */
+        /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
         [0] = { 32,      32/*32*/,  0,          1 },
         [1] = { 36,      28/*28*/,  0,          1 },
@@ -2038,7 +2038,7 @@ void __init setup_virt_paging(void)
         [3] = { 42,      22/*22*/,  3,          1 },
         [4] = { 44,      20/*20*/,  0,          2 },
         [5] = { 48,      16/*16*/,  0,          2 },
-        [6] = { 0 }, /* Invalid */
+        [6] = { 52,      12/*12*/,  3,          3 },
         [7] = { 0 }  /* Invalid */
     };
 
@@ -2069,10 +2069,13 @@ void __init setup_virt_paging(void)
         }
     }
 
-    /* pa_range is 4 bits, but the defined encodings are only 3 bits */
+    /* pa_range is 4 bits but we don't support all modes */
     if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
         panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
 
+    if ( pa_range > 5 )
+        pa_range = 5;
+
     val |= VTCR_PS(pa_range);
     val |= VTCR_TG0_4K;
 
-- 
2.30.2


