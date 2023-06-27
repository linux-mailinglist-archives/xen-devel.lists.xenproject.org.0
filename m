Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180A73F21E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555733.867796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEo-0004JC-39; Tue, 27 Jun 2023 03:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555733.867796; Tue, 27 Jun 2023 03:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEn-0004EY-OV; Tue, 27 Jun 2023 03:19:29 +0000
Received: by outflank-mailman (input) for mailman id 555733;
 Tue, 27 Jun 2023 03:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBR-0003pv-Nt
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:16:01 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f02bddc7-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:15:59 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5707b429540so62186137b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:59 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:58 -0700 (PDT)
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
X-Inumbo-ID: f02bddc7-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835758; x=1690427758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAg5qbCpsu4QeXC2CiYcNVSx9jEaugPagVbNncebk84=;
        b=HwE9+CZ1/MplCMi7Dd3y6gsJURyNL7dWtCmym2tEO6RLfYDnkDNvgC79iMqV9euLNn
         oVO0tEUHDhiP0KRiFP5iP4q3wggvsZxNdlBp3O9pE0RV47pjcEcaBTmVZLvdVziVmkiN
         gnSeJULzSpSwzOVkoSp8BjrvY4/vuL0/IWrHFgVmjaO0yw1AUh35UrvuuREuQfZ+tpcw
         9rFnkC2jafbB81zXFV2qvI6ZqjiQ1IYXHHbUsS7aTvWca4xplkb3IO0wrERoA+osEcaT
         dwBDuf+P0WX2zQaokYGQLzNk5fMi+yQC6tDn43/lzPeNFLEgDUuF9Wyio0Rv0IcsuBq4
         Vk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835758; x=1690427758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAg5qbCpsu4QeXC2CiYcNVSx9jEaugPagVbNncebk84=;
        b=I4thY+u9L1BTrdO4OVpA0eWv1cDMJS+CkA/yLU51A9P1WCy1u3NPkNfal/ggxX5zin
         DST9YCrRp2RTiQtVanpbZ+Nq/50SUWt7RxsB6xLDTGr4ayLMA7jSUgCdJl3rG9Ni6wJD
         3rTQN+8giDg/KhzEVoEGEcEGAoM0Qd193y8/agQpwIQRpvD5n0OXLAhdDQXx98Yevj/Q
         mrv4iiYlloSzwZcmLbDf3ODIzgNDFDn53FxFXP4pUozNTcDhamgzJOgSs+fQhy7C7pJr
         Fx/vbzB4lrE0VfpUSXkLqFcd3ApCL0T//86eQMSLwVBg11kRE6TUnM/WuXSDpgb4JHae
         B4Qw==
X-Gm-Message-State: AC+VfDyupJarVuhoajzVFmpd+drrYsLnEFwrap5ZelTGDCkBlvJyfC8R
	7Ec6xLeEwczc8R/8mUFcts0=
X-Google-Smtp-Source: ACHHUZ5t5DVTD+g/5WvyBpKjpLFbmoJ8U0LjdfQz8YgnU+ZmoVAy6rR6pXI+3pmYZp1NNhYIufsQrw==
X-Received: by 2002:a0d:e657:0:b0:569:ef2b:e20 with SMTP id p84-20020a0de657000000b00569ef2b0e20mr35915592ywe.23.1687835758576;
        Mon, 26 Jun 2023 20:15:58 -0700 (PDT)
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
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v6 24/33] m68k: Convert various functions to use ptdescs
Date: Mon, 26 Jun 2023 20:14:22 -0700
Message-Id: <20230627031431.29653-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/mcf_pgalloc.h  | 47 ++++++++++++++--------------
 arch/m68k/include/asm/sun3_pgalloc.h |  8 ++---
 arch/m68k/mm/motorola.c              |  4 +--
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
index 5c2c0a864524..302c5bf67179 100644
--- a/arch/m68k/include/asm/mcf_pgalloc.h
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -5,22 +5,22 @@
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
 
-extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 {
-	free_page((unsigned long) pte);
+	pagetable_free(virt_to_ptdesc(pte));
 }
 
 extern const char bad_pmd_string[];
 
-extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
+static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
-	unsigned long page = __get_free_page(GFP_DMA);
+	struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | __GFP_ZERO) &
+			~__GFP_HIGHMEM, 0);
 
-	if (!page)
+	if (!ptdesc)
 		return NULL;
 
-	memset((void *)page, 0, PAGE_SIZE);
-	return (pte_t *) (page);
+	return ptdesc_address(ptdesc);
 }
 
 extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
@@ -35,36 +35,34 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
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
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | __GFP_ZERO, 0);
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
-
+	pte = ptdesc_address(ptdesc);
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
@@ -75,16 +73,19 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_page((unsigned long) pgd);
+	pagetable_free(virt_to_ptdesc(pgd));
 }
 
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *new_pgd;
+	struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | __GFP_NOWARN) &
+			~__GFP_HIGHMEM, 0);
 
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


