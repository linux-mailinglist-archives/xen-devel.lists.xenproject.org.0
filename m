Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245370751E
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 00:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536083.834232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzPM4-0005z3-Ha; Wed, 17 May 2023 22:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536083.834232; Wed, 17 May 2023 22:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzPM4-0005wd-DL; Wed, 17 May 2023 22:10:44 +0000
Received: by outflank-mailman (input) for mailman id 536083;
 Wed, 17 May 2023 22:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqXG=BG=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pzPM3-0004sV-0H
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 22:10:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b30104-f4ff-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 00:10:41 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-iuCQhDZoOHmdirDNUMxiUg-1; Wed, 17 May 2023 18:10:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34265101A54F;
 Wed, 17 May 2023 22:10:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8660D40C6EC4;
 Wed, 17 May 2023 22:10:35 +0000 (UTC)
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
X-Inumbo-ID: a8b30104-f4ff-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684361440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Blp/dScqtxXcjtaEje+/rVMH7PoeKSgRMwItRYa7aR4=;
	b=RyxjFtLx6ZGCwF0gH2t7Mcrg5hJdfkf//cJheEgAcDX5wfwZ5k8wcl6R44dnECe10LDYO1
	lda7AcE07j3Y2qTzlh7G8kfYOOIHbAy1j1fDPH/qgfe60NZ/HGxaJHtznQ5/eo5Lc+dAzi
	mWyKICdj0xKQZ7mIizyyjxcVDtpa9/U=
X-MC-Unique: iuCQhDZoOHmdirDNUMxiUg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 4/6] block/io_uring: convert to blk_io_plug_call() API
Date: Wed, 17 May 2023 18:10:20 -0400
Message-Id: <20230517221022.325091-5-stefanha@redhat.com>
In-Reply-To: <20230517221022.325091-1-stefanha@redhat.com>
References: <20230517221022.325091-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

Stop using the .bdrv_co_io_plug() API because it is not multi-queue
block layer friendly. Use the new blk_io_plug_call() API to batch I/O
submission instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/raw-aio.h |  7 -------
 block/file-posix.c      | 10 ---------
 block/io_uring.c        | 45 ++++++++++++++++-------------------------
 block/trace-events      |  5 ++---
 4 files changed, 19 insertions(+), 48 deletions(-)

diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 0fe85ade77..da60ca13ef 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -81,13 +81,6 @@ int coroutine_fn luring_co_submit(BlockDriverState *bs, int fd, uint64_t offset,
                                   QEMUIOVector *qiov, int type);
 void luring_detach_aio_context(LuringState *s, AioContext *old_context);
 void luring_attach_aio_context(LuringState *s, AioContext *new_context);
-
-/*
- * luring_io_plug/unplug work in the thread's current AioContext, therefore the
- * caller must ensure that they are paired in the same IOThread.
- */
-void luring_io_plug(void);
-void luring_io_unplug(void);
 #endif
 
 #ifdef _WIN32
diff --git a/block/file-posix.c b/block/file-posix.c
index 0ab158efba..7baa8491dd 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2558,11 +2558,6 @@ static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
         laio_io_plug();
     }
 #endif
-#ifdef CONFIG_LINUX_IO_URING
-    if (s->use_linux_io_uring) {
-        luring_io_plug();
-    }
-#endif
 }
 
 static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
@@ -2573,11 +2568,6 @@ static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
         laio_io_unplug(s->aio_max_batch);
     }
 #endif
-#ifdef CONFIG_LINUX_IO_URING
-    if (s->use_linux_io_uring) {
-        luring_io_unplug();
-    }
-#endif
 }
 
 static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
diff --git a/block/io_uring.c b/block/io_uring.c
index 82cab6a5bd..9a45e5fb8b 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -16,6 +16,7 @@
 #include "block/raw-aio.h"
 #include "qemu/coroutine.h"
 #include "qapi/error.h"
+#include "sysemu/block-backend.h"
 #include "trace.h"
 
 /* Only used for assertions.  */
