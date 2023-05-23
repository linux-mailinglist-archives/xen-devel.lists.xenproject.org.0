Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CCB70E2A0
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 19:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538635.838778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VZY-00047Y-IM; Tue, 23 May 2023 17:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538635.838778; Tue, 23 May 2023 17:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VZY-00045l-EG; Tue, 23 May 2023 17:13:20 +0000
Received: by outflank-mailman (input) for mailman id 538635;
 Tue, 23 May 2023 17:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ9c=BM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q1VZW-0003Rc-JU
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 17:13:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba180ba-f98d-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 19:13:17 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-ZauBHbUoNY-qinf-3koLiw-1; Tue, 23 May 2023 13:13:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A238037AD;
 Tue, 23 May 2023 17:13:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 015D020296C8;
 Tue, 23 May 2023 17:13:11 +0000 (UTC)
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
X-Inumbo-ID: 1ba180ba-f98d-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684861996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adsezOIruOLlF6TNGoaz9EB3Mhcv/eh3FPCDU/pv2jU=;
	b=HP5NACv1aNHN28e/zcPmGUBBaKEwR4/4wvvQYsVGFiqiNyXBvIflyObzP1cE42nhrlzZcf
	l9BgYJZv+xtw9aEfJDRKzFc2yTtrW2BEfEQbyKfEtzRqJhwlXfAFnUchj2R2KQTUGAonwF
	b5W7aLq10wK3uZiBb4SVgGNljdumIxA=
X-MC-Unique: ZauBHbUoNY-qinf-3koLiw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	xen-devel@lists.xenproject.org,
	eblake@redhat.com,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-block@nongnu.org
Subject: [PATCH v2 4/6] block/io_uring: convert to blk_io_plug_call() API
Date: Tue, 23 May 2023 13:12:58 -0400
Message-Id: <20230523171300.132347-5-stefanha@redhat.com>
In-Reply-To: <20230523171300.132347-1-stefanha@redhat.com>
References: <20230523171300.132347-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Stop using the .bdrv_co_io_plug() API because it is not multi-queue
block layer friendly. Use the new blk_io_plug_call() API to batch I/O
submission instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
v2
- Removed whitespace hunk [Eric]
---
 include/block/raw-aio.h |  7 -------
 block/file-posix.c      | 10 ----------
 block/io_uring.c        | 44 ++++++++++++++++-------------------------
 block/trace-events      |  5 ++---
 4 files changed, 19 insertions(+), 47 deletions(-)

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
index 82cab6a5bd..4e25b56c9c 100644
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
@@ -370,14 +358,16 @@ static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
 
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
index 048ad27519..6f121b7636 100644
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


