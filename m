Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20B777341E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579074.907019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9KJ-0007Vc-2g; Mon, 07 Aug 2023 23:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579074.907019; Mon, 07 Aug 2023 23:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9KI-0007Pb-M1; Mon, 07 Aug 2023 23:07:50 +0000
Received: by outflank-mailman (input) for mailman id 579074;
 Mon, 07 Aug 2023 23:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9IU-0001NS-Kk
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:58 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f66c3f2f-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:05:55 +0200 (CEST)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d593a63e249so512409276.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:55 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:54 -0700 (PDT)
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
X-Inumbo-ID: f66c3f2f-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449554; x=1692054354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6BZos7Ybf69Lr9ubs2a6Azcthgsxnr+LK2TqOKvMHI=;
        b=p8G6Pt9QZsVgDIw5B0YZsM1HO9y9fkrb/cw0HZOe9s94xOMFlEATGdftneo/KGkdaX
         TwSO+l67/znn0WvrOrRHHntMUuj9nNFXoTE85WKOjzGwb94eB3i84/XFPlTd02w2CLrJ
         DwESQ9jUYWS2DSwjhw7JNYWMJXOT94ZS609EVQWWoXQdRFNt0hhd7LN+kuo1QQmNKeS0
         XHBIPjPF8dy/T4snUiw6ibSJ1ZirvD/sPtDvke5ir6zweBiFnq3ooQs72HZNE6w+OGww
         eTDTJaym+WVQphZfxFF+BeQU7jP4VlgJoz6RKQntFEtdMFIN0fhGKatr4Jikr9avLVk6
         gEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449554; x=1692054354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6BZos7Ybf69Lr9ubs2a6Azcthgsxnr+LK2TqOKvMHI=;
        b=HYMxFa4XzXiGoku87OZZKfgD8cPbz85rg7H0WztUHJgSEh6zScWaDlVOC9NUoy5Oe4
         2YIU85YwXhBrN7VwS+ezXL8JdJRR+NRz5lwdTniSBLD9fn9GlCNyjdw1abHDXMe1VOpZ
         LONJuMxYGSIg4Zhx3m6t+jwzNmASdGCYfc50UA2DHOpKB0u7N/baAL87UGhqAtn/wmk7
         PtOj2PvaV2KtK3+RSjLDDMOHych/a/RNfxp4oa+9F9HgbwHKV1v3Do80oudE2Ty/WWFP
         VB7W0BySxAqBQA3hNg0BAeTOjHEt3rcnzNPyMZAe6UcyL4poV4dQ4OfXkvM2PsRpFceM
         AAhg==
X-Gm-Message-State: AOJu0YxRhjGkRc5ZnVp5j5waxYWmNwGKJAWDK8xMGF5xjMTGINGxgDDm
	9fsJrdX6f3V0qQ+1EV00AaY=
X-Google-Smtp-Source: AGHT+IHnEVFzuxaIlZevFxX1u5N6TSfYAnl0Ngd19zcPS1yyZn6+F2gzJTtnG1yf2qQFJp4HGPdIaw==
X-Received: by 2002:a25:aea5:0:b0:d0b:fe82:8b99 with SMTP id b37-20020a25aea5000000b00d0bfe828b99mr10007354ybj.44.1691449554679;
        Mon, 07 Aug 2023 16:05:54 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH mm-unstable v9 18/31] arm64: Convert various functions to use ptdescs
Date: Mon,  7 Aug 2023 16:05:00 -0700
Message-Id: <20230807230513.102486-19-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/arm64/include/asm/tlb.h | 14 ++++++++------
 arch/arm64/mm/mmu.c          |  7 ++++---
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index c995d1f4594f..2c29239d05c3 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -75,18 +75,20 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	pgtable_pte_page_dtor(pte);
-	tlb_remove_table(tlb, pte);
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	pagetable_pte_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 				  unsigned long addr)
 {
-	struct page *page = virt_to_page(pmdp);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pgtable_pmd_page_dtor(page);
-	tlb_remove_table(tlb, page);
+	pagetable_pmd_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
 
@@ -94,7 +96,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 				  unsigned long addr)
 {
-	tlb_remove_table(tlb, virt_to_page(pudp));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pudp));
 }
 #endif
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 95d360805f8a..47781bec6171 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -426,6 +426,7 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
 static phys_addr_t pgd_pgtable_alloc(int shift)
 {
 	phys_addr_t pa = __pgd_pgtable_alloc(shift);
+	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
 
 	/*
 	 * Call proper page table ctor in case later we need to
@@ -433,12 +434,12 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
 	 * this pre-allocated page table.
 	 *
 	 * We don't select ARCH_ENABLE_SPLIT_PMD_PTLOCK if pmd is
-	 * folded, and if so pgtable_pmd_page_ctor() becomes nop.
+	 * folded, and if so pagetable_pte_ctor() becomes nop.
 	 */
 	if (shift == PAGE_SHIFT)
-		BUG_ON(!pgtable_pte_page_ctor(phys_to_page(pa)));
+		BUG_ON(!pagetable_pte_ctor(ptdesc));
 	else if (shift == PMD_SHIFT)
-		BUG_ON(!pgtable_pmd_page_ctor(phys_to_page(pa)));
+		BUG_ON(!pagetable_pmd_ctor(ptdesc));
 
 	return pa;
 }
-- 
2.40.1


