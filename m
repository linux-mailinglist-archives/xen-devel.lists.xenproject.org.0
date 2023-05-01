Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BE96F36D9
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528094.820814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCn-0002q0-03; Mon, 01 May 2023 19:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528094.820814; Mon, 01 May 2023 19:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCm-0002je-7T; Mon, 01 May 2023 19:29:00 +0000
Received: by outflank-mailman (input) for mailman id 528094;
 Mon, 01 May 2023 19:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCk-0006PY-7V
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:58 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69c3c029-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:28:56 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aad5245632so16554975ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:56 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:54 -0700 (PDT)
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
X-Inumbo-ID: 69c3c029-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969335; x=1685561335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Q5rpHIbLtPdsxzDzaO3buqXOd2yqrT0Z007lfiZkpI=;
        b=AxAga4aoXPNlXE7+DeUiTXETzfeeCHbm4zGppPqr1MDTZFxhWAViYrGbWyE6GLWt+9
         IB0rpQEMaD7N9ypKiOPbsaINcslUNsYjGQTG5q5vWeCnFZgA7dcIKUsRPd84RGXai5h1
         l16CjSDmsfosD9KMmdT6xq8VRCXKZ9G6YKbNHAZjIZoU/NfYHkwEKIBnMm9mpAHGxSXg
         2woYY+DxDFTOnXL4g3fftw/6LCcjY+gzdniMaWURcfFDuyLcW5IhoWI0SL4yBh+tQBiv
         tdoOcx5iHNlwMY/jUOXeVBpbt3BPtJyBIMif2r3nZba5xvX4tcuGQGviD0d/uLbj9ohj
         JJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969335; x=1685561335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Q5rpHIbLtPdsxzDzaO3buqXOd2yqrT0Z007lfiZkpI=;
        b=iIDxCuXmkCtevPZmrt/SpgfbY2BurQRE/8Ac/hZroXM0zFPO5b/szZ0/rwmQrgIDZZ
         VAG9QaqiWBSipFB7JokAaaL4R8D5al4GXJgcHmCN4bcforAd1mCD9JNbt2/SQa/QxY04
         9oqH3pjLsGoFc08Wi4r/yxzDW0fnQxyWqEp59HwsoxyhQsisQSbbbqfiV9pKUmbCANtF
         2ZaiBAYybP3MxiIYoOSwJjmj/vCYIayQTefMuhAXiDHZMLqCQU7gldZrAgOwQ9pcmdki
         sa8I9ao21QUHS53ZEiovlUmTrO/h/8Kjm8hw7D+nO9f75pD29l587nBKyxHC5mMr77cb
         Kq8w==
X-Gm-Message-State: AC+VfDwsby8YXMbikQLVUKvh7muDEZzigsprrSxxoQiClz9FhBOk+baL
	eN8M4919d0BTCOOYpU0PwfM=
X-Google-Smtp-Source: ACHHUZ70tPtnwybaj+jIE0QGoYPcdHCYjv99qqOX/zc6uUXZ1o0XGtKwgumEUC29ZoX/UBhdbXOt+g==
X-Received: by 2002:a17:903:41d0:b0:1ab:12a:bd2e with SMTP id u16-20020a17090341d000b001ab012abd2emr2887995ple.37.1682969334945;
        Mon, 01 May 2023 12:28:54 -0700 (PDT)
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
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v2 15/34] x86: Convert various functions to use ptdescs
Date: Mon,  1 May 2023 12:28:10 -0700
Message-Id: <20230501192829.17086-16-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to split struct ptdesc from struct page, convert various
functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use ptdesc_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/x86/mm/pgtable.c | 46 +++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index afab0bc7862b..9b6f81c8eb32 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -52,7 +52,7 @@ early_param("userpte", setup_userpte);
 
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
-	pgtable_pte_page_dtor(pte);
+	ptdesc_pte_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
 	paravirt_tlb_remove_table(tlb, pte);
 }
@@ -60,7 +60,7 @@ void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 #if CONFIG_PGTABLE_LEVELS > 2
 void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 {
-	struct page *page = virt_to_page(pmd);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 	paravirt_release_pmd(__pa(pmd) >> PAGE_SHIFT);
 	/*
 	 * NOTE! For PAE, any changes to the top page-directory-pointer-table
@@ -69,8 +69,8 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	pgtable_pmd_page_dtor(page);
-	paravirt_tlb_remove_table(tlb, page);
+	ptdesc_pmd_dtor(ptdesc);
+	paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
@@ -92,16 +92,16 @@ void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 
 static inline void pgd_list_add(pgd_t *pgd)
 {
-	struct page *page = virt_to_page(pgd);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
 
-	list_add(&page->lru, &pgd_list);
+	list_add(&ptdesc->pt_list, &pgd_list);
 }
 
 static inline void pgd_list_del(pgd_t *pgd)
 {
-	struct page *page = virt_to_page(pgd);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
 
-	list_del(&page->lru);
+	list_del(&ptdesc->pt_list);
 }
 
 #define UNSHARED_PTRS_PER_PGD				\
@@ -112,12 +112,12 @@ static inline void pgd_list_del(pgd_t *pgd)
 
 static void pgd_set_mm(pgd_t *pgd, struct mm_struct *mm)
 {
-	virt_to_page(pgd)->pt_mm = mm;
+	virt_to_ptdesc(pgd)->pt_mm = mm;
 }
 
 struct mm_struct *pgd_page_get_mm(struct page *page)
 {
-	return page->pt_mm;
+	return page_ptdesc(page)->pt_mm;
 }
 
 static void pgd_ctor(struct mm_struct *mm, pgd_t *pgd)
@@ -213,11 +213,14 @@ void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmd)
 static void free_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
 {
 	int i;
+	struct ptdesc *ptdesc;
 
 	for (i = 0; i < count; i++)
 		if (pmds[i]) {
-			pgtable_pmd_page_dtor(virt_to_page(pmds[i]));
-			free_page((unsigned long)pmds[i]);
+			ptdesc = virt_to_ptdesc(pmds[i]);
+
+			ptdesc_pmd_dtor(ptdesc);
+			ptdesc_free(ptdesc);
 			mm_dec_nr_pmds(mm);
 		}
 }
@@ -232,16 +235,21 @@ static int preallocate_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
 		gfp &= ~__GFP_ACCOUNT;
 
 	for (i = 0; i < count; i++) {
-		pmd_t *pmd = (pmd_t *)__get_free_page(gfp);
-		if (!pmd)
+		pmd_t *pmd = NULL;
+		struct ptdesc *ptdesc = ptdesc_alloc(gfp, 0);
+
+		if (!ptdesc)
 			failed = true;
-		if (pmd && !pgtable_pmd_page_ctor(virt_to_page(pmd))) {
-			free_page((unsigned long)pmd);
-			pmd = NULL;
+		if (ptdesc && !ptdesc_pmd_ctor(ptdesc)) {
+			ptdesc_free(ptdesc);
+			ptdesc = NULL;
 			failed = true;
 		}
-		if (pmd)
+		if (ptdesc) {
 			mm_inc_nr_pmds(mm);
+			pmd = (pmd_t *)ptdesc_address(ptdesc);
+		}
+
 		pmds[i] = pmd;
 	}
 
@@ -838,7 +846,7 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 
 	free_page((unsigned long)pmd_sv);
 
-	pgtable_pmd_page_dtor(virt_to_page(pmd));
+	ptdesc_pmd_dtor(virt_to_ptdesc(pmd));
 	free_page((unsigned long)pmd);
 
 	return 1;
-- 
2.39.2


