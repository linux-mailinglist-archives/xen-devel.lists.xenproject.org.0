Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A33F71A28F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 17:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542622.846706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBn-00050c-JS; Thu, 01 Jun 2023 15:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542622.846706; Thu, 01 Jun 2023 15:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBn-0004xO-Fb; Thu, 01 Jun 2023 15:26:11 +0000
Received: by outflank-mailman (input) for mailman id 542622;
 Thu, 01 Jun 2023 15:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z77Y=BV=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q4kBl-0004Rb-7f
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 15:26:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1383b12-0090-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 17:26:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-2vgpgg3mPcSjbZVrWqxdXw-1; Thu, 01 Jun 2023 11:26:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 382503C397F2;
 Thu,  1 Jun 2023 15:26:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94ACA8162;
 Thu,  1 Jun 2023 15:26:02 +0000 (UTC)
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
X-Inumbo-ID: a1383b12-0090-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685633167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isHwy///XBfEj9leDzUcC4RkN1ck1qXgOorGTTirv6Q=;
	b=a3nxDyurx+vnomk1yWYTNfjxmaGpgI4tl6gQS0eJ1m2plHachKBHJJVXS3U0BmI9D2rTpv
	6fW7MSdj0ErOmKfQ3FOKc0iMC58Oat/YHFaxL7EOj7XXQh/VpBCKQr30pLUHieP9+wK1iF
	jneXjyQyWvDkrsKXAlsnSufF6a1aD20=
X-MC-Unique: 2vgpgg3mPcSjbZVrWqxdXw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	kvm@vger.kernel.org
Subject: [PULL 4/8] block/io_uring: convert to blk_io_plug_call() API
Date: Thu,  1 Jun 2023 11:25:48 -0400
Message-Id: <20230601152552.1603119-5-stefanha@redhat.com>
In-Reply-To: <20230601152552.1603119-1-stefanha@redhat.com>
References: <20230601152552.1603119-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Stop using the .bdrv_co_io_plug() API because it is not multi-queue
block layer friendly. Use the new blk_io_plug_call() API to batch I/O
submission instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20230530180959.1108766-5-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
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
index 3a77480e16..69d9820928 100644
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


