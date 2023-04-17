Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3E6E5373
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522399.811789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwC-0000Dm-UV; Mon, 17 Apr 2023 20:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522399.811789; Mon, 17 Apr 2023 20:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwC-00008F-PB; Mon, 17 Apr 2023 20:59:00 +0000
Received: by outflank-mailman (input) for mailman id 522399;
 Mon, 17 Apr 2023 20:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqb-0005M2-Tu
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:13 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de9d8b95-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:13 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id kh6so25753854plb.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:13 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:12 -0700 (PDT)
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
X-Inumbo-ID: de9d8b95-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764793; x=1684356793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJJ/5JNaAhhn0BtCWyESRHZW29NfaaBB7RT6Dtpfjog=;
        b=VrQ0lWqrs/ZeVvxhrMkEnri25zysQvP6rvUVlziuAvcyoO7aiCs2Ip8nrZdL+4djlt
         EalUxXukap5u9TcR0Ypqd1nj4oCE7Zy1crkVgOFcBvFvQfkcdrgLVV5yu4aZ8sXiNQzS
         MzbdyHaLybqiTpdHLCapkJdM135ufCzQfSX7LCwPasNWotwzcPJsMf59UKAQgZOOczBx
         ZYZuB1ddeu/80rtF2gv16gY+bwHM4NdL4pbXt10qFjUxYFen/hCDj/7OzFab+Hq/fc/w
         UWRA/d9TiIVFZRkxxpOQPugklzg3SfxU/z6fpq4Q2x5DyNF+cvnkXmPJMDWg2KdcBHj4
         X1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764793; x=1684356793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJJ/5JNaAhhn0BtCWyESRHZW29NfaaBB7RT6Dtpfjog=;
        b=cBxTBuILQz+ECMYWhaBioulgunJltiGrJl/PcRMJShYjUWAcTwM/CGcab3KJ7bKCFn
         GiZe9vw9gowy+CRtLgq+JG0INcsUMchih7j22qRYvn7NmYF1ABnvtrrPG0cO51dbaECT
         ZT5jct4hdt4CwbnH9ewYsvoGIZIZQLxnlkpLwv2NhiLnEPHr/1GlQXweAD3HDubz0HGF
         5W71GzxBY4BIkYOPlXWpWHioZQEf6y8tSacTiayPYfYvH50RcWQtump5pMDnWdXjG8XE
         aTOTYWHdlO8Es4uhA8PkoduUvAfFa+030d5g3EBZVxHtHrGwnymUGUiDyEgnWV2cn7fY
         sZ1w==
X-Gm-Message-State: AAQBX9flsa6Wg0Qrw0ADjsmmjIFIvyzgbzGW3OcId3U4ezuDNW0VTDUt
	9mqJY9eUlQ4KqxRTchXhOkE=
X-Google-Smtp-Source: AKy350Y2w7IaE9PrAymAnxztuomQd4Ga7koe4Zw+ByQfv97VTbICRP51vtaSBBH4u41LkAvC07UcrA==
X-Received: by 2002:a17:902:bd86:b0:1a6:c6d4:5586 with SMTP id q6-20020a170902bd8600b001a6c6d45586mr227041pls.13.1681764792942;
        Mon, 17 Apr 2023 13:53:12 -0700 (PDT)
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
Subject: [PATCH 20/33] arm64: Convert various functions to use ptdescs
Date: Mon, 17 Apr 2023 13:50:35 -0700
Message-Id: <20230417205048.15870-21-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/arm64/include/asm/tlb.h | 14 ++++++++------
 arch/arm64/mm/mmu.c          |  7 ++++---
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index c995d1f4594f..6cb70c247e30 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -75,18 +75,20 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	pgtable_pte_page_dtor(pte);
-	tlb_remove_table(tlb, pte);
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	ptdesc_pte_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 				  unsigned long addr)
 {
-	struct page *page = virt_to_page(pmdp);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pgtable_pmd_page_dtor(page);
-	tlb_remove_table(tlb, page);
+	ptdesc_pmd_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
 
@@ -94,7 +96,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 				  unsigned long addr)
 {
-	tlb_remove_table(tlb, virt_to_page(pudp));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pudp));
 }
 #endif
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index af6bc8403ee4..5ba005fd607e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -426,6 +426,7 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
 static phys_addr_t pgd_pgtable_alloc(int shift)
 {
 	phys_addr_t pa = __pgd_pgtable_alloc(shift);
+	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
 
 	/*
 	 * Call proper page table ctor in case later we need to
@@ -433,12 +434,12 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
 	 * this pre-allocated page table.
 	 *
 	 * We don't select ARCH_ENABLE_SPLIT_PMD_PTLOCK if pmd is
-	 * folded, and if so pgtable_pmd_page_ctor() becomes nop.
+	 * folded, and if so ptdesc_pte_dtor() becomes nop.
 	 */
 	if (shift == PAGE_SHIFT)
-		BUG_ON(!pgtable_pte_page_ctor(phys_to_page(pa)));
+		BUG_ON(!ptdesc_pte_dtor(ptdesc));
 	else if (shift == PMD_SHIFT)
-		BUG_ON(!pgtable_pmd_page_ctor(phys_to_page(pa)));
+		BUG_ON(!ptdesc_pte_dtor(ptdesc));
 
 	return pa;
 }
-- 
2.39.2


