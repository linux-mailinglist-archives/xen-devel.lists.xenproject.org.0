Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BA46D506E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517558.803131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOx4-0007Mu-TO; Mon, 03 Apr 2023 18:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517558.803131; Mon, 03 Apr 2023 18:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOx4-0007Fn-KM; Mon, 03 Apr 2023 18:30:46 +0000
Received: by outflank-mailman (input) for mailman id 517558;
 Mon, 03 Apr 2023 18:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOx2-00058E-7u
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a36de5a6-d24d-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 20:30:42 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-fKluM2IgOGOWbZExTvDE9Q-1; Mon, 03 Apr 2023 14:30:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9501101A553;
 Mon,  3 Apr 2023 18:30:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0242166B26;
 Mon,  3 Apr 2023 18:30:33 +0000 (UTC)
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
X-Inumbo-ID: a36de5a6-d24d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kvgpibm7uG8By4vHBOsqesPFxvQEinDBgjjk4WE12qY=;
	b=cTWL+vRTyf9kGd0m6cmuoYc28Vx4UD7RwyLLvHzchBpGTT6VkoKaph4sD/+9WbPPGqreUG
	HCgnsRbV04m6H4h/FQpiR1YRVXVZL8NIicSIlgSDu1NpgjqfkBkya7EPsSs7l9zif+b+or
	tik5MuKYVOOWWM18/47bXu0Dt7FWMqQ=
X-MC-Unique: fKluM2IgOGOWbZExTvDE9Q-1
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
Subject: [PATCH 10/13] block/export: rewrite vduse-blk drain code
Date: Mon,  3 Apr 2023 14:30:01 -0400
Message-Id: <20230403183004.347205-11-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

vduse_blk_detach_ctx() waits for in-flight requests using
AIO_WAIT_WHILE(). This is not allowed according to a comment in
bdrv_set_aio_context_commit():

  /*
   * Take the old AioContex when detaching it from bs.
   * At this point, new_context lock is already acquired, and we are now
   * also taking old_context. This is safe as long as bdrv_detach_aio_context
   * does not call AIO_POLL_WHILE().
   */

Use this opportunity to rewrite the drain code in vduse-blk:

- Use the BlockExport refcount so that vduse_blk_exp_delete() is only
  called when there are no more requests in flight.

- Implement .drained_poll() so in-flight request coroutines are stopped
  by the time .bdrv_detach_aio_context() is called.

- Remove AIO_WAIT_WHILE() from vduse_blk_detach_ctx() to solve the
  .bdrv_detach_aio_context() constraint violation. It's no longer
  needed due to the previous changes.

- Always handle the VDUSE file descriptor, even in drained sections. The
  VDUSE file descriptor doesn't submit I/O, so it's safe to handle it in
  drained sections. This ensures that the VDUSE kernel code gets a fast
  response.

- Suspend virtqueue fd handlers in .drained_begin() and resume them in
  .drained_end(). This eliminates the need for the
  aio_set_fd_handler(is_external=true) flag, which is being removed from
  QEMU.

This is a long list but splitting it into individual commits would
probably lead to git bisect failures - the changes are all related.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/vduse-blk.c | 132 +++++++++++++++++++++++++++------------
 1 file changed, 93 insertions(+), 39 deletions(-)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index f7ae44e3ce..35dc8fcf45 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -31,7 +31,8 @@ typedef struct VduseBlkExport {
     VduseDev *dev;
     uint16_t num_queues;
     char *recon_file;
-    unsigned int inflight;
+    unsigned int inflight; /* atomic */
+    bool vqs_started;
 } VduseBlkExport;
 
 typedef struct VduseBlkReq {
@@ -41,13 +42,24 @@ typedef struct VduseBlkReq {
 
 static void vduse_blk_inflight_inc(VduseBlkExport *vblk_exp)
 {
-    vblk_exp->inflight++;
+    if (qatomic_fetch_inc(&vblk_exp->inflight) == 0) {
+        /* Prevent export from being deleted */
+        aio_context_acquire(vblk_exp->export.ctx);
+        blk_exp_ref(&vblk_exp->export);
+        aio_context_release(vblk_exp->export.ctx);
+    }
 }
 
 static void vduse_blk_inflight_dec(VduseBlkExport *vblk_exp)
 {
-    if (--vblk_exp->inflight == 0) {
+    if (qatomic_fetch_dec(&vblk_exp->inflight) == 1) {
+        /* Wake AIO_WAIT_WHILE() */
         aio_wait_kick();
+
+        /* Now the export can be deleted */
+        aio_context_acquire(vblk_exp->export.ctx);
+        blk_exp_unref(&vblk_exp->export);
+        aio_context_release(vblk_exp->export.ctx);
     }
 }
 
@@ -124,8 +136,12 @@ static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
 {
     VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
 
+    if (!vblk_exp->vqs_started) {
+        return; /* vduse_blk_drained_end() will start vqs later */
+    }
+
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
-                       true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
+                       false, on_vduse_vq_kick, NULL, NULL, NULL, vq);
     /* Make sure we don't miss any kick afer reconnecting */
     eventfd_write(vduse_queue_get_fd(vq), 1);
 }
@@ -133,9 +149,14 @@ static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
 static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
 {
     VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
+    int fd = vduse_queue_get_fd(vq);
 
-    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
-                       true, NULL, NULL, NULL, NULL, NULL);
+    if (fd < 0) {
+        return;
+    }
+
+    aio_set_fd_handler(vblk_exp->export.ctx, fd, false,
+                       NULL, NULL, NULL, NULL, NULL);
 }
 
 static const VduseOps vduse_blk_ops = {
@@ -152,42 +173,19 @@ static void on_vduse_dev_kick(void *opaque)
 
 static void vduse_blk_attach_ctx(VduseBlkExport *vblk_exp, AioContext *ctx)
 {
-    int i;
-
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
-                       true, on_vduse_dev_kick, NULL, NULL, NULL,
+                       false, on_vduse_dev_kick, NULL, NULL, NULL,
                        vblk_exp->dev);
 
-    for (i = 0; i < vblk_exp->num_queues; i++) {
-        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
-        int fd = vduse_queue_get_fd(vq);
-
-        if (fd < 0) {
-            continue;
-        }
-        aio_set_fd_handler(vblk_exp->export.ctx, fd, true,
-                           on_vduse_vq_kick, NULL, NULL, NULL, vq);
-    }
+    /* Virtqueues are handled by vduse_blk_drained_end() */
 }
 
 static void vduse_blk_detach_ctx(VduseBlkExport *vblk_exp)
 {
-    int i;
-
-    for (i = 0; i < vblk_exp->num_queues; i++) {
-        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
-        int fd = vduse_queue_get_fd(vq);
-
-        if (fd < 0) {
-            continue;
-        }
-        aio_set_fd_handler(vblk_exp->export.ctx, fd,
-                           true, NULL, NULL, NULL, NULL, NULL);
-    }
     aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
-                       true, NULL, NULL, NULL, NULL, NULL);
+                       false, NULL, NULL, NULL, NULL, NULL);
 
