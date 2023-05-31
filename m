Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B20718D51
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542059.845575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVl-0007n5-82; Wed, 31 May 2023 21:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542059.845575; Wed, 31 May 2023 21:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVk-0007fi-Pr; Wed, 31 May 2023 21:37:40 +0000
Received: by outflank-mailman (input) for mailman id 542059;
 Wed, 31 May 2023 21:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQA-0006xu-Il
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:54 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e734bc5-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:51 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-565c7399afaso817727b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:51 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:50 -0700 (PDT)
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
X-Inumbo-ID: 8e734bc5-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568711; x=1688160711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsW7mi3+X2fEN/3x0Bi+dafPb2wVjOjUR4AWbTKXMQ0=;
        b=Tua91nOZKux2LUG/1azHCwE0BQP0Ldt/fQcFBTr5Gs9SOVOAK3kiOZTEPbQOZmmRiy
         L/C7DDzaEAD4TJ/PsqDB9bGQgfNVr/qmpDxDu1T3P6Y99drNSm3ToAIDJ8f5x/21uNZG
         pUUOD8Jgv7j2nU4xiGagK626SEPu0aHoPwTImFxvzDIuYjYtXajoHjgtFk6Zd3V/pyaG
         gLJRnJdAK4YFiObBQEli6ODKvc3njLqcTrHFtBx9NqeTVuEeD5M63vdNUsRurBLkb0LY
         QIMgkM/02UNDYBO6osQY211nPQYZamIZAFPQkpE3fQYXReywR2/8RCOtWf6rdMhBO40D
         9r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568711; x=1688160711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsW7mi3+X2fEN/3x0Bi+dafPb2wVjOjUR4AWbTKXMQ0=;
        b=ODO2zhFbtPlyaZn8bevFCZnwYiQtvMFDedJikgjoaEyQQWYkDBLxZ1/aqUbEKiBV67
         GG6jTKM9NL4YnGXT3h6rDLjRM2PC3lWHw3CCUVxdlZTkRYX5ESwTgqCpaP2LOCSFOK6k
         cnbEwAC/lY2aXk8NvY4o4PfzqUqGu1zTQeNeueTVeGMfMpCxZ7haClVEXNpfkuHO9SI4
         XQDPPq/QrNAOsbJ/WnKlGArzedJ0Ze98XkL5ObXsa+j1uA0ARfSbE+Wda18tC62ZCoGA
         3zSSkQA60xBdhnOuaRO11t5rGnwIneNgBi0CxOrZT7LOhDhs74og62Ym8PqG/T/Nha9B
         hUdw==
X-Gm-Message-State: AC+VfDyktwG2MnV2IZFDi/uplh5PTK4DCmmkp2TAqIEzn66UtPRYLnY7
	m+rcpFMSKWTbMQLRXV1/d/A=
X-Google-Smtp-Source: ACHHUZ4VOBb0iwQHMeqwI/gDAzuoarhqz29K6pjaMDJD1aWt+PGt8CSoTG+XJl4l0eUyTigEUM/N5g==
X-Received: by 2002:a0d:dc83:0:b0:567:c388:3552 with SMTP id f125-20020a0ddc83000000b00567c3883552mr7998210ywe.6.1685568710976;
        Wed, 31 May 2023 14:31:50 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 21/34] arm64: Convert various functions to use ptdescs
Date: Wed, 31 May 2023 14:30:19 -0700
Message-Id: <20230531213032.25338-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

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
index af6bc8403ee4..5867a0e917b9 100644
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


