Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499C73AA47
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 23:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554066.865124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPG-0005bO-7N; Thu, 22 Jun 2023 20:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554066.865124; Thu, 22 Jun 2023 20:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPF-0005Xx-On; Thu, 22 Jun 2023 20:59:53 +0000
Received: by outflank-mailman (input) for mailman id 554066;
 Thu, 22 Jun 2023 20:59:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCRO3-0006Mr-0T
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:39 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8da6cab4-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:58:35 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-762092e1fb7so682075585a.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:36 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:34 -0700 (PDT)
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
X-Inumbo-ID: 8da6cab4-113f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467515; x=1690059515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=aYnvKxdcWv6qwRiCaWGJVXxgi34L6bq8ffoeujUnALIHtFuBXRmM+bcP9XCahDm+sX
         c/aqF5jzy/t6hTOr4VmOAf00WcyCDW4uBsXDaSxBnZc2Y5pzs1DtJ08u48NaJcU33gxe
         biARDPsxQJJ1M4wS/EW+UE7Jv4/5cxI8wBjMD1x51K3UK2lYTvqb8DS6s/XFH10WDh2J
         VablBYi+dZASmJrgz36uvDp4UJXSq36XOIyfuFYT8xy605670eCEF/XRu34qeL3h/9QF
         NP9Vpp+QW87o+p8FpzexMhKxgQg/GTdeD91r7OzfnHYpx/Em9cW4zYexsWWaxdvDLTnY
         5oIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467515; x=1690059515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=Gs7yYA4XaqsqbJDceQTQpCcjWIEBp8UZiNdkqhzVslcO6v9cUuaXiG7pYXdqh7yWTD
         nvKJHYKAvUGszuv6oR0QUpViAc1Mn0bEYgkY/q3PLegZvx72G96ZuLTtAp9uoq/kTn32
         puPUQPp/gIvJCtyGWJDrKUTUl+bdfnXpl4kf9N4IPxN8hkVC0xkJ5s/WUN0wf8U05Utm
         Jo2mm024/oBey8fS7crVhoyvjXR3vLJnyjklm2uvXpoXnNhsFvevTjImubCeEAga6MkR
         wS7K9LT3AVKhBcUY778Ru5dYOdpD5U6ITfxRbLPzJ/uwwDsF+pknD5K2Lh3nzGyM+FvJ
         Lpiw==
X-Gm-Message-State: AC+VfDxWx8spPBSL8BR5+CCx1oBPzCJczMBKZJZmQ7sEoTKzjHr7uFBl
	UOQq0WQyAa3sXfHlU/TOX8s=
X-Google-Smtp-Source: ACHHUZ60juxfhAagNO6Es1Dw+TzUsWcwO9UH0sU+P0uZ6ZZDjPscGIIYCumcyS40JVtPdjZ8M8DAow==
X-Received: by 2002:a05:620a:21dc:b0:763:a299:7235 with SMTP id h28-20020a05620a21dc00b00763a2997235mr11483461qka.0.1687467515158;
        Thu, 22 Jun 2023 13:58:35 -0700 (PDT)
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
Subject: [PATCH v5 19/33] arm: Convert various functions to use ptdescs
Date: Thu, 22 Jun 2023 13:57:31 -0700
Message-Id: <20230622205745.79707-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

late_alloc() also uses the __get_free_pages() helper function. Convert
this to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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
index 13fc4bb5f792..fdeaee30d167 100644
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


