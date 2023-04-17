Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB446E5375
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522397.811777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwC-0008VM-B6; Mon, 17 Apr 2023 20:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522397.811777; Mon, 17 Apr 2023 20:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwC-0008TH-71; Mon, 17 Apr 2023 20:59:00 +0000
Received: by outflank-mailman (input) for mailman id 522397;
 Mon, 17 Apr 2023 20:58:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqa-0005M2-MZ
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:12 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd561f7-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:12 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id d15so10119811pll.12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:12 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:11 -0700 (PDT)
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
X-Inumbo-ID: ddd561f7-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764791; x=1684356791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfpIRfFq9zSU9T7uNfhlcYr/W6dIxhZkZgP28wF3SDA=;
        b=gYiTGJsq3tS0FDSy3/Ogj5YUQaoNGj6XWEQGKGQUuQuqn1egVSKA3seChXbxd6ie6X
         KVLVgtxbt+Gl9lkEwLQ+F+iG9Kz1ErH6Jdv2PrLPdPwp/UgBJZIaGw67YMksWIwKnmyC
         7jVlh7AKx280dtpirqSUFhv9Pyd2cc0T8yO2lBO5mVRpibO3YWd6y8PCZ2jFDrnw2dOM
         qIyvjKI6SfUletTh72Za02rULTtpxgw/RsbeOg0p8ic4ZkVJUUvnJu+rLoRN8U3nnoDL
         0yuCtQCJj2oWJ5XTJVsuTcfyXkKiXbSXxA+TapEEDARVJ5R07j+Rkpo9klzzaVdh3pXw
         NvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764791; x=1684356791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfpIRfFq9zSU9T7uNfhlcYr/W6dIxhZkZgP28wF3SDA=;
        b=XBifD4YBTX0xJl5DMVH9amP2GDDWDAi43EUPC6Hm5XtPHfIVUC1nvpdTeC6EC1365X
         Xz6niuccyZvbd78jdf7utFPVzCEk3b9hemAcU28jhItTOGK0QzKeWDwl0I3YKj0ElByG
         2iOnQEP3auBO9b4oq+cI1fnp9DyJz1Yj+iOJTSwrCSOjjLhRf/2U45G/osa6I1WzmwBZ
         0j5C/rSPmcbHqcfyjLQgN16uLrSX2cjFJzS+svb75B/GLOHvH6rcAlxVXritK3qazivy
         sPwZefB7hxoZZfEKAkAWm7pz9aTJnyQAC9s5XXYxptlTB5BWEdNq0ikc4VA4+uOd7nhS
         hwfA==
X-Gm-Message-State: AAQBX9fyQGkP7ecAmC2HSjRiNpej5Iu8AkpH3IvAfJKAIBgANX/ZDHv+
	RVXtHyRy+xH4Awq520BV014=
X-Google-Smtp-Source: AKy350bvWV8yzhiozqrrwWcRpctJK00ZbC2YeKZYOK2IgaSQcSotd8fWuCQxrW1E1m+ogfO6p1yZ/Q==
X-Received: by 2002:a17:902:b789:b0:1a6:8024:321e with SMTP id e9-20020a170902b78900b001a68024321emr189655pls.34.1681764791672;
        Mon, 17 Apr 2023 13:53:11 -0700 (PDT)
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
Subject: [PATCH 19/33] arm: Convert various functions to use ptdescs
Date: Mon, 17 Apr 2023 13:50:34 -0700
Message-Id: <20230417205048.15870-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

late_alloc() also uses the __get_free_pages() helper function. Convert
this to use ptdesc_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/arm/include/asm/tlb.h | 12 +++++++-----
 arch/arm/mm/mmu.c          |  6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8cbe03ad260..9ab8a6929d35 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -39,7 +39,9 @@ static inline void __tlb_remove_table(void *_table)
 static inline void
 __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
-	pgtable_pte_page_dtor(pte);
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	ptdesc_pte_dtor(ptdesc);
 
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
+	ptdesc_pmd_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
 
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 463fc2a8448f..7add505bd797 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -737,11 +737,11 @@ static void __init *early_alloc(unsigned long sz)
 
 static void *__init late_alloc(unsigned long sz)
 {
-	void *ptr = (void *)__get_free_pages(GFP_PGTABLE_KERNEL, get_order(sz));
+	void *ptdesc = ptdesc_alloc(GFP_PGTABLE_KERNEL, get_order(sz));
 
-	if (!ptr || !pgtable_pte_page_ctor(virt_to_page(ptr)))
+	if (!ptdesc || !ptdesc_pte_ctor(ptdesc))
 		BUG();
-	return ptr;
+	return ptdesc;
 }
 
 static pte_t * __init arm_pte_alloc(pmd_t *pmd, unsigned long addr,
-- 
2.39.2


