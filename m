Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E406F36D7
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528092.820796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCk-00027d-2X; Mon, 01 May 2023 19:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528092.820796; Mon, 01 May 2023 19:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCj-0001uS-NF; Mon, 01 May 2023 19:28:57 +0000
Received: by outflank-mailman (input) for mailman id 528092;
 Mon, 01 May 2023 19:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCg-0006FS-PO
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:54 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68d01922-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:28:54 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a6762fd23cso23590835ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:54 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:53 -0700 (PDT)
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
X-Inumbo-ID: 68d01922-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969333; x=1685561333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNft63XW9H/x5zK6HuCJK1zZ20bn1woHqcJTdinQF34=;
        b=B5BQ0PUPuJOe03g2Zj4SmcYFdZoHhvQEhjHjXIrDV/cPLgWmHOnGLph27PMtDy+gUk
         vrb8aMyrjxs7+rH+bt4rcFQy1jeum2KTcgeZne4eID9YQx0p8xFIvsQDPlXa9T02F5bm
         XDuuEHyhAFLF/N4HXmu9lHkWjBlAxtCK794Vd1UTAVcPxs1s/UJDMyYjBVgG5TX0KFIE
         Ex1W8v+MyjG1XFcX2NmMKnrKsIeNEQB+OMbajwZPymWFDvUYoyj1bmkkKVL9eBJZnPmo
         n2i7pNy6eK/amTh+JnM4F05ImhBvIH/eExR134Xtgm68Uv7no3ItCNvBtZlMVAsp6dYE
         5mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969333; x=1685561333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNft63XW9H/x5zK6HuCJK1zZ20bn1woHqcJTdinQF34=;
        b=GJRWvVXqAfm2Q3W6BrbcOXznaet/bQRSDTNp+s1ufU6N0PY2IIIsMLTyImcRrscl2J
         7YdOhzS0vXYS9IPptz6/hbUOBpY4lC0tdE/qBeT7EaUvdJMMCu/hr3PhS8HvZ1Hqb9Fy
         i6yg+CfnKrAdMOEfkcy82zUAhMfMOiNRadoItvyWusYLDz0ehuQ1ihe0Vqb8k1FSUSSa
         kesfoEC/xymiM15VebVNGfU+j1MpAI+31+BSgdU2yXGQDN5POk8pMfVzW/wgns8a+qut
         N38dkRKTpoOHOLgEDnKtJfR84/RSoDmXUAlC8TtkYLey+lWSJ3piiNx0hYxj45Vmc/GI
         fqQQ==
X-Gm-Message-State: AC+VfDwURP2mL+gOsyuOSBKfuVvlR8vlFxA1aOFfnaZoCqXGSngItES7
	UZW73UxQFUvAskYfx8m42xM=
X-Google-Smtp-Source: ACHHUZ5/VRaG2onpIf15XR/3p6i4VphUhlpU8l14iUMmxT/o+LeZ6COrGbtS8DM/yhDOMNorlLAd2g==
X-Received: by 2002:a17:902:d48b:b0:1a6:ef75:3c53 with SMTP id c11-20020a170902d48b00b001a6ef753c53mr18457119plg.11.1682969333517;
        Mon, 01 May 2023 12:28:53 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v2 14/34] powerpc: Convert various functions to use ptdescs
Date: Mon,  1 May 2023 12:28:09 -0700
Message-Id: <20230501192829.17086-15-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to split struct ptdesc from struct page, convert various
functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/powerpc/mm/book3s64/mmu_context.c | 10 +++---
 arch/powerpc/mm/book3s64/pgtable.c     | 32 +++++++++---------
 arch/powerpc/mm/pgtable-frag.c         | 46 +++++++++++++-------------
 3 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index c766e4c26e42..b22ad2839897 100644
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
+		ptdesc_pmd_dtor(ptdesc);
+		ptdesc_free(ptdesc);
 	}
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 85c84e89e3ea..da46e3efc66c 100644
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
+	ptdesc = ptdesc_alloc(gfp, 0);
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pmd_page_ctor(page)) {
-		__free_pages(page, 0);
+	if (!ptdesc_pmd_ctor(ptdesc)) {
+		ptdesc_free(ptdesc);
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
+	if (ptdesc_is_reserved(ptdesc))
+		return free_reserved_ptdesc(ptdesc);
 
-	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
-		pgtable_pmd_page_dtor(page);
-		__free_page(page);
+	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
+	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
+		ptdesc_pmd_dtor(ptdesc);
+		ptdesc_free(ptdesc);
 	}
 }
 
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 20652daa1d7e..b53e18fab74a 100644
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
+		ptdesc_pte_dtor(ptdesc);
+		ptdesc_free(ptdesc);
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
+		ptdesc = ptdesc_alloc(PGALLOC_GFP | __GFP_ACCOUNT, 0);
+		if (!ptdesc)
 			return NULL;
-		if (!pgtable_pte_page_ctor(page)) {
-			__free_page(page);
+		if (!ptdesc_pte_ctor(ptdesc)) {
+			ptdesc_free(ptdesc);
 			return NULL;
 		}
 	} else {
-		page = alloc_page(PGALLOC_GFP);
-		if (!page)
+		ptdesc = ptdesc_alloc(PGALLOC_GFP, 0);
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
@@ -108,15 +108,15 @@ pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
 
 void pte_fragment_free(unsigned long *table, int kernel)
 {
-	struct page *page = virt_to_page(table);
+	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	if (PageReserved(page))
-		return free_reserved_page(page);
+	if (ptdesc_is_reserved(ptdesc))
+		return free_reserved_ptdesc(ptdesc);
 
-	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
+	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
+	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
 		if (!kernel)
-			pgtable_pte_page_dtor(page);
-		__free_page(page);
+			ptdesc_pte_dtor(ptdesc);
+		ptdesc_free(ptdesc);
 	}
 }
-- 
2.39.2