-    AIO_WAIT_WHILE(vblk_exp->export.ctx, vblk_exp->inflight > 0);
+    /* Virtqueues are handled by vduse_blk_drained_begin() */
 }
 
 
@@ -220,8 +218,55 @@ static void vduse_blk_resize(void *opaque)
                             (char *)&config.capacity);
 }
 
+static void vduse_blk_stop_virtqueues(VduseBlkExport *vblk_exp)
+{
+    for (uint16_t i = 0; i < vblk_exp->num_queues; i++) {
+        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
+        vduse_blk_disable_queue(vblk_exp->dev, vq);
+    }
+
+    vblk_exp->vqs_started = false;
+}
+
+static void vduse_blk_start_virtqueues(VduseBlkExport *vblk_exp)
+{
+    vblk_exp->vqs_started = true;
+
+    for (uint16_t i = 0; i < vblk_exp->num_queues; i++) {
+        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
+        vduse_blk_enable_queue(vblk_exp->dev, vq);
+    }
+}
+
+static void vduse_blk_drained_begin(void *opaque)
+{
+    BlockExport *exp = opaque;
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+
+    vduse_blk_stop_virtqueues(vblk_exp);
+}
+
+static void vduse_blk_drained_end(void *opaque)
+{
+    BlockExport *exp = opaque;
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+
+    vduse_blk_start_virtqueues(vblk_exp);
+}
+
+static bool vduse_blk_drained_poll(void *opaque)
+{
+    BlockExport *exp = opaque;
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+
+    return qatomic_read(&vblk_exp->inflight) > 0;
+}
+
 static const BlockDevOps vduse_block_ops = {
-    .resize_cb = vduse_blk_resize,
+    .resize_cb     = vduse_blk_resize,
+    .drained_begin = vduse_blk_drained_begin,
+    .drained_end   = vduse_blk_drained_end,
+    .drained_poll  = vduse_blk_drained_poll,
 };
 
 static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
@@ -268,6 +313,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     vblk_exp->handler.serial = g_strdup(vblk_opts->serial ?: "");
     vblk_exp->handler.logical_block_size = logical_block_size;
     vblk_exp->handler.writable = opts->writable;
+    vblk_exp->vqs_started = true;
 
     config.capacity =
             cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
@@ -322,14 +368,20 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         vduse_dev_setup_queue(vblk_exp->dev, i, queue_size);
     }
 
-    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), true,
+    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), false,
                        on_vduse_dev_kick, NULL, NULL, NULL, vblk_exp->dev);
 
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vblk_exp);
-
     blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
 
+    /*
+     * We handle draining ourselves using an in-flight counter and by disabling
+     * virtqueue fd handlers. Do not queue BlockBackend requests, they need to
+     * complete so the in-flight counter reaches zero.
+     */
+    blk_set_disable_request_queuing(exp->blk, true);
+
     return 0;
 err:
     vduse_dev_destroy(vblk_exp->dev);
@@ -344,6 +396,9 @@ static void vduse_blk_exp_delete(BlockExport *exp)
     VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
     int ret;
 
+    assert(qatomic_read(&vblk_exp->inflight) == 0);
+
+    vduse_blk_detach_ctx(vblk_exp);
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
     blk_set_dev_ops(exp->blk, NULL, NULL);
@@ -355,13 +410,12 @@ static void vduse_blk_exp_delete(BlockExport *exp)
     g_free(vblk_exp->handler.serial);
 }
 
+/* Called with exp->ctx acquired */
 static void vduse_blk_exp_request_shutdown(BlockExport *exp)
 {
     VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
 
-    aio_context_acquire(vblk_exp->export.ctx);
-    vduse_blk_detach_ctx(vblk_exp);
-    aio_context_acquire(vblk_exp->export.ctx);
+    vduse_blk_stop_virtqueues(vblk_exp);
 }
 
 const BlockExportDriver blk_exp_vduse_blk = {
-- 
2.39.2


