Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF66F75B1
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 22:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530115.825508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7d-0005t0-11; Thu, 04 May 2023 20:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530115.825508; Thu, 04 May 2023 20:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7c-0005pv-TV; Thu, 04 May 2023 20:00:12 +0000
Received: by outflank-mailman (input) for mailman id 530115;
 Thu, 04 May 2023 20:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf21-0003xx-RY
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77395080-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:54:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-xBjZ8_DjNQ-jsqK3HPfxEg-1; Thu, 04 May 2023 15:54:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1B9C886063;
 Thu,  4 May 2023 19:54:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 297BC4020960;
 Thu,  4 May 2023 19:54:17 +0000 (UTC)
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
X-Inumbo-ID: 77395080-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckhE010jxhkqU+qGTRwp1CzCNoAx+VwzdwbJyrduiJo=;
	b=Rb7XL2IIisdNrWUxDLBtrFscNuTsQ6sFpEbq52XDXOMQMPFyEC1acEeFZT27SJrqtnY2G7
	iiBND0pYGclRy4EwyoQaKk16KGQKhG+pVveJJVFjkZmo/9hZD+JqClrrjgc7X5nluvEHL7
	ZYTlIsK7dgI5cZvZNnP9xXW9pBTNLKY=
X-MC-Unique: xBjZ8_DjNQ-jsqK3HPfxEg-1
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
Subject: [PATCH v5 19/21] virtio-scsi: implement BlockDevOps->drained_begin()
Date: Thu,  4 May 2023 15:53:25 -0400
Message-Id: <20230504195327.695107-20-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

The virtio-scsi Host Bus Adapter provides access to devices on a SCSI
bus. Those SCSI devices typically have a BlockBackend. When the
BlockBackend enters a drained section, the SCSI device must temporarily
stop submitting new I/O requests.

Implement this behavior by temporarily stopping virtio-scsi virtqueue
processing when one of the SCSI devices enters a drained section. The
new scsi_device_drained_begin() API allows scsi-disk to message the
virtio-scsi HBA.

scsi_device_drained_begin() uses a drain counter so that multiple SCSI
devices can have overlapping drained sections. The HBA only sees one
pair of .drained_begin/end() calls.

