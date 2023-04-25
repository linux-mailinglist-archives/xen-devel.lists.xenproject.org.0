Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B36EE6AE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526238.817876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMTg-0007mw-MR; Tue, 25 Apr 2023 17:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526238.817876; Tue, 25 Apr 2023 17:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMTg-0007l2-G1; Tue, 25 Apr 2023 17:29:20 +0000
Received: by outflank-mailman (input) for mailman id 526238;
 Tue, 25 Apr 2023 17:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Bb6=AQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1prMSa-0006fQ-LJ
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:28:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c03efce-e38e-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 19:28:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-LxNHUAMcMq-A2DsTWxkDNA-1; Tue, 25 Apr 2023 13:28:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 607D8858289;
 Tue, 25 Apr 2023 17:28:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7CF7ADE;
 Tue, 25 Apr 2023 17:28:02 +0000 (UTC)
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
X-Inumbo-ID: 8c03efce-e38e-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682443689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyIMCQvAF20/OYjye5kCDL3cT6miBWdMHrsXrPBAXnM=;
	b=Ky3kcMjv3SCB6MDR3TZ/UUSnL7T3S2+fv/UKLNxMWza+R1nmgXIH2t9K7zpK/lw74i+xnt
	DAjoceG7tImYAx9vhEoQZkUJqMjY5Q8HCiezwQN3eE9KVU6UliVk+EEzuUX/NV0uuOBFzU
	5MDweU1bdDRAN6heaS0GI5OdX8fEJhQ=
X-MC-Unique: LxNHUAMcMq-A2DsTWxkDNA-1
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
Subject: [PATCH v4 20/20] aio: remove aio_disable_external() API
Date: Tue, 25 Apr 2023 13:27:16 -0400
Message-Id: <20230425172716.1033562-21-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

All callers now pass is_external=false to aio_set_fd_handler() and
aio_set_event_notifier(). The aio_disable_external() API that
temporarily disables fd handlers that were registered is_external=true
is therefore dead code.

Remove aio_disable_external(), aio_enable_external(), and the
is_external arguments to aio_set_fd_handler() and
aio_set_event_notifier().

The entire test-fdmon-epoll test is removed because its sole purpose was
testing aio_disable_external().

Parts of this patch were generated using the following coccinelle
(https://coccinelle.lip6.fr/) semantic patch:

  @@
  expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque;
  @@
  - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque)
  + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_ready, opaque)

  @@
  expression ctx, notifier, is_external, io_read, io_poll, io_poll_ready;
  @@
  - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll, io_poll_ready)
  + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_ready)

Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/aio.h           | 57 ---------------------------
 util/aio-posix.h              |  1 -
 block.c                       |  7 ----
 block/blkio.c                 | 15 +++----
 block/curl.c                  | 10 ++---
 block/export/fuse.c           |  8 ++--
 block/export/vduse-blk.c      | 10 ++---
 block/io.c                    |  2 -
 block/io_uring.c              |  4 +-
 block/iscsi.c                 |  3 +-
 block/linux-aio.c             |  4 +-
 block/nfs.c                   |  5 +--
 block/nvme.c                  |  8 ++--
 block/ssh.c                   |  4 +-
 block/win32-aio.c             |  6 +--
 hw/i386/kvm/xen_xenstore.c    |  2 +-
 hw/virtio/virtio.c            |  6 +--
 hw/xen/xen-bus.c              |  8 ++--
 io/channel-command.c          |  6 +--
 io/channel-file.c             |  3 +-
 io/channel-socket.c           |  3 +-
 migration/rdma.c              | 16 ++++----
 tests/unit/test-aio.c         | 27 +------------
 tests/unit/test-bdrv-drain.c  |  1 -
 tests/unit/test-fdmon-epoll.c | 73 -----------------------------------
 util/aio-posix.c              | 20 +++-------
 util/aio-win32.c              |  8 +---
 util/async.c                  |  3 +-
 util/fdmon-epoll.c            | 18 +++------
 util/fdmon-io_uring.c         |  8 +---
 util/fdmon-poll.c             |  3 +-
 util/main-loop.c              |  7 ++--
 util/qemu-coroutine-io.c      |  7 ++--
 util/vhost-user-server.c      | 11 +++---
 tests/unit/meson.build        |  3 --
 35 files changed, 82 insertions(+), 295 deletions(-)
 delete mode 100644 tests/unit/test-fdmon-epoll.c

