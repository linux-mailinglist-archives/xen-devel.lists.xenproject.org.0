Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62EC718D49
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542053.845560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVj-0007Sz-Nl; Wed, 31 May 2023 21:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542053.845560; Wed, 31 May 2023 21:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVj-0007KG-G0; Wed, 31 May 2023 21:37:39 +0000
Received: by outflank-mailman (input) for mailman id 542053;
 Wed, 31 May 2023 21:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQJ-0006zB-Od
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:03 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94408fb0-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:02 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-565a3cdba71so1033807b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:02 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:00 -0700 (PDT)
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
X-Inumbo-ID: 94408fb0-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568721; x=1688160721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVDfvhMIj7WJxaEIn3M83QWohhaKgCSnIk9ScAfRPU4=;
        b=sZVMueiD/ZRZMwtJ1uBmpVp21br88K7Ts0BJnaG9K42MiUpWTkvlqtGrjbXbMcnnig
         ltism/PzSzsT+R/to8b3yQRLDRn38PbBDdqNHRciyJGDmOy9mh7D1lXAJvcHy0PMN5jp
         su04PaNazxgOqRipoXzoczHkJmES+frsRN0f23ykUUyQqSuCIK+AAi0RHbkHHQVi5qyL
         3FwLmSeStb28bpTQ1/hpnTMSIeCoZ802rEkgE91uQZODe47s5OoFtBuE2chhEZiF5V8U
         obYLBCRSZ+tlt5wA8er/wOg+Jr+QyZpX7NHf8eGMHCX/qwho850Ox9fTY+JInMAzI852
         Fi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568721; x=1688160721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVDfvhMIj7WJxaEIn3M83QWohhaKgCSnIk9ScAfRPU4=;
        b=ElfXBQYSnmh1QNh6rsV768R53Cb8un+cmicHDna+n1XdaWyQaB+oKbZi8GKIHgUdZM
         k1hV6Dj+S1+SAfGDJBixmcKBbvYaCRrdGka4eFfhwLJspfSy+tsswmW572blglQO9F6K
         4XyU6D99XV7nhl08hcv51/kzcgmx/ChYJr+6OF7n1BJP5NnyzKU5EXSe2AZX5fjQo+3S
         ZSRjBP6B14W88+YOIKQ8NY/Q9BJ+eG1OMaQQ204pdGyEi3ePa2UDaSzSnrSpB+HcINlz
         ngsnhwMMHoV/apPXcSoh53Ems512InjOK48Wq+Qnn/o5BVdOH4BcZJXLCi49OY2sYlUE
         RD2Q==
X-Gm-Message-State: AC+VfDyjaUGuIL6SQw/ctsi1QqSiwq6qxqnNHLgNiRWsWCKXIsw48XQm
	iBAQC+KyCf3tAf3MqM+PQhg=
X-Google-Smtp-Source: ACHHUZ5JiP1u+Csf8JFW+4lOHEoJa4kJJO4bSkCJf3taGF1GbHqDT+hHsEbp8gGuVkWnLydQNajjtA==
X-Received: by 2002:a0d:cc47:0:b0:568:e7e6:4199 with SMTP id o68-20020a0dcc47000000b00568e7e64199mr4171591ywd.6.1685568720746;
        Wed, 31 May 2023 14:32:00 -0700 (PDT)
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v3 26/34] mips: Convert various functions to use ptdescs
Date: Wed, 31 May 2023 14:30:24 -0700
Message-Id: <20230531213032.25338-27-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/mips/include/asm/pgalloc.h | 31 +++++++++++++++++--------------
 arch/mips/mm/pgtable.c          |  7 ++++---
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index f72e737dda21..3ba1fdb06502 100644
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
+	pmd = (pmd_t *)ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -90,10 +90,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
 
-	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_TABLE_ORDER);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = (pud_t *)ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
index b13314be5d0e..6be3493d7722 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -10,10 +10,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PGD_TABLE_ORDER);
 
-	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_TABLE_ORDER);
-	if (ret) {
+	if (ptdesc) {
+		ret = (pgd_t *) ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1


