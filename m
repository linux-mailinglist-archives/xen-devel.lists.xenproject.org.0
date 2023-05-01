Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2426F36D3
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528087.820747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCc-0008Rf-1l; Mon, 01 May 2023 19:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528087.820747; Mon, 01 May 2023 19:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCb-0008Ip-Oz; Mon, 01 May 2023 19:28:49 +0000
Received: by outflank-mailman (input) for mailman id 528087;
 Mon, 01 May 2023 19:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCa-0006PY-Jj
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:48 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6416506e-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:28:47 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aafa03f541so12193395ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:47 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:45 -0700 (PDT)
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
X-Inumbo-ID: 6416506e-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969325; x=1685561325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsNph+IH8G9kAdlfpPDvdsVRvR3y4GWwc24n4bCHoNE=;
        b=ORzYAt4fgaepA0jj/nxqG5QCQUnwh7Hd86B8NHpvgQ9XS5bxCw6FjAddYAhSWVBGhs
         RguloM+rsX2sX5k8L8jQmcK3uoCnItaXGukxO2sNFKQkHNbJapaDcmG0iMAuRZwI8f8t
         xe4tIz8OOyBZAi/AlwagFAtmsldgUDQdHIa2vdidJh9lpo3fAW1D+2jPZJhQXOxhvdZs
         c4hk+WfixJsxNAANDMRcuNKXIxHiA6rEY6QaL0IGeoKtL1JoS6dBJBARbulTJ6NVKxdj
         8lac9J2KQ3hHBoBfb7fQ//alN+wtsMCP7K7b5tVdh9EZXnnMD2pBGWAPXyEldDpkm7ax
         zAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969325; x=1685561325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsNph+IH8G9kAdlfpPDvdsVRvR3y4GWwc24n4bCHoNE=;
        b=ZaiErvj8TPLWpxsSqn9Dgzlq/HirYyxLyNcGFr8PQvMHYRGG8yrgNCecvT11dSLtsd
         pK5OuzCwzI3JhZXo98VzwVqLhi1bRMa67P7mxybf2cqaNm2cxjSAFy3eXD/oCd6YierZ
         yV7NsQGbOSPLan0UwWAytGFNhymXdLGMXnBfE7eDRHVHBWwJiiOUl9QqsU1LWKtxkHf9
         CKF4WvTjdo+oQRcbDqgDBObqz9f3ouyBB88ajY8iFLLxeJ8tYxhk/fm0qsLMbqR45uzL
         vQWlTykP1pC4+9ROj5rnVwrqhLxIHppgJZrW01qQWrKO0xtfwZXWGV+R57UG8X/DDTQO
         sX+Q==
X-Gm-Message-State: AC+VfDz845i7BpAdJX4TFQSS7VMFvjEPbvq4r03d0QAM9Dh2IC8Cwwx9
	DPHeqjufSKa2kcgUI3xXXtg=
X-Google-Smtp-Source: ACHHUZ6Hyp/uTZNVOfbVle27YVii8Y9q7eyatfM6y5VDboeAGhZWSkyjhlYeOczpnOUzLbM+Y5y88w==
X-Received: by 2002:a17:902:da90:b0:1a9:b902:84b9 with SMTP id j16-20020a170902da9000b001a9b90284b9mr18090785plx.24.1682969325399;
        Mon, 01 May 2023 12:28:45 -0700 (PDT)
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
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v2 08/34] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon,  1 May 2023 12:28:03 -0700
Message-Id: <20230501192829.17086-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
index 565da5f39376..49fdc1199bd4 100644
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


