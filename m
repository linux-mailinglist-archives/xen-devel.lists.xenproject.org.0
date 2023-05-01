Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9126F3848
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528152.821044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMt-0001vk-Je; Mon, 01 May 2023 19:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528152.821044; Mon, 01 May 2023 19:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMt-0001qN-EX; Mon, 01 May 2023 19:39:27 +0000
Received: by outflank-mailman (input) for mailman id 528152;
 Mon, 01 May 2023 19:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCs-0006PY-NB
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:06 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e774797-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:29:04 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aae5c2423dso20954225ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:04 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:02 -0700 (PDT)
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
X-Inumbo-ID: 6e774797-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969343; x=1685561343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfpIRfFq9zSU9T7uNfhlcYr/W6dIxhZkZgP28wF3SDA=;
        b=Qau1TBSyVipNmef8PNT07M/JoK5y55d5cqgZDlN4vhhP79tr9yaRETSYXvwSfxkzpQ
         1wzTUy/T5LzAEZJEeUbvFZuE+VickGgRQkGj6paYz1jDOFsUn9ZCDLvNYYI/Zyr2RUmg
         bm3l9m5jLCH0toRw7+aEb6gYmXflBLWLMpuQeA0OVXisZ1A5osNX02KzemiZmkdGT+6d
         H7+k3mn0V3HtUXPo/S8coTYf23tz7uGdOWK0nFPfjqqe58njMrJom/cuk3n4mMysX8dy
         jTZaIlbFQNlLjrIuXwQgtdhVp6dM9pTxTSdYHIHgZYka1AJxhJpIcTRf9fC09oM2h4fK
         Ax0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969343; x=1685561343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfpIRfFq9zSU9T7uNfhlcYr/W6dIxhZkZgP28wF3SDA=;
        b=kHUc4Hj2Dhsbn2oMdm/AQm20tiMvonMm8unQZzyrbrKlhdAYbTk5im9wlkAdE6N5sS
         HU6sXg37mwT2AwCXHrG3QTso91us/ih2aEF+yozLfDluEcNY7ZGDA6fzk9OaAX6RFBIx
         fBR5DHjW3bODdXyB63rIEScNAho95MaVmGeh2/lhpWeWMEH1c1iI91PKwqJ+yPHvfT0T
         A+PySmSpmEAIi53KEDXjbQwiFaz9ZTtMPZotRuHpaHqsHY4P2KCSTpCX2niDepiAy9mn
         KD/daGp7ghr5yjq6EKEcNSzj06W6Gfs8TLN1Ah5dVbnp5aiWWvBU1aORvwurELCTi8nk
         aH1A==
X-Gm-Message-State: AC+VfDxEbUVQVfTm7HSFzMv9UfBOB5CTnWCl1giBurkgBDNVTZ0jHvfg
	u0vYiL9fZmZ1WKhpzm56ZUY=
X-Google-Smtp-Source: ACHHUZ7gDAee3JEsjrpH2Z6atN7OAzqWZ2l6e0m4gqF7AbuDA0ihHMvj1UGUNCCunfz91CTNrFO0iw==
X-Received: by 2002:a17:902:e547:b0:1ab:8f4:af3a with SMTP id n7-20020a170902e54700b001ab08f4af3amr217267plf.39.1682969342957;
        Mon, 01 May 2023 12:29:02 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 20/34] arm: Convert various functions to use ptdescs
Date: Mon,  1 May 2023 12:28:15 -0700
Message-Id: <20230501192829.17086-21-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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


