Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6F718C10
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542018.845449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPl-0000vg-41; Wed, 31 May 2023 21:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542018.845449; Wed, 31 May 2023 21:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPk-0000pl-Ur; Wed, 31 May 2023 21:31:28 +0000
Received: by outflank-mailman (input) for mailman id 542018;
 Wed, 31 May 2023 21:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPj-0006xu-70
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:27 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f27acc4-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:26 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-56896c77434so1035227b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:26 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:25 -0700 (PDT)
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
X-Inumbo-ID: 7f27acc4-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568685; x=1688160685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzKQXlz5IDfPvgDKTOeCKkz+dXM61NoKgwUhpTupiUw=;
        b=hIfmjb5X06SZ3BaD9NYBS6hgA+ayAquIKaVHr2BHnLBOPZKQ/J4ZAsHZVuEaw1F1C0
         DLhGZpjTZZFs02UVgouMcVD7Om43dfavrY/9B0xqLArccnIFv4HyErh7ebqkxAVmYpAt
         c44ATu4lPRNkYKf1axyVO8gXjPrDMUnXOwNjgt4KrmrL4IpwwDNTjXfR8pLFfm5hWJH3
         A3an9It/QF6RuKMl0LJM9Di6sd8T8h9NIoEvAXZjtMgMuUIFQhhIMF5orERUADpDZzUC
         JdcxeDPS4ad7hb6jzXYz7QYZfeE2bjaq1vVtDaxxKS7PVXsoR09l6Ff83vLOpPnhM1WL
         QcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568685; x=1688160685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzKQXlz5IDfPvgDKTOeCKkz+dXM61NoKgwUhpTupiUw=;
        b=izskBxoFeZz+yuFhUwnVUY1pA7VfYdg4yQKUEj8qa4vwyqAEHJDdOFr9/+nQl+H9K+
         9Oy8yvbqUUvBImpXO74n1u2Ag5aueQRKN1k4W39O534t57KHYty1tn6j8AxaWtMItUPZ
         XjB8kow6ADcHJJs95t3l05mH92DNo/+zwG4Yv4GHWIfGkogfnGgRWKEjPeZxJZSIs0lA
         YatKm/kbp8rfIavcStLh0N1ZJK+6QGQ+yijUwlrQt3n7WCbooBymMO9x6+e+2wBUIQZg
         HzWegDWl5jK1t/HASy2WIVIuBnWbNiM/g6Vj+zIIQSO2GWWu39CHkLuaHY5o6BVNA5/l
         8JoA==
X-Gm-Message-State: AC+VfDytU0AxS/kOtwfIvN/9Aqt7JJIghrkA735K23sRIECNQ6MwQp4X
	5+GSINJ2QGwtKLDhyZ3ACzk=
X-Google-Smtp-Source: ACHHUZ4penqUBoef5VZ7RS39HNNXGjV3amJwKYqX+6tsdiojUfn+sW0Rg5ayNGX0C78Cc9bsT/rYzg==
X-Received: by 2002:a81:a113:0:b0:54f:752e:9e60 with SMTP id y19-20020a81a113000000b0054f752e9e60mr6993857ywg.37.1685568685351;
        Wed, 31 May 2023 14:31:25 -0700 (PDT)
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
Subject: [PATCH v3 08/34] mm: Convert ptlock_ptr() to use ptdescs
Date: Wed, 31 May 2023 14:30:06 -0700
Message-Id: <20230531213032.25338-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
index 1fd16ac96036..6f7263fcd821 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2809,9 +2809,9 @@ void __init ptlock_cache_init(void);
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
@@ -2827,15 +2827,15 @@ static inline void ptlock_free(struct page *page)
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
@@ -2850,7 +2850,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2920,7 +2920,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.40.1


