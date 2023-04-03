Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C86D5073
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517551.803058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwr-0004vg-S1; Mon, 03 Apr 2023 18:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517551.803058; Mon, 03 Apr 2023 18:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwr-0004qd-NK; Mon, 03 Apr 2023 18:30:33 +0000
Received: by outflank-mailman (input) for mailman id 517551;
 Mon, 03 Apr 2023 18:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOwq-0004HH-5i
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c1693d8-d24d-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 20:30:30 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-yDm9BV4sNRCoPTzB8fuUCw-1; Mon, 03 Apr 2023 14:30:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A606E885620;
 Mon,  3 Apr 2023 18:30:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECAF31121314;
 Mon,  3 Apr 2023 18:30:23 +0000 (UTC)
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
X-Inumbo-ID: 9c1693d8-d24d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd8h2e2Z0uhjua/p0PDxA8jGvK3/DbHaZUIqG5W/DmA=;
	b=TlI8CNolDE3g8bsImw9FNt8x40JPFGkUBySN9BQP+3GjyzqjIIxRGy+AfzPyW0ldWpqr4V
	kZLSEAa487q8i718P8/eG/s1EoWGN1VTHrH++d1e5o9jIW/g/nHzbvB8y0X2oIGIgmQwk+
	UkICGXaHU2W1Kb0v/6RCdJKtrFRAf8Y=
X-MC-Unique: yDm9BV4sNRCoPTzB8fuUCw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	<qemu-block@nongnu.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	eesposit@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH 06/13] block/export: stop using is_external in vhost-user-blk server
Date: Mon,  3 Apr 2023 14:29:57 -0400
Message-Id: <20230403183004.347205-7-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

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


