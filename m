Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6DE76087B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569386.889999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9ds-0003ve-0h; Tue, 25 Jul 2023 04:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569386.889999; Tue, 25 Jul 2023 04:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dr-0003nr-Ju; Tue, 25 Jul 2023 04:27:23 +0000
Received: by outflank-mailman (input) for mailman id 569386;
 Tue, 25 Jul 2023 04:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9YP-00023t-EL
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:45 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c24a892a-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:43 +0200 (CEST)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d129edb8261so1958186276.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:43 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:41 -0700 (PDT)
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
X-Inumbo-ID: c24a892a-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258902; x=1690863702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=YmaPL1Vi+BQChOKWGw1MlFqz3AIULFncYrkFnUsVyfilrIdeasoH5GHm0MEpRXKgmq
         DwC9KwXiAQ3MN8gwuAbymt06/p5z+8sYZZRmtF0QZ8N7W0KJLZlIdtmS/iEXcHfRR9pY
         2ULSywNr2+fCENRH3Q/SedxdAZmlqvHkU4bXO0Iy6mLyj0C0e7FNRd96oXnepKXsjgBp
         DVfpoX3+8pHS5yXYZY0DswmNPSsrKwOikBQLnb77xz8k9ebKbrK+QxqOENWwGszD02R4
         u3nvQUFC/AuDK1NFsePOhCwUQCv2T+yjXJkyc6tTHY68z6Qz4nIbLO6jQDPO+Xjl6VQM
         RJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258902; x=1690863702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=LWcKL8HIl7BidB2ODq0sEyzbPzhPZKo3eKoMZxNo9KfqCX7t4p23afpcMnyfZS0sMp
         YDSb3oxGbp7fPF/VXENpTzToD2AyuoHU7FYbQFhPcKib+CAVmtjD7HVMjKdRT7cjX4Y0
         dSX7ccO6Y7f93bOGELBoBreVdu0EkGwOpZqS51/0rH/HlLYKuon0l+Gl+3Qv6pLxaWGE
         9Jd0P9HLfn/WGCGWBaa8g08p/oK+AlTZXB8qlyikBxPSvxIGo1eD/lR3sh0FqNDLRPhb
         s7Ad8nbYT11bNhNkdwnPqPWTGX3++mXBnvCbYV4bWuQLwEwLvUp+LdV719yRU1eDtleC
         E8nw==
X-Gm-Message-State: ABy/qLZgoqmfcGvR5/o9CsWzgoWyS/menafkyEryB/ejNKbd3uimW/FV
	BXCa1yNJdGbHHkUR99GJ4SI=
X-Google-Smtp-Source: APBJJlF19R+0iLSXwcqdh2p0QPj8gjsaDLf4/piQLSANpJDw+A6xil+mrxUfv/BGU2XCVUHQZlpYDQ==
X-Received: by 2002:a25:dbce:0:b0:bcf:e2a6:7085 with SMTP id g197-20020a25dbce000000b00bcfe2a67085mr1287878ybf.23.1690258902247;
        Mon, 24 Jul 2023 21:21:42 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 17/31] arm: Convert various functions to use ptdescs
Date: Mon, 24 Jul 2023 21:20:37 -0700
Message-Id: <20230725042051.36691-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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


