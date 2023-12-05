Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A57805D1A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648184.1012294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa26-0003Is-Bo; Tue, 05 Dec 2023 18:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648184.1012294; Tue, 05 Dec 2023 18:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa26-0003FP-4Y; Tue, 05 Dec 2023 18:20:34 +0000
Received: by outflank-mailman (input) for mailman id 648184;
 Tue, 05 Dec 2023 18:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa24-0002wG-F9
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f86807a6-939a-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 19:20:30 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-GF-QWva-Oni-7XU0aB-D9w-1; Tue, 05 Dec 2023 13:20:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4226585A597;
 Tue,  5 Dec 2023 18:20:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C5B51E3;
 Tue,  5 Dec 2023 18:20:17 +0000 (UTC)
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
X-Inumbo-ID: f86807a6-939a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYzMzXb1PdcjP3A1qwHad/XAhWJKM4hT2cxMg6piGu4=;
	b=WCB28mTctlm3HwtP/GGotoNmvKb3jY7S4dCnfTsaXoi2R9QnZCGAeOSqUWsC5z1ZCuUGNb
	Mh7yJw/f52Pr13MI1Q4ZS5dcXKhCOZ0ShmJyr4cEJYbRjlcBqjNSM7xyTvVkpegipigXlt
	P4HrDlGa4qL4FJGZR3nnd9W5rFZAMtY=
X-MC-Unique: GF-QWva-Oni-7XU0aB-D9w-1
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
Subject: [PATCH v2 01/14] virtio-scsi: replace AioContext lock with tmf_bh_lock
Date: Tue,  5 Dec 2023 13:19:58 -0500
Message-ID: <20231205182011.1976568-2-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Protect the Task Management Function BH state with a lock. The TMF BH
runs in the main loop thread. An IOThread might process a TMF at the
same time as the TMF BH is running. Therefore tmf_bh_list and tmf_bh
must be protected by a lock.

Run TMF request completion in the IOThread using aio_wait_bh_oneshot().
This avoids more locking to protect the virtqueue and SCSI layer state.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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
2.43.0


