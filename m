Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5B769EBB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573304.897940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMr-0000rl-RH; Mon, 31 Jul 2023 17:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573304.897940; Mon, 31 Jul 2023 17:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMr-0000nQ-Fl; Mon, 31 Jul 2023 17:07:37 +0000
Received: by outflank-mailman (input) for mailman id 573304;
 Mon, 31 Jul 2023 17:07:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJd-0008Np-1u
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:17 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4708122c-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:04:15 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d29a5f7dc74so3268155276.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:15 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:13 -0700 (PDT)
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
X-Inumbo-ID: 4708122c-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823054; x=1691427854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W6z1I6yvWrQZbHmgHYBEGZZDstSbvELOPET/EcKlKw=;
        b=DoLYDaRBa41Zdh1yGELvr4mktDPzCr5wZMtfaOFQzQ5hTcfRkcfNo2gxzOD+0/ykOM
         euBOcnH4+UQlm104MdM8Mcd6Wd+0oXQ7r2d8C7k16OxK93xpXJQ9cxidNEnw+09+Tsgn
         4MiJbaZ4azooZbJym/w2spQi4ZLNoUGyQvzF+yt3P/maH4DT1bEGYtqh5RJ+6A+RSiNZ
         F4VZO0F3scHf9jVdMvyffz9Y4Un+dZzmqLUFBUExZqr5BTOKTZ3vKrNuYiRkZjRgx8qM
         A0v2BAwmzAgXUoHV1OBdUh/BQxSYjg1Y5Vc+ifw6djIqa1GbEqCTgLRTuyk3SSeDHWhN
         ZcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823054; x=1691427854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1W6z1I6yvWrQZbHmgHYBEGZZDstSbvELOPET/EcKlKw=;
        b=QOoLRrO4kNjbucoAbySdE62uGp8pYr1JdptiJSU3pQEGwV1L+IRTPX9n8BQpnX3lBI
         B5P/UTBq920j5UrAy3fpdgbAdOBiMGTDzwPCwBnUuSciJ5wddpVqrqBt3kF3aUEIO1KJ
         FI/hZKLwOT0KAHgoGRKXHudY2vNEK5S+PEy9LOnOmXhTnUbptRvcSfMgLnD2NgU4ZX/b
         X3DVtrfbFZHfVM9XelSzatk5FiWVAOuvqlZ7BHnCqUD5kMSfIT/3m3YHBwJGtVJ6wLwJ
         /gCmKnCHIQrW0NRxjwEbes0e2eFRF56kEX4T48ACVnfe317J+VyrpDIxtYEieif5br6w
         LkBw==
X-Gm-Message-State: ABy/qLYBxqRqYC8UQxEIJpG6+n6PNxHN0WRFoh1zhAiRb7xXekneM4Yq
	UCgVnqpBDqyiZ4I7gp3SV24=
X-Google-Smtp-Source: APBJJlEdpRjJyqAaQhaJuPKqzpefz2AFbwFC7sVhDBH7lQjGs0g9KoyKRkFSzeflgvIaUwqu4lunqA==
X-Received: by 2002:a25:b08d:0:b0:d11:2a52:3f35 with SMTP id f13-20020a25b08d000000b00d112a523f35mr11488364ybj.20.1690823054136;
        Mon, 31 Jul 2023 10:04:14 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH mm-unstable v8 18/31] arm64: Convert various functions to use ptdescs
Date: Mon, 31 Jul 2023 10:03:19 -0700
Message-Id: <20230731170332.69404-19-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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
index 95d360805f8a..47781bec6171 100644
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


