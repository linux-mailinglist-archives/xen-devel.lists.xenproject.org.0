Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2069372D229
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547524.855030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8on0-0007HI-0a; Mon, 12 Jun 2023 21:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547524.855030; Mon, 12 Jun 2023 21:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8omz-0007AB-P7; Mon, 12 Jun 2023 21:09:25 +0000
Received: by outflank-mailman (input) for mailman id 547524;
 Mon, 12 Jun 2023 21:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojE-0007zJ-DB
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:32 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc53786a-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:30 +0200 (CEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-56d2b7a9465so15632787b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:29 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:28 -0700 (PDT)
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
X-Inumbo-ID: dc53786a-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603929; x=1689195929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsW7mi3+X2fEN/3x0Bi+dafPb2wVjOjUR4AWbTKXMQ0=;
        b=skq9VJH5dgJqddGwdVt6QPnDFnHLuDHmOdJ+p0cfKrjwcpANWfXjFtOnE+ShUVF4Wp
         +eZ1oAi7jnx0p4XZ2vlWf2HsUPHPywHFWTLkyBo2gHsKrZMxdedqFJMYHcQirASjKLsR
         SHXXWS83xBIee1HeZ900C52L0cf1hZAGJBgTBGRkI/olW2eHqyg1aEFYABUX/cDGInxY
         qBm8udoAWKxdlfWi3VICLCjFw6K8a8OX+rJWjNQ1/2hLUrj/oVGI32qhAulpQwwr+kGa
         Lu8zhuAzxz28DDQDJR/r5ap4yvwSJYAPMD0veq5+nFM3RaL/7sjJCqWPanMB6gD1jpVC
         DRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603929; x=1689195929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsW7mi3+X2fEN/3x0Bi+dafPb2wVjOjUR4AWbTKXMQ0=;
        b=HKcB7m/NmPce0DHKbszpl4k/SHbAcXchL4GN6qWVqcLxQ6gFL7QREJCLf8W4XwCPlT
         9XI6Dzj/cvBNHqzlPEtUHjOkMB8BQwbgymLbwlWGW5pogpix9keAhGkjHJpjpk1qhq7+
         5tXDv7M7cLIpUtFTVu1LK+hWtvLZBIT4yWOVPSm11zVDAaVwMC20tfm3YRznMfNWGU7S
         CiWWn/8uD7TcSxWVvyCfDYororxEbEvdmzluKVt7yoaYz7QDrH2RIK+ObXiuSkBinVy/
         Si7TLyLOEihMSzmJCDCoiOhB2fZ07WMJCLhh4Dlr6CPa/Wed+jkTL29V6FikUf+LlLXu
         ZlzA==
X-Gm-Message-State: AC+VfDwS7StAGZ2PX+QvDMeS72Bur/egnRFlsW+X5wwVv0FMs+wq0lxd
	ps732XieGXKJ4YPtvUOqsmk=
X-Google-Smtp-Source: ACHHUZ6YXnFai1+oazoURBIRxVN/vSubE3IHa08ab+S6MI7hbnWKgAk8qpadPRjUwPnUDYOPSto+cQ==
X-Received: by 2002:a0d:eb8d:0:b0:56c:e54b:b4b8 with SMTP id u135-20020a0deb8d000000b0056ce54bb4b8mr8864333ywe.28.1686603928796;
        Mon, 12 Jun 2023 14:05:28 -0700 (PDT)
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
Subject: [PATCH v4 21/34] arm64: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:10 -0700
Message-Id: <20230612210423.18611-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
index c995d1f4594f..2c29239d05c3 100644
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
+	pagetable_pte_dtor(ptdesc);
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
+	pagetable_pmd_dtor(ptdesc);
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
index af6bc8403ee4..5867a0e917b9 100644
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
+	 * folded, and if so pagetable_pte_ctor() becomes nop.
 	 */
 	if (shift == PAGE_SHIFT)
-		BUG_ON(!pgtable_pte_page_ctor(phys_to_page(pa)));
+		BUG_ON(!pagetable_pte_ctor(ptdesc));
 	else if (shift == PMD_SHIFT)
-		BUG_ON(!pgtable_pmd_page_ctor(phys_to_page(pa)));
+		BUG_ON(!pagetable_pmd_ctor(ptdesc));
 
 	return pa;
 }
-- 
2.40.1