diff --git a/include/block/aio.h b/include/block/aio.h
index 543717f294..bb38f0753f 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -231,8 +231,6 @@ struct AioContext {
      */
     QEMUTimerListGroup tlg;
 
-    int external_disable_cnt;
-
     /* Number of AioHandlers without .io_poll() */
     int poll_disable_cnt;
 
@@ -475,7 +473,6 @@ bool aio_poll(AioContext *ctx, bool blocking);
  */
 void aio_set_fd_handler(AioContext *ctx,
                         int fd,
-                        bool is_external,
                         IOHandler *io_read,
                         IOHandler *io_write,
                         AioPollFn *io_poll,
@@ -491,7 +488,6 @@ void aio_set_fd_handler(AioContext *ctx,
  */
 void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *notifier,
-                            bool is_external,
                             EventNotifierHandler *io_read,
                             AioPollFn *io_poll,
                             EventNotifierHandler *io_poll_ready);
@@ -620,59 +616,6 @@ static inline void aio_timer_init(AioContext *ctx,
  */
 int64_t aio_compute_timeout(AioContext *ctx);
 
-/**
- * aio_disable_external:
- * @ctx: the aio context
- *
- * Disable the further processing of external clients.
- */
-static inline void aio_disable_external(AioContext *ctx)
-{
-    qatomic_inc(&ctx->external_disable_cnt);
-}
-
-/**
- * aio_enable_external:
- * @ctx: the aio context
- *
- * Enable the processing of external clients.
- */
-static inline void aio_enable_external(AioContext *ctx)
-{
-    int old;
-
-    old = qatomic_fetch_dec(&ctx->external_disable_cnt);
-    assert(old > 0);
-    if (old == 1) {
-        /* Kick event loop so it re-arms file descriptors */
-        aio_notify(ctx);
-    }
-}
-
-/**
- * aio_external_disabled:
- * @ctx: the aio context
- *
- * Return true if the external clients are disabled.
- */
-static inline bool aio_external_disabled(AioContext *ctx)
-{
-    return qatomic_read(&ctx->external_disable_cnt);
-}
-
-/**
- * aio_node_check:
- * @ctx: the aio context
- * @is_external: Whether or not the checked node is an external event source.
- *
- * Check if the node's is_external flag is okay to be polled by the ctx at this
- * moment. True means green light.
- */
-static inline bool aio_node_check(AioContext *ctx, bool is_external)
-{
-    return !is_external || !qatomic_read(&ctx->external_disable_cnt);
-}
-
 /**
  * aio_co_schedule:
  * @ctx: the aio context
diff --git a/util/aio-posix.h b/util/aio-posix.h
index 80b927c7f4..4264c518be 100644
--- a/util/aio-posix.h
+++ b/util/aio-posix.h
@@ -38,7 +38,6 @@ struct AioHandler {
 #endif
     int64_t poll_idle_timeout; /* when to stop userspace polling */
     bool poll_ready; /* has polling detected an event? */
-    bool is_external;
 };
 
 /* Add a handler to a ready list */
diff --git a/block.c b/block.c
index d79a52ca74..608c99a219 100644
--- a/block.c
+++ b/block.c
@@ -7268,9 +7268,6 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
         bs->drv->bdrv_detach_aio_context(bs);
     }
 
-    if (bs->quiesce_counter) {
-        aio_enable_external(bs->aio_context);
-    }
     bs->aio_context = NULL;
 }
 
@@ -7280,10 +7277,6 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
     BdrvAioNotifier *ban, *ban_tmp;
     GLOBAL_STATE_CODE();
 
-    if (bs->quiesce_counter) {
-        aio_disable_external(new_context);
-    }
-
     bs->aio_context = new_context;
 
     if (bs->drv && bs->drv->bdrv_attach_aio_context) {
diff --git a/block/blkio.c b/block/blkio.c
index 0cdc99a729..72117fa005 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -306,23 +306,18 @@ static void blkio_attach_aio_context(BlockDriverState *bs,
 {
     BDRVBlkioState *s = bs->opaque;
 
-    aio_set_fd_handler(new_context,
-                       s->completion_fd,
-                       false,
-                       blkio_completion_fd_read,
-                       NULL,
+    aio_set_fd_handler(new_context, s->completion_fd,
+                       blkio_completion_fd_read, NULL,
                        blkio_completion_fd_poll,
-                       blkio_completion_fd_poll_ready,
-                       bs);
+                       blkio_completion_fd_poll_ready, bs);
 }
 
 static void blkio_detach_aio_context(BlockDriverState *bs)
 {
     BDRVBlkioState *s = bs->opaque;
 
-    aio_set_fd_handler(bdrv_get_aio_context(bs),
-                       s->completion_fd,
-                       false, NULL, NULL, NULL, NULL, NULL);
+    aio_set_fd_handler(bdrv_get_aio_context(bs), s->completion_fd, NULL, NULL,
+                       NULL, NULL, NULL);
 }
 
 /* Call with s->blkio_lock held to submit I/O after enqueuing a new request */
diff --git a/block/curl.c b/block/curl.c
index 8bb39a134e..0fc42d03d7 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -132,7 +132,7 @@ static gboolean curl_drop_socket(void *key, void *value, void *opaque)
     CURLSocket *socket = value;
     BDRVCURLState *s = socket->s;
 
-    aio_set_fd_handler(s->aio_context, socket->fd, false,
+    aio_set_fd_handler(s->aio_context, socket->fd,
                        NULL, NULL, NULL, NULL, NULL);
     return true;
 }
@@ -180,20 +180,20 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     trace_curl_sock_cb(action, (int)fd);
     switch (action) {
         case CURL_POLL_IN:
-            aio_set_fd_handler(s->aio_context, fd, false,
+            aio_set_fd_handler(s->aio_context, fd,
                                curl_multi_do, NULL, NULL, NULL, socket);
             break;
         case CURL_POLL_OUT:
-            aio_set_fd_handler(s->aio_context, fd, false,
+            aio_set_fd_handler(s->aio_context, fd,
                                NULL, curl_multi_do, NULL, NULL, socket);
             break;
         case CURL_POLL_INOUT:
-            aio_set_fd_handler(s->aio_context, fd, false,
+            aio_set_fd_handler(s->aio_context, fd,
                                curl_multi_do, curl_multi_do,
                                NULL, NULL, socket);
             break;
         case CURL_POLL_REMOVE:
-            aio_set_fd_handler(s->aio_context, fd, false,
+            aio_set_fd_handler(s->aio_context, fd,
                                NULL, NULL, NULL, NULL, NULL);
             break;
     }
diff --git a/block/export/fuse.c b/block/export/fuse.c
index 65a7f4d723..5c75c9407e 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -84,7 +84,7 @@ static void fuse_export_drained_begin(void *opaque)
     FuseExport *exp = opaque;
 
     aio_set_fd_handler(exp->common.ctx,
-                       fuse_session_fd(exp->fuse_session), false,
+                       fuse_session_fd(exp->fuse_session),
                        NULL, NULL, NULL, NULL, NULL);
     exp->fd_handler_set_up = false;
 }
@@ -97,7 +97,7 @@ static void fuse_export_drained_end(void *opaque)
     exp->common.ctx = blk_get_aio_context(exp->common.blk);
 
     aio_set_fd_handler(exp->common.ctx,
-                       fuse_session_fd(exp->fuse_session), false,
+                       fuse_session_fd(exp->fuse_session),
                        read_from_fuse_export, NULL, NULL, NULL, exp);
     exp->fd_handler_set_up = true;
 }
@@ -270,7 +270,7 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
     g_hash_table_insert(exports, g_strdup(mountpoint), NULL);
 
     aio_set_fd_handler(exp->common.ctx,
-                       fuse_session_fd(exp->fuse_session), false,
+                       fuse_session_fd(exp->fuse_session),
                        read_from_fuse_export, NULL, NULL, NULL, exp);
     exp->fd_handler_set_up = true;
 
@@ -320,7 +320,7 @@ static void fuse_export_shutdown(BlockExport *blk_exp)
 
         if (exp->fd_handler_set_up) {
             aio_set_fd_handler(exp->common.ctx,
-                               fuse_session_fd(exp->fuse_session), false,
+                               fuse_session_fd(exp->fuse_session),
                                NULL, NULL, NULL, NULL, NULL);
             exp->fd_handler_set_up = false;
         }
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 611430afda..048bdcbfb6 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -137,7 +137,7 @@ static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
     }
 
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
-                       false, on_vduse_vq_kick, NULL, NULL, NULL, vq);
+                       on_vduse_vq_kick, NULL, NULL, NULL, vq);
     /* Make sure we don't miss any kick afer reconnecting */
     eventfd_write(vduse_queue_get_fd(vq), 1);
 }
