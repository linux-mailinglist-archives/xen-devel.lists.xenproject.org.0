Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D89769EC1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573335.898013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWNA-0004ZE-GE; Mon, 31 Jul 2023 17:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573335.898013; Mon, 31 Jul 2023 17:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWNA-0004VC-7F; Mon, 31 Jul 2023 17:07:56 +0000
Received: by outflank-mailman (input) for mailman id 573335;
 Mon, 31 Jul 2023 17:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJY-0000C0-QT
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:12 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 448c5f8f-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:04:11 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a6f3ef3155so2457034b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:11 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:09 -0700 (PDT)
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
X-Inumbo-ID: 448c5f8f-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823050; x=1691427850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBkB4loM/Mt006iaxsYk7j8UnaAx8a9/NTd5FkPootg=;
        b=LaN2Z5cA1g3QHkmu1yTAPuZ+gTgDQXRJQVZ3q2bju3+OXPPdz1JjIqLJAjDfCBEgH9
         7Ttgf9+xGINvOvqPbjkBBA+kiz1r/307hJB3HQPBTO+grLv6cLtOMVUiOQ3YqTtB3VhG
         DR1MJfbiJ1WEF5YzFYY4ZtTmPxDuFx+JwcfSUJ/HGuVXlEGvoPiVmTgBFyMwXloIHduF
         XN+NqGvI2ErntPxzKW8shpaaIArfirugcPlVxrvDp/YXtjJboT3jqZnutkk3sNOVqTbe
         4MBegStktcVwlYOqkBrub1drFP/tUKuFSEW2ULzr9NM6cvzKis6pkazSEIpoiDyQTv+z
         2r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823050; x=1691427850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBkB4loM/Mt006iaxsYk7j8UnaAx8a9/NTd5FkPootg=;
        b=FpyOZ3PxOJ7S92KSYYFbHVUgeDDA9duXkqEYw35uHCT6lpeD79aN99dlRONY/VJFE0
         DZ0d0xnLQ2MEIf2H+kmpB+ySK+k1Cwi4GkxfSKJmlXCt2kqnb21kXxy7MFnDjeARoebr
         uDTyeq3Fvtgj7pVFrHHnJbL4+GyjtKTrm8AOSy6peoUtpYJGXjzbHDrte26TQMVjl9r7
         ihj8P5DHQOoW0s0X1ZZ496wJUG6bv7+zlUAKdZiQpfS/G1kTBOKpq4XrBJ+yxyD4r7GA
         rHb5T0cDmiFnBQaEzYG0o+7nnyFzOM6TA0SrW1i7aZ+Hv6KoMCqAAMwQTO1SZI36QOlT
         P5SQ==
X-Gm-Message-State: ABy/qLbzrPFnhPvZ2rhHdmYz58XU3/htz9ZNXb4Yvmdsx/t0X+3ZG3JO
	m6RhtZlwZvsvY5DrYN3DBZ60TCipE6Vt+g==
X-Google-Smtp-Source: APBJJlGId6OsNROK0Rrfftpz1UcSUo2PPmBi9KGG5ymdHpGiVY5jldwYwkHVkIkpJVs885EQKvaPug==
X-Received: by 2002:a05:6808:2a7a:b0:3a3:ffb7:a28 with SMTP id fu26-20020a0568082a7a00b003a3ffb70a28mr10979580oib.45.1690823050042;
        Mon, 31 Jul 2023 10:04:10 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH mm-unstable v8 16/31] pgalloc: Convert various functions to use ptdescs
