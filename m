Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABAB773406
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579045.906935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K0-00034S-KN; Mon, 07 Aug 2023 23:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579045.906935; Mon, 07 Aug 2023 23:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K0-0002y4-2H; Mon, 07 Aug 2023 23:07:32 +0000
Received: by outflank-mailman (input) for mailman id 579045;
 Mon, 07 Aug 2023 23:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Ie-0001NS-Ma
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:08 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcbd8f71-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:06:06 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5768a7e3adbso87638447b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:06 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:04 -0700 (PDT)
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
X-Inumbo-ID: fcbd8f71-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449565; x=1692054365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCvcoKWLGx6gAjym9VWVFszZElqPM/KxU0nQCUs9lhU=;
        b=UEUmdRWyflXklFyhNX736vuEaqgiuaE747b2iDMdbsntaDVnz91uxqlH5BcdgyOH5x
         uvJaTvPkpQGN9akIqApZ8zKHvLZguej6njtjOnVMX/cM5jmsFezl/LYYVYVkbeho4b0z
         HHNTILzp+Xc4v6kzsuUo73oAPiN0CJazQDUAwcPLlet/lIEFQgMVrv8B24qA6Hz5wjkw
         b8w6Ifa5zhm6L11dsVrnJ9eA4XJTM6QxI5QWilhFcSjtgNKdoGywloLoSOAO6BZpBMSb
         8CiRrKjceUBw/RGFjWiyE5TzR9GZJ5T3ThAn9ujnfgeZbAfe+0n8PqgNKPCIQtpGYCsJ
         QRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449565; x=1692054365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCvcoKWLGx6gAjym9VWVFszZElqPM/KxU0nQCUs9lhU=;
        b=R3JunrGGIQG4Q5OK2PgYMTv1KGtPqRpCwyJobbEGp9haYT7vep3l4hkE/VQYH++fYD
         KarZ6YZrbkZCUVdkkBlsJMaTJoXg29ivTwpUJjCDD/1/bmz1JDU9ZaybWm42CtQ4dYqk
         h6g1vByCcFsfJPkamPkdK8TmRqK9kqNX33Mf8wSxX2rfL7PrB6b7Yy8gg02+hnCLQFPz
         WqMzODD3i/AnMeGXGpk+WJtjy67hGPPtS6lFLCO4zukAIMdmvGDQ3RdultwbFfgnG15F
         NjjjmDSgvlzEKS/wdX6F7aRnGy2v9ah7i9BXzhPiV7wv58wI5IcBAePP+lo5+vBbq78b
         GKYQ==
X-Gm-Message-State: AOJu0Yzxxp94PQD0eNt918+CMDtmGiHxVoGeT/Cv+CQcRt8WwyiohYdS
	ubtgaGEKZ8H/g3qcooQ0F3s=
X-Google-Smtp-Source: AGHT+IEqzmUPQsWPkdBtUj3V9QXK122J73o4hp/g5UvHeQgKIN7qrVubtY48PFSpogl4MBW4UXPeVQ==
X-Received: by 2002:a25:944:0:b0:cb4:6167:a69c with SMTP id u4-20020a250944000000b00cb46167a69cmr9868214ybm.8.1691449565251;
        Mon, 07 Aug 2023 16:06:05 -0700 (PDT)
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 23/31] mips: Convert various functions to use ptdescs
Date: Mon,  7 Aug 2023 16:05:05 -0700
Message-Id: <20230807230513.102486-24-vishal.moola@gmail.com>
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
 arch/mips/include/asm/pgalloc.h | 32 ++++++++++++++++++--------------
 arch/mips/mm/pgtable.c          |  8 +++++---
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index f72e737dda21..40e40a7eb94a 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -51,13 +51,13 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_pages((unsigned long)pgd, PGD_TABLE_ORDER);
+	pagetable_free(virt_to_ptdesc(pgd));
 }
 
-#define __pte_free_tlb(tlb,pte,address)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -65,18 +65,18 @@ do {							\
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pmd_t *pmd;
-	struct page *pg;
+	struct ptdesc *ptdesc;
 
-	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
-	if (!pg)
+	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
+	if (!ptdesc)
 		return NULL;
 
-	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_pages(pg, PMD_TABLE_ORDER);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	pmd = (pmd_t *)page_address(pg);
+	pmd = ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -90,10 +90,14 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM,
+			PUD_TABLE_ORDER);
 
-	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_TABLE_ORDER);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
index b13314be5d0e..1506e458040d 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -10,10 +10,12 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM,
+			PGD_TABLE_ORDER);
 
-	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_TABLE_ORDER);
-	if (ret) {
+	if (ptdesc) {
+		ret = ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1


