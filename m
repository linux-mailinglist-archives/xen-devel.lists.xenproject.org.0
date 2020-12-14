Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC982D9F3C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52465.91879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshy-0003rK-KF; Mon, 14 Dec 2020 18:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52465.91879; Mon, 14 Dec 2020 18:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshx-0003ks-GY; Mon, 14 Dec 2020 18:36:29 +0000
Received: by outflank-mailman (input) for mailman id 52465;
 Mon, 14 Dec 2020 17:06:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O6EJ=FS=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1korJ6-0001xX-BH
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 17:06:44 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d7c0dce5-848f-4709-b476-4e994209fe41;
 Mon, 14 Dec 2020 17:06:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-761DnAutO9qHxmbuLzXzFA-1; Mon, 14 Dec 2020 12:06:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A75508AB3B9;
 Mon, 14 Dec 2020 17:06:22 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72BDC62A25;
 Mon, 14 Dec 2020 17:06:19 +0000 (UTC)
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
X-Inumbo-ID: d7c0dce5-848f-4709-b476-4e994209fe41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607965603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=399Y9fIGtHICB7zQVl2y/q4KwqXDdZ2nv2mnaFw6NX8=;
	b=ZChTdDjNcRvbYd+NUF68br9MV+RSDoVzS55RPFrBdR8jNQHTk+MBVi35kLHmGvR25RIBIv
	1qxJ0eN90i8PlZO+mz2B0OAAi4Ga89Y55VtLcCRvG9J5CPgeIssPk2UZlXyTVRM5YDyZDj
	DJrDhtNGwu/JqgExCOyRsS+UcFbCFiU=
X-MC-Unique: 761DnAutO9qHxmbuLzXzFA-1
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 3/4] nbd/server: Quiesce coroutines on context switch
Date: Mon, 14 Dec 2020 18:05:18 +0100
Message-Id: <20201214170519.223781-4-slp@redhat.com>
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
References: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When switching between AIO contexts we need to me make sure that both
recv_coroutine and send_coroutine are not scheduled to run. Otherwise,
QEMU may crash while attaching the new context with an error like
this one:

aio_co_schedule: Co-routine was already scheduled in 'aio_co_schedule'

To achieve this we need a local implementation of
'qio_channel_readv_all_eof' named 'nbd_read_eof' (a trick already done
by 'nbd/client.c') that allows us to interrupt the operation and to
know when recv_coroutine is yielding.

With this in place, we delegate detaching the AIO context to the
owning context with a BH ('nbd_aio_detach_bh') scheduled using
'aio_wait_bh_oneshot'. This BH signals that we need to quiesce the
channel by setting 'client->quiescing' to 'true', and either waits for
the coroutine to finish using AIO_WAIT_WHILE or, if it's yielding in
'nbd_read_eof', actively enters the coroutine to interrupt it.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900326
Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 120 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 106 insertions(+), 14 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 613ed2634a..7229f487d2 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -132,6 +132,9 @@ struct NBDClient {
     CoMutex send_lock;
     Coroutine *send_coroutine;
 
+    bool read_yielding;
+    bool quiescing;
+
     QTAILQ_ENTRY(NBDClient) next;
     int nb_requests;
     bool closing;
@@ -1352,14 +1355,60 @@ static coroutine_fn int nbd_negotiate(NBDClient *client, Error **errp)
     return 0;
 }
 
