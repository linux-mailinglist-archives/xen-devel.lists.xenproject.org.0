Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0914666C7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236796.410684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mso8J-0005UK-Fe; Thu, 02 Dec 2021 15:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236796.410684; Thu, 02 Dec 2021 15:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mso8J-0005Ri-C3; Thu, 02 Dec 2021 15:36:27 +0000
Received: by outflank-mailman (input) for mailman id 236796;
 Thu, 02 Dec 2021 15:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4zFf=QT=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1mso8H-0004Ge-WD
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:36:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b466184-5385-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 16:36:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-jeYLELmgM4mFvkTo_4946Q-1; Thu, 02 Dec 2021 10:36:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F68A1023F51;
 Thu,  2 Dec 2021 15:36:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76D1A4ABA2;
 Thu,  2 Dec 2021 15:35:39 +0000 (UTC)
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
X-Inumbo-ID: 9b466184-5385-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638459384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlTOxFvQ0Tou/htw9qCIl6rN+d5BTtmQf2AISykV2Lk=;
	b=VBdwfJ0soFcMFyk9XhwadMKmo5PGNYPMxl2B9SLtXXLU9zH3g80vgunv4lHNZdcGttDfay
	4x3/xJpkq66YRrBU9njG+TvLBgTKVT+Wfm1xFNlIDfkXRsR2XgCzBk4YGFkfsQM47dPBi2
	JHSNpV1x+XVZ1ITLh9V3ctcX2QZqAf8=
X-MC-Unique: jeYLELmgM4mFvkTo_4946Q-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Lieven <pl@kamp.de>
Subject: [PATCH v2 2/6] virtio: get rid of VirtIOHandleAIOOutput
Date: Thu,  2 Dec 2021 15:33:58 +0000
Message-Id: <20211202153402.604951-3-stefanha@redhat.com>
In-Reply-To: <20211202153402.604951-1-stefanha@redhat.com>
References: <20211202153402.604951-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
index 252c3a7a23..1b50ccd38b 100644
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
index 0039e1c74c..c042be3935 100644
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
@@ -2300,22 +2300,18 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
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
@@ -3552,7 +3548,7 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
 }
 
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
-                                                VirtIOHandleAIOOutput handle_output)
+        VirtIOHandleOutput handle_output)
 {
     if (handle_output) {
         vq->handle_aio_output = handle_output;
-- 
2.33.1