@@ -151,7 +151,7 @@ static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
         return;
     }
 
-    aio_set_fd_handler(vblk_exp->export.ctx, fd, false,
+    aio_set_fd_handler(vblk_exp->export.ctx, fd,
                        NULL, NULL, NULL, NULL, NULL);
 }
 
@@ -170,7 +170,7 @@ static void on_vduse_dev_kick(void *opaque)
 static void vduse_blk_attach_ctx(VduseBlkExport *vblk_exp, AioContext *ctx)
 {
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
-                       false, on_vduse_dev_kick, NULL, NULL, NULL,
+                       on_vduse_dev_kick, NULL, NULL, NULL,
                        vblk_exp->dev);
 
     /* Virtqueues are handled by vduse_blk_drained_end() */
@@ -179,7 +179,7 @@ static void vduse_blk_attach_ctx(VduseBlkExport *vblk_exp, AioContext *ctx)
 static void vduse_blk_detach_ctx(VduseBlkExport *vblk_exp)
 {
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
-                       false, NULL, NULL, NULL, NULL, NULL);
+                       NULL, NULL, NULL, NULL, NULL);
 
     /* Virtqueues are handled by vduse_blk_drained_begin() */
 }
@@ -364,7 +364,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         vduse_dev_setup_queue(vblk_exp->dev, i, queue_size);
     }
 
-    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), false,
+    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev),
                        on_vduse_dev_kick, NULL, NULL, NULL, vblk_exp->dev);
 
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
diff --git a/block/io.c b/block/io.c
index 4f9fe2f808..9affddb3a0 100644
--- a/block/io.c
+++ b/block/io.c
@@ -361,7 +361,6 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
 
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
-        aio_disable_external(bdrv_get_aio_context(bs));
         bdrv_parent_drained_begin(bs, parent);
         if (bs->drv && bs->drv->bdrv_drain_begin) {
             bs->drv->bdrv_drain_begin(bs);
@@ -414,7 +413,6 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
             bs->drv->bdrv_drain_end(bs);
         }
         bdrv_parent_drained_end(bs, parent);
-        aio_enable_external(bdrv_get_aio_context(bs));
     }
 }
 
