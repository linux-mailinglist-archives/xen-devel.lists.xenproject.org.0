Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4D234247
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 11:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1RBz-0000X0-OS; Fri, 31 Jul 2020 09:19:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XNXZ=BK=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k1RBx-0000Wj-Tl
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 09:19:05 +0000
X-Inumbo-ID: dff4855a-d30e-11ea-ab95-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dff4855a-d30e-11ea-ab95-12813bfff9fa;
 Fri, 31 Jul 2020 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596187142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GX38+opkWxBZfD2far/R2rRkc2X2qlfoUgt4pP5SXDg=;
 b=gwyJn3jU7N/REiKzRAhgTbpkjsF3/nUITttfsKZRuHB1p23+rMMRAwX0ywfGW4cRJyE5x9
 AobB+bvssCqavcJHHZaS6yRmHlBo7MzkztYsCI4ZKmtE8AddPcP19Y7FpfEnil8oK66xtL
 Wmn+xyRPyWX32GAtaulDphrYkhHmomY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Z7A2oVdiNTiak_-Gh5Vfug-1; Fri, 31 Jul 2020 05:18:58 -0400
X-MC-Unique: Z7A2oVdiNTiak_-Gh5Vfug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4358480382D;
 Fri, 31 Jul 2020 09:18:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D0681A835;
 Fri, 31 Jul 2020 09:18:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFCv1 2/5] kernel/resource: merge_child_mem_resources() to
 merge memory resources after adding succeeded
Date: Fri, 31 Jul 2020 11:18:35 +0200
Message-Id: <20200731091838.7490-3-david@redhat.com>
In-Reply-To: <20200731091838.7490-1-david@redhat.com>
References: <20200731091838.7490-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 Kees Cook <keescook@chromium.org>, David Hildenbrand <david@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, virtualization@lists.linux-foundation.org,
 Juergen Gross <jgross@suse.com>, linux-mm@kvack.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some add_memory*() users add memory in small, contiguous memory blocks.
Examples include virtio-mem, hyper-v balloon, and the XEN balloon.

This can quickly result in a lot of memory resources, whereby the actual
resource boundaries are not of interest (e.g., it might be relevant for
DIMMs, exposed via /proc/iomem to user space). We really want to merge
added resources in this scenario where possible.

Let's provide an interface to trigger merging of applicable child
resources. It will be, for example, used by virtio-mem to trigger
merging of memory resources it added (via add_memory_driver()
managed) to its resource container.

Note: We really want to merge after the whole operation succeeded, not
directly when adding a resource to the resource tree (it would break
add_memory_resource() and require splitting resources again when the
operation failed - e.g., due to -ENOMEM).

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/ioport.h |  3 +++
 kernel/resource.c      | 56 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 52a91f5fa1a36..743b87fe2205b 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -251,6 +251,9 @@ extern void __release_region(struct resource *, resource_size_t,
 extern void release_mem_region_adjustable(struct resource *, resource_size_t,
 					  resource_size_t);
 #endif
+#ifdef CONFIG_MEMORY_HOTPLUG
+extern void merge_child_mem_resources(struct resource *res, const char *name);
+#endif
 
 /* Wrappers for managed devices */
 struct device;
diff --git a/kernel/resource.c b/kernel/resource.c
index 249c6b54014de..01ecc5b7956f5 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1360,6 +1360,62 @@ void release_mem_region_adjustable(struct resource *parent,
 }
 #endif	/* CONFIG_MEMORY_HOTREMOVE */
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+static bool mem_resources_mergeable(struct resource *r1, struct resource *r2)
+{
+	return r1->end + 1 == r2->start &&
+	       r1->name == r2->name &&
+	       r1->flags == r2->flags &&
+	       (r1->flags & IORESOURCE_MEM) &&
+	       r1->desc == r2->desc &&
+	       !r1->child && !r2->child;
+}
+
+/*
+ * merge_child_mem_resources - try to merge contiguous child IORESOURCE_MEM
+ *                             resources with the given name that match all
+ *                             other properties
+ * @parent: parent resource descriptor
+ * @name: name of the child resources to consider for merging
+ *
+ * This interface is intended for memory hotplug, whereby lots of consecutive
+ * memory resources are added (e.g., via add_memory*()) by a driver, and the
+ * actual resource boundaries are not of interest (e.g., it might be
+ * relevant for DIMMs). Only immediate child resources are considered. All
+ * applicable child resources must be immutable during the request.
+ *
+ * Note:
+ * - The caller has to make sure that no pointers to resources that might
+ *   get merged are held anymore. Callers should only trigger merging of child
+ *   resources when they are the only one adding such resources to the parent.
+ *   E.g., if two mechanisms could add "System RAM" immediately below the
+ *   same parent, this function is not safe to use.
+ * - release_mem_region_adjustable() will split on demand on memory hotunplug
+ */
+void merge_child_mem_resources(struct resource *parent, const char *name)
+{
+	struct resource *cur, *next;
+
+	write_lock(&resource_lock);
+
+	cur = parent->child;
+	while (cur && cur->sibling) {
+		next = cur->sibling;
+		if (!strcmp(cur->name, name) &&
+		    mem_resources_mergeable(cur, next)) {
+			cur->end = next->end;
+			cur->sibling = next->sibling;
+			free_resource(next);
+			next = cur->sibling;
+		}
+		cur = next;
+	}
+
+	write_unlock(&resource_lock);
+}
+EXPORT_SYMBOL(merge_child_mem_resources);
+#endif	/* CONFIG_MEMORY_HOTPLUG */
+
 /*
  * Managed region resource
  */
-- 
2.26.2


