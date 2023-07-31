Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C67769DB1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573252.897851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJN-0002sq-3Q; Mon, 31 Jul 2023 17:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573252.897851; Mon, 31 Jul 2023 17:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJM-0002mk-PK; Mon, 31 Jul 2023 17:04:00 +0000
Received: by outflank-mailman (input) for mailman id 573252;
 Mon, 31 Jul 2023 17:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJL-0000C0-F7
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:59 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d4726d8-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:03:58 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d0b597e7ac1so5043261276.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:58 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:57 -0700 (PDT)
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
X-Inumbo-ID: 3d4726d8-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823038; x=1691427838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EZnRhm4Fj3KaK4sFjI+P1mIVDNOtVXSgVauozi7/LE=;
        b=TvM6DExj/MTq0Jm70GY7llkizJv0Xrt3jOhv1061u2jelnUc+8n8NrIEW+BAV0minS
         1tyB2hh96LoZso6xWTQsTKE9iOzQkPYOcn2oO7CJPClzabUQT8JEbqLe1hGOluEbesF4
         LKkTfn07m+I0Vuueep3IFUQUJltM6JJHBDBn8n653IK02ME5fuHReejoNwtCex5xQyzn
         Y1wOj8DVfr6r9eQ6TYR15inSR6hHDxry08oKRDaKIhjxxmp2hbT5OuHr1D1+R6xelNHE
         JPdzrcJvaKmiiybVsDU25/RyZDaqIgMV6uxOUr6sp0q3qR3F0X4P6bOEInakDYMw/wf5
         mu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823038; x=1691427838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EZnRhm4Fj3KaK4sFjI+P1mIVDNOtVXSgVauozi7/LE=;
        b=DnajlA1l/0sqI9CJP+euXKtSaT2yEKWWnnsJbqZZMr18rB88IHQd1Ts9jx6jGVfxsB
         UuMVGiIt4etnd+KqmUKwidKsAvrz1NErO5qUbsCqsmLyTV284OxXAm8rwBci5uibg2DI
         OZRwTLTK0rGqbeK//YyHCIuZQDS01AU9LozQoqVhiStYuF0cxolBChAsbWYliT+eCqI3
         eITHpUl2gefReY81C3Zurx4xTLg4snbgje2FNwGl1rHiK1BMcrv1R2aFKhYrJy1oPEwB
         g/FDSk308fd3amKe72ANe1wcIGay3V5S+Gcle+wTekJgQkc9c7jkjELThlHzADTgw8lk
         zZXA==
X-Gm-Message-State: ABy/qLbDcprlUV1LVHfpTinIcVEJwsvyZykEgUwmTlwCk+4Mqz1QMjCa
	7lnSIgmvSruTqZX8hAQ36YM=
X-Google-Smtp-Source: APBJJlH90WRLRIm5YDV2YMBRfelNi7WH7+bbsrmY7NpvynPWnsTYJfLOq9UWydp0DqF9z3jWR7ijAw==
X-Received: by 2002:a25:e08b:0:b0:d18:e435:bdc0 with SMTP id x133-20020a25e08b000000b00d18e435bdc0mr11858543ybg.57.1690823037763;
        Mon, 31 Jul 2023 10:03:57 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 10/31] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:11 -0700
Message-Id: <20230731170332.69404-11-vishal.moola@gmail.com>
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
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 774fe83c0c16..ffddae95af78 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2842,7 +2842,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2858,7 +2858,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2899,7 +2899,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2913,7 +2913,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2987,7 +2987,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 4fee273595e2..e5e370cdac23 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6242,8 +6242,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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
2.40.1


