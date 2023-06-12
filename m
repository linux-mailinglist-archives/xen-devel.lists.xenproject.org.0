Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87F72D22D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547534.855060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8on7-0008Cy-K9; Mon, 12 Jun 2023 21:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547534.855060; Mon, 12 Jun 2023 21:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8on7-00088Y-7k; Mon, 12 Jun 2023 21:09:33 +0000
Received: by outflank-mailman (input) for mailman id 547534;
 Mon, 12 Jun 2023 21:09:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojA-0007V0-B4
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:28 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db1d1f61-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:27 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-565aa2cc428so40616037b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:27 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:26 -0700 (PDT)
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
X-Inumbo-ID: db1d1f61-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603927; x=1689195927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llblHDjuRzdwObovgJjTe//ioNSPoyRpZegKgEWGdOs=;
        b=YRMhLn8GgjXKF9eS1CkYK8/hVT9gPYz37UeBHSWCXWxsEKTB0xKNbO9xfoQxJLGBci
         pUYRlNAXxGNIort4RFvyqFoVkx12q+4R5GQ2T6iKcv07wKy7zihyGs6NzbSMSMCL6Rs5
         mHPuU0pXtsap85DxLGrKUtMBDvnEahRHLKEvKQOX7bhc/KG8s8E1jIJIjYHBV6Mzo8Tw
         JyoVIgOoI3Qu3/9ICO4yd0mqp02BwnCK/YCnIHcpYzONCtiWYcoEWw9YCE5wOdJRn8uB
         XPcLMuecwthMMTL6YQJ8OIdeoFxd5Ul+5c4RpJemAGRzK0WgBz8keleyqJxUgTeZRruD
         CsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603927; x=1689195927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llblHDjuRzdwObovgJjTe//ioNSPoyRpZegKgEWGdOs=;
        b=SGLR15vYPM3lGGykeeBerzIYHWJNn58YTbxuuxsfNpypkybK+BCK6kgccaVJyL5/jd
         NCr5SuBA0ic6E1lQAS9tEwVSW1SfAL7djvQjyVS6T0g4EZhQlEUpokwCdrrkgm7/N18C
         K3D0vwAxqLlE4wOyxO+waHdezhJngB9eRBQG9PlQ1537TsfJKTxny5LaxQ+0TB1O5Pdr
         mepbifDUrveT/Ns648A0pgMv80swo1Dqpkqf5NiZM6SwJHwVpvC3RZjrl+804V17bp3+
         XswptVB8Q9bm+B/JjjGfoK9nXWUZVstZFp0CszfFDBEavQU69ygji6htzyTbI4wlYLFJ
         2hnA==
X-Gm-Message-State: AC+VfDzGHN0rxJb4ZdURzRXxgjQ0zIXAVCQouvIMfFF7q+6ywcu8LgY4
	zFjyZJHX6EUhxrrlNyWdF+U=
X-Google-Smtp-Source: ACHHUZ4ft3mDxgWWbZVZ6VtJGRUVYiTphgdB2NgQzT9U5dEGnrQumf24dtXrB3QCjAsLfMmACVzxzw==
X-Received: by 2002:a81:6d07:0:b0:56d:29a1:c1c3 with SMTP id i7-20020a816d07000000b0056d29a1c1c3mr3804535ywc.24.1686603926795;
        Mon, 12 Jun 2023 14:05:26 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v4 20/34] arm: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:09 -0700
Message-Id: <20230612210423.18611-21-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

late_alloc() also uses the __get_free_pages() helper function. Convert
this to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/arm/include/asm/tlb.h | 12 +++++++-----
 arch/arm/mm/mmu.c          |  6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)

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
index 22292cf3381c..294518fd0240 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -737,11 +737,11 @@ static void __init *early_alloc(unsigned long sz)
 
 static void *__init late_alloc(unsigned long sz)
 {
-	void *ptr = (void *)__get_free_pages(GFP_PGTABLE_KERNEL, get_order(sz));
+	void *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, get_order(sz));
 
-	if (!ptr || !pgtable_pte_page_ctor(virt_to_page(ptr)))
+	if (!ptdesc || !pagetable_pte_ctor(ptdesc))
 		BUG();
-	return ptr;
+	return ptdesc;
 }
 
 static pte_t * __init arm_pte_alloc(pmd_t *pmd, unsigned long addr,
-- 
2.40.1


