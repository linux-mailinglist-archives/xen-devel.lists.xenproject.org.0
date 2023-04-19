Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E706E8059
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 19:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523647.813951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbr-0003w4-Lw; Wed, 19 Apr 2023 17:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523647.813951; Wed, 19 Apr 2023 17:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbr-0003ty-Fx; Wed, 19 Apr 2023 17:28:47 +0000
Received: by outflank-mailman (input) for mailman id 523647;
 Wed, 19 Apr 2023 17:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu/K=AK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppBbp-00036z-ES
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 17:28:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1822235-ded7-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 19:28:43 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-B9iU9cznPoul00GA4s393w-1; Wed, 19 Apr 2023 13:28:39 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5A10185A791;
 Wed, 19 Apr 2023 17:28:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB5E492C3E;
 Wed, 19 Apr 2023 17:28:37 +0000 (UTC)
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
X-Inumbo-ID: a1822235-ded7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681925322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd8h2e2Z0uhjua/p0PDxA8jGvK3/DbHaZUIqG5W/DmA=;
	b=JqtDMXgTsQ1H/W3AelkJtzxSnizjEvx8CqYrFlyEfVH6FhqxhFs3jDEd7tXSt1yIBqWju2
	uYUrWz4CCHxkhpxpBtAomjv2/kln1f2WRxBPoPvQvqt6i0b/dEMV88b9/5F9JJ+liwEblz
	wsdtVNkUz94QhY+XEc97qIYcRp3WBFs=
X-MC-Unique: B9iU9cznPoul00GA4s393w-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Fam Zheng <fam@euphon.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Lieven <pl@kamp.de>,
	eesposit@redhat.com,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 07/16] block/export: stop using is_external in vhost-user-blk server
Date: Wed, 19 Apr 2023 13:28:08 -0400
Message-Id: <20230419172817.272758-8-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

vhost-user activity must be suspended during bdrv_drained_begin/end().
This prevents new requests from interfering with whatever is happening
in the drained section.

Previously this was done using aio_set_fd_handler()'s is_external
argument. In a multi-queue block layer world the aio_disable_external()
API cannot be used since multiple AioContext may be processing I/O, not
just one.

Switch to BlockDevOps->drained_begin/end() callbacks.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------------
 util/vhost-user-server.c             | 10 +++----
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index dbf5207162..6e1bc196fb 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -207,22 +207,6 @@ static const VuDevIface vu_blk_iface = {
     .process_msg           = vu_blk_process_msg,
 };
 
-static void blk_aio_attached(AioContext *ctx, void *opaque)
-{
-    VuBlkExport *vexp = opaque;
-
-    vexp->export.ctx = ctx;
-    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
-}
-
-static void blk_aio_detach(void *opaque)
-{
-    VuBlkExport *vexp = opaque;
-
-    vhost_user_server_detach_aio_context(&vexp->vu_server);
-    vexp->export.ctx = NULL;
-}
-
 static void
 vu_blk_initialize_config(BlockDriverState *bs,
                          struct virtio_blk_config *config,
@@ -254,6 +238,25 @@ static void vu_blk_exp_request_shutdown(BlockExport *exp)
     vhost_user_server_stop(&vexp->vu_server);
 }
 
+/* Called with vexp->export.ctx acquired */
+static void vu_blk_drained_begin(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+
+    vhost_user_server_detach_aio_context(&vexp->vu_server);
+}
+
+/* Called with vexp->export.blk AioContext acquired */
+static void vu_blk_drained_end(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+
+    /* Refresh AioContext in case it changed */
+    vexp->export.ctx = blk_get_aio_context(vexp->export.blk);
+
+    vhost_user_server_attach_aio_context(&vexp->vu_server, vexp->export.ctx);
+}
+
 /*
  * Ensures that bdrv_drained_begin() waits until in-flight requests complete.
  *
@@ -267,6 +270,8 @@ static bool vu_blk_drained_poll(void *opaque)
 }
 
 static const BlockDevOps vu_blk_dev_ops = {
+    .drained_begin = vu_blk_drained_begin,
+    .drained_end   = vu_blk_drained_end,
     .drained_poll  = vu_blk_drained_poll,
 };
 
@@ -309,13 +314,9 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                              logical_block_size, num_queues);
 
     blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
-    blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
-                                 vexp);
 
     if (!vhost_user_server_start(&vexp->vu_server, vu_opts->addr, exp->ctx,
                                  num_queues, &vu_blk_iface, errp)) {
-        blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
-                                        blk_aio_detach, vexp);
         blk_set_dev_ops(exp->blk, NULL, NULL);
         g_free(vexp->handler.serial);
         return -EADDRNOTAVAIL;
@@ -328,8 +329,6 @@ static void vu_blk_exp_delete(BlockExport *exp)
 {
     VuBlkExport *vexp = container_of(exp, VuBlkExport, export);
 
-    blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
-                                    vexp);
     blk_set_dev_ops(exp->blk, NULL, NULL);
     g_free(vexp->handler.serial);
 }
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 2e6b640050..332aea9306 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -278,7 +278,7 @@ set_watch(VuDev *vu_dev, int fd, int vu_evt,
         vu_fd_watch->fd = fd;
         vu_fd_watch->cb = cb;
         qemu_socket_set_nonblock(fd);
-        aio_set_fd_handler(server->ioc->ctx, fd, true, kick_handler,
+        aio_set_fd_handler(server->ioc->ctx, fd, false, kick_handler,
                            NULL, NULL, NULL, vu_fd_watch);
         vu_fd_watch->vu_dev = vu_dev;
         vu_fd_watch->pvt = pvt;
@@ -299,7 +299,7 @@ static void remove_watch(VuDev *vu_dev, int fd)
     if (!vu_fd_watch) {
         return;
     }
-    aio_set_fd_handler(server->ioc->ctx, fd, true,
+    aio_set_fd_handler(server->ioc->ctx, fd, false,
                        NULL, NULL, NULL, NULL, NULL);
 
     QTAILQ_REMOVE(&server->vu_fd_watches, vu_fd_watch, next);
@@ -362,7 +362,7 @@ void vhost_user_server_stop(VuServer *server)
         VuFdWatch *vu_fd_watch;
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, true,
+            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, false,
                                NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
@@ -403,7 +403,7 @@ void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx)
     qio_channel_attach_aio_context(server->ioc, ctx);
 
     QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-        aio_set_fd_handler(ctx, vu_fd_watch->fd, true, kick_handler, NULL,
+        aio_set_fd_handler(ctx, vu_fd_watch->fd, false, kick_handler, NULL,
                            NULL, NULL, vu_fd_watch);
     }
 
@@ -417,7 +417,7 @@ void vhost_user_server_detach_aio_context(VuServer *server)
         VuFdWatch *vu_fd_watch;
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, true,
+            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, false,
                                NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
-- 
2.39.2


