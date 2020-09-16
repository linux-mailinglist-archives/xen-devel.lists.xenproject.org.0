Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C485026BE04
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:31:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRu6-0002tT-NK; Wed, 16 Sep 2020 07:30:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=44SI=CZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kIRu5-0002tO-8t
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:30:57 +0000
X-Inumbo-ID: 62936472-e5b2-4589-a4a1-160dbe86f204
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 62936472-e5b2-4589-a4a1-160dbe86f204;
 Wed, 16 Sep 2020 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600241455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF/hDQsxWFeJttqotpNYCePCKYRYUJaa1tQ1ZRR0EAY=;
 b=OcGt8lwcuPm9huSmn3o7TZH8l5FGWvD4OMAV3/zxWIhKCQIizQnEWuFXG+sgKjs479stwC
 7xJsyZPFAF68ZvFKfRZaQlq+SiSPqbySUk6SNWcVqyo0X6jADcq26k53BnbdX1JFml3lo5
 SPoulwUt1mGb6xJjuisa8hZ9ytqmMCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-8Xm80AAoPHqeed1mdsZ8Iw-1; Wed, 16 Sep 2020 03:30:51 -0400
X-MC-Unique: 8Xm80AAoPHqeed1mdsZ8Iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795B585C733;
 Wed, 16 Sep 2020 07:30:49 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-190.ams2.redhat.com [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D49751000239;
 Wed, 16 Sep 2020 07:30:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Michal Hocko <mhocko@suse.com>, Dan Williams <dan.j.williams@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>
Subject: [PATCH] kernel/resource: make iomem_resource implicit in
 release_mem_region_adjustable()
Date: Wed, 16 Sep 2020 09:30:41 +0200
Message-Id: <20200916073041.10355-1-david@redhat.com>
In-Reply-To: <20200911103459.10306-1-david@redhat.com>
References: <20200911103459.10306-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

"mem" in the name already indicates the root, similar to
release_mem_region() and devm_request_mem_region(). Make it implicit.
The only single caller always passes iomem_resource, other parents are
not applicable.

Suggested-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Based on next-20200915. Follow up on
	"[PATCH v4 0/8] selective merging of system ram resources" [1]
That's in next-20200915. As noted during review of v2 by Wei [2].

[1] https://lkml.kernel.org/r/20200911103459.10306-1-david@redhat.com
[2] https://lkml.kernel.org/r/20200915021012.GC2007@L-31X9LVDL-1304.local

---
 include/linux/ioport.h | 3 +--
 kernel/resource.c      | 5 ++---
 mm/memory_hotplug.c    | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 7e61389dcb01..5135d4b86cd6 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -251,8 +251,7 @@ extern struct resource * __request_region(struct resource *,
 extern void __release_region(struct resource *, resource_size_t,
 				resource_size_t);
 #ifdef CONFIG_MEMORY_HOTREMOVE
-extern void release_mem_region_adjustable(struct resource *, resource_size_t,
-					  resource_size_t);
+extern void release_mem_region_adjustable(resource_size_t, resource_size_t);
 #endif
 #ifdef CONFIG_MEMORY_HOTPLUG
 extern void merge_system_ram_resource(struct resource *res);
diff --git a/kernel/resource.c b/kernel/resource.c
index 7a91b935f4c2..ca2a666e4317 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1240,7 +1240,6 @@ EXPORT_SYMBOL(__release_region);
 #ifdef CONFIG_MEMORY_HOTREMOVE
 /**
  * release_mem_region_adjustable - release a previously reserved memory region
- * @parent: parent resource descriptor
  * @start: resource start address
  * @size: resource region size
  *
@@ -1258,9 +1257,9 @@ EXPORT_SYMBOL(__release_region);
  *   assumes that all children remain in the lower address entry for
  *   simplicity.  Enhance this logic when necessary.
  */
-void release_mem_region_adjustable(struct resource *parent,
-				   resource_size_t start, resource_size_t size)
+void release_mem_region_adjustable(resource_size_t start, resource_size_t size)
 {
+	struct resource *parent = &iomem_resource;
 	struct resource *new_res = NULL;
 	bool alloc_nofail = false;
 	struct resource **p;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 553c718226b3..7c5e4744ac51 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1764,7 +1764,7 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
 		memblock_remove(start, size);
 	}
 
-	release_mem_region_adjustable(&iomem_resource, start, size);
+	release_mem_region_adjustable(start, size);
 
 	try_offline_node(nid);
 
-- 
2.26.2


