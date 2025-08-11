Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F94B207A4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077388.1438506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg8-0007q0-8I; Mon, 11 Aug 2025 11:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077388.1438506; Mon, 11 Aug 2025 11:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg8-0007oG-0X; Mon, 11 Aug 2025 11:27:00 +0000
Received: by outflank-mailman (input) for mailman id 1077388;
 Mon, 11 Aug 2025 11:26:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQg6-000725-T0
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1613735d-76a6-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:26:56 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-mGypFQuTM5yBodg4X-wNqA-1; Mon, 11 Aug 2025 07:26:54 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-459d4b5db81so23748435e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:53 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm40409120f8f.27.2025.08.11.04.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:51 -0700 (PDT)
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
X-Inumbo-ID: 1613735d-76a6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P87rLpAYrvMbmMGGuIRrtBN562miOXHo6Y54j1JPV6I=;
	b=cnTBegtjCtwdi9jmHMhftrWMtKrvTFxEJIIR9jl9DLgOVzIVcHkkbDVNMBfYJPKKjs8sUu
	V1IeVqYZ2VOVe/PJOxRXg+r7qNZb8Udh9euA0hckBfXfAZCDUEX6dVVLgfAKo7yuFSY4go
	XxtOmX4zdWbAYFQtizayN6rYxrA5+YU=
X-MC-Unique: mGypFQuTM5yBodg4X-wNqA-1
X-Mimecast-MFC-AGG-ID: mGypFQuTM5yBodg4X-wNqA_1754911613
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911613; x=1755516413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P87rLpAYrvMbmMGGuIRrtBN562miOXHo6Y54j1JPV6I=;
        b=SecNzKKZi9p8VW2g4cXHe3iEcXhl0cKyjVrJxINhGCoe7o17F8hF+sezb4aBBUSmPg
         k5UggYus8UBL/JXyEfuC7NbFJPdrRCcDH8K9hUqe5Gig7gX4CnJ53MQ7Bd6tEioot2Gc
         h4H3qppJvKLsgif4eqtGFpepZVG9B51SzjWUBqVQz5IOfi5CZ58G25psXDsQMynyUQtt
         rO3AZKeFgSFrNCoQbUzWddNbU7749LP/M0ZTFLsJZk8gh3w+RiXWOPiWT49rTFuU1MxK
         wmXO7q5wHpwFcMDp9orsJuiD4GfTKeB3KRRudkZR+yvYE2wyj0gwqGIcMF1pAKd4Fu4P
         ylAw==
X-Forwarded-Encrypted: i=1; AJvYcCVabkO2VfgrVwt83RaF2X5fmFI7zE3SLC6VAdl/2LST9ShZSLx53VeOTbEkUu93dh72gMv+dKVnoUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCqH6FU+622/HHiXPpTJ7Kh9YZVP83oVdkQVj/mx8LTe5SYesg
	aBNBZtaQcCwnB9rdNP7A+ANgR1K4HN2/76pQ6Z6dDu9+aLdOb8o7zxNZvJNgA0OcVFuDz+mqbv8
	Qa2eQnJ4uSyyYdDDvWU0k14AqveJaZC92GyywguY9Opj+rJl4Hx4+XI8EvSYfPh0FbTj0
X-Gm-Gg: ASbGncvXXT39Hq3ctKabjihmhb/xHbF+XEPYMlxouWURlP4NUaW+2BhcYaVDNm0Q0sL
	EwYBMTYe9dP6+lXgBYE5l1Rcg8QEbKe+6vx8iRLByAMHRi6MLXy5TPvu1GXZy0hhPLZixMst4Jc
	8KXDJJl1kHIAX8gUIhVGR5u8L7VIL//G9SJ9/T0nDLU1S6hSirq3BHLpD9rj+bAlZRWtOgKsXJx
	322fDbCMzmgZJ+RjS1KXSQ24tsKL0BuSgQH9nrexU41pZln3a2YmF7aPXZF+DXF5UZGY055NM+h
	ogn196ZyoaP0cLoS6z6xpxG1IXgjWMdyrIrGRQKmikR25ulviDKSI6AxW4Slx8t2G+5uJJeztLO
	nwSYwckFJa03Nx+7kOgsyxocl
