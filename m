Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39148C927
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 18:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256777.440825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hEV-0004q8-9x; Wed, 12 Jan 2022 17:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256777.440825; Wed, 12 Jan 2022 17:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hEV-0004nM-6K; Wed, 12 Jan 2022 17:16:23 +0000
Received: by outflank-mailman (input) for mailman id 256777;
 Wed, 12 Jan 2022 17:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmOE=R4=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1n7hET-0004n6-9o
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 17:16:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 589c4a82-73cb-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 18:16:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-icBw9g1EPZqkz7e7h-WsJw-1; Wed, 12 Jan 2022 12:16:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A890D81EE62;
 Wed, 12 Jan 2022 17:16:01 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85B042DE99;
 Wed, 12 Jan 2022 17:15:37 +0000 (UTC)
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
X-Inumbo-ID: 589c4a82-73cb-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642007774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECSmZIc7ds1+QJoIhivTGdF+uFDXzJPrynOZl8hUQyI=;
	b=VeAtMXEWUTzCCfKC7/jLrt6kog4WOeWJ5xrca2UBEFrVZOS458Twv/KW2EiGoIxCK1zlIa
	kMbu1r8drzRecVfox6Tj18ApFatv4qKrGN/2X7YeHvopt5Pf0FpRIvPXiXQVlsT+t+D79J
	wlzhbuon1j0BNPAv1rQY5Hw0fA5PYBA=
X-MC-Unique: icBw9g1EPZqkz7e7h-WsJw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Coiby Xu <Coiby.Xu@gmail.com>,
	Fam Zheng <fam@euphon.net>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	qemu-block@nongnu.org,
	Julia Suvorova <jusual@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 1/6] aio-posix: split poll check from ready handler
Date: Wed, 12 Jan 2022 17:13:57 +0000
Message-Id: <20220112171402.112183-2-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
References: <20220112171402.112183-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Adaptive polling measures the execution time of the polling check plus
handlers called when a polled event becomes ready. Handlers can take a
significant amount of time, making it look like polling was running for
a long time when in fact the event handler was running for a long time.

For example, on Linux the io_submit(2) syscall invoked when a virtio-blk
device's virtqueue becomes ready can take 10s of microseconds. This
can exceed the default polling interval (32 microseconds) and cause
adaptive polling to stop polling.

By excluding the handler's execution time from the polling check we make
the adaptive polling calculation more accurate. As a result, the event
loop now stays in polling mode where previously it would have fallen
back to file descriptor monitoring.

The following data was collected with virtio-blk num-queues=2
event_idx=off using an IOThread. Before:

168k IOPS, IOThread syscalls:

  9837.115 ( 0.020 ms): IO iothread1/620155 io_submit(ctx_id: 140512552468480, nr: 16, iocbpp: 0x7fcb9f937db0)    = 16
  9837.158 ( 0.002 ms): IO iothread1/620155 write(fd: 103, buf: 0x556a2ef71b88, count: 8)                         = 8
  9837.161 ( 0.001 ms): IO iothread1/620155 write(fd: 104, buf: 0x556a2ef71b88, count: 8)                         = 8
  9837.163 ( 0.001 ms): IO iothread1/620155 ppoll(ufds: 0x7fcb90002800, nfds: 4, tsp: 0x7fcb9f1342d0, sigsetsize: 8) = 3
  9837.164 ( 0.001 ms): IO iothread1/620155 read(fd: 107, buf: 0x7fcb9f939cc0, count: 512)                        = 8
  9837.174 ( 0.001 ms): IO iothread1/620155 read(fd: 105, buf: 0x7fcb9f939cc0, count: 512)                        = 8
  9837.176 ( 0.001 ms): IO iothread1/620155 read(fd: 106, buf: 0x7fcb9f939cc0, count: 512)                        = 8
  9837.209 ( 0.035 ms): IO iothread1/620155 io_submit(ctx_id: 140512552468480, nr: 32, iocbpp: 0x7fca7d0cebe0)    = 32

174k IOPS (+3.6%), IOThread syscalls:

  9809.566 ( 0.036 ms): IO iothread1/623061 io_submit(ctx_id: 140539805028352, nr: 32, iocbpp: 0x7fd0cdd62be0)    = 32
  9809.625 ( 0.001 ms): IO iothread1/623061 write(fd: 103, buf: 0x5647cfba5f58, count: 8)                         = 8
  9809.627 ( 0.002 ms): IO iothread1/623061 write(fd: 104, buf: 0x5647cfba5f58, count: 8)                         = 8
  9809.663 ( 0.036 ms): IO iothread1/623061 io_submit(ctx_id: 140539805028352, nr: 32, iocbpp: 0x7fd0d0388b50)    = 32

Notice that ppoll(2) and eventfd read(2) syscalls are eliminated because
the IOThread stays in polling mode instead of falling back to file
descriptor monitoring.

As usual, polling is not implemented on Windows so this patch ignores
the new io_poll_read() callback in aio-win32.c.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20211207132336.36627-2-stefanha@redhat.com

[Fixed up aio_set_event_notifier() calls in
tests/unit/test-fdmon-epoll.c added after this series was queued.
--Stefan]

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/aio.h           |  4 +-
 util/aio-posix.h              |  1 +
 block/curl.c                  | 11 +++--
 block/export/fuse.c           |  4 +-
 block/io_uring.c              | 19 ++++----
 block/iscsi.c                 |  4 +-
 block/linux-aio.c             | 16 ++++---
 block/nfs.c                   |  6 +--
 block/nvme.c                  | 51 +++++++++++++-------
 block/ssh.c                   |  4 +-
 block/win32-aio.c             |  4 +-
 hw/virtio/virtio.c            | 16 ++++---
 hw/xen/xen-bus.c              |  6 +--
 io/channel-command.c          |  6 ++-
 io/channel-file.c             |  3 +-
 io/channel-socket.c           |  3 +-
 migration/rdma.c              |  8 ++--
 tests/unit/test-aio.c         |  4 +-
 tests/unit/test-fdmon-epoll.c |  4 +-
 util/aio-posix.c              | 89 ++++++++++++++++++++++++++---------
 util/aio-win32.c              |  4 +-
 util/async.c                  | 10 +++-
 util/main-loop.c              |  4 +-
 util/qemu-coroutine-io.c      |  5 +-
 util/vhost-user-server.c      | 11 +++--
 25 files changed, 193 insertions(+), 104 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 47fbe9d81f..5634173b12 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -469,6 +469,7 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_read,
                         IOHandler *io_write,
                         AioPollFn *io_poll,
