Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245B27B460
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 20:22:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMxmf-000870-FW; Mon, 28 Sep 2020 18:21:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ke0=DF=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kMxme-00086V-2H
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 18:21:56 +0000
X-Inumbo-ID: 5486eb5b-76b8-4789-a710-fa9000a6fd87
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5486eb5b-76b8-4789-a710-fa9000a6fd87;
 Mon, 28 Sep 2020 18:21:55 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601317315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85B0mZRKs5mkl5E8BDbfnUinjf/rtUnPl3Qk/CJCPXg=;
 b=WYqzVoKXMO6IkcRYCJzkXQK+t3xvqBx/aWKw7ixKoDOMWsiOLa9ZhRII5CLYaBV0HcebzI
 hsvs9eO5vIL3mKMCn8aKcpJ+ukLx6j/4H5qAO9eryadQjgJ7BJUom/C5NfZz9ESox6V1Uj
 Bb/hpl7okH5/DlT34ql84kO/JNftqYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-NY6l3ukFNlmJxz48QH7ihg-1; Mon, 28 Sep 2020 14:21:51 -0400
X-MC-Unique: NY6l3ukFNlmJxz48QH7ihg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F39EC8015AA;
 Mon, 28 Sep 2020 18:21:48 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-106.ams2.redhat.com [10.36.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B58827CD4;
 Mon, 28 Sep 2020 18:21:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v1 5/5] mm/memory_hotplug: update comment regarding zone
 shuffling
Date: Mon, 28 Sep 2020 20:21:10 +0200
Message-Id: <20200928182110.7050-6-david@redhat.com>
In-Reply-To: <20200928182110.7050-1-david@redhat.com>
References: <20200928182110.7050-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As we no longer shuffle via generic_online_page() and when undoing
isolation, we can simplify the comment.

We now effectively shuffle only once (properly) when onlining new
memory.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 9db80ee29caa..c589bd8801bb 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -859,13 +859,10 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages,
 	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
 
 	/*
-	 * When exposing larger, physically contiguous memory areas to the
-	 * buddy, shuffling in the buddy (when freeing onlined pages, putting
-	 * them either to the head or the tail of the freelist) is only helpful
-	 * for maintaining the shuffle, but not for creating the initial
-	 * shuffle. Shuffle the whole zone to make sure the just onlined pages
-	 * are properly distributed across the whole freelist. Make sure to
-	 * shuffle once pageblocks are no longer isolated.
+	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
+	 * the tail of the freelist when undoing isolation). Shuffle the whole
+	 * zone to make sure the just onlined pages are properly distributed
+	 * across the whole freelist - to create an initial shuffle.
 	 */
 	shuffle_zone(zone);
 
-- 
2.26.2


