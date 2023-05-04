Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8DF6F74E7
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530068.825399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1Z-0005yj-TL; Thu, 04 May 2023 19:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530068.825399; Thu, 04 May 2023 19:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1Z-0005v2-Nk; Thu, 04 May 2023 19:53:57 +0000
Received: by outflank-mailman (input) for mailman id 530068;
 Thu, 04 May 2023 19:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1Y-0003xx-Bh
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:53:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65cbde11-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:53:54 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-tNtDfOKSMVq3AQX3nRbV7g-1; Thu, 04 May 2023 15:53:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36B9A101A550;
 Thu,  4 May 2023 19:53:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 931081121339;
 Thu,  4 May 2023 19:53:48 +0000 (UTC)
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
X-Inumbo-ID: 65cbde11-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqVEulc+YKH8du/OTtIOC0bNRzxnvgw0ufD9riF8H3c=;
	b=ZXxeazJeqhC4n051eeKdQiY8H06cimgZClzH2ZDzMvw4+Jirga4fZkLq2fKXl3IqTpDd3y
	F7Zfq75R/q9dufnBuyZDMM++8mpT5R6oOl4MJDfAZ4+tF227ZoXve/MGRIhIzwXI1BuYxu
	egnWeY26hjGFsmL2XPrSMDcLZIdGZ5s=
X-MC-Unique: tNtDfOKSMVq3AQX3nRbV7g-1
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
Subject: [PATCH v5 07/21] block/export: wait for vhost-user-blk requests when draining
Date: Thu,  4 May 2023 15:53:13 -0400
Message-Id: <20230504195327.695107-8-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

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
v5:
- Use atomic accesses for in_flight counter in vhost-user-server.c [Kevin]
---
 include/qemu/vhost-user-server.h     |  4 +++-
 block/export/vhost-user-blk-server.c | 13 +++++++++++++
 util/vhost-user-server.c             | 18 ++++++++++++------
 3 files changed, 28 insertions(+), 7 deletions(-)

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
index 841acb36e3..f51a36a14f 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -272,7 +272,20 @@ static void vu_blk_exp_resize(void *opaque)
     vu_config_change_msg(&vexp->vu_server.vu_dev);
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
 static const BlockDevOps vu_blk_dev_ops = {
+    .drained_poll  = vu_blk_drained_poll,
     .resize_cb = vu_blk_exp_resize,
 };
 
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 1622f8cfb3..68c3bf162f 100644
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
@@ -192,13 +198,13 @@ static coroutine_fn void vu_client_trip(void *opaque)
         /* Keep running */
     }
 
-    if (server->in_flight) {
+    if (vhost_user_server_has_in_flight(server)) {
         /* Wait for requests to complete before we can unmap the memory */
         server->wait_idle = true;
         qemu_coroutine_yield();
         server->wait_idle = false;
     }
-    assert(server->in_flight == 0);
+    assert(!vhost_user_server_has_in_flight(server));
 
     vu_deinit(vu_dev);
 
-- 
2.40.1