X-Received: by 2002:a05:600c:3589:b0:459:dfa8:b881 with SMTP id 5b1f17b1804b1-459f4f3cfd9mr103523365e9.7.1754911612587;
        Mon, 11 Aug 2025 04:26:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiy2Q6M1gIlNBDGe4u7ez53xLkuOFeUzXf29NvQrYJzqDFFp1B3pMcW/PtvRUdMabZHM2Urw==
X-Received: by 2002:a05:600c:3589:b0:459:dfa8:b881 with SMTP id 5b1f17b1804b1-459f4f3cfd9mr103523005e9.7.1754911612074;
        Mon, 11 Aug 2025 04:26:52 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 07/11] mm/rmap: convert "enum rmap_level" to "enum pgtable_level"
Date: Mon, 11 Aug 2025 13:26:27 +0200
Message-ID: <20250811112631.759341-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xkzyXj5Gr93sltnD2sx9S4vd8k-EPCQeJwTMHL04hDU_1754911613
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's factor it out, and convert all checks for unsupported levels to
BUILD_BUG(). The code is written in a way such that force-inlining will
optimize out the levels.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/pgtable.h |  8 ++++++
 include/linux/rmap.h    | 60 +++++++++++++++++++----------------------
 mm/rmap.c               | 56 +++++++++++++++++++++-----------------
 3 files changed, 66 insertions(+), 58 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4c035637eeb77..bff5c4241bf2e 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1958,6 +1958,14 @@ static inline bool arch_has_pfn_modify_check(void)
 /* Page-Table Modification Mask */
 typedef unsigned int pgtbl_mod_mask;
 
+enum pgtable_level {
+	PGTABLE_LEVEL_PTE = 0,
+	PGTABLE_LEVEL_PMD,
+	PGTABLE_LEVEL_PUD,
+	PGTABLE_LEVEL_P4D,
+	PGTABLE_LEVEL_PGD,
+};
+
 #endif /* !__ASSEMBLY__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 6cd020eea37a2..9d40d127bdb78 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -394,18 +394,8 @@ typedef int __bitwise rmap_t;
 /* The anonymous (sub)page is exclusive to a single process. */
 #define RMAP_EXCLUSIVE		((__force rmap_t)BIT(0))
 
