Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED557733FB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579039.906916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Jy-0002eS-Ax; Mon, 07 Aug 2023 23:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579039.906916; Mon, 07 Aug 2023 23:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Jx-0002bG-Tz; Mon, 07 Aug 2023 23:07:29 +0000
Received: by outflank-mailman (input) for mailman id 579039;
 Mon, 07 Aug 2023 23:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9IK-0001NY-NN
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:48 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a1d806-3576-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 01:05:47 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-583a8596e2aso47382717b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:47 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:46 -0700 (PDT)
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
X-Inumbo-ID: f1a1d806-3576-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449546; x=1692054346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTxrIV2g+RQp8x48kTjbks2V3Qkjrf9giqtKYKQ6wMQ=;
        b=bESfOv3fJjl6S2bDdKG26ChK560t/KurCf2BuIVrJugWlIetZAY8dkm3BlRqTb5F9h
         MmCd+fJD3FYKnm/uPsZqzHHfYqRAfZJ6edPW59b/mfQy9OnVPplxToH74IAxvuQBpZIp
         niQgR35WlLiV2T1WK1prVa+1DAnr9uCehUPSrpK2bRog9p7trBe4LuQ5wQtTiaXMkeR6
         5WiqV9YMt9t6YbF2oMIpXApkWHFh9QOYyGn6c4/FtI6WKINzWjkgGMiBWrQM5L6cS45e
         +OyFkksfoYTyAHJrwLrJApoTt8RQXAw2BsSDClQbHPobWbdTJ6uW2JVwGx2BjRuJHUGC
         6BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449546; x=1692054346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTxrIV2g+RQp8x48kTjbks2V3Qkjrf9giqtKYKQ6wMQ=;
        b=V6/HiMwqQC3vC5WmUpx6bwl+mX9Jn2YghF7wSbzVgk2IbejXrTKkVo3HyREwSwsoRR
         zc06i0I9rx+Po+YHxfPTaid9thgoM2urew6l9WbjC4b2Jy7EYxrxBP3hJmI3d2pxjzNl
         7ZmfBX7RTedDg1KOEQV/ZbJnZu7233bWB7WNVNCCBPPBNWJknmv6UmY5D1DHKgsb6lEu
         A2VPcgTcClVTYpwIfLXUGdkDmlkGQkEfZNsjok4ch6kWOAVowU8zUjxiNOgiR/jO5evw
         Hx5uQ64cmN7uD+vYsgrZxdvC7uXul2ep7bspxRxcsgkPY/KtDYjzEkBjqGGJHFALTQ7C
         EUYw==
X-Gm-Message-State: AOJu0Yx23XDa17tcgNvP2TUaVBMO81XU3r4PIgomBjLTB7Y5L5qto7L3
	BszbsxxrC385NgsqsruyV8s=
X-Google-Smtp-Source: AGHT+IEbeU2d+G/u3Omk8ALzIFtGElW92WFOhX86na7K18OIxELxvZjq1aqGQvka/NS+TcgqvjsoPw==
X-Received: by 2002:a25:d08:0:b0:d1c:7549:4e8b with SMTP id 8-20020a250d08000000b00d1c75494e8bmr8202835ybn.29.1691449546593;
        Mon, 07 Aug 2023 16:05:46 -0700 (PDT)
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
	David Hildenbrand <david@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 14/31] s390: Convert various pgalloc functions to use ptdescs
Date: Mon,  7 Aug 2023 16:04:56 -0700
Message-Id: <20230807230513.102486-15-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/s390/include/asm/pgalloc.h |   4 +-
 arch/s390/include/asm/tlb.h     |   4 +-
 arch/s390/mm/pgalloc.c          | 128 ++++++++++++++++----------------
 3 files changed, 69 insertions(+), 67 deletions(-)

diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 89a9d5ef94f8..376b4b23bdaa 100644
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
index d7374add7820..07fc660a24aa 100644
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
@@ -242,7 +242,7 @@ void page_table_free_pgste(struct page *page)
 unsigned long *page_table_alloc(struct mm_struct *mm)
 {
 	unsigned long *table;
-	struct page *page;
+	struct ptdesc *ptdesc;
 	unsigned int mask, bit;
 
 	/* Try to get a fragment of a 4K page as a 2K page table */
@@ -250,9 +250,9 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 		table = NULL;
 		spin_lock_bh(&mm->context.lock);
 		if (!list_empty(&mm->context.pgtable_list)) {
-			page = list_first_entry(&mm->context.pgtable_list,
-						struct page, lru);
-			mask = atomic_read(&page->_refcount) >> 24;
+			ptdesc = list_first_entry(&mm->context.pgtable_list,
+						struct ptdesc, pt_list);
+			mask = atomic_read(&ptdesc->_refcount) >> 24;
 			/*
 			 * The pending removal bits must also be checked.
 			 * Failure to do so might lead to an impossible
@@ -264,13 +264,13 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 			 */
 			mask = (mask | (mask >> 4)) & 0x03U;
 			if (mask != 0x03U) {
-				table = (unsigned long *) page_to_virt(page);
+				table = (unsigned long *) ptdesc_to_virt(ptdesc);
 				bit = mask & 1;		/* =1 -> second 2K */
 				if (bit)
 					table += PTRS_PER_PTE;
-				atomic_xor_bits(&page->_refcount,
+				atomic_xor_bits(&ptdesc->_refcount,
 							0x01U << (bit + 24));
-				list_del_init(&page->lru);
+				list_del_init(&ptdesc->pt_list);
 			}
 		}
 		spin_unlock_bh(&mm->context.lock);
@@ -278,28 +278,28 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
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
-		INIT_LIST_HEAD(&page->lru);
-		atomic_xor_bits(&page->_refcount, 0x03U << 24);
+		INIT_LIST_HEAD(&ptdesc->pt_list);
+		atomic_xor_bits(&ptdesc->_refcount, 0x03U << 24);
 		memset64((u64 *)table, _PAGE_INVALID, PTRS_PER_PTE);
 		memset64((u64 *)table + PTRS_PER_PTE, 0, PTRS_PER_PTE);
 	} else {
 		/* Return the first 2K fragment of the page */
-		atomic_xor_bits(&page->_refcount, 0x01U << 24);
+		atomic_xor_bits(&ptdesc->_refcount, 0x01U << 24);
 		memset64((u64 *)table, _PAGE_INVALID, 2 * PTRS_PER_PTE);
 		spin_lock_bh(&mm->context.lock);
-		list_add(&page->lru, &mm->context.pgtable_list);
+		list_add(&ptdesc->pt_list, &mm->context.pgtable_list);
 		spin_unlock_bh(&mm->context.lock);
 	}
 	return table;
@@ -322,19 +322,18 @@ static void page_table_release_check(struct page *page, void *table,
 
 static void pte_free_now(struct rcu_head *head)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = container_of(head, struct page, rcu_head);
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	unsigned int mask, bit, half;
-	struct page *page;
+	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	page = virt_to_page(table);
 	if (!mm_alloc_pgste(mm)) {
 		/* Free 2K page table fragment of a 4K page */
 		bit = ((unsigned long) table & ~PAGE_MASK)/(PTRS_PER_PTE*sizeof(pte_t));
@@ -344,51 +343,50 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 		 * will happen outside of the critical section from this
 		 * function or from __tlb_remove_table()
 		 */
-		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
+		mask = atomic_xor_bits(&ptdesc->_refcount, 0x11U << (bit + 24));
 		mask >>= 24;
-		if ((mask & 0x03U) && !PageActive(page)) {
+		if ((mask & 0x03U) && !folio_test_active(ptdesc_folio(ptdesc))) {
 			/*
 			 * Other half is allocated, and neither half has had
 			 * its free deferred: add page to head of list, to make
 			 * this freed half available for immediate reuse.
 			 */
-			list_add(&page->lru, &mm->context.pgtable_list);
+			list_add(&ptdesc->pt_list, &mm->context.pgtable_list);
 		} else {
 			/* If page is on list, now remove it. */
-			list_del_init(&page->lru);
+			list_del_init(&ptdesc->pt_list);
 		}
 		spin_unlock_bh(&mm->context.lock);
-		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
+		mask = atomic_xor_bits(&ptdesc->_refcount, 0x10U << (bit + 24));
 		mask >>= 24;
 		if (mask != 0x00U)
 			return;
 		half = 0x01U << bit;
 	} else {
 		half = 0x03U;
-		mask = atomic_xor_bits(&page->_refcount, 0x03U << 24);
+		mask = atomic_xor_bits(&ptdesc->_refcount, 0x03U << 24);
 		mask >>= 24;
 	}
 
-	page_table_release_check(page, table, half, mask);
-	if (TestClearPageActive(page))
-		call_rcu(&page->rcu_head, pte_free_now);
+	page_table_release_check(ptdesc_page(ptdesc), table, half, mask);
+	if (folio_test_clear_active(ptdesc_folio(ptdesc)))
+		call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
 	else
-		pte_free_now(&page->rcu_head);
+		pte_free_now(&ptdesc->pt_rcu_head);
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
@@ -398,19 +396,19 @@ void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
 	 * outside of the critical section from __tlb_remove_table() or from
 	 * page_table_free()
 	 */
-	mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
+	mask = atomic_xor_bits(&ptdesc->_refcount, 0x11U << (bit + 24));
 	mask >>= 24;
-	if ((mask & 0x03U) && !PageActive(page)) {
+	if ((mask & 0x03U) && !folio_test_active(ptdesc_folio(ptdesc))) {
 		/*
 		 * Other half is allocated, and neither half has had
 		 * its free deferred: add page to end of list, to make
 		 * this freed half available for reuse once its pending
 		 * bit has been cleared by __tlb_remove_table().
 		 */
-		list_add_tail(&page->lru, &mm->context.pgtable_list);
+		list_add_tail(&ptdesc->pt_list, &mm->context.pgtable_list);
 	} else {
 		/* If page is on list, now remove it. */
-		list_del_init(&page->lru);
+		list_del_init(&ptdesc->pt_list);
 	}
 	spin_unlock_bh(&mm->context.lock);
 	table = (unsigned long *) ((unsigned long) table | (0x01U << bit));
@@ -421,30 +419,30 @@ void __tlb_remove_table(void *_table)
 {
 	unsigned int mask = (unsigned long) _table & 0x03U, half = mask;
 	void *table = (void *)((unsigned long) _table ^ mask);
-	struct page *page = virt_to_page(table);
+	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
 	switch (half) {
 	case 0x00U:	/* pmd, pud, or p4d */
-		free_pages((unsigned long)table, CRST_ALLOC_ORDER);
+		pagetable_free(ptdesc);
 		return;
 	case 0x01U:	/* lower 2K of a 4K page table */
 	case 0x02U:	/* higher 2K of a 4K page table */
-		mask = atomic_xor_bits(&page->_refcount, mask << (4 + 24));
+		mask = atomic_xor_bits(&ptdesc->_refcount, mask << (4 + 24));
 		mask >>= 24;
 		if (mask != 0x00U)
 			return;
 		break;
 	case 0x03U:	/* 4K page table with pgstes */
-		mask = atomic_xor_bits(&page->_refcount, 0x03U << 24);
+		mask = atomic_xor_bits(&ptdesc->_refcount, 0x03U << 24);
 		mask >>= 24;
 		break;
 	}
 
-	page_table_release_check(page, table, half, mask);
-	if (TestClearPageActive(page))
-		call_rcu(&page->rcu_head, pte_free_now);
+	page_table_release_check(ptdesc_page(ptdesc), table, half, mask);
+	if (folio_test_clear_active(ptdesc_folio(ptdesc)))
+		call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
 	else
-		pte_free_now(&page->rcu_head);
+		pte_free_now(&ptdesc->pt_rcu_head);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -488,16 +486,20 @@ static void base_pgt_free(unsigned long *table)
 static unsigned long *base_crst_alloc(unsigned long val)
 {
 	unsigned long *table;
+	struct ptdesc *ptdesc;
 
-	table =	(unsigned long *)__get_free_pages(GFP_KERNEL, CRST_ALLOC_ORDER);
-	if (table)
-		crst_table_init(table, val);
+	ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, CRST_ALLOC_ORDER);
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


