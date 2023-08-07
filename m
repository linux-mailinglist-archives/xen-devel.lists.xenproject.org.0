Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F45B7733EB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579032.906888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Jv-0001kl-6H; Mon, 07 Aug 2023 23:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579032.906888; Mon, 07 Aug 2023 23:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Ju-0001eq-TU; Mon, 07 Aug 2023 23:07:26 +0000
Received: by outflank-mailman (input) for mailman id 579032;
 Mon, 07 Aug 2023 23:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Iv-0001NS-KU
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:25 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 072753b6-3577-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:06:23 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d59da7115bdso264051276.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:23 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:22 -0700 (PDT)
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
X-Inumbo-ID: 072753b6-3577-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449583; x=1692054383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIX4EtUZRQHbbGVDBj/rJyP4ZKSCaTL9vvlgteJwLjg=;
        b=ny/PO9Rzwz4wKD05c8Oj8x01t9rfWUwF+DPBSi6xhAQ1t3uiUBYZ7YUUbf8WtD6fas
         a2dGGpvFO2SYjUkztwf/JpnNv7QhJL+Goto2OWRpxKnsAjXenC9v6P3rISzqLv6y4LVV
         4Qzw+SXgVTszZ9R94kkJTKmg5SvkJhFFe8ZHJiGz98l2xVrWZH/L4O6QNYM4Ix9oN6dK
         IfbxHi4LcKxjr+5M4cvO0MwysEIi/pmb6eegOI2VGQmX9xJr0pTMWjXflu5Ws+wnG+9V
         BkJIEDxKgjBTQlry6d49f1/eWCkgGXBEpt1ui7ZKc/08IVlfaQd/C3Y9s9851HPExZOi
         t/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449583; x=1692054383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIX4EtUZRQHbbGVDBj/rJyP4ZKSCaTL9vvlgteJwLjg=;
        b=AHpKMVvvRJt5vU6pCMhYSgi3xEOAvewviIqQI07CaqocweBxU2y9cQPT4ZX8rTqbLn
         36EJYjgn+sQGWRPY3Dv+preN4MAMRedKDqMxXbQdbUCltPS/pF5xrpsXxdbWeg3Cu3To
         NZVtUtX8GPp8+WRj9a6UbQ3JGOri6Go98tRGXWXG5QXh1X5RL2QyRb5osGnLmmvTNp5A
         k6Uz7YEm3RERF3m1F6xQvt/xe+y2O7nV8Redj+jzCC4ZvGPe3zzOz+DUe34P1YvW84T8
         g7w5Ar0LavycHIZbWhME8yK5637FgKoDC/qvlAaN/JiblmKNDoHK+SK4pmxbk9YZZ8po
         g4oQ==
X-Gm-Message-State: AOJu0YwJlNfSm3nqEFi/hoY5jXPQE9v4xPj3pycZN+VKgerf0c/YvWMp
	CgPybTa8WZox+aEWcmKkcGw=
X-Google-Smtp-Source: AGHT+IHSz7sLxFa/9tcB1BFEAx77xsw7IyoQHCgeHupxbvTa93/qmodby26m2eSPWXo4FijMYi73DQ==
X-Received: by 2002:a25:e708:0:b0:d53:f88a:dc09 with SMTP id e8-20020a25e708000000b00d53f88adc09mr3953501ybh.2.1691449582662;
        Mon, 07 Aug 2023 16:06:22 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 31/31] mm: Remove pgtable_{pmd, pte}_page_{ctor, dtor}() wrappers
Date: Mon,  7 Aug 2023 16:05:13 -0700
Message-Id: <20230807230513.102486-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These functions are no longer necessary. Remove them and cleanup
Documentation referencing them.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 Documentation/mm/split_page_table_lock.rst    | 12 +++++------
 .../zh_CN/mm/split_page_table_lock.rst        | 14 ++++++-------
 include/linux/mm.h                            | 20 -------------------
 3 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index a834fad9de12..e4f6972eb6c0 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -58,7 +58,7 @@ Support of split page table lock by an architecture
 ===================================================
 
 There's no need in special enabling of PTE split page table lock: everything
-required is done by pgtable_pte_page_ctor() and pgtable_pte_page_dtor(), which
+required is done by pagetable_pte_ctor() and pagetable_pte_dtor(), which
 must be called on PTE table allocation / freeing.
 
 Make sure the architecture doesn't use slab allocator for page table
@@ -68,8 +68,8 @@ This field shares storage with page->ptl.
 PMD split lock only makes sense if you have more than two page table
 levels.
 
-PMD split lock enabling requires pgtable_pmd_page_ctor() call on PMD table
-allocation and pgtable_pmd_page_dtor() on freeing.
+PMD split lock enabling requires pagetable_pmd_ctor() call on PMD table
+allocation and pagetable_pmd_dtor() on freeing.
 
 Allocation usually happens in pmd_alloc_one(), freeing in pmd_free() and
 pmd_free_tlb(), but make sure you cover all PMD table allocation / freeing
