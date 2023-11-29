Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1997FE083
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644176.1004882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QfK-0000iR-Ql; Wed, 29 Nov 2023 19:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644176.1004882; Wed, 29 Nov 2023 19:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QfK-0000bt-Mx; Wed, 29 Nov 2023 19:56:10 +0000
Received: by outflank-mailman (input) for mailman id 644176;
 Wed, 29 Nov 2023 19:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8QfJ-0000Sw-GO
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55d330d8-8ef1-11ee-98e4-6d05b1d4d9a1;
 Wed, 29 Nov 2023 20:56:08 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-7PZf8UtzMqq7ue5HK1SifQ-1; Wed,
 29 Nov 2023 14:56:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF60E29AA2CA;
 Wed, 29 Nov 2023 19:56:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22DFA1121308;
 Wed, 29 Nov 2023 19:55:59 +0000 (UTC)
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
X-Inumbo-ID: 55d330d8-8ef1-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ocMGkaWO2UNgH6BeGysPHsaortxgu0jbKcgqrLTfAY=;
	b=MQItrGL3QxuFlzS3M60oZzaIwfVJo+/gA308TwNwWSoZQ44Ew9+qNhidOfvOLqNGGqJOuj
	aj+L8zlfqAuwDsZfyvbCbwmZQNTxlQOBmiRBcavbbiq5SuiAJ6D4D3VP30wZDET7X6zykh
	+i8s4skSxdQ57HcTuVmsAJ12ZFLnxxo=
X-MC-Unique: 7PZf8UtzMqq7ue5HK1SifQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Wen Congyang <wencongyang2@huawei.com>,
	<qemu-block@nongnu.org>,
	xen-devel@lists.xenproject.org,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Ari Sundholm <ari@tuxera.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Cleber Rosa <crosa@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhang Chen <chen.zhang@intel.com>,
	Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Fam Zheng <fam@euphon.net>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 01/12] virtio-scsi: replace AioContext lock with tmf_bh_lock
Date: Wed, 29 Nov 2023 14:55:42 -0500
Message-ID: <20231129195553.942921-2-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Protect the Task Management Function BH state with a lock. The TMF BH
runs in the main loop thread. An IOThread might process a TMF at the
same time as the TMF BH is running. Therefore tmf_bh_list and tmf_bh
must be protected by a lock.

Run TMF request completion in the IOThread using aio_wait_bh_oneshot().
This avoids more locking to protect the virtqueue and SCSI layer state.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-scsi.h |  3 +-
 hw/scsi/virtio-scsi.c           | 62 ++++++++++++++++++++++-----------
 2 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 779568ab5d..da8cb928d9 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -85,8 +85,9 @@ struct VirtIOSCSI {
 
     /*
      * TMFs deferred to main loop BH. These fields are protected by
-     * virtio_scsi_acquire().
+     * tmf_bh_lock.
      */
+    QemuMutex tmf_bh_lock;
     QEMUBH *tmf_bh;
     QTAILQ_HEAD(, VirtIOSCSIReq) tmf_bh_list;
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 9c751bf296..4f8d35facc 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -123,6 +123,30 @@ static void virtio_scsi_complete_req(VirtIOSCSIReq *req)
     virtio_scsi_free_req(req);
 }
 
+static void virtio_scsi_complete_req_bh(void *opaque)
+{
+    VirtIOSCSIReq *req = opaque;
+
+    virtio_scsi_complete_req(req);
+}
+
+/*
+ * Called from virtio_scsi_do_one_tmf_bh() in main loop thread. The main loop
+ * thread cannot touch the virtqueue since that could race with an IOThread.
+ */
+static void virtio_scsi_complete_req_from_main_loop(VirtIOSCSIReq *req)
+{
+    VirtIOSCSI *s = req->dev;
+
+    if (!s->ctx || s->ctx == qemu_get_aio_context()) {
+        /* No need to schedule a BH when there is no IOThread */
+        virtio_scsi_complete_req(req);
+    } else {
+        /* Run request completion in the IOThread */
+        aio_wait_bh_oneshot(s->ctx, virtio_scsi_complete_req_bh, req);
+    }
+}
+
 static void virtio_scsi_bad_req(VirtIOSCSIReq *req)
 {
     virtio_error(VIRTIO_DEVICE(req->dev), "wrong size for virtio-scsi headers");
@@ -338,10 +362,7 @@ static void virtio_scsi_do_one_tmf_bh(VirtIOSCSIReq *req)
 
 out:
     object_unref(OBJECT(d));
-
-    virtio_scsi_acquire(s);
-    virtio_scsi_complete_req(req);
-    virtio_scsi_release(s);
+    virtio_scsi_complete_req_from_main_loop(req);
 }
 
 /* Some TMFs must be processed from the main loop thread */
