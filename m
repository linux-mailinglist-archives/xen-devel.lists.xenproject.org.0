Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A76E52BB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522334.811641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrA-000727-OV; Mon, 17 Apr 2023 20:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522334.811641; Mon, 17 Apr 2023 20:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrA-0006mq-7F; Mon, 17 Apr 2023 20:53:48 +0000
Received: by outflank-mailman (input) for mailman id 522334;
 Mon, 17 Apr 2023 20:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqM-0005NG-6g
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:52:58 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f0fd64-dd61-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 22:52:56 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id p17so16169835pla.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:52:56 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:52:54 -0700 (PDT)
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
X-Inumbo-ID: d3f0fd64-dd61-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764775; x=1684356775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rEN7TkKGGrS4Nr1e9+VSo1FDhdsaSEXyIULzlMdAE4=;
        b=EY4pAo5dPiMdURcOVQM/Apa82VCO0I/XR1aYYt5qSz76HGumyOhUfKwA9+Mr5OFHh6
         y4qX3lmzBRH5sE5hiL3G5H7+P1vU90VNiEuutpY92Aii8KdV81S7nJ0QBzccPQA4L2A1
         H0r+gFj2e0wYN/AG4aVILv2cjCWqAiomeMPXPkWjszJF01iQ5TmXH8Bsz45QUOgwxoQ4
         sHC8DrgU25+a1fsqdhglJSyR11j/cBOYD1x2MxJDA6rfBM+Ci8Y+wWCZicg642iTcaFB
         y1U70avkZLTukuwNbayq0JR0dDmctnOUY0ghxZuZ1egx4BqGjtzmW9DXZrJYTWGZ5wwv
         sRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764775; x=1684356775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rEN7TkKGGrS4Nr1e9+VSo1FDhdsaSEXyIULzlMdAE4=;
        b=XD7NH1BpGaiMI6QZSq1yUzW019cL7ZibUWDL4abYOVIetra1c0anczP6u1JWIzGlST
         iOY6GGhGHlIkTwrUwwLW97DwybFn/bSO8BZ++eG4UQ3xTjYvwVsNrKGZeugA5I4Fe2jY
         nSN5dnyKxUd11ZwvZMmYgy6A7hFliWagezKSo+WyHeym+M4tZAFKHVbuOLeOy44P6EtB
         IJmTM711bCfUGaDa9h04NMNS7SODH/HN/TEoXF8N3pkXSpIQjnPwv3isxR4x+1QnX25b
         Lmhq5BIsX0a4B0wCkRNOVwbWjIUFbaUiOrz0Nq7LRaXWEF7V6/3GzONbFBgZKIVj5is+
         FJqw==
X-Gm-Message-State: AAQBX9e4H+gI/3K1mCAtsOAB2MpHae8iP26ysEROoNeuDuef2NcVKtw0
	pG0jbSjk2TXcN0hb6FfrZX8=
X-Google-Smtp-Source: AKy350Yghynh+/JYw1Y4OeSQkY97RuGOXV9v1JZPlpoHn0H6WhBdjqt/CneUg+QzYmLvk18Z1w5zNw==
X-Received: by 2002:a05:6a20:394f:b0:ef:b02a:b35b with SMTP id r15-20020a056a20394f00b000efb02ab35bmr6833020pzg.0.1681764775054;
        Mon, 17 Apr 2023 13:52:55 -0700 (PDT)
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
Subject: [PATCH 07/33] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:22 -0700
Message-Id: <20230417205048.15870-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/x86/xen/mmu_pv.c |  2 +-
 include/linux/mm.h    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index fdc91deece7e..a1c9f8dcbb5a 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -651,7 +651,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
 	spinlock_t *ptl = NULL;
 
 #if USE_SPLIT_PTE_PTLOCKS
-	ptl = ptlock_ptr(page);
+	ptl = ptlock_ptr(page_ptdesc(page));
 	spin_lock_nest_lock(ptl, &mm->page_table_lock);
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 17dc6e37ea03..ed8dd0464841 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2789,9 +2789,9 @@ void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return page->ptl;
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
@@ -2807,15 +2807,15 @@ static inline void ptlock_free(struct page *page)
 {
 }
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &page->ptl;
+	return &ptdesc->ptl;
 }
 #endif /* ALLOC_SPLIT_PTLOCKS */
 
 static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_page(*pmd));
+	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
 static inline bool ptlock_init(struct page *page)
@@ -2830,7 +2830,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2900,7 +2900,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.39.2


