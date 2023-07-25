Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA0760877
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569391.890018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dt-0004Q7-Ll; Tue, 25 Jul 2023 04:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569391.890018; Tue, 25 Jul 2023 04:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dt-00047h-2T; Tue, 25 Jul 2023 04:27:25 +0000
Received: by outflank-mailman (input) for mailman id 569391;
 Tue, 25 Jul 2023 04:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9YE-00023t-Mb
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:34 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc087547-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:32 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-cc4f4351ac7so5617288276.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:31 -0700 (PDT)
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
X-Inumbo-ID: bc087547-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258892; x=1690863692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u45KHTw4Lm2isFbqg98Xq6aGMxdNGIm/kUbyd7vxsNs=;
        b=MFgPFIETcyQZFOhpw8+4f5zUQ0n+xg0tLu3Cdkb+1dejjtG9+Sn41JCWtxba3EUBon
         STSpvH1MNNsW6So+a/tghvNI+G/Lbgp5MhbOWzErRXRSurAquyDZtOdk2dZXP+K84d5y
         2lj+wM84jK4/KJI/eNnwRBO0/O9yXdLYbiUEV5UJ1n3RcSGR2Pu1ZBK+tTmCkEf8+hqQ
         1ItBCZtJ+JMmJlssaP+CTZzrVD9IabvE2unI85k4nMXIrER2uiyvsKz70ElKaAXIai8Y
         fMscO6ZRlYBmd8LI9oEQGQcnOb2XkEpfo9N2EgAc0FnMq++qauCUPViA0CXIrh8vRr/Z
         vicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258892; x=1690863692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u45KHTw4Lm2isFbqg98Xq6aGMxdNGIm/kUbyd7vxsNs=;
        b=jmwGF8+3Uf58uUBzURi8GHVv1+R/j43zMN7+NPQ0MpnsFZilNZztYKBkphPGyUaLQ2
         rN6hkk1sJfplXWeB827amjHbLoCxpeu8AfmdgorX0tAkpU7TRvv8HVdiC8QvXUsnEBZ/
         krNWx6axYi58tB5YXQXXj5z9zci2G1zhu+YVDnVEPynDGqSuQUo1zVd1GZipfFrGLA0u
         5WKg8AzKyVjothkzvC8qIE/hZ3vVQ+Wyc5Cqo6CrItL1rnRCdtJ7cJcIAwkui/bRkdCS
         3fL7W53PI6irrD1VhjGYNjpKJNVBRY+Yl2KZFhFUEk0Q2rYo3xlPV0imBgt/S2+sSnAq
         s/yw==
X-Gm-Message-State: ABy/qLbu89wa+AwDSxnfvcWxXbnF8RxboI4YFPF4Z3ievTG0jV1q6a0F
	MLHiW1Fc27KWrLoJu5rVr5g=
