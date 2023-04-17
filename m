Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DF06E52B7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522336.811653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrC-0007Jh-2G; Mon, 17 Apr 2023 20:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522336.811653; Mon, 17 Apr 2023 20:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrB-000786-9o; Mon, 17 Apr 2023 20:53:49 +0000
Received: by outflank-mailman (input) for mailman id 522336;
 Mon, 17 Apr 2023 20:53:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqN-0005M2-Vy
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:52:59 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5bfdaff-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:52:59 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 s23-20020a17090aba1700b00247a8f0dd50so3409488pjr.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:52:59 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:52:57 -0700 (PDT)
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
X-Inumbo-ID: d5bfdaff-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764778; x=1684356778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2z4+jy2VvwYGAEqDadtXD4/9gzlnrS5efeNMpJ5P9k=;
        b=I/h1pnbYM2DwgRZCSJteD0jcjPogajwYvoNTWu05FIt8Dug2P9e0wRrWLPxc4zYyi2
         bF+AVTemVcp3diPO+7OSxLM72RxW/MppC8vSDXDjD8liqzM1pBLkxoUoebzionO/oxsa
         qHKGIp7d97W6jlem/3yxXQy6r/jNX2Q0ie6VB85Wwsz/8JpbJnzPVNlM6MFS7XC7iPJr
         OFMLKNx0UPHxfGtNqDckarA/92oBRif46FzIncuYkpkQ+fhRc09HfBoH8I7mBRTJiPxj
         c4VsiDutZTNuFgmpjh8q1KLiugVszPA4Gaz711F805EB6LUcut5gmvOb7RYuzrO1w3sO
         Wqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764778; x=1684356778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2z4+jy2VvwYGAEqDadtXD4/9gzlnrS5efeNMpJ5P9k=;
        b=f5fxEZk5RPjHkw0MhPwS3TrkETxlB8CGkUW5V/O4iOPpj7lKn4/2H8ENwuWVZ3RXXz
         rMHZBFb3aW8VW1zcte//iY+xDfED1kW3ADo+qgkXKAhLcJbWmpt0UxptHSrsGUlZ3Dc8
         zqULFFMjKpqZszvvvt/ToDLJG+P2kXhBVBazanmRCQk/Z1pqG7AQ4wtiW0/VxAj+T2Hr
         ruVAKd3/VXvOKCmtLFe60WS3jCqOD02eFyl6RcRbykstFZmj564AHqwXXwR7X7IBfvCF
         XWv3po1Ps1p9DxDzp2VlU8HZ12FiIpyfALBhZE2+rv9MNTV4kedFfBpYifbJeXpeiStp
         piMw==
X-Gm-Message-State: AAQBX9fXwpAmMzhM4R7iYdUdRJjoMBRweIsseOKZEkrXdsPJFY7xD8Yk
	SydpB+4sXBtqeaS5ErwXxAE=
X-Google-Smtp-Source: AKy350a6Xakm9Y4oYLvOvIWfyGM8BNUM3uv3d+WixCRDkQ1rcDDo2rZhVhsbndThyou7yfhT1XyHRg==
X-Received: by 2002:a17:90a:8a04:b0:247:14ac:4d3a with SMTP id w4-20020a17090a8a0400b0024714ac4d3amr17877854pjn.20.1681764778063;
        Mon, 17 Apr 2023 13:52:58 -0700 (PDT)
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
Subject: [PATCH 09/33] mm: Convert ptlock_init() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:24 -0700
Message-Id: <20230417205048.15870-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7eb562909b2c..d2485a110936 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2818,7 +2818,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2827,10 +2827,10 @@ static inline bool ptlock_init(struct page *page)
 	 * It can happen if arch try to use slab for page table allocation:
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
-	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page_ptdesc(page)))
+	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
+	if (!ptlock_alloc(ptdesc))
 		return false;
-	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
+	spin_lock_init(ptlock_ptr(ptdesc));
 	return true;
 }
 
@@ -2843,13 +2843,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 static inline void ptlock_cache_init(void) {}
-static inline bool ptlock_init(struct page *page) { return true; }
+static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct page *page) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
-	if (!ptlock_init(page))
+	if (!ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
@@ -2908,7 +2908,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.39.2


