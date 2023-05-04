Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB76F74F4
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530079.825436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1m-0007cx-L5; Thu, 04 May 2023 19:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530079.825436; Thu, 04 May 2023 19:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1m-0007V5-D1; Thu, 04 May 2023 19:54:10 +0000
Received: by outflank-mailman (input) for mailman id 530079;
 Thu, 04 May 2023 19:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1k-0003xx-DI
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c75c70b-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:54:05 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-mf16-bP3ON6rSVB1WZdIzA-1; Thu, 04 May 2023 15:54:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5EB4101A531;
 Thu,  4 May 2023 19:53:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00AB54020962;
 Thu,  4 May 2023 19:53:57 +0000 (UTC)
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
X-Inumbo-ID: 6c75c70b-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaJhEzn2xnk+TJZ+4gZYO3ndhDET6IVJHLdTW4Bnkp0=;
	b=OkR7Xgyrk9DRZ+GmfacqrWgXZ781Uwvtp77CWlpRDdaciJmLhCObMpDc78EIFyvv4qQ1ri
	3co3ZB8Ber+KuqHQ91JXqRvsszqqCjSqyy5DNy+AQWoc286ncoAKHFaduZxCZOgSSONzv2
	nGIRnXaUVCCnmXlw8aCYF7LfwZMNhmc=
X-MC-Unique: mf16-bP3ON6rSVB1WZdIzA-1
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
Subject: [PATCH v5 11/21] block: drain from main loop thread in bdrv_co_yield_to_drain()
Date: Thu,  4 May 2023 15:53:17 -0400
Message-Id: <20230504195327.695107-12-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

For simplicity, always run BlockDevOps .drained_begin/end/poll()
callbacks in the main loop thread. This makes it easier to implement the
callbacks and avoids extra locks.

Move the function pointer declarations from the I/O Code section to the
Global State section for BlockDevOps, BdrvChildClass, and BlockDriver.

Narrow IO_OR_GS_CODE() to GLOBAL_STATE_CODE() where appropriate.