+                        IOHandler *io_poll_ready,
                         void *opaque);
 
 /* Set polling begin/end callbacks for a file descriptor that has already been
@@ -490,7 +491,8 @@ void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *notifier,
                             bool is_external,
                             EventNotifierHandler *io_read,
-                            AioPollFn *io_poll);
+                            AioPollFn *io_poll,
+                            EventNotifierHandler *io_poll_ready);
 
 /* Set polling begin/end callbacks for an event notifier that has already been
  * registered with aio_set_event_notifier.  Do nothing if the event notifier is
diff --git a/util/aio-posix.h b/util/aio-posix.h
index c80c04506a..7f2c37a684 100644
--- a/util/aio-posix.h
+++ b/util/aio-posix.h
@@ -24,6 +24,7 @@ struct AioHandler {
     IOHandler *io_read;
     IOHandler *io_write;
     AioPollFn *io_poll;
+    IOHandler *io_poll_ready;
     IOHandler *io_poll_begin;
     IOHandler *io_poll_end;
     void *opaque;
diff --git a/block/curl.c b/block/curl.c
index 4a8ae2b269..6a6cd72975 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -125,7 +125,7 @@ static gboolean curl_drop_socket(void *key, void *value, void *opaque)
     BDRVCURLState *s = socket->s;
 
     aio_set_fd_handler(s->aio_context, socket->fd, false,
-                       NULL, NULL, NULL, NULL);
+                       NULL, NULL, NULL, NULL, NULL);
     return true;
 }
 
@@ -173,19 +173,20 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     switch (action) {
         case CURL_POLL_IN:
             aio_set_fd_handler(s->aio_context, fd, false,
-                               curl_multi_do, NULL, NULL, socket);
+                               curl_multi_do, NULL, NULL, NULL, socket);
             break;
         case CURL_POLL_OUT:
             aio_set_fd_handler(s->aio_context, fd, false,
-                               NULL, curl_multi_do, NULL, socket);
+                               NULL, curl_multi_do, NULL, NULL, socket);
             break;
         case CURL_POLL_INOUT:
             aio_set_fd_handler(s->aio_context, fd, false,
-                               curl_multi_do, curl_multi_do, NULL, socket);
+                               curl_multi_do, curl_multi_do,
+                               NULL, NULL, socket);
             break;
         case CURL_POLL_REMOVE:
             aio_set_fd_handler(s->aio_context, fd, false,
-                               NULL, NULL, NULL, NULL);
+                               NULL, NULL, NULL, NULL, NULL);
             break;
     }
 
diff --git a/block/export/fuse.c b/block/export/fuse.c
index 823c126d23..6710d8aed8 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -223,7 +223,7 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
 
     aio_set_fd_handler(exp->common.ctx,
                        fuse_session_fd(exp->fuse_session), true,
-                       read_from_fuse_export, NULL, NULL, exp);
+                       read_from_fuse_export, NULL, NULL, NULL, exp);
     exp->fd_handler_set_up = true;
 
     return 0;
@@ -267,7 +267,7 @@ static void fuse_export_shutdown(BlockExport *blk_exp)
         if (exp->fd_handler_set_up) {
             aio_set_fd_handler(exp->common.ctx,
                                fuse_session_fd(exp->fuse_session), true,
-                               NULL, NULL, NULL, NULL);
+                               NULL, NULL, NULL, NULL, NULL);
             exp->fd_handler_set_up = false;
         }
     }
diff --git a/block/io_uring.c b/block/io_uring.c
index dfa475cc87..782afdb433 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -292,12 +292,14 @@ static bool qemu_luring_poll_cb(void *opaque)
 {
     LuringState *s = opaque;
 
-    if (io_uring_cq_ready(&s->ring)) {
-        luring_process_completions_and_submit(s);
-        return true;
-    }
+    return io_uring_cq_ready(&s->ring);
+}
 
-    return false;
+static void qemu_luring_poll_ready(void *opaque)
+{
+    LuringState *s = opaque;
+
+    luring_process_completions_and_submit(s);
 }
 
 static void ioq_init(LuringQueue *io_q)
@@ -402,8 +404,8 @@ int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
 
 void luring_detach_aio_context(LuringState *s, AioContext *old_context)
 {
-    aio_set_fd_handler(old_context, s->ring.ring_fd, false, NULL, NULL, NULL,
-                       s);
+    aio_set_fd_handler(old_context, s->ring.ring_fd, false,
+                       NULL, NULL, NULL, NULL, s);
     qemu_bh_delete(s->completion_bh);
     s->aio_context = NULL;
 }
@@ -413,7 +415,8 @@ void luring_attach_aio_context(LuringState *s, AioContext *new_context)
     s->aio_context = new_context;
     s->completion_bh = aio_bh_new(new_context, qemu_luring_completion_bh, s);
     aio_set_fd_handler(s->aio_context, s->ring.ring_fd, false,
-                       qemu_luring_completion_cb, NULL, qemu_luring_poll_cb, s);
+                       qemu_luring_completion_cb, NULL,
+                       qemu_luring_poll_cb, qemu_luring_poll_ready, s);
 }
 
 LuringState *luring_init(Error **errp)
diff --git a/block/iscsi.c b/block/iscsi.c
index 57aa07a40d..51f2a5eeaa 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -363,7 +363,7 @@ iscsi_set_events(IscsiLun *iscsilun)
                            false,
                            (ev & POLLIN) ? iscsi_process_read : NULL,
                            (ev & POLLOUT) ? iscsi_process_write : NULL,
-                           NULL,
+                           NULL, NULL,
                            iscsilun);
         iscsilun->events = ev;
     }
@@ -1534,7 +1534,7 @@ static void iscsi_detach_aio_context(BlockDriverState *bs)
     IscsiLun *iscsilun = bs->opaque;
 
     aio_set_fd_handler(iscsilun->aio_context, iscsi_get_fd(iscsilun->iscsi),
-                       false, NULL, NULL, NULL, NULL);
+                       false, NULL, NULL, NULL, NULL, NULL);
     iscsilun->events = 0;
 
     if (iscsilun->nop_timer) {
diff --git a/block/linux-aio.c b/block/linux-aio.c
index f53ae72e21..4c423fcccf 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -263,12 +263,15 @@ static bool qemu_laio_poll_cb(void *opaque)
     LinuxAioState *s = container_of(e, LinuxAioState, e);
     struct io_event *events;
 
-    if (!io_getevents_peek(s->ctx, &events)) {
-        return false;
-    }
+    return io_getevents_peek(s->ctx, &events);
+}
+
+static void qemu_laio_poll_ready(EventNotifier *opaque)
+{
+    EventNotifier *e = opaque;
+    LinuxAioState *s = container_of(e, LinuxAioState, e);
 
     qemu_laio_process_completions_and_submit(s);
-    return true;
 }
 
 static void ioq_init(LaioQueue *io_q)
@@ -427,7 +430,7 @@ int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
 
 void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context)
 {
-    aio_set_event_notifier(old_context, &s->e, false, NULL, NULL);
+    aio_set_event_notifier(old_context, &s->e, false, NULL, NULL, NULL);
     qemu_bh_delete(s->completion_bh);
     s->aio_context = NULL;
 }
@@ -438,7 +441,8 @@ void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context)
     s->completion_bh = aio_bh_new(new_context, qemu_laio_completion_bh, s);
     aio_set_event_notifier(new_context, &s->e, false,
                            qemu_laio_completion_cb,
-                           qemu_laio_poll_cb);
+                           qemu_laio_poll_cb,
+                           qemu_laio_poll_ready);
 }
 
 LinuxAioState *laio_init(Error **errp)
diff --git a/block/nfs.c b/block/nfs.c
index 577aea1d22..444c40b458 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -197,7 +197,7 @@ static void nfs_set_events(NFSClient *client)
                            false,
                            (ev & POLLIN) ? nfs_process_read : NULL,
                            (ev & POLLOUT) ? nfs_process_write : NULL,
-                           NULL, client);
+                           NULL, NULL, client);
 
     }
     client->events = ev;
@@ -372,7 +372,7 @@ static void nfs_detach_aio_context(BlockDriverState *bs)
     NFSClient *client = bs->opaque;
 
     aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
-                       false, NULL, NULL, NULL, NULL);
+                       false, NULL, NULL, NULL, NULL, NULL);
     client->events = 0;
 }
 
@@ -390,7 +390,7 @@ static void nfs_client_close(NFSClient *client)
     if (client->context) {
         qemu_mutex_lock(&client->mutex);
         aio_set_fd_handler(client->aio_context, nfs_get_fd(client->context),
-                           false, NULL, NULL, NULL, NULL);
+                           false, NULL, NULL, NULL, NULL, NULL);
         qemu_mutex_unlock(&client->mutex);
         if (client->fh) {
             nfs_close(client->context, client->fh);
diff --git a/block/nvme.c b/block/nvme.c
index fa360b9b3c..dd20de3865 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -605,10 +605,8 @@ out:
     return ret;
 }
 
-static bool nvme_poll_queue(NVMeQueuePair *q)
+static void nvme_poll_queue(NVMeQueuePair *q)
 {
-    bool progress = false;
-
     const size_t cqe_offset = q->cq.head * NVME_CQ_ENTRY_BYTES;
     NvmeCqe *cqe = (NvmeCqe *)&q->cq.queue[cqe_offset];
 
@@ -619,30 +617,23 @@ static bool nvme_poll_queue(NVMeQueuePair *q)
      * cannot race with itself.
      */
     if ((le16_to_cpu(cqe->status) & 0x1) == q->cq_phase) {
-        return false;
+        return;
     }
 
     qemu_mutex_lock(&q->lock);
     while (nvme_process_completion(q)) {
         /* Keep polling */
-        progress = true;
     }
     qemu_mutex_unlock(&q->lock);
