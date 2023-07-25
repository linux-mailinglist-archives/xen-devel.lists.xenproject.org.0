Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9B760766
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569360.889853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y4-0003mp-6i; Tue, 25 Jul 2023 04:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569360.889853; Tue, 25 Jul 2023 04:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y4-0003jM-1h; Tue, 25 Jul 2023 04:21:24 +0000
Received: by outflank-mailman (input) for mailman id 569360;
 Tue, 25 Jul 2023 04:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Y1-00023t-Vq
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:21 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b48fc086-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:20 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-c11e2b31b95so5469540276.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:20 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:18 -0700 (PDT)
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
X-Inumbo-ID: b48fc086-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258879; x=1690863679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNVCmnQN0ufsotHop6mLPsVoSXSsgvYy2QMaIqEOqi4=;
        b=KDYHcYEdfvpzUEFX0lNkksdcmQYTfb1isarY0fEljmc2IAYrJ5nDDg/7JZU04JTP3L
         c1QFP/HGIvTwW+tPYnlNpNTf+bNvT4Orf2hELyP6ANZ15n2MuBFPHNYtsv0S4hi5lotS
         plPoF0Qd+eEXR5m8DnmPEfjKpZQYq5r/wJZjYdNGeMiNfjBcVsPF+85ffm8Hp1058zGf
         E5mhpdv5sROIr4fRE4AWEGFCJJhFOSPgScin1k95zzp/7dsKEN0qwGECqGpXVDa6nTcU
         k6so3Cygyv6WxOWRYm0T8muDY8KTb9y3edYXGJvaWKcZYnoxLAplBnufWrEfQhIBMbq5
         IGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258879; x=1690863679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNVCmnQN0ufsotHop6mLPsVoSXSsgvYy2QMaIqEOqi4=;
        b=PUUxBuxE2nIxzV22Nq0qk7Ipq+Kh+YdnvdxLspBpxFEwgG0hHwaZqhrexIg82+rDIP
         SMh7U6TKELBQuRmM90x/AlW/ShYyf6Zi3E9sQ9/DypaemTXMoANFGhP/aDu4oUFiVduk
         eCIHP22FYgb57DPFlJfvMmhG/mbzugbor9PGweEy/2s4HXc5kgJ+Jy1TFA4iR66AC4wE
         iQX9UJoOgUufooiMY9pGxREoy259aT0VwJuXwPuyDBc245Z0jOQ/sTEg/9SsTACBOnaL
         vW9rr9HLum4CTPbpkAB9NUBPp7F0ImmQvYlAjDxfUfDFotvB6CuK6/eFoM9ylTnyWStX
         ascQ==
X-Gm-Message-State: ABy/qLYwld4P5fPoDs/f2thUHfM1MtW2b8so64kyYn0DL4Wa1e+JjH1R
	B2veSwMQLGpufAX2U7cJE+GlPRLi3MxIeA==
X-Google-Smtp-Source: APBJJlEiFrFEbevAO9Lv8rv0gB/m4nTd0LDSBWnZ0KZCrLtO0+gMBzxp+Bweq5U88z1Cb1Q1T0NNwg==
X-Received: by 2002:a5b:cd2:0:b0:c1b:d362:4b49 with SMTP id e18-20020a5b0cd2000000b00c1bd3624b49mr9588966ybr.50.1690258879241;
        Mon, 24 Jul 2023 21:21:19 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 06/31] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:26 -0700
Message-Id: <20230725042051.36691-7-vishal.moola@gmail.com>
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