@@ -41,7 +42,6 @@ typedef struct LuringAIOCB {
 } LuringAIOCB;
 
 typedef struct LuringQueue {
-    int plugged;
     unsigned int in_queue;
     unsigned int in_flight;
     bool blocked;
@@ -267,7 +267,7 @@ static void luring_process_completions_and_submit(LuringState *s)
 {
     luring_process_completions(s);
 
-    if (!s->io_q.plugged && s->io_q.in_queue > 0) {
+    if (s->io_q.in_queue > 0) {
         ioq_submit(s);
     }
 }
@@ -301,29 +301,17 @@ static void qemu_luring_poll_ready(void *opaque)
 static void ioq_init(LuringQueue *io_q)
 {
     QSIMPLEQ_INIT(&io_q->submit_queue);
-    io_q->plugged = 0;
     io_q->in_queue = 0;
     io_q->in_flight = 0;
     io_q->blocked = false;
 }
 
-void luring_io_plug(void)
+static void luring_unplug_fn(void *opaque)
 {
-    AioContext *ctx = qemu_get_current_aio_context();
-    LuringState *s = aio_get_linux_io_uring(ctx);
-    trace_luring_io_plug(s);
-    s->io_q.plugged++;
-}
-
-void luring_io_unplug(void)
-{
-    AioContext *ctx = qemu_get_current_aio_context();
-    LuringState *s = aio_get_linux_io_uring(ctx);
-    assert(s->io_q.plugged);
-    trace_luring_io_unplug(s, s->io_q.blocked, s->io_q.plugged,
-                           s->io_q.in_queue, s->io_q.in_flight);
-    if (--s->io_q.plugged == 0 &&
-        !s->io_q.blocked && s->io_q.in_queue > 0) {
+    LuringState *s = opaque;
+    trace_luring_unplug_fn(s, s->io_q.blocked, s->io_q.in_queue,
+                           s->io_q.in_flight);
+    if (!s->io_q.blocked && s->io_q.in_queue > 0) {
         ioq_submit(s);
     }
 }
@@ -337,7 +325,6 @@ void luring_io_unplug(void)
  * @type: type of request
  *
  * Fetches sqes from ring, adds to pending queue and preps them
- *
  */
 static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
                             uint64_t offset, int type)
@@ -370,14 +357,16 @@ static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
 
     QSIMPLEQ_INSERT_TAIL(&s->io_q.submit_queue, luringcb, next);
     s->io_q.in_queue++;
-    trace_luring_do_submit(s, s->io_q.blocked, s->io_q.plugged,
-                           s->io_q.in_queue, s->io_q.in_flight);
-    if (!s->io_q.blocked &&
-        (!s->io_q.plugged ||
-         s->io_q.in_flight + s->io_q.in_queue >= MAX_ENTRIES)) {
-        ret = ioq_submit(s);
-        trace_luring_do_submit_done(s, ret);
-        return ret;
+    trace_luring_do_submit(s, s->io_q.blocked, s->io_q.in_queue,
+                           s->io_q.in_flight);
+    if (!s->io_q.blocked) {
+        if (s->io_q.in_flight + s->io_q.in_queue >= MAX_ENTRIES) {
+            ret = ioq_submit(s);
+            trace_luring_do_submit_done(s, ret);
+            return ret;
+        }
+
+        blk_io_plug_call(luring_unplug_fn, s);
     }
     return 0;
 }
diff --git a/block/trace-events b/block/trace-events
index 32665158d6..c22fb1ed43 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -64,9 +64,8 @@ file_paio_submit(void *acb, void *opaque, int64_t offset, int count, int type) "
 # io_uring.c
 luring_init_state(void *s, size_t size) "s %p size %zu"
 luring_cleanup_state(void *s) "%p freed"
-luring_io_plug(void *s) "LuringState %p plug"
-luring_io_unplug(void *s, int blocked, int plugged, int queued, int inflight) "LuringState %p blocked %d plugged %d queued %d inflight %d"
-luring_do_submit(void *s, int blocked, int plugged, int queued, int inflight) "LuringState %p blocked %d plugged %d queued %d inflight %d"
+luring_unplug_fn(void *s, int blocked, int queued, int inflight) "LuringState %p blocked %d queued %d inflight %d"
+luring_do_submit(void *s, int blocked, int queued, int inflight) "LuringState %p blocked %d queued %d inflight %d"
 luring_do_submit_done(void *s, int ret) "LuringState %p submitted to kernel %d"
 luring_co_submit(void *bs, void *s, void *luringcb, int fd, uint64_t offset, size_t nbytes, int type) "bs %p s %p luringcb %p fd %d offset %" PRId64 " nbytes %zd type %d"
 luring_process_completion(void *s, void *aiocb, int ret) "LuringState %p luringcb %p ret %d"
-- 
2.40.1