@@ -77,7 +77,7 @@ paths: i.e X86_PAE preallocate few PMDs on pgd_alloc().
 
 With everything in place you can set CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK.
 
-NOTE: pgtable_pte_page_ctor() and pgtable_pmd_page_ctor() can fail -- it must
+NOTE: pagetable_pte_ctor() and pagetable_pmd_ctor() can fail -- it must
 be handled properly.
 
 page->ptl
@@ -97,7 +97,7 @@ trick:
    split lock with enabled DEBUG_SPINLOCK or DEBUG_LOCK_ALLOC, but costs
    one more cache line for indirect access;
 
-The spinlock_t allocated in pgtable_pte_page_ctor() for PTE table and in
-pgtable_pmd_page_ctor() for PMD table.
+The spinlock_t allocated in pagetable_pte_ctor() for PTE table and in
+pagetable_pmd_ctor() for PMD table.
 
 Please, never access page->ptl directly -- use appropriate helper.
diff --git a/Documentation/translations/zh_CN/mm/split_page_table_lock.rst b/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
index 4fb7aa666037..a2c288670a24 100644
--- a/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
+++ b/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
@@ -56,16 +56,16 @@ Hugetlb特定的辅助函数:
 架构对分页表锁的支持
 ====================
 
-没有必要特别启用PTE分页表锁：所有需要的东西都由pgtable_pte_page_ctor()
-和pgtable_pte_page_dtor()完成，它们必须在PTE表分配/释放时被调用。
+没有必要特别启用PTE分页表锁：所有需要的东西都由pagetable_pte_ctor()
+和pagetable_pte_dtor()完成，它们必须在PTE表分配/释放时被调用。
 
 确保架构不使用slab分配器来分配页表：slab使用page->slab_cache来分配其页
 面。这个区域与page->ptl共享存储。
 
 PMD分页锁只有在你有两个以上的页表级别时才有意义。
 
-启用PMD分页锁需要在PMD表分配时调用pgtable_pmd_page_ctor()，在释放时调
-用pgtable_pmd_page_dtor()。
+启用PMD分页锁需要在PMD表分配时调用pagetable_pmd_ctor()，在释放时调
+用pagetable_pmd_dtor()。
 
 分配通常发生在pmd_alloc_one()中，释放发生在pmd_free()和pmd_free_tlb()
 中，但要确保覆盖所有的PMD表分配/释放路径：即X86_PAE在pgd_alloc()中预先
@@ -73,7 +73,7 @@ PMD分页锁只有在你有两个以上的页表级别时才有意义。
 
 一切就绪后，你可以设置CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK。
 
-注意：pgtable_pte_page_ctor()和pgtable_pmd_page_ctor()可能失败--必
+注意：pagetable_pte_ctor()和pagetable_pmd_ctor()可能失败--必
 须正确处理。
 
 page->ptl
@@ -90,7 +90,7 @@ page->ptl用于访问分割页表锁，其中'page'是包含该表的页面struc
    的指针并动态分配它。这允许在启用DEBUG_SPINLOCK或DEBUG_LOCK_ALLOC的
    情况下使用分页锁，但由于间接访问而多花了一个缓存行。
 
-PTE表的spinlock_t分配在pgtable_pte_page_ctor()中，PMD表的spinlock_t
-分配在pgtable_pmd_page_ctor()中。
+PTE表的spinlock_t分配在pagetable_pte_ctor()中，PMD表的spinlock_t
+分配在pagetable_pmd_ctor()中。
 
 请不要直接访问page->ptl - -使用适当的辅助函数。
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6310e0c59efe..6a95dfed4957 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2932,11 +2932,6 @@ static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
-{
-	return pagetable_pte_ctor(page_ptdesc(page));
-}
-
 static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
@@ -2946,11 +2941,6 @@ static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
-static inline void pgtable_pte_page_dtor(struct page *page)
-{
-	pagetable_pte_dtor(page_ptdesc(page));
-}
-
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
 static inline pte_t *pte_offset_map(pmd_t *pmd, unsigned long addr)
 {
@@ -3057,11 +3047,6 @@ static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
-{
-	return pagetable_pmd_ctor(page_ptdesc(page));
-}
-
 static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
@@ -3071,11 +3056,6 @@ static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
-static inline void pgtable_pmd_page_dtor(struct page *page)
-{
-	pagetable_pmd_dtor(page_ptdesc(page));
-}
-
 /*
  * No scalability reason to split PUD locks yet, but follow the same pattern
  * as the PMD locks to make it easier if we decide to.  The VM should not be
-- 
2.40.1