-/*
- * Internally, we're using an enum to specify the granularity. We make the
- * compiler emit specialized code for each granularity.
- */
-enum rmap_level {
-	RMAP_LEVEL_PTE = 0,
-	RMAP_LEVEL_PMD,
-	RMAP_LEVEL_PUD,
-};
-
 static inline void __folio_rmap_sanity_checks(const struct folio *folio,
-		const struct page *page, int nr_pages, enum rmap_level level)
+		const struct page *page, int nr_pages, enum pgtable_level level)
 {
 	/* hugetlb folios are handled separately. */
 	VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
@@ -427,18 +417,18 @@ static inline void __folio_rmap_sanity_checks(const struct folio *folio,
 	VM_WARN_ON_FOLIO(page_folio(page + nr_pages - 1) != folio, folio);
 
 	switch (level) {
-	case RMAP_LEVEL_PTE:
+	case PGTABLE_LEVEL_PTE:
 		break;
-	case RMAP_LEVEL_PMD:
+	case PGTABLE_LEVEL_PMD:
 		/*
 		 * We don't support folios larger than a single PMD yet. So
-		 * when RMAP_LEVEL_PMD is set, we assume that we are creating
+		 * when PGTABLE_LEVEL_PMD is set, we assume that we are creating
 		 * a single "entire" mapping of the folio.
 		 */
 		VM_WARN_ON_FOLIO(folio_nr_pages(folio) != HPAGE_PMD_NR, folio);
 		VM_WARN_ON_FOLIO(nr_pages != HPAGE_PMD_NR, folio);
 		break;
-	case RMAP_LEVEL_PUD:
+	case PGTABLE_LEVEL_PUD:
 		/*
 		 * Assume that we are creating a single "entire" mapping of the
 		 * folio.
@@ -447,7 +437,7 @@ static inline void __folio_rmap_sanity_checks(const struct folio *folio,
 		VM_WARN_ON_FOLIO(nr_pages != HPAGE_PUD_NR, folio);
 		break;
 	default:
-		VM_WARN_ON_ONCE(true);
+		BUILD_BUG();
 	}
 
 	/*
@@ -567,14 +557,14 @@ static inline void hugetlb_remove_rmap(struct folio *folio)
 
 static __always_inline void __folio_dup_file_rmap(struct folio *folio,
 		struct page *page, int nr_pages, struct vm_area_struct *dst_vma,
-		enum rmap_level level)
+		enum pgtable_level level)
 {
 	const int orig_nr_pages = nr_pages;
 
 	__folio_rmap_sanity_checks(folio, page, nr_pages, level);
 
 	switch (level) {
-	case RMAP_LEVEL_PTE:
+	case PGTABLE_LEVEL_PTE:
 		if (!folio_test_large(folio)) {
 			atomic_inc(&folio->_mapcount);
 			break;
@@ -587,11 +577,13 @@ static __always_inline void __folio_dup_file_rmap(struct folio *folio,
 		}
 		folio_add_large_mapcount(folio, orig_nr_pages, dst_vma);
 		break;
-	case RMAP_LEVEL_PMD:
-	case RMAP_LEVEL_PUD:
+	case PGTABLE_LEVEL_PMD:
+	case PGTABLE_LEVEL_PUD:
 		atomic_inc(&folio->_entire_mapcount);
 		folio_inc_large_mapcount(folio, dst_vma);
 		break;
+	default:
+		BUILD_BUG();
 	}
 }
 
@@ -609,13 +601,13 @@ static __always_inline void __folio_dup_file_rmap(struct folio *folio,
 static inline void folio_dup_file_rmap_ptes(struct folio *folio,
 		struct page *page, int nr_pages, struct vm_area_struct *dst_vma)
 {
-	__folio_dup_file_rmap(folio, page, nr_pages, dst_vma, RMAP_LEVEL_PTE);
+	__folio_dup_file_rmap(folio, page, nr_pages, dst_vma, PGTABLE_LEVEL_PTE);
 }
 
 static __always_inline void folio_dup_file_rmap_pte(struct folio *folio,
 		struct page *page, struct vm_area_struct *dst_vma)
 {
-	__folio_dup_file_rmap(folio, page, 1, dst_vma, RMAP_LEVEL_PTE);
+	__folio_dup_file_rmap(folio, page, 1, dst_vma, PGTABLE_LEVEL_PTE);
 }
 
 /**
@@ -632,7 +624,7 @@ static inline void folio_dup_file_rmap_pmd(struct folio *folio,
 		struct page *page, struct vm_area_struct *dst_vma)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	__folio_dup_file_rmap(folio, page, HPAGE_PMD_NR, dst_vma, RMAP_LEVEL_PTE);
+	__folio_dup_file_rmap(folio, page, HPAGE_PMD_NR, dst_vma, PGTABLE_LEVEL_PTE);
 #else
 	WARN_ON_ONCE(true);
 #endif
@@ -640,7 +632,7 @@ static inline void folio_dup_file_rmap_pmd(struct folio *folio,
 
 static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
 		struct page *page, int nr_pages, struct vm_area_struct *dst_vma,
-		struct vm_area_struct *src_vma, enum rmap_level level)
+		struct vm_area_struct *src_vma, enum pgtable_level level)
 {
 	const int orig_nr_pages = nr_pages;
 	bool maybe_pinned;
@@ -665,7 +657,7 @@ static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
 	 * copying if the folio maybe pinned.
 	 */
 	switch (level) {
-	case RMAP_LEVEL_PTE:
+	case PGTABLE_LEVEL_PTE:
 		if (unlikely(maybe_pinned)) {
 			for (i = 0; i < nr_pages; i++)
 				if (PageAnonExclusive(page + i))
@@ -687,8 +679,8 @@ static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
 		} while (page++, --nr_pages > 0);
 		folio_add_large_mapcount(folio, orig_nr_pages, dst_vma);
 		break;
-	case RMAP_LEVEL_PMD:
-	case RMAP_LEVEL_PUD:
+	case PGTABLE_LEVEL_PMD:
+	case PGTABLE_LEVEL_PUD:
 		if (PageAnonExclusive(page)) {
 			if (unlikely(maybe_pinned))
 				return -EBUSY;
@@ -697,6 +689,8 @@ static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
 		atomic_inc(&folio->_entire_mapcount);
 		folio_inc_large_mapcount(folio, dst_vma);
 		break;
+	default:
+		BUILD_BUG();
 	}
 	return 0;
 }
@@ -730,7 +724,7 @@ static inline int folio_try_dup_anon_rmap_ptes(struct folio *folio,
 		struct vm_area_struct *src_vma)
 {
 	return __folio_try_dup_anon_rmap(folio, page, nr_pages, dst_vma,
-					 src_vma, RMAP_LEVEL_PTE);
+					 src_vma, PGTABLE_LEVEL_PTE);
 }
 
 static __always_inline int folio_try_dup_anon_rmap_pte(struct folio *folio,
@@ -738,7 +732,7 @@ static __always_inline int folio_try_dup_anon_rmap_pte(struct folio *folio,
 		struct vm_area_struct *src_vma)
 {
 	return __folio_try_dup_anon_rmap(folio, page, 1, dst_vma, src_vma,
-					 RMAP_LEVEL_PTE);
+					 PGTABLE_LEVEL_PTE);
 }
 
 /**
@@ -770,7 +764,7 @@ static inline int folio_try_dup_anon_rmap_pmd(struct folio *folio,
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	return __folio_try_dup_anon_rmap(folio, page, HPAGE_PMD_NR, dst_vma,
-					 src_vma, RMAP_LEVEL_PMD);
+					 src_vma, PGTABLE_LEVEL_PMD);
 #else
 	WARN_ON_ONCE(true);
 	return -EBUSY;
@@ -778,7 +772,7 @@ static inline int folio_try_dup_anon_rmap_pmd(struct folio *folio,
 }
 
 static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
-		struct page *page, int nr_pages, enum rmap_level level)
+		struct page *page, int nr_pages, enum pgtable_level level)
 {
 	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
 	VM_WARN_ON_FOLIO(!PageAnonExclusive(page), folio);
@@ -873,7 +867,7 @@ static __always_inline int __folio_try_share_anon_rmap(struct folio *folio,
 static inline int folio_try_share_anon_rmap_pte(struct folio *folio,
 		struct page *page)
 {
-	return __folio_try_share_anon_rmap(folio, page, 1, RMAP_LEVEL_PTE);
+	return __folio_try_share_anon_rmap(folio, page, 1, PGTABLE_LEVEL_PTE);
 }
 
 /**
@@ -904,7 +898,7 @@ static inline int folio_try_share_anon_rmap_pmd(struct folio *folio,
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	return __folio_try_share_anon_rmap(folio, page, HPAGE_PMD_NR,
-					   RMAP_LEVEL_PMD);
+					   PGTABLE_LEVEL_PMD);
 #else
 	WARN_ON_ONCE(true);
 	return -EBUSY;
diff --git a/mm/rmap.c b/mm/rmap.c
index 84a8d8b02ef77..0e9c4041f8687 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1265,7 +1265,7 @@ static void __folio_mod_stat(struct folio *folio, int nr, int nr_pmdmapped)
 
 static __always_inline void __folio_add_rmap(struct folio *folio,
 		struct page *page, int nr_pages, struct vm_area_struct *vma,
-		enum rmap_level level)
+		enum pgtable_level level)
 {
 	atomic_t *mapped = &folio->_nr_pages_mapped;
 	const int orig_nr_pages = nr_pages;
@@ -1274,7 +1274,7 @@ static __always_inline void __folio_add_rmap(struct folio *folio,
 	__folio_rmap_sanity_checks(folio, page, nr_pages, level);
 
 	switch (level) {
-	case RMAP_LEVEL_PTE:
+	case PGTABLE_LEVEL_PTE:
 		if (!folio_test_large(folio)) {
 			nr = atomic_inc_and_test(&folio->_mapcount);
 			break;
@@ -1300,11 +1300,11 @@ static __always_inline void __folio_add_rmap(struct folio *folio,
 
 		folio_add_large_mapcount(folio, orig_nr_pages, vma);
 		break;
-	case RMAP_LEVEL_PMD:
-	case RMAP_LEVEL_PUD:
+	case PGTABLE_LEVEL_PMD:
+	case PGTABLE_LEVEL_PUD:
 		first = atomic_inc_and_test(&folio->_entire_mapcount);
 		if (IS_ENABLED(CONFIG_NO_PAGE_MAPCOUNT)) {
-			if (level == RMAP_LEVEL_PMD && first)
+			if (level == PGTABLE_LEVEL_PMD && first)
 				nr_pmdmapped = folio_large_nr_pages(folio);
 			nr = folio_inc_return_large_mapcount(folio, vma);
 			if (nr == 1)
@@ -1323,7 +1323,7 @@ static __always_inline void __folio_add_rmap(struct folio *folio,
 				 * We only track PMD mappings of PMD-sized
 				 * folios separately.
 				 */
-				if (level == RMAP_LEVEL_PMD)
+				if (level == PGTABLE_LEVEL_PMD)
 					nr_pmdmapped = nr_pages;
 				nr = nr_pages - (nr & FOLIO_PAGES_MAPPED);
 				/* Raced ahead of a remove and another add? */
@@ -1336,6 +1336,8 @@ static __always_inline void __folio_add_rmap(struct folio *folio,
 		}
 		folio_inc_large_mapcount(folio, vma);
 		break;
+	default:
+		BUILD_BUG();
 	}
 	__folio_mod_stat(folio, nr, nr_pmdmapped);
 }
