Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCF718D4C
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542067.845593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVn-0008RF-MA; Wed, 31 May 2023 21:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542067.845593; Wed, 31 May 2023 21:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVn-0008It-86; Wed, 31 May 2023 21:37:43 +0000
Received: by outflank-mailman (input) for mailman id 542067;
 Wed, 31 May 2023 21:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQ2-0006zB-89
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:46 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89b964a6-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:31:44 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-561c1436c75so806487b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:44 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:42 -0700 (PDT)
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
X-Inumbo-ID: 89b964a6-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568703; x=1688160703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0EDlTBepFAIScUxyTJ+0DyGhEsxHu6BpoqqcqVDYAk=;
        b=lfEsLtgTeKEzXFirMo9o11V/XRmZm00/YaLm7BlBKxUZMh8F89Ri2q82RalA6HVFcr
         fGfOCaBw7lrZfJUknvgerzX2CLrTKKqqygseS2G5r3CrGL21cM5rmCXifeNktoOdWeqE
         hCAdIHYTp6Omd8YIi0G2dwAir8S3Dh7e6wZEUy3DbCkX4PtFD3VJdhVAKwcBVEwSBDM1
         IgMwwjhrauy7YY5+zFOQZ8f3GCW/2V8MHMVyy+uFfFYSBx0y4NOWRzIYfjEZfvlGo2qR
         q/y0VEM36li7rrjLRirqy8+8CcNmR7WeMBFP9OUiKGR04mxHqqi+zNnx2O9I2zESO1QH
         Pk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568703; x=1688160703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0EDlTBepFAIScUxyTJ+0DyGhEsxHu6BpoqqcqVDYAk=;
        b=JyrS9t+dyaomEJtULIRiU6s5WJVnwvCqLj3CugIFz0aLIblQI4qiTw6VvRGGCeVL5b
         U9FuWjXBDBZ867kkDGcBPgzWF9Pfxcir5QOT4MoKg/cFa8hN2JSiaW4W3docOhpcDyGz
         WmOSgSVePkiKtDPIBmopcTlPtY3+lZL4Jw+c8Gt/wHUyvWIp/70q1LJVkPZDVER0QD9d
         vXN7RmfVX2fj9w3Er8s/pamWomciATxCroaPh2SqR6fOS6zwYyReSa0egaVTa5IH17Kf
         DMZib7WA3/om4kixuPqjz5aQJSsAymQ0cKrVDE1snuIVS4//kH9gZxf6MZpCgdRph5uT
         gMDw==
X-Gm-Message-State: AC+VfDxZ+xD2TxQ9ozhhFi3KUWOMzwuVyg1VgMnp3eciwVdYkBq6Hm8Z
	dtaxhW69klCd/kKpNPmDKgA=
X-Google-Smtp-Source: ACHHUZ4ZKhxc9PbSQYs4zCFcIXlSyOZD/0WXO8m20IywWxu9Fif+j8BE1GhA2Av88s4QXNRNjVFnmA==
X-Received: by 2002:a0d:ccd3:0:b0:561:e89d:e263 with SMTP id o202-20020a0dccd3000000b00561e89de263mr6292041ywd.52.1685568702956;
        Wed, 31 May 2023 14:31:42 -0700 (PDT)
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
	David Hildenbrand <david@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [PATCH v3 17/34] s390: Convert various pgalloc functions to use ptdescs
Date: Wed, 31 May 2023 14:30:15 -0700
Message-Id: <20230531213032.25338-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/s390/include/asm/pgalloc.h |   4 +-
 arch/s390/include/asm/tlb.h     |   4 +-
 arch/s390/mm/pgalloc.c          | 108 ++++++++++++++++----------------
 3 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 17eb618f1348..00ad9b88fda9 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -86,7 +86,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
 	if (!table)
 		return NULL;
 	crst_table_init(table, _SEGMENT_ENTRY_EMPTY);
