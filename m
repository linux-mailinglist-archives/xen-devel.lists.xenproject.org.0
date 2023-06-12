Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D572D17A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547478.854957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oip-0001VV-II; Mon, 12 Jun 2023 21:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547478.854957; Mon, 12 Jun 2023 21:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oip-0001TG-BG; Mon, 12 Jun 2023 21:05:07 +0000
Received: by outflank-mailman (input) for mailman id 547478;
 Mon, 12 Jun 2023 21:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oin-0007zJ-3j
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:05 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc88bce0-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:03 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-56cf34a3c72so28375667b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:03 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:01 -0700 (PDT)
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
X-Inumbo-ID: cc88bce0-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603902; x=1689195902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hP9xC8dm7FmaxDqq4kyW1FngYvGoyLv+4GJfd5pZsk=;
        b=CJYIsJwgfTu/y/lqnJP/t9il82a33oAqvZUzCAqj1B6hDybKBkJzlI1M4tHng7gsKh
         wjldrdty5LsQxwcte5A4qzxTSyPWsC3prP09MuDZHhuDdW+KkIuzhNtB1OGIf0fmEYwq
         PbjgzzODbpwoqx2q55Rq1VMyrgJdF+EsVRaRlosxhaI2WYgY5mJZUdNXguDU4uoU3hsT
         HNsA8NDHAaVm+vxqugHLiha5If8egzZBwoJM3N2OKUEJMszToVmHBrGqCteUXmcF8+W9
         CJfXWgYf4SrrnrL4x4+oaqBHqtUA2nnqH+olViH9ENIys3R1pjxamFF3W5tG5eZyHhYN
         +FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603902; x=1689195902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hP9xC8dm7FmaxDqq4kyW1FngYvGoyLv+4GJfd5pZsk=;
        b=DDypH5rdAyoTBicuM8nvbTqwWVETn3NH/R3ebQ8Hk1s0JunGIIScWJ1gs1hKyQKPnb
         4pzIpA+Ib44obqPkhu+wyoRDDHwK3dwHLAYd0VT9eHYeJCkAJFyfL/+v8KbiM2FdySrt
         Vu11hJdWw7UJgDzQJ99cxdHLcgD8ARhGer23jhSq2SXN+YleHWm4kdODt8FK3VZcV42e
         HlRvx6WEKZC5GVD9aL+teyw8nltRwQzkZ7cwWPk8sXKMrB7TTXS/3rRHTMoWvfwZPPod
         9trPQ+v0DRUoanlNUZI32Jq0hVvDA9lw9YlYEiP0TVF1Z/wEtVkAt7d7qGEoW/Ajfi69
         xUQQ==
X-Gm-Message-State: AC+VfDz0oz07/oi/QMm5ALWNoSbEsNE04jeIKo9n5GZEqjTvtC4exG5W
	DnDit2pVUWGky0hSTiWdEo0=
X-Google-Smtp-Source: ACHHUZ5ktkx/ASoBV55sneLmyoKAwlH0/qlI6IE3eWY9yaMnSemMH48l10CKm48pG/hNrIF3qCc62g==
X-Received: by 2002:a0d:d713:0:b0:56d:5286:51f5 with SMTP id z19-20020a0dd713000000b0056d528651f5mr1015907ywd.28.1686603902249;
        Mon, 12 Jun 2023 14:05:02 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 08/34] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon, 12 Jun 2023 14:03:57 -0700
Message-Id: <20230612210423.18611-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
index b3b8d289b9ab..f469862e3ef4 100644
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
index e6f1be2a405e..bb934d51390f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2828,9 +2828,9 @@ void __init ptlock_cache_init(void);
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
@@ -2846,15 +2846,15 @@ static inline void ptlock_free(struct page *page)
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
@@ -2869,7 +2869,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2939,7 +2939,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.40.1


