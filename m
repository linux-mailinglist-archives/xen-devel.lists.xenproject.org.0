Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A607A6E92F3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524122.814771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSbn-0001R8-8g; Thu, 20 Apr 2023 11:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524122.814771; Thu, 20 Apr 2023 11:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSbn-0001Oi-5N; Thu, 20 Apr 2023 11:37:51 +0000
Received: by outflank-mailman (input) for mailman id 524122;
 Thu, 20 Apr 2023 11:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onos=AL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppSbl-00017u-1y
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:37:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c619e470-df6f-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 13:37:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-VCLxhnfSPFqLD1O2cun8pQ-1; Thu, 20 Apr 2023 07:37:42 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44168380671E;
 Thu, 20 Apr 2023 11:37:41 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 213381410F1C;
 Thu, 20 Apr 2023 11:37:39 +0000 (UTC)
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
X-Inumbo-ID: c619e470-df6f-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681990667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ct1ICfub90ccCopLja+U3Sq9ZQX/65uvuN+fpfLMIoc=;
	b=SibGHQhKPwH260n+GV9EZs4FUJwLqfTDL30rrhZFCTcwSTBOLGtZGqgAZSiUpjayUmkVUa
	OG5EZJmXmeDXx3fluHL0Td9uOw3GVj+OPBoxefJt2QKYdWIpCGtjGrWASqsHD7EIYU1XTg
	pA/PCNmLM4cw6qidhmKcTFPvIpZ/qnA=
X-MC-Unique: VCLxhnfSPFqLD1O2cun8pQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Juan Quintela <quintela@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Julia Suvorova <jusual@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	Hanna Reitz <hreitz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	eesposit@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [PATCH v3 02/20] virtio-scsi: avoid race between unplug and transport event
Date: Thu, 20 Apr 2023 07:37:14 -0400
Message-Id: <20230420113732.336620-3-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Only report a transport reset event to the guest after the SCSIDevice
has been unrealized by qdev_simple_device_unplug_cb().

qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
to false so that scsi_device_find/get() no longer see it.

scsi_target_emulate_report_luns() also needs to be updated to filter out
SCSIDevices that are unrealized.

These changes ensure that the guest driver does not see the SCSIDevice
that's being unplugged if it responds very quickly to the transport
reset event.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/scsi-bus.c    |  3 ++-
 hw/scsi/virtio-scsi.c | 18 +++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 07275fb631..64d7311757 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -486,7 +486,8 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
             DeviceState *qdev = kid->child;
             SCSIDevice *dev = SCSI_DEVICE(qdev);
 
-            if (dev->channel == channel && dev->id == id && dev->lun != 0) {
+            if (dev->channel == channel && dev->id == id && dev->lun != 0 &&
+                qdev_is_realized(&dev->qdev)) {
                 store_lun(tmp, dev->lun);
                 g_byte_array_append(buf, tmp, 8);
                 len += 8;
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 612c525d9d..000961446c 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1063,15 +1063,6 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     SCSIDevice *sd = SCSI_DEVICE(dev);
     AioContext *ctx = s->ctx ?: qemu_get_aio_context();
 
-    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
-        virtio_scsi_acquire(s);
-        virtio_scsi_push_event(s, sd,
-                               VIRTIO_SCSI_T_TRANSPORT_RESET,
-                               VIRTIO_SCSI_EVT_RESET_REMOVED);
-        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
-        virtio_scsi_release(s);
-    }
-
     aio_disable_external(ctx);
     qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
     aio_enable_external(ctx);
@@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL);
         virtio_scsi_release(s);
     }
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
+        virtio_scsi_acquire(s);
+        virtio_scsi_push_event(s, sd,
+                               VIRTIO_SCSI_T_TRANSPORT_RESET,
+                               VIRTIO_SCSI_EVT_RESET_REMOVED);
+        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
+        virtio_scsi_release(s);
+    }
 }
 
 static struct SCSIBusInfo virtio_scsi_scsi_info = {
-- 
2.39.2


