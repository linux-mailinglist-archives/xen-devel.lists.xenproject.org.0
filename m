Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE3773359
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578974.906742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Hz-00022R-5K; Mon, 07 Aug 2023 23:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578974.906742; Mon, 07 Aug 2023 23:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Hz-0001tv-1i; Mon, 07 Aug 2023 23:05:27 +0000
Received: by outflank-mailman (input) for mailman id 578974;
 Mon, 07 Aug 2023 23:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Hy-0001NY-5i
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:26 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e45ce480-3576-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 01:05:25 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d18566dc0c1so5693097276.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:25 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:24 -0700 (PDT)
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
X-Inumbo-ID: e45ce480-3576-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449524; x=1692054324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHNVeLQ4ERi2aiC2atfDR7Ra/O6uVctCEHn/pbNh+mQ=;
        b=L1Go0rwXz95r8RKjbEpMnhh6c018jiQRjrFUv0ntz442yZnhpaeW+aHqb02Xo98603
         EPNoaJuJCjZc6fdKeFl/4FxJrSloFA7bUFX05fyGjegXA7V7cuLZVOde3eglcKPAc2dh
         7JAUmVzhkgUSMtLYpwSzyd8Ca3OvJH/6CC+nMDpgrmjfqgC7q9SKrYP1x1rjn8+euG1c
         w/F3CAIitPe7XXZVoEz/F21xQq4ZfepD4AFcrR4pjaM61cX8qLF4fMMNmTw3E/GvPxLQ
         CGZCqn+AGAHhqM6FL6AO+cy3AaHEnYT+L7t2jnss6vAgyAEw9i6+eoE0/wpeJRdeDqZo
         nMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449524; x=1692054324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHNVeLQ4ERi2aiC2atfDR7Ra/O6uVctCEHn/pbNh+mQ=;
        b=JrprrdjcNyj6wYbTt0BYCsZsRkVytLud9S4nBHNgukE1ICJKsXEyto8IolKA8MKp3K
         vAHw0J6SMpWyzzkIsEeoKZ3OJ20adK0hJjXxbX8SQyqFKOxd7cXrpn+fBEN6TM7BoAYa
         +n+raJaQfY3qpUrsxHavxzyjCR6FOPuIqaUxFcr7hR/R63uBpL/XCbBgJ83jrhwK3Jop
         fI38QxYl9tldBZ1yuTMttG8fNilxgD0zr45FGnnbeIbz+Z5LOgWtl9vyj78po9b6neTb
         jWjQUd1leIUu0By1n0YFM5Bq+Kmgl/A/gvYSm80CkM5TXIrJuY8AvvYRJJ5iAfwDiuwK
         MQdA==
X-Gm-Message-State: AOJu0Yy3FLtqJB+VCMnIvlYrOeQpa1YZJ1dfbGgIlP4gyi7hz9o5KpLd
	LkvZ3isax/RkHhh7RbricSg=
X-Google-Smtp-Source: AGHT+IF30NcYMYJc6ATZDEFP+FAmEVcusnv37vl/vjImNQWmcJZtPuqM/aGhVMbEV/I/t7ROvZmYcQ==
X-Received: by 2002:a25:ca58:0:b0:d15:9cdc:5d0c with SMTP id a85-20020a25ca58000000b00d159cdc5d0cmr11907374ybg.42.1691449524354;
        Mon, 07 Aug 2023 16:05:24 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 03/31] mm: add utility functions for ptdesc
Date: Mon,  7 Aug 2023 16:04:45 -0700
Message-Id: <20230807230513.102486-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce utility functions setting the foundation for ptdescs.  These
will also assist in the splitting out of ptdesc from struct page.

Functions that focus on the descriptor are prefixed with ptdesc_* while
functions that focus on the pagetable are prefixed with pagetable_*.

