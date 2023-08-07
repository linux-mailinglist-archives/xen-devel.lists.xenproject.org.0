Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F0277335E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578977.906775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I6-00033o-6v; Mon, 07 Aug 2023 23:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578977.906775; Mon, 07 Aug 2023 23:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I6-00030O-3D; Mon, 07 Aug 2023 23:05:34 +0000
Received: by outflank-mailman (input) for mailman id 578977;
 Mon, 07 Aug 2023 23:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9I5-0001NS-9q
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:33 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8055483-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:05:31 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-586bacac98aso22849667b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:31 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:30 -0700 (PDT)
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
X-Inumbo-ID: e8055483-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449530; x=1692054330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhRFpHY9Gkw1pvDSPH6l3PWFnY0Equ+A7zpvUAn8VQI=;
        b=i3yG/elNSvAKIQpu+LnaQkf9aWr2RTSDWZ0bD6C1RLjObUv19W0XGp5nQ/WUHqv97k
         3F3d9T+x+RGssi2D5sQsk0sbYNBszDeUty4Uz3WYnNNnOAOtum0uoqfNv64CjbJYI2vt
         5W+yDKCq8CPlPCKNltLocOrpvWmx0Hi9m5r7qQtJGuYnsVLA+FFqMS9EVAuWM7bu2InG
         Y2OLsVw1zQ1ypzE/Wu4y0WN08yQxAbeMR9OdyOcp5d10YTszQgqk88e/T18v49VnUb5a
         Be+cx3DsqCXaxjSPwUg4xCjeVNpaDlwm4eDVW83zp+7fbc6H/u+IOUuZtg+F6GjbM9PA
         0MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449530; x=1692054330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhRFpHY9Gkw1pvDSPH6l3PWFnY0Equ+A7zpvUAn8VQI=;
        b=F7EAUAJDnVp7o5Pa7vq9Qo2pX+eYnuRRouFa1kohlZiDWG9wgihj7YPyKRtdFj2CC1
         nk9huPM0ogpNYeQJuIhifcM/sBD9k8VZxp/gLFwSJi1U5KzHB0ku1UkoB/KnEp55FCBg
         keLm4DUK5BuCFzKW8N/Gn4moD043YwrpJHsFGN20YDMCXBptqcWp7AcPdxogyOo8TP1G
         xfPHNtJuQ5ToEz7dlaPV3uOxHm9VS36blptmhgJpmSJ84jgPNc9meLSU1nXwXkP3bSO1
         X5ZBYXMZJxcd8+s/mbAshUnpl0XqJl8NFoaskZXV1sSe8gNWbsnFaoiMQsaCszXF5K1w
         bDOw==
X-Gm-Message-State: AOJu0Yyr1GD2mIpTYDPhzeNXC7NusdYxIDMHXdxfmqwqLWcAR9cwcuG7
	4UxmMy3z9w5sTpzsdKO/w4c=
X-Google-Smtp-Source: AGHT+IH0ZW2oaxdE5zMBv/D24ibnqwE3DqpI9lmZfRLWAk1KAOJsXcFTPw6pcD+tvJtRgJ78+52WaA==
X-Received: by 2002:a25:fc3:0:b0:c21:4bc4:331d with SMTP id 186-20020a250fc3000000b00c214bc4331dmr6829336ybp.43.1691449530544;
        Mon, 07 Aug 2023 16:05:30 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 06/31] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:48 -0700
Message-Id: <20230807230513.102486-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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
index 6aea8fb671f1..bc82a64e5f01 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2863,9 +2863,9 @@ void __init ptlock_cache_init(void);
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
@@ -2881,15 +2881,15 @@ static inline void ptlock_free(struct page *page)
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
@@ -2904,7 +2904,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2990,7 +2990,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.40.1


