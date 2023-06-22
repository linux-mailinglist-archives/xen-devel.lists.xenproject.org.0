Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DF73AA43
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554036.865094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRP5-00038v-UA; Thu, 22 Jun 2023 20:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554036.865094; Thu, 22 Jun 2023 20:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRP5-000345-Gu; Thu, 22 Jun 2023 20:59:43 +0000
Received: by outflank-mailman (input) for mailman id 554036;
 Thu, 22 Jun 2023 20:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCROE-0006Mq-E4
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:50 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9565da2c-113f-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 22:58:48 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-bff27026cb0so2083650276.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:48 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:47 -0700 (PDT)
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
X-Inumbo-ID: 9565da2c-113f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467528; x=1690059528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2eVDlXL8alglJUGVXcc8JA7ix0brgT+4DYqdXjkOuM=;
        b=DbS/FVmft5J2VICO+Nf92XNy2wvgGSGG4msWs7E9V6KxYzm+tSzGTprRX7LY1Az4z2
         YpRpjh1gFRRLJ/li9beG6PIvlUHG9ZRwTYplGkWymenSAyOrWC24owgK1fhjKR3yrEtN
         hDpVadLC+93vTqzcu4H8sHAK66wH4JJJgH7pIr7Eko07frtpGYI2AQVOUDXreCJkOXFd
         1tssjWaKiQ/O8SbW0+/XdEB5l3eXLYaeBTMZyr+OokbQWbFNHBYbcUGqZxcWlMHvdqKX
         xSAVDlOu/6aRWjk6xB/QGaUjzCCA1KdGOVBnKZ7vKSpcGAQnSE9HW2pjZqAURJ5Ds3lR
         MAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467528; x=1690059528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2eVDlXL8alglJUGVXcc8JA7ix0brgT+4DYqdXjkOuM=;
        b=LKr1UGMdXN28Xk1olPyj9tsmVd43nX2SKHXOluEJZdujd/cu2FHnYmW634nqljtQJO
         fYgSTHVy1Ts18dGGcbKfTh6E6HIUXIS8Yd1eZfRikNDZAwEfPOFjonkY87YRwIUxpvn3
         3ZnsShDvtRxwqehCaR7E/iODDWcUi5FWnHveNJOan1e7FPp95/5Rq0H/jWZIpeWpXhO2
         glY2yoLqVyNkNFsdmBHfNpYtwOum0Liqk8/MGeC6v6X1FjUmSa1Mk5DC0AUPPQq3iQtb
         dTjj7tN/iOfhxLO163Rb52FGSuhAxacDGXAd6BxkV13qaBgSvmjJyFzj9Tek3SRZqrJk
         NKZA==
X-Gm-Message-State: AC+VfDzas8qOhKxBEObRxNpsxx5pMW7wEP31NV355R9WeTMwpSRxGI7O
	D7KvNqnyuG46gvqyA0D3Y2s=
X-Google-Smtp-Source: ACHHUZ6vkVdQ+2aFbexAEsw0zpg6DZHD2/vRtLHLUIl/mOJbyXKI4RGZmCd4L5PdfTZt6ngBy4nBHA==
X-Received: by 2002:a25:44d:0:b0:bfe:e65b:cd1 with SMTP id 74-20020a25044d000000b00bfee65b0cd1mr5470842ybe.46.1687467527711;
        Thu, 22 Jun 2023 13:58:47 -0700 (PDT)
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 25/33] mips: Convert various functions to use ptdescs
Date: Thu, 22 Jun 2023 13:57:37 -0700
Message-Id: <20230622205745.79707-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/mips/include/asm/pgalloc.h | 32 ++++++++++++++++++--------------
 arch/mips/mm/pgtable.c          |  8 +++++---
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index f72e737dda21..40e40a7eb94a 100644
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
@@ -90,10 +90,14 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM,
+			PUD_TABLE_ORDER);
 
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
index b13314be5d0e..1506e458040d 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -10,10 +10,12 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM,
+			PGD_TABLE_ORDER);
 
-	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_TABLE_ORDER);
-	if (ret) {
+	if (ptdesc) {
+		ret = ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1


