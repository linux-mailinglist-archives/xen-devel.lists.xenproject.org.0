Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBEE72D231
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547542.855100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onC-0000rj-RC; Mon, 12 Jun 2023 21:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547542.855100; Mon, 12 Jun 2023 21:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onC-0000ew-2x; Mon, 12 Jun 2023 21:09:38 +0000
Received: by outflank-mailman (input) for mailman id 547542;
 Mon, 12 Jun 2023 21:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojK-0007V0-HJ
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:38 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e11834df-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:37 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-56cf32f5bf8so28091387b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:37 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:36 -0700 (PDT)
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
X-Inumbo-ID: e11834df-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603937; x=1689195937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YznDncwA9GAqykzg54RX0MBNzB2zliFPfcggpr0Eh4s=;
        b=QRoyvLYEgxL/2kCjPdtGz5QAOI77H8loVEKJnu5DXjBhTeuZzXSW3sH87LjUK8GXq+
         Ni0/ms01raOgbTyNhkKSK5xptFnCpOw51bCuMschp5irMPmkXquXQTS+FYmXtEVbn5yM
         l55Cew9WZd/PGf5LMSokC+rcq8ZKIRncx7ECXqQGG+tKKnAOMwOtO9dyfKSmSCaex2iX
         2NivJzP5rq2hVV/YjxU2wV6J9nj+kvJCVEu9BAqcy2HzczmnbJeIkP/KaaT6YTF9TAWb
         AjjacshjGjPtqwSZWAawzFFfrAAsEWLFLRmKLAa65IfKQVb6IUHRo6JGUNBf25tg/BiS
         TUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603937; x=1689195937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YznDncwA9GAqykzg54RX0MBNzB2zliFPfcggpr0Eh4s=;
        b=ez8yxQY/RO/5pKG/Dj0au89unuz+t7BnfHXl8DoKRnb+H7aBschtJsWecEvWG7wcmO
         Tc6QQXz9pe+NyqEjCtT9V/fEV7QXm67YnllcjTOnpwi0eLH3jYRfIJeWs+uaRnvUvfWA
         Iv+QmUh9t7YiXy1pXCtUlOZ4GC3RgugjeRpt3PXjO3eJTIQIgfPrUG4wMQ2u443mgHbU
         59sQ6KVpnSbYkwVki1iyYTschO6B7dbQNnTkCvrTObW6P/5tB+A5lENriAgifYSyNZsF
         fpk92fwzregW9WAQKw76UTp+xwBIfrzKo8TKeQW/cz7FvetGTjKxvIKm8UtBrEbfxFaC
         ko9g==
X-Gm-Message-State: AC+VfDwpqhlMLRLtxiHlr+qsqiGV9dXzTZI6wOeYR8EYb4nkEk2FXjVC
	bOF73EcXD+qDELem0M44A4c=
X-Google-Smtp-Source: ACHHUZ6CPRZy4B1gHWQwGyL1jpWh6RHuanx0k7sKCLWXZpcFJmn4wjrQVTLXrK9+FDMtZqXPjFpwgg==
X-Received: by 2002:a0d:cb4e:0:b0:56c:f32d:1753 with SMTP id n75-20020a0dcb4e000000b0056cf32d1753mr9075881ywd.44.1686603936731;
        Mon, 12 Jun 2023 14:05:36 -0700 (PDT)
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
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 25/34] m68k: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:14 -0700
Message-Id: <20230612210423.18611-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/include/asm/mcf_pgalloc.h  | 41 ++++++++++++++--------------
 arch/m68k/include/asm/sun3_pgalloc.h |  8 +++---
 arch/m68k/mm/motorola.c              |  4 +--
 3 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
index 5c2c0a864524..857949ac9431 100644
--- a/arch/m68k/include/asm/mcf_pgalloc.h
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -7,20 +7,19 @@
 
 extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 {
-	free_page((unsigned long) pte);
+	pagetable_free(virt_to_ptdesc(pte));
 }
 
 extern const char bad_pmd_string[];
 
 extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
-	unsigned long page = __get_free_page(GFP_DMA);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | __GFP_ZERO, 0);
 
-	if (!page)
+	if (!ptdesc)
 		return NULL;
 
-	memset((void *)page, 0, PAGE_SIZE);
-	return (pte_t *) (page);
+	return ptdesc_address(ptdesc);
 }
 
 extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
@@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
 				  unsigned long address)
 {
-	struct page *page = virt_to_page(pgtable);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_pages(GFP_DMA, 0);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA, 0);
 	pte_t *pte;
 
-	if (!page)
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	pte = page_address(page);
-	clear_page(pte);
+	pte = ptdesc_address(ptdesc);
+	pagetable_clear(pte);
 
 	return pte;
 }
 
 static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
 {
-	struct page *page = virt_to_page(pgtable);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 /*
@@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_page((unsigned long) pgd);
+	pagetable_free(virt_to_ptdesc(pgd));
 }
 
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *new_pgd;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | GFP_NOWARN, 0);
 
-	new_pgd = (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
-	if (!new_pgd)
+	if (!ptdesc)
 		return NULL;
+	new_pgd = ptdesc_address(ptdesc);
+
 	memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
 	memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
 	return new_pgd;
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index 198036aff519..ff48573db2c0 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -17,10 +17,10 @@
 
 extern const char bad_pmd_string[];
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index c75984e2d86b..594575a0780c 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -161,7 +161,7 @@ void *get_pointer_table(int type)
 			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
 			 * SMP.
 			 */
-			pgtable_pte_page_ctor(virt_to_page(page));
+			pagetable_pte_ctor(virt_to_ptdesc(page));
 		}
 
 		mmu_page_ctor(page);
@@ -201,7 +201,7 @@ int free_pointer_table(void *table, int type)
 		list_del(dp);
 		mmu_page_dtor((void *)page);
 		if (type == TABLE_PTE)
-			pgtable_pte_page_dtor(virt_to_page((void *)page));
+			pagetable_pte_dtor(virt_to_ptdesc((void *)page));
 		free_page (page);
 		return 1;
 	} else if (ptable_list[type].next != dp) {
-- 
2.40.1