-
-    return progress;
 }
 
-static bool nvme_poll_queues(BDRVNVMeState *s)
+static void nvme_poll_queues(BDRVNVMeState *s)
 {
-    bool progress = false;
     int i;
 
     for (i = 0; i < s->queue_count; i++) {
-        if (nvme_poll_queue(s->queues[i])) {
-            progress = true;
-        }
+        nvme_poll_queue(s->queues[i]);
     }
-    return progress;
 }
 
 static void nvme_handle_event(EventNotifier *n)
@@ -703,8 +694,30 @@ static bool nvme_poll_cb(void *opaque)
     EventNotifier *e = opaque;
     BDRVNVMeState *s = container_of(e, BDRVNVMeState,
                                     irq_notifier[MSIX_SHARED_IRQ_IDX]);
+    int i;
 
-    return nvme_poll_queues(s);
+    for (i = 0; i < s->queue_count; i++) {
+        NVMeQueuePair *q = s->queues[i];
+        const size_t cqe_offset = q->cq.head * NVME_CQ_ENTRY_BYTES;
+        NvmeCqe *cqe = (NvmeCqe *)&q->cq.queue[cqe_offset];
+
+        /*
+         * q->lock isn't needed because nvme_process_completion() only runs in
+         * the event loop thread and cannot race with itself.
+         */
+        if ((le16_to_cpu(cqe->status) & 0x1) != q->cq_phase) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static void nvme_poll_ready(EventNotifier *e)
+{
+    BDRVNVMeState *s = container_of(e, BDRVNVMeState,
+                                    irq_notifier[MSIX_SHARED_IRQ_IDX]);
+
+    nvme_poll_queues(s);
 }
 
 static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
@@ -839,7 +852,8 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     }
     aio_set_event_notifier(bdrv_get_aio_context(bs),
                            &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, nvme_handle_event, nvme_poll_cb);