diff --git a/block/io_uring.c b/block/io_uring.c
index 973e15d876..3a07215ded 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -399,7 +399,7 @@ int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
 
 void luring_detach_aio_context(LuringState *s, AioContext *old_context)
 {
-    aio_set_fd_handler(old_context, s->ring.ring_fd, false,
+    aio_set_fd_handler(old_context, s->ring.ring_fd,
                        NULL, NULL, NULL, NULL, s);
     qemu_bh_delete(s->completion_bh);
     s->aio_context = NULL;
@@ -409,7 +409,7 @@ void luring_attach_aio_context(LuringState *s, AioContext *new_context)
 {
     s->aio_context = new_context;
     s->completion_bh = aio_bh_new(new_context, qemu_luring_completion_bh, s);
-    aio_set_fd_handler(s->aio_context, s->ring.ring_fd, false,
+    aio_set_fd_handler(s->aio_context, s->ring.ring_fd,
                        qemu_luring_completion_cb, NULL,
                        qemu_luring_poll_cb, qemu_luring_poll_ready, s);
 }
diff --git a/block/iscsi.c b/block/iscsi.c
index 9fc0bed90b..34f97ab646 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -363,7 +363,6 @@ iscsi_set_events(IscsiLun *iscsilun)
 
     if (ev != iscsilun->events) {
         aio_set_fd_handler(iscsilun->aio_context, iscsi_get_fd(iscsi),
-                           false,
                            (ev & POLLIN) ? iscsi_process_read : NULL,
                            (ev & POLLOUT) ? iscsi_process_write : NULL,
                            NULL, NULL,
@@ -1540,7 +1539,7 @@ static void iscsi_detach_aio_context(BlockDriverState *bs)
     IscsiLun *iscsilun = bs->opaque;
 
     aio_set_fd_handler(iscsilun->aio_context, iscsi_get_fd(iscsilun->iscsi),
-                       false, NULL, NULL, NULL, NULL, NULL);
+                       NULL, NULL, NULL, NULL, NULL);
     iscsilun->events = 0;
 
     if (iscsilun->nop_timer) {
diff --git a/block/linux-aio.c b/block/linux-aio.c
index d2cfb7f523..d4a9e21a11 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -438,7 +438,7 @@ int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
 
 void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context)
 {
-    aio_set_event_notifier(old_context, &s->e, false, NULL, NULL, NULL);
+    aio_set_event_notifier(old_context, &s->e, NULL, NULL, NULL);
     qemu_bh_delete(s->completion_bh);
     s->aio_context = NULL;
 }
@@ -447,7 +447,7 @@ void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context)
 {
     s->aio_context = new_context;
     s->completion_bh = aio_bh_new(new_context, qemu_laio_completion_bh, s);
-    aio_set_event_notifier(new_context, &s->e, false,
+    aio_set_event_notifier(new_context, &s->e,
                            qemu_laio_completion_cb,
                            qemu_laio_poll_cb,
                            qemu_laio_poll_ready);
diff --git a/block/nfs.c b/block/nfs.c
index 006045d71a..8f89ece69f 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -195,7 +195,6 @@ static void nfs_set_events(NFSClient *client)
     int ev = nfs_which_events(client->context);
     if (ev != client->events) {
         aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
-                           false,
                            (ev & POLLIN) ? nfs_process_read : NULL,
                            (ev & POLLOUT) ? nfs_process_write : NULL,
                            NULL, NULL, client);
@@ -373,7 +372,7 @@ static void nfs_detach_aio_context(BlockDriverState *bs)
     NFSClient *client = bs->opaque;
 
     aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
-                       false, NULL, NULL, NULL, NULL, NULL);
+                       NULL, NULL, NULL, NULL, NULL);
     client->events = 0;
 }
 
@@ -391,7 +390,7 @@ static void nfs_client_close(NFSClient *client)
     if (client->context) {
         qemu_mutex_lock(&client->mutex);
         aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
-                           false, NULL, NULL, NULL, NULL, NULL);
+                           NULL, NULL, NULL, NULL, NULL);
         qemu_mutex_unlock(&client->mutex);
         if (client->fh) {
             nfs_close(client->context, client->fh);
diff --git a/block/nvme.c b/block/nvme.c
index 5b744c2bda..17937d398d 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -862,7 +862,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     }
     aio_set_event_notifier(bdrv_get_aio_context(bs),
                            &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, nvme_handle_event, nvme_poll_cb,
+                           nvme_handle_event, nvme_poll_cb,
                            nvme_poll_ready);
 
     if (!nvme_identify(bs, namespace, errp)) {
@@ -948,7 +948,7 @@ static void nvme_close(BlockDriverState *bs)
     g_free(s->queues);
     aio_set_event_notifier(bdrv_get_aio_context(bs),
                            &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, NULL, NULL, NULL);
+                           NULL, NULL, NULL);
     event_notifier_cleanup(&s->irq_notifier[MSIX_SHARED_IRQ_IDX]);
     qemu_vfio_pci_unmap_bar(s->vfio, 0, s->bar0_wo_map,
                             0, sizeof(NvmeBar) + NVME_DOORBELL_SIZE);
@@ -1546,7 +1546,7 @@ static void nvme_detach_aio_context(BlockDriverState *bs)
 
     aio_set_event_notifier(bdrv_get_aio_context(bs),
                            &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, NULL, NULL, NULL);
+                           NULL, NULL, NULL);
 }
 
 static void nvme_attach_aio_context(BlockDriverState *bs,
@@ -1556,7 +1556,7 @@ static void nvme_attach_aio_context(BlockDriverState *bs,
 
     s->aio_context = new_context;
     aio_set_event_notifier(new_context, &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, nvme_handle_event, nvme_poll_cb,
+                           nvme_handle_event, nvme_poll_cb,
                            nvme_poll_ready);
 
     for (unsigned i = 0; i < s->queue_count; i++) {
diff --git a/block/ssh.c b/block/ssh.c
index b3b3352075..2748253d4a 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1019,7 +1019,7 @@ static void restart_coroutine(void *opaque)
     AioContext *ctx = bdrv_get_aio_context(bs);
 
     trace_ssh_restart_coroutine(restart->co);
-    aio_set_fd_handler(ctx, s->sock, false, NULL, NULL, NULL, NULL, NULL);
+    aio_set_fd_handler(ctx, s->sock, NULL, NULL, NULL, NULL, NULL);
 
     aio_co_wake(restart->co);
 }
@@ -1049,7 +1049,7 @@ static coroutine_fn void co_yield(BDRVSSHState *s, BlockDriverState *bs)
     trace_ssh_co_yield(s->sock, rd_handler, wr_handler);
 
     aio_set_fd_handler(bdrv_get_aio_context(bs), s->sock,
-                       false, rd_handler, wr_handler, NULL, NULL, &restart);
+                       rd_handler, wr_handler, NULL, NULL, &restart);
     qemu_coroutine_yield();
     trace_ssh_co_yield_back(s->sock);
 }
diff --git a/block/win32-aio.c b/block/win32-aio.c
index ee87d6048f..6327861e1d 100644
--- a/block/win32-aio.c
+++ b/block/win32-aio.c
@@ -174,7 +174,7 @@ int win32_aio_attach(QEMUWin32AIOState *aio, HANDLE hfile)
 void win32_aio_detach_aio_context(QEMUWin32AIOState *aio,
                                   AioContext *old_context)
 {
-    aio_set_event_notifier(old_context, &aio->e, false, NULL, NULL, NULL);
+    aio_set_event_notifier(old_context, &aio->e, NULL, NULL, NULL);
     aio->aio_ctx = NULL;
 }
 
@@ -182,8 +182,8 @@ void win32_aio_attach_aio_context(QEMUWin32AIOState *aio,
                                   AioContext *new_context)
 {
     aio->aio_ctx = new_context;
-    aio_set_event_notifier(new_context, &aio->e, false,
-                           win32_aio_completion_cb, NULL, NULL);
+    aio_set_event_notifier(new_context, &aio->e, win32_aio_completion_cb,
+                           NULL, NULL);
 }
 
 QEMUWin32AIOState *win32_aio_init(void)
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 6e81bc8791..0b189c6ab8 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -133,7 +133,7 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Xenstore evtchn port init failed");
         return;
     }
-    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), false,
+    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh),
                        xen_xenstore_event, NULL, NULL, NULL, s);
 
     s->impl = xs_impl_create(xen_domid);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9cdad7e550..d48e240c37 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3491,7 +3491,7 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
 
 void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, false,
+    aio_set_event_notifier(ctx, &vq->host_notifier,
                            virtio_queue_host_notifier_read,
                            virtio_queue_host_notifier_aio_poll,
                            virtio_queue_host_notifier_aio_poll_ready);
