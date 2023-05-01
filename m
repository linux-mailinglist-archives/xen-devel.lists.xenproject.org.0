Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247216F3846
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528147.821030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMo-0001Mr-Un; Mon, 01 May 2023 19:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528147.821030; Mon, 01 May 2023 19:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMo-0001K4-PB; Mon, 01 May 2023 19:39:22 +0000
Received: by outflank-mailman (input) for mailman id 528147;
 Mon, 01 May 2023 19:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCr-0006FS-G0
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:05 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f497be2-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:29:05 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aaec6f189cso12398745ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:04 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:04 -0700 (PDT)
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
X-Inumbo-ID: 6f497be2-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969344; x=1685561344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJJ/5JNaAhhn0BtCWyESRHZW29NfaaBB7RT6Dtpfjog=;
        b=dujVT07hfeADlXP8VLeHzHZos19FRJjW/aMFZqcOyBAO37TIyuOPUD4cjiEOtYecqR
         Tiwbs3Jgtkq4Kww3BZLsfUeYGH01HRped6BHBhotJFQfLn1orwI/QFojUqd07/woILZm
         IdwKD4oQO46zQ5FUSiD0ClypRdGvF7AHFnh12n9hs1VGHXuzfiiaf8+D2bQL3TQLnlID
         aypLmgidYgZS67oc/+3avE+c7doqeOxXcTi5kAqysB/3bLqLAcTPHmeArfdREDSIi+5K
         85L7sVL9riiLJDbWejHR83t0dYjCRXFIJ1/0gZmctdGxqkiAMg4Ak+2alOu75j8lTMAw
         rYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969344; x=1685561344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJJ/5JNaAhhn0BtCWyESRHZW29NfaaBB7RT6Dtpfjog=;
        b=R+RhZb0vFRSt4YtjISBkUGwPCbBgRzL0FBJIDWUBVxJGuVLP7TH6W3Q030fUEgPTp6
         xDJpeLlr+6rO64nLZJkUuoBdvsj/IQ3VG7AjQ2FNp5gJi8g/AZ5Q8NsEzaUa7NW+sbFV
         rASAMDWNx9FgGqIx6mgyV/cJJAv/S9w2dLkIJKKXOl5aPa/edOLIyRd7W0K7bYK7Umkr
         XrzKkOXTQWWpzLYLQD7gzkq4US16H0WZQrJKeotniURb7tF/U8507EKd8lNCUkqZ10PM
         FFoKAsBgRTtGYJpwDz1njCFTP6i9GS+07MmMBFy6NsyphuqManDOiHz69C8mb7rNPAzA
         gSIw==
X-Gm-Message-State: AC+VfDxydXdzRTR7fqKakz322VeQbMsOkfp5UCjZS+sG6sKt5K6buCpm
	xkkTtqN/LDBejlNQgFfqi+Y=
X-Google-Smtp-Source: ACHHUZ4ZEnjwtlgm3inm4fu27SXTrMWZSABNUt55ss8dOEDonQf7mUoqMAdyKodh48zsDDd3raB2eg==
X-Received: by 2002:a17:902:f68b:b0:1a9:2e3d:fca2 with SMTP id l11-20020a170902f68b00b001a92e3dfca2mr18382952plg.33.1682969344394;
        Mon, 01 May 2023 12:29:04 -0700 (PDT)
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
Subject: [PATCH v2 21/34] arm64: Convert various functions to use ptdescs
Date: Mon,  1 May 2023 12:28:16 -0700
Message-Id: <20230501192829.17086-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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