Date: Mon, 31 Jul 2023 10:03:17 -0700
Message-Id: <20230731170332.69404-17-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/asm-generic/pgalloc.h | 88 +++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index a7cf825befae..c75d4a753849 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -8,7 +8,7 @@
 #define GFP_PGTABLE_USER	(GFP_PGTABLE_KERNEL | __GFP_ACCOUNT)
 
 /**
- * __pte_alloc_one_kernel - allocate a page for PTE-level kernel page table
+ * __pte_alloc_one_kernel - allocate memory for a PTE-level kernel page table
  * @mm: the mm_struct of the current context
  *
  * This function is intended for architectures that need
@@ -18,12 +18,17 @@
  */
 static inline pte_t *__pte_alloc_one_kernel(struct mm_struct *mm)
 {
-	return (pte_t *)__get_free_page(GFP_PGTABLE_KERNEL);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL &
+			~__GFP_HIGHMEM, 0);
+
+	if (!ptdesc)
+		return NULL;
+	return ptdesc_address(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
 /**
- * pte_alloc_one_kernel - allocate a page for PTE-level kernel page table
+ * pte_alloc_one_kernel - allocate memory for a PTE-level kernel page table
  * @mm: the mm_struct of the current context
  *
  * Return: pointer to the allocated memory or %NULL on error
@@ -35,40 +40,40 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 #endif
 
 /**
- * pte_free_kernel - free PTE-level kernel page table page
+ * pte_free_kernel - free PTE-level kernel page table memory
  * @mm: the mm_struct of the current context
  * @pte: pointer to the memory containing the page table
  */
 static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 {
-	free_page((unsigned long)pte);
+	pagetable_free(virt_to_ptdesc(pte));
 }
 
 /**
- * __pte_alloc_one - allocate a page for PTE-level user page table
+ * __pte_alloc_one - allocate memory for a PTE-level user page table
  * @mm: the mm_struct of the current context
  * @gfp: GFP flags to use for the allocation
  *
- * Allocates a page and runs the pgtable_pte_page_ctor().
+ * Allocate memory for a page table and ptdesc and runs pagetable_pte_ctor().
  *
  * This function is intended for architectures that need
  * anything beyond simple page allocation or must have custom GFP flags.
  *
- * Return: `struct page` initialized as page table or %NULL on error
+ * Return: `struct page` referencing the ptdesc or %NULL on error
  */
 static inline pgtable_t __pte_alloc_one(struct mm_struct *mm, gfp_t gfp)
 {
-	struct page *pte;
+	struct ptdesc *ptdesc;
 
-	pte = alloc_page(gfp);
-	if (!pte)
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(pte)) {
-		__free_page(pte);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	return pte;
+	return ptdesc_page(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PTE_ALLOC_ONE
@@ -76,9 +81,9 @@ static inline pgtable_t __pte_alloc_one(struct mm_struct *mm, gfp_t gfp)
  * pte_alloc_one - allocate a page for PTE-level user page table
  * @mm: the mm_struct of the current context
  *
- * Allocates a page and runs the pgtable_pte_page_ctor().
+ * Allocate memory for a page table and ptdesc and runs pagetable_pte_ctor().
  *
- * Return: `struct page` initialized as page table or %NULL on error
+ * Return: `struct page` referencing the ptdesc or %NULL on error
  */
 static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
@@ -92,14 +97,16 @@ static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
  */
 
 /**
- * pte_free - free PTE-level user page table page
+ * pte_free - free PTE-level user page table memory
  * @mm: the mm_struct of the current context
- * @pte_page: the `struct page` representing the page table
+ * @pte_page: the `struct page` referencing the ptdesc
  */
 static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
-	pgtable_pte_page_dtor(pte_page);
-	__free_page(pte_page);
+	struct ptdesc *ptdesc = page_ptdesc(pte_page);
+
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 
@@ -107,10 +114,11 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 
 #ifndef __HAVE_ARCH_PMD_ALLOC_ONE
 /**
- * pmd_alloc_one - allocate a page for PMD-level page table
+ * pmd_alloc_one - allocate memory for a PMD-level page table
  * @mm: the mm_struct of the current context
  *
- * Allocates a page and runs the pgtable_pmd_page_ctor().
+ * Allocate memory for a page table and ptdesc and runs pagetable_pmd_ctor().
+ *
  * Allocations use %GFP_PGTABLE_USER in user context and
  * %GFP_PGTABLE_KERNEL in kernel context.
  *
@@ -118,28 +126,30 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
  */
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 	gfp_t gfp = GFP_PGTABLE_USER;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
-	page = alloc_page(gfp);
-	if (!page)
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pmd_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	return (pmd_t *)page_address(page);
+	return ptdesc_address(ptdesc);
 }
 #endif
 
 #ifndef __HAVE_ARCH_PMD_FREE
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
+
 	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pgtable_pmd_page_dtor(virt_to_page(pmd));
-	free_page((unsigned long)pmd);
+	pagetable_pmd_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 #endif
 
@@ -150,19 +160,25 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 static inline pud_t *__pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
 	gfp_t gfp = GFP_PGTABLE_USER;
+	struct ptdesc *ptdesc;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
-	return (pud_t *)get_zeroed_page(gfp);
+	gfp &= ~__GFP_HIGHMEM;
+
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
+		return NULL;
+	return ptdesc_address(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
 /**
- * pud_alloc_one - allocate a page for PUD-level page table
+ * pud_alloc_one - allocate memory for a PUD-level page table
  * @mm: the mm_struct of the current context
  *
- * Allocates a page using %GFP_PGTABLE_USER for user context and
- * %GFP_PGTABLE_KERNEL for kernel context.
+ * Allocate memory for a page table using %GFP_PGTABLE_USER for user context
+ * and %GFP_PGTABLE_KERNEL for kernel context.
  *
  * Return: pointer to the allocated memory or %NULL on error
  */
@@ -175,7 +191,7 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	free_page((unsigned long)pud);
+	pagetable_free(virt_to_ptdesc(pud));
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -190,7 +206,7 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 #ifndef __HAVE_ARCH_PGD_FREE
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_page((unsigned long)pgd);
+	pagetable_free(virt_to_ptdesc(pgd));
 }
 #endif
 
-- 
2.40.1


