Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88A805D21
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648192.1012353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2L-0005K1-20; Tue, 05 Dec 2023 18:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648192.1012353; Tue, 05 Dec 2023 18:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2K-0005GH-T2; Tue, 05 Dec 2023 18:20:48 +0000
Received: by outflank-mailman (input) for mailman id 648192;
 Tue, 05 Dec 2023 18:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa2J-0002wG-Om
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 015b3741-939b-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 19:20:45 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-ksoH-B_qNCu3IHo5ypFuDQ-1; Tue,
 05 Dec 2023 13:20:40 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0ACB386A0AC;
 Tue,  5 Dec 2023 18:20:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 329D9492BC6;
 Tue,  5 Dec 2023 18:20:37 +0000 (UTC)
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
X-Inumbo-ID: 015b3741-939b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKQzQ3fye1WySx6n8C4OipFXirz9rwxVm6vz00LMeKs=;
	b=PCXoewqez83iclCPZ5RqkjrtMG4/MWwVviMVfoT/DFNUQArvaxTn419iEwwm0r0xsxJzTT
	DyUBjEuJhtIunFVurqUbxUMpbjnyQ/5QtLH7K1frbZobIFUUTj/LelrYCOwObBcBYscVqG
	smev1PigzZYwj8I0E2l2INBeYDJ4ttw=
X-MC-Unique: ksoH-B_qNCu3IHo5ypFuDQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Ari Sundholm <ari@tuxera.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Wen Congyang <wencongyang2@huawei.com>,
	Alberto Garcia <berto@igalia.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Peter Xu <peterx@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Leonardo Bras <leobras@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 08/14] scsi: remove AioContext locking
Date: Tue,  5 Dec 2023 13:20:05 -0500
Message-ID: <20231205182011.1976568-9-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

The AioContext lock no longer has any effect. Remove it.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/hw/virtio/virtio-scsi.h | 14 --------------
 hw/scsi/scsi-bus.c              |  2 --
 hw/scsi/scsi-disk.c             | 31 +++++--------------------------
 hw/scsi/virtio-scsi.c           | 18 ------------------
 4 files changed, 5 insertions(+), 60 deletions(-)

diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index da8cb928d9..7f0573b1bf 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -101,20 +101,6 @@ struct VirtIOSCSI {
     uint32_t host_features;
 };
 
-static inline void virtio_scsi_acquire(VirtIOSCSI *s)
-{
-    if (s->ctx) {
-        aio_context_acquire(s->ctx);
-    }
-}
-
-static inline void virtio_scsi_release(VirtIOSCSI *s)
-{
-    if (s->ctx) {
-        aio_context_release(s->ctx);
-    }
-}
-
 void virtio_scsi_common_realize(DeviceState *dev,
                                 VirtIOHandleOutput ctrl,
                                 VirtIOHandleOutput evt,
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index f3ec11f892..df68a44b6a 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1731,9 +1731,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
 {
     scsi_device_for_each_req_async(sdev, scsi_device_purge_one_req, NULL);
 
-    aio_context_acquire(blk_get_aio_context(sdev->conf.blk));
     blk_drain(sdev->conf.blk);
-    aio_context_release(blk_get_aio_context(sdev->conf.blk));
     scsi_device_set_ua(sdev, sense);
 }
 
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index a5048e0aaf..61be3d395a 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2339,14 +2339,10 @@ static void scsi_disk_reset(DeviceState *dev)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev.qdev, dev);
     uint64_t nb_sectors;
-    AioContext *ctx;
 
     scsi_device_purge_requests(&s->qdev, SENSE_CODE(RESET));
 
-    ctx = blk_get_aio_context(s->qdev.conf.blk);
-    aio_context_acquire(ctx);
     blk_get_geometry(s->qdev.conf.blk, &nb_sectors);
-    aio_context_release(ctx);
 
     nb_sectors /= s->qdev.blocksize / BDRV_SECTOR_SIZE;
     if (nb_sectors) {
@@ -2545,15 +2541,13 @@ static void scsi_unrealize(SCSIDevice *dev)
 static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
-    AioContext *ctx = NULL;
+
     /* can happen for devices without drive. The error message for missing
      * backend will be issued in scsi_realize
      */
     if (s->qdev.conf.blk) {
-        ctx = blk_get_aio_context(s->qdev.conf.blk);
-        aio_context_acquire(ctx);
         if (!blkconf_blocksizes(&s->qdev.conf, errp)) {
-            goto out;
+            return;
         }
     }
     s->qdev.blocksize = s->qdev.conf.logical_block_size;
@@ -2562,16 +2556,11 @@ static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
         s->product = g_strdup("QEMU HARDDISK");
     }
     scsi_realize(&s->qdev, errp);
-out:
-    if (ctx) {
-        aio_context_release(ctx);
-    }
 }
 
 static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
