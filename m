Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648972D171
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547474.854927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oii-0000TC-Dm; Mon, 12 Jun 2023 21:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547474.854927; Mon, 12 Jun 2023 21:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oii-0000R2-8L; Mon, 12 Jun 2023 21:05:00 +0000
Received: by outflank-mailman (input) for mailman id 547474;
 Mon, 12 Jun 2023 21:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oih-0007zJ-6z
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:04:59 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8f4f3a1-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:04:57 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-56cf6f4211aso27484727b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:04:57 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:04:56 -0700 (PDT)
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
X-Inumbo-ID: c8f4f3a1-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603896; x=1689195896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E077vqoCqwl2/4qA0TBAbJoWDfL60BXPSkhV6wk0YUw=;
        b=XHctMnujg/tVWYZlPY5bXFqva6VGPkLJitWyIF76elwmA+hNNOuZMn/71AAwR57M4B
         IyANMxsihrptf60QavxQFQZEOMJ5l1UtI4amrfsMrJlTcE45HruYhKHkR8dOb9vrhLyj
         wIzwXKD/U1Tx8l72JrhxAelagPrpqFK0zX9Nfim+mlei1ja/Gf0amJMsRM2MRf8e/2kO
         jriFwnl1iYZ7eeVYPFopluumvDGCM2xgx/viKkcjIMlifM5jUo+p/eIAsvrxVoA3HaI3
         YFqZHN+rA25I8RXwpppjrBbB0BFU/dJTiV2alRnBnUUYr7XItuIWUT0u54vTo5/wZ++Y
         E5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603896; x=1689195896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E077vqoCqwl2/4qA0TBAbJoWDfL60BXPSkhV6wk0YUw=;
        b=lX4aRlR9ggzNdtVbhJiLYhq6mH0Ez7KvlraCK8D6tz3BPEo9IMSj+ZnXEC0BlPVOxW
         9x2sPIqeiR6lGSBaN8SdXBwSZjafvuLcOH/Y4/bmqOXz5xf87b1sJvlLodAe2tgTyVNR
         BM3DHh+hFWUBYlr0+8tjJLVW5RiReaqdyQWMfDiFd6gg43E0qUHO6dML1G1YbuaqaCw9
         ZiFX0MdJnGnNb9s/IRmiQHv7ZesNru6Lyd53CNoKeHkiRiKJOlNtTQ4NRJXT99l3MKpO
         7sqPh81tOiKvQP8paB8tekrCEjnZp4t80BR/ZmzUXTtSnoqjNlsySGH9du7f5Liiwciv
         B+qg==
X-Gm-Message-State: AC+VfDxwg//logkQPYdK/7nnCk1BUWnNpBiTve1i5Bo58x0QG0GbVzgZ
	Jua6kB/XgwJYOmpcq8vT2hU=
X-Google-Smtp-Source: ACHHUZ70i2xb+pf7p7UU1uRX9rQOpj1AFV5IFVauNZ+PMgf0TtCpACb/4dq/MMeKyVRgHZ+W6e2xbw==
X-Received: by 2002:a81:5a55:0:b0:569:74f3:f3e1 with SMTP id o82-20020a815a55000000b0056974f3f3e1mr10812817ywb.0.1686603896297;
        Mon, 12 Jun 2023 14:04:56 -0700 (PDT)
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
Subject: [PATCH v4 05/34] mm: add utility functions for ptdesc
Date: Mon, 12 Jun 2023 14:03:54 -0700
Message-Id: <20230612210423.18611-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
index 0db09639dd2d..f184f1eba85d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2766,6 +2766,62 @@ static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long a
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
@@ -2992,6 +3048,11 @@ static inline void mark_page_reserved(struct page *page)
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
index 330de96ebfd6..c405f74d3875 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1026,6 +1026,18 @@ TABLE_MATCH(ptl, ptl);
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


