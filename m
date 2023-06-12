Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0C72D233
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547540.855091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onB-0000Wf-Js; Mon, 12 Jun 2023 21:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547540.855091; Mon, 12 Jun 2023 21:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onA-0000MN-Jz; Mon, 12 Jun 2023 21:09:36 +0000
Received: by outflank-mailman (input) for mailman id 547540;
 Mon, 12 Jun 2023 21:09:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojU-0007zJ-6O
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:48 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6261f1e-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:46 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b2d8b5fde6so1282005a34.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:46 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:44 -0700 (PDT)
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
X-Inumbo-ID: e6261f1e-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603945; x=1689195945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAmT8w/AncpH6QVoSIrvIComylZ1SrhYEKCy+DX5WSQ=;
        b=TKVGiilQ78a/OhIPJrQkIG23uSCTs20i/bAbbkbs/oLPcc63baV2HRxlfziGdsvmbT
         NGwmW85cSCp6KespeqLEesubwuI3LepWWanH5S5npuzVlt9k5eU+arhtadffMS44bFKz
         tZe3hNLEkkGFlp7EldonlERGCsKXmABWlm5tuivlOHa4YP48jZLg/NXNUT6fL0OAV+la
         FfMXzF6x14kaKnLc9TNsZyJBWsa9Csrn4MI3KMBJ6+29vVkgPdAEbVwqoitINTtP8h57
         PClm1IA8Ha5Fd3vbc4M29HaqMx1DRRQlZyGElsQzM+NPYmwv6tn2zngJCKwAeXiQVKW2
         CRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603945; x=1689195945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAmT8w/AncpH6QVoSIrvIComylZ1SrhYEKCy+DX5WSQ=;
        b=ay3ot+sUeu8jnQrZukCvDcFjExLiwXM/3yEfrN/s1lHXPiWei6gmls0Ubs4TV3fs0g
         jQQjEnaU7N08pQGe7GnNwCeEHAc2lDX8hER9sG/je0jG/2ROOteb0KYjmxoVD7/u4WXR
         KQgyHkszCdZtRdMRK/wGRqa0Sf3F47XkJzEOYnMWGi+6U34TeF1sD5NavzuLoChJH7oY
         bxPSBBWvmNadSLZ4QkfsorxD6HyUj03Qq6j0IO3/rVnEyZFi1vYlI0H8nNh7g/Nu/tOV
         auKhSElFOMNGQlZXG0yqxQbM5cDuSxzGEipHbd6qCeFPG6FgMhqvpVUE8L46IGJhP9Ru
         XwxQ==
X-Gm-Message-State: AC+VfDz1V9wLPsLCvrDSYkGjONmycrqkSH5xH6YPuiyams7NGwBH0+2n
	0kh15z92hC3rWfvdBuvqzGw=
X-Google-Smtp-Source: ACHHUZ47i0W41PgLnIyz22Ca7yXJDqII27mpfISq9Vor76sG0Ii5GTRFPk+r3wb8VVa0pQvvv4TjaQ==
X-Received: by 2002:a05:6358:cc1b:b0:12b:de97:1be4 with SMTP id gx27-20020a056358cc1b00b0012bde971be4mr1697129rwb.30.1686603945076;
        Mon, 12 Jun 2023 14:05:45 -0700 (PDT)
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
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 29/34] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:18 -0700
Message-Id: <20230612210423.18611-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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
index 3d689ffb2072..6bfeec80bf4e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -354,12 +354,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pte_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pte_ctor(ptdesc));
+	return __pa((pte_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pte_mapping(pte_t *ptep,
@@ -437,12 +435,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pmd_ctor(ptdesc));
+	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pmd_mapping(pmd_t *pmdp,
-- 
2.40.1


