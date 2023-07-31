Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5667769DA8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573248.897815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJG-0001jD-UB; Mon, 31 Jul 2023 17:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573248.897815; Mon, 31 Jul 2023 17:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJG-0001fF-OA; Mon, 31 Jul 2023 17:03:54 +0000
Received: by outflank-mailman (input) for mailman id 573248;
 Mon, 31 Jul 2023 17:03:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJE-0008Np-Nw
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:52 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38943d5d-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:03:51 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d35a9d7a5bdso498167276.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:51 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:49 -0700 (PDT)
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
X-Inumbo-ID: 38943d5d-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823030; x=1691427830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNVCmnQN0ufsotHop6mLPsVoSXSsgvYy2QMaIqEOqi4=;
        b=HGhOeQ1TmAKeV2HnCN1WTfuLUUGtIM4rPFVA9FLFfXc9y1teMeCMXYfLrn52VreEZa
         +8fuD8Eo9GHKIiGXji1nVJr6hJp1UgozAoPycNtpjPeWKRtcHWia112SYBPlfjErevM1
         f1KBsm+b9biDP/8hsnmQLIxx1WqbIsap7/B5vxAAg5UayZGm1/xCMe4ANNoVXkXqO5f9
         zYPLJX2R/yJdpXd33yeHG335BLgfWD5asDdFJsvc7qa94OZvu247hqr11p/tySJkF1N3
         XZqqjnjnJwS4MTyfAeLK5z9Se8l+uTUdMKVbakuD0ppwzC8LFvwdJ3Q2bHVnQ+Hr6zUD
         fqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823030; x=1691427830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNVCmnQN0ufsotHop6mLPsVoSXSsgvYy2QMaIqEOqi4=;
        b=UxXY3ySpG9wtbaf1zNUePtrMqYoJt/xeH2kB67+/qajo8P91vFxsY2h9v4Is55S55C
         YiEABUYSC6V7QX/GJRbO9aXxBw01VKC3wdHCaR4o0l6oXrQm59BoBPx3JD9ifdBRG4sb
         hsVwmrXKeIbpyP1iIwL9r2OdMmy58x5qZLXOslaFbSFO4xKKXYUtFwAKNUc4HGUIHY36
         Xy2Oa/Zr2TQeJcdPsDPxIX4TjdpJNKdtuZ8d1ObxI/Kv+4q2yC3Q/nRq9W+DmVJjqzuH
         MFjueV1HmDZpMxJt6kTd4ItLuLB/Zi2thycj1FPcsjQh7VW23cIcoouJV1MHJrc9fMy0
         mVbg==
X-Gm-Message-State: ABy/qLZvZ9wGzBgPI8kW94wCsdKP4l2LjIYCpylq19/k7i0sqiHTJhNS
	gXQiFetSbq2q98lOTVtvT8A=
X-Google-Smtp-Source: APBJJlEF5eMDgJhVfaLglGwfP9JkFsRVPWZwav0NLe508KhOsIkmqr6LHjKMWH59Isg1gKZnQYYAJw==
X-Received: by 2002:a25:ae5c:0:b0:c73:9f38:2b3a with SMTP id g28-20020a25ae5c000000b00c739f382b3amr9095220ybe.48.1690823029862;
        Mon, 31 Jul 2023 10:03:49 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 06/31] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:07 -0700
Message-Id: <20230731170332.69404-7-vishal.moola@gmail.com>
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
 arch/x86/xen/mmu_pv.c |  2 +-
 include/linux/mm.h    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index e0a975165de7..8796ec310483 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -667,7 +667,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
 	spinlock_t *ptl = NULL;
 
 #if USE_SPLIT_PTE_PTLOCKS
-	ptl = ptlock_ptr(page);
+	ptl = ptlock_ptr(page_ptdesc(page));
 	spin_lock_nest_lock(ptl, &mm->page_table_lock);
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b3fce0bfe201..c155f82dd2cc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2844,9 +2844,9 @@ void __init ptlock_cache_init(void);
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
@@ -2862,15 +2862,15 @@ static inline void ptlock_free(struct page *page)
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
@@ -2885,7 +2885,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2971,7 +2971,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.40.1