After this commit, virtio-scsi no longer depends on hw/virtio's
ioeventfd aio_set_event_notifier(is_external=true). This commit is a
step towards removing the aio_disable_external() API.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/scsi/scsi.h          | 14 ++++++++++++
 hw/scsi/scsi-bus.c              | 40 +++++++++++++++++++++++++++++++++
 hw/scsi/scsi-disk.c             | 27 +++++++++++++++++-----
 hw/scsi/virtio-scsi-dataplane.c | 22 ++++++++++--------
 hw/scsi/virtio-scsi.c           | 38 +++++++++++++++++++++++++++++++
 hw/scsi/trace-events            |  2 ++
 6 files changed, 129 insertions(+), 14 deletions(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 6f23a7a73e..e2bb1a2fbf 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -133,6 +133,16 @@ struct SCSIBusInfo {
     void (*save_request)(QEMUFile *f, SCSIRequest *req);
     void *(*load_request)(QEMUFile *f, SCSIRequest *req);
     void (*free_request)(SCSIBus *bus, void *priv);
+
+    /*
+     * Temporarily stop submitting new requests between drained_begin() and
+     * drained_end(). Called from the main loop thread with the BQL held.
+     *
+     * Implement these callbacks if request processing is triggered by a file
+     * descriptor like an EventNotifier. Otherwise set them to NULL.
+     */
+    void (*drained_begin)(SCSIBus *bus);
+    void (*drained_end)(SCSIBus *bus);
 };
 
 #define TYPE_SCSI_BUS "SCSI"
@@ -144,6 +154,8 @@ struct SCSIBus {
 
     SCSISense unit_attention;
     const SCSIBusInfo *info;
+
+    int drain_count; /* protected by BQL */
 };
 
 /**
@@ -213,6 +225,8 @@ void scsi_req_cancel_complete(SCSIRequest *req);
 void scsi_req_cancel(SCSIRequest *req);
 void scsi_req_cancel_async(SCSIRequest *req, Notifier *notifier);
 void scsi_req_retry(SCSIRequest *req);
+void scsi_device_drained_begin(SCSIDevice *sdev);
+void scsi_device_drained_end(SCSIDevice *sdev);
 void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense);
 void scsi_device_set_ua(SCSIDevice *sdev, SCSISense sense);
 void scsi_device_report_change(SCSIDevice *dev, SCSISense sense);
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 64013c8a24..f80f4cb4fc 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1669,6 +1669,46 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
     scsi_device_set_ua(sdev, sense);
 }
 
+void scsi_device_drained_begin(SCSIDevice *sdev)
+{
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, sdev->qdev.parent_bus);
+    if (!bus) {
+        return;
+    }
+
+    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+    assert(bus->drain_count < INT_MAX);
+
+    /*
+     * Multiple BlockBackends can be on a SCSIBus and each may begin/end
+     * draining at any time. Keep a counter so HBAs only see begin/end once.
+     */
+    if (bus->drain_count++ == 0) {
+        trace_scsi_bus_drained_begin(bus, sdev);
+        if (bus->info->drained_begin) {
+            bus->info->drained_begin(bus);
+        }
+    }
+}
+
+void scsi_device_drained_end(SCSIDevice *sdev)
+{
+    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, sdev->qdev.parent_bus);
+    if (!bus) {
+        return;
+    }
+
+    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+    assert(bus->drain_count > 0);
+
+    if (bus->drain_count-- == 1) {
+        trace_scsi_bus_drained_end(bus, sdev);
+        if (bus->info->drained_end) {
+            bus->info->drained_end(bus);
+        }
+    }
+}
+
 static char *scsibus_get_dev_path(DeviceState *dev)
 {
     SCSIDevice *d = SCSI_DEVICE(dev);
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 97c9b1c8cd..e0d79c7966 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2360,6 +2360,20 @@ static void scsi_disk_reset(DeviceState *dev)
     s->qdev.scsi_version = s->qdev.default_scsi_version;
 }
 
+static void scsi_disk_drained_begin(void *opaque)
+{
+    SCSIDiskState *s = opaque;
+
+    scsi_device_drained_begin(&s->qdev);
+}
+
+static void scsi_disk_drained_end(void *opaque)
+{
+    SCSIDiskState *s = opaque;
+
+    scsi_device_drained_end(&s->qdev);
+}
+
 static void scsi_disk_resize_cb(void *opaque)
 {
     SCSIDiskState *s = opaque;
@@ -2414,16 +2428,19 @@ static bool scsi_cd_is_medium_locked(void *opaque)
 }
 
 static const BlockDevOps scsi_disk_removable_block_ops = {
-    .change_media_cb = scsi_cd_change_media_cb,
+    .change_media_cb  = scsi_cd_change_media_cb,
+    .drained_begin    = scsi_disk_drained_begin,
+    .drained_end      = scsi_disk_drained_end,
     .eject_request_cb = scsi_cd_eject_request_cb,
-    .is_tray_open = scsi_cd_is_tray_open,
     .is_medium_locked = scsi_cd_is_medium_locked,
-
-    .resize_cb = scsi_disk_resize_cb,
+    .is_tray_open     = scsi_cd_is_tray_open,
+    .resize_cb        = scsi_disk_resize_cb,
 };
 
 static const BlockDevOps scsi_disk_block_ops = {
-    .resize_cb = scsi_disk_resize_cb,
+    .drained_begin = scsi_disk_drained_begin,
+    .drained_end   = scsi_disk_drained_end,
+    .resize_cb     = scsi_disk_resize_cb,
 };
 
 static void scsi_disk_unit_attention_reported(SCSIDevice *dev)
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 81643445ed..1060038e13 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -153,14 +153,16 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     s->dataplane_starting = false;
     s->dataplane_started = true;
 
