Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C2224D283
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 12:35:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k94O1-0000Z8-3n; Fri, 21 Aug 2020 10:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=82Ct=B7=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k94O0-0000Xn-1u
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 10:35:04 +0000
X-Inumbo-ID: bd76f3b0-5cf1-4146-a27d-d4d7d6cace23
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bd76f3b0-5cf1-4146-a27d-d4d7d6cace23;
 Fri, 21 Aug 2020 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598006101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G68oLT4JVMoIG5DqaYBfCZBI9EqNtAD2sZmp6ATBUeA=;
 b=FrULWNGUo4md0VuZQnM9ccGnoG1bCbfjiS10prNeVMG1jZJcfWOHOQp2SojYbRZ/jqDhRz
 C23r2E074N3A9wlN4jJ3WBEA/AHaLAAfaPvN0kobbB+PqCnBG9JwugXDn87cdbxFZyQog7
 jv/eNDQ+cSqQy3JTqAmhqocPO0epvzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-i2qdkbQ-NhGC9y6PSLFkzg-1; Fri, 21 Aug 2020 06:34:57 -0400
X-MC-Unique: i2qdkbQ-NhGC9y6PSLFkzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F3A8030D0;
 Fri, 21 Aug 2020 10:34:54 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05299756D8;
 Fri, 21 Aug 2020 10:34:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Baoquan He <bhe@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v1 2/5] kernel/resource: merge_system_ram_resources() to merge
 resources after hotplug
Date: Fri, 21 Aug 2020 12:34:28 +0200
Message-Id: <20200821103431.13481-3-david@redhat.com>
In-Reply-To: <20200821103431.13481-1-david@redhat.com>
References: <20200821103431.13481-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Some add_memory*() users add memory in small, contiguous memory blocks.
Examples include virtio-mem, hyper-v balloon, and the XEN balloon.

This can quickly result in a lot of memory resources, whereby the actual
resource boundaries are not of interest (e.g., it might be relevant for
DIMMs, exposed via /proc/iomem to user space). We really want to merge
added resources in this scenario where possible.

Let's provide an interface to trigger merging of applicable child
resources. It will be, for example, used by virtio-mem to trigger
merging of system ram resources it added to its resource container, but
also by XEN and Hyper-V to trigger merging of system ram resources in
iomem_resource.

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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/ioport.h |  3 +++
 kernel/resource.c      | 52 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 52a91f5fa1a36..3bb0020cd6ddc 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -251,6 +251,9 @@ extern void __release_region(struct resource *, resource_size_t,
 extern void release_mem_region_adjustable(struct resource *, resource_size_t,
 					  resource_size_t);
 #endif
+#ifdef CONFIG_MEMORY_HOTPLUG
+extern void merge_system_ram_resources(struct resource *res);
+#endif
 
 /* Wrappers for managed devices */
 struct device;
diff --git a/kernel/resource.c b/kernel/resource.c
index 1dcef5d53d76e..b4e0963edadd2 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1360,6 +1360,58 @@ void release_mem_region_adjustable(struct resource *parent,
 }
 #endif	/* CONFIG_MEMORY_HOTREMOVE */
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+static bool system_ram_resources_mergeable(struct resource *r1,
+					   struct resource *r2)
+{
+	return r1->flags == r2->flags && r1->end + 1 == r2->start &&
+	       r1->name == r2->name && r1->desc == r2->desc &&
+	       !r1->child && !r2->child;
+}
+
+/*
+ * merge_system_ram_resources - try to merge contiguous system ram resources
+ * @parent: parent resource descriptor
+ *
+ * This interface is intended for memory hotplug, whereby lots of contiguous
+ * system ram resources are added (e.g., via add_memory*()) by a driver, and
+ * the actual resource boundaries are not of interest (e.g., it might be
+ * relevant for DIMMs). Only immediate child resources that are busy and
+ * don't have any children are considered. All applicable child resources
+ * must be immutable during the request.
+ *
+ * Note:
+ * - The caller has to make sure that no pointers to resources that might
+ *   get merged are held anymore. Callers should only trigger merging of child
+ *   resources when they are the only one adding system ram resources to the
+ *   parent (besides during boot).
+ * - release_mem_region_adjustable() will split on demand on memory hotunplug
+ */
+void merge_system_ram_resources(struct resource *parent)
+{
+	const unsigned long flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	struct resource *cur, *next;
+
+	write_lock(&resource_lock);
+
+	cur = parent->child;
+	while (cur && cur->sibling) {
+		next = cur->sibling;
+		if ((cur->flags & flags) == flags &&
+		    system_ram_resources_mergeable(cur, next)) {
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
+EXPORT_SYMBOL(merge_system_ram_resources);
+#endif	/* CONFIG_MEMORY_HOTPLUG */
+
 /*
  * Managed region resource
  */
-- 
2.26.2


