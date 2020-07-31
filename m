Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33940234244
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 11:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1RBy-0000Wp-G8; Fri, 31 Jul 2020 09:19:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XNXZ=BK=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k1RBx-0000Vm-4p
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 09:19:05 +0000
X-Inumbo-ID: de6814e0-d30e-11ea-8e1f-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id de6814e0-d30e-11ea-8e1f-bc764e2007e4;
 Fri, 31 Jul 2020 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596187140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOON8+ajaLpXIcBxCYJ6eMATKXtAWnIlcMGpRLJHnBo=;
 b=bJTt0i+iPUoecHL6hE6yF2u6x9u/VnocEw77lYLaQeSQ8bQ+VJLfFs84wLWoqDbvlHAHCj
 xjILaBJeVmtLrchGYQpBeEA4rhve19vwAU4KmfiCJXixltInJfy184Vg9QIkmWuV5suksV
 c7wfg/ODoXhy2UfPQVf3lkGWXgDfmpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-a6wjUmLxO62-OZabls5-1w-1; Fri, 31 Jul 2020 05:18:58 -0400
X-MC-Unique: a6wjUmLxO62-OZabls5-1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFFD618C63C0;
 Fri, 31 Jul 2020 09:18:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 919091C92D;
 Fri, 31 Jul 2020 09:18:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFCv1 3/5] virtio-mem: try to merge "System RAM (virtio_mem)"
 resources
Date: Fri, 31 Jul 2020 11:18:36 +0200
Message-Id: <20200731091838.7490-4-david@redhat.com>
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
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

virtio-mem adds memory in memory block granularity, to be able to
remove it in the same granularity again later, and to grow slowly on
demand. This, however, results in quite a lot of resources when
adding a lot of memory. Resources are effectively stored in a list-based
tree. Having a lot of resources not only wastes memory, it also makes
traversing that tree more expensive, and makes /proc/iomem explode in
size (e.g., requiring kexec-tools to manually merge resources later
when e.g., trying to create a kdump header).

Before this patch, we get (/proc/iomem) when hotplugging 2G via virtio-mem
on x86-64:
        [...]
        100000000-13fffffff : System RAM
        140000000-33fffffff : virtio0
          140000000-147ffffff : System RAM (virtio_mem)
          148000000-14fffffff : System RAM (virtio_mem)
          150000000-157ffffff : System RAM (virtio_mem)
          158000000-15fffffff : System RAM (virtio_mem)
          160000000-167ffffff : System RAM (virtio_mem)
          168000000-16fffffff : System RAM (virtio_mem)
          170000000-177ffffff : System RAM (virtio_mem)
          178000000-17fffffff : System RAM (virtio_mem)
          180000000-187ffffff : System RAM (virtio_mem)
          188000000-18fffffff : System RAM (virtio_mem)
          190000000-197ffffff : System RAM (virtio_mem)
          198000000-19fffffff : System RAM (virtio_mem)
          1a0000000-1a7ffffff : System RAM (virtio_mem)
          1a8000000-1afffffff : System RAM (virtio_mem)
          1b0000000-1b7ffffff : System RAM (virtio_mem)
          1b8000000-1bfffffff : System RAM (virtio_mem)
        3280000000-32ffffffff : PCI Bus 0000:00

With this patch, we get (/proc/iomem):
        [...]
        fffc0000-ffffffff : Reserved
        100000000-13fffffff : System RAM
        140000000-33fffffff : virtio0
          140000000-1bfffffff : System RAM (virtio_mem)
        3280000000-32ffffffff : PCI Bus 0000:00

Of course, with more hotplugged memory, it gets worse. When unplugging
memory blocks again, try_remove_memory() (via
offline_and_remove_memory()) will properly split the resource up again.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index f26f5f64ae822..2396a8d67875e 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -415,6 +415,7 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id);
 	int nid = vm->nid;
+	int rc;
 
 	if (nid == NUMA_NO_NODE)
 		nid = memory_add_physaddr_to_nid(addr);
@@ -431,8 +432,17 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 	}
 
 	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
-	return add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
-					 vm->resource_name);
+	rc = add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
+				       vm->resource_name);
+	if (!rc) {
+		/*
+		 * Try to reduce the number of resources by merging them. The
+		 * memory removal path will properly split them up again.
+		 */
+		merge_child_mem_resources(vm->parent_resource,
+					  vm->resource_name);
+	}
+	return rc;
 }
 
 /*
-- 
2.26.2