-	if (!pgtable_pmd_page_ctor(virt_to_page(table))) {
+	if (!pagetable_pmd_ctor(virt_to_ptdesc(table))) {
 		crst_table_free(mm, table);
 		return NULL;
 	}
@@ -97,7 +97,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
 	if (mm_pmd_folded(mm))
 		return;
-	pgtable_pmd_page_dtor(virt_to_page(pmd));
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));
 	crst_table_free(mm, (unsigned long *) pmd);
 }
 
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index b91f4a9b044c..383b1f91442c 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -89,12 +89,12 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 {
 	if (mm_pmd_folded(tlb->mm))
 		return;
-	pgtable_pmd_page_dtor(virt_to_page(pmd));
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_puds = 1;
-	tlb_remove_table(tlb, pmd);
+	tlb_remove_ptdesc(tlb, pmd);
 }
 
 /*
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 6b99932abc66..eeb7c95b98cf 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -43,17 +43,17 @@ __initcall(page_table_register_sysctl);
 
 unsigned long *crst_table_alloc(struct mm_struct *mm)
 {
-	struct page *page = alloc_pages(GFP_KERNEL, CRST_ALLOC_ORDER);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, CRST_ALLOC_ORDER);
 
-	if (!page)
+	if (!ptdesc)
 		return NULL;
-	arch_set_page_dat(page, CRST_ALLOC_ORDER);
-	return (unsigned long *) page_to_virt(page);
+	arch_set_page_dat(ptdesc_page(ptdesc), CRST_ALLOC_ORDER);
+	return (unsigned long *) ptdesc_to_virt(ptdesc);
 }
 
 void crst_table_free(struct mm_struct *mm, unsigned long *table)
 {
-	free_pages((unsigned long)table, CRST_ALLOC_ORDER);
+	pagetable_free(virt_to_ptdesc(table));
 }
 
 static void __crst_table_upgrade(void *arg)
@@ -140,21 +140,21 @@ static inline unsigned int atomic_xor_bits(atomic_t *v, unsigned int bits)
 
 struct page *page_table_alloc_pgste(struct mm_struct *mm)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 	u64 *table;
 
-	page = alloc_page(GFP_KERNEL);
-	if (page) {
-		table = (u64 *)page_to_virt(page);
+	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
+	if (ptdesc) {
+		table = (u64 *)ptdesc_to_virt(ptdesc);
 		memset64(table, _PAGE_INVALID, PTRS_PER_PTE);
 		memset64(table + PTRS_PER_PTE, 0, PTRS_PER_PTE);
 	}
-	return page;
+	return ptdesc_page(ptdesc);
 }
 
 void page_table_free_pgste(struct page *page)
 {
-	__free_page(page);
+	pagetable_free(page_ptdesc(page));
 }
 
 #endif /* CONFIG_PGSTE */
@@ -230,7 +230,7 @@ void page_table_free_pgste(struct page *page)
 unsigned long *page_table_alloc(struct mm_struct *mm)
 {
 	unsigned long *table;
-	struct page *page;
+	struct ptdesc *ptdesc;
 	unsigned int mask, bit;
 
 	/* Try to get a fragment of a 4K page as a 2K page table */
@@ -238,9 +238,9 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 		table = NULL;
 		spin_lock_bh(&mm->context.lock);
 		if (!list_empty(&mm->context.pgtable_list)) {
-			page = list_first_entry(&mm->context.pgtable_list,
-						struct page, lru);
-			mask = atomic_read(&page->pt_frag_refcount);
+			ptdesc = list_first_entry(&mm->context.pgtable_list,
+						struct ptdesc, pt_list);
+			mask = atomic_read(&ptdesc->pt_frag_refcount);
 			/*
 			 * The pending removal bits must also be checked.
 			 * Failure to do so might lead to an impossible
@@ -253,13 +253,13 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 			 */
 			mask = (mask | (mask >> 4)) & 0x03U;
 			if (mask != 0x03U) {
-				table = (unsigned long *) page_to_virt(page);
+				table = (unsigned long *) ptdesc_to_virt(ptdesc);
 				bit = mask & 1;		/* =1 -> second 2K */
 				if (bit)
 					table += PTRS_PER_PTE;
-				atomic_xor_bits(&page->pt_frag_refcount,
+				atomic_xor_bits(&ptdesc->pt_frag_refcount,
 							0x01U << bit);
-				list_del(&page->lru);
+				list_del(&ptdesc->pt_list);
 			}
 		}
 		spin_unlock_bh(&mm->context.lock);
@@ -267,27 +267,27 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 			return table;
 	}
 	/* Allocate a fresh page */
-	page = alloc_page(GFP_KERNEL);
-	if (!page)
+	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	arch_set_page_dat(page, 0);
+	arch_set_page_dat(ptdesc_page(ptdesc), 0);
 	/* Initialize page table */
-	table = (unsigned long *) page_to_virt(page);
+	table = (unsigned long *) ptdesc_to_virt(ptdesc);
 	if (mm_alloc_pgste(mm)) {
 		/* Return 4K page table with PGSTEs */
-		atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
+		atomic_xor_bits(&ptdesc->pt_frag_refcount, 0x03U);
 		memset64((u64 *)table, _PAGE_INVALID, PTRS_PER_PTE);
 		memset64((u64 *)table + PTRS_PER_PTE, 0, PTRS_PER_PTE);
 	} else {
 		/* Return the first 2K fragment of the page */
-		atomic_xor_bits(&page->pt_frag_refcount, 0x01U);
+		atomic_xor_bits(&ptdesc->pt_frag_refcount, 0x01U);
 		memset64((u64 *)table, _PAGE_INVALID, 2 * PTRS_PER_PTE);
 		spin_lock_bh(&mm->context.lock);
-		list_add(&page->lru, &mm->context.pgtable_list);
+		list_add(&ptdesc->pt_list, &mm->context.pgtable_list);
 		spin_unlock_bh(&mm->context.lock);
 	}
 	return table;
@@ -309,9 +309,8 @@ static void page_table_release_check(struct page *page, void *table,
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	unsigned int mask, bit, half;
-	struct page *page;
+	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	page = virt_to_page(table);
 	if (!mm_alloc_pgste(mm)) {
 		/* Free 2K page table fragment of a 4K page */
 		bit = ((unsigned long) table & ~PAGE_MASK)/(PTRS_PER_PTE*sizeof(pte_t));
@@ -321,39 +320,38 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 		 * will happen outside of the critical section from this
 		 * function or from __tlb_remove_table()
 		 */
-		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x11U << bit);
+		mask = atomic_xor_bits(&ptdesc->pt_frag_refcount, 0x11U << bit);
 		if (mask & 0x03U)
-			list_add(&page->lru, &mm->context.pgtable_list);
+			list_add(&ptdesc->pt_list, &mm->context.pgtable_list);
 		else
-			list_del(&page->lru);
+			list_del(&ptdesc->pt_list);
 		spin_unlock_bh(&mm->context.lock);
-		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x10U << bit);
+		mask = atomic_xor_bits(&ptdesc->pt_frag_refcount, 0x10U << bit);
 		if (mask != 0x00U)
 			return;
 		half = 0x01U << bit;
 	} else {
 		half = 0x03U;
-		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
+		mask = atomic_xor_bits(&ptdesc->pt_frag_refcount, 0x03U);
 	}
 
