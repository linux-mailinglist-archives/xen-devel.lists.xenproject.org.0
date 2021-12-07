Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E6A46BC71
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 14:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241098.417945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaTC-0005Tn-0E; Tue, 07 Dec 2021 13:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241098.417945; Tue, 07 Dec 2021 13:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaTB-0005QG-SU; Tue, 07 Dec 2021 13:25:21 +0000
Received: by outflank-mailman (input) for mailman id 241098;
 Tue, 07 Dec 2021 13:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kpq=QY=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1muaT9-0005E4-Rm
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 13:25:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e9b77e2-5761-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 14:25:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-TqfKqrq2Mdm55v-G4XcJTg-1; Tue, 07 Dec 2021 08:25:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50E98015B7;
 Tue,  7 Dec 2021 13:25:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E73F5D9C0;
 Tue,  7 Dec 2021 13:25:14 +0000 (UTC)
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
X-Inumbo-ID: 1e9b77e2-5761-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638883517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDOfWfFuM0VbgnCaywJ0wNStjfoINmgW0Wpk8oJ29+M=;
	b=GbEue0UNDjFmNzYoSiHlZK33k5EDD+AZA0NqBIgtIIkgEENWR+s971dBuXyE35pKy7kBH5
	KAMsGGnvshwpoCl79ol6Ny+o2lXWAtvFnfDUKa+f6WGoE3HUtVyCdm1/eXadDg6U3cTnXH
	damqnhL1XveHPTwErtAOglfYfvQt4MM=
X-MC-Unique: TqfKqrq2Mdm55v-G4XcJTg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Peter Lieven <pl@kamp.de>
Subject: [PATCH v3 2/6] virtio: get rid of VirtIOHandleAIOOutput
Date: Tue,  7 Dec 2021 13:23:32 +0000
Message-Id: <20211207132336.36627-3-stefanha@redhat.com>
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
References: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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


