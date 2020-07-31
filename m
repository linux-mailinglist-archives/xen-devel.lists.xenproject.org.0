Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5551C234248
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 11:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1RBu-0000W5-3d; Fri, 31 Jul 2020 09:19:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XNXZ=BK=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k1RBs-0000Vm-4g
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 09:19:00 +0000
X-Inumbo-ID: dab94e05-d30e-11ea-8e1f-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dab94e05-d30e-11ea-8e1f-bc764e2007e4;
 Fri, 31 Jul 2020 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596187134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nm9hdEOPm77EQVaUlUcV47hpK3bGj715U/FFPYWuGso=;
 b=UJSVVoXWWXWnPd07mj93j8NHefizfRRtku8wBHOJuMlX142lwynJHx32O4stSDZynh4sxs
 DxHxlGwM0vgm0x9fHuUCI+PF56uv27CrzoO/iXQi4KslGuZ4WqbupwPp5lYmZkZlro7zBW
 gW0s6HIIZScVS22Aj+wC2Fwnubi5Y40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-eybjEKR1P9C14MolFOWKEA-1; Fri, 31 Jul 2020 05:18:51 -0400
X-MC-Unique: eybjEKR1P9C14MolFOWKEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D2E6101C8A7;
 Fri, 31 Jul 2020 09:18:50 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564781A835;
 Fri, 31 Jul 2020 09:18:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFCv1 1/5] kernel/resource: make
 release_mem_region_adjustable() never fail
Date: Fri, 31 Jul 2020 11:18:34 +0200
Message-Id: <20200731091838.7490-2-david@redhat.com>
In-Reply-To: <20200731091838.7490-1-david@redhat.com>
References: <20200731091838.7490-1-david@redhat.com>
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Kees Cook <keescook@chromium.org>,
 David Hildenbrand <david@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Yang <richardw.yang@linux.intel.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Let's make sure splitting a resource on memory hotunplug will never fail.
This will become more relevant once we merge selected system ram
resources - then, we'll trigger that case more often un memory unplug.

In general, this function is already unlikely to fail. When we remove
memory, we free up quite a lot of metadata (memmap, page tables, memory
block device, etc.).

