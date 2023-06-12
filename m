Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E172D23B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547566.855180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onS-0004gf-Gj; Mon, 12 Jun 2023 21:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547566.855180; Mon, 12 Jun 2023 21:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onR-0004Y6-Rs; Mon, 12 Jun 2023 21:09:53 +0000
Received: by outflank-mailman (input) for mailman id 547566;
 Mon, 12 Jun 2023 21:09:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojM-0007zJ-Px
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:40 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e23cc4a2-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:39 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-56d05daf0d5so24884227b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:39 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:38 -0700 (PDT)
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
X-Inumbo-ID: e23cc4a2-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603939; x=1689195939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0T5hRMJMhyAQcr70NSN00ZodxImAvN36JhDkpGUyhY=;
        b=hFoqvf/V9d8VqdB1r7rkRWq3dicIimOQySgVHkIAvwFL0Mu8+p1N/1GXYk20QCUvFC
         OBvHXqLIwjKUW/Cg2L8TmdMFxaZ6erl8dDsxPeG4KHBkNdpNt+SDRM/fp02BIXhlhRFh
         zXyh4Ur2o3sR1wLNSv+RjLnPdgEzgFATa4g2Xg+LDMcjUjKcFkx+ifp4/8Lyr5+rSxVP
         +jDDkF8+0sKN+s4pK+Y7LtIDDsq1fD/1mjzcxIj0x+6U6FJXpEaUQtkvK0KHsh7xRlWs
         1TqkCn6ISt1EZJ2kze1cJk8ZhVzPLe93moWp6KpJkfCGbbls5KNPHYDQvJaFIhhqzRGm
         8czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603939; x=1689195939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0T5hRMJMhyAQcr70NSN00ZodxImAvN36JhDkpGUyhY=;
        b=X6iFfPLfPpCnTVkxWd2AAWle/Jiv44MHo+7/zaSaSSr2LW6pbDgtRq7jVH4273TZqq
         W7HYN3+r1iSTkLkgzpquYKygFCVeyb6JIbqA4BMtC1V/LFDMv3RiW57jae6HhCIS/NIN
         pkkUXyUcC/xBmE7M5XhfYukBGBv2VP3t6U7NFonV4fn+wmQGMKWOGHIrhijtBrlK3XBb
         GNu6Myeqc/iSHpk0mbBhXbU61RkiyLacYF2q4nnW+k8yyVIBXk2fKm3WlO6tcaP4eoal
         4aG3fadmanLnPH0WrecC6ZxLM82mw6qIRhxxVVEfUzqU3ikWYXydKJ/rgGVHQ9uCJsEI
         1lsA==
X-Gm-Message-State: AC+VfDwcOrzLwxhyKiTreyGfv2kG/90RAC256ng+A2k2/Md5KDPBRGY1
	+IPO+aut1pdNx+31hTzYJUM=
X-Google-Smtp-Source: ACHHUZ7R4s+2aZ6dyK9NB/h4GJ1OeGFjhnSrFQqFV2mTnMsc5RahC9DLUvZ1Ug17YsYVh0NwNxMgmQ==
X-Received: by 2002:a0d:e2c7:0:b0:56c:f6cd:7b55 with SMTP id l190-20020a0de2c7000000b0056cf6cd7b55mr7964257ywe.6.1686603938725;
        Mon, 12 Jun 2023 14:05:38 -0700 (PDT)
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v4 26/34] mips: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:15 -0700
Message-Id: <20230612210423.18611-27-vishal.moola@gmail.com>
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
 arch/mips/include/asm/pgalloc.h | 31 +++++++++++++++++--------------
 arch/mips/mm/pgtable.c          |  7 ++++---
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index f72e737dda21..6940e5536664 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -51,13 +51,13 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_pages((unsigned long)pgd, PGD_TABLE_ORDER);
+	pagetable_free(virt_to_ptdesc(pgd));
 }
 
-#define __pte_free_tlb(tlb,pte,address)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -65,18 +65,18 @@ do {							\
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pmd_t *pmd;
-	struct page *pg;
+	struct ptdesc *ptdesc;
 
-	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
-	if (!pg)
+	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
+	if (!ptdesc)
 		return NULL;
 
-	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_pages(pg, PMD_TABLE_ORDER);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	pmd = (pmd_t *)page_address(pg);
+	pmd = ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -90,10 +90,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
 
-	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_TABLE_ORDER);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
index b13314be5d0e..729258ff4e3b 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -10,10 +10,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PGD_TABLE_ORDER);
 
-	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_TABLE_ORDER);
-	if (ret) {
+	if (ptdesc) {
+		ret = ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1


