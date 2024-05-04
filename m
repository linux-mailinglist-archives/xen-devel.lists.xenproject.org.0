Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C88C5C32
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721735.1125404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yat-0004nO-1t; Tue, 14 May 2024 20:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721735.1125404; Tue, 14 May 2024 20:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yas-0004ie-TS; Tue, 14 May 2024 20:17:50 +0000
Received: by outflank-mailman (input) for mailman id 721735;
 Tue, 14 May 2024 20:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yar-0002pc-MN
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:49 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08a85208-122f-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 22:17:49 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-351ae94323aso2848538f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:49 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbc56b7sm14402146f8f.114.2024.05.14.13.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:47 -0700 (PDT)
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
X-Inumbo-ID: 08a85208-122f-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717868; x=1716322668; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6nqh6fc2e8at7xBm6/0+3HSkQQZqnB7HPpzJ3rGv88=;
        b=igu+TTA351Gf6tHAdpHS/PegK1OViJ4NGxAzPqJBbMYgByE758pwNRc7tE0gPXUEWf
         Q5tO0511s8KcR0y4PS4wv6d5p6b/LuG9lKRhKc+8x0agV+jG/OGPHih5aa85mpMeKPS+
         OGntoqb23pEXnfHB/fJmBdAsQrbR6otM/A4nAFhVJYCbRte0Ax+bLd1i8qe0BaCXv0TC
         Dubl+1ABy3L7FODWdBFvsRWcqC3LEebpWPz3cxioS485d/vCuUYkfhM5oF/2a0piidDw
         BLgVy4iulo2I2nMd3ygyf9VwlSPe/oBWvAn8F2a4ihLew6Hv2jiSVv1cHRZfHei55cEk
         qQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717868; x=1716322668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6nqh6fc2e8at7xBm6/0+3HSkQQZqnB7HPpzJ3rGv88=;
        b=q/Mx6Yj9gBCLd9nVUumilm5GWMCW3gUb5WbsYJ969Gu2xsNiSjK1XD04l2bERxWbmz
         tt1R8UXkWXUAKbsjzMHibLPlKVXfD8lXtNm4tXPvjAG7axku+WoPaaf2Lay//i1/SnrE
         iSgRmCcC3zPv9GtlCN2ObpwAmRXUnE4RLiSJVEhcttiXbzAdW07OFbx6rCNbQfglvE/Q
         LhYRFu3JomLgTZ6VnGHnfxBjoBj5RQg48uutjGA2KKtPsEttbEbMROOky/aEEZAWt4o+
         xO9rcfPloh8xi93d6fAHeRvq25Yxp1QvRbRC41sw52QmI+Nx8ifb5rf9+QjUuYNlzFvA
         YTTA==
X-Gm-Message-State: AOJu0YxXlZKoNycCUnmXLqiu0i70I4IbQomGIhgFy066GJQInbxOoVq6
	+MlNqWilUBMYH0Se3FdhlfpxqD/im39K+TlI0Gud7vEykclaGrankEqR4QPH1GM=
X-Google-Smtp-Source: AGHT+IHdh4XOg68Cp20JCc05AVisIn5+J16veP2rN6473ADgexjnvxIX4EWyaFtMQdkflILXmib/Zg==
X-Received: by 2002:adf:f10e:0:b0:350:484f:fe1a with SMTP id ffacd0b85a97d-3504a61c512mr10328931f8f.11.1715717867981;
        Tue, 14 May 2024 13:17:47 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 7/9] xen/arm64: mmu/head: Add missing code symbol annotations
Date: Sat,  4 May 2024 13:55:12 +0200
Message-Id: <20240504115514.1063509-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/mmu/head.S | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index fa40b696dd..665a51a337 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -138,7 +138,7 @@
  *
  * Clobbers x0 - x4
  */
-create_page_tables:
+FUNC_LOCAL(create_page_tables)
         /* Prepare the page-tables for mapping Xen */
         ldr   x0, =XEN_VIRT_START
         create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
@@ -260,7 +260,7 @@ virtphys_clash:
         /* Identity map clashes with boot_third, which we cannot handle yet */
         PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
         b     fail
-ENDPROC(create_page_tables)
+END(create_page_tables)
 
 /*
  * Turn on the Data Cache and the MMU. The function will return on the 1:1
@@ -273,7 +273,7 @@ ENDPROC(create_page_tables)
  *
  * Clobbers x0 - x5
  */
-enable_mmu:
+FUNC_LOCAL(enable_mmu)
         mov   x4, x0
         mov   x5, x1
         PRINT_ID("- Turning on paging -\r\n")
@@ -304,7 +304,7 @@ enable_mmu:
         PRINT_ID("- Paging turned on -\r\n")
 
         ret
-ENDPROC(enable_mmu)
+END(enable_mmu)
 
 /*
  * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
@@ -316,7 +316,7 @@ ENDPROC(enable_mmu)
  *
  * Clobbers x0 - x6
  */
-ENTRY(enable_secondary_cpu_mm)
+FUNC(enable_secondary_cpu_mm)
         mov   x6, lr
 
         load_paddr x0, init_ttbr
@@ -328,7 +328,7 @@ ENTRY(enable_secondary_cpu_mm)
 
         /* Return to the virtual address requested by the caller. */
         ret
-ENDPROC(enable_secondary_cpu_mm)
+END(enable_secondary_cpu_mm)
 
 /*
  * Enable mm (turn on the data cache and the MMU) for the boot CPU.
@@ -340,7 +340,7 @@ ENDPROC(enable_secondary_cpu_mm)
  *
  * Clobbers x0 - x6
  */
-ENTRY(enable_boot_cpu_mm)
+FUNC(enable_boot_cpu_mm)
         mov   x6, lr
 
         bl    create_page_tables
@@ -365,7 +365,7 @@ ENTRY(enable_boot_cpu_mm)
          * by the caller.
          */
         b     remove_identity_mapping
-ENDPROC(enable_boot_cpu_mm)
+END(enable_boot_cpu_mm)
 
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
@@ -377,7 +377,7 @@ ENDPROC(enable_boot_cpu_mm)
  *
  * Clobbers x0 - x1
  */
-remove_identity_mapping:
+FUNC_LOCAL(remove_identity_mapping)
         /*
          * Find the zeroeth slot used. Remove the entry from zeroeth
          * table if the slot is not XEN_ZEROETH_SLOT.
@@ -419,20 +419,21 @@ identity_mapping_removed:
         flush_xen_tlb_local
 
         ret
-ENDPROC(remove_identity_mapping)
+END(remove_identity_mapping)
 
 /* Fail-stop */
-fail:   PRINT("- Boot failed -\r\n")
+FUNC_LOCAL(fail)
+        PRINT("- Boot failed -\r\n")
 1:      wfe
         b     1b
-ENDPROC(fail)
+END(fail)
 
 /*
  * Switch TTBR
  *
  * x0    ttbr
  */
-ENTRY(switch_ttbr_id)
+FUNC(switch_ttbr_id)
         /* 1) Ensure any previous read/write have completed */
         dsb    ish
         isb
@@ -464,7 +465,7 @@ ENTRY(switch_ttbr_id)
         isb
 
         ret
-ENDPROC(switch_ttbr_id)
+END(switch_ttbr_id)
 
 /*
  * Local variables:
-- 
2.40.1