-static int nbd_receive_request(QIOChannel *ioc, NBDRequest *request,
+/* nbd_read_eof
+ * Tries to read @size bytes from @ioc. This is a local implementation of
+ * qio_channel_readv_all_eof. We have it here because we need it to be
+ * interruptible and to know when the coroutine is yielding.
+ * Returns 1 on success
+ *         0 on eof, when no data was read (errp is not set)
+ *         negative errno on failure (errp is set)
+ */
+static inline int coroutine_fn
+nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
+{
+    bool partial = false;
+
+    assert(size);
+    while (size > 0) {
+        struct iovec iov = { .iov_base = buffer, .iov_len = size };
+        ssize_t len;
+
+        len = qio_channel_readv(client->ioc, &iov, 1, errp);
+        if (len == QIO_CHANNEL_ERR_BLOCK) {
+            client->read_yielding = true;
+            qio_channel_yield(client->ioc, G_IO_IN);
+            client->read_yielding = false;
+            if (client->quiescing) {
+                return -EAGAIN;
+            }
+            continue;
+        } else if (len < 0) {
+            return -EIO;
+        } else if (len == 0) {
+            if (partial) {
+                error_setg(errp,
+                           "Unexpected end-of-file before all bytes were read");
+                return -EIO;
+            } else {
+                return 0;
+            }
+        }
+
+        partial = true;
+        size -= len;
+        buffer = (uint8_t *) buffer + len;
+    }
+    return 1;
+}
+
+static int nbd_receive_request(NBDClient *client, NBDRequest *request,
                                Error **errp)
 {
     uint8_t buf[NBD_REQUEST_SIZE];
     uint32_t magic;
     int ret;
 
-    ret = nbd_read(ioc, buf, sizeof(buf), "request", errp);
+    ret = nbd_read_eof(client, buf, sizeof(buf), errp);
     if (ret < 0) {
         return ret;
     }
@@ -1480,11 +1529,37 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
 
     QTAILQ_FOREACH(client, &exp->clients, next) {
         qio_channel_attach_aio_context(client->ioc, ctx);
+
+        assert(client->recv_coroutine == NULL);
+        assert(client->send_coroutine == NULL);
+
+        if (client->quiescing) {
+            client->quiescing = false;
+            nbd_client_receive_next_request(client);
+        }
+    }
+}
+
+static void nbd_aio_detach_bh(void *opaque)
+{
+    NBDExport *exp = opaque;
+    NBDClient *client;
+
+    QTAILQ_FOREACH(client, &exp->clients, next) {
+        qio_channel_detach_aio_context(client->ioc);
+        client->quiescing = true;
+
         if (client->recv_coroutine) {
-            aio_co_schedule(ctx, client->recv_coroutine);
+            if (client->read_yielding) {
+                qemu_aio_coroutine_enter(exp->common.ctx,
+                                         client->recv_coroutine);
+            } else {
+                AIO_WAIT_WHILE(exp->common.ctx, client->recv_coroutine != NULL);
+            }
         }
+
         if (client->send_coroutine) {
-            aio_co_schedule(ctx, client->send_coroutine);
+            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine != NULL);
         }
     }
 }
@@ -1492,13 +1567,10 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
 static void blk_aio_detach(void *opaque)
 {
     NBDExport *exp = opaque;
-    NBDClient *client;
 
     trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
 
-    QTAILQ_FOREACH(client, &exp->clients, next) {
-        qio_channel_detach_aio_context(client->ioc);
-    }
+    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
 
     exp->common.ctx = NULL;
 }
@@ -2151,20 +2223,23 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
 
 /* nbd_co_receive_request
  * Collect a client request. Return 0 if request looks valid, -EIO to drop
- * connection right away, and any other negative value to report an error to
- * the client (although the caller may still need to disconnect after reporting
- * the error).
+ * connection right away, -EAGAIN to indicate we were interrupted and the
+ * channel should be quiesced, and any other negative value to report an error
+ * to the client (although the caller may still need to disconnect after
+ * reporting the error).
  */
 static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
                                   Error **errp)
 {
     NBDClient *client = req->client;
     int valid_flags;
+    int ret;
 
     g_assert(qemu_in_coroutine());
     assert(client->recv_coroutine == qemu_coroutine_self());
-    if (nbd_receive_request(client->ioc, request, errp) < 0) {
-        return -EIO;
+    ret = nbd_receive_request(client, request, errp);
+    if (ret < 0) {
+        return  ret;
     }
 
     trace_nbd_co_receive_request_decode_type(request->handle, request->type,
@@ -2507,6 +2582,17 @@ static coroutine_fn void nbd_trip(void *opaque)
         return;
     }
 
+    if (client->quiescing) {
+        /*
+         * We're switching between AIO contexts. Don't attempt to receive a new
+         * request and kick the main context which may be waiting for us.
+         */
+        nbd_client_put(client);
+        client->recv_coroutine = NULL;
+        aio_wait_kick();
+        return;
+    }
+
     req = nbd_request_get(client);
     ret = nbd_co_receive_request(req, &request, &local_err);
     client->recv_coroutine = NULL;
@@ -2519,6 +2605,11 @@ static coroutine_fn void nbd_trip(void *opaque)
         goto done;
     }
 
+    if (ret == -EAGAIN) {
+        assert(client->quiescing);
+        goto done;
+    }
+
     nbd_client_receive_next_request(client);
     if (ret == -EIO) {
         goto disconnect;
@@ -2565,7 +2656,8 @@ disconnect:
 
 static void nbd_client_receive_next_request(NBDClient *client)
 {
-    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUESTS) {
+    if (!client->recv_coroutine && client->nb_requests < MAX_NBD_REQUESTS &&
+        !client->quiescing) {
         nbd_client_get(client);
         client->recv_coroutine = qemu_coroutine_create(nbd_trip, client);
         aio_co_schedule(client->exp->common.ctx, client->recv_coroutine);
-- 
2.26.2