@@ -3508,14 +3508,14 @@ void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
  */
 void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, false,
+    aio_set_event_notifier(ctx, &vq->host_notifier,
                            virtio_queue_host_notifier_read,
                            NULL, NULL);
 }
 
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, false, NULL, NULL, NULL);
+    aio_set_event_notifier(ctx, &vq->host_notifier, NULL, NULL, NULL);
     /* Test and clear notifier before after disabling event,
      * in case poll callback didn't have time to run. */
     virtio_queue_host_notifier_read(&vq->host_notifier);
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index bf256d4da2..1e08cf027a 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -842,14 +842,14 @@ void xen_device_set_event_channel_context(XenDevice *xendev,
     }
 
     if (channel->ctx)
-        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), false,
+        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
                            NULL, NULL, NULL, NULL, NULL);
 
     channel->ctx = ctx;
     if (ctx) {
         aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
-                           false, xen_device_event, NULL, xen_device_poll,
-                           NULL, channel);
+                           xen_device_event, NULL, xen_device_poll, NULL,
+                           channel);
     }
 }
 
@@ -923,7 +923,7 @@ void xen_device_unbind_event_channel(XenDevice *xendev,
 
     QLIST_REMOVE(channel, list);
 
-    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), false,
+    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
                        NULL, NULL, NULL, NULL, NULL);
 
     if (qemu_xen_evtchn_unbind(channel->xeh, channel->local_port) < 0) {
diff --git a/io/channel-command.c b/io/channel-command.c
index e7edd091af..7ed726c802 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -337,10 +337,8 @@ static void qio_channel_command_set_aio_fd_handler(QIOChannel *ioc,
                                                    void *opaque)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
-    aio_set_fd_handler(ctx, cioc->readfd, false,
-                       io_read, NULL, NULL, NULL, opaque);
-    aio_set_fd_handler(ctx, cioc->writefd, false,
-                       NULL, io_write, NULL, NULL, opaque);
+    aio_set_fd_handler(ctx, cioc->readfd, io_read, NULL, NULL, NULL, opaque);
+    aio_set_fd_handler(ctx, cioc->writefd, NULL, io_write, NULL, NULL, opaque);
 }
 
 
diff --git a/io/channel-file.c b/io/channel-file.c
index d76663e6ae..8b5821f452 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -198,8 +198,7 @@ static void qio_channel_file_set_aio_fd_handler(QIOChannel *ioc,
                                                 void *opaque)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
-    aio_set_fd_handler(ctx, fioc->fd, false, io_read, io_write,
-                       NULL, NULL, opaque);
+    aio_set_fd_handler(ctx, fioc->fd, io_read, io_write, NULL, NULL, opaque);
 }
 
 static GSource *qio_channel_file_create_watch(QIOChannel *ioc,
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b0ea7d48b3..d99945ebec 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -899,8 +899,7 @@ static void qio_channel_socket_set_aio_fd_handler(QIOChannel *ioc,
                                                   void *opaque)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
-    aio_set_fd_handler(ctx, sioc->fd, false,
-                       io_read, io_write, NULL, NULL, opaque);
+    aio_set_fd_handler(ctx, sioc->fd, io_read, io_write, NULL, NULL, opaque);
 }
 
 static GSource *qio_channel_socket_create_watch(QIOChannel *ioc,
diff --git a/migration/rdma.c b/migration/rdma.c
index 0af5e944f0..4149662fc6 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3105,15 +3105,15 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
     if (io_read) {
-        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
-                           false, io_read, io_write, NULL, NULL, opaque);
-        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
-                           false, io_read, io_write, NULL, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd, io_read,
+                           io_write, NULL, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd, io_read,
+                           io_write, NULL, NULL, opaque);
     } else {
-        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
-                           false, io_read, io_write, NULL, NULL, opaque);
-        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
-                           false, io_read, io_write, NULL, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd, io_read,
+                           io_write, NULL, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd, io_read,
+                           io_write, NULL, NULL, opaque);
     }
 }
 
diff --git a/tests/unit/test-aio.c b/tests/unit/test-aio.c
index 321d7ab01a..519440eed3 100644
--- a/tests/unit/test-aio.c
+++ b/tests/unit/test-aio.c
@@ -130,7 +130,7 @@ static void *test_acquire_thread(void *opaque)
 static void set_event_notifier(AioContext *ctx, EventNotifier *notifier,
                                EventNotifierHandler *handler)
 {
-    aio_set_event_notifier(ctx, notifier, false, handler, NULL, NULL);
+    aio_set_event_notifier(ctx, notifier, handler, NULL, NULL);
 }
 
 static void dummy_notifier_read(EventNotifier *n)
@@ -383,30 +383,6 @@ static void test_flush_event_notifier(void)
     event_notifier_cleanup(&data.e);
 }
 