-    AioContext *ctx;
     int ret;
     uint32_t blocksize = 2048;
 
@@ -2587,8 +2576,6 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
         blocksize = dev->conf.physical_block_size;
     }
 
-    ctx = blk_get_aio_context(dev->conf.blk);
-    aio_context_acquire(ctx);
     s->qdev.blocksize = blocksize;
     s->qdev.type = TYPE_ROM;
     s->features |= 1 << SCSI_DISK_F_REMOVABLE;
@@ -2596,7 +2583,6 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
         s->product = g_strdup("QEMU CD-ROM");
     }
     scsi_realize(&s->qdev, errp);
-    aio_context_release(ctx);
 }
 
 
@@ -2727,7 +2713,6 @@ static int get_device_type(SCSIDiskState *s)
 static void scsi_block_realize(SCSIDevice *dev, Error **errp)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
-    AioContext *ctx;
     int sg_version;
     int rc;
 
@@ -2742,9 +2727,6 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
                           "be removed in a future version");
     }
 
-    ctx = blk_get_aio_context(s->qdev.conf.blk);
-    aio_context_acquire(ctx);
-
     /* check we are using a driver managing SG_IO (version 3 and after) */
     rc = blk_ioctl(s->qdev.conf.blk, SG_GET_VERSION_NUM, &sg_version);
     if (rc < 0) {
@@ -2752,18 +2734,18 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
         if (rc != -EPERM) {
             error_append_hint(errp, "Is this a SCSI device?\n");
         }
-        goto out;
+        return;
     }
     if (sg_version < 30000) {
         error_setg(errp, "scsi generic interface too old");
-        goto out;
+        return;
     }
 
     /* get device type from INQUIRY data */
     rc = get_device_type(s);
     if (rc < 0) {
         error_setg(errp, "INQUIRY failed");
-        goto out;
+        return;
     }
 
     /* Make a guess for the block size, we'll fix it when the guest sends.
@@ -2783,9 +2765,6 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
 
     scsi_realize(&s->qdev, errp);
     scsi_generic_read_device_inquiry(&s->qdev);
-
-out:
-    aio_context_release(ctx);
 }
 
 typedef struct SCSIBlockReq {
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 4f8d35facc..ca365a70e9 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -642,9 +642,7 @@ static void virtio_scsi_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-    virtio_scsi_acquire(s);
     virtio_scsi_handle_ctrl_vq(s, vq);
-    virtio_scsi_release(s);
 }
 
 static void virtio_scsi_complete_cmd_req(VirtIOSCSIReq *req)
@@ -882,9 +880,7 @@ static void virtio_scsi_handle_cmd(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-    virtio_scsi_acquire(s);
     virtio_scsi_handle_cmd_vq(s, vq);
-    virtio_scsi_release(s);
 }
 
 static void virtio_scsi_get_config(VirtIODevice *vdev,
@@ -1031,9 +1027,7 @@ static void virtio_scsi_handle_event(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-    virtio_scsi_acquire(s);
     virtio_scsi_handle_event_vq(s, vq);
-    virtio_scsi_release(s);
 }
 
 static void virtio_scsi_change(SCSIBus *bus, SCSIDevice *dev, SCSISense sense)
@@ -1052,9 +1046,7 @@ static void virtio_scsi_change(SCSIBus *bus, SCSIDevice *dev, SCSISense sense)
             },
         };
 
-        virtio_scsi_acquire(s);
         virtio_scsi_push_event(s, &info);
-        virtio_scsi_release(s);
     }
 }
 
@@ -1071,17 +1063,13 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtIODevice *vdev = VIRTIO_DEVICE(hotplug_dev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     SCSIDevice *sd = SCSI_DEVICE(dev);
-    AioContext *old_context;
     int ret;
 
     if (s->ctx && !s->dataplane_fenced) {
         if (blk_op_is_blocked(sd->conf.blk, BLOCK_OP_TYPE_DATAPLANE, errp)) {
             return;
         }
-        old_context = blk_get_aio_context(sd->conf.blk);
-        aio_context_acquire(old_context);
         ret = blk_set_aio_context(sd->conf.blk, s->ctx, errp);
-        aio_context_release(old_context);
         if (ret < 0) {
             return;
         }
@@ -1097,10 +1085,8 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
             },
         };
 
-        virtio_scsi_acquire(s);
         virtio_scsi_push_event(s, &info);
         scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
-        virtio_scsi_release(s);
     }
 }
 
@@ -1122,17 +1108,13 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
 
     if (s->ctx) {
-        virtio_scsi_acquire(s);
         /* If other users keep the BlockBackend in the iothread, that's ok */
         blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL);
-        virtio_scsi_release(s);
     }
 
     if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
-        virtio_scsi_acquire(s);
         virtio_scsi_push_event(s, &info);
         scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
-        virtio_scsi_release(s);
     }
 }
 
-- 
2.43.0


