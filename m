Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E291E6E52B0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522341.811671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrD-0007g6-Gw; Mon, 17 Apr 2023 20:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522341.811671; Mon, 17 Apr 2023 20:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrC-0007Z8-Kc; Mon, 17 Apr 2023 20:53:50 +0000
Received: by outflank-mailman (input) for mailman id 522341;
 Mon, 17 Apr 2023 20:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqQ-0005M2-SR
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:02 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d77a87e0-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:02 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 k36-20020a17090a4ca700b0024770df9897so6598410pjh.4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:02 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:00 -0700 (PDT)
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
X-Inumbo-ID: d77a87e0-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764781; x=1684356781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc0m/U8RaSqOAaIvHe2pZ8la6AwQPtvql1ppirfWYYQ=;
        b=FTIIrhTe8vfWt4jgLQ0zryZ+NfsJ/OFhYpHyrwEJjHtN6fYrjayv1wmbuEiWrZWNBG
         Ab6oC0JEVFKaVtr5ERs/HGyia4m0cuJPp54Y6qKJvGxwoWwnKA3jL+mq6GAMCgFGvFWn
         bEbIp/iuCRzaSQasJ9iYfHsEIZ8C5L6UBjIsqJjVLRNCdj3wFA0VCJaoyvqsQShlPxAr
         nn14k2m42+J6xR2hfl2ffw8tFItkZsF+DKNsuBC18vZWoMB4mE4FcDOZiJ4pqP0DqYky
         PjLPxBMY5gAsTXZg/iGvnD4lxFGHfkuFymQLt7EWHTlIBpCDY+iSj33ZpMo6EFdNFztz
         HYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764781; x=1684356781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hc0m/U8RaSqOAaIvHe2pZ8la6AwQPtvql1ppirfWYYQ=;
        b=eUaK2+U2+1SbLEbiyZ/TTRxTUvM34xSPJ8d6ZVsC3Z6gA6HaW2wYdRepxBi4KskkGl
         ZaUXUuiHZ4PPdFouiVmSascoqvk+YfUJDmyUXMXglR/sH7WJI0b9u0Zjps1Mr2B1w/f/
         gU8SUO3AUp7ioopIkwFHJkrVzrhLNgbOgSlff8dP8wCQBVTg3o/K+LAV3eYVUqw+kHhK
         aU9VU6ixB8tESWMgmz5T58HeXXbtS9+dUJM1Q0Nm6o2KF1KOgo3D1amleqd+Tnm1mexk
         a6ecU3EiI+nJ00Zh8EBws0W0IobNVmn1yIrtQRBiRpp13wBuRDYFYi/JWD7zuwA7dPj/
         +/KQ==
X-Gm-Message-State: AAQBX9dF8vDG8Pd5vA3cAAtxipqn98OGIvT23JZA8GszCqqYhr4vlq/I
	Sq9ufeF/8/HcVl8W/xZQheU=
X-Google-Smtp-Source: AKy350ZMofF2taT9lCtSfGwXj3mTLikp6R4dNTLL/p579XSegIqzslR/71TUEAWTkG6EWBZpLey91g==
X-Received: by 2002:a17:90a:d143:b0:23b:2c51:6e7 with SMTP id t3-20020a17090ad14300b0023b2c5106e7mr16554327pjw.21.1681764780697;
        Mon, 17 Apr 2023 13:53:00 -0700 (PDT)
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
Subject: [PATCH 11/33] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:26 -0700
Message-Id: <20230417205048.15870-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2390fc2542aa..17a64cfd1430 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2787,7 +2787,7 @@ static inline void ptdesc_clear(void *x)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2803,7 +2803,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2844,7 +2844,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2858,7 +2858,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2916,7 +2916,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 37d408ac1b8d..ca74425c9405 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5937,8 +5937,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-void ptlock_free(struct page *page)
+void ptlock_free(struct ptdesc *ptdesc)
 {
-	kmem_cache_free(page_ptl_cachep, page->ptl);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
-- 
2.39.2


