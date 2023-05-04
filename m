Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D8E6F75B3
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 22:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530118.825527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7e-0006LC-OR; Thu, 04 May 2023 20:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530118.825527; Thu, 04 May 2023 20:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7e-0006GM-Hw; Thu, 04 May 2023 20:00:14 +0000
Received: by outflank-mailman (input) for mailman id 530118;
 Thu, 04 May 2023 20:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1m-0003xx-S4
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e900e4a-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:54:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-xmcew5b9Mi60YoS0X3Y-pA-1; Thu, 04 May 2023 15:54:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92EA73813F37;
 Thu,  4 May 2023 19:54:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB53F2166B31;
 Thu,  4 May 2023 19:54:00 +0000 (UTC)
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
X-Inumbo-ID: 6e900e4a-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIROaLBR9j1PhaubFnxgRi7zZWyl4fJ5E1s3DXvyvk4=;
	b=RZA3vtrpky9fDgrT/OCu2Bro0R+jwMqhXEhxJI57kEGG1bb1HRtp8T5OtXqQyW4MwN+Jj/
	5MqnLrs8dBLqB3Vw6dVg1YdYQh0AprySzX/mPCeuT0XkJm3Y79a5vsDJWYumGygtwnGEfW
	cyoCsuo35ds39gchqgIU6UQoTdtv6Q0=
X-MC-Unique: xmcew5b9Mi60YoS0X3Y-pA-1
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
Subject: [PATCH v5 12/21] xen-block: implement BlockDevOps->drained_begin()
Date: Thu,  4 May 2023 15:53:18 -0400
Message-Id: <20230504195327.695107-13-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Detach event channels during drained sections to stop I/O submission
from the ring. xen-block is no longer reliant on aio_disable_external()
after this patch. This will allow us to remove the
aio_disable_external() API once all other code that relies on it is
converted.

Extend xen_device_set_event_channel_context() to allow ctx=NULL. The
event channel still exists but the event loop does not monitor the file
descriptor. Event channel processing can resume by calling
xen_device_set_event_channel_context() with a non-NULL ctx.

Factor out xen_device_set_event_channel_context() calls in
hw/block/dataplane/xen-block.c into attach/detach helper functions.
Incidentally, these don't require the AioContext lock because
aio_set_fd_handler() is thread-safe.

It's safer to register BlockDevOps after the dataplane instance has been
created. The BlockDevOps .drained_begin/end() callbacks depend on the
dataplane instance, so move the blk_set_dev_ops() call after
xen_block_dataplane_create().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/dataplane/xen-block.h |  2 ++
 hw/block/dataplane/xen-block.c | 42 +++++++++++++++++++++++++---------
 hw/block/xen-block.c           | 24 ++++++++++++++++---
 hw/xen/xen-bus.c               |  7 ++++--
 4 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/hw/block/dataplane/xen-block.h b/hw/block/dataplane/xen-block.h
index 76dcd51c3d..7b8e9df09f 100644
--- a/hw/block/dataplane/xen-block.h
+++ b/hw/block/dataplane/xen-block.h
@@ -26,5 +26,7 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
                                unsigned int protocol,
                                Error **errp);
 void xen_block_dataplane_stop(XenBlockDataPlane *dataplane);
+void xen_block_dataplane_attach(XenBlockDataPlane *dataplane);
+void xen_block_dataplane_detach(XenBlockDataPlane *dataplane);
 
 #endif /* HW_BLOCK_DATAPLANE_XEN_BLOCK_H */
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index d8bc39d359..2597f38805 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -664,6 +664,30 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
     g_free(dataplane);
 }
 