@@ -1427,7 +1429,7 @@ static void __page_check_anon_rmap(const struct folio *folio,
 
 static __always_inline void __folio_add_anon_rmap(struct folio *folio,
 		struct page *page, int nr_pages, struct vm_area_struct *vma,
-		unsigned long address, rmap_t flags, enum rmap_level level)
+		unsigned long address, rmap_t flags, enum pgtable_level level)
 {
 	int i;
 
@@ -1440,20 +1442,22 @@ static __always_inline void __folio_add_anon_rmap(struct folio *folio,
 
 	if (flags & RMAP_EXCLUSIVE) {
 		switch (level) {
-		case RMAP_LEVEL_PTE:
+		case PGTABLE_LEVEL_PTE:
 			for (i = 0; i < nr_pages; i++)
 				SetPageAnonExclusive(page + i);
 			break;
-		case RMAP_LEVEL_PMD:
+		case PGTABLE_LEVEL_PMD:
 			SetPageAnonExclusive(page);
 			break;
-		case RMAP_LEVEL_PUD:
+		case PGTABLE_LEVEL_PUD:
 			/*
 			 * Keep the compiler happy, we don't support anonymous
 			 * PUD mappings.
 			 */
 			WARN_ON_ONCE(1);
 			break;
+		default:
+			BUILD_BUG();
 		}
 	}
 
@@ -1507,7 +1511,7 @@ void folio_add_anon_rmap_ptes(struct folio *folio, struct page *page,
 		rmap_t flags)
 {
 	__folio_add_anon_rmap(folio, page, nr_pages, vma, address, flags,
-			      RMAP_LEVEL_PTE);
+			      PGTABLE_LEVEL_PTE);
 }
 
 /**
@@ -1528,7 +1532,7 @@ void folio_add_anon_rmap_pmd(struct folio *folio, struct page *page,
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	__folio_add_anon_rmap(folio, page, HPAGE_PMD_NR, vma, address, flags,
-			      RMAP_LEVEL_PMD);
+			      PGTABLE_LEVEL_PMD);
 #else
 	WARN_ON_ONCE(true);
 #endif
@@ -1609,7 +1613,7 @@ void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 
 static __always_inline void __folio_add_file_rmap(struct folio *folio,
 		struct page *page, int nr_pages, struct vm_area_struct *vma,
-		enum rmap_level level)
+		enum pgtable_level level)
 {
 	VM_WARN_ON_FOLIO(folio_test_anon(folio), folio);
 
@@ -1634,7 +1638,7 @@ static __always_inline void __folio_add_file_rmap(struct folio *folio,
 void folio_add_file_rmap_ptes(struct folio *folio, struct page *page,
 		int nr_pages, struct vm_area_struct *vma)
 {
-	__folio_add_file_rmap(folio, page, nr_pages, vma, RMAP_LEVEL_PTE);
+	__folio_add_file_rmap(folio, page, nr_pages, vma, PGTABLE_LEVEL_PTE);
 }
 
 /**
@@ -1651,7 +1655,7 @@ void folio_add_file_rmap_pmd(struct folio *folio, struct page *page,
 		struct vm_area_struct *vma)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	__folio_add_file_rmap(folio, page, HPAGE_PMD_NR, vma, RMAP_LEVEL_PMD);
+	__folio_add_file_rmap(folio, page, HPAGE_PMD_NR, vma, PGTABLE_LEVEL_PMD);
 #else
 	WARN_ON_ONCE(true);
 #endif
@@ -1672,7 +1676,7 @@ void folio_add_file_rmap_pud(struct folio *folio, struct page *page,
 {
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
 	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
-	__folio_add_file_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
+	__folio_add_file_rmap(folio, page, HPAGE_PUD_NR, vma, PGTABLE_LEVEL_PUD);
 #else
 	WARN_ON_ONCE(true);
 #endif
@@ -1680,7 +1684,7 @@ void folio_add_file_rmap_pud(struct folio *folio, struct page *page,
 
 static __always_inline void __folio_remove_rmap(struct folio *folio,
 		struct page *page, int nr_pages, struct vm_area_struct *vma,
-		enum rmap_level level)
+		enum pgtable_level level)
 {
 	atomic_t *mapped = &folio->_nr_pages_mapped;
 	int last = 0, nr = 0, nr_pmdmapped = 0;
@@ -1689,7 +1693,7 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 	__folio_rmap_sanity_checks(folio, page, nr_pages, level);
 
 	switch (level) {
-	case RMAP_LEVEL_PTE:
+	case PGTABLE_LEVEL_PTE:
 		if (!folio_test_large(folio)) {
 			nr = atomic_add_negative(-1, &folio->_mapcount);
 			break;
@@ -1719,11 +1723,11 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 
 		partially_mapped = nr && atomic_read(mapped);
 		break;
-	case RMAP_LEVEL_PMD:
-	case RMAP_LEVEL_PUD:
+	case PGTABLE_LEVEL_PMD:
+	case PGTABLE_LEVEL_PUD:
 		if (IS_ENABLED(CONFIG_NO_PAGE_MAPCOUNT)) {
 			last = atomic_add_negative(-1, &folio->_entire_mapcount);
-			if (level == RMAP_LEVEL_PMD && last)
+			if (level == PGTABLE_LEVEL_PMD && last)
 				nr_pmdmapped = folio_large_nr_pages(folio);
 			nr = folio_dec_return_large_mapcount(folio, vma);
 			if (!nr) {
@@ -1743,7 +1747,7 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 			nr = atomic_sub_return_relaxed(ENTIRELY_MAPPED, mapped);
 			if (likely(nr < ENTIRELY_MAPPED)) {
 				nr_pages = folio_large_nr_pages(folio);
-				if (level == RMAP_LEVEL_PMD)
+				if (level == PGTABLE_LEVEL_PMD)
 					nr_pmdmapped = nr_pages;
 				nr = nr_pages - (nr & FOLIO_PAGES_MAPPED);
 				/* Raced ahead of another remove and an add? */
@@ -1757,6 +1761,8 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 
 		partially_mapped = nr && nr < nr_pmdmapped;
 		break;
+	default:
+		BUILD_BUG();
 	}
 
 	/*
@@ -1796,7 +1802,7 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 void folio_remove_rmap_ptes(struct folio *folio, struct page *page,
 		int nr_pages, struct vm_area_struct *vma)
 {
-	__folio_remove_rmap(folio, page, nr_pages, vma, RMAP_LEVEL_PTE);
+	__folio_remove_rmap(folio, page, nr_pages, vma, PGTABLE_LEVEL_PTE);
 }
 
 /**
@@ -1813,7 +1819,7 @@ void folio_remove_rmap_pmd(struct folio *folio, struct page *page,
 		struct vm_area_struct *vma)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	__folio_remove_rmap(folio, page, HPAGE_PMD_NR, vma, RMAP_LEVEL_PMD);
+	__folio_remove_rmap(folio, page, HPAGE_PMD_NR, vma, PGTABLE_LEVEL_PMD);
 #else
 	WARN_ON_ONCE(true);
 #endif
@@ -1834,7 +1840,7 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 {
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
 	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
-	__folio_remove_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
+	__folio_remove_rmap(folio, page, HPAGE_PUD_NR, vma, PGTABLE_LEVEL_PUD);
 #else
 	WARN_ON_ONCE(true);
 #endif
-- 
2.50.1