All other error cases inside release_mem_region_adjustable() seem to be
sanity checks if the function would be abused in different context -
let's add WARN_ON_ONCE().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/ioport.h |  4 ++--
 kernel/resource.c      | 49 ++++++++++++++++++++++++------------------
 mm/memory_hotplug.c    | 22 +------------------
 3 files changed, 31 insertions(+), 44 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 6c2b06fe8beb7..52a91f5fa1a36 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -248,8 +248,8 @@ extern struct resource * __request_region(struct resource *,
 extern void __release_region(struct resource *, resource_size_t,
 				resource_size_t);
 #ifdef CONFIG_MEMORY_HOTREMOVE
-extern int release_mem_region_adjustable(struct resource *, resource_size_t,
-				resource_size_t);
+extern void release_mem_region_adjustable(struct resource *, resource_size_t,
+					  resource_size_t);
 #endif
 
 /* Wrappers for managed devices */
diff --git a/kernel/resource.c b/kernel/resource.c
index 841737bbda9e5..249c6b54014de 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1255,21 +1255,28 @@ EXPORT_SYMBOL(__release_region);
  *   assumes that all children remain in the lower address entry for
  *   simplicity.  Enhance this logic when necessary.
  */
-int release_mem_region_adjustable(struct resource *parent,
-				  resource_size_t start, resource_size_t size)
+void release_mem_region_adjustable(struct resource *parent,
+				   resource_size_t start, resource_size_t size)
 {
+	struct resource *new_res = NULL;
+	bool alloc_nofail = false;
 	struct resource **p;
 	struct resource *res;
-	struct resource *new_res;
 	resource_size_t end;
-	int ret = -EINVAL;
 
 	end = start + size - 1;
-	if ((start < parent->start) || (end > parent->end))
-		return ret;
+	if (WARN_ON_ONCE((start < parent->start) || (end > parent->end)))
+		return;
 
-	/* The alloc_resource() result gets checked later */
-	new_res = alloc_resource(GFP_KERNEL);
+	/*
+	 * We free up quite a lot of memory on memory hotunplug (esp. memap),
+	 * just before releasing the region. This is highly unlikely to
+	 * fail - let's play save and make it never fail as the caller cannot
+	 * perform any error handling (e.g., trying to re-add memory will fail
+	 * similarly).
+	 */
+retry:
+	new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
 
 	p = &parent->child;
 	write_lock(&resource_lock);
@@ -1295,7 +1302,6 @@ int release_mem_region_adjustable(struct resource *parent,
 		 * so if we are dealing with them, let us just back off here.
 		 */
 		if (!(res->flags & IORESOURCE_SYSRAM)) {
-			ret = 0;
 			break;
 		}
 
@@ -1312,20 +1318,23 @@ int release_mem_region_adjustable(struct resource *parent,
 			/* free the whole entry */
 			*p = res->sibling;
 			free_resource(res);
-			ret = 0;
 		} else if (res->start == start && res->end != end) {
 			/* adjust the start */
-			ret = __adjust_resource(res, end + 1,
-						res->end - end);
+			WARN_ON_ONCE(__adjust_resource(res, end + 1,
+						       res->end - end));
 		} else if (res->start != start && res->end == end) {
 			/* adjust the end */
-			ret = __adjust_resource(res, res->start,
-						start - res->start);
+			WARN_ON_ONCE(__adjust_resource(res, res->start,
+						       start - res->start));
 		} else {
-			/* split into two entries */
+			/* split into two entries - we need a new resource */
 			if (!new_res) {
-				ret = -ENOMEM;
-				break;
+				new_res = alloc_resource(GFP_ATOMIC);
+				if (!new_res) {
+					alloc_nofail = true;
+					write_unlock(&resource_lock);
+					goto retry;
+				}
 			}
 			new_res->name = res->name;
 			new_res->start = end + 1;
@@ -1336,9 +1345,8 @@ int release_mem_region_adjustable(struct resource *parent,
 			new_res->sibling = res->sibling;
 			new_res->child = NULL;
 
-			ret = __adjust_resource(res, res->start,
-						start - res->start);
-			if (ret)
+			if (WARN_ON_ONCE(__adjust_resource(res, res->start,
+							   start - res->start)))
 				break;
 			res->sibling = new_res;
 			new_res = NULL;
@@ -1349,7 +1357,6 @@ int release_mem_region_adjustable(struct resource *parent,
 
 	write_unlock(&resource_lock);
 	free_resource(new_res);
-	return ret;
 }
 #endif	/* CONFIG_MEMORY_HOTREMOVE */
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index da374cd3d45b3..258656b819dbe 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1709,26 +1709,6 @@ void try_offline_node(int nid)
 }
 EXPORT_SYMBOL(try_offline_node);
 
-static void __release_memory_resource(resource_size_t start,
-				      resource_size_t size)
-{
-	int ret;
-
-	/*
-	 * When removing memory in the same granularity as it was added,
-	 * this function never fails. It might only fail if resources
-	 * have to be adjusted or split. We'll ignore the error, as
-	 * removing of memory cannot fail.
-	 */
-	ret = release_mem_region_adjustable(&iomem_resource, start, size);
-	if (ret) {
-		resource_size_t endres = start + size - 1;
-
-		pr_warn("Unable to release resource <%pa-%pa> (%d)\n",
-			&start, &endres, ret);
-	}
-}
-
 static int __ref try_remove_memory(int nid, u64 start, u64 size)
 {
 	int rc = 0;
@@ -1762,7 +1742,7 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
 		memblock_remove(start, size);
 	}
 
-	__release_memory_resource(start, size);
+	release_mem_region_adjustable(&iomem_resource, start, size);
 
 	try_offline_node(nid);
 
-- 
2.26.2


