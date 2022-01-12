Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055248C92C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 18:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256788.440869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hFl-0006y1-Hl; Wed, 12 Jan 2022 17:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256788.440869; Wed, 12 Jan 2022 17:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hFl-0006uP-CS; Wed, 12 Jan 2022 17:17:41 +0000
Received: by outflank-mailman (input) for mailman id 256788;
 Wed, 12 Jan 2022 17:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmOE=R4=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1n7hFj-0005v6-9w
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 17:17:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a0f3fa5-73cb-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 18:17:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-_kXwFZIdOviwuCE4l7lEkA-1; Wed, 12 Jan 2022 12:17:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1406F101F001;
 Wed, 12 Jan 2022 17:17:32 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CF0A7F81A;
 Wed, 12 Jan 2022 17:17:31 +0000 (UTC)
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
X-Inumbo-ID: 8a0f3fa5-73cb-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642007857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=js5bkbA3MR3Yyy5XstjOhtqjgRh3bMz19gvkW1lmJoU=;
	b=FdspTRLkLeQSY1ZWy7OQkmmw72pMkR/Z4FGH+39JCvJXMpDJPrUZCU+B9rPAn5W8ZBISx4
	nO8jjZoXp0hHAzrNOQX1dQqyZ9dxBmFbtrdvzErigwiXR28pjNXhGTB4J+BH5f/RoV8k07
	tcjui87s/0I++/s8R5DRpMNSn+Ca/a0=
X-MC-Unique: _kXwFZIdOviwuCE4l7lEkA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Coiby Xu <Coiby.Xu@gmail.com>,
	Fam Zheng <fam@euphon.net>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	qemu-block@nongnu.org,
	Julia Suvorova <jusual@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 6/6] virtio: unify dataplane and non-dataplane ->handle_output()
Date: Wed, 12 Jan 2022 17:14:02 +0000
Message-Id: <20220112171402.112183-7-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
References: <20220112171402.112183-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Now that virtio-blk and virtio-scsi are ready, get rid of
the handle_aio_output() callback. It's no longer needed.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20211207132336.36627-7-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio.h      |  4 +--
 hw/block/dataplane/virtio-blk.c | 16 ++--------
 hw/scsi/virtio-scsi-dataplane.c | 54 ++++-----------------------------
 hw/virtio/virtio.c              | 32 +++++++++----------
 4 files changed, 26 insertions(+), 80 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b90095628f..f095637058 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -316,8 +316,8 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
-void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-        VirtIOHandleOutput handle_output);
+void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx);
+void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
 
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index a2fa407b98..49276e46f2 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -154,17 +154,6 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
     g_free(s);
 }
 
-static void virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
-                                                VirtQueue *vq)
-{
-    VirtIOBlock *s = (VirtIOBlock *)vdev;
-
-    assert(s->dataplane);
-    assert(s->dataplane_started);
-
-    virtio_blk_handle_vq(s, vq);
-}
-
 /* Context: QEMU global mutex held */
 int virtio_blk_data_plane_start(VirtIODevice *vdev)
 {
@@ -258,8 +247,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     for (i = 0; i < nvqs; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
-        virtio_queue_aio_set_host_notifier_handler(vq, s->ctx,
-                virtio_blk_data_plane_handle_output);
+        virtio_queue_aio_attach_host_notifier(vq, s->ctx);
     }
     aio_context_release(s->ctx);
     return 0;
@@ -302,7 +290,7 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
     for (i = 0; i < s->conf->num_queues; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
-        virtio_queue_aio_set_host_notifier_handler(vq, s->ctx, NULL);
+        virtio_queue_aio_detach_host_notifier(vq, s->ctx);
     }
 }
 
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 76137de67f..29575cbaf6 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -49,45 +49,6 @@ void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp)
     }
 }
 
