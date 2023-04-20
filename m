Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB36E92FE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524136.814820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppScX-0003eD-NB; Thu, 20 Apr 2023 11:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524136.814820; Thu, 20 Apr 2023 11:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppScX-0003b2-JA; Thu, 20 Apr 2023 11:38:37 +0000
Received: by outflank-mailman (input) for mailman id 524136;
 Thu, 20 Apr 2023 11:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onos=AL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppScV-0001nK-Cf
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:38:35 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0e935c8-df6f-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:38:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-Ag2DDzwlMYCeNFYqlalYBQ-1; Thu, 20 Apr 2023 07:38:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BF321C08976;
 Thu, 20 Apr 2023 11:38:28 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FBD1C16024;
 Thu, 20 Apr 2023 11:38:27 +0000 (UTC)
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
X-Inumbo-ID: e0e935c8-df6f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681990712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bLg6uTzP7Qgt6lQ3xKdY10AY3Nt3xLke1uGL1u9ShU=;
	b=APo/zLq4WecTRndfbXeZ96HbecFzPnDdiY2zExDS7D9BF/bda666K4lZry2iK6ZOkYU2sL
	LbuBZ1r6QfAxuFkKoC/mcqi+pJkT2zRgKOmuHZ7qP9BFmTnBu5CZ3g/Hoorvxf/Xc3TnQ5
	nQG3NSL+EgmroC5WSo20NjdZ/XTOtOg=
X-MC-Unique: Ag2DDzwlMYCeNFYqlalYBQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Juan Quintela <quintela@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Julia Suvorova <jusual@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	Hanna Reitz <hreitz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	eesposit@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 06/20] block/export: wait for vhost-user-blk requests when draining
Date: Thu, 20 Apr 2023 07:37:18 -0400
Message-Id: <20230420113732.336620-7-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

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


