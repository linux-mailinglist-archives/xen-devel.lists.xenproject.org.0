Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58876076D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569362.889873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y7-0004Ps-O4; Tue, 25 Jul 2023 04:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569362.889873; Tue, 25 Jul 2023 04:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y7-0004OK-Jr; Tue, 25 Jul 2023 04:21:27 +0000
Received: by outflank-mailman (input) for mailman id 569362;
 Tue, 25 Jul 2023 04:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Y5-00023t-VC
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:25 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6dff9db-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:24 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d13e0bfbbcfso1761726276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:24 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:22 -0700 (PDT)
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
X-Inumbo-ID: b6dff9db-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258883; x=1690863683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy/rMhqpUcv/05FOZn+4srvOxwPFLEA5us+pK4Rb6lw=;
        b=DwndbpJ6ZJrYKMHpG4xKikBhk7x+krWdi68yaEUskEkiop40SD81D3SbVY3seOkRYX
         /kBw1kbEHeLJuAWxODh8wznz3CeaeUpUO4YYOfw0VBoc804gVI4mMhkv5lDO7g/hc/Ox
         TXEzhNof0Ms0qo0Det2yGSzvCCxAKXVShq3qZYqhwj2d67+5rTird7vmREAL8b8Si8Ac
         tOq0IFFx/OCdHFNMMX58/9jGd+Cn0j6BluiHfy+sp+cwHgX7LWNmOOEbAbHaR8hHlJNg
         plgZtGI8EoaWjuEjbu+IQ9bgYRh88XsoYPHoE7Qno7Yp+zMkk++OeXafcS4wt+s+lSyS
         wNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258883; x=1690863683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy/rMhqpUcv/05FOZn+4srvOxwPFLEA5us+pK4Rb6lw=;
        b=VcjjnNtvpg/hEmDITWWhK9JLCwViqtq7bffcXAW2qy14fhAOh5r6LY3Tok5gujRdtn
         drlVrFgWYCqFCS2sKmF+KLiGB9GZ7c8D8lRiGzj6U0rug3GGOuC2k0QKLwkto8+otPf2
         VneMYbsxRay+WOoYJDWZNxqMYOrKApGyTM4tiiuI/I4SeBsOrybgsPKecjfg/kkwZmb2
         2Ea4xnfgCNaQ3CYWsSw8zBZX2lHHFK7gGvMDwRRLWSgmNhtGlOLWmIkr9oApaKVdk050
         nxBPKj5InfXrZzhK7M58Uh0C+W+DDI1PNX5gSWuqWvmwAz5Jlr4uWWUm7mU6c4nOERX4
         PEzg==
X-Gm-Message-State: ABy/qLaySArIlRJH/qt6juo20D7tW4wriy+AM/JrOkUnFwnwIgJjVPNC
	BpvYlf1Qw3tPh9dgHxlzNH4=
X-Google-Smtp-Source: APBJJlF+SF4cjauiYcGzSv/LhxAh6sYfbdxhzn585BID5O/OlI17XEMKbBKdqUp1OW6pVPf/RqCKZQ==
X-Received: by 2002:a25:908e:0:b0:d07:b677:3349 with SMTP id t14-20020a25908e000000b00d07b6773349mr1259438ybl.25.1690258883131;
        Mon, 24 Jul 2023 21:21:23 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 08/31] mm: Convert ptlock_init() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:28 -0700
Message-Id: <20230725042051.36691-9-vishal.moola@gmail.com>
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
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 52ef09c100a2..675972d3f7e4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2873,7 +2873,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2882,10 +2882,10 @@ static inline bool ptlock_init(struct page *page)
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
 
@@ -2898,13 +2898,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2979,7 +2979,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.40.1


