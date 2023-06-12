Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B592072D22F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547530.855049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8on6-00080y-L1; Mon, 12 Jun 2023 21:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547530.855049; Mon, 12 Jun 2023 21:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8on6-0007x5-AZ; Mon, 12 Jun 2023 21:09:32 +0000
Received: by outflank-mailman (input) for mailman id 547530;
 Mon, 12 Jun 2023 21:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oj0-0007V0-8D
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:18 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5014d41-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:17 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-19fa4346498so2833646fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:17 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:16 -0700 (PDT)
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
X-Inumbo-ID: d5014d41-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603916; x=1689195916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgKyM3Bqye8XIR4cGys6T5IvKp0/wF3iTsg1PUDsTwk=;
        b=qq8ATz7qnjhMI4JQRRPl8nQkZZESoSMSYaIpvAm1fkmTP/hhJtK09QthkQIszdY2en
         Np28aEy4Ap8kQZZkxOILcAkOWFCvtD0mksimPr07l40BlBsZAEhYxeqfdjyxkQeqAOW5
         ZTc2r2EYyhW+/Rjr+ix4rQnVYpkl/uEhOS/VFy3JybVwLZGjn5WR2cf2gk8obwo2CXkB
         sGSrhNlSnOkEM+3mRCKt35MlveZfVuGQGd2P1arrL9+IybQt5wlSdODKjPEGV1dnmgeN
         o5s8QyWZIU5taEap5wETL65HSHBQ11HVjiPK1AO1Q4tVycf+rnHrB5djM+QoDLh7ynuT
         05uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603916; x=1689195916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgKyM3Bqye8XIR4cGys6T5IvKp0/wF3iTsg1PUDsTwk=;
        b=kgYqUdk6An2IOfqrObTLv9GapHR+2K7fSNjzHd4Y67uwO0MBx3VBmJcYP/w6iaXmm5
         8lJHZD1ILMcd8By4pn+c5zFi7t4fHb/QiaMPsyXAVWtNdu7aQjKSv1ZxSnORaOfsiXjb
         Ad1SGqgZVByiqLDFND2qP62q9sv9TIP1JI7lxXdPd1vLrX7qfv45A9TOhnPf9gTbnzjp
         WGDuCB4XM0sR3Mm7EIGm7pdYROlJ5eSlj9MkWsjGARZvyxwsi0zzJsGNEbQvynRWH6Kp
         fybXGLKMr6OQwAcA172nyvgcIT4ZjxrmmcL2hrLAeTh5eOoomin0U07AJUwXVkuxLQsM
         SPQQ==
X-Gm-Message-State: AC+VfDx3ZDc/576eEgGpA+54pU2DxXwHx7Ub9PRk7NwV8/QBUsEppzfY
	Rtv2NDn6GGB7m9SBcsdVbmk=
X-Google-Smtp-Source: ACHHUZ6OvrV5xnmsTMrRhILOepKGCGWLH/CFbB0N6d+Jj1gXGdTSLJ6+yTuiQ99sICG0ABshC/lJaQ==
X-Received: by 2002:a05:6870:955c:b0:1a6:a89b:d8fa with SMTP id v28-20020a056870955c00b001a6a89bd8famr1204093oal.22.1686603916460;
        Mon, 12 Jun 2023 14:05:16 -0700 (PDT)
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
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v4 15/34] x86: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:04 -0700
Message-Id: <20230612210423.18611-16-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to split struct ptdesc from struct page, convert various
functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/x86/mm/pgtable.c | 46 +++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 15a8009a4480..6da7fd5d4782 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -52,7 +52,7 @@ early_param("userpte", setup_userpte);
 
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
-	pgtable_pte_page_dtor(pte);
+	pagetable_pte_dtor(page_ptdesc(pte));
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
+	pagetable_pmd_dtor(ptdesc);
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
+			pagetable_pmd_dtor(ptdesc);
+			pagetable_free(ptdesc);
 			mm_dec_nr_pmds(mm);
 		}
 }
@@ -232,16 +235,21 @@ static int preallocate_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
 		gfp &= ~__GFP_ACCOUNT;
 
 	for (i = 0; i < count; i++) {
-		pmd_t *pmd = (pmd_t *)__get_free_page(gfp);
-		if (!pmd)
+		pmd_t *pmd = NULL;
+		struct ptdesc *ptdesc = pagetable_alloc(gfp, 0);
+
+		if (!ptdesc)
 			failed = true;
-		if (pmd && !pgtable_pmd_page_ctor(virt_to_page(pmd))) {
-			free_page((unsigned long)pmd);
-			pmd = NULL;
+		if (ptdesc && !pagetable_pmd_ctor(ptdesc)) {
+			pagetable_free(ptdesc);
+			ptdesc = NULL;
 			failed = true;
 		}
-		if (pmd)
+		if (ptdesc) {
 			mm_inc_nr_pmds(mm);
+			pmd = ptdesc_address(ptdesc);
+		}
+
 		pmds[i] = pmd;
 	}
 
@@ -830,7 +838,7 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 
 	free_page((unsigned long)pmd_sv);
 
-	pgtable_pmd_page_dtor(virt_to_page(pmd));
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));
 	free_page((unsigned long)pmd);
 
 	return 1;
-- 
2.40.1


