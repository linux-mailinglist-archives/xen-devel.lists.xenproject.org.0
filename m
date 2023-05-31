Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C01718D47
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542047.845522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVg-0006Pi-S0; Wed, 31 May 2023 21:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542047.845522; Wed, 31 May 2023 21:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVg-0006I0-IH; Wed, 31 May 2023 21:37:36 +0000
Received: by outflank-mailman (input) for mailman id 542047;
 Wed, 31 May 2023 21:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQO-0006xu-Dd
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:08 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97d02189-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:32:07 +0200 (CEST)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-565bdae581eso792347b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:07 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:06 -0700 (PDT)
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
X-Inumbo-ID: 97d02189-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568727; x=1688160727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnBVr922X+M85c+6VJKDI+Caz3ny3LZ2fwcpIuiP1/4=;
        b=XZ3kJddTkoKufk0kwBdOVZQZoSVtcE5HG6sX6rRRHvCe7Om9x7xY0K4IiCL0nHsHxQ
         9eGr6MZvVeUtc5fgyKg5P1qBSWAOsfbcmSPQlXFPghUVu6fp2sIDmm+5U3bq4g7lRHpB
         Zld4cy93/rMGN07+QSO9q6jJf8+GwNN3p+hTYG0BRIQZI6tNs0RI+r52u0EH3fUAXWUT
         KW3t0eM8fAoeH75fwVt/7iugc0BvPA69n2m/eo4szwTaUcjtnQ0rOZaZxJ3/gvL6spZ8
         hnUdu2Pp/aCFMWHQdwhDEFfy8i7DytzgyU5VaM/fnvmpMyEanQ53VlCHmZFkS4f807YX
         H9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568727; x=1688160727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnBVr922X+M85c+6VJKDI+Caz3ny3LZ2fwcpIuiP1/4=;
        b=NuA7cfU3HB93Sn3lfk/nUBbqd4lrwDr2dkkTjPO+Js0FO8pHUN8uhHWhV5/uvQJCx4
         r9jvMjpjOMS5WCntLGUV6mLUXgHH2p027012u5+lQBghx6qv7pffmCfVHOAfGlePHpoP
         IOMxs8cFeL1NBlRF93cuA+ITcLXxNJPMr4mva9+sXLjY/qnkAg8HbskYwHYYbkXKN2JZ
         HU5rvHlbjjHcIYPgnnujmP4xv6qX/a5q73v1fgXqP0IeAOznKYR5O2R0dEQuntjb4x2B
         g+IiIPlA3xmU0xxHBhUgYKKaKY4iFwRSABvoMEmSdCC+Ym5iBEEL+TLs0Jt5wCklp3Cr
         HYgw==
X-Gm-Message-State: AC+VfDyWYwGZoPaM2sPX83sw2ReqnGWLdIzyL0s/Eyr2jLUDwtVMyPRt
	iQ1Z90Xn0y7lBCyghTobxlw=
X-Google-Smtp-Source: ACHHUZ5mU9zEYCdDSqHlmf5fji+LZR6GnrVvINr+QLg2em3BFf1b9EHyVp5oT6zaLyXHcWvIl6C56g==
X-Received: by 2002:a0d:e212:0:b0:55d:a4fb:864a with SMTP id l18-20020a0de212000000b0055da4fb864amr6942187ywe.14.1685568726728;
        Wed, 31 May 2023 14:32:06 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 29/34] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Wed, 31 May 2023 14:30:27 -0700
Message-Id: <20230531213032.25338-30-vishal.moola@gmail.com>
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/pgalloc.h |  8 ++++----
 arch/riscv/mm/init.c             | 16 ++++++----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 59dc12b5b7e8..d169a4f41a2e 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -153,10 +153,10 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-#define __pte_free_tlb(tlb, pte, buf)   \
-do {                                    \
-	pgtable_pte_page_dtor(pte);     \
-	tlb_remove_page((tlb), pte);    \
+#define __pte_free_tlb(tlb, pte, buf)			\
+do {							\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
 } while (0)
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2f7a7c345a6a..2fe6ca1b1f95 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -353,12 +353,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pte_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pte_ctor(ptdesc));
+	return __pa((pte_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pte_mapping(pte_t *ptep,
@@ -436,12 +434,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pmd_ctor(ptdesc));
+	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pmd_mapping(pmd_t *pmdp,
-- 
2.40.1


