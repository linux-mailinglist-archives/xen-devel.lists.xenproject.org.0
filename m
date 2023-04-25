Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D286EE697
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526186.817807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMSI-00027l-M4; Tue, 25 Apr 2023 17:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526186.817807; Tue, 25 Apr 2023 17:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMSI-00021N-Gc; Tue, 25 Apr 2023 17:27:54 +0000
Received: by outflank-mailman (input) for mailman id 526186;
 Tue, 25 Apr 2023 17:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Bb6=AQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1prMSG-0007l5-8O
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:27:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 805102ac-e38e-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 19:27:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-_LlzPYThP92zuiCljAn7kw-1; Tue, 25 Apr 2023 13:27:45 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A638828082A8;
 Tue, 25 Apr 2023 17:27:44 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D82492B10;
 Tue, 25 Apr 2023 17:27:43 +0000 (UTC)
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
X-Inumbo-ID: 805102ac-e38e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682443669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pr0VKOkDxuZ5hinADqgnbKz4Kufrp9KJiNLqpg8yv3Q=;
	b=PWBBM/H09rSu7gAuqjo4eV+haZlIkNYbsyfabYgtk4SPsfsSNcQbqxmRMfnToVXvbaxzfg
	inthcnyivnDcl275+0Cn8/xzpZnTSCC40ks1cyKGGpHKDcTDSgosw0dj61Hufkz1MlUhyQ
	cBK9ltLwJ5FHcINPM3sLmhDkP7G1FaY=
X-MC-Unique: _LlzPYThP92zuiCljAn7kw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>,
	Paul Durrant <paul@xen.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: [PATCH v4 11/20] xen-block: implement BlockDevOps->drained_begin()
Date: Tue, 25 Apr 2023 13:27:07 -0400
Message-Id: <20230425172716.1033562-12-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

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
index 734da42ea7..02e0fd6115 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -663,6 +663,30 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
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
@@ -673,13 +697,11 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 
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
@@ -818,11 +840,9 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
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
2.39.2