X-Google-Smtp-Source: APBJJlGXFehjpASX0xXxIrGyQXSgIbPf3Ytm7rdvcIS221Bu6qToSpB5aWuJ/dgS8MuNc8IFsSfnXw==
X-Received: by 2002:a25:7082:0:b0:d10:a134:adde with SMTP id l124-20020a257082000000b00d10a134addemr4056715ybc.53.1690258891680;
        Mon, 24 Jul 2023 21:21:31 -0700 (PDT)
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 12/31] powerpc: Convert various functions to use ptdescs
Date: Mon, 24 Jul 2023 21:20:32 -0700
Message-Id: <20230725042051.36691-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to split struct ptdesc from struct page, convert various
functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/mm/book3s64/mmu_context.c | 10 ++---
 arch/powerpc/mm/book3s64/pgtable.c     | 32 +++++++--------
 arch/powerpc/mm/pgtable-frag.c         | 56 +++++++++++++-------------
 3 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index c766e4c26e42..1715b07c630c 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -246,15 +246,15 @@ static void destroy_contexts(mm_context_t *ctx)
 static void pmd_frag_destroy(void *pmd_frag)
 {
 	int count;
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = virt_to_page(pmd_frag);
+	ptdesc = virt_to_ptdesc(pmd_frag);
 	/* drop all the pending references */
 	count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
-	if (atomic_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
-		pgtable_pmd_page_dtor(page);
-		__free_page(page);
+	if (atomic_sub_and_test(PMD_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
+		pagetable_pmd_dtor(ptdesc);
+		pagetable_free(ptdesc);
 	}
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 85c84e89e3ea..1212deeabe15 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -306,22 +306,22 @@ static pmd_t *get_pmd_from_cache(struct mm_struct *mm)
 static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
 {
 	void *ret = NULL;
-	struct page *page;
+	struct ptdesc *ptdesc;
 	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO;
 
 	if (mm == &init_mm)
 		gfp &= ~__GFP_ACCOUNT;
-	page = alloc_page(gfp);
-	if (!page)
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pmd_page_ctor(page)) {
-		__free_pages(page, 0);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	atomic_set(&page->pt_frag_refcount, 1);
+	atomic_set(&ptdesc->pt_frag_refcount, 1);
 
-	ret = page_address(page);
+	ret = ptdesc_address(ptdesc);
 	/*
 	 * if we support only one fragment just return the
 	 * allocated page.
@@ -331,12 +331,12 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
 
 	spin_lock(&mm->page_table_lock);
 	/*
-	 * If we find pgtable_page set, we return
+	 * If we find ptdesc_page set, we return
 	 * the allocated page with single fragment
 	 * count.
 	 */
 	if (likely(!mm->context.pmd_frag)) {
-		atomic_set(&page->pt_frag_refcount, PMD_FRAG_NR);
+		atomic_set(&ptdesc->pt_frag_refcount, PMD_FRAG_NR);
 		mm->context.pmd_frag = ret + PMD_FRAG_SIZE;
 	}
 	spin_unlock(&mm->page_table_lock);
@@ -357,15 +357,15 @@ pmd_t *pmd_fragment_alloc(struct mm_struct *mm, unsigned long vmaddr)
 
 void pmd_fragment_free(unsigned long *pmd)
 {
-	struct page *page = virt_to_page(pmd);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
-	if (PageReserved(page))
-		return free_reserved_page(page);
+	if (pagetable_is_reserved(ptdesc))
+		return free_reserved_ptdesc(ptdesc);
 
-	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
-		pgtable_pmd_page_dtor(page);
-		__free_page(page);
+	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
+	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
+		pagetable_pmd_dtor(ptdesc);
+		pagetable_free(ptdesc);
 	}
 }
 
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 0c6b68130025..4c899c9c0694 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -18,15 +18,15 @@
 void pte_frag_destroy(void *pte_frag)
 {
 	int count;
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = virt_to_page(pte_frag);
+	ptdesc = virt_to_ptdesc(pte_frag);
 	/* drop all the pending references */
 	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
-	if (atomic_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
-		pgtable_pte_page_dtor(page);
-		__free_page(page);
+	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
+		pagetable_pte_dtor(ptdesc);
+		pagetable_free(ptdesc);
 	}
 }
 
@@ -55,25 +55,25 @@ static pte_t *get_pte_from_cache(struct mm_struct *mm)
 static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
 {
 	void *ret = NULL;
-	struct page *page;
+	struct ptdesc *ptdesc;
 
 	if (!kernel) {
-		page = alloc_page(PGALLOC_GFP | __GFP_ACCOUNT);
-		if (!page)
+		ptdesc = pagetable_alloc(PGALLOC_GFP | __GFP_ACCOUNT, 0);
+		if (!ptdesc)
 			return NULL;
-		if (!pgtable_pte_page_ctor(page)) {
-			__free_page(page);
+		if (!pagetable_pte_ctor(ptdesc)) {
+			pagetable_free(ptdesc);
 			return NULL;
 		}
 	} else {
-		page = alloc_page(PGALLOC_GFP);
-		if (!page)
+		ptdesc = pagetable_alloc(PGALLOC_GFP, 0);
+		if (!ptdesc)
 			return NULL;
 	}
 
-	atomic_set(&page->pt_frag_refcount, 1);
+	atomic_set(&ptdesc->pt_frag_refcount, 1);
 
-	ret = page_address(page);
+	ret = ptdesc_address(ptdesc);
 	/*
 	 * if we support only one fragment just return the
 	 * allocated page.
@@ -82,12 +82,12 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
 		return ret;
 	spin_lock(&mm->page_table_lock);
 	/*
-	 * If we find pgtable_page set, we return
+	 * If we find ptdesc_page set, we return
 	 * the allocated page with single fragment
 	 * count.
 	 */
 	if (likely(!pte_frag_get(&mm->context))) {
-		atomic_set(&page->pt_frag_refcount, PTE_FRAG_NR);
+		atomic_set(&ptdesc->pt_frag_refcount, PTE_FRAG_NR);
 		pte_frag_set(&mm->context, ret + PTE_FRAG_SIZE);
 	}
 	spin_unlock(&mm->page_table_lock);
@@ -108,28 +108,28 @@ pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
 
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
 
 void pte_fragment_free(unsigned long *table, int kernel)
 {
-	struct page *page = virt_to_page(table);
+	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	if (PageReserved(page))
-		return free_reserved_page(page);
+	if (pagetable_is_reserved(ptdesc))
+		return free_reserved_ptdesc(ptdesc);
 
 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
+	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
 		if (kernel)
-			__free_page(page);
-		else if (TestClearPageActive(page))
-			call_rcu(&page->rcu_head, pte_free_now);
+			pagetable_free(ptdesc);
+		else if (folio_test_clear_active(ptdesc_folio(ptdesc)))
+			call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
 		else
-			pte_free_now(&page->rcu_head);
+			pte_free_now(&ptdesc->pt_rcu_head);
 	}
 }
 
-- 
2.40.1


