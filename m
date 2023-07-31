Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA92769DA7
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573250.897830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJJ-00029z-Nw; Mon, 31 Jul 2023 17:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573250.897830; Mon, 31 Jul 2023 17:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJJ-00023k-I9; Mon, 31 Jul 2023 17:03:57 +0000
Received: by outflank-mailman (input) for mailman id 573250;
 Mon, 31 Jul 2023 17:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJI-0008Np-O8
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:56 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aedcbda-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:03:55 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bff89873d34so3787006276.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:55 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:53 -0700 (PDT)
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
X-Inumbo-ID: 3aedcbda-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823034; x=1691427834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy/rMhqpUcv/05FOZn+4srvOxwPFLEA5us+pK4Rb6lw=;
        b=V/96hykns8XVM5vLmRXG/u4xSypUgGiGwrOyC+rZQj+rcZ/GpgCOArv+BLqwnK6ndI
         s6FLSAxMDlFyUBDNQE2VhRek5g328y+/ccd+AsCeEjwXU0hVeTp7lQbn+jR0/Talq7yP
         X53eA6P253fr2h0Co5LkgUqrydVRI6I/ApD8z89cYAQIEmQbjgDCE+0t6nBNrgVReKu1
         hKceHGETSaBcw+wqVyp5iupRKeJkqfupmvumPfxkbIwnP/D5j0bL4ZMnmoLVvjw3thur
         HGuYrC1zSSdz4NYzQoV0QVVrCZG7E5Ll8cUs/PSqUH3UyhbWaZjmYOzvlOZrxF4wqCJv
         qIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823034; x=1691427834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy/rMhqpUcv/05FOZn+4srvOxwPFLEA5us+pK4Rb6lw=;
        b=RDSlCyyQbuUtUK4/53UgdMvIscu+BDdikFA0IRFtdumVOpT+Xrhx+tAs4d1sgteiVp
         79Z+xLS2dMRL1Z862SXYiafldMJdSWs+EpUcEM/R6kPUak5PhNN/H8Su25wOvSMOvPhB
         PgofpEkurQfMK9XaSmn/tIph+TTG8eOxw8nWh5KihrS6OMc7qgz/VKrMHcFtmLlhMQW9
         38ieiQYefFcbB3SaFniuBYHmHmR3urithhJ1uNaSjF9Y3tKLfskjnU4hRkdWQsKIuxDl
         GFbt06q70WUw6oUgrtyXY1mFUxvj5U4SuP5drnaZFeF3IBIkLOpj2dT+8WQSQzXeurpv
         gRcA==
X-Gm-Message-State: ABy/qLauqFfTHS7nhJDzOukAplftyTuqlPIv1ECramVqBlTfquZ8Kgzy
	9TENioBy+m1yRgtnrskE9Go=
X-Google-Smtp-Source: APBJJlFl3cMRdcyGTSqylTcgbFymQPUIeV+vjMCwSs3kC0GtKDKYI1e8i0USnYA5QForqJcTrXzM0w==
X-Received: by 2002:a25:908d:0:b0:c67:5aea:97ba with SMTP id t13-20020a25908d000000b00c675aea97bamr7117064ybl.50.1690823033777;
        Mon, 31 Jul 2023 10:03:53 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 08/31] mm: Convert ptlock_init() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:09 -0700
Message-Id: <20230731170332.69404-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 52ef09c100a2..675972d3f7e4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2873,7 +2873,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2882,10 +2882,10 @@ static inline bool ptlock_init(struct page *page)
 	 * It can happen if arch try to use slab for page table allocation:
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
-	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page_ptdesc(page)))
+	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
+	if (!ptlock_alloc(ptdesc))
 		return false;
-	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
+	spin_lock_init(ptlock_ptr(ptdesc));
 	return true;
 }
 
@@ -2898,13 +2898,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 static inline void ptlock_cache_init(void) {}
-static inline bool ptlock_init(struct page *page) { return true; }
+static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct page *page) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
-	if (!ptlock_init(page))
+	if (!ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
@@ -2979,7 +2979,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.40.1


