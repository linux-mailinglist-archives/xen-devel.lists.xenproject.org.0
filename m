Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23211718BFC
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542014.845424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPf-0008W0-OX; Wed, 31 May 2023 21:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542014.845424; Wed, 31 May 2023 21:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPf-0008T5-Jq; Wed, 31 May 2023 21:31:23 +0000
Received: by outflank-mailman (input) for mailman id 542014;
 Wed, 31 May 2023 21:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPe-0006zB-96
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:22 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b9f937b-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:31:20 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-568a1011488so969497b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:20 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:18 -0700 (PDT)
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
X-Inumbo-ID: 7b9f937b-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568679; x=1688160679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODlFnqFbwCYj1Eu7Q59WYAsHTUoZZ7gjL38Gt/grehE=;
        b=NGZceTIR2lqEzgrDeWjSiexk6w9g3s1TlD144+ZFhyEk2n6+p9UC+6qVvvVLXzp2su
         K9oJ0eJw0ezplOB9R0ifZq19iQ285sb1OM4mJ1UElkWFp36T3wq89+HQwlMRGwOKmFO7
         z1tP0exNbwqfKUldCdliSyHLB7+WYxs5iLiptM0KEACbqVBdid/Ntr98KvLnXyv2Phff
         Kkrj2cY5I52akM7rhkuqjxOeMf+L5Rld4rmHhMpoy2yk5X8KAowKfrZQsw0r7hKhSbaY
         cfZsGjnDLb5nI+L/8w5H9J8F2OZUMVJi9RmJunsGnB8M2co0leG7lQkvBoLTt5HxAMxc
         OBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568679; x=1688160679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODlFnqFbwCYj1Eu7Q59WYAsHTUoZZ7gjL38Gt/grehE=;
        b=JYJhmhWMlPke8MI9TrOWa4LxAQGuwap4eSmRWOQy0bOpTK1DqpptmULa1xkHQv6Rpx
         smljmD0ZhhyZnQQIxA0oECPF03WCxstFpi/95B2/SDFcfVzYTtiT40HLvEnMxKu2dFOC
         YgpSpiqeranxTFvAjutejTpseYZ1RvaJa1n+AcyF47UW5Qlxj0P+9mdhxDj/SLTM49lQ
         +jz2BcQaFyQZzsBZrBjYePWhcr4ZXQOnb9O1VqlKxI9XDn/mXqTj5gHLd7XB7r5CFTVa
         7uab8XdivVPt80/bPx9ZSQlB/ETSHG0dOoQzQYquttrdZ4aYHE4tFZsHn56MwgFjhfaN
         IsVA==
X-Gm-Message-State: AC+VfDxW5tDeanzRUE3sZ838dAYb3C2bTqMkULHJCxA2UnrTLW9L017c
	YcEGd7XlDJIBAGUsOM53nq4=
X-Google-Smtp-Source: ACHHUZ65n2/E4xpD/Goiwc5ceCegWo1qrr/SWnaz3wgfEMIe1tJLwwNDUTgx+izUNHv+/w4oBsm9SQ==
X-Received: by 2002:a81:a0c1:0:b0:568:b10a:e430 with SMTP id x184-20020a81a0c1000000b00568b10ae430mr7264559ywg.25.1685568679304;
        Wed, 31 May 2023 14:31:19 -0700 (PDT)
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
Subject: [PATCH v3 05/34] mm: add utility functions for ptdesc
Date: Wed, 31 May 2023 14:30:03 -0700
Message-Id: <20230531213032.25338-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
index b46617207c93..6bade9e0e799 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -481,6 +481,17 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
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
index 42ff3e04c006..620537e2f94f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2747,6 +2747,62 @@ static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long a
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
+ * pagetable_alloc allocates a page table descriptor as well as all pages
+ * described by it.
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
+ * pagetable_free frees a page table descriptor as well as all page
+ * tables described by said ptdesc.
+ */
+static inline void pagetable_free(struct ptdesc *pt)
+{
+	struct page *page = ptdesc_page(pt);
+
+	__free_pages(page, compound_order(page));
+}
+
+static inline void pagetable_clear(void *x)
+{
+	clear_page(x);
+}
+
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
@@ -2973,6 +3029,11 @@ static inline void mark_page_reserved(struct page *page)
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
index c997e9878969..5f12622d1521 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1027,6 +1027,18 @@ TABLE_MATCH(ptl, ptl);
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


