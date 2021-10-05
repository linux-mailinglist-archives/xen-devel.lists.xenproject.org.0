Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69C422637
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 14:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202211.356922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjOZ-0000Qn-8P; Tue, 05 Oct 2021 12:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202211.356922; Tue, 05 Oct 2021 12:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjOZ-0000OD-3d; Tue, 05 Oct 2021 12:18:07 +0000
Received: by outflank-mailman (input) for mailman id 202211;
 Tue, 05 Oct 2021 12:18:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOXf=OZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mXjOX-0000Nn-LR
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 12:18:05 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f9cacd5c-1332-433a-b088-58b90c71d67e;
 Tue, 05 Oct 2021 12:18:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-7eXJYInqNRydT23wsOE_6w-1; Tue, 05 Oct 2021 08:18:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B62881006AA2;
 Tue,  5 Oct 2021 12:18:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F149E1F41E;
 Tue,  5 Oct 2021 12:17:35 +0000 (UTC)
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
X-Inumbo-ID: f9cacd5c-1332-433a-b088-58b90c71d67e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633436284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UbXdn+v660VV5bsfwvBwOBATR8SkkHZUOKA5MNOOqCo=;
	b=aIZK3kicIJIoX7EkLwlqGPuatokGYH3OuQQ+EaHoWPGrq7/YneUqy1RfGMbyJ7NKxooccy
	PjltuAjS0PNb3Rijq6Fo+FdyTMwz/B2KDKBEbZvB8ibrm11Azq2YTUXUjhGKHkawQsoK+V
	G6XFEC9N0eIDNw0L3GzFJcrMdp724Uo=
X-MC-Unique: 7eXJYInqNRydT23wsOE_6w-1
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	virtualization@lists.linux-foundation.org,
	kexec@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 6/9] virtio-mem: factor out hotplug specifics from virtio_mem_init() into virtio_mem_init_hotplug()
Date: Tue,  5 Oct 2021 14:14:27 +0200
Message-Id: <20211005121430.30136-7-david@redhat.com>
In-Reply-To: <20211005121430.30136-1-david@redhat.com>
References: <20211005121430.30136-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

Let's prepare for a new virtio-mem kdump mode in which we don't actually
hot(un)plug any memory but only observe the state of device blocks.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 81 ++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index bef8ad6bf466..2ba7e8d6ba8d 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2392,41 +2392,10 @@ static int virtio_mem_init_vq(struct virtio_mem *vm)
 	return 0;
 }
 
-static int virtio_mem_init(struct virtio_mem *vm)
+static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 {
 	const struct range pluggable_range = mhp_get_pluggable_range(true);
 	uint64_t sb_size, addr;
-	uint16_t node_id;
-
-	if (!vm->vdev->config->get) {
-		dev_err(&vm->vdev->dev, "config access disabled\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * We don't want to (un)plug or reuse any memory when in kdump. The
-	 * memory is still accessible (but not mapped).
-	 */
-	if (is_kdump_kernel()) {
-		dev_warn(&vm->vdev->dev, "disabled in kdump kernel\n");
-		return -EBUSY;
-	}
-
-	/* Fetch all properties that can't change. */
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, plugged_size,
-			&vm->plugged_size);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, block_size,
-			&vm->device_block_size);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, node_id,
-			&node_id);
-	vm->nid = virtio_mem_translate_node_id(vm, node_id);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, addr, &vm->addr);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, region_size,
-			&vm->region_size);
-
-	/* Determine the nid for the device based on the lowest address. */
-	if (vm->nid == NUMA_NO_NODE)
-		vm->nid = memory_add_physaddr_to_nid(vm->addr);
 
 	/* bad device setup - warn only */
 	if (!IS_ALIGNED(vm->addr, memory_block_size_bytes()))
@@ -2496,10 +2465,6 @@ static int virtio_mem_init(struct virtio_mem *vm)
 					      vm->offline_threshold);
 	}
 
-	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
-	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
-	dev_info(&vm->vdev->dev, "device block size: 0x%llx",
-		 (unsigned long long)vm->device_block_size);
 	dev_info(&vm->vdev->dev, "memory block size: 0x%lx",
 		 memory_block_size_bytes());
 	if (vm->in_sbm)
@@ -2508,10 +2473,52 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	else
 		dev_info(&vm->vdev->dev, "big block size: 0x%llx",
 			 (unsigned long long)vm->bbm.bb_size);
+
+	return 0;
+}
+
+static int virtio_mem_init(struct virtio_mem *vm)
+{
+	uint16_t node_id;
+
+	if (!vm->vdev->config->get) {
+		dev_err(&vm->vdev->dev, "config access disabled\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * We don't want to (un)plug or reuse any memory when in kdump. The
+	 * memory is still accessible (but not mapped).
+	 */
+	if (is_kdump_kernel()) {
+		dev_warn(&vm->vdev->dev, "disabled in kdump kernel\n");
+		return -EBUSY;
+	}
+
+	/* Fetch all properties that can't change. */
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, plugged_size,
+			&vm->plugged_size);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, block_size,
+			&vm->device_block_size);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, node_id,
+			&node_id);
+	vm->nid = virtio_mem_translate_node_id(vm, node_id);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, addr, &vm->addr);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, region_size,
+			&vm->region_size);
+
+	/* Determine the nid for the device based on the lowest address. */
+	if (vm->nid == NUMA_NO_NODE)
+		vm->nid = memory_add_physaddr_to_nid(vm->addr);
+
+	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
+	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
+	dev_info(&vm->vdev->dev, "device block size: 0x%llx",
+		 (unsigned long long)vm->device_block_size);
 	if (vm->nid != NUMA_NO_NODE && IS_ENABLED(CONFIG_NUMA))
 		dev_info(&vm->vdev->dev, "nid: %d", vm->nid);
 
-	return 0;
+	return virtio_mem_init_hotplug(vm);
 }
 
 static int virtio_mem_create_resource(struct virtio_mem *vm)
-- 
2.31.1