+                           false, nvme_handle_event, nvme_poll_cb,
+                           nvme_poll_ready);
 
     if (!nvme_identify(bs, namespace, errp)) {
         ret = -EIO;
@@ -924,7 +938,7 @@ static void nvme_close(BlockDriverState *bs)
     g_free(s->queues);
     aio_set_event_notifier(bdrv_get_aio_context(bs),
                            &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, NULL, NULL);
+                           false, NULL, NULL, NULL);
     event_notifier_cleanup(&s->irq_notifier[MSIX_SHARED_IRQ_IDX]);
     qemu_vfio_pci_unmap_bar(s->vfio, 0, s->bar0_wo_map,
                             0, sizeof(NvmeBar) + NVME_DOORBELL_SIZE);
@@ -1520,7 +1534,7 @@ static void nvme_detach_aio_context(BlockDriverState *bs)
 
     aio_set_event_notifier(bdrv_get_aio_context(bs),
                            &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, NULL, NULL);
+                           false, NULL, NULL, NULL);
 }
 
 static void nvme_attach_aio_context(BlockDriverState *bs,
@@ -1530,7 +1544,8 @@ static void nvme_attach_aio_context(BlockDriverState *bs,
 
     s->aio_context = new_context;
     aio_set_event_notifier(new_context, &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
-                           false, nvme_handle_event, nvme_poll_cb);
+                           false, nvme_handle_event, nvme_poll_cb,
+                           nvme_poll_ready);
 
     for (unsigned i = 0; i < s->queue_count; i++) {
         NVMeQueuePair *q = s->queues[i];
diff --git a/block/ssh.c b/block/ssh.c
index e0fbb4934b..3b5bf34031 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -990,7 +990,7 @@ static void restart_coroutine(void *opaque)
     AioContext *ctx = bdrv_get_aio_context(bs);
 
     trace_ssh_restart_coroutine(restart->co);
-    aio_set_fd_handler(ctx, s->sock, false, NULL, NULL, NULL, NULL);
+    aio_set_fd_handler(ctx, s->sock, false, NULL, NULL, NULL, NULL, NULL);
 
     aio_co_wake(restart->co);
 }
@@ -1020,7 +1020,7 @@ static coroutine_fn void co_yield(BDRVSSHState *s, BlockDriverState *bs)
     trace_ssh_co_yield(s->sock, rd_handler, wr_handler);
 
     aio_set_fd_handler(bdrv_get_aio_context(bs), s->sock,
-                       false, rd_handler, wr_handler, NULL, &restart);
+                       false, rd_handler, wr_handler, NULL, NULL, &restart);
     qemu_coroutine_yield();
     trace_ssh_co_yield_back(s->sock);
 }
diff --git a/block/win32-aio.c b/block/win32-aio.c
index b7221a272f..c57e10c997 100644
--- a/block/win32-aio.c
+++ b/block/win32-aio.c
@@ -172,7 +172,7 @@ int win32_aio_attach(QEMUWin32AIOState *aio, HANDLE hfile)
 void win32_aio_detach_aio_context(QEMUWin32AIOState *aio,
                                   AioContext *old_context)
 {
-    aio_set_event_notifier(old_context, &aio->e, false, NULL, NULL);
+    aio_set_event_notifier(old_context, &aio->e, false, NULL, NULL, NULL);
     aio->aio_ctx = NULL;
 }
 
@@ -181,7 +181,7 @@ void win32_aio_attach_aio_context(QEMUWin32AIOState *aio,
 {
     aio->aio_ctx = new_context;
     aio_set_event_notifier(new_context, &aio->e, false,
-                           win32_aio_completion_cb, NULL);
+                           win32_aio_completion_cb, NULL, NULL);
 }
 
 QEMUWin32AIOState *win32_aio_init(void)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d18868d7d..5db7f69237 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3536,11 +3536,14 @@ static bool virtio_queue_host_notifier_aio_poll(void *opaque)
     EventNotifier *n = opaque;
     VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
 
-    if (!vq->vring.desc || virtio_queue_empty(vq)) {
-        return false;
-    }
+    return vq->vring.desc && !virtio_queue_empty(vq);
+}
 
-    return virtio_queue_notify_aio_vq(vq);
+static void virtio_queue_host_notifier_aio_poll_ready(EventNotifier *n)
+{
+    VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
+
+    virtio_queue_notify_aio_vq(vq);
 }
 
 static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
