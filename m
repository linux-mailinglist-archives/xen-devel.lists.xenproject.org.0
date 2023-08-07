Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BF773409
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579047.906943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K1-0003M8-R2; Mon, 07 Aug 2023 23:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579047.906943; Mon, 07 Aug 2023 23:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K1-00034h-9r; Mon, 07 Aug 2023 23:07:33 +0000
Received: by outflank-mailman (input) for mailman id 579047;
 Mon, 07 Aug 2023 23:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Ib-0001NS-M1
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:05 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa41787b-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:06:02 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d4789fd9317so2925221276.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:02 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:00 -0700 (PDT)
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
X-Inumbo-ID: fa41787b-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449561; x=1692054361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VD2saKmHCgP979K/4Ur2DZD5lv+pCsAy+26MDZ4lRXE=;
        b=KaA5Xf0Zq7VankK3QOvVnhKCvDQA0idGZ5r/QtBaYpBUZhM7IUDDnipX0Mck9NuTr6
         FMzfUiWHWV61utAYtiNJjvsmZyQrjEGqV1vWWuYtjGooZk9wKA6pHj8JXiEh77Vd66gm
         gq9wCdtohtsBXI+QiM0g5DM3RYb5yVm35tcAKNI7nQZaFVODWjyuyXisRnjCevekbcDp
         QweW3qBvEiOtjGdP8+KO+Ai79xaww40f8oFcpzIoZ31G0t7vkt4E3RfT7Asw6Y6mNUmW
         4v5tgaFeOHT3yezqwQ6Pv7HkjczS8wtW/o3vWALkNkC7/L83lM6ERIvU0onlnalg95pZ
         XQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449561; x=1692054361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VD2saKmHCgP979K/4Ur2DZD5lv+pCsAy+26MDZ4lRXE=;
        b=Y5V8yPmQ90rBDY9TLUXh7DxkIJIqkY5+/P7oHorOO1kt33P8OHri1SQZ4FPsm2vHNT
         IBmQRKX18IzwCNIw2bJ8gRhNyCw18YpmACX7WkxytpLXBFxNhI9W18QVtYyAlWlNbQ/k
         LDyFtWtDbIiCn+J8/OrSybRHT/yqrbHbDKgGBvV3ciS3Sgi4A497hmMgEP0mdgcVFgq4
         pFCmsE1Prp88HwLASb1/MPO2QFH9xVjMZKuNgj/Imyue8S0KQMH9oRRHGMltprikpPzb
         9rmelENw25l9zBXc+QHwwotEh+8eppJ0ozU11ZMfNmfOlF2zsKe/1Di7hERGnduRgNf+
         1jzA==
X-Gm-Message-State: AOJu0YxTxYOMXxVN1xuREVqGagJL8AR+MUtEgKtxY9Xk3eP3AgMEh3Ch
	baFO/EICASx29Su02J3WHko=
X-Google-Smtp-Source: AGHT+IGT7jcZ858GNZbGv2ymKyHkNCq6k2xr+zx9+OdmxVuwoAhnOKduGJp0I6ObmWSEyVKiLNM8sw==
X-Received: by 2002:a25:8210:0:b0:d39:fa2f:8b63 with SMTP id q16-20020a258210000000b00d39fa2f8b63mr13670853ybk.25.1691449561057;
        Mon, 07 Aug 2023 16:06:01 -0700 (PDT)
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
	Huacai Chen <chenhuacai@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 21/31] loongarch: Convert various functions to use ptdescs
Date: Mon,  7 Aug 2023 16:05:03 -0700
Message-Id: <20230807230513.102486-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/loongarch/include/asm/pgalloc.h | 27 +++++++++++++++------------
 arch/loongarch/mm/pgtable.c          |  7 ++++---
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index af1d1e4a6965..23f5b1107246 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -45,9 +45,9 @@ extern void pagetable_init(void);
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -55,18 +55,18 @@ do {							\
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pmd_t *pmd;
-	struct page *pg;
+	struct ptdesc *ptdesc;
 
-	pg = alloc_page(GFP_KERNEL_ACCOUNT);
-	if (!pg)
+	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, 0);
+	if (!ptdesc)
 		return NULL;
 
-	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_page(pg);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	pmd = (pmd_t *)page_address(pg);
+	pmd = ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -80,10 +80,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	pud = (pud_t *) __get_free_page(GFP_KERNEL);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 1260cf30e3ee..b14343e211b6 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -11,10 +11,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
-	if (ret) {
+	if (ptdesc) {
+		ret = (pgd_t *)ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1


