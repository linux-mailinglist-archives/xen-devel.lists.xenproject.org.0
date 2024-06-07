Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3D78FFEEE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 11:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736427.1142500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFVbl-0006Fi-TK; Fri, 07 Jun 2024 09:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736427.1142500; Fri, 07 Jun 2024 09:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFVbl-0006Bi-Qf; Fri, 07 Jun 2024 09:10:01 +0000
Received: by outflank-mailman (input) for mailman id 736427;
 Fri, 07 Jun 2024 09:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NiIp=NJ=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sFVbk-0006Bc-2v
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 09:10:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b62463dc-24ad-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 11:09:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-siZVc8J6MdebVKtoCSUwSQ-1; Fri,
 07 Jun 2024 05:09:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C59D31C05190;
 Fri,  7 Jun 2024 09:09:50 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44DB337E7;
 Fri,  7 Jun 2024 09:09:46 +0000 (UTC)
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
X-Inumbo-ID: b62463dc-24ad-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717751397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiFnKpy9jAQsfmTIBaaW+Ib0u1X/H+DkqsqDykpaDbc=;
	b=GNxqk8ux8t6eT3Pmk4WOQGs8g/mCXLwUO6W/xF9HOi1t8Yba2PDpiWqkULXq4K6vOtXxkM
	dTXBocFW4U8EbRfAenebeuBR230RxJHIs7+o6AVHe+1+wlMhDBVyFnYlEkF9mWCtTUgj5H
	atTIYRAsw3bPgh95K3XImwmmdPBEVrY=
X-MC-Unique: siZVc8J6MdebVKtoCSUwSQ-1
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	kasan-dev@googlegroups.com,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>
Subject: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
Date: Fri,  7 Jun 2024 11:09:36 +0200
Message-ID: <20240607090939.89524-2-david@redhat.com>
In-Reply-To: <20240607090939.89524-1-david@redhat.com>
References: <20240607090939.89524-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

In preparation for further changes, let's teach __free_pages_core()
about the differences of memory hotplug handling.

Move the memory hotplug specific handling from generic_online_page() to
__free_pages_core(), use adjust_managed_page_count() on the memory
hotplug path, and spell out why memory freed via memblock
cannot currently use adjust_managed_page_count().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h       |  3 ++-
 mm/kmsan/init.c     |  2 +-
 mm/memory_hotplug.c |  9 +--------
 mm/mm_init.c        |  4 ++--
 mm/page_alloc.c     | 17 +++++++++++++++--
 5 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 12e95fdf61e90..3fdee779205ab 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -604,7 +604,8 @@ extern void __putback_isolated_page(struct page *page, unsigned int order,
 				    int mt);
 extern void memblock_free_pages(struct page *page, unsigned long pfn,
 					unsigned int order);
-extern void __free_pages_core(struct page *page, unsigned int order);
+extern void __free_pages_core(struct page *page, unsigned int order,
+		enum meminit_context);
 
 /*
  * This will have no effect, other than possibly generating a warning, if the
diff --git a/mm/kmsan/init.c b/mm/kmsan/init.c
index 3ac3b8921d36f..ca79636f858e5 100644
--- a/mm/kmsan/init.c
+++ b/mm/kmsan/init.c
@@ -172,7 +172,7 @@ static void do_collection(void)
 		shadow = smallstack_pop(&collect);
 		origin = smallstack_pop(&collect);
 		kmsan_setup_meta(page, shadow, origin, collect.order);
-		__free_pages_core(page, collect.order);
+		__free_pages_core(page, collect.order, MEMINIT_EARLY);
 	}
 }
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 171ad975c7cfd..27e3be75edcf7 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -630,14 +630,7 @@ EXPORT_SYMBOL_GPL(restore_online_page_callback);
 
 void generic_online_page(struct page *page, unsigned int order)
 {
-	/*
-	 * Freeing the page with debug_pagealloc enabled will try to unmap it,
-	 * so we should map it first. This is better than introducing a special
-	 * case in page freeing fast path.
-	 */
-	debug_pagealloc_map_pages(page, 1 << order);
-	__free_pages_core(page, order);
-	totalram_pages_add(1UL << order);
+	__free_pages_core(page, order, MEMINIT_HOTPLUG);
 }
 EXPORT_SYMBOL_GPL(generic_online_page);
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 019193b0d8703..feb5b6e8c8875 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1938,7 +1938,7 @@ static void __init deferred_free_range(unsigned long pfn,
 	for (i = 0; i < nr_pages; i++, page++, pfn++) {
 		if (pageblock_aligned(pfn))
 			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
-		__free_pages_core(page, 0);
+		__free_pages_core(page, 0, MEMINIT_EARLY);
 	}
 }
 
@@ -2513,7 +2513,7 @@ void __init memblock_free_pages(struct page *page, unsigned long pfn,
 		}
 	}
 
-	__free_pages_core(page, order);
+	__free_pages_core(page, order, MEMINIT_EARLY);
 }
 
 DEFINE_STATIC_KEY_MAYBE(CONFIG_INIT_ON_ALLOC_DEFAULT_ON, init_on_alloc);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2224965ada468..e0c8a8354be36 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1214,7 +1214,8 @@ static void __free_pages_ok(struct page *page, unsigned int order,
 	__count_vm_events(PGFREE, 1 << order);
 }
 
-void __free_pages_core(struct page *page, unsigned int order)
+void __free_pages_core(struct page *page, unsigned int order,
+		enum meminit_context context)
 {
 	unsigned int nr_pages = 1 << order;
 	struct page *p = page;
@@ -1234,7 +1235,19 @@ void __free_pages_core(struct page *page, unsigned int order)
 	__ClearPageReserved(p);
 	set_page_count(p, 0);
 
-	atomic_long_add(nr_pages, &page_zone(page)->managed_pages);
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG) &&
+	    unlikely(context == MEMINIT_HOTPLUG)) {
+		/*
+		 * Freeing the page with debug_pagealloc enabled will try to
+		 * unmap it; some archs don't like double-unmappings, so
+		 * map it first.
+		 */
+		debug_pagealloc_map_pages(page, nr_pages);
+		adjust_managed_page_count(page, nr_pages);
+	} else {
+		/* memblock adjusts totalram_pages() ahead of time. */
+		atomic_long_add(nr_pages, &page_zone(page)->managed_pages);
+	}
 
 	if (page_contains_unaccepted(page, order)) {
 		if (order == MAX_PAGE_ORDER && __free_unaccepted(page))
-- 
2.45.1


