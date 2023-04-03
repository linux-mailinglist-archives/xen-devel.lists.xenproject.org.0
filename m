Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574376D5071
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517548.803032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwo-0004K1-Sq; Mon, 03 Apr 2023 18:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517548.803032; Mon, 03 Apr 2023 18:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwo-0004HS-Q3; Mon, 03 Apr 2023 18:30:30 +0000
Received: by outflank-mailman (input) for mailman id 517548;
 Mon, 03 Apr 2023 18:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOwn-0004HH-HE
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9addabbf-d24d-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 20:30:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-gJweyXgPPBCNaCJfjwIa3g-1; Mon, 03 Apr 2023 14:30:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DAFE3C20EE3;
 Mon,  3 Apr 2023 18:30:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63861440D8;
 Mon,  3 Apr 2023 18:30:21 +0000 (UTC)
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
X-Inumbo-ID: 9addabbf-d24d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bLg6uTzP7Qgt6lQ3xKdY10AY3Nt3xLke1uGL1u9ShU=;
	b=Pq2O9MN9GXcdwkjsOEXC2ygoZmqJr/kEU4W7AK0q6j9jVTcqTNpCNN+GkCurWt9ZTXcZDr
	cWsXfXcmXuSV2JbzMfZGjFywQYe5D67mOdFgj/SCkcgvvMP2r1WwRHh09k/JSLX69u8JT+
	coX+sYvJTKC3zXKhJeSkaOVEOAzsNp0=
X-MC-Unique: gJweyXgPPBCNaCJfjwIa3g-1
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
Subject: [PATCH 05/13] block/export: wait for vhost-user-blk requests when draining
Date: Mon,  3 Apr 2023 14:29:56 -0400
Message-Id: <20230403183004.347205-6-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Each vhost-user-blk request runs in a coroutine. When the BlockBackend
enters a drained section we need to enter a quiescent state. Currently
any in-flight requests race with bdrv_drained_begin() because it is
unaware of vhost-user-blk requests.

When blk_co_preadv/pwritev()/etc returns it wakes the
bdrv_drained_begin() thread but vhost-user-blk request processing has
not yet finished. The request coroutine continues executing while the
main loop thread thinks it is in a drained section.

One example where this is unsafe is for blk_set_aio_context() where
bdrv_drained_begin() is called before .aio_context_detached() and
.aio_context_attach(). If request coroutines are still running after
bdrv_drained_begin(), then the AioContext could change underneath them
and they race with new requests processed in the new AioContext. This
could lead to virtqueue corruption, for example.

(This example is theoretical, I came across this while reading the
code and have not tried to reproduce it.)

It's easy to make bdrv_drained_begin() wait for in-flight requests: add
a .drained_poll() callback that checks the VuServer's in-flight counter.
VuServer just needs an API that returns true when there are requests in
flight. The in-flight counter needs to be atomic.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/vhost-user-server.h     |  4 +++-
 block/export/vhost-user-blk-server.c | 19 +++++++++++++++++++
 util/vhost-user-server.c             | 14 ++++++++++----
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
index bc0ac9ddb6..b1c1cda886 100644
--- a/include/qemu/vhost-user-server.h
+++ b/include/qemu/vhost-user-server.h
@@ -40,8 +40,9 @@ typedef struct {
     int max_queues;
     const VuDevIface *vu_iface;
 
+    unsigned int in_flight; /* atomic */
+
     /* Protected by ctx lock */
-    unsigned int in_flight;
     bool wait_idle;
     VuDev vu_dev;
     QIOChannel *ioc; /* The I/O channel with the client */
@@ -62,6 +63,7 @@ void vhost_user_server_stop(VuServer *server);
 
 void vhost_user_server_inc_in_flight(VuServer *server);
 void vhost_user_server_dec_in_flight(VuServer *server);
+bool vhost_user_server_has_in_flight(VuServer *server);
 
 void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx);
 void vhost_user_server_detach_aio_context(VuServer *server);
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index e93f2ed6b4..dbf5207162 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -254,6 +254,22 @@ static void vu_blk_exp_request_shutdown(BlockExport *exp)
     vhost_user_server_stop(&vexp->vu_server);
 }
 
+/*
+ * Ensures that bdrv_drained_begin() waits until in-flight requests complete.
+ *
+ * Called with vexp->export.ctx acquired.
+ */
+static bool vu_blk_drained_poll(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+
+    return vhost_user_server_has_in_flight(&vexp->vu_server);
+}
+
+static const BlockDevOps vu_blk_dev_ops = {
+    .drained_poll  = vu_blk_drained_poll,
+};
+
 static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                              Error **errp)
 {
@@ -292,6 +308,7 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     vu_blk_initialize_config(blk_bs(exp->blk), &vexp->blkcfg,
                              logical_block_size, num_queues);
 
+    blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vexp);
 
@@ -299,6 +316,7 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                                  num_queues, &vu_blk_iface, errp)) {
         blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
                                         blk_aio_detach, vexp);
+        blk_set_dev_ops(exp->blk, NULL, NULL);
         g_free(vexp->handler.serial);
         return -EADDRNOTAVAIL;
     }
@@ -312,6 +330,7 @@ static void vu_blk_exp_delete(BlockExport *exp)
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vexp);
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     g_free(vexp->handler.serial);
 }
 
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 1622f8cfb3..2e6b640050 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -78,17 +78,23 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
 void vhost_user_server_inc_in_flight(VuServer *server)
 {
     assert(!server->wait_idle);
-    server->in_flight++;
+    qatomic_inc(&server->in_flight);
 }
 
 void vhost_user_server_dec_in_flight(VuServer *server)
 {
-    server->in_flight--;
-    if (server->wait_idle && !server->in_flight) {
-        aio_co_wake(server->co_trip);
+    if (qatomic_fetch_dec(&server->in_flight) == 1) {
+        if (server->wait_idle) {
+            aio_co_wake(server->co_trip);
+        }
     }
 }
 
+bool vhost_user_server_has_in_flight(VuServer *server)
+{
+    return qatomic_load_acquire(&server->in_flight) > 0;
+}
+
 static bool coroutine_fn
 vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
 {
-- 
2.39.2