The test-bdrv-drain test case calls bdrv_drain() from an IOThread. This
is now only allowed from coroutine context, so update the test case to
run in a coroutine.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block_int-common.h      | 90 +++++++++++++--------------
 include/sysemu/block-backend-common.h | 25 ++++----
 block/io.c                            | 14 +++--
 tests/unit/test-bdrv-drain.c          | 14 +++--
 4 files changed, 76 insertions(+), 67 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 013d419444..f462a8be55 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -356,6 +356,21 @@ struct BlockDriver {
     void (*bdrv_attach_aio_context)(BlockDriverState *bs,
                                     AioContext *new_context);
 
+    /**
+     * bdrv_drain_begin is called if implemented in the beginning of a
+     * drain operation to drain and stop any internal sources of requests in
+     * the driver.
+     * bdrv_drain_end is called if implemented at the end of the drain.
+     *
+     * They should be used by the driver to e.g. manage scheduled I/O
+     * requests, or toggle an internal state. After the end of the drain new
+     * requests will continue normally.
+     *
+     * Implementations of both functions must not call aio_poll().
+     */
+    void (*bdrv_drain_begin)(BlockDriverState *bs);
+    void (*bdrv_drain_end)(BlockDriverState *bs);
+
     /**
      * Try to get @bs's logical and physical block size.
      * On success, store them in @bsz and return zero.
@@ -743,21 +758,6 @@ struct BlockDriver {
     void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_unplug)(
         BlockDriverState *bs);
 
-    /**
-     * bdrv_drain_begin is called if implemented in the beginning of a
-     * drain operation to drain and stop any internal sources of requests in
-     * the driver.
-     * bdrv_drain_end is called if implemented at the end of the drain.
-     *
-     * They should be used by the driver to e.g. manage scheduled I/O
-     * requests, or toggle an internal state. After the end of the drain new
-     * requests will continue normally.
-     *
-     * Implementations of both functions must not call aio_poll().
-     */
-    void (*bdrv_drain_begin)(BlockDriverState *bs);
-    void (*bdrv_drain_end)(BlockDriverState *bs);
-
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
 
     bool coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_can_store_new_dirty_bitmap)(
@@ -920,36 +920,6 @@ struct BdrvChildClass {
     void GRAPH_WRLOCK_PTR (*attach)(BdrvChild *child);
     void GRAPH_WRLOCK_PTR (*detach)(BdrvChild *child);
 
-    /*
-     * Notifies the parent that the filename of its child has changed (e.g.
-     * because the direct child was removed from the backing chain), so that it
-     * can update its reference.
-     */
-    int (*update_filename)(BdrvChild *child, BlockDriverState *new_base,
-                           const char *filename, Error **errp);
-
-    bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
-                           GHashTable *visited, Transaction *tran,
-                           Error **errp);
-
-    /*
-     * I/O API functions. These functions are thread-safe.
-     *
-     * See include/block/block-io.h for more information about
-     * the I/O API.
-     */
-
-    void (*resize)(BdrvChild *child);
-
-    /*
-     * Returns a name that is supposedly more useful for human users than the
-     * node name for identifying the node in question (in particular, a BB
-     * name), or NULL if the parent can't provide a better name.
-     */
-    const char *(*get_name)(BdrvChild *child);
-
-    AioContext *(*get_parent_aio_context)(BdrvChild *child);
-
     /*
      * If this pair of functions is implemented, the parent doesn't issue new
      * requests after returning from .drained_begin() until .drained_end() is
@@ -970,6 +940,36 @@ struct BdrvChildClass {
      * activity on the child has stopped.
      */
     bool (*drained_poll)(BdrvChild *child);
+
+    /*
+     * Notifies the parent that the filename of its child has changed (e.g.
+     * because the direct child was removed from the backing chain), so that it
+     * can update its reference.
+     */
+    int (*update_filename)(BdrvChild *child, BlockDriverState *new_base,
+                           const char *filename, Error **errp);
+
+    bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
+                           GHashTable *visited, Transaction *tran,
+                           Error **errp);
+
+    /*
+     * I/O API functions. These functions are thread-safe.
+     *
+     * See include/block/block-io.h for more information about
+     * the I/O API.
+     */
+
+    void (*resize)(BdrvChild *child);
+
+    /*
+     * Returns a name that is supposedly more useful for human users than the
+     * node name for identifying the node in question (in particular, a BB
+     * name), or NULL if the parent can't provide a better name.
+     */
+    const char *(*get_name)(BdrvChild *child);
+
+    AioContext *(*get_parent_aio_context)(BdrvChild *child);
 };
 
 extern const BdrvChildClass child_of_bds;
