Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D86E5377
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522398.811785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwC-00008L-Na; Mon, 17 Apr 2023 20:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522398.811785; Mon, 17 Apr 2023 20:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwC-0008VG-Ep; Mon, 17 Apr 2023 20:59:00 +0000
Received: by outflank-mailman (input) for mailman id 522398;
 Mon, 17 Apr 2023 20:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqn-0005M2-OZ
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:25 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e557d221-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:24 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 k36-20020a17090a4ca700b0024770df9897so6600486pjh.4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:24 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:23 -0700 (PDT)
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
X-Inumbo-ID: e557d221-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764804; x=1684356804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzUB7crKqn7Of69Iz0IiuKaVcaC8bpzNVtqjj02cJJs=;
        b=CQxyKkc21JMWEGZgaxo+DzkT7hmUe/EPeRLNy9307TK3NRBVO8qYFVHUBh0a+wrrFK
         REDRofZ4pQ77HB/xKTTnWP/BT1cyKC/pHZN9NhEm5iKL1tflp83IUSNn/z3JIjWng98Y
         6RfpzxV5XfPWxGKOX4DdYV/wLmmlXNt332CwEYLgb9fOwCusASfTkzDGq48OmDuUGGpq
         tIsA4gMM5D4jkK0NC3tYS5RarJ0ZWQtkI1tM39+DRuLci+gK44bt1F+fDRaPwS3T5T9g
         S4uLRylS37AnplaeXGFnk7T6Qzad8RMawrqwBO6UKOhHtptnemCZZZWNN4xJh7uqqhEQ
         vrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764804; x=1684356804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzUB7crKqn7Of69Iz0IiuKaVcaC8bpzNVtqjj02cJJs=;
        b=WAn06BLUCLJJLtM5i6kNg6GkZMNWnyY9gmd9QQt0eiTQritRCey7jZ7trMo1/SEKzS
         FhjmtMp4cfH4C4r9hAlrs81EzNYQPpqvojQPNDQA4nBfOM5Sk/K9XDzQQVsA3TWCaLXI
         Y3xVjC83uwJ2Dsm0lP9ETtX33P+yBccz7Qo8BmO/KB1LXT//ABLn3O//IZNJAN/g3X1S
         mKNLrdyV02UVYM9uzH7Gnf67pk13WOvfBjpRsL52BRsFUMcmejJojAHNiOJWBgmygouN
         WUXHiBwTTxfR8qx0HFsfHYTY+6aIN/6nwjHmyvSItBJbG7Zr57nLH2umiLz6XdmCosxp
         SGKQ==
X-Gm-Message-State: AAQBX9cwnhSvrt7/ZAoQVVsSSFABziVZnoTZ8AGqGp+mpgWr7IP2grXU
	oBRGb1rssrIqdOQPXBZ0HPc=
X-Google-Smtp-Source: AKy350avL9PdXaEjhmJuV1ybk5n54BLKq2822oDesoZKEo2GpNTKDMiGoy71eNPEPZjYfA/nM1qr3w==
X-Received: by 2002:a17:90a:1286:b0:246:bb61:4a5b with SMTP id g6-20020a17090a128600b00246bb614a5bmr16053424pja.8.1681764804243;
        Mon, 17 Apr 2023 13:53:24 -0700 (PDT)
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
Subject: [PATCH 28/33] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:43 -0700
Message-Id: <20230417205048.15870-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use ptdesc_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/riscv/include/asm/pgalloc.h |  8 ++++----
 arch/riscv/mm/init.c             | 16 ++++++----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 59dc12b5b7e8..cb5536403bd8 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
 } while (0)
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0f14f4a8d179..2737cbc4ad12 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -346,12 +346,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pte_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)));
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !ptdesc_pte_ctor(ptdesc));
+	return __pa((pte_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pte_mapping(pte_t *ptep,
@@ -429,12 +427,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !ptdesc_pmd_ctor(ptdesc));
+	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pmd_mapping(pmd_t *pmdp,
-- 
2.39.2


