Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE0265E14
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGgPE-0002Ij-AT; Fri, 11 Sep 2020 10:35:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mhfz=CU=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kGgPC-0002Cd-Kp
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:35:46 +0000
X-Inumbo-ID: ec901205-4cd9-4358-b121-ca53cddb9da0
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ec901205-4cd9-4358-b121-ca53cddb9da0;
 Fri, 11 Sep 2020 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599820540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBaM0gfT9EmeJRfz1BCnCvzNGIhE7lHFb/gdbqzhO5Y=;
 b=i9omjgf/52mOiejMn61tJr1LiuUcNMBI1eVwXHTkHEkLOH4q3WuWh4bYoARvEeEbfBgZwj
 x250XEf9ahYUkLymxhhbnQ+79H4WJKT5F6vYF4V+mXFKearJAEspOkOVRUNJ2j//MZcWXy
 f69CFhOHPDE5dOWIyFiXpSs432dqOWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-i8mu2lbbNU-Zcgluk3bu8Q-1; Fri, 11 Sep 2020 06:35:36 -0400
X-MC-Unique: i8mu2lbbNU-Zcgluk3bu8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F53D805723;
 Fri, 11 Sep 2020 10:35:34 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-186.ams2.redhat.com [10.36.113.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9AE081C44;
 Fri, 11 Sep 2020 10:35:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v4 3/8] mm/memory_hotplug: guard more declarations by
 CONFIG_MEMORY_HOTPLUG
Date: Fri, 11 Sep 2020 12:34:54 +0200
Message-Id: <20200911103459.10306-4-david@redhat.com>
In-Reply-To: <20200911103459.10306-1-david@redhat.com>
References: <20200911103459.10306-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

We soon want to pass flags via a new type to add_memory() and friends.
That revealed that we currently don't guard some declarations by
CONFIG_MEMORY_HOTPLUG.

While some definitions could be moved to different places, let's keep it
minimal for now and use CONFIG_MEMORY_HOTPLUG for all functions only
compiled with CONFIG_MEMORY_HOTPLUG.

Wrap sparse_decode_mem_map() into CONFIG_MEMORY_HOTPLUG, it's only
called from CONFIG_MEMORY_HOTPLUG code.

While at it, remove allow_online_pfn_range(), which is no longer around,
and mhp_notimplemented(), which is unused.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memory_hotplug.h | 12 +++---------
 mm/sparse.c                    |  2 ++
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 51a877fec8da8..1504b4d5ae6ce 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -247,13 +247,6 @@ static inline void zone_span_writelock(struct zone *zone) {}
 static inline void zone_span_writeunlock(struct zone *zone) {}
 static inline void zone_seqlock_init(struct zone *zone) {}
 
-static inline int mhp_notimplemented(const char *func)
-{
-	printk(KERN_WARNING "%s() called, with CONFIG_MEMORY_HOTPLUG disabled\n", func);
-	dump_stack();
-	return -ENOSYS;
-}
-
 static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
 {
 }
@@ -344,6 +337,7 @@ static inline void __remove_memory(int nid, u64 start, u64 size) {}
 extern void set_zone_contiguous(struct zone *zone);
 extern void clear_zone_contiguous(struct zone *zone);
 
+#ifdef CONFIG_MEMORY_HOTPLUG
 extern void __ref free_area_init_core_hotplug(int nid);
 extern int __add_memory(int nid, u64 start, u64 size);
 extern int add_memory(int nid, u64 start, u64 size);
@@ -364,8 +358,8 @@ extern void sparse_remove_section(struct mem_section *ms,
 		unsigned long map_offset, struct vmem_altmap *altmap);
 extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
 					  unsigned long pnum);
-extern bool allow_online_pfn_range(int nid, unsigned long pfn, unsigned long nr_pages,
-		int online_type);
 extern struct zone *zone_for_pfn_range(int online_type, int nid, unsigned start_pfn,
 		unsigned long nr_pages);
+#endif /* CONFIG_MEMORY_HOTPLUG */
+
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/sparse.c b/mm/sparse.c
index b25ad8e648392..7bd23f9d6cef6 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -312,6 +312,7 @@ static unsigned long sparse_encode_mem_map(struct page *mem_map, unsigned long p
 	return coded_mem_map;
 }
 
+#ifdef CONFIG_MEMORY_HOTPLUG
 /*
  * Decode mem_map from the coded memmap
  */
@@ -321,6 +322,7 @@ struct page *sparse_decode_mem_map(unsigned long coded_mem_map, unsigned long pn
 	coded_mem_map &= SECTION_MAP_MASK;
 	return ((struct page *)coded_mem_map) + section_nr_to_pfn(pnum);
 }
+#endif /* CONFIG_MEMORY_HOTPLUG */
 
 static void __meminit sparse_init_one_section(struct mem_section *ms,
 		unsigned long pnum, struct page *mem_map,
-- 
2.26.2


