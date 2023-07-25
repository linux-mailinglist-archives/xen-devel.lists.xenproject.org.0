Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DA276076A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569361.889863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y5-00044C-Fl; Tue, 25 Jul 2023 04:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569361.889863; Tue, 25 Jul 2023 04:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y5-00041H-Ah; Tue, 25 Jul 2023 04:21:25 +0000
Received: by outflank-mailman (input) for mailman id 569361;
 Tue, 25 Jul 2023 04:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Y3-00023t-Vp
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:23 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b61e09-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:22 +0200 (CEST)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-cfcebc33d04so5669944276.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:22 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:20 -0700 (PDT)
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
X-Inumbo-ID: b5b61e09-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258881; x=1690863681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=jYui+PKKLrYwW/9bkeBCxZuH30ZLFCfjk6k83i08YHGZs5qBvg098warmUkrhehPA7
         w4YGyti6UCNUragO2itKU02HUpV/ViBpQF9TFUZFW/NNv47MTUMBLJ+3J2/znigqsRJs
         QhHBOUaU/0pdlJBDEn1DtnKR6Jjb52zcMeUqfdcetzMdFupe+5WkVJfD4fN5fJJOsgL0
         e1lfCQXQItA0Ro7t73ofq2YB2adhnzcCWoT2HIbviNcoaPhOqdkOZB4a44aYijkjfd8z
         BHV0Z8ytCVZzLV7QMejslcSqJexW00RaRFmpSqinl2bowLcrU0F1887NS/OPVowYeO94
         sAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258881; x=1690863681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=Y770aFsgnF0a3ZXzn3SxenvjA0V5XLBXV35E5mFnuv+NIwzhNi4tcbg7bsa+9IptWR
         D8i5bDwNOZrNR0vg2Um4qjVzI+Wjb8dr32EH187esVVYhWU9PLDVvD0duE3c92tg4edf
         dhP0fGuXnSaWck3qS3tLG5NkSQGTcEKziwuHSOknOTZH8SRVM+pohMBKQFtcfIuyGHZf
         Fhi0ouEDVZR3sno3kQ3BDRp7xxaxN6URjHl4RJAg0ahhIbdobDRzPKoZ1wm8ybvrOdmR
         LX0vbOfIca0Iu6Pu5GOz2cwbqYnykv4lOd/k16Zd6wEOT5X6I2ISIkPJATJpnoISmogs
         FPcA==
X-Gm-Message-State: ABy/qLY+H55c6tJezO7GmycNlul83V1t9DCIkGds4gD43A9DMU02wAvR
	gWUE/6HSmQlAV3x7msvepqI=
X-Google-Smtp-Source: APBJJlGCGmZmbOTlDUcCFEi74mEzBDVKNi9w9+0D8ZZZqBiNJxZc6NQL85g34qQbwNZIlG7Tv+r/mA==
X-Received: by 2002:a25:356:0:b0:d0b:ed07:7f56 with SMTP id 83-20020a250356000000b00d0bed077f56mr5325321ybd.18.1690258881187;
        Mon, 24 Jul 2023 21:21:21 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 07/31] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:27 -0700
Message-Id: <20230725042051.36691-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c155f82dd2cc..52ef09c100a2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2974,12 +2974,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -2999,7 +2999,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -3015,7 +3015,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1


