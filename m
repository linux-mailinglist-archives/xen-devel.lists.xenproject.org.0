Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAE5773414
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579048.906953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K3-0003dd-Eu; Mon, 07 Aug 2023 23:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579048.906953; Mon, 07 Aug 2023 23:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K2-0003U0-HO; Mon, 07 Aug 2023 23:07:34 +0000
Received: by outflank-mailman (input) for mailman id 579048;
 Mon, 07 Aug 2023 23:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9IR-0001NS-Fr
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:55 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f537af55-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:05:53 +0200 (CEST)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so5489192276.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:53 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:52 -0700 (PDT)
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
X-Inumbo-ID: f537af55-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449552; x=1692054352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSWx8dFer3K04xJe2FS2V6S19uUh9FiSOjAjYMXRNjw=;
        b=mEF5uAs6LPH63FkNSBplLFspkb60DHxm6zOnUwvAQJc3E/pOwbhAIiNFZBUYHiCsiM
         p2tbQp60CKHpnlFx92kmBMq0iICGLFKDwXQ0LyWNPB5CTFYLszQ4c8mEuzgfzEni9mwM
         Ttmf1qUiq6AjtyU7518jshwfi+pChbC60Sh5kSbXAB+lvEOcHSUd/ZfP7MFS2PgNjGFo
         r7Bvb+zEwdMz3ovaFVdL7n7AY1JJbQH54hsJVFdRCSvSwoDtl5zIXSCLg5x4eEWrxL65
         mP+yB5DlcuhDlbUdEBdiXWCJptk41KogbXQLbDgKd5NU/tlto4itztjaP5et2Hvpw0rt
         7VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449552; x=1692054352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSWx8dFer3K04xJe2FS2V6S19uUh9FiSOjAjYMXRNjw=;
        b=M46y74Uj0HWwFr5a/71IlhuZ2i+E2U+QJ9k17WSVTjddXltel713J1eSjLz9KeNGJa
         33JuajndOHOqqDhiMp0BK6PNTEwOMLXON7sKwSXUrgHgdDgcrNP3zpa+hhHAP5um3vNG
         Y04qjraPfe3N5rKE1gUOXn13eeAHKPWosy2c4/wSZlUS+gZ11ebLrHtR9XooQUUE90qz
         Ba0qqukT8jjr1fg2TJDQ1JDcIaLcwH6sx8nvI3jZvhbMIGonoTdaxXvRo8aHEnka/Dkv
         wuWEFIMbBj0KNiOvsmazXbyE4yDc0f7JeDhgLK4+2lviNJ16eVmPd8MS8maqH2nbUvPC
         6YoA==
X-Gm-Message-State: AOJu0YzxYn7bCUgq1HixWvC+wGbVgS2mgVdndovxuM/Yd1mOVmMMuFhp
	uGOqj9qlmjyFFoj4Sy3FOn8=
X-Google-Smtp-Source: AGHT+IFZB5AVL/MxN7IM/ds0EZn0mK90E4BWht9Xyb7zBcTjMbr/Qp8cCY+l+/2imbi83tiWiC1i0w==
X-Received: by 2002:a25:4e05:0:b0:d12:3108:f90f with SMTP id c5-20020a254e05000000b00d123108f90fmr10423741ybb.24.1691449552662;
        Mon, 07 Aug 2023 16:05:52 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 17/31] arm: Convert various functions to use ptdescs
Date: Mon,  7 Aug 2023 16:04:59 -0700
Message-Id: <20230807230513.102486-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

late_alloc() also uses the __get_free_pages() helper function. Convert
this to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/arm/include/asm/tlb.h | 12 +++++++-----
 arch/arm/mm/mmu.c          |  7 ++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8cbe03ad260..f40d06ad5d2a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -39,7 +39,9 @@ static inline void __tlb_remove_table(void *_table)
 static inline void
 __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
-	pgtable_pte_page_dtor(pte);
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	pagetable_pte_dtor(ptdesc);
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -50,17 +52,17 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 	__tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
 #endif
 
-	tlb_remove_table(tlb, pte);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 static inline void
 __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 {
 #ifdef CONFIG_ARM_LPAE
-	struct page *page = virt_to_page(pmdp);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pgtable_pmd_page_dtor(page);
-	tlb_remove_table(tlb, page);
+	pagetable_pmd_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
 
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index c9981c23e8e9..674ed71573a8 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -737,11 +737,12 @@ static void __init *early_alloc(unsigned long sz)
 
 static void *__init late_alloc(unsigned long sz)
 {
-	void *ptr = (void *)__get_free_pages(GFP_PGTABLE_KERNEL, get_order(sz));
+	void *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_HIGHMEM,
+			get_order(sz));
 
-	if (!ptr || !pgtable_pte_page_ctor(virt_to_page(ptr)))
+	if (!ptdesc || !pagetable_pte_ctor(ptdesc))
 		BUG();
-	return ptr;
+	return ptdesc_to_virt(ptdesc);
 }
 
 static pte_t * __init arm_pte_alloc(pmd_t *pmd, unsigned long addr,
-- 
2.40.1


