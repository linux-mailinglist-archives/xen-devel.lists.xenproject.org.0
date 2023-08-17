Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072277FB5E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 17:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585499.916688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfP0-0006nN-61; Thu, 17 Aug 2023 15:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585499.916688; Thu, 17 Aug 2023 15:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfP0-0006ko-1R; Thu, 17 Aug 2023 15:59:14 +0000
Received: by outflank-mailman (input) for mailman id 585499;
 Thu, 17 Aug 2023 15:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmM2=EC=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qWfOy-0005Z2-9y
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 15:59:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01198b4a-3d17-11ee-877c-cb3800f73035;
 Thu, 17 Aug 2023 17:59:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-7yVOyLmUM2WaLSvJTzRE3g-1; Thu, 17 Aug 2023 11:59:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B3BF80557B;
 Thu, 17 Aug 2023 15:59:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4E302166B2D;
 Thu, 17 Aug 2023 15:59:05 +0000 (UTC)
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
X-Inumbo-ID: 01198b4a-3d17-11ee-877c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692287950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obCBV9iwAB64Adum28VKvyDjQMxBK5nxC3zXPfKINJY=;
	b=hVe6iKvDHBsNkykgs8kfj4bip3Aco/38rrHN/O/kKUMoLpfiYQzWd4JMfDVmnnb8PtqXaD
	+R4gmKweG0WW5sRLF68NODqymwJBFL7tCDB9XH+1D4StbylmezVOasBjyVCnmIA4eaO6Td
	4qc5YM1EN+qS+GTFh+ir1l0lZt0Dh9E=
X-MC-Unique: 7yVOyLmUM2WaLSvJTzRE3g-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH v2 4/4] virtio-blk: remove batch notification BH
Date: Thu, 17 Aug 2023 11:58:47 -0400
Message-ID: <20230817155847.3605115-5-stefanha@redhat.com>
In-Reply-To: <20230817155847.3605115-1-stefanha@redhat.com>
References: <20230817155847.3605115-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

There is a batching mechanism for virtio-blk Used Buffer Notifications
that is no longer needed because the previous commit added batching to
virtio_notify_irqfd().

Note that this mechanism was rarely used in practice because it is only
enabled when EVENT_IDX is not negotiated by the driver. Modern drivers
enable EVENT_IDX.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 48 +--------------------------------
 1 file changed, 1 insertion(+), 47 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index da36fcfd0b..f83bb0f116 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -31,9 +31,6 @@ struct VirtIOBlockDataPlane {
 
     VirtIOBlkConf *conf;
     VirtIODevice *vdev;
-    QEMUBH *bh;                     /* bh for guest notification */
-    unsigned long *batch_notify_vqs;
-    bool batch_notifications;
 
     /* Note that these EventNotifiers are assigned by value.  This is
      * fine as long as you do not call event_notifier_cleanup on them
@@ -47,36 +44,7 @@ struct VirtIOBlockDataPlane {
 /* Raise an interrupt to signal guest, if necessary */
 void virtio_blk_data_plane_notify(VirtIOBlockDataPlane *s, VirtQueue *vq)
 {
-    if (s->batch_notifications) {
-        set_bit(virtio_get_queue_index(vq), s->batch_notify_vqs);
-        qemu_bh_schedule(s->bh);
-    } else {
-        virtio_notify_irqfd(s->vdev, vq);
-    }
-}
-
-static void notify_guest_bh(void *opaque)
-{
-    VirtIOBlockDataPlane *s = opaque;
-    unsigned nvqs = s->conf->num_queues;
-    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
-    unsigned j;
-
-    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
-    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
-
-    for (j = 0; j < nvqs; j += BITS_PER_LONG) {
-        unsigned long bits = bitmap[j / BITS_PER_LONG];
-
-        while (bits != 0) {
-            unsigned i = j + ctzl(bits);
-            VirtQueue *vq = virtio_get_queue(s->vdev, i);
-
-            virtio_notify_irqfd(s->vdev, vq);
-
-            bits &= bits - 1; /* clear right-most bit */
-        }
-    }
+    virtio_notify_irqfd(s->vdev, vq);
 }
 
 /* Context: QEMU global mutex held */
@@ -126,9 +94,6 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
     } else {
         s->ctx = qemu_get_aio_context();
     }
-    s->bh = aio_bh_new_guarded(s->ctx, notify_guest_bh, s,
-                               &DEVICE(vdev)->mem_reentrancy_guard);
-    s->batch_notify_vqs = bitmap_new(conf->num_queues);
 
     *dataplane = s;
 
@@ -146,8 +111,6 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
 
     vblk = VIRTIO_BLK(s->vdev);
     assert(!vblk->dataplane_started);
-    g_free(s->batch_notify_vqs);
-    qemu_bh_delete(s->bh);
     if (s->iothread) {
         object_unref(OBJECT(s->iothread));
     }
@@ -173,12 +136,6 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
 
     s->starting = true;
 
-    if (!virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
-        s->batch_notifications = true;
-    } else {
-        s->batch_notifications = false;
-    }
-
     /* Set up guest notifier (irq) */
     r = k->set_guest_notifiers(qbus->parent, nvqs, true);
     if (r != 0) {
@@ -370,9 +327,6 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
 
     aio_context_release(s->ctx);
 
-    qemu_bh_cancel(s->bh);
-    notify_guest_bh(s); /* final chance to notify guest */
-
     /* Clean up guest notifier (irq) */
     k->set_guest_notifiers(qbus->parent, nvqs, false);
 
-- 
2.41.0