-	page_table_release_check(page, table, half, mask);
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	page_table_release_check(ptdesc_page(ptdesc), table, half, mask);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
 			 unsigned long vmaddr)
 {
 	struct mm_struct *mm;
-	struct page *page;
 	unsigned int bit, mask;
+	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
 	mm = tlb->mm;
-	page = virt_to_page(table);
 	if (mm_alloc_pgste(mm)) {
 		gmap_unlink(mm, table, vmaddr);
 		table = (unsigned long *) ((unsigned long)table | 0x03U);
-		tlb_remove_table(tlb, table);
+		tlb_remove_ptdesc(tlb, table);
 		return;
 	}
 	bit = ((unsigned long) table & ~PAGE_MASK) / (PTRS_PER_PTE*sizeof(pte_t));
@@ -363,11 +361,11 @@ void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
 	 * outside of the critical section from __tlb_remove_table() or from
 	 * page_table_free()
 	 */
-	mask = atomic_xor_bits(&page->pt_frag_refcount, 0x11U << bit);
+	mask = atomic_xor_bits(&ptdesc->pt_frag_refcount, 0x11U << bit);
 	if (mask & 0x03U)
-		list_add_tail(&page->lru, &mm->context.pgtable_list);
+		list_add_tail(&ptdesc->pt_list, &mm->context.pgtable_list);
 	else
-		list_del(&page->lru);
+		list_del(&ptdesc->pt_list);
 	spin_unlock_bh(&mm->context.lock);
 	table = (unsigned long *) ((unsigned long) table | (0x01U << bit));
 	tlb_remove_table(tlb, table);
@@ -377,7 +375,7 @@ void __tlb_remove_table(void *_table)
 {
 	unsigned int mask = (unsigned long) _table & 0x03U, half = mask;
 	void *table = (void *)((unsigned long) _table ^ mask);
-	struct page *page = virt_to_page(table);
+	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
 	switch (half) {
 	case 0x00U:	/* pmd, pud, or p4d */
@@ -385,18 +383,18 @@ void __tlb_remove_table(void *_table)
 		return;
 	case 0x01U:	/* lower 2K of a 4K page table */
 	case 0x02U:	/* higher 2K of a 4K page table */
-		mask = atomic_xor_bits(&page->pt_frag_refcount, mask << 4);
+		mask = atomic_xor_bits(&ptdesc->pt_frag_refcount, mask << 4);
 		if (mask != 0x00U)
 			return;
 		break;
 	case 0x03U:	/* 4K page table with pgstes */
-		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
+		mask = atomic_xor_bits(&ptdesc->pt_frag_refcount, 0x03U);
 		break;
 	}
 
-	page_table_release_check(page, table, half, mask);
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	page_table_release_check(ptdesc_page(ptdesc), table, half, mask);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 /*
@@ -424,16 +422,20 @@ static void base_pgt_free(unsigned long *table)
 static unsigned long *base_crst_alloc(unsigned long val)
 {
 	unsigned long *table;
+	struct ptdesc *ptdesc;
 
-	table =	(unsigned long *)__get_free_pages(GFP_KERNEL, CRST_ALLOC_ORDER);
-	if (table)
-		crst_table_init(table, val);
+	ptdesc = pagetable_alloc(GFP_KERNEL, CRST_ALLOC_ORDER);
+	if (!ptdesc)
+		return NULL;
+	table = ptdesc_address(ptdesc);
+
+	crst_table_init(table, val);
 	return table;
 }
 
 static void base_crst_free(unsigned long *table)
 {
-	free_pages((unsigned long)table, CRST_ALLOC_ORDER);
+	pagetable_free(virt_to_ptdesc(table));
 }
 
 #define BASE_ADDR_END_FUNC(NAME, SIZE)					\
-- 
2.40.1


