Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C370751A
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 00:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536084.834242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzPM6-0006HT-T0; Wed, 17 May 2023 22:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536084.834242; Wed, 17 May 2023 22:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzPM6-0006EY-Oa; Wed, 17 May 2023 22:10:46 +0000
Received: by outflank-mailman (input) for mailman id 536084;
 Wed, 17 May 2023 22:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqXG=BG=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pzPM4-0004sP-Nd
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 22:10:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa518528-f4ff-11ed-b22a-6b7b168915f2;
 Thu, 18 May 2023 00:10:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-iMg22q66OE2OQnfjQYyXYg-1; Wed, 17 May 2023 18:10:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E198A870820;
 Wed, 17 May 2023 22:10:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 592832166B31;
 Wed, 17 May 2023 22:10:38 +0000 (UTC)
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
X-Inumbo-ID: aa518528-f4ff-11ed-b22a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684361442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAL0IqCXxu/U5jmrcTSsPXlVFdfkdt5JIfR3AjEbRH4=;
	b=eUaOjwnN+BLneCHx6+v2uLzbz2heKkbp8hVGIKkrjqKPMsGVfE04zVgrWPy5DkyJYLZqOK
	C5GAzhcqm80uv6tTBi5WPC9gdNMNCVUhW/MEhjcutCaOhpjSrPKGzcT8J7AXps8taJN6Rd
	AhHmmlFYUOiYYLTxD6mw4Rl5/XrbvxE=
X-MC-Unique: iMg22q66OE2OQnfjQYyXYg-1
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
Subject: [PATCH 5/6] block/linux-aio: convert to blk_io_plug_call() API
Date: Wed, 17 May 2023 18:10:21 -0400
Message-Id: <20230517221022.325091-6-stefanha@redhat.com>
In-Reply-To: <20230517221022.325091-1-stefanha@redhat.com>
References: <20230517221022.325091-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Stop using the .bdrv_co_io_plug() API because it is not multi-queue
block layer friendly. Use the new blk_io_plug_call() API to batch I/O
submission instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/raw-aio.h |  7 -------
 block/file-posix.c      | 28 ----------------------------
 block/linux-aio.c       | 41 +++++++++++------------------------------
 3 files changed, 11 insertions(+), 65 deletions(-)

diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index da60ca13ef..0f63c2800c 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -62,13 +62,6 @@ int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *qiov,
 
 void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
 void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
-
-/*
- * laio_io_plug/unplug work in the thread's current AioContext, therefore the
- * caller must ensure that they are paired in the same IOThread.
- */
-void laio_io_plug(void);
-void laio_io_unplug(uint64_t dev_max_batch);
 #endif
 /* io_uring.c - Linux io_uring implementation */
 #ifdef CONFIG_LINUX_IO_URING
diff --git a/block/file-posix.c b/block/file-posix.c
index 7baa8491dd..ac1ed54811 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2550,26 +2550,6 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
 }
 
-static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
-{
-    BDRVRawState __attribute__((unused)) *s = bs->opaque;
-#ifdef CONFIG_LINUX_AIO
-    if (s->use_linux_aio) {
-        laio_io_plug();
-    }
-#endif
-}
-
-static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
-{
-    BDRVRawState __attribute__((unused)) *s = bs->opaque;
-#ifdef CONFIG_LINUX_AIO
-    if (s->use_linux_aio) {
-        laio_io_unplug(s->aio_max_batch);
-    }
-#endif
-}
-
 static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
@@ -3914,8 +3894,6 @@ BlockDriver bdrv_file = {
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
@@ -4286,8 +4264,6 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
@@ -4424,8 +4400,6 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits    = cdrom_refresh_limits,
-    .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
@@ -4552,8 +4526,6 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits    = cdrom_refresh_limits,
-    .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
diff --git a/block/linux-aio.c b/block/linux-aio.c
index 442c86209b..5021aed68f 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -15,6 +15,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/coroutine.h"
 #include "qapi/error.h"
+#include "sysemu/block-backend.h"
 
 /* Only used for assertions.  */
 #include "qemu/coroutine_int.h"
@@ -46,7 +47,6 @@ struct qemu_laiocb {
 };
 
 typedef struct {
-    int plugged;
     unsigned int in_queue;
     unsigned int in_flight;
     bool blocked;
@@ -236,7 +236,7 @@ static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
 {
     qemu_laio_process_completions(s);
 
-    if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
+    if (!QSIMPLEQ_EMPTY(&s->io_q.pending)) {
         ioq_submit(s);
     }
 }
@@ -277,7 +277,6 @@ static void qemu_laio_poll_ready(EventNotifier *opaque)
 static void ioq_init(LaioQueue *io_q)
 {
     QSIMPLEQ_INIT(&io_q->pending);
-    io_q->plugged = 0;
     io_q->in_queue = 0;
     io_q->in_flight = 0;
     io_q->blocked = false;
@@ -354,31 +353,11 @@ static uint64_t laio_max_batch(LinuxAioState *s, uint64_t dev_max_batch)
     return max_batch;
 }
 
-void laio_io_plug(void)
+static void laio_unplug_fn(void *opaque)
 {
-    AioContext *ctx = qemu_get_current_aio_context();
-    LinuxAioState *s = aio_get_linux_aio(ctx);
+    LinuxAioState *s = opaque;
 
-    s->io_q.plugged++;
-}
-
-void laio_io_unplug(uint64_t dev_max_batch)
-{
-    AioContext *ctx = qemu_get_current_aio_context();
-    LinuxAioState *s = aio_get_linux_aio(ctx);
-
-    assert(s->io_q.plugged);
-    s->io_q.plugged--;
-
-    /*
-     * Why max batch checking is performed here:
-     * Another BDS may have queued requests with a higher dev_max_batch and
-     * therefore in_queue could now exceed our dev_max_batch. Re-check the max
-     * batch so we can honor our device's dev_max_batch.
-     */
-    if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
-        (!s->io_q.plugged &&
-         !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
+    if (!s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
         ioq_submit(s);
     }
 }
@@ -410,10 +389,12 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
 
     QSIMPLEQ_INSERT_TAIL(&s->io_q.pending, laiocb, next);
     s->io_q.in_queue++;
-    if (!s->io_q.blocked &&
-        (!s->io_q.plugged ||
-         s->io_q.in_queue >= laio_max_batch(s, dev_max_batch))) {
-        ioq_submit(s);
+    if (!s->io_q.blocked) {
+        if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch)) {
+            ioq_submit(s);
+        } else {
+            blk_io_plug_call(laio_unplug_fn, s);
+        }
     }
 
     return 0;
-- 
2.40.1


