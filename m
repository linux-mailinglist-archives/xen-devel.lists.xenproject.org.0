Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56C6F384B
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528189.821088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZNG-0004gg-Lk; Mon, 01 May 2023 19:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528189.821088; Mon, 01 May 2023 19:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZNG-0004Zt-Bn; Mon, 01 May 2023 19:39:50 +0000
Received: by outflank-mailman (input) for mailman id 528189;
 Mon, 01 May 2023 19:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZD2-0006PY-OK
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:16 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7215b18d-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:29:10 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1aaec9ad820so16454975ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:10 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:08 -0700 (PDT)
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
X-Inumbo-ID: 7215b18d-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969349; x=1685561349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pf7K/iFMD6od7/SRYpuPsYcodkkXMgOdjXv5YJvZldk=;
        b=Ln4mDR/5PqhQgedxrHvQljALDEWoa3b+hRIGv35D/XEQopkojKeYky16q/KJiQP190
         gOXMLkWlsxRYt/qNbMMHduRgO5rwSHkWxXdTawxJdNC4w4aAhizbEp/u5yJIFvo+hvkC
         CzCza/yOOV7wQ3CRXlPMEZ6eMm1zhczAF9AJlp92How5r4l3oEpl8xhmNNQZ5IRuQriJ
         5iq8Jlorps05Qifajbp6RIvsWCW3JV3LIBqvQ7RLXCzoWQn8RP/izc4h1lgdgQ7smZ+o
         cGeex+nu9iv1OEbJv0WRRlF1TRZ+PJHxnItl8vKiR8iqu8w5u+UliAsQ4ZVuON7yHbns
         fmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969349; x=1685561349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pf7K/iFMD6od7/SRYpuPsYcodkkXMgOdjXv5YJvZldk=;
        b=KhZtg5sjhEFLZeizPlqdgud7VhP47V8DLrB0V/lGqvKm1ehWVsuguphCTLXFRrIDvc
         hWzgrrVCofJTVSIyERppe9fz6zdyC2uzyX+MbC9NPCa7xfUes4why3JN7VsFJmntbD9r
         5nG7afGhRDpnTs3iStct+b/HscbyALIqB1kUNp04PImtOFSDG+4MSnO8Sb0zZXxCbAX7
         drh+R+kurgzvA4lFmGuSbmyTg5Gc9HwYmWAxfYMcBeEnr6f0ECZHeFt+t5yJFmbrFEJJ
         yheCLbiNoBrmH8u0JBFQu4pB+a99ZGrnGZodlEhLxOIr+69LXFK4dX0Dn5uc/Wyn9zOG
         LcGA==
X-Gm-Message-State: AC+VfDybrLnsXvHEtnIsYpYBg1+GzSpLDycKVuiXi1C4s/6hlsOi2tWG
	CuSqUfkcx2AbK53XMKo10o2g2Krei6drKeSA
X-Google-Smtp-Source: ACHHUZ4pGEgDP0ct3SBtbJjK9qWlsOBNKoJkb8hPo4/muNsqGBXZA1NHW06v64HPJmj4Ckit7F5PBA==
X-Received: by 2002:a17:903:2352:b0:1aa:ed6f:29c2 with SMTP id c18-20020a170903235200b001aaed6f29c2mr6827893plh.11.1682969349038;
        Mon, 01 May 2023 12:29:09 -0700 (PDT)
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
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v2 24/34] loongarch: Convert various functions to use ptdescs
Date: Mon,  1 May 2023 12:28:19 -0700
Message-Id: <20230501192829.17086-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use ptdesc_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/loongarch/include/asm/pgalloc.h | 27 +++++++++++++++------------
 arch/loongarch/mm/pgtable.c          |  7 ++++---
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index af1d1e4a6965..1fe074f85b6b 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -45,9 +45,9 @@ extern void pagetable_init(void);
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -55,18 +55,18 @@ do {							\
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pmd_t *pmd;
-	struct page *pg;
+	struct ptdesc *ptdesc;
 
-	pg = alloc_page(GFP_KERNEL_ACCOUNT);
-	if (!pg)
+	ptdesc = ptdesc_alloc(GFP_KERNEL_ACCOUNT, 0);
+	if (!ptdesc)
 		return NULL;
 
-	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_page(pg);
+	if (!ptdesc_pmd_ctor(ptdesc)) {
+		ptdesc_free(ptdesc);
 		return NULL;
 	}
 
-	pmd = (pmd_t *)page_address(pg);
+	pmd = (pmd_t *)ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -80,10 +80,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
 
-	pud = (pud_t *) __get_free_page(GFP_KERNEL);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = (pud_t *)ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 36a6dc0148ae..ff07b8f1ef30 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -11,10 +11,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
 
-	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
-	if (ret) {
+	if (ptdesc) {
+		ret = (pgd_t *)ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.39.2


