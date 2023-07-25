Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6476076B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569357.889818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Xw-0002gV-53; Tue, 25 Jul 2023 04:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569357.889818; Tue, 25 Jul 2023 04:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Xw-0002bP-1E; Tue, 25 Jul 2023 04:21:16 +0000
Received: by outflank-mailman (input) for mailman id 569357;
 Tue, 25 Jul 2023 04:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Xu-0002Iw-SZ
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:14 +0000
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [2607:f8b0:4864:20::b36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0e9c554-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:21:14 +0200 (CEST)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so5718693276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:14 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:12 -0700 (PDT)
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
X-Inumbo-ID: b0e9c554-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258873; x=1690863673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFdcrIV5fIYEpRddOkWey4lp7uyipkLol3FVSysO4BI=;
        b=s2BAwwv8oUl+Hs1v7tcLJQyKdVwJshh+4MpeNVgW1JpMCfNsHy0yAipjGg5nDC4TQ3
         JkHdARTanKtpCG9rN/oS8YzJfpPRNx6XW3JcMNzfdGZFEFJtnvS7vhAwLgXYeaHpX4H5
         NJaLuVvVp94MScMO0B9PaYwNUr2ulC3xrBpZ+CyDbAB9PpgdPgDL4PRuM4CqBe7/ffTt
         TmfnC+ju4A6ouW55J0uzsReFyd+IYIWUEILsrpu+20SnVPwPWzbnSxYO46LPY8/Yv8hj
         xJ022X/2C2f6wqhTFayqxrRvwC61r0RZYX59fEcwS+AuUkwZ6FlssTAYS5BT87g2jU8h
         4qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258873; x=1690863673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFdcrIV5fIYEpRddOkWey4lp7uyipkLol3FVSysO4BI=;
        b=Z/XI1mamp4mmDvd17RjDZBFkaCcdpPtl+fIhMQpXR2pHcl+auFVzUEqVNLSrvCdtay
         xLYp9GUA4+y4VlHpzK+RI6bAucHQ5xD1kGoIZqWi//czpaLZn40vadf7NShymsFr34OT
         VLCbUwjzBL5MY0gdJ8/q4xovYLMtRRtxLy/ID9V6/85zW1rUL14KGx11RNVOYVOt7jsL
         aKxyiM2pKZJDsP9kgtSfTYVtIGeEJAg7ZlJWi7I4FO+ti+SY20DaeH3fjMoy2YfvIUVT
         P8Xizld8j7wxs/ODhnb+WZM+pAAyQefhcavWIE1xpaZw6CYBtUZ7AiAeTDHZyYgVyrdK
         lvuA==
X-Gm-Message-State: ABy/qLY6Pt94TNgHcdJ4RBBabNjBZO02s788pkc0dL0nRuEOw3W/45vi
	gSymTicy5mFCl5apa16yLCU=
X-Google-Smtp-Source: APBJJlEljmstle/55h2Wn4YBOHbmslxxkZ+0xzy95w3akZzqV4BQHNPNvPKRyocnj15MdoqDrOBO8w==
X-Received: by 2002:a25:1e09:0:b0:d05:2b13:aec9 with SMTP id e9-20020a251e09000000b00d052b13aec9mr8919211ybe.23.1690258873123;
        Mon, 24 Jul 2023 21:21:13 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 03/31] mm: add utility functions for ptdesc
Date: Mon, 24 Jul 2023 21:20:23 -0700
Message-Id: <20230725042051.36691-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce utility functions setting the foundation for ptdescs. These
will also assist in the splitting out of ptdesc from struct page.

Functions that focus on the descriptor are prefixed with ptdesc_* while
functions that focus on the pagetable are prefixed with pagetable_*.

pagetable_alloc() is defined to allocate new ptdesc pages as compound
pages. This is to standardize ptdescs by allowing for one allocation
and one free function, in contrast to 2 allocation and 2 free functions.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/asm-generic/tlb.h | 11 +++++++
 include/linux/mm.h        | 61 +++++++++++++++++++++++++++++++++++++++
 include/linux/pgtable.h   | 12 ++++++++
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
index 2ba73f09ae4a..3fda0ad41cf2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2787,6 +2787,57 @@ static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long a
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
@@ -2913,6 +2964,11 @@ static inline struct page *pmd_pgtable_page(pmd_t *pmd)
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
@@ -3025,6 +3081,11 @@ static inline void mark_page_reserved(struct page *page)
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
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 1f92514d54b0..250fdeba68f3 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1064,6 +1064,18 @@ TABLE_MATCH(memcg_data, pt_memcg_data);
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
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used even if CONFIG_MMU is not defined.
-- 
2.40.1


