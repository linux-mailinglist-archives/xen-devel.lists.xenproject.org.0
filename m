Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D67D6F75A4
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530096.825479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf6u-00031G-0O; Thu, 04 May 2023 19:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530096.825479; Thu, 04 May 2023 19:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf6t-0002xx-Ru; Thu, 04 May 2023 19:59:27 +0000
Received: by outflank-mailman (input) for mailman id 530096;
 Thu, 04 May 2023 19:59:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1y-0003iB-Ae
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75f0b3fa-eab5-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:54:21 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-JLyMG8AyOQ6Ztjf5K0NY6Q-1; Thu, 04 May 2023 15:54:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24421101A531;
 Thu,  4 May 2023 19:54:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E4CA1121331;
 Thu,  4 May 2023 19:54:15 +0000 (UTC)
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
X-Inumbo-ID: 75f0b3fa-eab5-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruJgs45mwGYUnVoP6uIPKYhuhXIe1j+KFcN94nSbefs=;
	b=aMVbuSe9iyN4M9RlotmvoTWgdJEdpEiOCXkrmbFb+DGJW6eM/bzDVG909kUXfuQaUTQ6WC
	03xS/T+8udfRyeJIZw0FoxBY75ORE0KmB4lH0wD7c3puVR7tnUovNmAuoQzhecjPa2wAsk
	McLai88FozIa1WR7r3xXEvFojNk/bck=
X-MC-Unique: JLyMG8AyOQ6Ztjf5K0NY6Q-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 18/21] virtio-blk: implement BlockDevOps->drained_begin()
Date: Thu,  4 May 2023 15:53:24 -0400
Message-Id: <20230504195327.695107-19-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Detach ioeventfds during drained sections to stop I/O submission from
the guest. virtio-blk is no longer reliant on aio_disable_external()
after this patch. This will allow us to remove the
aio_disable_external() API once all other code that relies on it is
converted.

Take extra care to avoid attaching/detaching ioeventfds if the data
plane is started/stopped during a drained section. This should be rare,
but maybe the mirror block job can trigger it.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 17 +++++++++------
 hw/block/virtio-blk.c           | 38 ++++++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 27eafa6c92..c0d2663abc 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -246,13 +246,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     }
 
     /* Get this show started by hooking up our callbacks */
-    aio_context_acquire(s->ctx);
-    for (i = 0; i < nvqs; i++) {
-        VirtQueue *vq = virtio_get_queue(s->vdev, i);
+    if (!blk_in_drain(s->conf->conf.blk)) {
+        aio_context_acquire(s->ctx);
+        for (i = 0; i < nvqs; i++) {
+            VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
-        virtio_queue_aio_attach_host_notifier(vq, s->ctx);
+            virtio_queue_aio_attach_host_notifier(vq, s->ctx);
+        }
+        aio_context_release(s->ctx);
     }
-    aio_context_release(s->ctx);
     return 0;
 
   fail_aio_context:
@@ -318,7 +320,10 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     trace_virtio_blk_data_plane_stop(s);
 
     aio_context_acquire(s->ctx);
-    aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
+
+    if (!blk_in_drain(s->conf->conf.blk)) {
+        aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
+    }
 
     /* Wait for virtio_blk_dma_restart_bh() and in flight I/O to complete */
     blk_drain(s->conf->conf.blk);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index cefca93b31..d8dedc575c 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1109,8 +1109,44 @@ static void virtio_blk_resize(void *opaque)
     aio_bh_schedule_oneshot(qemu_get_aio_context(), virtio_resize_cb, vdev);
 }
 
+/* Suspend virtqueue ioeventfd processing during drain */
+static void virtio_blk_drained_begin(void *opaque)
+{
+    VirtIOBlock *s = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(opaque);
+    AioContext *ctx = blk_get_aio_context(s->conf.conf.blk);
+
+    if (!s->dataplane || !s->dataplane_started) {
+        return;
+    }
+
+    for (uint16_t i = 0; i < s->conf.num_queues; i++) {
+        VirtQueue *vq = virtio_get_queue(vdev, i);
+        virtio_queue_aio_detach_host_notifier(vq, ctx);
+    }
+}
+
+/* Resume virtqueue ioeventfd processing after drain */
+static void virtio_blk_drained_end(void *opaque)
+{
+    VirtIOBlock *s = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(opaque);
+    AioContext *ctx = blk_get_aio_context(s->conf.conf.blk);
+
+    if (!s->dataplane || !s->dataplane_started) {
+        return;
+    }
+
+    for (uint16_t i = 0; i < s->conf.num_queues; i++) {
+        VirtQueue *vq = virtio_get_queue(vdev, i);
+        virtio_queue_aio_attach_host_notifier(vq, ctx);
+    }
+}
+
 static const BlockDevOps virtio_block_ops = {
-    .resize_cb = virtio_blk_resize,
+    .resize_cb     = virtio_blk_resize,
+    .drained_begin = virtio_blk_drained_begin,
+    .drained_end   = virtio_blk_drained_end,
 };
 
 static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
-- 
2.40.1