@@ -3558,12 +3561,13 @@ void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
         vq->handle_aio_output = handle_output;
         aio_set_event_notifier(ctx, &vq->host_notifier, true,
                                virtio_queue_host_notifier_aio_read,
-                               virtio_queue_host_notifier_aio_poll);
+                               virtio_queue_host_notifier_aio_poll,
+                               virtio_queue_host_notifier_aio_poll_ready);
         aio_set_event_notifier_poll(ctx, &vq->host_notifier,
                                     virtio_queue_host_notifier_aio_poll_begin,
                                     virtio_queue_host_notifier_aio_poll_end);
     } else {
-        aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL);
+        aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
         /* Test and clear notifier before after disabling event,
          * in case poll callback didn't have time to run. */
         virtio_queue_host_notifier_aio_read(&vq->host_notifier);
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 416583f130..645a29a5a0 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1115,11 +1115,11 @@ void xen_device_set_event_channel_context(XenDevice *xendev,
 
     if (channel->ctx)
         aio_set_fd_handler(channel->ctx, xenevtchn_fd(channel->xeh), true,
-                           NULL, NULL, NULL, NULL);
+                           NULL, NULL, NULL, NULL, NULL);
 
     channel->ctx = ctx;
     aio_set_fd_handler(channel->ctx, xenevtchn_fd(channel->xeh), true,
-                       xen_device_event, NULL, xen_device_poll, channel);
+                       xen_device_event, NULL, xen_device_poll, NULL, channel);
 }
 
 XenEventChannel *xen_device_bind_event_channel(XenDevice *xendev,
@@ -1193,7 +1193,7 @@ void xen_device_unbind_event_channel(XenDevice *xendev,
     QLIST_REMOVE(channel, list);
 
     aio_set_fd_handler(channel->ctx, xenevtchn_fd(channel->xeh), true,
-                       NULL, NULL, NULL, NULL);
+                       NULL, NULL, NULL, NULL, NULL);
 
     if (xenevtchn_unbind(channel->xeh, channel->local_port) < 0) {
         error_setg_errno(errp, errno, "xenevtchn_unbind failed");
diff --git a/io/channel-command.c b/io/channel-command.c
index b2a9e27138..338da73ade 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -346,8 +346,10 @@ static void qio_channel_command_set_aio_fd_handler(QIOChannel *ioc,
                                                    void *opaque)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
-    aio_set_fd_handler(ctx, cioc->readfd, false, io_read, NULL, NULL, opaque);
-    aio_set_fd_handler(ctx, cioc->writefd, false, NULL, io_write, NULL, opaque);
+    aio_set_fd_handler(ctx, cioc->readfd, false,
+                       io_read, NULL, NULL, NULL, opaque);
+    aio_set_fd_handler(ctx, cioc->writefd, false,
+                       NULL, io_write, NULL, NULL, opaque);
 }
 
 
diff --git a/io/channel-file.c b/io/channel-file.c
index c4bf799a80..d7cf6d278f 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -191,7 +191,8 @@ static void qio_channel_file_set_aio_fd_handler(QIOChannel *ioc,
                                                 void *opaque)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
-    aio_set_fd_handler(ctx, fioc->fd, false, io_read, io_write, NULL, opaque);
+    aio_set_fd_handler(ctx, fioc->fd, false, io_read, io_write,
+                       NULL, NULL, opaque);
 }
 
 static GSource *qio_channel_file_create_watch(QIOChannel *ioc,
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 606ec97cf7..459922c874 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -761,7 +761,8 @@ static void qio_channel_socket_set_aio_fd_handler(QIOChannel *ioc,
                                                   void *opaque)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
-    aio_set_fd_handler(ctx, sioc->fd, false, io_read, io_write, NULL, opaque);
+    aio_set_fd_handler(ctx, sioc->fd, false,
+                       io_read, io_write, NULL, NULL, opaque);
 }
 
 static GSource *qio_channel_socket_create_watch(QIOChannel *ioc,
diff --git a/migration/rdma.c b/migration/rdma.c
index f5d3bbe7e9..c7c7a38487 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3161,14 +3161,14 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
     if (io_read) {
         aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
-                           false, io_read, io_write, NULL, opaque);
+                           false, io_read, io_write, NULL, NULL, opaque);
         aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
-                           false, io_read, io_write, NULL, opaque);
+                           false, io_read, io_write, NULL, NULL, opaque);
     } else {
         aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
-                           false, io_read, io_write, NULL, opaque);
+                           false, io_read, io_write, NULL, NULL, opaque);
         aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
-                           false, io_read, io_write, NULL, opaque);
+                           false, io_read, io_write, NULL, NULL, opaque);
     }
 }
 
diff --git a/tests/unit/test-aio.c b/tests/unit/test-aio.c
index 6feeb9a4a9..178048d2f2 100644
--- a/tests/unit/test-aio.c
+++ b/tests/unit/test-aio.c
@@ -130,7 +130,7 @@ static void *test_acquire_thread(void *opaque)
 static void set_event_notifier(AioContext *ctx, EventNotifier *notifier,
                                EventNotifierHandler *handler)
 {
-    aio_set_event_notifier(ctx, notifier, false, handler, NULL);
+    aio_set_event_notifier(ctx, notifier, false, handler, NULL, NULL);
 }
 
 static void dummy_notifier_read(EventNotifier *n)
@@ -390,7 +390,7 @@ static void test_aio_external_client(void)
     for (i = 1; i < 3; i++) {
         EventNotifierTestData data = { .n = 0, .active = 10, .auto_set = true };
         event_notifier_init(&data.e, false);
-        aio_set_event_notifier(ctx, &data.e, true, event_ready_cb, NULL);
+        aio_set_event_notifier(ctx, &data.e, true, event_ready_cb, NULL, NULL);
         event_notifier_set(&data.e);
         for (j = 0; j < i; j++) {
             aio_disable_external(ctx);
diff --git a/tests/unit/test-fdmon-epoll.c b/tests/unit/test-fdmon-epoll.c
index 11fd8a2fa9..ef5a856d09 100644
--- a/tests/unit/test-fdmon-epoll.c
+++ b/tests/unit/test-fdmon-epoll.c
@@ -22,14 +22,14 @@ static void add_event_notifiers(EventNotifier *notifiers, size_t n)
     for (size_t i = 0; i < n; i++) {
         event_notifier_init(&notifiers[i], false);
         aio_set_event_notifier(ctx, &notifiers[i], false,
-                               dummy_fd_handler, NULL);
+                               dummy_fd_handler, NULL, NULL);
     }
 }
 
 static void remove_event_notifiers(EventNotifier *notifiers, size_t n)
 {
     for (size_t i = 0; i < n; i++) {
-        aio_set_event_notifier(ctx, &notifiers[i], false, NULL, NULL);
+        aio_set_event_notifier(ctx, &notifiers[i], false, NULL, NULL, NULL);
         event_notifier_cleanup(&notifiers[i]);
     }
 }
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 2b86777e91..7b9f629218 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -23,6 +23,15 @@
 #include "trace.h"
 #include "aio-posix.h"
 