diff --git a/include/sysemu/block-backend-common.h b/include/sysemu/block-backend-common.h
index 2391679c56..780cea7305 100644
--- a/include/sysemu/block-backend-common.h
+++ b/include/sysemu/block-backend-common.h
@@ -59,6 +59,19 @@ typedef struct BlockDevOps {
      */
     bool (*is_medium_locked)(void *opaque);
 
+    /*
+     * Runs when the backend receives a drain request.
+     */
+    void (*drained_begin)(void *opaque);
+    /*
+     * Runs when the backend's last drain request ends.
+     */
+    void (*drained_end)(void *opaque);
+    /*
+     * Is the device still busy?
+     */
+    bool (*drained_poll)(void *opaque);
+
     /*
      * I/O API functions. These functions are thread-safe.
      *
@@ -76,18 +89,6 @@ typedef struct BlockDevOps {
      * Runs when the size changed (e.g. monitor command block_resize)
      */
     void (*resize_cb)(void *opaque);
-    /*
-     * Runs when the backend receives a drain request.
-     */
-    void (*drained_begin)(void *opaque);
-    /*
-     * Runs when the backend's last drain request ends.
-     */
-    void (*drained_end)(void *opaque);
-    /*
-     * Is the device still busy?
-     */
-    bool (*drained_poll)(void *opaque);
 } BlockDevOps;
 
 /*
diff --git a/block/io.c b/block/io.c
index 6fa1993374..532c8c90c9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -60,7 +60,7 @@ static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore)
 
 void bdrv_parent_drained_end_single(BdrvChild *c)
 {
-    IO_OR_GS_CODE();
+    GLOBAL_STATE_CODE();
 
     assert(c->quiesced_parent);
     c->quiesced_parent = false;
@@ -108,7 +108,7 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
 
 void bdrv_parent_drained_begin_single(BdrvChild *c)
 {
-    IO_OR_GS_CODE();
+    GLOBAL_STATE_CODE();
 
     assert(!c->quiesced_parent);
     c->quiesced_parent = true;
@@ -248,7 +248,7 @@ typedef struct {
 bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent,
                      bool ignore_bds_parents)
 {
-    IO_OR_GS_CODE();
+    GLOBAL_STATE_CODE();
 
     if (bdrv_parent_drained_poll(bs, ignore_parent, ignore_bds_parents)) {
         return true;
@@ -335,7 +335,8 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     if (ctx != co_ctx) {
         aio_context_release(ctx);
     }
-    replay_bh_schedule_oneshot_event(ctx, bdrv_co_drain_bh_cb, &data);
+    replay_bh_schedule_oneshot_event(qemu_get_aio_context(),
+                                     bdrv_co_drain_bh_cb, &data);
 
     qemu_coroutine_yield();
     /* If we are resumed from some other event (such as an aio completion or a
@@ -358,6 +359,8 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
         return;
     }
 
+    GLOBAL_STATE_CODE();
+
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
         aio_disable_external(bdrv_get_aio_context(bs));
@@ -400,11 +403,14 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
 {
     int old_quiesce_counter;
 
+    IO_OR_GS_CODE();
+
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, false, parent, false);
         return;
     }
     assert(bs->quiesce_counter > 0);
+    GLOBAL_STATE_CODE();
 
     /* Re-enable things in child-to-parent order */
     old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index d9d3807062..dc3cb9e0e3 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -445,19 +445,19 @@ struct test_iothread_data {
     BlockDriverState *bs;
     enum drain_type drain_type;
     int *aio_ret;
+    bool co_done;
 };
 
-static void test_iothread_drain_entry(void *opaque)
+static void coroutine_fn test_iothread_drain_co_entry(void *opaque)
 {
     struct test_iothread_data *data = opaque;
 
-    aio_context_acquire(bdrv_get_aio_context(data->bs));
     do_drain_begin(data->drain_type, data->bs);
     g_assert_cmpint(*data->aio_ret, ==, 0);
     do_drain_end(data->drain_type, data->bs);
-    aio_context_release(bdrv_get_aio_context(data->bs));
 
-    qemu_event_set(&done_event);
+    data->co_done = true;
+    aio_wait_kick();
 }
 
 static void test_iothread_aio_cb(void *opaque, int ret)
@@ -493,6 +493,7 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
     BlockDriverState *bs;
     BDRVTestState *s;
     BlockAIOCB *acb;
+    Coroutine *co;
     int aio_ret;
     struct test_iothread_data data;
 
@@ -571,8 +572,9 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
         }
         break;
     case 1:
-        aio_bh_schedule_oneshot(ctx_a, test_iothread_drain_entry, &data);
-        qemu_event_wait(&done_event);
+        co = qemu_coroutine_create(test_iothread_drain_co_entry, &data);
+        aio_co_enter(ctx_a, co);
+        AIO_WAIT_WHILE_UNLOCKED(NULL, !data.co_done);
         break;
     default:
         g_assert_not_reached();
-- 
2.40.1


