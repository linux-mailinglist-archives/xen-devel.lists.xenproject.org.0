Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699442263C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 14:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202221.356933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjP0-0001Ab-HC; Tue, 05 Oct 2021 12:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202221.356933; Tue, 05 Oct 2021 12:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjP0-00018a-DB; Tue, 05 Oct 2021 12:18:34 +0000
Received: by outflank-mailman (input) for mailman id 202221;
 Tue, 05 Oct 2021 12:18:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOXf=OZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mXjOz-00018C-93
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 12:18:33 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5ae55fa8-25d6-11ec-bedc-12813bfff9fa;
 Tue, 05 Oct 2021 12:18:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-YoFJbj0fMLyMSCfLYRqF7g-1; Tue, 05 Oct 2021 08:18:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FAC1362F8;
 Tue,  5 Oct 2021 12:18:28 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD2E1F442;
 Tue,  5 Oct 2021 12:18:00 +0000 (UTC)
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
X-Inumbo-ID: 5ae55fa8-25d6-11ec-bedc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633436311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJ4bVTfY2RBZ7dKHJReSBumHsyhYfakPMn9Oqd8JPC0=;
	b=W7gAEEUD7tIYemQcYLRpiZvqZgQUFu13haAISMlUafHkPYOfGi4HO7Cwaq2i1VhU6FIzBG
	mzoaeyqQUKjr1dBMAvMQVROFVfqX9/1MRyK6bl7nwNlGqE+m5bFs4EVXjuWh6odSkqKVKX
	7D0aRtMs2RZwDDEGYLdlJhNWLhE1N90=
X-MC-Unique: YoFJbj0fMLyMSCfLYRqF7g-1
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
Subject: [PATCH v2 7/9] virtio-mem: factor out hotplug specifics from virtio_mem_probe() into virtio_mem_init_hotplug()
Date: Tue,  5 Oct 2021 14:14:28 +0200
Message-Id: <20211005121430.30136-8-david@redhat.com>
In-Reply-To: <20211005121430.30136-1-david@redhat.com>
References: <20211005121430.30136-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

Let's prepare for a new virtio-mem kdump mode in which we don't actually
hot(un)plug any memory but only observe the state of device blocks.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 87 +++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 2ba7e8d6ba8d..1be3ee7f684d 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -260,6 +260,8 @@ static void virtio_mem_fake_offline_going_offline(unsigned long pfn,
 static void virtio_mem_fake_offline_cancel_offline(unsigned long pfn,
 						   unsigned long nr_pages);
 static void virtio_mem_retry(struct virtio_mem *vm);
+static int virtio_mem_create_resource(struct virtio_mem *vm);
+static void virtio_mem_delete_resource(struct virtio_mem *vm);
 
 /*
  * Register a virtio-mem device so it will be considered for the online_page
@@ -2395,7 +2397,8 @@ static int virtio_mem_init_vq(struct virtio_mem *vm)
 static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 {
 	const struct range pluggable_range = mhp_get_pluggable_range(true);
-	uint64_t sb_size, addr;
+	uint64_t unit_pages, sb_size, addr;
+	int rc;
 
 	/* bad device setup - warn only */
 	if (!IS_ALIGNED(vm->addr, memory_block_size_bytes()))
@@ -2474,7 +2477,48 @@ static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 		dev_info(&vm->vdev->dev, "big block size: 0x%llx",
 			 (unsigned long long)vm->bbm.bb_size);
 
+	/* create the parent resource for all memory */
+	rc = virtio_mem_create_resource(vm);
+	if (rc)
+		return rc;
+
+	/* use a single dynamic memory group to cover the whole memory device */
+	if (vm->in_sbm)
+		unit_pages = PHYS_PFN(memory_block_size_bytes());
+	else
+		unit_pages = PHYS_PFN(vm->bbm.bb_size);
+	rc = memory_group_register_dynamic(vm->nid, unit_pages);
+	if (rc < 0)
+		goto out_del_resource;
+	vm->mgid = rc;
+
+	/*
+	 * If we still have memory plugged, we have to unplug all memory first.
+	 * Registering our parent resource makes sure that this memory isn't
+	 * actually in use (e.g., trying to reload the driver).
+	 */
+	if (vm->plugged_size) {
+		vm->unplug_all_required = true;
+		dev_info(&vm->vdev->dev, "unplugging all memory is required\n");
+	}
+
+	/* register callbacks */
+	vm->memory_notifier.notifier_call = virtio_mem_memory_notifier_cb;
+	rc = register_memory_notifier(&vm->memory_notifier);
+	if (rc)
+		goto out_unreg_group;
+	rc = register_virtio_mem_device(vm);
+	if (rc)
+		goto out_unreg_mem;
+
 	return 0;
+out_unreg_mem:
+	unregister_memory_notifier(&vm->memory_notifier);
+out_unreg_group:
+	memory_group_unregister(vm->mgid);
+out_del_resource:
+	virtio_mem_delete_resource(vm);
+	return rc;
 }
 
 static int virtio_mem_init(struct virtio_mem *vm)
@@ -2578,7 +2622,6 @@ static bool virtio_mem_has_memory_added(struct virtio_mem *vm)
 static int virtio_mem_probe(struct virtio_device *vdev)
 {
 	struct virtio_mem *vm;
-	uint64_t unit_pages;
 	int rc;
 
 	BUILD_BUG_ON(sizeof(struct virtio_mem_req) != 24);
@@ -2608,40 +2651,6 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	if (rc)
 		goto out_del_vq;
 
-	/* create the parent resource for all memory */
-	rc = virtio_mem_create_resource(vm);
-	if (rc)
-		goto out_del_vq;
-
-	/* use a single dynamic memory group to cover the whole memory device */
-	if (vm->in_sbm)
-		unit_pages = PHYS_PFN(memory_block_size_bytes());
-	else
-		unit_pages = PHYS_PFN(vm->bbm.bb_size);
-	rc = memory_group_register_dynamic(vm->nid, unit_pages);
-	if (rc < 0)
-		goto out_del_resource;
-	vm->mgid = rc;
-
-	/*
-	 * If we still have memory plugged, we have to unplug all memory first.
-	 * Registering our parent resource makes sure that this memory isn't
-	 * actually in use (e.g., trying to reload the driver).
-	 */
-	if (vm->plugged_size) {
-		vm->unplug_all_required = true;
-		dev_info(&vm->vdev->dev, "unplugging all memory is required\n");
-	}
-
-	/* register callbacks */
-	vm->memory_notifier.notifier_call = virtio_mem_memory_notifier_cb;
-	rc = register_memory_notifier(&vm->memory_notifier);
-	if (rc)
-		goto out_unreg_group;
-	rc = register_virtio_mem_device(vm);
-	if (rc)
-		goto out_unreg_mem;
-
 	virtio_device_ready(vdev);
 
 	/* trigger a config update to start processing the requested_size */
@@ -2649,12 +2658,6 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	queue_work(system_freezable_wq, &vm->wq);
 
 	return 0;
-out_unreg_mem:
-	unregister_memory_notifier(&vm->memory_notifier);
-out_unreg_group:
-	memory_group_unregister(vm->mgid);
-out_del_resource:
-	virtio_mem_delete_resource(vm);
 out_del_vq:
 	vdev->config->del_vqs(vdev);
 out_free_vm:
-- 
2.31.1