-static void virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
-                                              VirtQueue *vq)
-{
-    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
-
-    virtio_scsi_acquire(s);
-    if (!s->dataplane_fenced) {
-        assert(s->ctx && s->dataplane_started);
-        virtio_scsi_handle_cmd_vq(s, vq);
-    }
-    virtio_scsi_release(s);
-}
-
-static void virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
-                                               VirtQueue *vq)
-{
-    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
-
-    virtio_scsi_acquire(s);
-    if (!s->dataplane_fenced) {
-        assert(s->ctx && s->dataplane_started);
-        virtio_scsi_handle_ctrl_vq(s, vq);
-    }
-    virtio_scsi_release(s);
-}
-
-static void virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
-                                                VirtQueue *vq)
-{
-    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
-
-    virtio_scsi_acquire(s);
-    if (!s->dataplane_fenced) {
-        assert(s->ctx && s->dataplane_started);
-        virtio_scsi_handle_event_vq(s, vq);
-    }
-    virtio_scsi_release(s);
-}
-
 static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int n)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(s)));
@@ -112,10 +73,10 @@ static void virtio_scsi_dataplane_stop_bh(void *opaque)
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
     int i;
 
-    virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx, NULL);
-    virtio_queue_aio_set_host_notifier_handler(vs->event_vq, s->ctx, NULL);
+    virtio_queue_aio_detach_host_notifier(vs->ctrl_vq, s->ctx);
+    virtio_queue_aio_detach_host_notifier(vs->event_vq, s->ctx);
     for (i = 0; i < vs->conf.num_queues; i++) {
-        virtio_queue_aio_set_host_notifier_handler(vs->cmd_vqs[i], s->ctx, NULL);
+        virtio_queue_aio_detach_host_notifier(vs->cmd_vqs[i], s->ctx);
     }
 }
 
@@ -176,14 +137,11 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     memory_region_transaction_commit();
 
     aio_context_acquire(s->ctx);
-    virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx,
-                                            virtio_scsi_data_plane_handle_ctrl);
-    virtio_queue_aio_set_host_notifier_handler(vs->event_vq, s->ctx,
-                                           virtio_scsi_data_plane_handle_event);
+    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
+    virtio_queue_aio_attach_host_notifier(vs->event_vq, s->ctx);
 
     for (i = 0; i < vs->conf.num_queues; i++) {
-        virtio_queue_aio_set_host_notifier_handler(vs->cmd_vqs[i], s->ctx,
-                                             virtio_scsi_data_plane_handle_cmd);
+        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
     }
 
     s->dataplane_starting = false;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e938e6513b..aae72fb8b7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3525,23 +3525,23 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
     virtio_queue_set_notification(vq, 1);
 }
 
-void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-        VirtIOHandleOutput handle_output)
+void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    if (handle_output) {
-        aio_set_event_notifier(ctx, &vq->host_notifier, true,
-                               virtio_queue_host_notifier_read,
-                               virtio_queue_host_notifier_aio_poll,
-                               virtio_queue_host_notifier_aio_poll_ready);
-        aio_set_event_notifier_poll(ctx, &vq->host_notifier,
-                                    virtio_queue_host_notifier_aio_poll_begin,
-                                    virtio_queue_host_notifier_aio_poll_end);
-    } else {
-        aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
-        /* Test and clear notifier before after disabling event,
-         * in case poll callback didn't have time to run. */
-        virtio_queue_host_notifier_read(&vq->host_notifier);
-    }
+    aio_set_event_notifier(ctx, &vq->host_notifier, true,
+                           virtio_queue_host_notifier_read,
+                           virtio_queue_host_notifier_aio_poll,
+                           virtio_queue_host_notifier_aio_poll_ready);
+    aio_set_event_notifier_poll(ctx, &vq->host_notifier,
+                                virtio_queue_host_notifier_aio_poll_begin,
+                                virtio_queue_host_notifier_aio_poll_end);
+}
+
+void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx)
+{
+    aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
+    /* Test and clear notifier before after disabling event,
+     * in case poll callback didn't have time to run. */
+    virtio_queue_host_notifier_read(&vq->host_notifier);
 }
 
 void virtio_queue_host_notifier_read(EventNotifier *n)
-- 
2.34.1