+/*
+ * G_IO_IN and G_IO_OUT are not appropriate revents values for polling, since
+ * the handler may not need to access the file descriptor. For example, the
+ * handler doesn't need to read from an EventNotifier if it polled a memory
+ * location and a read syscall would be slow. Define our own unique revents
+ * value to indicate that polling determined this AioHandler is ready.
+ */
+#define REVENTS_POLL_READY 0
+
 /* Stop userspace polling on a handler if it isn't active for some time */
 #define POLL_IDLE_INTERVAL_NS (7 * NANOSECONDS_PER_SECOND)
 
@@ -93,6 +102,7 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_read,
                         IOHandler *io_write,
                         AioPollFn *io_poll,
+                        IOHandler *io_poll_ready,
                         void *opaque)
 {
     AioHandler *node;
@@ -101,6 +111,10 @@ void aio_set_fd_handler(AioContext *ctx,
     bool deleted = false;
     int poll_disable_change;
 
+    if (io_poll && !io_poll_ready) {
+        io_poll = NULL; /* polling only makes sense if there is a handler */
+    }
+
     qemu_lockcnt_lock(&ctx->list_lock);
 
     node = find_aio_handler(ctx, fd);
@@ -127,6 +141,7 @@ void aio_set_fd_handler(AioContext *ctx,
         new_node->io_read = io_read;
         new_node->io_write = io_write;
         new_node->io_poll = io_poll;
+        new_node->io_poll_ready = io_poll_ready;
         new_node->opaque = opaque;
         new_node->is_external = is_external;
 
@@ -182,10 +197,12 @@ void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *notifier,
                             bool is_external,
                             EventNotifierHandler *io_read,
-                            AioPollFn *io_poll)
+                            AioPollFn *io_poll,
+                            EventNotifierHandler *io_poll_ready)
 {
     aio_set_fd_handler(ctx, event_notifier_get_fd(notifier), is_external,
-                       (IOHandler *)io_read, NULL, io_poll, notifier);
+                       (IOHandler *)io_read, NULL, io_poll,
+                       (IOHandler *)io_poll_ready, notifier);
 }
 
 void aio_set_event_notifier_poll(AioContext *ctx,
@@ -198,7 +215,8 @@ void aio_set_event_notifier_poll(AioContext *ctx,
                     (IOHandler *)io_poll_end);
 }
 
-static bool poll_set_started(AioContext *ctx, bool started)
+static bool poll_set_started(AioContext *ctx, AioHandlerList *ready_list,
+                             bool started)
 {
     AioHandler *node;
     bool progress = false;
@@ -228,8 +246,9 @@ static bool poll_set_started(AioContext *ctx, bool started)
         }
 
         /* Poll one last time in case ->io_poll_end() raced with the event */
-        if (!started) {
-            progress = node->io_poll(node->opaque) || progress;
+        if (!started && node->io_poll(node->opaque)) {
+            aio_add_ready_handler(ready_list, node, REVENTS_POLL_READY);
+            progress = true;
         }
     }
     qemu_lockcnt_dec(&ctx->list_lock);
@@ -240,8 +259,11 @@ static bool poll_set_started(AioContext *ctx, bool started)
 
 bool aio_prepare(AioContext *ctx)
 {
+    AioHandlerList ready_list = QLIST_HEAD_INITIALIZER(ready_list);
+
     /* Poll mode cannot be used with glib's event loop, disable it. */
-    poll_set_started(ctx, false);
+    poll_set_started(ctx, &ready_list, false);
+    /* TODO what to do with this list? */
 
     return false;
 }
@@ -321,6 +343,18 @@ static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
         }
         QLIST_INSERT_HEAD(&ctx->poll_aio_handlers, node, node_poll);
     }
