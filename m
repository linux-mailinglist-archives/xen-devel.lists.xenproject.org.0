Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635748C941
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 18:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256798.440880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hJh-0000JZ-4c; Wed, 12 Jan 2022 17:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256798.440880; Wed, 12 Jan 2022 17:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hJh-0000GZ-1N; Wed, 12 Jan 2022 17:21:45 +0000
Received: by outflank-mailman (input) for mailman id 256798;
 Wed, 12 Jan 2022 17:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmOE=R4=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1n7hJf-0000GR-8T
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 17:21:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18ae4c1d-73cc-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 18:21:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-VJYu9YkOM2CA6tra9T3WQg-1; Wed, 12 Jan 2022 12:17:35 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3651883DD2D;
 Wed, 12 Jan 2022 17:16:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2181105C89A;
 Wed, 12 Jan 2022 17:16:20 +0000 (UTC)
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
X-Inumbo-ID: 18ae4c1d-73cc-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642008096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjHInqzmPrCv4N46YVTfuK0G8vvJKHp5wvZGRJen2mw=;
	b=doRjbsuEp2jJqjz9AkB3zOmFo84ureQih+mfg84hHDbvtXoxb0wvQhiH0naCoM3Uy2rtPI
	djIAasvMXGX1LPVG6hrGh4Ohu0979RgWCLCfryF+ZymohAutqn8QK7EPeoJII/D/SK6kn/
	ce9NXcG2O3zLBVmEaHsvgGiqR+uP+kk=
X-MC-Unique: VJYu9YkOM2CA6tra9T3WQg-1
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
Subject: [PULL 2/6] virtio: get rid of VirtIOHandleAIOOutput
Date: Wed, 12 Jan 2022 17:13:58 +0000
Message-Id: <20220112171402.112183-3-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
References: <20220112171402.112183-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The virtqueue host notifier API
virtio_queue_aio_set_host_notifier_handler() polls the virtqueue for new
buffers. AioContext previously required a bool progress return value
indicating whether an event was handled or not. This is no longer
necessary because the AioContext polling API has been split into a poll
check function and an event handler function. The event handler is only
run when we know there is work to do, so it doesn't return bool.

The VirtIOHandleAIOOutput function signature is now the same as
VirtIOHandleOutput. Get rid of the bool return value.

Further simplifications will be made for virtio-blk and virtio-scsi in
the next patch.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20211207132336.36627-3-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio.h      |  3 +--
 hw/block/dataplane/virtio-blk.c |  4 ++--
 hw/scsi/virtio-scsi-dataplane.c | 18 ++++++------------
 hw/virtio/virtio.c              | 12 ++++--------
 4 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..b90095628f 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -175,7 +175,6 @@ void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
 void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
 
 typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
-typedef bool (*VirtIOHandleAIOOutput)(VirtIODevice *, VirtQueue *);
 
 VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
                             VirtIOHandleOutput handle_output);
@@ -318,7 +317,7 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-                                                VirtIOHandleAIOOutput handle_output);
+        VirtIOHandleOutput handle_output);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
 
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index ee5a5352dc..a2fa407b98 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -154,7 +154,7 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
     g_free(s);
 }
 
-static bool virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
+static void virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
                                                 VirtQueue *vq)
 {
     VirtIOBlock *s = (VirtIOBlock *)vdev;
@@ -162,7 +162,7 @@ static bool virtio_blk_data_plane_handle_output(VirtIODevice *vdev,
     assert(s->dataplane);
     assert(s->dataplane_started);
 
-    return virtio_blk_handle_vq(s, vq);
+    virtio_blk_handle_vq(s, vq);
 }
 
 /* Context: QEMU global mutex held */
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 18eb824c97..76137de67f 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -49,49 +49,43 @@ void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp)
     }
 }
 
-static bool virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
+static void virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
                                               VirtQueue *vq)
 {
-    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
     if (!s->dataplane_fenced) {
         assert(s->ctx && s->dataplane_started);
-        progress = virtio_scsi_handle_cmd_vq(s, vq);
+        virtio_scsi_handle_cmd_vq(s, vq);
     }
     virtio_scsi_release(s);
-    return progress;
 }
 
-static bool virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
+static void virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
                                                VirtQueue *vq)
 {
-    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
     if (!s->dataplane_fenced) {
         assert(s->ctx && s->dataplane_started);
-        progress = virtio_scsi_handle_ctrl_vq(s, vq);
+        virtio_scsi_handle_ctrl_vq(s, vq);
     }
     virtio_scsi_release(s);
-    return progress;
 }
 
-static bool virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
+static void virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
                                                 VirtQueue *vq)
 {
-    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
     if (!s->dataplane_fenced) {
         assert(s->ctx && s->dataplane_started);
-        progress = virtio_scsi_handle_event_vq(s, vq);
+        virtio_scsi_handle_event_vq(s, vq);
     }
     virtio_scsi_release(s);
-    return progress;
 }
 
 static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int n)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5db7f69237..323f549aad 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -125,7 +125,7 @@ struct VirtQueue
 
     uint16_t vector;
     VirtIOHandleOutput handle_output;
-    VirtIOHandleAIOOutput handle_aio_output;
+    VirtIOHandleOutput handle_aio_output;
     VirtIODevice *vdev;
     EventNotifier guest_notifier;
     EventNotifier host_notifier;
@@ -2303,22 +2303,18 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
     }
 }
 
-static bool virtio_queue_notify_aio_vq(VirtQueue *vq)
+static void virtio_queue_notify_aio_vq(VirtQueue *vq)
 {
-    bool ret = false;
-
     if (vq->vring.desc && vq->handle_aio_output) {
         VirtIODevice *vdev = vq->vdev;
 
         trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
-        ret = vq->handle_aio_output(vdev, vq);
+        vq->handle_aio_output(vdev, vq);
 
         if (unlikely(vdev->start_on_kick)) {
             virtio_set_started(vdev, true);
         }
     }
-
-    return ret;
 }
 
 static void virtio_queue_notify_vq(VirtQueue *vq)
@@ -3555,7 +3551,7 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
 }
 
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-                                                VirtIOHandleAIOOutput handle_output)
+        VirtIOHandleOutput handle_output)
 {
     if (handle_output) {
         vq->handle_aio_output = handle_output;
-- 
2.34.1


