Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D96F74EB
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530072.825414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1d-0006XQ-R4; Thu, 04 May 2023 19:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530072.825414; Thu, 04 May 2023 19:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1d-0006Ta-F1; Thu, 04 May 2023 19:54:01 +0000
Received: by outflank-mailman (input) for mailman id 530072;
 Thu, 04 May 2023 19:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1c-0003xx-Ev
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 686588fd-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:53:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-ZoYT6p5PP2qo_FQgwkpEwA-1; Thu, 04 May 2023 15:53:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 822BD185A78B;
 Thu,  4 May 2023 19:53:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E35D84020960;
 Thu,  4 May 2023 19:53:50 +0000 (UTC)
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
X-Inumbo-ID: 686588fd-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wCNZYyVdjWaoTznBC2Ylnqhccg5NnPq2nFPN+RMgeA=;
	b=gn2qlPFGkA6wq44f0pNjMqZc6MsNtnVMUSDckB9UI1xTHwv6IDfMKvekI7Ys4wOojFka3y
	st6usqnqwFeV5Fh4N8wuAv6YRxmJUyRCjknlVJjLFgATm8oGDryLDytx4GxsDMp46N65WT
	orxFiyYfYSt3UD3Lng0+W9bipT7njbM=
X-MC-Unique: ZoYT6p5PP2qo_FQgwkpEwA-1
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
Subject: [PATCH v5 08/21] block/export: stop using is_external in vhost-user-blk server
Date: Thu,  4 May 2023 15:53:14 -0400
Message-Id: <20230504195327.695107-9-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

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
 block/export/vhost-user-blk-server.c | 28 ++++++++++++++++++++++++++--
 util/vhost-user-server.c             | 10 +++++-----
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index f51a36a14f..81b59761e3 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -212,15 +212,21 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
 {
     VuBlkExport *vexp = opaque;
 
+    /*
+     * The actual attach will happen in vu_blk_drained_end() and we just
+     * restore ctx here.
+     */
     vexp->export.ctx = ctx;
-    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
 }
 
 static void blk_aio_detach(void *opaque)
 {
     VuBlkExport *vexp = opaque;
 
-    vhost_user_server_detach_aio_context(&vexp->vu_server);
+    /*
+     * The actual detach already happened in vu_blk_drained_begin() but from
+     * this point on we must not access ctx anymore.
+     */
     vexp->export.ctx = NULL;
 }
 
@@ -272,6 +278,22 @@ static void vu_blk_exp_resize(void *opaque)
     vu_config_change_msg(&vexp->vu_server.vu_dev);
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
+    vhost_user_server_attach_aio_context(&vexp->vu_server, vexp->export.ctx);
+}
+
 /*
  * Ensures that bdrv_drained_begin() waits until in-flight requests complete.
  *
@@ -285,6 +307,8 @@ static bool vu_blk_drained_poll(void *opaque)
 }
 
 static const BlockDevOps vu_blk_dev_ops = {
+    .drained_begin = vu_blk_drained_begin,
+    .drained_end   = vu_blk_drained_end,
     .drained_poll  = vu_blk_drained_poll,
     .resize_cb = vu_blk_exp_resize,
 };
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 68c3bf162f..a12b2d1bba 100644
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
2.40.1