+    if (!QLIST_IS_INSERTED(node, node_deleted) &&
+        revents == 0 &&
+        aio_node_check(ctx, node->is_external) &&
+        node->io_poll_ready) {
+        node->io_poll_ready(node->opaque);
+
+        /*
+         * Return early since revents was zero. aio_notify() does not count as
+         * progress.
+         */
+        return node->opaque != &ctx->notifier;
+    }
 
     if (!QLIST_IS_INSERTED(node, node_deleted) &&
         (revents & (G_IO_IN | G_IO_HUP | G_IO_ERR)) &&
@@ -387,6 +421,7 @@ void aio_dispatch(AioContext *ctx)
 }
 
 static bool run_poll_handlers_once(AioContext *ctx,
+                                   AioHandlerList *ready_list,
                                    int64_t now,
                                    int64_t *timeout)
 {
@@ -397,6 +432,8 @@ static bool run_poll_handlers_once(AioContext *ctx,
     QLIST_FOREACH_SAFE(node, &ctx->poll_aio_handlers, node_poll, tmp) {
         if (aio_node_check(ctx, node->is_external) &&
             node->io_poll(node->opaque)) {
+            aio_add_ready_handler(ready_list, node, REVENTS_POLL_READY);
+
             node->poll_idle_timeout = now + POLL_IDLE_INTERVAL_NS;
 
             /*
@@ -420,7 +457,9 @@ static bool fdmon_supports_polling(AioContext *ctx)
     return ctx->fdmon_ops->need_wait != aio_poll_disabled;
 }
 
-static bool remove_idle_poll_handlers(AioContext *ctx, int64_t now)
+static bool remove_idle_poll_handlers(AioContext *ctx,
+                                      AioHandlerList *ready_list,
+                                      int64_t now)
 {
     AioHandler *node;
     AioHandler *tmp;
@@ -451,7 +490,11 @@ static bool remove_idle_poll_handlers(AioContext *ctx, int64_t now)
                  * Nevermind about re-adding the handler in the rare case where
                  * this causes progress.
                  */
-                progress = node->io_poll(node->opaque) || progress;
+                if (node->io_poll(node->opaque)) {
+                    aio_add_ready_handler(ready_list, node,
+                                          REVENTS_POLL_READY);
+                    progress = true;
+                }
             }
         }
     }
@@ -461,6 +504,7 @@ static bool remove_idle_poll_handlers(AioContext *ctx, int64_t now)
 
 /* run_poll_handlers:
  * @ctx: the AioContext
+ * @ready_list: the list to place ready handlers on
  * @max_ns: maximum time to poll for, in nanoseconds
  *
  * Polls for a given time.
@@ -469,7 +513,8 @@ static bool remove_idle_poll_handlers(AioContext *ctx, int64_t now)
  *
  * Returns: true if progress was made, false otherwise
  */
-static bool run_poll_handlers(AioContext *ctx, int64_t max_ns, int64_t *timeout)
+static bool run_poll_handlers(AioContext *ctx, AioHandlerList *ready_list,
+                              int64_t max_ns, int64_t *timeout)
 {
     bool progress;
     int64_t start_time, elapsed_time;
@@ -490,13 +535,15 @@ static bool run_poll_handlers(AioContext *ctx, int64_t max_ns, int64_t *timeout)
 
     start_time = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
     do {
-        progress = run_poll_handlers_once(ctx, start_time, timeout);
+        progress = run_poll_handlers_once(ctx, ready_list,
+                                          start_time, timeout);
         elapsed_time = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) - start_time;
         max_ns = qemu_soonest_timeout(*timeout, max_ns);
         assert(!(max_ns && progress));
     } while (elapsed_time < max_ns && !ctx->fdmon_ops->need_wait(ctx));
 
-    if (remove_idle_poll_handlers(ctx, start_time + elapsed_time)) {
+    if (remove_idle_poll_handlers(ctx, ready_list,
+                                  start_time + elapsed_time)) {
         *timeout = 0;
         progress = true;
     }
@@ -514,6 +561,7 @@ static bool run_poll_handlers(AioContext *ctx, int64_t max_ns, int64_t *timeout)
 
 /* try_poll_mode:
  * @ctx: the AioContext
+ * @ready_list: list to add handlers that need to be run
  * @timeout: timeout for blocking wait, computed by the caller and updated if
  *    polling succeeds.
  *
@@ -521,7 +569,8 @@ static bool run_poll_handlers(AioContext *ctx, int64_t max_ns, int64_t *timeout)
  *
  * Returns: true if progress was made, false otherwise
  */
-static bool try_poll_mode(AioContext *ctx, int64_t *timeout)
+static bool try_poll_mode(AioContext *ctx, AioHandlerList *ready_list,
+                          int64_t *timeout)
 {
     int64_t max_ns;
 
@@ -531,14 +580,14 @@ static bool try_poll_mode(AioContext *ctx, int64_t *timeout)
 
     max_ns = qemu_soonest_timeout(*timeout, ctx->poll_ns);
     if (max_ns && !ctx->fdmon_ops->need_wait(ctx)) {
-        poll_set_started(ctx, true);
+        poll_set_started(ctx, ready_list, true);
 
-        if (run_poll_handlers(ctx, max_ns, timeout)) {
+        if (run_poll_handlers(ctx, ready_list, max_ns, timeout)) {
             return true;
         }
     }
 
-    if (poll_set_started(ctx, false)) {
+    if (poll_set_started(ctx, ready_list, false)) {
         *timeout = 0;
         return true;
     }
@@ -549,7 +598,6 @@ static bool try_poll_mode(AioContext *ctx, int64_t *timeout)
 bool aio_poll(AioContext *ctx, bool blocking)
 {
     AioHandlerList ready_list = QLIST_HEAD_INITIALIZER(ready_list);
-    int ret = 0;
     bool progress;
     bool use_notify_me;
     int64_t timeout;
@@ -574,7 +622,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
     }
 
     timeout = blocking ? aio_compute_timeout(ctx) : 0;
-    progress = try_poll_mode(ctx, &timeout);
+    progress = try_poll_mode(ctx, &ready_list, &timeout);
     assert(!(timeout && progress));
 
     /*
@@ -604,7 +652,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
      * system call---a single round of run_poll_handlers_once suffices.
      */
     if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
-        ret = ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
+        ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
     }
 
     if (use_notify_me) {
@@ -657,10 +705,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
     }
 
     progress |= aio_bh_poll(ctx);
-
-    if (ret > 0) {
-        progress |= aio_dispatch_ready_handlers(ctx, &ready_list);
-    }
+    progress |= aio_dispatch_ready_handlers(ctx, &ready_list);
 
     aio_free_deleted_handlers(ctx);
 
diff --git a/util/aio-win32.c b/util/aio-win32.c
index d5b09a1193..7aac89df3a 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -68,6 +68,7 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_read,
                         IOHandler *io_write,
                         AioPollFn *io_poll,
+                        IOHandler *io_poll_ready,
                         void *opaque)
 {
     /* fd is a SOCKET in our case */
@@ -136,7 +137,8 @@ void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *e,
                             bool is_external,
                             EventNotifierHandler *io_notify,
-                            AioPollFn *io_poll)
+                            AioPollFn *io_poll,
+                            EventNotifierHandler *io_poll_ready)
 {
     AioHandler *node;
 
diff --git a/util/async.c b/util/async.c
index 6f6717a34b..08d25feef5 100644
--- a/util/async.c
+++ b/util/async.c
@@ -362,7 +362,7 @@ aio_ctx_finalize(GSource     *source)
         g_free(bh);
     }
 
-    aio_set_event_notifier(ctx, &ctx->notifier, false, NULL, NULL);
+    aio_set_event_notifier(ctx, &ctx->notifier, false, NULL, NULL, NULL);
     event_notifier_cleanup(&ctx->notifier);
     qemu_rec_mutex_destroy(&ctx->lock);
     qemu_lockcnt_destroy(&ctx->list_lock);
@@ -485,6 +485,11 @@ static bool aio_context_notifier_poll(void *opaque)
     return qatomic_read(&ctx->notified);
 }
 
+static void aio_context_notifier_poll_ready(EventNotifier *e)
+{
+    /* Do nothing, we just wanted to kick the event loop */
+}
+
 static void co_schedule_bh_cb(void *opaque)
 {
     AioContext *ctx = opaque;
@@ -536,7 +541,8 @@ AioContext *aio_context_new(Error **errp)
     aio_set_event_notifier(ctx, &ctx->notifier,
                            false,
                            aio_context_notifier_cb,
-                           aio_context_notifier_poll);
+                           aio_context_notifier_poll,
+                           aio_context_notifier_poll_ready);
 #ifdef CONFIG_LINUX_AIO
     ctx->linux_aio = NULL;
 #endif
diff --git a/util/main-loop.c b/util/main-loop.c
index 06b18b195c..4d5a5b9943 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -582,7 +582,7 @@ void qemu_set_fd_handler(int fd,
 {
     iohandler_init();
     aio_set_fd_handler(iohandler_ctx, fd, false,
-                       fd_read, fd_write, NULL, opaque);
+                       fd_read, fd_write, NULL, NULL, opaque);
 }
 
 void event_notifier_set_handler(EventNotifier *e,
@@ -590,5 +590,5 @@ void event_notifier_set_handler(EventNotifier *e,
 {
     iohandler_init();
     aio_set_event_notifier(iohandler_ctx, e, false,
-                           handler, NULL);
+                           handler, NULL, NULL);
 }
diff --git a/util/qemu-coroutine-io.c b/util/qemu-coroutine-io.c
index 5b80bb416f..7f5839cb76 100644
--- a/util/qemu-coroutine-io.c
+++ b/util/qemu-coroutine-io.c
@@ -75,7 +75,8 @@ typedef struct {
 static void fd_coroutine_enter(void *opaque)
 {
     FDYieldUntilData *data = opaque;
-    aio_set_fd_handler(data->ctx, data->fd, false, NULL, NULL, NULL, NULL);
+    aio_set_fd_handler(data->ctx, data->fd, false,
+                       NULL, NULL, NULL, NULL, NULL);
     qemu_coroutine_enter(data->co);
 }
 
@@ -88,6 +89,6 @@ void coroutine_fn yield_until_fd_readable(int fd)
     data.co = qemu_coroutine_self();
     data.fd = fd;
     aio_set_fd_handler(
-        data.ctx, fd, false, fd_coroutine_enter, NULL, NULL, &data);
+        data.ctx, fd, false, fd_coroutine_enter, NULL, NULL, NULL, &data);
     qemu_coroutine_yield();
 }
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 783d847a6d..f68287e811 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -250,7 +250,7 @@ set_watch(VuDev *vu_dev, int fd, int vu_evt,
         vu_fd_watch->cb = cb;
         qemu_set_nonblock(fd);
         aio_set_fd_handler(server->ioc->ctx, fd, true, kick_handler,
-                           NULL, NULL, vu_fd_watch);
+                           NULL, NULL, NULL, vu_fd_watch);
         vu_fd_watch->vu_dev = vu_dev;
         vu_fd_watch->pvt = pvt;
     }
