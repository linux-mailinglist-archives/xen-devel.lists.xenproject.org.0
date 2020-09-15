Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE4D269CDD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 06:12:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI2KA-0007Eu-ML; Tue, 15 Sep 2020 04:12:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B5vB=CY=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kI0NY-0004go-QI
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 02:07:32 +0000
X-Inumbo-ID: c0e7fcef-5aa7-4882-9d24-96dd52cf8741
Received: from out30-130.freemail.mail.aliyun.com (unknown [115.124.30.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0e7fcef-5aa7-4882-9d24-96dd52cf8741;
 Tue, 15 Sep 2020 02:07:28 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0U9-Pd4L_1600135638; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U9-Pd4L_1600135638) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 15 Sep 2020 10:07:18 +0800
Date: Tue, 15 Sep 2020 10:07:18 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 1/7] kernel/resource: make
 release_mem_region_adjustable() never fail
Message-ID: <20200915020718.GB2007@L-31X9LVDL-1304.local>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908201012.44168-2-david@redhat.com>
X-Mailman-Approved-At: Tue, 15 Sep 2020 04:12:09 +0000
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
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 08, 2020 at 10:10:06PM +0200, David Hildenbrand wrote:
>Let's make sure splitting a resource on memory hotunplug will never fail.
>This will become more relevant once we merge selected System RAM
>resources - then, we'll trigger that case more often on memory hotunplug.
>
>In general, this function is already unlikely to fail. When we remove
>memory, we free up quite a lot of metadata (memmap, page tables, memory
>block device, etc.). The only reason it could really fail would be when
>injecting allocation errors.
>
>All other error cases inside release_mem_region_adjustable() seem to be
>sanity checks if the function would be abused in different context -
>let's add WARN_ON_ONCE() in these cases so we can catch them.
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Dan Williams <dan.j.williams@intel.com>
>Cc: Jason Gunthorpe <jgg@ziepe.ca>
>Cc: Kees Cook <keescook@chromium.org>
>Cc: Ard Biesheuvel <ardb@kernel.org>
>Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Wei Yang <richardw.yang@linux.intel.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> include/linux/ioport.h |  4 ++--
> kernel/resource.c      | 49 ++++++++++++++++++++++++------------------
> mm/memory_hotplug.c    | 22 +------------------
> 3 files changed, 31 insertions(+), 44 deletions(-)
>
>diff --git a/include/linux/ioport.h b/include/linux/ioport.h
>index 6c2b06fe8beb7..52a91f5fa1a36 100644
>--- a/include/linux/ioport.h
>+++ b/include/linux/ioport.h
>@@ -248,8 +248,8 @@ extern struct resource * __request_region(struct resource *,
> extern void __release_region(struct resource *, resource_size_t,
> 				resource_size_t);
> #ifdef CONFIG_MEMORY_HOTREMOVE
>-extern int release_mem_region_adjustable(struct resource *, resource_size_t,
>-				resource_size_t);
>+extern void release_mem_region_adjustable(struct resource *, resource_size_t,
>+					  resource_size_t);
> #endif
> 
> /* Wrappers for managed devices */
>diff --git a/kernel/resource.c b/kernel/resource.c
>index f1175ce93a1d5..36b3552210120 100644
>--- a/kernel/resource.c
>+++ b/kernel/resource.c
>@@ -1258,21 +1258,28 @@ EXPORT_SYMBOL(__release_region);
>  *   assumes that all children remain in the lower address entry for
>  *   simplicity.  Enhance this logic when necessary.
>  */
>-int release_mem_region_adjustable(struct resource *parent,
>-				  resource_size_t start, resource_size_t size)
>+void release_mem_region_adjustable(struct resource *parent,
>+				   resource_size_t start, resource_size_t size)
> {
>+	struct resource *new_res = NULL;
>+	bool alloc_nofail = false;
> 	struct resource **p;
> 	struct resource *res;
>-	struct resource *new_res;
> 	resource_size_t end;
>-	int ret = -EINVAL;
> 
> 	end = start + size - 1;
>-	if ((start < parent->start) || (end > parent->end))
>-		return ret;
>+	if (WARN_ON_ONCE((start < parent->start) || (end > parent->end)))
>+		return;
> 
>-	/* The alloc_resource() result gets checked later */
>-	new_res = alloc_resource(GFP_KERNEL);
>+	/*
>+	 * We free up quite a lot of memory on memory hotunplug (esp., memap),
>+	 * just before releasing the region. This is highly unlikely to
>+	 * fail - let's play save and make it never fail as the caller cannot
>+	 * perform any error handling (e.g., trying to re-add memory will fail
>+	 * similarly).
>+	 */
>+retry:
>+	new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
> 

It looks like a bold change, while I don't find a reason to object it.

> 	p = &parent->child;
> 	write_lock(&resource_lock);
>@@ -1298,7 +1305,6 @@ int release_mem_region_adjustable(struct resource *parent,
> 		 * so if we are dealing with them, let us just back off here.
> 		 */
> 		if (!(res->flags & IORESOURCE_SYSRAM)) {
>-			ret = 0;
> 			break;
> 		}
> 
>@@ -1315,20 +1321,23 @@ int release_mem_region_adjustable(struct resource *parent,
> 			/* free the whole entry */
> 			*p = res->sibling;
> 			free_resource(res);
>-			ret = 0;
> 		} else if (res->start == start && res->end != end) {
> 			/* adjust the start */
>-			ret = __adjust_resource(res, end + 1,
>-						res->end - end);
>+			WARN_ON_ONCE(__adjust_resource(res, end + 1,
>+						       res->end - end));
> 		} else if (res->start != start && res->end == end) {
> 			/* adjust the end */
>-			ret = __adjust_resource(res, res->start,
>-						start - res->start);
>+			WARN_ON_ONCE(__adjust_resource(res, res->start,
>+						       start - res->start));
> 		} else {
>-			/* split into two entries */
>+			/* split into two entries - we need a new resource */
> 			if (!new_res) {
>-				ret = -ENOMEM;
>-				break;
>+				new_res = alloc_resource(GFP_ATOMIC);
>+				if (!new_res) {
>+					alloc_nofail = true;
>+					write_unlock(&resource_lock);
>+					goto retry;
>+				}
> 			}
> 			new_res->name = res->name;
> 			new_res->start = end + 1;
>@@ -1339,9 +1348,8 @@ int release_mem_region_adjustable(struct resource *parent,
> 			new_res->sibling = res->sibling;
> 			new_res->child = NULL;
> 
>-			ret = __adjust_resource(res, res->start,
>-						start - res->start);
>-			if (ret)
>+			if (WARN_ON_ONCE(__adjust_resource(res, res->start,
>+							   start - res->start)))
> 				break;
> 			res->sibling = new_res;
> 			new_res = NULL;
>@@ -1352,7 +1360,6 @@ int release_mem_region_adjustable(struct resource *parent,
> 
> 	write_unlock(&resource_lock);
> 	free_resource(new_res);
>-	return ret;
> }
> #endif	/* CONFIG_MEMORY_HOTREMOVE */
> 
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index baded53b9ff92..4c47b68a9f4b5 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -1724,26 +1724,6 @@ void try_offline_node(int nid)
> }
> EXPORT_SYMBOL(try_offline_node);
> 
>-static void __release_memory_resource(resource_size_t start,
>-				      resource_size_t size)
>-{
>-	int ret;
>-
>-	/*
>-	 * When removing memory in the same granularity as it was added,
>-	 * this function never fails. It might only fail if resources
>-	 * have to be adjusted or split. We'll ignore the error, as
>-	 * removing of memory cannot fail.
>-	 */
>-	ret = release_mem_region_adjustable(&iomem_resource, start, size);
>-	if (ret) {
>-		resource_size_t endres = start + size - 1;
>-
>-		pr_warn("Unable to release resource <%pa-%pa> (%d)\n",
>-			&start, &endres, ret);
>-	}
>-}
>-
> static int __ref try_remove_memory(int nid, u64 start, u64 size)
> {
> 	int rc = 0;
>@@ -1777,7 +1757,7 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
> 		memblock_remove(start, size);
> 	}
> 
>-	__release_memory_resource(start, size);
>+	release_mem_region_adjustable(&iomem_resource, start, size);
> 
> 	try_offline_node(nid);
> 
>-- 
>2.26.2

-- 
Wei Yang
Help you, Help me