-static void test_aio_external_client(void)
-{
-    int i, j;
-
-    for (i = 1; i < 3; i++) {
-        EventNotifierTestData data = { .n = 0, .active = 10, .auto_set = true };
-        event_notifier_init(&data.e, false);
-        aio_set_event_notifier(ctx, &data.e, true, event_ready_cb, NULL, NULL);
-        event_notifier_set(&data.e);
-        for (j = 0; j < i; j++) {
-            aio_disable_external(ctx);
-        }
-        for (j = 0; j < i; j++) {
-            assert(!aio_poll(ctx, false));
-            assert(event_notifier_test_and_clear(&data.e));
-            event_notifier_set(&data.e);
-            aio_enable_external(ctx);
-        }
-        assert(aio_poll(ctx, false));
-        set_event_notifier(ctx, &data.e, NULL);
-        event_notifier_cleanup(&data.e);
-    }
-}
-
 static void test_wait_event_notifier_noflush(void)
 {
     EventNotifierTestData data = { .n = 0 };
@@ -935,7 +911,6 @@ int main(int argc, char **argv)
     g_test_add_func("/aio/event/wait",              test_wait_event_notifier);
     g_test_add_func("/aio/event/wait/no-flush-cb",  test_wait_event_notifier_noflush);
     g_test_add_func("/aio/event/flush",             test_flush_event_notifier);
-    g_test_add_func("/aio/external-client",         test_aio_external_client);
     g_test_add_func("/aio/timer/schedule",          test_timer_schedule);
 
     g_test_add_func("/aio/coroutine/queue-chaining", test_queue_chaining);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index d9d3807062..5c89169e46 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -435,7 +435,6 @@ static void test_graph_change_drain_all(void)
 
     g_assert_cmpint(bs_b->quiesce_counter, ==, 0);
     g_assert_cmpint(b_s->drain_count, ==, 0);
-    g_assert_cmpint(qemu_get_aio_context()->external_disable_cnt, ==, 0);
 
     bdrv_unref(bs_b);
     blk_unref(blk_b);
diff --git a/tests/unit/test-fdmon-epoll.c b/tests/unit/test-fdmon-epoll.c
deleted file mode 100644
index ef5a856d09..0000000000
--- a/tests/unit/test-fdmon-epoll.c
+++ /dev/null
@@ -1,73 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * fdmon-epoll tests
- *
- * Copyright (c) 2020 Red Hat, Inc.
- */
-
-#include "qemu/osdep.h"
-#include "block/aio.h"
-#include "qapi/error.h"
-#include "qemu/main-loop.h"
-
-static AioContext *ctx;
-
-static void dummy_fd_handler(EventNotifier *notifier)
-{
-    event_notifier_test_and_clear(notifier);
-}
-
-static void add_event_notifiers(EventNotifier *notifiers, size_t n)
-{
-    for (size_t i = 0; i < n; i++) {
-        event_notifier_init(&notifiers[i], false);
-        aio_set_event_notifier(ctx, &notifiers[i], false,
-                               dummy_fd_handler, NULL, NULL);
-    }
-}
-
-static void remove_event_notifiers(EventNotifier *notifiers, size_t n)
-{
-    for (size_t i = 0; i < n; i++) {
-        aio_set_event_notifier(ctx, &notifiers[i], false, NULL, NULL, NULL);
-        event_notifier_cleanup(&notifiers[i]);
-    }
-}
-
-/* Check that fd handlers work when external clients are disabled */
-static void test_external_disabled(void)
-{
-    EventNotifier notifiers[100];
-
-    /* fdmon-epoll is only enabled when many fd handlers are registered */
-    add_event_notifiers(notifiers, G_N_ELEMENTS(notifiers));
-
-    event_notifier_set(&notifiers[0]);
-    assert(aio_poll(ctx, true));
-
-    aio_disable_external(ctx);
-    event_notifier_set(&notifiers[0]);
-    assert(aio_poll(ctx, true));
-    aio_enable_external(ctx);
-
-    remove_event_notifiers(notifiers, G_N_ELEMENTS(notifiers));
-}
-
-int main(int argc, char **argv)
-{
-    /*
-     * This code relies on the fact that fdmon-io_uring disables itself when
-     * the glib main loop is in use. The main loop uses fdmon-poll and upgrades
-     * to fdmon-epoll when the number of fds exceeds a threshold.
-     */
-    qemu_init_main_loop(&error_fatal);
-    ctx = qemu_get_aio_context();
-
-    while (g_main_context_iteration(NULL, false)) {
-        /* Do nothing */
-    }
-
-    g_test_init(&argc, &argv, NULL);
-    g_test_add_func("/fdmon-epoll/external-disabled", test_external_disabled);
-    return g_test_run();
-}
diff --git a/util/aio-posix.c b/util/aio-posix.c
index a8be940f76..934b1bbb85 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -99,7 +99,6 @@ static bool aio_remove_fd_handler(AioContext *ctx, AioHandler *node)
 
 void aio_set_fd_handler(AioContext *ctx,
                         int fd,
-                        bool is_external,
                         IOHandler *io_read,
                         IOHandler *io_write,
                         AioPollFn *io_poll,
@@ -144,7 +143,6 @@ void aio_set_fd_handler(AioContext *ctx,
         new_node->io_poll = io_poll;
         new_node->io_poll_ready = io_poll_ready;
         new_node->opaque = opaque;
-        new_node->is_external = is_external;
 
         if (is_new) {
             new_node->pfd.fd = fd;
@@ -196,12 +194,11 @@ static void aio_set_fd_poll(AioContext *ctx, int fd,
 
 void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *notifier,
-                            bool is_external,
                             EventNotifierHandler *io_read,
                             AioPollFn *io_poll,
                             EventNotifierHandler *io_poll_ready)
 {
-    aio_set_fd_handler(ctx, event_notifier_get_fd(notifier), is_external,
+    aio_set_fd_handler(ctx, event_notifier_get_fd(notifier),
                        (IOHandler *)io_read, NULL, io_poll,
                        (IOHandler *)io_poll_ready, notifier);
 }
@@ -285,13 +282,11 @@ bool aio_pending(AioContext *ctx)
 
         /* TODO should this check poll ready? */
         revents = node->pfd.revents & node->pfd.events;
-        if (revents & (G_IO_IN | G_IO_HUP | G_IO_ERR) && node->io_read &&
-            aio_node_check(ctx, node->is_external)) {
+        if (revents & (G_IO_IN | G_IO_HUP | G_IO_ERR) && node->io_read) {
             result = true;
             break;
         }
-        if (revents & (G_IO_OUT | G_IO_ERR) && node->io_write &&
-            aio_node_check(ctx, node->is_external)) {
+        if (revents & (G_IO_OUT | G_IO_ERR) && node->io_write) {
             result = true;
             break;
         }
@@ -350,9 +345,7 @@ static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
         QLIST_INSERT_HEAD(&ctx->poll_aio_handlers, node, node_poll);
     }
     if (!QLIST_IS_INSERTED(node, node_deleted) &&
-        poll_ready && revents == 0 &&
-        aio_node_check(ctx, node->is_external) &&
-        node->io_poll_ready) {
+        poll_ready && revents == 0 && node->io_poll_ready) {
         node->io_poll_ready(node->opaque);
 
         /*
@@ -364,7 +357,6 @@ static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
 
     if (!QLIST_IS_INSERTED(node, node_deleted) &&
         (revents & (G_IO_IN | G_IO_HUP | G_IO_ERR)) &&
-        aio_node_check(ctx, node->is_external) &&
         node->io_read) {
         node->io_read(node->opaque);
 
@@ -375,7 +367,6 @@ static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
     }
     if (!QLIST_IS_INSERTED(node, node_deleted) &&
         (revents & (G_IO_OUT | G_IO_ERR)) &&
-        aio_node_check(ctx, node->is_external) &&
         node->io_write) {
         node->io_write(node->opaque);
         progress = true;
@@ -436,8 +427,7 @@ static bool run_poll_handlers_once(AioContext *ctx,
     AioHandler *tmp;
 
     QLIST_FOREACH_SAFE(node, &ctx->poll_aio_handlers, node_poll, tmp) {
-        if (aio_node_check(ctx, node->is_external) &&
-            node->io_poll(node->opaque)) {
+        if (node->io_poll(node->opaque)) {
             aio_add_poll_ready_handler(ready_list, node);
 
             node->poll_idle_timeout = now + POLL_IDLE_INTERVAL_NS;
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 6bded009a4..948ef47a4d 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -32,7 +32,6 @@ struct AioHandler {
     GPollFD pfd;
     int deleted;
     void *opaque;
-    bool is_external;
     QLIST_ENTRY(AioHandler) node;
 };
 
@@ -64,7 +63,6 @@ static void aio_remove_fd_handler(AioContext *ctx, AioHandler *node)
 
 void aio_set_fd_handler(AioContext *ctx,
                         int fd,
-                        bool is_external,
                         IOHandler *io_read,
                         IOHandler *io_write,
                         AioPollFn *io_poll,
@@ -111,7 +109,6 @@ void aio_set_fd_handler(AioContext *ctx,
         node->opaque = opaque;
         node->io_read = io_read;
         node->io_write = io_write;
-        node->is_external = is_external;
 
         if (io_read) {
             bitmask |= FD_READ | FD_ACCEPT | FD_CLOSE;
@@ -135,7 +132,6 @@ void aio_set_fd_handler(AioContext *ctx,
 
 void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *e,
-                            bool is_external,
                             EventNotifierHandler *io_notify,
                             AioPollFn *io_poll,
                             EventNotifierHandler *io_poll_ready)
@@ -161,7 +157,6 @@ void aio_set_event_notifier(AioContext *ctx,
             node->e = e;
             node->pfd.fd = (uintptr_t)event_notifier_get_handle(e);
             node->pfd.events = G_IO_IN;
-            node->is_external = is_external;
             QLIST_INSERT_HEAD_RCU(&ctx->aio_handlers, node, node);
 
             g_source_add_poll(&ctx->source, &node->pfd);
@@ -368,8 +363,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
     /* fill fd sets */
     count = 0;
     QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
-        if (!node->deleted && node->io_notify
-            && aio_node_check(ctx, node->is_external)) {
+        if (!node->deleted && node->io_notify) {
             assert(count < MAXIMUM_WAIT_OBJECTS);
             events[count++] = event_notifier_get_handle(node->e);
         }
diff --git a/util/async.c b/util/async.c
index 21016a1ac7..be0726038e 100644
--- a/util/async.c
+++ b/util/async.c
@@ -377,7 +377,7 @@ aio_ctx_finalize(GSource     *source)
         g_free(bh);
     }
 
-    aio_set_event_notifier(ctx, &ctx->notifier, false, NULL, NULL, NULL);
+    aio_set_event_notifier(ctx, &ctx->notifier, NULL, NULL, NULL);
     event_notifier_cleanup(&ctx->notifier);
     qemu_rec_mutex_destroy(&ctx->lock);
     qemu_lockcnt_destroy(&ctx->list_lock);
@@ -561,7 +561,6 @@ AioContext *aio_context_new(Error **errp)
     QSLIST_INIT(&ctx->scheduled_coroutines);
 
     aio_set_event_notifier(ctx, &ctx->notifier,
-                           false,
                            aio_context_notifier_cb,
                            aio_context_notifier_poll,
                            aio_context_notifier_poll_ready);
diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
index 1683aa1105..6b6a1a91f8 100644
--- a/util/fdmon-epoll.c
+++ b/util/fdmon-epoll.c
@@ -64,11 +64,6 @@ static int fdmon_epoll_wait(AioContext *ctx, AioHandlerList *ready_list,
     int i, ret = 0;
     struct epoll_event events[128];
 
-    /* Fall back while external clients are disabled */
-    if (qatomic_read(&ctx->external_disable_cnt)) {
-        return fdmon_poll_ops.wait(ctx, ready_list, timeout);
-    }
-
     if (timeout > 0) {
         ret = qemu_poll_ns(&pfd, 1, timeout);
         if (ret > 0) {
@@ -133,13 +128,12 @@ bool fdmon_epoll_try_upgrade(AioContext *ctx, unsigned npfd)
         return false;
     }
 
-    /* Do not upgrade while external clients are disabled */
-    if (qatomic_read(&ctx->external_disable_cnt)) {
-        return false;
-    }
-
-    if (npfd < EPOLL_ENABLE_THRESHOLD) {
-        return false;
+    if (npfd >= EPOLL_ENABLE_THRESHOLD) {
+        if (fdmon_epoll_try_enable(ctx)) {
+            return true;
+        } else {
+            fdmon_epoll_disable(ctx);
+        }
     }
 
     /* The list must not change while we add fds to epoll */
diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
index ab43052dd7..17ec18b7bd 100644
--- a/util/fdmon-io_uring.c
+++ b/util/fdmon-io_uring.c
@@ -276,11 +276,6 @@ static int fdmon_io_uring_wait(AioContext *ctx, AioHandlerList *ready_list,
     unsigned wait_nr = 1; /* block until at least one cqe is ready */
     int ret;
 
-    /* Fall back while external clients are disabled */
-    if (qatomic_read(&ctx->external_disable_cnt)) {
-        return fdmon_poll_ops.wait(ctx, ready_list, timeout);
-    }
-
     if (timeout == 0) {
         wait_nr = 0; /* non-blocking */
     } else if (timeout > 0) {
@@ -315,8 +310,7 @@ static bool fdmon_io_uring_need_wait(AioContext *ctx)
         return true;
     }
 
-    /* Are we falling back to fdmon-poll? */
-    return qatomic_read(&ctx->external_disable_cnt);
+    return false;
 }
 
 static const FDMonOps fdmon_io_uring_ops = {
diff --git a/util/fdmon-poll.c b/util/fdmon-poll.c
index 5fe3b47865..17df917cf9 100644
--- a/util/fdmon-poll.c
+++ b/util/fdmon-poll.c
@@ -65,8 +65,7 @@ static int fdmon_poll_wait(AioContext *ctx, AioHandlerList *ready_list,
     assert(npfd == 0);
 
     QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
-        if (!QLIST_IS_INSERTED(node, node_deleted) && node->pfd.events
-                && aio_node_check(ctx, node->is_external)) {
+        if (!QLIST_IS_INSERTED(node, node_deleted) && node->pfd.events) {
             add_pollfd(node);
         }
     }
diff --git a/util/main-loop.c b/util/main-loop.c
index e180c85145..3e43a9cd38 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -642,14 +642,13 @@ void qemu_set_fd_handler(int fd,
                          void *opaque)
 {
     iohandler_init();
-    aio_set_fd_handler(iohandler_ctx, fd, false,
-                       fd_read, fd_write, NULL, NULL, opaque);
+    aio_set_fd_handler(iohandler_ctx, fd, fd_read, fd_write, NULL, NULL,
+                       opaque);
 }
 
 void event_notifier_set_handler(EventNotifier *e,
                                 EventNotifierHandler *handler)
 {
     iohandler_init();
-    aio_set_event_notifier(iohandler_ctx, e, false,
-                           handler, NULL, NULL);
+    aio_set_event_notifier(iohandler_ctx, e, handler, NULL, NULL);
 }
diff --git a/util/qemu-coroutine-io.c b/util/qemu-coroutine-io.c
index d791932d63..364f4d5abf 100644
--- a/util/qemu-coroutine-io.c
+++ b/util/qemu-coroutine-io.c
@@ -74,8 +74,7 @@ typedef struct {
 static void fd_coroutine_enter(void *opaque)
 {
     FDYieldUntilData *data = opaque;
-    aio_set_fd_handler(data->ctx, data->fd, false,
-                       NULL, NULL, NULL, NULL, NULL);
+    aio_set_fd_handler(data->ctx, data->fd, NULL, NULL, NULL, NULL, NULL);
     qemu_coroutine_enter(data->co);
 }
 
@@ -87,7 +86,7 @@ void coroutine_fn yield_until_fd_readable(int fd)
     data.ctx = qemu_get_current_aio_context();
     data.co = qemu_coroutine_self();
     data.fd = fd;
-    aio_set_fd_handler(
-        data.ctx, fd, false, fd_coroutine_enter, NULL, NULL, NULL, &data);
+    aio_set_fd_handler(data.ctx, fd, fd_coroutine_enter, NULL, NULL, NULL,
+                       &data);
     qemu_coroutine_yield();
 }
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 332aea9306..9ba19121a2 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -278,7 +278,7 @@ set_watch(VuDev *vu_dev, int fd, int vu_evt,
         vu_fd_watch->fd = fd;
         vu_fd_watch->cb = cb;
         qemu_socket_set_nonblock(fd);
-        aio_set_fd_handler(server->ioc->ctx, fd, false, kick_handler,
+        aio_set_fd_handler(server->ioc->ctx, fd, kick_handler,
                            NULL, NULL, NULL, vu_fd_watch);
         vu_fd_watch->vu_dev = vu_dev;
         vu_fd_watch->pvt = pvt;
@@ -299,8 +299,7 @@ static void remove_watch(VuDev *vu_dev, int fd)
     if (!vu_fd_watch) {
         return;
     }
-    aio_set_fd_handler(server->ioc->ctx, fd, false,
-                       NULL, NULL, NULL, NULL, NULL);
+    aio_set_fd_handler(server->ioc->ctx, fd, NULL, NULL, NULL, NULL, NULL);
 
     QTAILQ_REMOVE(&server->vu_fd_watches, vu_fd_watch, next);
     g_free(vu_fd_watch);
@@ -362,7 +361,7 @@ void vhost_user_server_stop(VuServer *server)
         VuFdWatch *vu_fd_watch;
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, false,
+            aio_set_fd_handler(server->ctx, vu_fd_watch->fd,
                                NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
@@ -403,7 +402,7 @@ void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx)
     qio_channel_attach_aio_context(server->ioc, ctx);
 
     QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-        aio_set_fd_handler(ctx, vu_fd_watch->fd, false, kick_handler, NULL,
+        aio_set_fd_handler(ctx, vu_fd_watch->fd, kick_handler, NULL,
                            NULL, NULL, vu_fd_watch);
     }
 
@@ -417,7 +416,7 @@ void vhost_user_server_detach_aio_context(VuServer *server)
         VuFdWatch *vu_fd_watch;
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
-            aio_set_fd_handler(server->ctx, vu_fd_watch->fd, false,
+            aio_set_fd_handler(server->ctx, vu_fd_watch->fd,
                                NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 3bc78d8660..b33298a444 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -122,9 +122,6 @@ if have_block
   if nettle.found() or gcrypt.found()
     tests += {'test-crypto-pbkdf': [io]}
   endif
-  if config_host_data.get('CONFIG_EPOLL_CREATE1')
-    tests += {'test-fdmon-epoll': [testblock]}
-  endif
 endif
 
 if have_system
-- 
2.39.2