@@ -354,18 +375,16 @@ static void virtio_scsi_do_tmf_bh(void *opaque)
 
     GLOBAL_STATE_CODE();
 
-    virtio_scsi_acquire(s);
+    WITH_QEMU_LOCK_GUARD(&s->tmf_bh_lock) {
+        QTAILQ_FOREACH_SAFE(req, &s->tmf_bh_list, next, tmp) {
+            QTAILQ_REMOVE(&s->tmf_bh_list, req, next);
+            QTAILQ_INSERT_TAIL(&reqs, req, next);
+        }
 
-    QTAILQ_FOREACH_SAFE(req, &s->tmf_bh_list, next, tmp) {
-        QTAILQ_REMOVE(&s->tmf_bh_list, req, next);
-        QTAILQ_INSERT_TAIL(&reqs, req, next);
+        qemu_bh_delete(s->tmf_bh);
+        s->tmf_bh = NULL;
     }
 
-    qemu_bh_delete(s->tmf_bh);
-    s->tmf_bh = NULL;
-
-    virtio_scsi_release(s);
-
     QTAILQ_FOREACH_SAFE(req, &reqs, next, tmp) {
         QTAILQ_REMOVE(&reqs, req, next);
         virtio_scsi_do_one_tmf_bh(req);
@@ -379,8 +398,7 @@ static void virtio_scsi_reset_tmf_bh(VirtIOSCSI *s)
 
     GLOBAL_STATE_CODE();
 
-    virtio_scsi_acquire(s);
-
+    /* Called after ioeventfd has been stopped, so tmf_bh_lock is not needed */
     if (s->tmf_bh) {
         qemu_bh_delete(s->tmf_bh);
         s->tmf_bh = NULL;
@@ -393,19 +411,19 @@ static void virtio_scsi_reset_tmf_bh(VirtIOSCSI *s)
         req->resp.tmf.response = VIRTIO_SCSI_S_TARGET_FAILURE;
         virtio_scsi_complete_req(req);
     }
-
-    virtio_scsi_release(s);
 }
 
 static void virtio_scsi_defer_tmf_to_bh(VirtIOSCSIReq *req)
 {
     VirtIOSCSI *s = req->dev;
 
-    QTAILQ_INSERT_TAIL(&s->tmf_bh_list, req, next);
+    WITH_QEMU_LOCK_GUARD(&s->tmf_bh_lock) {
+        QTAILQ_INSERT_TAIL(&s->tmf_bh_list, req, next);
 
-    if (!s->tmf_bh) {
-        s->tmf_bh = qemu_bh_new(virtio_scsi_do_tmf_bh, s);
-        qemu_bh_schedule(s->tmf_bh);
+        if (!s->tmf_bh) {
+            s->tmf_bh = qemu_bh_new(virtio_scsi_do_tmf_bh, s);
+            qemu_bh_schedule(s->tmf_bh);
+        }
     }
 }
 
@@ -1235,6 +1253,7 @@ static void virtio_scsi_device_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
 
     QTAILQ_INIT(&s->tmf_bh_list);
+    qemu_mutex_init(&s->tmf_bh_lock);
 
     virtio_scsi_common_realize(dev,
                                virtio_scsi_handle_ctrl,
@@ -1277,6 +1296,7 @@ static void virtio_scsi_device_unrealize(DeviceState *dev)
 
     qbus_set_hotplug_handler(BUS(&s->bus), NULL);
     virtio_scsi_common_unrealize(dev);
+    qemu_mutex_destroy(&s->tmf_bh_lock);
 }
 
 static Property virtio_scsi_properties[] = {
-- 
2.42.0


