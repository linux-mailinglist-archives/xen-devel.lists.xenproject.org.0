Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C8760873
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569383.889975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dq-0003Mh-BG; Tue, 25 Jul 2023 04:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569383.889975; Tue, 25 Jul 2023 04:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dp-0003IO-UZ; Tue, 25 Jul 2023 04:27:21 +0000
Received: by outflank-mailman (input) for mailman id 569383;
 Tue, 25 Jul 2023 04:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Yh-0002Iw-PJ
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:22:03 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce281eb3-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:22:03 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-cfcebc33d04so5670217276.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:22:03 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:22:01 -0700 (PDT)
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
X-Inumbo-ID: ce281eb3-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258922; x=1690863722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wtNkjiFE1rjq7ZRDFNmpMqdu/3EA/QyC8BNR6xlaRk=;
        b=iu7T9ShRTfGWqcA5uJNn48P7ITBijMcZXksGMFFsSIJDj0VmHTYECkWvPEWNMN60a1
         IUYR/sDhh53Vy6dzUT6UahYzj05kYwH8neXcRQGMrWnafyF9Nggmi7HojAqo4PR9lKrk
         02FdxS1l6wceDUexmcvfeLaN7cB/yf3NJTMHz8qA/qhQubNB4zuidHLrnfC+CD9FthdV
         DmB6BJ+22VwMurCnw4NmkeKklt87ZDgX5spGKsnDe9xsWqCmiOPReZ8vAaZPSBJPyLEZ
         EQXlbCfDgq90/zCmmXSE8cDOoCHltzy9M5tcZZJw0IWtubbSaQTI0PoE70blt5u8J64C
         txJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258922; x=1690863722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wtNkjiFE1rjq7ZRDFNmpMqdu/3EA/QyC8BNR6xlaRk=;
        b=bh4Col8xdEuoUFSKmaUW3oQZLSIsWU5r5xdk3irXxO3Nx/CaaMmXmwx4/5vHPLoAs6
         G9Z4JPZnKBl5hr7KjN0zqAUbXZobto7Obe2Fxua8bFGziGyFZ0fqCgKMLJSD5jOYZk3T
         cY3Bt+RquKPR6Gs0FR5jFfEalFqcigZeJ2V7bOfHjzq9ahUy6OzKS181QJ+eTvgJfKqd
         VjxfJjoq3JjikEdDwAlD2AZL9Q/tKkgIQlc0gTWIjSD/4QFTmexANCoE+VY4+VIxxfxy
         Ff6SBhn9qrObx6GkLCVI5DTprtOSsF4H4U3IbjKCjZtSQjtPfJFHenRtWA+pd0yJaDJX
         0Nqg==
X-Gm-Message-State: ABy/qLb7ayP+frBu11DoVot0XjqE7463y8hhl/dThBvyBdcENftDrySO
	WtyT5KAOzqGdR3CxpH6/4rQ=
X-Google-Smtp-Source: APBJJlGfBdwhSlxwyOaXtB0+Cx5VSBUjcB1Wb8y8NRWIESkjts+Gr4L0lqHFPdNq/1caH3RyI0GElw==
X-Received: by 2002:a05:6902:cb:b0:bc9:92c9:7fd1 with SMTP id i11-20020a05690200cb00b00bc992c97fd1mr8566515ybs.3.1690258922187;
        Mon, 24 Jul 2023 21:22:02 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 26/31] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:46 -0700
Message-Id: <20230725042051.36691-27-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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
index 9ce504737d18..430a3d05a841 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -353,12 +353,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pte_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
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
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pmd_ctor(ptdesc));
+	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pmd_mapping(pmd_t *pmdp,
-- 
2.40.1