@@ -270,7 +270,8 @@ static void remove_watch(VuDev *vu_dev, int fd)
     if (!vu_fd_watch) {
         return;
     }
-    aio_set_fd_handler(server->ioc->ctx, fd, true, NULL, NULL, NULL, NULL);
+    aio_set_fd_handler(server->ioc->ctx, fd, true,
+                       NULL, NULL, NULL, NULL, NULL);
 
     QTAILQ_REMOVE(&server->vu_fd_watches, vu_fd_watch, next);
     g_free(vu_fd_watch);
@@ -334,7 +335,7 @@ void vhost_user_server_stop(VuServer *server)
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
             aio_set_fd_handler(server->ctx, vu_fd_watch->fd, true,
-                               NULL, NULL, NULL, vu_fd_watch);
+                               NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
         qio_channel_shutdown(server->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
@@ -377,7 +378,7 @@ void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx)
 
     QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
         aio_set_fd_handler(ctx, vu_fd_watch->fd, true, kick_handler, NULL,
-                           NULL, vu_fd_watch);
+                           NULL, NULL, vu_fd_watch);
     }
 
     aio_co_schedule(ctx, server->co_trip);
@@ -391,7 +392,7 @@ void vhost_user_server_detach_aio_context(VuServer *server)
 
         QTAILQ_FOREACH(vu_fd_watch, &server->vu_fd_watches, next) {
             aio_set_fd_handler(server->ctx, vu_fd_watch->fd, true,
-                               NULL, NULL, NULL, vu_fd_watch);
+                               NULL, NULL, NULL, NULL, vu_fd_watch);
         }
 
         qio_channel_detach_aio_context(server->ioc);
-- 
2.34.1


