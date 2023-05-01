Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B386F36D5
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528089.820767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCe-0000bQ-CK; Mon, 01 May 2023 19:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528089.820767; Mon, 01 May 2023 19:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCd-0000VZ-VQ; Mon, 01 May 2023 19:28:51 +0000
Received: by outflank-mailman (input) for mailman id 528089;
 Mon, 01 May 2023 19:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCc-0006FS-4y
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:50 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6592313f-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:28:49 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aaec6f189cso12397105ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:49 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:47 -0700 (PDT)
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
X-Inumbo-ID: 6592313f-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969328; x=1685561328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHprEtJ9ence/xzqPBz4IJf2z5UW2zl5tMMosQGe/i0=;
        b=PY19zV8eUjDo/XMGG1Fc34r7BzCEZH74vj9MdJuOaMu+i1F5EHabpfUbH5/UkV5r7u
         xDPodd9s+AIKUKlEgX8AIGrVTqPfTCCV19VkI5iB53+1hWJANYdEVCUSRnMghYWfpO7M
         cjlz4mTJKg6lVp3kGic5xzqQRsLBSUE+d02rlXiSiKdYRR/2g0lktCdvpXk87E+WP0bW
         PyWsq2WmVkZLx+/D9I3aZnTNSq5u2Ks8EcfSEB3bP53mV0saqVpK3cKwl8Vm7ptPZTKs
         sMCaD1Y/vK3rtRXkw0c64x6M8sUBtgZ+i4WFX1gLvu6Qtr7y6/c6crVIx9ttRb0VBr94
         CwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969328; x=1685561328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHprEtJ9ence/xzqPBz4IJf2z5UW2zl5tMMosQGe/i0=;
        b=KXyuKi4bo/iCqBPVF8ZCJGKSGjpRpl1vCadgEPYiKguLrX69jnD/aDP2BkgnyusoFd
         5mOWc1ArvHAqZSINYzz6j/wR3c5i9usJdyVuuPFzjz8nAHrpqm0MIeapW+aiorH9xiIB
         ZcKif6SbLDmqUqlLtkRy4ERv9gmGqa6xrycjcLlbRuRHKotNLZ+CSm9ydgfHvWQZfRdM
         kfcPUWb4So32O4isg2IrHVc4tSJnZdJVr6wokrQeTbuNPgSCAfIkNMEeWb/bwjR6z1u1
         GEktbBnDjfwYSyOmKX0V0qkITXTU2QsjATcRyNIGtjvGwnM7Oe4MMszLrfwkpAYCqRf+
         zKmQ==
X-Gm-Message-State: AC+VfDxeQXuNopKQ9iEmfMRh87PvxaSfCur+0z89v6dtogbJsWGABBQ/
	NaY0jDL6br606Ykj9vAvGKM=
X-Google-Smtp-Source: ACHHUZ7Z//gnFWu5Wh7IVebCi2ECb1TkUFb7V74C+bMLVwpZ6jGbtiv1kPkjLZLQcQGCrs+Dltn26Q==
X-Received: by 2002:a17:902:c745:b0:1a6:6fe3:df91 with SMTP id q5-20020a170902c74500b001a66fe3df91mr11845223plq.50.1682969328214;
        Mon, 01 May 2023 12:28:48 -0700 (PDT)
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
Subject: [PATCH v2 10/34] mm: Convert ptlock_init() to use ptdescs
Date: Mon,  1 May 2023 12:28:05 -0700
Message-Id: <20230501192829.17086-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 044c9f874b47..bbd44f43e375 100644
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