+void xen_block_dataplane_detach(XenBlockDataPlane *dataplane)
+{
+    if (!dataplane || !dataplane->event_channel) {
+        return;
+    }
+
+    /* Only reason for failure is a NULL channel */
+    xen_device_set_event_channel_context(dataplane->xendev,
+                                         dataplane->event_channel,
+                                         NULL, &error_abort);
+}
+
+void xen_block_dataplane_attach(XenBlockDataPlane *dataplane)
+{
+    if (!dataplane || !dataplane->event_channel) {
+        return;
+    }
+
+    /* Only reason for failure is a NULL channel */
+    xen_device_set_event_channel_context(dataplane->xendev,
+                                         dataplane->event_channel,
+                                         dataplane->ctx, &error_abort);
+}
+
 void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 {
     XenDevice *xendev;
@@ -674,13 +698,11 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 
     xendev = dataplane->xendev;
 
-    aio_context_acquire(dataplane->ctx);
-    if (dataplane->event_channel) {
-        /* Only reason for failure is a NULL channel */
-        xen_device_set_event_channel_context(xendev, dataplane->event_channel,
-                                             qemu_get_aio_context(),
-                                             &error_abort);
+    if (!blk_in_drain(dataplane->blk)) {
+        xen_block_dataplane_detach(dataplane);
     }
+
+    aio_context_acquire(dataplane->ctx);
     /* Xen doesn't have multiple users for nodes, so this can't fail */
     blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(dataplane->ctx);
@@ -819,11 +841,9 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
     blk_set_aio_context(dataplane->blk, dataplane->ctx, NULL);
     aio_context_release(old_context);
 
-    /* Only reason for failure is a NULL channel */
-    aio_context_acquire(dataplane->ctx);
-    xen_device_set_event_channel_context(xendev, dataplane->event_channel,
-                                         dataplane->ctx, &error_abort);
-    aio_context_release(dataplane->ctx);
+    if (!blk_in_drain(dataplane->blk)) {
+        xen_block_dataplane_attach(dataplane);
+    }
 
     return;
 
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index f5a744589d..f099914831 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -189,8 +189,26 @@ static void xen_block_resize_cb(void *opaque)
     xen_device_backend_printf(xendev, "state", "%u", state);
 }
 
+/* Suspend request handling */
+static void xen_block_drained_begin(void *opaque)
+{
+    XenBlockDevice *blockdev = opaque;
+
+    xen_block_dataplane_detach(blockdev->dataplane);
+}
+
+/* Resume request handling */
+static void xen_block_drained_end(void *opaque)
+{
+    XenBlockDevice *blockdev = opaque;
+
+    xen_block_dataplane_attach(blockdev->dataplane);
+}
+
 static const BlockDevOps xen_block_dev_ops = {
-    .resize_cb = xen_block_resize_cb,
+    .resize_cb     = xen_block_resize_cb,
+    .drained_begin = xen_block_drained_begin,
+    .drained_end   = xen_block_drained_end,
 };
 
 static void xen_block_realize(XenDevice *xendev, Error **errp)
@@ -242,8 +260,6 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
         return;
     }
 
-    blk_set_dev_ops(blk, &xen_block_dev_ops, blockdev);
-
     if (conf->discard_granularity == -1) {
         conf->discard_granularity = conf->physical_block_size;
     }
@@ -277,6 +293,8 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     blockdev->dataplane =
         xen_block_dataplane_create(xendev, blk, conf->logical_block_size,
                                    blockdev->props.iothread);
+
+    blk_set_dev_ops(blk, &xen_block_dev_ops, blockdev);
 }
 
 static void xen_block_frontend_changed(XenDevice *xendev,
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index c59850b1de..b8f408c9ed 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -846,8 +846,11 @@ void xen_device_set_event_channel_context(XenDevice *xendev,
                            NULL, NULL, NULL, NULL, NULL);
 
     channel->ctx = ctx;
-    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
-                       xen_device_event, NULL, xen_device_poll, NULL, channel);
+    if (ctx) {
+        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
+                           true, xen_device_event, NULL, xen_device_poll, NULL,
+                           channel);
+    }
 }
 
 XenEventChannel *xen_device_bind_event_channel(XenDevice *xendev,
-- 
2.40.1