pagetable_alloc() is defined to allocate new ptdesc pages as compound
pages.  This is to standardize ptdescs by allowing for one allocation and
one free function, in contrast to 2 allocation and 2 free functions.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/asm-generic/tlb.h | 11 +++++++
 include/linux/mm.h        | 61 +++++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h  | 12 ++++++++
 3 files changed, 84 insertions(+)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index bc32a2284c56..129a3a759976 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -480,6 +480,17 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
 }
 
+static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+{
+	tlb_remove_table(tlb, pt);
+}
+
+/* Like tlb_remove_ptdesc, but for page-like page directories. */
+static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
+{
+	tlb_remove_page(tlb, ptdesc_page(pt));
+}
+
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ec15ebc6def1..54dc176b90ea 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2806,6 +2806,57 @@ static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long a
 }
 #endif /* CONFIG_MMU */
 
+static inline struct ptdesc *virt_to_ptdesc(const void *x)
+{
+	return page_ptdesc(virt_to_page(x));
+}
+
+static inline void *ptdesc_to_virt(const struct ptdesc *pt)
+{
+	return page_to_virt(ptdesc_page(pt));
+}
+
+static inline void *ptdesc_address(const struct ptdesc *pt)
+{
+	return folio_address(ptdesc_folio(pt));
+}
+
+static inline bool pagetable_is_reserved(struct ptdesc *pt)
+{
+	return folio_test_reserved(ptdesc_folio(pt));
+}
+
+/**
+ * pagetable_alloc - Allocate pagetables
+ * @gfp:    GFP flags
+ * @order:  desired pagetable order
+ *
+ * pagetable_alloc allocates memory for page tables as well as a page table
+ * descriptor to describe that memory.
+ *
+ * Return: The ptdesc describing the allocated page tables.
+ */
+static inline struct ptdesc *pagetable_alloc(gfp_t gfp, unsigned int order)
+{
+	struct page *page = alloc_pages(gfp | __GFP_COMP, order);
+
+	return page_ptdesc(page);
+}
+
+/**
+ * pagetable_free - Free pagetables
+ * @pt:	The page table descriptor
+ *
+ * pagetable_free frees the memory of all page tables described by a page
+ * table descriptor and the memory for the descriptor itself.
+ */
+static inline void pagetable_free(struct ptdesc *pt)
+{
+	struct page *page = ptdesc_page(pt);
+
+	__free_pages(page, compound_order(page));
+}
+
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
@@ -2932,6 +2983,11 @@ static inline struct page *pmd_pgtable_page(pmd_t *pmd)
 	return virt_to_page((void *)((unsigned long) pmd & mask));
 }
 
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
+{
+	return page_ptdesc(pmd_pgtable_page(pmd));
+}
+
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
 	return ptlock_ptr(pmd_pgtable_page(pmd));
@@ -3044,6 +3100,11 @@ static inline void mark_page_reserved(struct page *page)
 	adjust_managed_page_count(page, -1);
 }
 
+static inline void free_reserved_ptdesc(struct ptdesc *pt)
+{
+	free_reserved_page(ptdesc_page(pt));
+}
+
 /*
  * Default method to free all the __init memory into the buddy system.
  * The freed pages will be poisoned with pattern "poison" if it's within
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index cb47438ae17f..ea34b22b4cbf 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -467,6 +467,18 @@ TABLE_MATCH(memcg_data, pt_memcg_data);
 #undef TABLE_MATCH
 static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
 
+#define ptdesc_page(pt)			(_Generic((pt),			\
+	const struct ptdesc *:		(const struct page *)(pt),	\
+	struct ptdesc *:		(struct page *)(pt)))
+
+#define ptdesc_folio(pt)		(_Generic((pt),			\
+	const struct ptdesc *:		(const struct folio *)(pt),	\
+	struct ptdesc *:		(struct folio *)(pt)))
+
+#define page_ptdesc(p)			(_Generic((p),			\
+	const struct page *:		(const struct ptdesc *)(p),	\
+	struct page *:			(struct ptdesc *)(p)))
+
 /*
  * Used for sizing the vmemmap region on some architectures
  */
-- 
2.40.1


