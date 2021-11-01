Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4444231F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219432.380291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUo-0001XO-HH; Mon, 01 Nov 2021 22:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219432.380291; Mon, 01 Nov 2021 22:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUo-0001Ss-9T; Mon, 01 Nov 2021 22:09:38 +0000
Received: by outflank-mailman (input) for mailman id 219432;
 Mon, 01 Nov 2021 22:09:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUn-0000By-2n
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:37 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b63a24c9-cad6-4c63-a6e5-34cebeecd0e3;
 Mon, 01 Nov 2021 22:09:35 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-uHm58rQjOLmW1Rgc9VYPKg-1; Mon, 01 Nov 2021 18:09:34 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso174898wms.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:34 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id m35sm1212614wms.2.2021.11.01.15.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:32 -0700 (PDT)
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
X-Inumbo-ID: b63a24c9-cad6-4c63-a6e5-34cebeecd0e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIlkv3kUVM5FLjDY6YlHGmvpDrEJaIZ60b+7KENr5m4=;
	b=AI7g+aK5oG1K9x5wMvy6YzafdFzn2EC+YuW65LKn4s1BAB/thT31Dy+x+7T5dstdCM+LO3
	0Bm+1STmd8ppX9q41iiXSZKEDUpNBBUvZGHyufKixIdlXt9klDW7srlOXLBs5edkFLAMTF
	0Yckj1i5tJtwDmR4HGDi941NsnZIUyM=
X-MC-Unique: uHm58rQjOLmW1Rgc9VYPKg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FIlkv3kUVM5FLjDY6YlHGmvpDrEJaIZ60b+7KENr5m4=;
        b=G/wmcO5YkS4UhvdiRSY9uBnU68dtvtaRGOqSWbovhxCaZ0zVr5zT2FT0iKpjvPhLNE
         TaMV2I+xRTv2rj2DOf7xokOUrCF1Ug0Cg85J8uE/nnkt+i4HXYtvF2+Sf1tGnNiIsw2p
         BOE5bEWN2ERK7WnCGB36lo1sqMMD/uIZDFxpw+NBaT2+OzYPtZPBTO4mgFWKf03nazYE
         /DM01G6U+OGnIDpQMiR9QhPiSGNdHdUgvYrh9QzHZwK8PszxWh5wvHLIHQjLR2qnOqmc
         AcL7fTZeX/7qvgr8K579rGaNVkSHsnmEMrmmCMIA1WQdKdoUEkGOME5tJXK1nClrwwjh
         tKyw==
X-Gm-Message-State: AOAM532A3kdVZ2w5s7POOZeVhrpuAEmd7/pCXq+2RgkCk1H22ZjTBU9c
	Xvmokrc8oiuypsVQBUtZcUXKq0bSkLLSff9m7qx+vBxsLHC5f4qEc6VXgHqB1u9h9D+YX3klu1r
	uUj+JIUjQj+3XHGSAv5R9XblzbJ8=
X-Received: by 2002:a5d:64af:: with SMTP id m15mr12543614wrp.267.1635804573221;
        Mon, 01 Nov 2021 15:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrZQZMxAe13255F4Umt/lsvtqR2XTX2d+P8MJlbDMrZGA3GCpF4nzZPJktxVFBm5Hby8r3Kg==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr12543584wrp.267.1635804573009;
        Mon, 01 Nov 2021 15:09:33 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PULL 14/20] virtio-mem: Drop precopy notifier
Date: Mon,  1 Nov 2021 23:09:06 +0100
Message-Id: <20211101220912.10039-15-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: David Hildenbrand <david@redhat.com>

Migration code now properly handles RAMBlocks which are indirectly managed
by a RamDiscardManager. No need for manual handling via the free page
optimization interface, let's get rid of it.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-mem.h |  3 ---
 hw/virtio/virtio-mem.c         | 34 ----------------------------------
 2 files changed, 37 deletions(-)

diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 9a6e348fa2..a5dd6a493b 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -65,9 +65,6 @@ struct VirtIOMEM {
     /* notifiers to notify when "size" changes */
     NotifierList size_change_notifiers;
 
-    /* don't migrate unplugged memory */
-    NotifierWithReturn precopy_notifier;
-
     /* listeners to notify on plug/unplug activity. */
     QLIST_HEAD(, RamDiscardListener) rdl_list;
 };
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 284096ec5f..d5a578142b 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -776,7 +776,6 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     host_memory_backend_set_mapped(vmem->memdev, true);
     vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
     qemu_register_reset(virtio_mem_system_reset, vmem);
-    precopy_add_notifier(&vmem->precopy_notifier);
 
     /*
      * Set ourselves as RamDiscardManager before the plug handler maps the
@@ -796,7 +795,6 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
      * found via an address space anymore. Unset ourselves.
      */
     memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
-    precopy_remove_notifier(&vmem->precopy_notifier);
     qemu_unregister_reset(virtio_mem_system_reset, vmem);
     vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
     host_memory_backend_set_mapped(vmem->memdev, false);
@@ -1089,43 +1087,11 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
     vmem->block_size = value;
 }
 
-static int virtio_mem_precopy_exclude_range_cb(const VirtIOMEM *vmem, void *arg,
-                                               uint64_t offset, uint64_t size)
-{
-    void * const host = qemu_ram_get_host_addr(vmem->memdev->mr.ram_block);
-
-    qemu_guest_free_page_hint(host + offset, size);
-    return 0;
-}
-
-static void virtio_mem_precopy_exclude_unplugged(VirtIOMEM *vmem)
-{
-    virtio_mem_for_each_unplugged_range(vmem, NULL,
-                                        virtio_mem_precopy_exclude_range_cb);
-}
-
-static int virtio_mem_precopy_notify(NotifierWithReturn *n, void *data)
-{
-    VirtIOMEM *vmem = container_of(n, VirtIOMEM, precopy_notifier);
-    PrecopyNotifyData *pnd = data;
-
-    switch (pnd->reason) {
-    case PRECOPY_NOTIFY_AFTER_BITMAP_SYNC:
-        virtio_mem_precopy_exclude_unplugged(vmem);
-        break;
-    default:
-        break;
-    }
-
-    return 0;
-}
-
 static void virtio_mem_instance_init(Object *obj)
 {
     VirtIOMEM *vmem = VIRTIO_MEM(obj);
 
     notifier_list_init(&vmem->size_change_notifiers);
-    vmem->precopy_notifier.notify = virtio_mem_precopy_notify;
     QLIST_INIT(&vmem->rdl_list);
 
     object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
-- 
2.33.1