-    aio_context_acquire(s->ctx);
-    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
-    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
+    if (s->bus.drain_count == 0) {
+        aio_context_acquire(s->ctx);
+        virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
+        virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
 
-    for (i = 0; i < vs->conf.num_queues; i++) {
-        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
+        for (i = 0; i < vs->conf.num_queues; i++) {
+            virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
+        }
+        aio_context_release(s->ctx);
     }
-    aio_context_release(s->ctx);
     return 0;
 
 fail_host_notifiers:
@@ -206,9 +208,11 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
     }
     s->dataplane_stopping = true;
 
-    aio_context_acquire(s->ctx);
-    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
-    aio_context_release(s->ctx);
+    if (s->bus.drain_count == 0) {
+        aio_context_acquire(s->ctx);
+        aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
+        aio_context_release(s->ctx);
+    }
 
     blk_drain_all(); /* ensure there are no in-flight requests */
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index c1a7ea9ae2..4a8849cc7e 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1117,6 +1117,42 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     }
 }
 
+/* Suspend virtqueue ioeventfd processing during drain */
+static void virtio_scsi_drained_begin(SCSIBus *bus)
+{
+    VirtIOSCSI *s = container_of(bus, VirtIOSCSI, bus);
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    uint32_t total_queues = VIRTIO_SCSI_VQ_NUM_FIXED +
+                            s->parent_obj.conf.num_queues;
+
+    if (!s->dataplane_started) {
+        return;
+    }
+
+    for (uint32_t i = 0; i < total_queues; i++) {
+        VirtQueue *vq = virtio_get_queue(vdev, i);
+        virtio_queue_aio_detach_host_notifier(vq, s->ctx);
+    }
+}
+
+/* Resume virtqueue ioeventfd processing after drain */
+static void virtio_scsi_drained_end(SCSIBus *bus)
+{
+    VirtIOSCSI *s = container_of(bus, VirtIOSCSI, bus);
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    uint32_t total_queues = VIRTIO_SCSI_VQ_NUM_FIXED +
+                            s->parent_obj.conf.num_queues;
+
+    if (!s->dataplane_started) {
+        return;
+    }
+
+    for (uint32_t i = 0; i < total_queues; i++) {
+        VirtQueue *vq = virtio_get_queue(vdev, i);
+        virtio_queue_aio_attach_host_notifier(vq, s->ctx);
+    }
+}
+
 static struct SCSIBusInfo virtio_scsi_scsi_info = {
     .tcq = true,
     .max_channel = VIRTIO_SCSI_MAX_CHANNEL,
@@ -1131,6 +1167,8 @@ static struct SCSIBusInfo virtio_scsi_scsi_info = {
     .get_sg_list = virtio_scsi_get_sg_list,
     .save_request = virtio_scsi_save_request,
     .load_request = virtio_scsi_load_request,
+    .drained_begin = virtio_scsi_drained_begin,
+    .drained_end = virtio_scsi_drained_end,
 };
 
 void virtio_scsi_common_realize(DeviceState *dev,
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index ab238293f0..bdd4e2c7c7 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -6,6 +6,8 @@ scsi_req_cancel(int target, int lun, int tag) "target %d lun %d tag %d"
 scsi_req_data(int target, int lun, int tag, int len) "target %d lun %d tag %d len %d"
 scsi_req_data_canceled(int target, int lun, int tag, int len) "target %d lun %d tag %d len %d"
 scsi_req_dequeue(int target, int lun, int tag) "target %d lun %d tag %d"
+scsi_bus_drained_begin(void *bus, void *sdev) "bus %p sdev %p"
+scsi_bus_drained_end(void *bus, void *sdev) "bus %p sdev %p"
 scsi_req_continue(int target, int lun, int tag) "target %d lun %d tag %d"
 scsi_req_continue_canceled(int target, int lun, int tag) "target %d lun %d tag %d"
 scsi_req_parsed(int target, int lun, int tag, int cmd, int mode, int xfer) "target %d lun %d tag %d command %d dir %d length %d"
-- 
2.40.1


