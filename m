Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FCA24D286
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 12:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k94O8-0000bE-JD; Fri, 21 Aug 2020 10:35:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=82Ct=B7=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k94O7-0000aw-Hq
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 10:35:11 +0000
X-Inumbo-ID: 7897e7dd-32db-4c44-949f-acfa0afcd6a6
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7897e7dd-32db-4c44-949f-acfa0afcd6a6;
 Fri, 21 Aug 2020 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598006110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a286TBwbZ7ci6RWhKZMWDqKWC78sTVuqH/ttlMVxfUs=;
 b=Z+whIEeFsJbcZWTC14b1kwV1djiU7QE3/k/MTYSHgu9WuhqsgaFcoOUmQqIzzp55Nc0tqt
 +JdPHKGFUXjNI5Q8vBZQWYliivKyzHj4ynaBeqK3QS1A8YOWJ/PfNbfNlMmENeFHgk07He
 JPJh/lRWGKfkImCDkViiVGFEq2N1J/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Gn4EHG4jOouXnffn-SpIAw-1; Fri, 21 Aug 2020 06:35:05 -0400
X-MC-Unique: Gn4EHG4jOouXnffn-SpIAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4707F18A2241;
 Fri, 21 Aug 2020 10:35:04 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 449F960BF1;
 Fri, 21 Aug 2020 10:34:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v1 3/5] virtio-mem: try to merge system ram resources
Date: Fri, 21 Aug 2020 12:34:29 +0200
Message-Id: <20200821103431.13481-4-david@redhat.com>
In-Reply-To: <20200821103431.13481-1-david@redhat.com>
References: <20200821103431.13481-1-david@redhat.com>
MIME-Version: 1.0
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

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 834b7c13ef3dc..3aae0f87073a8 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -407,6 +407,7 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id);
 	int nid = vm->nid;
+	int rc;
 
 	if (nid == NUMA_NO_NODE)
 		nid = memory_add_physaddr_to_nid(addr);
@@ -423,8 +424,17 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 	}
 
 	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
-	return add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
-					 vm->resource_name);
+	rc = add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
+				       vm->resource_name);
+	if (!rc) {
+		/*
+		 * Try to reduce the number of system ram resources in our
+		 * resource container. The memory removal path will properly
+		 * split them up again.
+		 */
+		merge_system_ram_resources(vm->parent_resource);
+	}
+	return rc;
 }
 
 /*
-- 
2.26.2


