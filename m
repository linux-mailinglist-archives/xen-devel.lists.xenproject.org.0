Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF7805D1F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648188.1012333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2G-0004ZB-2R; Tue, 05 Dec 2023 18:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648188.1012333; Tue, 05 Dec 2023 18:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2F-0004VP-T4; Tue, 05 Dec 2023 18:20:43 +0000
Received: by outflank-mailman (input) for mailman id 648188;
 Tue, 05 Dec 2023 18:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa2E-0002fT-N2
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe38e3d3-939a-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 19:20:40 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-jerahUbrOfKr08It_qIgXA-1; Tue,
 05 Dec 2023 13:20:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2508D1D6BEE3;
 Tue,  5 Dec 2023 18:20:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D40162166B31;
 Tue,  5 Dec 2023 18:20:31 +0000 (UTC)
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
X-Inumbo-ID: fe38e3d3-939a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vw22P8mnLUq8KteOIhRR1yuFI9XJA9QdIuPuhFXL9NY=;
	b=FsSaQmSHgT4z6unIsCnFfNHiQ/KunN5grsJuaDyzwUid/bZtNhrKRjAEGxbG5yT1vQwsdN
	w4c1/YtNmd+qtrvUPpgmdYNlTDwiV+GBCo7fWIFHA6OJXqtA7MI/DpF9pnq9Ixe73Wfh9c
	nyCicZqfOoxbNwUnYOffg6ogb1dYnkk=
X-MC-Unique: jerahUbrOfKr08It_qIgXA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Ari Sundholm <ari@tuxera.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Wen Congyang <wencongyang2@huawei.com>,
	Alberto Garcia <berto@igalia.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Peter Xu <peterx@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Leonardo Bras <leobras@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 06/14] block: remove AioContext locking
Date: Tue,  5 Dec 2023 13:20:03 -0500
Message-ID: <20231205182011.1976568-7-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

This is the big patch that removes
aio_context_acquire()/aio_context_release() from the block layer and
affected block layer users.

There isn't a clean way to split this patch and the reviewers are likely
the same group of people, so I decided to do it in one patch.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/block/block-global-state.h |   9 +-
 include/block/block-io.h           |   3 +-
 include/block/snapshot.h           |   2 -
 block.c                            | 234 +---------------------
 block/block-backend.c              |  14 --
 block/copy-before-write.c          |  22 +--
 block/export/export.c              |  22 +--
 block/io.c                         |  45 +----
 block/mirror.c                     |  19 --
 block/monitor/bitmap-qmp-cmds.c    |  20 +-
 block/monitor/block-hmp-cmds.c     |  29 ---
 block/qapi-sysemu.c                |  27 +--
 block/qapi.c                       |  18 +-
 block/raw-format.c                 |   5 -
 block/replication.c                |  58 +-----
 block/snapshot.c                   |  22 +--
 block/write-threshold.c            |   6 -
 blockdev.c                         | 307 +++++------------------------
 blockjob.c                         |  18 --
 hw/block/dataplane/virtio-blk.c    |  10 -
 hw/block/dataplane/xen-block.c     |  17 +-
 hw/block/virtio-blk.c              |  45 +----
 hw/core/qdev-properties-system.c   |   9 -
 job.c                              |  16 --
 migration/block.c                  |  33 +---
 migration/migration-hmp-cmds.c     |   3 -
 migration/savevm.c                 |  22 ---
 net/colo-compare.c                 |   2 -
 qemu-img.c                         |   4 -
 qemu-io.c                          |  10 +-
 qemu-nbd.c                         |   2 -
 replay/replay-debugging.c          |   4 -
 tests/unit/test-bdrv-drain.c       |  51 +----
 tests/unit/test-bdrv-graph-mod.c   |   6 -
 tests/unit/test-block-iothread.c   |  31 ---
 tests/unit/test-blockjob.c         | 137 -------------
 tests/unit/test-replication.c      |  11 --
 util/async.c                       |   4 -
 util/vhost-user-server.c           |   3 -
 scripts/block-coroutine-wrapper.py |   3 -
 tests/tsan/suppressions.tsan       |   1 -
 41 files changed, 102 insertions(+), 1202 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 6b21fbc73f..0327f1c605 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -31,11 +31,10 @@
 /*
  * Global state (GS) API. These functions run under the BQL.
  *
- * If a function modifies the graph, it also uses drain and/or
- * aio_context_acquire/release to be sure it has unique access.
- * aio_context locking is needed together with BQL because of
- * the thread-safe I/O API that concurrently runs and accesses
- * the graph without the BQL.
+ * If a function modifies the graph, it also uses the graph lock to be sure it
+ * has unique access. The graph lock is needed together with BQL because of the
+ * thread-safe I/O API that concurrently runs and accesses the graph without
+ * the BQL.
  *
  * It is important to note that not all of these functions are
  * necessarily limited to running under the BQL, but they would
diff --git a/include/block/block-io.h b/include/block/block-io.h
index f8729ccc55..8eb39a858b 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -31,8 +31,7 @@
 
 /*
  * I/O API functions. These functions are thread-safe, and therefore
- * can run in any thread as long as the thread has called
- * aio_context_acquire/release().
+ * can run in any thread.
  *
  * These functions can only call functions from I/O and Common categories,
  * but can be invoked by GS, "I/O or GS" and I/O APIs.
diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index d49c5599d9..304cc6ea61 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -86,8 +86,6 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriverState *bs,
 
 /*
  * Group operations. All block drivers are involved.
- * These functions will properly handle dataplane (take aio_context_acquire
- * when appropriate for appropriate block drivers
  */
 
 bool bdrv_all_can_snapshot(bool has_devices, strList *devices,
diff --git a/block.c b/block.c
index 25e1ebc606..91ace5d2d5 100644
--- a/block.c
+++ b/block.c
@@ -1625,7 +1625,6 @@ static int no_coroutine_fn GRAPH_UNLOCKED
 bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv, const char *node_name,
                  QDict *options, int open_flags, Error **errp)
 {
-    AioContext *ctx;
     Error *local_err = NULL;
     int i, ret;
     GLOBAL_STATE_CODE();
@@ -1673,21 +1672,15 @@ bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv, const char *node_name,
     bs->supported_read_flags |= BDRV_REQ_REGISTERED_BUF;
     bs->supported_write_flags |= BDRV_REQ_REGISTERED_BUF;
 
-    /* Get the context after .bdrv_open, it can change the context */
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
-
     ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not refresh total sector count");
-        aio_context_release(ctx);
         return ret;
     }
 
     bdrv_graph_rdlock_main_loop();
     bdrv_refresh_limits(bs, NULL, &local_err);
     bdrv_graph_rdunlock_main_loop();
-    aio_context_release(ctx);
 
     if (local_err) {
         error_propagate(errp, local_err);
@@ -3062,7 +3055,7 @@ bdrv_attach_child_common(BlockDriverState *child_bs,
                          Transaction *tran, Error **errp)
 {
     BdrvChild *new_child;
-    AioContext *parent_ctx, *new_child_ctx;
+    AioContext *parent_ctx;
     AioContext *child_ctx = bdrv_get_aio_context(child_bs);
 
     assert(child_class->get_parent_desc);
@@ -3114,12 +3107,6 @@ bdrv_attach_child_common(BlockDriverState *child_bs,
         }
     }
 
-    new_child_ctx = bdrv_get_aio_context(child_bs);
-    if (new_child_ctx != child_ctx) {
-        aio_context_release(child_ctx);
-        aio_context_acquire(new_child_ctx);
-    }
-
     bdrv_ref(child_bs);
     /*
      * Let every new BdrvChild start with a drained parent. Inserting the child
@@ -3149,11 +3136,6 @@ bdrv_attach_child_common(BlockDriverState *child_bs,
     };
     tran_add(tran, &bdrv_attach_child_common_drv, s);
 
-    if (new_child_ctx != child_ctx) {
-        aio_context_release(new_child_ctx);
-        aio_context_acquire(child_ctx);
-    }
-
     return new_child;
 }
 
@@ -3605,7 +3587,6 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
     int ret = 0;
     bool implicit_backing = false;
     BlockDriverState *backing_hd;
-    AioContext *backing_hd_ctx;
     QDict *options;
     QDict *tmp_parent_options = NULL;
     Error *local_err = NULL;
@@ -3691,11 +3672,8 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
 
     /* Hook up the backing file link; drop our reference, bs owns the
      * backing_hd reference now */
-    backing_hd_ctx = bdrv_get_aio_context(backing_hd);
-    aio_context_acquire(backing_hd_ctx);
     ret = bdrv_set_backing_hd(bs, backing_hd, errp);
     bdrv_unref(backing_hd);
-    aio_context_release(backing_hd_ctx);
 
     if (ret < 0) {
         goto free_exit;
@@ -3780,7 +3758,6 @@ BdrvChild *bdrv_open_child(const char *filename,
 {
     BlockDriverState *bs;
     BdrvChild *child;
-    AioContext *ctx;
 
     GLOBAL_STATE_CODE();
 
@@ -3791,11 +3768,8 @@ BdrvChild *bdrv_open_child(const char *filename,
     }
 
     bdrv_graph_wrlock();
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
     child = bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
                               errp);
-    aio_context_release(ctx);
     bdrv_graph_wrunlock();
 
     return child;
@@ -3881,7 +3855,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
-    AioContext *ctx = bdrv_get_aio_context(bs);
     int ret;
 
     GLOBAL_STATE_CODE();
@@ -3890,9 +3863,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
        instead of opening 'filename' directly */
 
     /* Get the required size from the image */
-    aio_context_acquire(ctx);
     total_size = bdrv_getlength(bs);
-    aio_context_release(ctx);
 
     if (total_size < 0) {
         error_setg_errno(errp, -total_size, "Could not get image size");
@@ -3927,10 +3898,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
         goto out;
     }
 
-    aio_context_acquire(ctx);
     ret = bdrv_append(bs_snapshot, bs, errp);
-    aio_context_release(ctx);
-
     if (ret < 0) {
         bs_snapshot = NULL;
         goto out;
@@ -3974,7 +3942,6 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
     Error *local_err = NULL;
     QDict *snapshot_options = NULL;
     int snapshot_flags = 0;
-    AioContext *ctx = qemu_get_aio_context();
 
     assert(!child_class || !flags);
     assert(!child_class == !parent);
@@ -4115,12 +4082,10 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
             /* Not requesting BLK_PERM_CONSISTENT_READ because we're only
              * looking at the header to guess the image format. This works even
              * in cases where a guest would not see a consistent state. */
-            ctx = bdrv_get_aio_context(file_bs);
-            aio_context_acquire(ctx);
+            AioContext *ctx = bdrv_get_aio_context(file_bs);
             file = blk_new(ctx, 0, BLK_PERM_ALL);
             blk_insert_bs(file, file_bs, &local_err);
             bdrv_unref(file_bs);
-            aio_context_release(ctx);
 
             if (local_err) {
                 goto fail;
@@ -4167,13 +4132,8 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
         goto fail;
     }
 
-    /* The AioContext could have changed during bdrv_open_common() */
-    ctx = bdrv_get_aio_context(bs);
-
     if (file) {
-        aio_context_acquire(ctx);
         blk_unref(file);
-        aio_context_release(ctx);
         file = NULL;
     }
 
@@ -4231,16 +4191,13 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
          * (snapshot_bs); thus, we have to drop the strong reference to bs
          * (which we obtained by calling bdrv_new()). bs will not be deleted,
          * though, because the overlay still has a reference to it. */
-        aio_context_acquire(ctx);
         bdrv_unref(bs);
-        aio_context_release(ctx);
         bs = snapshot_bs;
     }
 
     return bs;
 
 fail:
-    aio_context_acquire(ctx);
     blk_unref(file);
     qobject_unref(snapshot_options);
     qobject_unref(bs->explicit_options);
@@ -4249,14 +4206,11 @@ fail:
     bs->options = NULL;
     bs->explicit_options = NULL;
     bdrv_unref(bs);
-    aio_context_release(ctx);
     error_propagate(errp, local_err);
     return NULL;
 
 close_and_fail:
-    aio_context_acquire(ctx);
     bdrv_unref(bs);
-    aio_context_release(ctx);
     qobject_unref(snapshot_options);
     qobject_unref(options);
     error_propagate(errp, local_err);
@@ -4540,12 +4494,7 @@ void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
     if (bs_queue) {
         BlockReopenQueueEntry *bs_entry, *next;
         QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-            AioContext *ctx = bdrv_get_aio_context(bs_entry->state.bs);
-
-            aio_context_acquire(ctx);
             bdrv_drained_end(bs_entry->state.bs);
-            aio_context_release(ctx);
-
             qobject_unref(bs_entry->state.explicit_options);
             qobject_unref(bs_entry->state.options);
             g_free(bs_entry);
@@ -4577,7 +4526,6 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 {
     int ret = -1;
     BlockReopenQueueEntry *bs_entry, *next;
-    AioContext *ctx;
     Transaction *tran = tran_new();
     g_autoptr(GSList) refresh_list = NULL;
 
@@ -4586,10 +4534,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     GLOBAL_STATE_CODE();
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
-        ctx = bdrv_get_aio_context(bs_entry->state.bs);
-        aio_context_acquire(ctx);
         ret = bdrv_flush(bs_entry->state.bs);
-        aio_context_release(ctx);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Error flushing drive");
             goto abort;
@@ -4598,10 +4543,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
-        ctx = bdrv_get_aio_context(bs_entry->state.bs);
-        aio_context_acquire(ctx);
         ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, tran, errp);
-        aio_context_release(ctx);
         if (ret < 0) {
             goto abort;
         }
@@ -4644,10 +4586,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
      * to first element.
      */
     QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
-        ctx = bdrv_get_aio_context(bs_entry->state.bs);
-        aio_context_acquire(ctx);
         bdrv_reopen_commit(&bs_entry->state);
-        aio_context_release(ctx);
     }
 
     bdrv_graph_wrlock();
@@ -4658,10 +4597,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         BlockDriverState *bs = bs_entry->state.bs;
 
         if (bs->drv->bdrv_reopen_commit_post) {
-            ctx = bdrv_get_aio_context(bs);
-            aio_context_acquire(ctx);
             bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
-            aio_context_release(ctx);
         }
     }
 
@@ -4675,10 +4611,7 @@ abort:
 
     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
         if (bs_entry->prepared) {
-            ctx = bdrv_get_aio_context(bs_entry->state.bs);
-            aio_context_acquire(ctx);
             bdrv_reopen_abort(&bs_entry->state);
-            aio_context_release(ctx);
         }
     }
 
@@ -4691,24 +4624,13 @@ cleanup:
 int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
                 Error **errp)
 {
-    AioContext *ctx = bdrv_get_aio_context(bs);
     BlockReopenQueue *queue;
-    int ret;
 
     GLOBAL_STATE_CODE();
 
     queue = bdrv_reopen_queue(NULL, bs, opts, keep_old_opts);
 
-    if (ctx != qemu_get_aio_context()) {
-        aio_context_release(ctx);
-    }
-    ret = bdrv_reopen_multiple(queue, errp);
-
-    if (ctx != qemu_get_aio_context()) {
-        aio_context_acquire(ctx);
-    }
-
-    return ret;
+    return bdrv_reopen_multiple(queue, errp);
 }
 
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
@@ -4760,7 +4682,6 @@ bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
     const char *child_name = is_backing ? "backing" : "file";
     QObject *value;
     const char *str;
-    AioContext *ctx, *old_ctx;
     bool has_child;
     int ret;
 
@@ -4844,13 +4765,6 @@ bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
         bdrv_drained_begin(old_child_bs);
     }
 
-    old_ctx = bdrv_get_aio_context(bs);
-    ctx = bdrv_get_aio_context(new_child_bs);
-    if (old_ctx != ctx) {
-        aio_context_release(old_ctx);
-        aio_context_acquire(ctx);
-    }
-
     bdrv_graph_rdunlock_main_loop();
     bdrv_graph_wrlock();
 
@@ -4859,11 +4773,6 @@ bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
 
     bdrv_graph_wrunlock();
 
-    if (old_ctx != ctx) {
-        aio_context_release(ctx);
-        aio_context_acquire(old_ctx);
-    }
-
     if (old_child_bs) {
         bdrv_drained_end(old_child_bs);
         bdrv_unref(old_child_bs);
@@ -5537,7 +5446,6 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     int ret;
     BdrvChild *child;
     Transaction *tran = tran_new();
-    AioContext *old_context, *new_context = NULL;
 
     GLOBAL_STATE_CODE();
 
@@ -5545,21 +5453,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     assert(!bs_new->backing);
     bdrv_graph_rdunlock_main_loop();
 
-    old_context = bdrv_get_aio_context(bs_top);
     bdrv_drained_begin(bs_top);
-
-    /*
-     * bdrv_drained_begin() requires that only the AioContext of the drained
-     * node is locked, and at this point it can still differ from the AioContext
-     * of bs_top.
-     */
-    new_context = bdrv_get_aio_context(bs_new);
-    aio_context_release(old_context);
-    aio_context_acquire(new_context);
     bdrv_drained_begin(bs_new);
-    aio_context_release(new_context);
-    aio_context_acquire(old_context);
-    new_context = NULL;
 
     bdrv_graph_wrlock();
 
@@ -5571,18 +5466,6 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    /*
-     * bdrv_attach_child_noperm could change the AioContext of bs_top and
-     * bs_new, but at least they are in the same AioContext now. This is the
-     * AioContext that we need to lock for the rest of the function.
-     */
-    new_context = bdrv_get_aio_context(bs_top);
-
-    if (old_context != new_context) {
-        aio_context_release(old_context);
-        aio_context_acquire(new_context);
-    }
-
     ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
     if (ret < 0) {
         goto out;
@@ -5598,11 +5481,6 @@ out:
     bdrv_drained_end(bs_top);
     bdrv_drained_end(bs_new);
 
-    if (new_context && old_context != new_context) {
-        aio_context_release(new_context);
-        aio_context_acquire(old_context);
-    }
-
     return ret;
 }
 
@@ -5697,12 +5575,8 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     GLOBAL_STATE_CODE();
 
-    aio_context_release(ctx);
-    aio_context_acquire(qemu_get_aio_context());
     new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
                                             errp);
-    aio_context_release(qemu_get_aio_context());
-    aio_context_acquire(ctx);
     assert(bdrv_get_aio_context(bs) == ctx);
 
     options = NULL; /* bdrv_new_open_driver() eats options */
@@ -7037,12 +6911,9 @@ void bdrv_activate_all(Error **errp)
     GRAPH_RDLOCK_GUARD_MAINLOOP();
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
-        AioContext *aio_context = bdrv_get_aio_context(bs);
         int ret;
 
-        aio_context_acquire(aio_context);
         ret = bdrv_activate(bs, errp);
-        aio_context_release(aio_context);
         if (ret < 0) {
             bdrv_next_cleanup(&it);
             return;
@@ -7137,20 +7008,10 @@ int bdrv_inactivate_all(void)
     BlockDriverState *bs = NULL;
     BdrvNextIterator it;
     int ret = 0;
-    GSList *aio_ctxs = NULL, *ctx;
 
     GLOBAL_STATE_CODE();
     GRAPH_RDLOCK_GUARD_MAINLOOP();
 
-    for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
-        AioContext *aio_context = bdrv_get_aio_context(bs);
-
-        if (!g_slist_find(aio_ctxs, aio_context)) {
-            aio_ctxs = g_slist_prepend(aio_ctxs, aio_context);
-            aio_context_acquire(aio_context);
-        }
-    }
-
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         /* Nodes with BDS parents are covered by recursion from the last
          * parent that gets inactivated. Don't inactivate them a second
@@ -7161,17 +7022,10 @@ int bdrv_inactivate_all(void)
         ret = bdrv_inactivate_recurse(bs);
         if (ret < 0) {
             bdrv_next_cleanup(&it);
-            goto out;
+            break;
         }
     }
 
-out:
-    for (ctx = aio_ctxs; ctx != NULL; ctx = ctx->next) {
-        AioContext *aio_context = ctx->data;
-        aio_context_release(aio_context);
-    }
-    g_slist_free(aio_ctxs);
-
     return ret;
 }
 
@@ -7257,11 +7111,8 @@ void bdrv_unref(BlockDriverState *bs)
 static void bdrv_schedule_unref_bh(void *opaque)
 {
     BlockDriverState *bs = opaque;
-    AioContext *ctx = bdrv_get_aio_context(bs);
 
-    aio_context_acquire(ctx);
     bdrv_unref(bs);
-    aio_context_release(ctx);
 }
 
 /*
@@ -7398,8 +7249,6 @@ void bdrv_img_create(const char *filename, const char *fmt,
         return;
     }
 
-    aio_context_acquire(qemu_get_aio_context());
-
     /* Create parameter list */
     create_opts = qemu_opts_append(create_opts, drv->create_opts);
     create_opts = qemu_opts_append(create_opts, proto_drv->create_opts);
@@ -7549,7 +7398,6 @@ out:
     qemu_opts_del(opts);
     qemu_opts_free(create_opts);
     error_propagate(errp, local_err);
-    aio_context_release(qemu_get_aio_context());
 }
 
 AioContext *bdrv_get_aio_context(BlockDriverState *bs)
@@ -7585,29 +7433,12 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx)
 
 void coroutine_fn bdrv_co_lock(BlockDriverState *bs)
 {
-    AioContext *ctx = bdrv_get_aio_context(bs);
-
-    /* In the main thread, bs->aio_context won't change concurrently */
-    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
-
-    /*
-     * We're in coroutine context, so we already hold the lock of the main
-     * loop AioContext. Don't lock it twice to avoid deadlocks.
-     */
-    assert(qemu_in_coroutine());
-    if (ctx != qemu_get_aio_context()) {
-        aio_context_acquire(ctx);
-    }
+    /* TODO removed in next patch */
 }
 
 void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
 {
-    AioContext *ctx = bdrv_get_aio_context(bs);
-
-    assert(qemu_in_coroutine());
-    if (ctx != qemu_get_aio_context()) {
-        aio_context_release(ctx);
-    }
+    /* TODO removed in next patch */
 }
 
 static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
@@ -7728,21 +7559,8 @@ static void bdrv_set_aio_context_commit(void *opaque)
     BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
     BlockDriverState *bs = (BlockDriverState *) state->bs;
     AioContext *new_context = state->new_ctx;
-    AioContext *old_context = bdrv_get_aio_context(bs);
 
-    /*
-     * Take the old AioContex when detaching it from bs.
-     * At this point, new_context lock is already acquired, and we are now
-     * also taking old_context. This is safe as long as bdrv_detach_aio_context
-     * does not call AIO_POLL_WHILE().
-     */
-    if (old_context != qemu_get_aio_context()) {
-        aio_context_acquire(old_context);
-    }
     bdrv_detach_aio_context(bs);
-    if (old_context != qemu_get_aio_context()) {
-        aio_context_release(old_context);
-    }
     bdrv_attach_aio_context(bs, new_context);
 }
 
@@ -7827,7 +7645,6 @@ int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
     Transaction *tran;
     GHashTable *visited;
     int ret;
-    AioContext *old_context = bdrv_get_aio_context(bs);
     GLOBAL_STATE_CODE();
 
     /*
@@ -7857,34 +7674,7 @@ int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
         return -EPERM;
     }
 
-    /*
-     * Release old AioContext, it won't be needed anymore, as all
-     * bdrv_drained_begin() have been called already.
-     */
-    if (qemu_get_aio_context() != old_context) {
-        aio_context_release(old_context);
-    }
-
-    /*
-     * Acquire new AioContext since bdrv_drained_end() is going to be called
-     * after we switched all nodes in the new AioContext, and the function
-     * assumes that the lock of the bs is always taken.
-     */
-    if (qemu_get_aio_context() != ctx) {
-        aio_context_acquire(ctx);
-    }
-
     tran_commit(tran);
-
-    if (qemu_get_aio_context() != ctx) {
-        aio_context_release(ctx);
-    }
-
-    /* Re-acquire the old AioContext, since the caller takes and releases it. */
-    if (qemu_get_aio_context() != old_context) {
-        aio_context_acquire(old_context);
-    }
-
     return 0;
 }
 
@@ -8006,7 +7796,6 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
                                         const char *node_name, Error **errp)
 {
     BlockDriverState *to_replace_bs = bdrv_find_node(node_name);
-    AioContext *aio_context;
 
     GLOBAL_STATE_CODE();
 
@@ -8015,12 +7804,8 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
         return NULL;
     }
 
-    aio_context = bdrv_get_aio_context(to_replace_bs);
-    aio_context_acquire(aio_context);
-
     if (bdrv_op_is_blocked(to_replace_bs, BLOCK_OP_TYPE_REPLACE, errp)) {
-        to_replace_bs = NULL;
-        goto out;
+        return NULL;
     }
 
     /* We don't want arbitrary node of the BDS chain to be replaced only the top
@@ -8033,12 +7818,9 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
                    "because it cannot be guaranteed that doing so would not "
                    "lead to an abrupt change of visible data",
                    node_name, parent_bs->node_name);
-        to_replace_bs = NULL;
-        goto out;
+        return NULL;
     }
 
-out:
-    aio_context_release(aio_context);
     return to_replace_bs;
 }
 
diff --git a/block/block-backend.c b/block/block-backend.c
index abac4e0235..f412bed274 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -429,7 +429,6 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
 {
     BlockBackend *blk;
     BlockDriverState *bs;
-    AioContext *ctx;
     uint64_t perm = 0;
     uint64_t shared = BLK_PERM_ALL;
 
@@ -459,23 +458,18 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
         shared = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
     }
 
-    aio_context_acquire(qemu_get_aio_context());
     bs = bdrv_open(filename, reference, options, flags, errp);
-    aio_context_release(qemu_get_aio_context());
     if (!bs) {
         return NULL;
     }
 
     /* bdrv_open() could have moved bs to a different AioContext */
-    ctx = bdrv_get_aio_context(bs);
     blk = blk_new(bdrv_get_aio_context(bs), perm, shared);
     blk->perm = perm;
     blk->shared_perm = shared;
 
-    aio_context_acquire(ctx);
     blk_insert_bs(blk, bs, errp);
     bdrv_unref(bs);
-    aio_context_release(ctx);
 
     if (!blk->root) {
         blk_unref(blk);
@@ -577,13 +571,9 @@ void blk_remove_all_bs(void)
     GLOBAL_STATE_CODE();
 
     while ((blk = blk_all_next(blk)) != NULL) {
-        AioContext *ctx = blk_get_aio_context(blk);
-
-        aio_context_acquire(ctx);
         if (blk->root) {
             blk_remove_bs(blk);
         }
-        aio_context_release(ctx);
     }
 }
 
@@ -2736,20 +2726,16 @@ int blk_commit_all(void)
     GRAPH_RDLOCK_GUARD_MAINLOOP();
 
     while ((blk = blk_all_next(blk)) != NULL) {
-        AioContext *aio_context = blk_get_aio_context(blk);
         BlockDriverState *unfiltered_bs = bdrv_skip_filters(blk_bs(blk));
 
-        aio_context_acquire(aio_context);
         if (blk_is_inserted(blk) && bdrv_cow_child(unfiltered_bs)) {
             int ret;
 
             ret = bdrv_commit(unfiltered_bs);
             if (ret < 0) {
-                aio_context_release(aio_context);
                 return ret;
             }
         }
-        aio_context_release(aio_context);
     }
     return 0;
 }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 13972879b1..0842a1a6df 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -412,7 +412,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     int64_t cluster_size;
     g_autoptr(BlockdevOptions) full_opts = NULL;
     BlockdevOptionsCbw *opts;
-    AioContext *ctx;
     int ret;
 
     full_opts = cbw_parse_options(options, errp);
@@ -435,15 +434,11 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 
     GRAPH_RDLOCK_GUARD_MAINLOOP();
 
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
-
     if (opts->bitmap) {
         bitmap = block_dirty_bitmap_lookup(opts->bitmap->node,
                                            opts->bitmap->name, NULL, errp);
         if (!bitmap) {
-            ret = -EINVAL;
-            goto out;
+            return -EINVAL;
         }
     }
     s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
@@ -461,24 +456,21 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
     cluster_size = block_copy_cluster_size(s->bcs);
 
     s->done_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
     if (!s->done_bitmap) {
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
     bdrv_disable_dirty_bitmap(s->done_bitmap);
 
     /* s->access_bitmap starts equal to bcs bitmap */
     s->access_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
     if (!s->access_bitmap) {
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
     bdrv_disable_dirty_bitmap(s->access_bitmap);
     bdrv_dirty_bitmap_merge_internal(s->access_bitmap,
@@ -487,11 +479,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 
     qemu_co_mutex_init(&s->lock);
     QLIST_INIT(&s->frozen_read_reqs);
-
-    ret = 0;
-out:
-    aio_context_release(ctx);
-    return ret;
+    return 0;
 }
 
 static void cbw_close(BlockDriverState *bs)
diff --git a/block/export/export.c b/block/export/export.c
index a8f274e526..6d51ae8ed7 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -114,7 +114,6 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     }
 
     ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
 
     if (export->iothread) {
         IOThread *iothread;
@@ -133,8 +132,6 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
         set_context_errp = fixed_iothread ? errp : NULL;
         ret = bdrv_try_change_aio_context(bs, new_ctx, NULL, set_context_errp);
         if (ret == 0) {
-            aio_context_release(ctx);
-            aio_context_acquire(new_ctx);
             ctx = new_ctx;
         } else if (fixed_iothread) {
             goto fail;
@@ -191,8 +188,6 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     assert(exp->blk != NULL);
 
     QLIST_INSERT_HEAD(&block_exports, exp, next);
-
-    aio_context_release(ctx);
     return exp;
 
 fail:
@@ -200,7 +195,6 @@ fail:
         blk_set_dev_ops(blk, NULL, NULL);
         blk_unref(blk);
     }
-    aio_context_release(ctx);
     if (exp) {
         g_free(exp->id);
         g_free(exp);
@@ -218,9 +212,6 @@ void blk_exp_ref(BlockExport *exp)
 static void blk_exp_delete_bh(void *opaque)
 {
     BlockExport *exp = opaque;
-    AioContext *aio_context = exp->ctx;
-
-    aio_context_acquire(aio_context);
 
     assert(exp->refcount == 0);
     QLIST_REMOVE(exp, next);
@@ -230,8 +221,6 @@ static void blk_exp_delete_bh(void *opaque)
     qapi_event_send_block_export_deleted(exp->id);
     g_free(exp->id);
     g_free(exp);
-
-    aio_context_release(aio_context);
 }
 
 void blk_exp_unref(BlockExport *exp)
@@ -249,22 +238,16 @@ void blk_exp_unref(BlockExport *exp)
  * connections and other internally held references start to shut down. When
  * the function returns, there may still be active references while the export
  * is in the process of shutting down.
- *
- * Acquires exp->ctx internally. Callers must *not* hold the lock.
  */
 void blk_exp_request_shutdown(BlockExport *exp)
 {
-    AioContext *aio_context = exp->ctx;
-
-    aio_context_acquire(aio_context);
-
     /*
      * If the user doesn't own the export any more, it is already shutting
      * down. We must not call .request_shutdown and decrease the refcount a
      * second time.
      */
     if (!exp->user_owned) {
-        goto out;
+        return;
     }
 
     exp->drv->request_shutdown(exp);
@@ -272,9 +255,6 @@ void blk_exp_request_shutdown(BlockExport *exp)
     assert(exp->user_owned);
     exp->user_owned = false;
     blk_exp_unref(exp);
-
-out:
-    aio_context_release(aio_context);
 }
 
 /*
diff --git a/block/io.c b/block/io.c
index 7e62fabbf5..8fa7670571 100644
--- a/block/io.c
+++ b/block/io.c
@@ -294,8 +294,6 @@ static void bdrv_co_drain_bh_cb(void *opaque)
     BlockDriverState *bs = data->bs;
 
     if (bs) {
-        AioContext *ctx = bdrv_get_aio_context(bs);
-        aio_context_acquire(ctx);
         bdrv_dec_in_flight(bs);
         if (data->begin) {
             bdrv_do_drained_begin(bs, data->parent, data->poll);
@@ -303,7 +301,6 @@ static void bdrv_co_drain_bh_cb(void *opaque)
             assert(!data->poll);
             bdrv_do_drained_end(bs, data->parent);
         }
-        aio_context_release(ctx);
     } else {
         assert(data->begin);
         bdrv_drain_all_begin();
@@ -320,8 +317,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
 {
     BdrvCoDrainData data;
     Coroutine *self = qemu_coroutine_self();
-    AioContext *ctx = bdrv_get_aio_context(bs);
-    AioContext *co_ctx = qemu_coroutine_get_aio_context(self);
 
     /* Calling bdrv_drain() from a BH ensures the current coroutine yields and
      * other coroutines run if they were queued by aio_co_enter(). */
@@ -340,17 +335,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         bdrv_inc_in_flight(bs);
     }
 
-    /*
-     * Temporarily drop the lock across yield or we would get deadlocks.
-     * bdrv_co_drain_bh_cb() reaquires the lock as needed.
-     *
-     * When we yield below, the lock for the current context will be
-     * released, so if this is actually the lock that protects bs, don't drop
-     * it a second time.
-     */
-    if (ctx != co_ctx) {
-        aio_context_release(ctx);
-    }
     replay_bh_schedule_oneshot_event(qemu_get_aio_context(),
                                      bdrv_co_drain_bh_cb, &data);
 
@@ -358,11 +342,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     /* If we are resumed from some other event (such as an aio completion or a
      * timer callback), it is a bug in the caller that should be fixed. */
     assert(data.done);
-
-    /* Reacquire the AioContext of bs if we dropped it */
-    if (ctx != co_ctx) {
-        aio_context_acquire(ctx);
-    }
 }
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
@@ -478,13 +457,12 @@ static bool bdrv_drain_all_poll(void)
     GLOBAL_STATE_CODE();
     GRAPH_RDLOCK_GUARD_MAINLOOP();
 
-    /* bdrv_drain_poll() can't make changes to the graph and we are holding the
-     * main AioContext lock, so iterating bdrv_next_all_states() is safe. */
+    /*
+     * bdrv_drain_poll() can't make changes to the graph and we hold the BQL,
+     * so iterating bdrv_next_all_states() is safe.
+     */
     while ((bs = bdrv_next_all_states(bs))) {
-        AioContext *aio_context = bdrv_get_aio_context(bs);
-        aio_context_acquire(aio_context);
         result |= bdrv_drain_poll(bs, NULL, true);
-        aio_context_release(aio_context);
     }
 
     return result;
@@ -525,11 +503,7 @@ void bdrv_drain_all_begin_nopoll(void)
     /* Quiesce all nodes, without polling in-flight requests yet. The graph
      * cannot change during this loop. */
     while ((bs = bdrv_next_all_states(bs))) {
-        AioContext *aio_context = bdrv_get_aio_context(bs);
-
-        aio_context_acquire(aio_context);
         bdrv_do_drained_begin(bs, NULL, false);
-        aio_context_release(aio_context);
     }
 }
 
@@ -588,11 +562,7 @@ void bdrv_drain_all_end(void)
     }
 
     while ((bs = bdrv_next_all_states(bs))) {
-        AioContext *aio_context = bdrv_get_aio_context(bs);
-
-        aio_context_acquire(aio_context);
         bdrv_do_drained_end(bs, NULL);
-        aio_context_release(aio_context);
     }
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
@@ -2368,15 +2338,10 @@ int bdrv_flush_all(void)
     }
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
-        AioContext *aio_context = bdrv_get_aio_context(bs);
-        int ret;
-
-        aio_context_acquire(aio_context);
-        ret = bdrv_flush(bs);
+        int ret = bdrv_flush(bs);
         if (ret < 0 && !result) {
             result = ret;
         }
-        aio_context_release(aio_context);
     }
 
     return result;
diff --git a/block/mirror.c b/block/mirror.c
index 51f9e2f17c..5145eb53e1 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -662,7 +662,6 @@ static int mirror_exit_common(Job *job)
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockJob *bjob = &s->common;
     MirrorBDSOpaque *bs_opaque;
-    AioContext *replace_aio_context = NULL;
     BlockDriverState *src;
     BlockDriverState *target_bs;
     BlockDriverState *mirror_top_bs;
@@ -677,7 +676,6 @@ static int mirror_exit_common(Job *job)
     }
     s->prepared = true;
 
-    aio_context_acquire(qemu_get_aio_context());
     bdrv_graph_rdlock_main_loop();
 
     mirror_top_bs = s->mirror_top_bs;
@@ -742,11 +740,6 @@ static int mirror_exit_common(Job *job)
     }
     bdrv_graph_rdunlock_main_loop();
 
-    if (s->to_replace) {
-        replace_aio_context = bdrv_get_aio_context(s->to_replace);
-        aio_context_acquire(replace_aio_context);
-    }
-
     if (s->should_complete && !abort) {
         BlockDriverState *to_replace = s->to_replace ?: src;
         bool ro = bdrv_is_read_only(to_replace);
@@ -785,9 +778,6 @@ static int mirror_exit_common(Job *job)
         error_free(s->replace_blocker);
         bdrv_unref(s->to_replace);
     }
-    if (replace_aio_context) {
-        aio_context_release(replace_aio_context);
-    }
     g_free(s->replaces);
 
     /*
@@ -811,8 +801,6 @@ static int mirror_exit_common(Job *job)
     bdrv_unref(mirror_top_bs);
     bdrv_unref(src);
 
-    aio_context_release(qemu_get_aio_context());
-
     return ret;
 }
 
@@ -1191,24 +1179,17 @@ static void mirror_complete(Job *job, Error **errp)
 
     /* block all operations on to_replace bs */
     if (s->replaces) {
-        AioContext *replace_aio_context;
-
         s->to_replace = bdrv_find_node(s->replaces);
         if (!s->to_replace) {
             error_setg(errp, "Node name '%s' not found", s->replaces);
             return;
         }
 
-        replace_aio_context = bdrv_get_aio_context(s->to_replace);
-        aio_context_acquire(replace_aio_context);
-
         /* TODO Translate this into child freeze system. */
         error_setg(&s->replace_blocker,
                    "block device is in use by block-job-complete");
         bdrv_op_block_all(s->to_replace, s->replace_blocker);
         bdrv_ref(s->to_replace);
-
-        aio_context_release(replace_aio_context);
     }
 
     s->should_complete = true;
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 70d01a3776..a738e7bbf7 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -95,7 +95,6 @@ void qmp_block_dirty_bitmap_add(const char *node, const char *name,
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
-    AioContext *aio_context;
 
     if (!name || name[0] == '\0') {
         error_setg(errp, "Bitmap name cannot be empty");
@@ -107,14 +106,11 @@ void qmp_block_dirty_bitmap_add(const char *node, const char *name,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     if (has_granularity) {
         if (granularity < 512 || !is_power_of_2(granularity)) {
             error_setg(errp, "Granularity must be power of 2 "
                              "and at least 512");
-            goto out;
+            return;
         }
     } else {
         /* Default to cluster size, if available: */
@@ -132,12 +128,12 @@ void qmp_block_dirty_bitmap_add(const char *node, const char *name,
     if (persistent &&
         !bdrv_can_store_new_dirty_bitmap(bs, name, granularity, errp))
     {
-        goto out;
+        return;
     }
 
     bitmap = bdrv_create_dirty_bitmap(bs, granularity, name, errp);
     if (bitmap == NULL) {
-        goto out;
+        return;
     }
 
     if (disabled) {
@@ -145,9 +141,6 @@ void qmp_block_dirty_bitmap_add(const char *node, const char *name,
     }
 
     bdrv_dirty_bitmap_set_persistence(bitmap, persistent);
-
-out:
-    aio_context_release(aio_context);
 }
 
 BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
@@ -157,7 +150,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
-    AioContext *aio_context;
 
     GLOBAL_STATE_CODE();
 
@@ -166,19 +158,14 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
         return NULL;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     if (bdrv_dirty_bitmap_check(bitmap, BDRV_BITMAP_BUSY | BDRV_BITMAP_RO,
                                 errp)) {
-        aio_context_release(aio_context);
         return NULL;
     }
 
     if (bdrv_dirty_bitmap_get_persistence(bitmap) &&
         bdrv_remove_persistent_dirty_bitmap(bs, name, errp) < 0)
     {
-        aio_context_release(aio_context);
         return NULL;
     }
 
@@ -190,7 +177,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
         *bitmap_bs = bs;
     }
 
-    aio_context_release(aio_context);
     return release ? NULL : bitmap;
 }
 
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index c729cbf1eb..bdbb5cb141 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -141,7 +141,6 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
     const char *id = qdict_get_str(qdict, "id");
     BlockBackend *blk;
     BlockDriverState *bs;
-    AioContext *aio_context;
     Error *local_err = NULL;
 
     GLOBAL_STATE_CODE();
@@ -168,14 +167,10 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    aio_context = blk_get_aio_context(blk);
-    aio_context_acquire(aio_context);
-
     bs = blk_bs(blk);
     if (bs) {
         if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_DRIVE_DEL, &local_err)) {
             error_report_err(local_err);
-            aio_context_release(aio_context);
             return;
         }
 
@@ -196,8 +191,6 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
     } else {
         blk_unref(blk);
     }
-
-    aio_context_release(aio_context);
 }
 
 void hmp_commit(Monitor *mon, const QDict *qdict)
@@ -213,7 +206,6 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
         ret = blk_commit_all();
     } else {
         BlockDriverState *bs;
-        AioContext *aio_context;
 
         blk = blk_by_name(device);
         if (!blk) {
@@ -222,18 +214,13 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
         }
 
         bs = bdrv_skip_implicit_filters(blk_bs(blk));
-        aio_context = bdrv_get_aio_context(bs);
-        aio_context_acquire(aio_context);
 
         if (!blk_is_available(blk)) {
             error_report("Device '%s' has no medium", device);
-            aio_context_release(aio_context);
             return;
         }
 
         ret = bdrv_commit(bs);
-
-        aio_context_release(aio_context);
     }
     if (ret < 0) {
         error_report("'commit' error for '%s': %s", device, strerror(-ret));
@@ -560,7 +547,6 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
     BlockBackend *blk = NULL;
     BlockDriverState *bs = NULL;
     BlockBackend *local_blk = NULL;
-    AioContext *ctx = NULL;
     bool qdev = qdict_get_try_bool(qdict, "qdev", false);
     const char *device = qdict_get_str(qdict, "device");
     const char *command = qdict_get_str(qdict, "command");
@@ -582,9 +568,6 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
         }
     }
 
-    ctx = blk ? blk_get_aio_context(blk) : bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
-
     if (bs) {
         blk = local_blk = blk_new(bdrv_get_aio_context(bs), 0, BLK_PERM_ALL);
         ret = blk_insert_bs(blk, bs, &err);
@@ -622,11 +605,6 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
 
 fail:
     blk_unref(local_blk);
-
-    if (ctx) {
-        aio_context_release(ctx);
-    }
-
     hmp_handle_error(mon, err);
 }
 
@@ -882,7 +860,6 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
     int nb_sns, i;
     int total;
     int *global_snapshots;
-    AioContext *aio_context;
 
     typedef struct SnapshotEntry {
         QEMUSnapshotInfo sn;
@@ -909,11 +886,8 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
         error_report_err(err);
         return;
     }
-    aio_context = bdrv_get_aio_context(bs);
 
-    aio_context_acquire(aio_context);
     nb_sns = bdrv_snapshot_list(bs, &sn_tab);
-    aio_context_release(aio_context);
 
     if (nb_sns < 0) {
         monitor_printf(mon, "bdrv_snapshot_list: error %d\n", nb_sns);
@@ -924,9 +898,7 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
         int bs1_nb_sns = 0;
         ImageEntry *ie;
         SnapshotEntry *se;
-        AioContext *ctx = bdrv_get_aio_context(bs1);
 
-        aio_context_acquire(ctx);
         if (bdrv_can_snapshot(bs1)) {
             sn = NULL;
             bs1_nb_sns = bdrv_snapshot_list(bs1, &sn);
@@ -944,7 +916,6 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
             }
             g_free(sn);
         }
-        aio_context_release(ctx);
     }
 
     if (no_snapshot) {
diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
index 1618cd225a..e4282631d2 100644
--- a/block/qapi-sysemu.c
+++ b/block/qapi-sysemu.c
@@ -174,7 +174,6 @@ blockdev_remove_medium(const char *device, const char *id, Error **errp)
 {
     BlockBackend *blk;
     BlockDriverState *bs;
-    AioContext *aio_context;
     bool has_attached_device;
 
     GLOBAL_STATE_CODE();
@@ -204,13 +203,10 @@ blockdev_remove_medium(const char *device, const char *id, Error **errp)
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     bdrv_graph_rdlock_main_loop();
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_EJECT, errp)) {
         bdrv_graph_rdunlock_main_loop();
-        goto out;
+        return;
     }
     bdrv_graph_rdunlock_main_loop();
 
@@ -223,9 +219,6 @@ blockdev_remove_medium(const char *device, const char *id, Error **errp)
          * value passed here (i.e. false). */
         blk_dev_change_media_cb(blk, false, &error_abort);
     }
-
-out:
-    aio_context_release(aio_context);
 }
 
 void qmp_blockdev_remove_medium(const char *id, Error **errp)
@@ -237,7 +230,6 @@ static void qmp_blockdev_insert_anon_medium(BlockBackend *blk,
                                             BlockDriverState *bs, Error **errp)
 {
     Error *local_err = NULL;
-    AioContext *ctx;
     bool has_device;
     int ret;
 
@@ -259,11 +251,7 @@ static void qmp_blockdev_insert_anon_medium(BlockBackend *blk,
         return;
     }
 
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
     ret = blk_insert_bs(blk, bs, errp);
-    aio_context_release(ctx);
-
     if (ret < 0) {
         return;
     }
@@ -374,9 +362,7 @@ void qmp_blockdev_change_medium(const char *device,
         qdict_put_str(options, "driver", format);
     }
 
-    aio_context_acquire(qemu_get_aio_context());
     medium_bs = bdrv_open(filename, NULL, options, bdrv_flags, errp);
-    aio_context_release(qemu_get_aio_context());
 
     if (!medium_bs) {
         goto fail;
@@ -437,20 +423,16 @@ void qmp_block_set_io_throttle(BlockIOThrottle *arg, Error **errp)
     ThrottleConfig cfg;
     BlockDriverState *bs;
     BlockBackend *blk;
-    AioContext *aio_context;
 
     blk = qmp_get_blk(arg->device, arg->id, errp);
     if (!blk) {
         return;
     }
 
-    aio_context = blk_get_aio_context(blk);
-    aio_context_acquire(aio_context);
-
     bs = blk_bs(blk);
     if (!bs) {
         error_setg(errp, "Device has no medium");
-        goto out;
+        return;
     }
 
     throttle_config_init(&cfg);
@@ -505,7 +487,7 @@ void qmp_block_set_io_throttle(BlockIOThrottle *arg, Error **errp)
     }
 
     if (!throttle_is_valid(&cfg, errp)) {
-        goto out;
+        return;
     }
 
     if (throttle_enabled(&cfg)) {
@@ -522,9 +504,6 @@ void qmp_block_set_io_throttle(BlockIOThrottle *arg, Error **errp)
         /* If all throttling settings are set to 0, disable I/O limits */
         blk_io_limits_disable(blk);
     }
-
-out:
-    aio_context_release(aio_context);
 }
 
 void qmp_block_latency_histogram_set(
diff --git a/block/qapi.c b/block/qapi.c
index 82a30b38fe..9e806fa230 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -234,13 +234,11 @@ bdrv_do_query_node_info(BlockDriverState *bs, BlockNodeInfo *info, Error **errp)
     int ret;
     Error *err = NULL;
 
-    aio_context_acquire(bdrv_get_aio_context(bs));
-
     size = bdrv_getlength(bs);
     if (size < 0) {
         error_setg_errno(errp, -size, "Can't get image size '%s'",
                          bs->exact_filename);
-        goto out;
+        return;
     }
 
     bdrv_refresh_filename(bs);
@@ -265,7 +263,7 @@ bdrv_do_query_node_info(BlockDriverState *bs, BlockNodeInfo *info, Error **errp)
     info->format_specific = bdrv_get_specific_info(bs, &err);
     if (err) {
         error_propagate(errp, err);
-        goto out;
+        return;
     }
     backing_filename = bs->backing_file;
     if (backing_filename[0] != '\0') {
@@ -300,11 +298,8 @@ bdrv_do_query_node_info(BlockDriverState *bs, BlockNodeInfo *info, Error **errp)
         break;
     default:
         error_propagate(errp, err);
-        goto out;
+        return;
     }
-
-out:
-    aio_context_release(bdrv_get_aio_context(bs));
 }
 
 /**
@@ -709,15 +704,10 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
     /* Just to be safe if query_nodes is not always initialized */
     if (has_query_nodes && query_nodes) {
         for (bs = bdrv_next_node(NULL); bs; bs = bdrv_next_node(bs)) {
-            AioContext *ctx = bdrv_get_aio_context(bs);
-
-            aio_context_acquire(ctx);
             QAPI_LIST_APPEND(tail, bdrv_query_bds_stats(bs, false));
-            aio_context_release(ctx);
         }
     } else {
         for (blk = blk_all_next(NULL); blk; blk = blk_all_next(blk)) {
-            AioContext *ctx = blk_get_aio_context(blk);
             BlockStats *s;
             char *qdev;
 
@@ -725,7 +715,6 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
                 continue;
             }
 
-            aio_context_acquire(ctx);
             s = bdrv_query_bds_stats(blk_bs(blk), true);
             s->device = g_strdup(blk_name(blk));
 
@@ -737,7 +726,6 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
             }
 
             bdrv_query_blk_stats(s->stats, blk);
-            aio_context_release(ctx);
 
             QAPI_LIST_APPEND(tail, s);
         }
diff --git a/block/raw-format.c b/block/raw-format.c
index 1111dffd54..ac7e8495f6 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -470,7 +470,6 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVRawState *s = bs->opaque;
-    AioContext *ctx;
     bool has_size;
     uint64_t offset, size;
     BdrvChildRole file_role;
@@ -522,11 +521,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
                 bs->file->bs->filename);
     }
 
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
     ret = raw_apply_options(bs, s, offset, has_size, size, errp);
-    aio_context_release(ctx);
-
     if (ret < 0) {
         return ret;
     }
diff --git a/block/replication.c b/block/replication.c
index 424b537ff7..ca6bd0a720 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -394,14 +394,7 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
     }
 
     if (reopen_queue) {
-        AioContext *ctx = bdrv_get_aio_context(bs);
-        if (ctx != qemu_get_aio_context()) {
-            aio_context_release(ctx);
-        }
         bdrv_reopen_multiple(reopen_queue, errp);
-        if (ctx != qemu_get_aio_context()) {
-            aio_context_acquire(ctx);
-        }
     }
 }
 
@@ -462,14 +455,11 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     BlockDriverState *top_bs;
     BdrvChild *active_disk, *hidden_disk, *secondary_disk;
     int64_t active_length, hidden_length, disk_length;
-    AioContext *aio_context;
     Error *local_err = NULL;
     BackupPerf perf = { .use_copy_range = true, .max_workers = 1 };
 
     GLOBAL_STATE_CODE();
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
     s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_DONE ||
@@ -479,20 +469,17 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
          * Ignore the request because the secondary side of replication
          * doesn't have to do anything anymore.
          */
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->stage != BLOCK_REPLICATION_NONE) {
         error_setg(errp, "Block replication is running or done");
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->mode != mode) {
         error_setg(errp, "The parameter mode's value is invalid, needs %d,"
                    " but got %d", s->mode, mode);
-        aio_context_release(aio_context);
         return;
     }
 
@@ -505,7 +492,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (!active_disk || !active_disk->bs || !active_disk->bs->backing) {
             error_setg(errp, "Active disk doesn't have backing file");
             bdrv_graph_rdunlock_main_loop();
-            aio_context_release(aio_context);
             return;
         }
 
@@ -513,7 +499,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (!hidden_disk->bs || !hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
             bdrv_graph_rdunlock_main_loop();
-            aio_context_release(aio_context);
             return;
         }
 
@@ -521,7 +506,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
             error_setg(errp, "The secondary disk doesn't have block backend");
             bdrv_graph_rdunlock_main_loop();
-            aio_context_release(aio_context);
             return;
         }
         bdrv_graph_rdunlock_main_loop();
@@ -534,7 +518,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             active_length != hidden_length || hidden_length != disk_length) {
             error_setg(errp, "Active disk, hidden disk, secondary disk's length"
                        " are not the same");
-            aio_context_release(aio_context);
             return;
         }
 
@@ -546,7 +529,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             !hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_empty");
-            aio_context_release(aio_context);
             bdrv_graph_rdunlock_main_loop();
             return;
         }
@@ -556,7 +538,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         reopen_backing_file(bs, true, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
-            aio_context_release(aio_context);
             return;
         }
 
@@ -569,7 +550,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (local_err) {
             error_propagate(errp, local_err);
             bdrv_graph_wrunlock();
-            aio_context_release(aio_context);
             return;
         }
 
@@ -580,7 +560,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (local_err) {
             error_propagate(errp, local_err);
             bdrv_graph_wrunlock();
-            aio_context_release(aio_context);
             return;
         }
 
@@ -594,7 +573,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             error_setg(errp, "No top_bs or it is invalid");
             bdrv_graph_wrunlock();
             reopen_backing_file(bs, false, NULL);
-            aio_context_release(aio_context);
             return;
         }
         bdrv_op_block_all(top_bs, s->blocker);
@@ -612,13 +590,11 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (local_err) {
             error_propagate(errp, local_err);
             backup_job_cleanup(bs);
-            aio_context_release(aio_context);
             return;
         }
         job_start(&s->backup_job->job);
         break;
     default:
-        aio_context_release(aio_context);
         abort();
     }
 
@@ -629,18 +605,12 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     }
 
     s->error = 0;
-    aio_context_release(aio_context);
 }
 
 static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
 {
     BlockDriverState *bs = rs->opaque;
-    BDRVReplicationState *s;
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-    s = bs->opaque;
+    BDRVReplicationState *s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_DONE ||
         s->stage == BLOCK_REPLICATION_FAILOVER) {
@@ -649,38 +619,28 @@ static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
          * Ignore the request because the secondary side of replication
          * doesn't have to do anything anymore.
          */
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
         secondary_do_checkpoint(bs, errp);
     }
-    aio_context_release(aio_context);
 }
 
 static void replication_get_error(ReplicationState *rs, Error **errp)
 {
     BlockDriverState *bs = rs->opaque;
-    BDRVReplicationState *s;
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-    s = bs->opaque;
+    BDRVReplicationState *s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_NONE) {
         error_setg(errp, "Block replication is not running");
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->error) {
         error_setg(errp, "I/O error occurred");
-        aio_context_release(aio_context);
         return;
     }
-    aio_context_release(aio_context);
 }
 
 static void replication_done(void *opaque, int ret)
@@ -708,12 +668,7 @@ static void replication_done(void *opaque, int ret)
 static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
 {
     BlockDriverState *bs = rs->opaque;
-    BDRVReplicationState *s;
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-    s = bs->opaque;
+    BDRVReplicationState *s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_DONE ||
         s->stage == BLOCK_REPLICATION_FAILOVER) {
@@ -722,13 +677,11 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * Ignore the request because the secondary side of replication
          * doesn't have to do anything anymore.
          */
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->stage != BLOCK_REPLICATION_RUNNING) {
         error_setg(errp, "Block replication is not running");
-        aio_context_release(aio_context);
         return;
     }
 
@@ -744,15 +697,12 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
-            aio_context_release(aio_context);
             job_cancel_sync(&s->backup_job->job, true);
-            aio_context_acquire(aio_context);
         }
 
         if (!failover) {
             secondary_do_checkpoint(bs, errp);
             s->stage = BLOCK_REPLICATION_DONE;
-            aio_context_release(aio_context);
             return;
         }
 
@@ -765,10 +715,8 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
         bdrv_graph_rdunlock_main_loop();
         break;
     default:
-        aio_context_release(aio_context);
         abort();
     }
-    aio_context_release(aio_context);
 }
 
 static const char *const replication_strong_runtime_opts[] = {
diff --git a/block/snapshot.c b/block/snapshot.c
index e486d3e205..a28f2b039f 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -525,9 +525,7 @@ static bool GRAPH_RDLOCK bdrv_all_snapshots_includes_bs(BlockDriverState *bs)
     return bdrv_has_blk(bs) || QLIST_EMPTY(&bs->parents);
 }
 
-/* Group operations. All block drivers are involved.
- * These functions will properly handle dataplane (take aio_context_acquire
- * when appropriate for appropriate block drivers) */
+/* Group operations. All block drivers are involved. */
 
 bool bdrv_all_can_snapshot(bool has_devices, strList *devices,
                            Error **errp)
@@ -545,14 +543,11 @@ bool bdrv_all_can_snapshot(bool has_devices, strList *devices,
     iterbdrvs = bdrvs;
     while (iterbdrvs) {
         BlockDriverState *bs = iterbdrvs->data;
-        AioContext *ctx = bdrv_get_aio_context(bs);
         bool ok = true;
 
-        aio_context_acquire(ctx);
         if (devices || bdrv_all_snapshots_includes_bs(bs)) {
             ok = bdrv_can_snapshot(bs);
         }
-        aio_context_release(ctx);
         if (!ok) {
             error_setg(errp, "Device '%s' is writable but does not support "
                        "snapshots", bdrv_get_device_or_node_name(bs));
@@ -582,18 +577,15 @@ int bdrv_all_delete_snapshot(const char *name,
     iterbdrvs = bdrvs;
     while (iterbdrvs) {
         BlockDriverState *bs = iterbdrvs->data;
-        AioContext *ctx = bdrv_get_aio_context(bs);
         QEMUSnapshotInfo sn1, *snapshot = &sn1;
         int ret = 0;
 
-        aio_context_acquire(ctx);
         if ((devices || bdrv_all_snapshots_includes_bs(bs)) &&
             bdrv_snapshot_find(bs, snapshot, name) >= 0)
         {
             ret = bdrv_snapshot_delete(bs, snapshot->id_str,
                                        snapshot->name, errp);
         }
-        aio_context_release(ctx);
         if (ret < 0) {
             error_prepend(errp, "Could not delete snapshot '%s' on '%s': ",
                           name, bdrv_get_device_or_node_name(bs));
@@ -628,17 +620,14 @@ int bdrv_all_goto_snapshot(const char *name,
     iterbdrvs = bdrvs;
     while (iterbdrvs) {
         BlockDriverState *bs = iterbdrvs->data;
-        AioContext *ctx = bdrv_get_aio_context(bs);
         bool all_snapshots_includes_bs;
 
-        aio_context_acquire(ctx);
         bdrv_graph_rdlock_main_loop();
         all_snapshots_includes_bs = bdrv_all_snapshots_includes_bs(bs);
         bdrv_graph_rdunlock_main_loop();
 
         ret = (devices || all_snapshots_includes_bs) ?
               bdrv_snapshot_goto(bs, name, errp) : 0;
-        aio_context_release(ctx);
         if (ret < 0) {
             bdrv_graph_rdlock_main_loop();
             error_prepend(errp, "Could not load snapshot '%s' on '%s': ",
@@ -670,15 +659,12 @@ int bdrv_all_has_snapshot(const char *name,
     iterbdrvs = bdrvs;
     while (iterbdrvs) {
         BlockDriverState *bs = iterbdrvs->data;
-        AioContext *ctx = bdrv_get_aio_context(bs);
         QEMUSnapshotInfo sn;
         int ret = 0;
 
-        aio_context_acquire(ctx);
         if (devices || bdrv_all_snapshots_includes_bs(bs)) {
             ret = bdrv_snapshot_find(bs, &sn, name);
         }
-        aio_context_release(ctx);
         if (ret < 0) {
             if (ret == -ENOENT) {
                 return 0;
@@ -715,10 +701,8 @@ int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
     iterbdrvs = bdrvs;
     while (iterbdrvs) {
         BlockDriverState *bs = iterbdrvs->data;
-        AioContext *ctx = bdrv_get_aio_context(bs);
         int ret = 0;
 
-        aio_context_acquire(ctx);
         if (bs == vm_state_bs) {
             sn->vm_state_size = vm_state_size;
             ret = bdrv_snapshot_create(bs, sn);
@@ -726,7 +710,6 @@ int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
             sn->vm_state_size = 0;
             ret = bdrv_snapshot_create(bs, sn);
         }
-        aio_context_release(ctx);
         if (ret < 0) {
             error_setg(errp, "Could not create snapshot '%s' on '%s'",
                        sn->name, bdrv_get_device_or_node_name(bs));
@@ -757,13 +740,10 @@ BlockDriverState *bdrv_all_find_vmstate_bs(const char *vmstate_bs,
     iterbdrvs = bdrvs;
     while (iterbdrvs) {
         BlockDriverState *bs = iterbdrvs->data;
-        AioContext *ctx = bdrv_get_aio_context(bs);
         bool found = false;
 
-        aio_context_acquire(ctx);
         found = (devices || bdrv_all_snapshots_includes_bs(bs)) &&
             bdrv_can_snapshot(bs);
-        aio_context_release(ctx);
 
         if (vmstate_bs) {
             if (g_str_equal(vmstate_bs,
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 76d8885677..56fe88de81 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -33,7 +33,6 @@ void qmp_block_set_write_threshold(const char *node_name,
                                    Error **errp)
 {
     BlockDriverState *bs;
-    AioContext *aio_context;
 
     bs = bdrv_find_node(node_name);
     if (!bs) {
@@ -41,12 +40,7 @@ void qmp_block_set_write_threshold(const char *node_name,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     bdrv_write_threshold_set(bs, threshold_bytes);
-
-    aio_context_release(aio_context);
 }
 
 void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
diff --git a/blockdev.c b/blockdev.c
index db9cc96510..8a1b28f830 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -662,7 +662,6 @@ err_no_opts:
 /* Takes the ownership of bs_opts */
 BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
 {
-    BlockDriverState *bs;
     int bdrv_flags = 0;
 
     GLOBAL_STATE_CODE();
@@ -677,11 +676,7 @@ BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
         bdrv_flags |= BDRV_O_INACTIVE;
     }
 
-    aio_context_acquire(qemu_get_aio_context());
-    bs = bdrv_open(NULL, NULL, bs_opts, bdrv_flags, errp);
-    aio_context_release(qemu_get_aio_context());
-
-    return bs;
+    return bdrv_open(NULL, NULL, bs_opts, bdrv_flags, errp);
 }
 
 void blockdev_close_all_bdrv_states(void)
@@ -690,11 +685,7 @@ void blockdev_close_all_bdrv_states(void)
 
     GLOBAL_STATE_CODE();
     QTAILQ_FOREACH_SAFE(bs, &monitor_bdrv_states, monitor_list, next_bs) {
-        AioContext *ctx = bdrv_get_aio_context(bs);
-
-        aio_context_acquire(ctx);
         bdrv_unref(bs);
-        aio_context_release(ctx);
     }
 }
 
@@ -1048,7 +1039,6 @@ fail:
 static BlockDriverState *qmp_get_root_bs(const char *name, Error **errp)
 {
     BlockDriverState *bs;
-    AioContext *aio_context;
 
     GRAPH_RDLOCK_GUARD_MAINLOOP();
 
@@ -1062,16 +1052,11 @@ static BlockDriverState *qmp_get_root_bs(const char *name, Error **errp)
         return NULL;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     if (!bdrv_is_inserted(bs)) {
         error_setg(errp, "Device has no medium");
         bs = NULL;
     }
 
-    aio_context_release(aio_context);
-
     return bs;
 }
 
@@ -1141,7 +1126,6 @@ SnapshotInfo *qmp_blockdev_snapshot_delete_internal_sync(const char *device,
                                                          Error **errp)
 {
     BlockDriverState *bs;
-    AioContext *aio_context;
     QEMUSnapshotInfo sn;
     Error *local_err = NULL;
     SnapshotInfo *info = NULL;
@@ -1154,39 +1138,35 @@ SnapshotInfo *qmp_blockdev_snapshot_delete_internal_sync(const char *device,
     if (!bs) {
         return NULL;
     }
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
 
     if (!id && !name) {
         error_setg(errp, "Name or id must be provided");
-        goto out_aio_context;
+        return NULL;
     }
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_INTERNAL_SNAPSHOT_DELETE, errp)) {
-        goto out_aio_context;
+        return NULL;
     }
 
     ret = bdrv_snapshot_find_by_id_and_name(bs, id, name, &sn, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out_aio_context;
+        return NULL;
     }
     if (!ret) {
         error_setg(errp,
                    "Snapshot with id '%s' and name '%s' does not exist on "
                    "device '%s'",
                    STR_OR_NULL(id), STR_OR_NULL(name), device);
-        goto out_aio_context;
+        return NULL;
     }
 
     bdrv_snapshot_delete(bs, id, name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out_aio_context;
+        return NULL;
     }
 
-    aio_context_release(aio_context);
-
     info = g_new0(SnapshotInfo, 1);
     info->id = g_strdup(sn.id_str);
     info->name = g_strdup(sn.name);
@@ -1201,10 +1181,6 @@ SnapshotInfo *qmp_blockdev_snapshot_delete_internal_sync(const char *device,
     }
 
     return info;
-
-out_aio_context:
-    aio_context_release(aio_context);
-    return NULL;
 }
 
 /* internal snapshot private data */
@@ -1232,7 +1208,6 @@ static void internal_snapshot_action(BlockdevSnapshotInternal *internal,
     bool ret;
     int64_t rt;
     InternalSnapshotState *state = g_new0(InternalSnapshotState, 1);
-    AioContext *aio_context;
     int ret1;
 
     GLOBAL_STATE_CODE();
@@ -1248,33 +1223,30 @@ static void internal_snapshot_action(BlockdevSnapshotInternal *internal,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     state->bs = bs;
 
     /* Paired with .clean() */
     bdrv_drained_begin(bs);
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_INTERNAL_SNAPSHOT, errp)) {
-        goto out;
+        return;
     }
 
     if (bdrv_is_read_only(bs)) {
         error_setg(errp, "Device '%s' is read only", device);
-        goto out;
+        return;
     }
 
     if (!bdrv_can_snapshot(bs)) {
         error_setg(errp, "Block format '%s' used by device '%s' "
                    "does not support internal snapshots",
                    bs->drv->format_name, device);
-        goto out;
+        return;
     }
 
     if (!strlen(name)) {
         error_setg(errp, "Name is empty");
-        goto out;
+        return;
     }
 
     /* check whether a snapshot with name exist */
@@ -1282,12 +1254,12 @@ static void internal_snapshot_action(BlockdevSnapshotInternal *internal,
                                             &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     } else if (ret) {
         error_setg(errp,
                    "Snapshot with name '%s' already exists on device '%s'",
                    name, device);
-        goto out;
+        return;
     }
 
     /* 3. take the snapshot */
@@ -1308,14 +1280,11 @@ static void internal_snapshot_action(BlockdevSnapshotInternal *internal,
         error_setg_errno(errp, -ret1,
                          "Failed to create snapshot '%s' on device '%s'",
                          name, device);
-        goto out;
+        return;
     }
 
     /* 4. succeed, mark a snapshot is created */
     state->created = true;
-
-out:
-    aio_context_release(aio_context);
 }
 
 static void internal_snapshot_abort(void *opaque)
@@ -1323,7 +1292,6 @@ static void internal_snapshot_abort(void *opaque)
     InternalSnapshotState *state = opaque;
     BlockDriverState *bs = state->bs;
     QEMUSnapshotInfo *sn = &state->sn;
-    AioContext *aio_context;
     Error *local_error = NULL;
 
     GLOBAL_STATE_CODE();
@@ -1333,9 +1301,6 @@ static void internal_snapshot_abort(void *opaque)
         return;
     }
 
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
-
     if (bdrv_snapshot_delete(bs, sn->id_str, sn->name, &local_error) < 0) {
         error_reportf_err(local_error,
                           "Failed to delete snapshot with id '%s' and "
@@ -1343,25 +1308,17 @@ static void internal_snapshot_abort(void *opaque)
                           sn->id_str, sn->name,
                           bdrv_get_device_name(bs));
     }
-
-    aio_context_release(aio_context);
 }
 
 static void internal_snapshot_clean(void *opaque)
 {
     g_autofree InternalSnapshotState *state = opaque;
-    AioContext *aio_context;
 
     if (!state->bs) {
         return;
     }
 
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
-
     bdrv_drained_end(state->bs);
-
-    aio_context_release(aio_context);
 }
 
 /* external snapshot private data */
@@ -1395,7 +1352,6 @@ static void external_snapshot_action(TransactionAction *action,
     /* File name of the new image (for 'blockdev-snapshot-sync') */
     const char *new_image_file;
     ExternalSnapshotState *state = g_new0(ExternalSnapshotState, 1);
-    AioContext *aio_context;
     uint64_t perm, shared;
 
     /* TODO We'll eventually have to take a writer lock in this function */
@@ -1435,26 +1391,23 @@ static void external_snapshot_action(TransactionAction *action,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(state->old_bs);
-    aio_context_acquire(aio_context);
-
     /* Paired with .clean() */
     bdrv_drained_begin(state->old_bs);
 
     if (!bdrv_is_inserted(state->old_bs)) {
         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, device);
-        goto out;
+        return;
     }
 
     if (bdrv_op_is_blocked(state->old_bs,
                            BLOCK_OP_TYPE_EXTERNAL_SNAPSHOT, errp)) {
-        goto out;
+        return;
     }
 
     if (!bdrv_is_read_only(state->old_bs)) {
         if (bdrv_flush(state->old_bs)) {
             error_setg(errp, QERR_IO_ERROR);
-            goto out;
+            return;
         }
     }
 
@@ -1466,13 +1419,13 @@ static void external_snapshot_action(TransactionAction *action,
 
         if (node_name && !snapshot_node_name) {
             error_setg(errp, "New overlay node-name missing");
-            goto out;
+            return;
         }
 
         if (snapshot_node_name &&
             bdrv_lookup_bs(snapshot_node_name, snapshot_node_name, NULL)) {
             error_setg(errp, "New overlay node-name already in use");
-            goto out;
+            return;
         }
 
         flags = state->old_bs->open_flags;
@@ -1485,20 +1438,18 @@ static void external_snapshot_action(TransactionAction *action,
             int64_t size = bdrv_getlength(state->old_bs);
             if (size < 0) {
                 error_setg_errno(errp, -size, "bdrv_getlength failed");
-                goto out;
+                return;
             }
             bdrv_refresh_filename(state->old_bs);
 
-            aio_context_release(aio_context);
             bdrv_img_create(new_image_file, format,
                             state->old_bs->filename,
                             state->old_bs->drv->format_name,
                             NULL, size, flags, false, &local_err);
-            aio_context_acquire(aio_context);
 
             if (local_err) {
                 error_propagate(errp, local_err);
-                goto out;
+                return;
             }
         }
 
@@ -1508,20 +1459,15 @@ static void external_snapshot_action(TransactionAction *action,
         }
         qdict_put_str(options, "driver", format);
     }
-    aio_context_release(aio_context);
 
-    aio_context_acquire(qemu_get_aio_context());
     state->new_bs = bdrv_open(new_image_file, snapshot_ref, options, flags,
                               errp);
-    aio_context_release(qemu_get_aio_context());
 
     /* We will manually add the backing_hd field to the bs later */
     if (!state->new_bs) {
         return;
     }
 
-    aio_context_acquire(aio_context);
-
     /*
      * Allow attaching a backing file to an overlay that's already in use only
      * if the parents don't assume that they are already seeing a valid image.
@@ -1530,41 +1476,34 @@ static void external_snapshot_action(TransactionAction *action,
     bdrv_get_cumulative_perm(state->new_bs, &perm, &shared);
     if (perm & BLK_PERM_CONSISTENT_READ) {
         error_setg(errp, "The overlay is already in use");
-        goto out;
+        return;
     }
 
     if (state->new_bs->drv->is_filter) {
         error_setg(errp, "Filters cannot be used as overlays");
-        goto out;
+        return;
     }
 
     if (bdrv_cow_child(state->new_bs)) {
         error_setg(errp, "The overlay already has a backing image");
-        goto out;
+        return;
     }
 
     if (!state->new_bs->drv->supports_backing) {
         error_setg(errp, "The overlay does not support backing images");
-        goto out;
+        return;
     }
 
     ret = bdrv_append(state->new_bs, state->old_bs, errp);
     if (ret < 0) {
-        goto out;
+        return;
     }
     state->overlay_appended = true;
-
-out:
-    aio_context_release(aio_context);
 }
 
 static void external_snapshot_commit(void *opaque)
 {
     ExternalSnapshotState *state = opaque;
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(state->old_bs);
-    aio_context_acquire(aio_context);
 
     /* We don't need (or want) to use the transactional
      * bdrv_reopen_multiple() across all the entries at once, because we
@@ -1572,8 +1511,6 @@ static void external_snapshot_commit(void *opaque)
     if (!qatomic_read(&state->old_bs->copy_on_read)) {
         bdrv_reopen_set_read_only(state->old_bs, true, NULL);
     }
-
-    aio_context_release(aio_context);
 }
 
 static void external_snapshot_abort(void *opaque)
@@ -1586,7 +1523,6 @@ static void external_snapshot_abort(void *opaque)
             int ret;
 
             aio_context = bdrv_get_aio_context(state->old_bs);
-            aio_context_acquire(aio_context);
 
             bdrv_ref(state->old_bs);   /* we can't let bdrv_set_backind_hd()
                                           close state->old_bs; we need it */
@@ -1599,15 +1535,9 @@ static void external_snapshot_abort(void *opaque)
              */
             tmp_context = bdrv_get_aio_context(state->old_bs);
             if (aio_context != tmp_context) {
-                aio_context_release(aio_context);
-                aio_context_acquire(tmp_context);
-
                 ret = bdrv_try_change_aio_context(state->old_bs,
                                                   aio_context, NULL, NULL);
                 assert(ret == 0);
-
-                aio_context_release(tmp_context);
-                aio_context_acquire(aio_context);
             }
 
             bdrv_drained_begin(state->new_bs);
@@ -1617,8 +1547,6 @@ static void external_snapshot_abort(void *opaque)
             bdrv_drained_end(state->new_bs);
 
             bdrv_unref(state->old_bs); /* bdrv_replace_node() ref'ed old_bs */
-
-            aio_context_release(aio_context);
         }
     }
 }
@@ -1626,19 +1554,13 @@ static void external_snapshot_abort(void *opaque)
 static void external_snapshot_clean(void *opaque)
 {
     g_autofree ExternalSnapshotState *state = opaque;
-    AioContext *aio_context;
 
     if (!state->old_bs) {
         return;
     }
 
-    aio_context = bdrv_get_aio_context(state->old_bs);
-    aio_context_acquire(aio_context);
-
     bdrv_drained_end(state->old_bs);
     bdrv_unref(state->new_bs);
-
-    aio_context_release(aio_context);
 }
 
 typedef struct DriveBackupState {
@@ -1670,7 +1592,6 @@ static void drive_backup_action(DriveBackup *backup,
     BlockDriverState *target_bs;
     BlockDriverState *source = NULL;
     AioContext *aio_context;
-    AioContext *old_context;
     const char *format;
     QDict *options;
     Error *local_err = NULL;
@@ -1698,7 +1619,6 @@ static void drive_backup_action(DriveBackup *backup,
     }
 
     aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
 
     state->bs = bs;
     /* Paired with .clean() */
@@ -1713,7 +1633,7 @@ static void drive_backup_action(DriveBackup *backup,
     bdrv_graph_rdlock_main_loop();
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_BACKUP_SOURCE, errp)) {
         bdrv_graph_rdunlock_main_loop();
-        goto out;
+        return;
     }
 
     flags = bs->open_flags | BDRV_O_RDWR;
@@ -1744,7 +1664,7 @@ static void drive_backup_action(DriveBackup *backup,
     size = bdrv_getlength(bs);
     if (size < 0) {
         error_setg_errno(errp, -size, "bdrv_getlength failed");
-        goto out;
+        return;
     }
 
     if (backup->mode != NEW_IMAGE_MODE_EXISTING) {
@@ -1770,7 +1690,7 @@ static void drive_backup_action(DriveBackup *backup,
 
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     options = qdict_new();
@@ -1779,30 +1699,18 @@ static void drive_backup_action(DriveBackup *backup,
     if (format) {
         qdict_put_str(options, "driver", format);
     }
-    aio_context_release(aio_context);
 
-    aio_context_acquire(qemu_get_aio_context());
     target_bs = bdrv_open(backup->target, NULL, options, flags, errp);
-    aio_context_release(qemu_get_aio_context());
-
     if (!target_bs) {
         return;
     }
 
-    /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
-    old_context = bdrv_get_aio_context(target_bs);
-    aio_context_acquire(old_context);
-
     ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
     if (ret < 0) {
         bdrv_unref(target_bs);
-        aio_context_release(old_context);
         return;
     }
 
-    aio_context_release(old_context);
-    aio_context_acquire(aio_context);
-
     if (set_backing_hd) {
         if (bdrv_set_backing_hd(target_bs, source, errp) < 0) {
             goto unref;
@@ -1815,22 +1723,14 @@ static void drive_backup_action(DriveBackup *backup,
 
 unref:
     bdrv_unref(target_bs);
-out:
-    aio_context_release(aio_context);
 }
 
 static void drive_backup_commit(void *opaque)
 {
     DriveBackupState *state = opaque;
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
 
     assert(state->job);
     job_start(&state->job->job);
-
-    aio_context_release(aio_context);
 }
 
 static void drive_backup_abort(void *opaque)
@@ -1845,18 +1745,12 @@ static void drive_backup_abort(void *opaque)
 static void drive_backup_clean(void *opaque)
 {
     g_autofree DriveBackupState *state = opaque;
-    AioContext *aio_context;
 
     if (!state->bs) {
         return;
     }
 
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
-
     bdrv_drained_end(state->bs);
-
-    aio_context_release(aio_context);
 }
 
 typedef struct BlockdevBackupState {
@@ -1881,7 +1775,6 @@ static void blockdev_backup_action(BlockdevBackup *backup,
     BlockDriverState *bs;
     BlockDriverState *target_bs;
     AioContext *aio_context;
-    AioContext *old_context;
     int ret;
 
     tran_add(tran, &blockdev_backup_drv, state);
@@ -1898,17 +1791,12 @@ static void blockdev_backup_action(BlockdevBackup *backup,
 
     /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
     aio_context = bdrv_get_aio_context(bs);
-    old_context = bdrv_get_aio_context(target_bs);
-    aio_context_acquire(old_context);
 
     ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
     if (ret < 0) {
-        aio_context_release(old_context);
         return;
     }
 
-    aio_context_release(old_context);
-    aio_context_acquire(aio_context);
     state->bs = bs;
 
     /* Paired with .clean() */
@@ -1917,22 +1805,14 @@ static void blockdev_backup_action(BlockdevBackup *backup,
     state->job = do_backup_common(qapi_BlockdevBackup_base(backup),
                                   bs, target_bs, aio_context,
                                   block_job_txn, errp);
-
-    aio_context_release(aio_context);
 }
 
 static void blockdev_backup_commit(void *opaque)
 {
     BlockdevBackupState *state = opaque;
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
 
     assert(state->job);
     job_start(&state->job->job);
-
-    aio_context_release(aio_context);
 }
 
 static void blockdev_backup_abort(void *opaque)
@@ -1947,18 +1827,12 @@ static void blockdev_backup_abort(void *opaque)
 static void blockdev_backup_clean(void *opaque)
 {
     g_autofree BlockdevBackupState *state = opaque;
-    AioContext *aio_context;
 
     if (!state->bs) {
         return;
     }
 
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
-
     bdrv_drained_end(state->bs);
-
-    aio_context_release(aio_context);
 }
 
 typedef struct BlockDirtyBitmapState {
@@ -2453,7 +2327,6 @@ void qmp_block_stream(const char *job_id, const char *device,
     }
 
     aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
 
     bdrv_graph_rdlock_main_loop();
     if (base) {
@@ -2520,7 +2393,7 @@ void qmp_block_stream(const char *job_id, const char *device,
     if (!base_bs && backing_file) {
         error_setg(errp, "backing file specified, but streaming the "
                          "entire chain");
-        goto out;
+        return;
     }
 
     if (has_auto_finalize && !auto_finalize) {
@@ -2535,18 +2408,14 @@ void qmp_block_stream(const char *job_id, const char *device,
                  filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     trace_qmp_block_stream(bs);
-
-out:
-    aio_context_release(aio_context);
     return;
 
 out_rdlock:
     bdrv_graph_rdunlock_main_loop();
-    aio_context_release(aio_context);
 }
 
 void qmp_block_commit(const char *job_id, const char *device,
@@ -2605,10 +2474,9 @@ void qmp_block_commit(const char *job_id, const char *device,
     }
 
     aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_COMMIT_SOURCE, errp)) {
-        goto out;
+        return;
     }
 
     /* default top_bs is the active layer */
@@ -2616,16 +2484,16 @@ void qmp_block_commit(const char *job_id, const char *device,
 
     if (top_node && top) {
         error_setg(errp, "'top-node' and 'top' are mutually exclusive");
-        goto out;
+        return;
     } else if (top_node) {
         top_bs = bdrv_lookup_bs(NULL, top_node, errp);
         if (top_bs == NULL) {
-            goto out;
+            return;
         }
         if (!bdrv_chain_contains(bs, top_bs)) {
             error_setg(errp, "'%s' is not in this backing file chain",
                        top_node);
-            goto out;
+            return;
         }
     } else if (top) {
         /* This strcmp() is just a shortcut, there is no need to
@@ -2639,35 +2507,35 @@ void qmp_block_commit(const char *job_id, const char *device,
 
     if (top_bs == NULL) {
         error_setg(errp, "Top image file %s not found", top ? top : "NULL");
-        goto out;
+        return;
     }
 
     assert(bdrv_get_aio_context(top_bs) == aio_context);
 
     if (base_node && base) {
         error_setg(errp, "'base-node' and 'base' are mutually exclusive");
-        goto out;
+        return;
     } else if (base_node) {
         base_bs = bdrv_lookup_bs(NULL, base_node, errp);
         if (base_bs == NULL) {
-            goto out;
+            return;
         }
         if (!bdrv_chain_contains(top_bs, base_bs)) {
             error_setg(errp, "'%s' is not in this backing file chain",
                        base_node);
-            goto out;
+            return;
         }
     } else if (base) {
         base_bs = bdrv_find_backing_image(top_bs, base);
         if (base_bs == NULL) {
             error_setg(errp, "Can't find '%s' in the backing chain", base);
-            goto out;
+            return;
         }
     } else {
         base_bs = bdrv_find_base(top_bs);
         if (base_bs == NULL) {
             error_setg(errp, "There is no backimg image");
-            goto out;
+            return;
         }
     }
 
@@ -2677,14 +2545,14 @@ void qmp_block_commit(const char *job_id, const char *device,
          iter = bdrv_filter_or_cow_bs(iter))
     {
         if (bdrv_op_is_blocked(iter, BLOCK_OP_TYPE_COMMIT_TARGET, errp)) {
-            goto out;
+            return;
         }
     }
 
     /* Do not allow attempts to commit an image into itself */
     if (top_bs == base_bs) {
         error_setg(errp, "cannot commit an image into itself");
-        goto out;
+        return;
     }
 
     /*
@@ -2707,7 +2575,7 @@ void qmp_block_commit(const char *job_id, const char *device,
                 error_setg(errp, "'backing-file' specified, but 'top' has a "
                                  "writer on it");
             }
-            goto out;
+            return;
         }
         if (!job_id) {
             /*
@@ -2723,7 +2591,7 @@ void qmp_block_commit(const char *job_id, const char *device,
     } else {
         BlockDriverState *overlay_bs = bdrv_find_overlay(bs, top_bs);
         if (bdrv_op_is_blocked(overlay_bs, BLOCK_OP_TYPE_COMMIT_TARGET, errp)) {
-            goto out;
+            return;
         }
         commit_start(job_id, bs, base_bs, top_bs, job_flags,
                      speed, on_error, backing_file,
@@ -2731,11 +2599,8 @@ void qmp_block_commit(const char *job_id, const char *device,
     }
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
-
-out:
-    aio_context_release(aio_context);
 }
 
 /* Common QMP interface for drive-backup and blockdev-backup */
@@ -2984,8 +2849,6 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
 
     if (replaces) {
         BlockDriverState *to_replace_bs;
-        AioContext *aio_context;
-        AioContext *replace_aio_context;
         int64_t bs_size, replace_size;
 
         bs_size = bdrv_getlength(bs);
@@ -2999,19 +2862,7 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
             return;
         }
 
-        aio_context = bdrv_get_aio_context(bs);
-        replace_aio_context = bdrv_get_aio_context(to_replace_bs);
-        /*
-         * bdrv_getlength() is a co-wrapper and uses AIO_WAIT_WHILE. Be sure not
-         * to acquire the same AioContext twice.
-         */
-        if (replace_aio_context != aio_context) {
-            aio_context_acquire(replace_aio_context);
-        }
         replace_size = bdrv_getlength(to_replace_bs);
-        if (replace_aio_context != aio_context) {
-            aio_context_release(replace_aio_context);
-        }
 
         if (replace_size < 0) {
             error_setg_errno(errp, -replace_size,
@@ -3040,7 +2891,6 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     BlockDriverState *bs;
     BlockDriverState *target_backing_bs, *target_bs;
     AioContext *aio_context;
-    AioContext *old_context;
     BlockMirrorBackingMode backing_mode;
     Error *local_err = NULL;
     QDict *options = NULL;
@@ -3063,7 +2913,6 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     }
 
     aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
 
     if (!arg->has_mode) {
         arg->mode = NEW_IMAGE_MODE_ABSOLUTE_PATHS;
@@ -3087,14 +2936,14 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     size = bdrv_getlength(bs);
     if (size < 0) {
         error_setg_errno(errp, -size, "bdrv_getlength failed");
-        goto out;
+        return;
     }
 
     if (arg->replaces) {
         if (!arg->node_name) {
             error_setg(errp, "a node-name must be provided when replacing a"
                              " named node of the graph");
-            goto out;
+            return;
         }
     }
 
@@ -3142,7 +2991,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
 
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     options = qdict_new();
@@ -3152,15 +3001,11 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     if (format) {
         qdict_put_str(options, "driver", format);
     }
-    aio_context_release(aio_context);
 
     /* Mirroring takes care of copy-on-write using the source's backing
      * file.
      */
-    aio_context_acquire(qemu_get_aio_context());
     target_bs = bdrv_open(arg->target, NULL, options, flags, errp);
-    aio_context_release(qemu_get_aio_context());
-
     if (!target_bs) {
         return;
     }
@@ -3172,20 +3017,12 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     bdrv_graph_rdunlock_main_loop();
 
 
-    /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
-    old_context = bdrv_get_aio_context(target_bs);
-    aio_context_acquire(old_context);
-
     ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
     if (ret < 0) {
         bdrv_unref(target_bs);
-        aio_context_release(old_context);
         return;
     }
 
-    aio_context_release(old_context);
-    aio_context_acquire(aio_context);
-
     blockdev_mirror_common(arg->job_id, bs, target_bs,
                            arg->replaces, arg->sync,
                            backing_mode, zero_target,
@@ -3201,8 +3038,6 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
                            arg->has_auto_dismiss, arg->auto_dismiss,
                            errp);
     bdrv_unref(target_bs);
-out:
-    aio_context_release(aio_context);
 }
 
 void qmp_blockdev_mirror(const char *job_id,
@@ -3225,7 +3060,6 @@ void qmp_blockdev_mirror(const char *job_id,
     BlockDriverState *bs;
     BlockDriverState *target_bs;
     AioContext *aio_context;
-    AioContext *old_context;
     BlockMirrorBackingMode backing_mode = MIRROR_LEAVE_BACKING_CHAIN;
     bool zero_target;
     int ret;
@@ -3242,18 +3076,11 @@ void qmp_blockdev_mirror(const char *job_id,
 
     zero_target = (sync == MIRROR_SYNC_MODE_FULL);
 
-    /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
-    old_context = bdrv_get_aio_context(target_bs);
     aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(old_context);
 
     ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
-
-    aio_context_release(old_context);
-    aio_context_acquire(aio_context);
-
     if (ret < 0) {
-        goto out;
+        return;
     }
 
     blockdev_mirror_common(job_id, bs, target_bs,
@@ -3268,8 +3095,6 @@ void qmp_blockdev_mirror(const char *job_id,
                            has_auto_finalize, auto_finalize,
                            has_auto_dismiss, auto_dismiss,
                            errp);
-out:
-    aio_context_release(aio_context);
 }
 
 /*
@@ -3432,7 +3257,6 @@ void qmp_change_backing_file(const char *device,
                              Error **errp)
 {
     BlockDriverState *bs = NULL;
-    AioContext *aio_context;
     BlockDriverState *image_bs = NULL;
     Error *local_err = NULL;
     bool ro;
@@ -3443,9 +3267,6 @@ void qmp_change_backing_file(const char *device,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     bdrv_graph_rdlock_main_loop();
 
     image_bs = bdrv_lookup_bs(NULL, image_node_name, &local_err);
@@ -3484,7 +3305,7 @@ void qmp_change_backing_file(const char *device,
 
     if (ro) {
         if (bdrv_reopen_set_read_only(image_bs, false, errp) != 0) {
-            goto out;
+            return;
         }
     }
 
@@ -3502,14 +3323,10 @@ void qmp_change_backing_file(const char *device,
     if (ro) {
         bdrv_reopen_set_read_only(image_bs, true, errp);
     }
-
-out:
-    aio_context_release(aio_context);
     return;
 
 out_rdlock:
     bdrv_graph_rdunlock_main_loop();
-    aio_context_release(aio_context);
 }
 
 void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
@@ -3549,7 +3366,6 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
     for (; reopen_list != NULL; reopen_list = reopen_list->next) {
         BlockdevOptions *options = reopen_list->value;
         BlockDriverState *bs;
-        AioContext *ctx;
         QObject *obj;
         Visitor *v;
         QDict *qdict;
@@ -3577,12 +3393,7 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 
         qdict_flatten(qdict);
 
-        ctx = bdrv_get_aio_context(bs);
-        aio_context_acquire(ctx);
-
         queue = bdrv_reopen_queue(queue, bs, qdict, false);
-
-        aio_context_release(ctx);
     }
 
     /* Perform the reopen operation */
@@ -3595,7 +3406,6 @@ fail:
 
 void qmp_blockdev_del(const char *node_name, Error **errp)
 {
-    AioContext *aio_context;
     BlockDriverState *bs;
 
     GLOBAL_STATE_CODE();
@@ -3610,30 +3420,25 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
         error_setg(errp, "Node %s is in use", node_name);
         return;
     }
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_DRIVE_DEL, errp)) {
-        goto out;
+        return;
     }
 
     if (!QTAILQ_IN_USE(bs, monitor_list)) {
         error_setg(errp, "Node %s is not owned by the monitor",
                    bs->node_name);
-        goto out;
+        return;
     }
 
     if (bs->refcnt > 1) {
         error_setg(errp, "Block device %s is in use",
                    bdrv_get_device_or_node_name(bs));
-        goto out;
+        return;
     }
 
     QTAILQ_REMOVE(&monitor_bdrv_states, bs, monitor_list);
     bdrv_unref(bs);
-
-out:
-    aio_context_release(aio_context);
 }
 
 static BdrvChild * GRAPH_RDLOCK
@@ -3723,7 +3528,6 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 void qmp_x_blockdev_set_iothread(const char *node_name, StrOrNull *iothread,
                                  bool has_force, bool force, Error **errp)
 {
-    AioContext *old_context;
     AioContext *new_context;
     BlockDriverState *bs;
 
@@ -3755,12 +3559,7 @@ void qmp_x_blockdev_set_iothread(const char *node_name, StrOrNull *iothread,
         new_context = qemu_get_aio_context();
     }
 
-    old_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(old_context);
-
     bdrv_try_change_aio_context(bs, new_context, NULL, errp);
-
-    aio_context_release(old_context);
 }
 
 QemuOptsList qemu_common_drive_opts = {
diff --git a/blockjob.c b/blockjob.c
index 7310412313..d5f29e14af 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -198,9 +198,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
      * one to make sure that such a concurrent access does not attempt
      * to process an already freed BdrvChild.
      */
-    aio_context_release(job->job.aio_context);
     bdrv_graph_wrlock();
-    aio_context_acquire(job->job.aio_context);
     while (job->nodes) {
         GSList *l = job->nodes;
         BdrvChild *c = l->data;
@@ -234,28 +232,12 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
                        uint64_t perm, uint64_t shared_perm, Error **errp)
 {
     BdrvChild *c;
-    AioContext *ctx = bdrv_get_aio_context(bs);
-    bool need_context_ops;
     GLOBAL_STATE_CODE();
 
     bdrv_ref(bs);
 
-    need_context_ops = ctx != job->job.aio_context;
-
-    if (need_context_ops) {
-        if (job->job.aio_context != qemu_get_aio_context()) {
-            aio_context_release(job->job.aio_context);
-        }
-        aio_context_acquire(ctx);
-    }
     c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
                                errp);
-    if (need_context_ops) {
-        aio_context_release(ctx);
-        if (job->job.aio_context != qemu_get_aio_context()) {
-            aio_context_acquire(job->job.aio_context);
-        }
-    }
     if (c == NULL) {
         return -EPERM;
     }
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index f83bb0f116..7bbbd981ad 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -124,7 +124,6 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     VirtIOBlockDataPlane *s = vblk->dataplane;
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vblk)));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
-    AioContext *old_context;
     unsigned i;
     unsigned nvqs = s->conf->num_queues;
     Error *local_err = NULL;
@@ -178,10 +177,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
 
     trace_virtio_blk_data_plane_start(s);
 
-    old_context = blk_get_aio_context(s->conf->conf.blk);
-    aio_context_acquire(old_context);
     r = blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
-    aio_context_release(old_context);
     if (r < 0) {
         error_report_err(local_err);
         goto fail_aio_context;
@@ -208,13 +204,11 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
 
     /* Get this show started by hooking up our callbacks */
     if (!blk_in_drain(s->conf->conf.blk)) {
-        aio_context_acquire(s->ctx);
         for (i = 0; i < nvqs; i++) {
             VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
             virtio_queue_aio_attach_host_notifier(vq, s->ctx);
         }
-        aio_context_release(s->ctx);
     }
     return 0;
 
@@ -314,8 +308,6 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
      */
     vblk->dataplane_started = false;
 
-    aio_context_acquire(s->ctx);
-
     /* Wait for virtio_blk_dma_restart_bh() and in flight I/O to complete */
     blk_drain(s->conf->conf.blk);
 
@@ -325,8 +317,6 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
      */
     blk_set_aio_context(s->conf->conf.blk, qemu_get_aio_context(), NULL);
 
-    aio_context_release(s->ctx);
-
     /* Clean up guest notifier (irq) */
     k->set_guest_notifiers(qbus->parent, nvqs, false);
 
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index c4bb28c66f..98501e6885 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -260,8 +260,6 @@ static void xen_block_complete_aio(void *opaque, int ret)
     XenBlockRequest *request = opaque;
     XenBlockDataPlane *dataplane = request->dataplane;
 
-    aio_context_acquire(dataplane->ctx);
-
     if (ret != 0) {
         error_report("%s I/O error",
                      request->req.operation == BLKIF_OP_READ ?
@@ -273,10 +271,10 @@ static void xen_block_complete_aio(void *opaque, int ret)
     if (request->presync) {
         request->presync = 0;
         xen_block_do_aio(request);
-        goto done;
+        return;
     }
     if (request->aio_inflight > 0) {
-        goto done;
+        return;
     }
 
     switch (request->req.operation) {
@@ -318,9 +316,6 @@ static void xen_block_complete_aio(void *opaque, int ret)
     if (dataplane->more_work) {
         qemu_bh_schedule(dataplane->bh);
     }
-
-done:
-    aio_context_release(dataplane->ctx);
 }
 
 static bool xen_block_split_discard(XenBlockRequest *request,
@@ -601,9 +596,7 @@ static void xen_block_dataplane_bh(void *opaque)
 {
     XenBlockDataPlane *dataplane = opaque;
 
-    aio_context_acquire(dataplane->ctx);
     xen_block_handle_requests(dataplane);
-    aio_context_release(dataplane->ctx);
 }
 
 static bool xen_block_dataplane_event(void *opaque)
@@ -703,10 +696,8 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
         xen_block_dataplane_detach(dataplane);
     }
 
-    aio_context_acquire(dataplane->ctx);
     /* Xen doesn't have multiple users for nodes, so this can't fail */
     blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
-    aio_context_release(dataplane->ctx);
 
     /*
      * Now that the context has been moved onto the main thread, cancel
@@ -752,7 +743,6 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
 {
     ERRP_GUARD();
     XenDevice *xendev = dataplane->xendev;
-    AioContext *old_context;
     unsigned int ring_size;
     unsigned int i;
 
@@ -836,11 +826,8 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
         goto stop;
     }
 
-    old_context = blk_get_aio_context(dataplane->blk);
-    aio_context_acquire(old_context);
     /* If other users keep the BlockBackend in the iothread, that's ok */
     blk_set_aio_context(dataplane->blk, dataplane->ctx, NULL);
-    aio_context_release(old_context);
 
     if (!blk_in_drain(dataplane->blk)) {
         xen_block_dataplane_attach(dataplane);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index a1f8e15522..5e49c0625f 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -102,7 +102,6 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
     VirtIOBlock *s = next->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (next) {
         VirtIOBlockReq *req = next;
         next = req->mr_next;
@@ -135,7 +134,6 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
         block_acct_done(blk_get_stats(s->blk), &req->acct);
         virtio_blk_free_request(req);
     }
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 static void virtio_blk_flush_complete(void *opaque, int ret)
@@ -143,19 +141,15 @@ static void virtio_blk_flush_complete(void *opaque, int ret)
     VirtIOBlockReq *req = opaque;
     VirtIOBlock *s = req->dev;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, 0, true)) {
-            goto out;
+            return;
         }
     }
 
     virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
     block_acct_done(blk_get_stats(s->blk), &req->acct);
     virtio_blk_free_request(req);
-
-out:
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
@@ -165,10 +159,9 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
     bool is_write_zeroes = (virtio_ldl_p(VIRTIO_DEVICE(s), &req->out.type) &
                             ~VIRTIO_BLK_T_BARRIER) == VIRTIO_BLK_T_WRITE_ZEROES;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     if (ret) {
         if (virtio_blk_handle_rw_error(req, -ret, false, is_write_zeroes)) {
-            goto out;
+            return;
         }
     }
 
@@ -177,9 +170,6 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
         block_acct_done(blk_get_stats(s->blk), &req->acct);
     }
     virtio_blk_free_request(req);
-
-out:
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 #ifdef __linux__
@@ -226,10 +216,8 @@ static void virtio_blk_ioctl_complete(void *opaque, int status)
     virtio_stl_p(vdev, &scsi->data_len, hdr->dxfer_len);
 
 out:
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     virtio_blk_req_complete(req, status);
     virtio_blk_free_request(req);
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
     g_free(ioctl_req);
 }
 
@@ -669,7 +657,6 @@ static void virtio_blk_zone_report_complete(void *opaque, int ret)
 {
     ZoneCmdData *data = opaque;
     VirtIOBlockReq *req = data->req;
-    VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
     struct iovec *in_iov = data->in_iov;
     unsigned in_num = data->in_num;
@@ -760,10 +747,8 @@ static void virtio_blk_zone_report_complete(void *opaque, int ret)
     }
 
 out:
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     virtio_blk_req_complete(req, err_status);
     virtio_blk_free_request(req);
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
     g_free(data->zone_report_data.zones);
     g_free(data);
 }
@@ -826,10 +811,8 @@ static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
     }
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     virtio_blk_req_complete(req, err_status);
     virtio_blk_free_request(req);
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
@@ -879,7 +862,6 @@ static void virtio_blk_zone_append_complete(void *opaque, int ret)
 {
     ZoneCmdData *data = opaque;
     VirtIOBlockReq *req = data->req;
-    VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
     int64_t append_sector, n;
     uint8_t err_status = VIRTIO_BLK_S_OK;
@@ -902,10 +884,8 @@ static void virtio_blk_zone_append_complete(void *opaque, int ret)
     trace_virtio_blk_zone_append_complete(vdev, req, append_sector, ret);
 
 out:
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     virtio_blk_req_complete(req, err_status);
     virtio_blk_free_request(req);
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
     g_free(data);
 }
 
@@ -941,10 +921,8 @@ static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
     return 0;
 
 out:
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     virtio_blk_req_complete(req, err_status);
     virtio_blk_free_request(req);
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
     return err_status;
 }
 
@@ -1134,7 +1112,6 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
     MultiReqBuffer mrb = {};
     bool suppress_notifications = virtio_queue_get_notification(vq);
 
-    aio_context_acquire(blk_get_aio_context(s->blk));
     defer_call_begin();
 
     do {
@@ -1160,7 +1137,6 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
     }
 
     defer_call_end();
-    aio_context_release(blk_get_aio_context(s->blk));
 }
 
 static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
@@ -1188,7 +1164,6 @@ static void virtio_blk_dma_restart_bh(void *opaque)
 
     s->rq = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
     while (req) {
         VirtIOBlockReq *next = req->next;
         if (virtio_blk_handle_request(req, &mrb)) {
@@ -1212,8 +1187,6 @@ static void virtio_blk_dma_restart_bh(void *opaque)
 
     /* Paired with inc in virtio_blk_dma_restart_cb() */
     blk_dec_in_flight(s->conf.conf.blk);
-
-    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
 static void virtio_blk_dma_restart_cb(void *opaque, bool running,
@@ -1235,11 +1208,8 @@ static void virtio_blk_dma_restart_cb(void *opaque, bool running,
 static void virtio_blk_reset(VirtIODevice *vdev)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
-    AioContext *ctx;
     VirtIOBlockReq *req;
 
-    ctx = blk_get_aio_context(s->blk);
-    aio_context_acquire(ctx);
     blk_drain(s->blk);
 
     /* We drop queued requests after blk_drain() because blk_drain() itself can
@@ -1251,8 +1221,6 @@ static void virtio_blk_reset(VirtIODevice *vdev)
         virtio_blk_free_request(req);
     }
 
-    aio_context_release(ctx);
-
     assert(!s->dataplane_started);
     blk_set_enable_write_cache(s->blk, s->original_wce);
 }
@@ -1268,10 +1236,6 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     uint64_t capacity;
     int64_t length;
     int blk_size = conf->logical_block_size;
-    AioContext *ctx;
-
-    ctx = blk_get_aio_context(s->blk);
-    aio_context_acquire(ctx);
 
     blk_get_geometry(s->blk, &capacity);
     memset(&blkcfg, 0, sizeof(blkcfg));
@@ -1295,7 +1259,6 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
      * per track (cylinder).
      */
     length = blk_getlength(s->blk);
-    aio_context_release(ctx);
     if (length > 0 && length / conf->heads / conf->secs % blk_size) {
         blkcfg.geometry.sectors = conf->secs & ~s->sector_mask;
     } else {
@@ -1362,9 +1325,7 @@ static void virtio_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
 
     memcpy(&blkcfg, config, s->config_size);
 
-    aio_context_acquire(blk_get_aio_context(s->blk));
     blk_set_enable_write_cache(s->blk, blkcfg.wce != 0);
-    aio_context_release(blk_get_aio_context(s->blk));
 }
 
 static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
@@ -1432,11 +1393,9 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
      * s->blk would erroneously be placed in writethrough mode.
      */
     if (!virtio_vdev_has_feature(vdev, VIRTIO_BLK_F_CONFIG_WCE)) {
-        aio_context_acquire(blk_get_aio_context(s->blk));
         blk_set_enable_write_cache(s->blk,
                                    virtio_vdev_has_feature(vdev,
                                                            VIRTIO_BLK_F_WCE));
-        aio_context_release(blk_get_aio_context(s->blk));
     }
 }
 
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 1473ab3d5e..73cced4626 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -120,9 +120,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
                        "node");
         }
 
-        aio_context_acquire(ctx);
         blk_replace_bs(blk, bs, errp);
-        aio_context_release(ctx);
         return;
     }
 
@@ -148,10 +146,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
                           0, BLK_PERM_ALL);
             blk_created = true;
 
-            aio_context_acquire(ctx);
             ret = blk_insert_bs(blk, bs, errp);
-            aio_context_release(ctx);
-
             if (ret < 0) {
                 goto fail;
             }
@@ -207,12 +202,8 @@ static void release_drive(Object *obj, const char *name, void *opaque)
     BlockBackend **ptr = object_field_prop_ptr(obj, prop);
 
     if (*ptr) {
-        AioContext *ctx = blk_get_aio_context(*ptr);
-
-        aio_context_acquire(ctx);
         blockdev_auto_del(*ptr);
         blk_detach_dev(*ptr, dev);
-        aio_context_release(ctx);
     }
 }
 
diff --git a/job.c b/job.c
index 99a2e54b54..660ce22c56 100644
--- a/job.c
+++ b/job.c
@@ -464,12 +464,8 @@ void job_unref_locked(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
-            AioContext *aio_context = job->aio_context;
             job_unlock();
-            /* FIXME: aiocontext lock is required because cb calls blk_unref */
-            aio_context_acquire(aio_context);
             job->driver->free(job);
-            aio_context_release(aio_context);
             job_lock();
         }
 
@@ -840,12 +836,10 @@ static void job_clean(Job *job)
 
 /*
  * Called with job_mutex held, but releases it temporarily.
- * Takes AioContext lock internally to invoke a job->driver callback.
  */
 static int job_finalize_single_locked(Job *job)
 {
     int job_ret;
-    AioContext *ctx = job->aio_context;
 
     assert(job_is_completed_locked(job));
 
@@ -854,7 +848,6 @@ static int job_finalize_single_locked(Job *job)
 
     job_ret = job->ret;
     job_unlock();
-    aio_context_acquire(ctx);
 
     if (!job_ret) {
         job_commit(job);
@@ -867,7 +860,6 @@ static int job_finalize_single_locked(Job *job)
         job->cb(job->opaque, job_ret);
     }
 
-    aio_context_release(ctx);
     job_lock();
 
     /* Emit events only if we actually started */
@@ -886,17 +878,13 @@ static int job_finalize_single_locked(Job *job)
 
 /*
  * Called with job_mutex held, but releases it temporarily.
- * Takes AioContext lock internally to invoke a job->driver callback.
  */
 static void job_cancel_async_locked(Job *job, bool force)
 {
-    AioContext *ctx = job->aio_context;
     GLOBAL_STATE_CODE();
     if (job->driver->cancel) {
         job_unlock();
-        aio_context_acquire(ctx);
         force = job->driver->cancel(job, force);
-        aio_context_release(ctx);
         job_lock();
     } else {
         /* No .cancel() means the job will behave as if force-cancelled */
@@ -931,7 +919,6 @@ static void job_cancel_async_locked(Job *job, bool force)
 
 /*
  * Called with job_mutex held, but releases it temporarily.
- * Takes AioContext lock internally to invoke a job->driver callback.
  */
 static void job_completed_txn_abort_locked(Job *job)
 {
@@ -979,15 +966,12 @@ static void job_completed_txn_abort_locked(Job *job)
 static int job_prepare_locked(Job *job)
 {
     int ret;
-    AioContext *ctx = job->aio_context;
 
     GLOBAL_STATE_CODE();
 
     if (job->ret == 0 && job->driver->prepare) {
         job_unlock();
-        aio_context_acquire(ctx);
         ret = job->driver->prepare(job);
-        aio_context_release(ctx);
         job_lock();
         job->ret = ret;
         job_update_rc_locked(job);
diff --git a/migration/block.c b/migration/block.c
index a15f9bddcb..2bcfcbfdf6 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -66,7 +66,7 @@ typedef struct BlkMigDevState {
     /* Protected by block migration lock.  */
     int64_t completed_sectors;
 
-    /* During migration this is protected by iothread lock / AioContext.
+    /* During migration this is protected by bdrv_dirty_bitmap_lock().
      * Allocation and free happen during setup and cleanup respectively.
      */
     BdrvDirtyBitmap *dirty_bitmap;
@@ -101,7 +101,7 @@ typedef struct BlkMigState {
     int prev_progress;
     int bulk_completed;
 
-    /* Lock must be taken _inside_ the iothread lock and any AioContexts.  */
+    /* Lock must be taken _inside_ the iothread lock.  */
     QemuMutex lock;
 } BlkMigState;
 
@@ -270,7 +270,6 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevState *bmds)
 
     if (bmds->shared_base) {
         qemu_mutex_lock_iothread();
-        aio_context_acquire(blk_get_aio_context(bb));
         /* Skip unallocated sectors; intentionally treats failure or
          * partial sector as an allocated sector */
         while (cur_sector < total_sectors &&
@@ -281,7 +280,6 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevState *bmds)
             }
             cur_sector += count >> BDRV_SECTOR_BITS;
         }
-        aio_context_release(blk_get_aio_context(bb));
         qemu_mutex_unlock_iothread();
     }
 
@@ -313,22 +311,10 @@ static int mig_save_device_bulk(QEMUFile *f, BlkMigDevState *bmds)
     block_mig_state.submitted++;
     blk_mig_unlock();
 
-    /* We do not know if bs is under the main thread (and thus does
-     * not acquire the AioContext when doing AIO) or rather under
-     * dataplane.  Thus acquire both the iothread mutex and the
-     * AioContext.
-     *
-     * This is ugly and will disappear when we make bdrv_* thread-safe,
-     * without the need to acquire the AioContext.
-     */
-    qemu_mutex_lock_iothread();
-    aio_context_acquire(blk_get_aio_context(bmds->blk));
     bdrv_reset_dirty_bitmap(bmds->dirty_bitmap, cur_sector * BDRV_SECTOR_SIZE,
                             nr_sectors * BDRV_SECTOR_SIZE);
     blk->aiocb = blk_aio_preadv(bb, cur_sector * BDRV_SECTOR_SIZE, &blk->qiov,
                                 0, blk_mig_read_cb, blk);
-    aio_context_release(blk_get_aio_context(bmds->blk));
-    qemu_mutex_unlock_iothread();
 
     bmds->cur_sector = cur_sector + nr_sectors;
     return (bmds->cur_sector >= total_sectors);
@@ -512,7 +498,7 @@ static void blk_mig_reset_dirty_cursor(void)
     }
 }
 
-/* Called with iothread lock and AioContext taken.  */
+/* Called with iothread lock taken.  */
 
 static int mig_save_device_dirty(QEMUFile *f, BlkMigDevState *bmds,
                                  int is_async)
@@ -606,9 +592,7 @@ static int blk_mig_save_dirty_block(QEMUFile *f, int is_async)
     int ret = 1;
 
     QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
-        aio_context_acquire(blk_get_aio_context(bmds->blk));
         ret = mig_save_device_dirty(f, bmds, is_async);
-        aio_context_release(blk_get_aio_context(bmds->blk));
         if (ret <= 0) {
             break;
         }
@@ -666,9 +650,9 @@ static int64_t get_remaining_dirty(void)
     int64_t dirty = 0;
 
     QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
-        aio_context_acquire(blk_get_aio_context(bmds->blk));
+        bdrv_dirty_bitmap_lock(bmds->dirty_bitmap);
         dirty += bdrv_get_dirty_count(bmds->dirty_bitmap);
-        aio_context_release(blk_get_aio_context(bmds->blk));
+        bdrv_dirty_bitmap_unlock(bmds->dirty_bitmap);
     }
 
     return dirty;
@@ -681,7 +665,6 @@ static void block_migration_cleanup_bmds(void)
 {
     BlkMigDevState *bmds;
     BlockDriverState *bs;
-    AioContext *ctx;
 
     unset_dirty_tracking();
 
@@ -693,13 +676,7 @@ static void block_migration_cleanup_bmds(void)
             bdrv_op_unblock_all(bs, bmds->blocker);
         }
         error_free(bmds->blocker);
-
-        /* Save ctx, because bmds->blk can disappear during blk_unref.  */
-        ctx = blk_get_aio_context(bmds->blk);
-        aio_context_acquire(ctx);
         blk_unref(bmds->blk);
-        aio_context_release(ctx);
-
         g_free(bmds->blk_name);
         g_free(bmds->aio_bitmap);
         g_free(bmds);
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 86ae832176..99710c8ffb 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -852,14 +852,11 @@ static void vm_completion(ReadLineState *rs, const char *str)
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         SnapshotInfoList *snapshots, *snapshot;
-        AioContext *ctx = bdrv_get_aio_context(bs);
         bool ok = false;
 
-        aio_context_acquire(ctx);
         if (bdrv_can_snapshot(bs)) {
             ok = bdrv_query_snapshot_info_list(bs, &snapshots, NULL) == 0;
         }
-        aio_context_release(ctx);
         if (!ok) {
             continue;
         }
diff --git a/migration/savevm.c b/migration/savevm.c
index eec5503a42..1b9ab7b8ee 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3049,7 +3049,6 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     int saved_vm_running;
     uint64_t vm_state_size;
     g_autoptr(GDateTime) now = g_date_time_new_now_local();
-    AioContext *aio_context;
 
     GLOBAL_STATE_CODE();
 
@@ -3092,7 +3091,6 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     if (bs == NULL) {
         return false;
     }
-    aio_context = bdrv_get_aio_context(bs);
 
     saved_vm_running = runstate_is_running();
 
@@ -3101,8 +3099,6 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 
     bdrv_drain_all_begin();
 
-    aio_context_acquire(aio_context);
-
     memset(sn, 0, sizeof(*sn));
 
     /* fill auxiliary fields */
@@ -3139,14 +3135,6 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
         goto the_end;
     }
 
-    /* The bdrv_all_create_snapshot() call that follows acquires the AioContext
-     * for itself.  BDRV_POLL_WHILE() does not support nested locking because
-     * it only releases the lock once.  Therefore synchronous I/O will deadlock
-     * unless we release the AioContext before bdrv_all_create_snapshot().
-     */
-    aio_context_release(aio_context);
-    aio_context = NULL;
-
     ret = bdrv_all_create_snapshot(sn, bs, vm_state_size,
                                    has_devices, devices, errp);
     if (ret < 0) {
@@ -3157,10 +3145,6 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     ret = 0;
 
  the_end:
-    if (aio_context) {
-        aio_context_release(aio_context);
-    }
-
     bdrv_drain_all_end();
 
     if (saved_vm_running) {
@@ -3258,7 +3242,6 @@ bool load_snapshot(const char *name, const char *vmstate,
     QEMUSnapshotInfo sn;
     QEMUFile *f;
     int ret;
-    AioContext *aio_context;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     if (!bdrv_all_can_snapshot(has_devices, devices, errp)) {
@@ -3278,12 +3261,9 @@ bool load_snapshot(const char *name, const char *vmstate,
     if (!bs_vm_state) {
         return false;
     }
-    aio_context = bdrv_get_aio_context(bs_vm_state);
 
     /* Don't even try to load empty VM states */
-    aio_context_acquire(aio_context);
     ret = bdrv_snapshot_find(bs_vm_state, &sn, name);
-    aio_context_release(aio_context);
     if (ret < 0) {
         return false;
     } else if (sn.vm_state_size == 0) {
@@ -3320,10 +3300,8 @@ bool load_snapshot(const char *name, const char *vmstate,
         ret = -EINVAL;
         goto err_drain;
     }
-    aio_context_acquire(aio_context);
     ret = qemu_loadvm_state(f);
     migration_incoming_state_destroy();
-    aio_context_release(aio_context);
 
     bdrv_drain_all_end();
 
diff --git a/net/colo-compare.c b/net/colo-compare.c
index 7f9e6f89ce..f2dfc0ebdc 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1439,12 +1439,10 @@ static void colo_compare_finalize(Object *obj)
     qemu_bh_delete(s->event_bh);
 
     AioContext *ctx = iothread_get_aio_context(s->iothread);
-    aio_context_acquire(ctx);
     AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
     if (s->notify_dev) {
         AIO_WAIT_WHILE(ctx, !s->notify_sendco.done);
     }
-    aio_context_release(ctx);
 
     /* Release all unhandled packets after compare thead exited */
     g_queue_foreach(&s->conn_list, colo_flush_packets, s);
diff --git a/qemu-img.c b/qemu-img.c
index 5a77f67719..7668f86769 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -960,7 +960,6 @@ static int img_commit(int argc, char **argv)
     Error *local_err = NULL;
     CommonBlockJobCBInfo cbi;
     bool image_opts = false;
-    AioContext *aio_context;
     int64_t rate_limit = 0;
 
     fmt = NULL;
@@ -1078,12 +1077,9 @@ static int img_commit(int argc, char **argv)
         .bs   = bs,
     };
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
     commit_active_start("commit", bs, base_bs, JOB_DEFAULT, rate_limit,
                         BLOCKDEV_ON_ERROR_REPORT, NULL, common_block_job_cb,
                         &cbi, false, &local_err);
-    aio_context_release(aio_context);
     if (local_err) {
         goto done;
     }
diff --git a/qemu-io.c b/qemu-io.c
index 050c70835f..6cb1e00385 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -414,15 +414,7 @@ static void prep_fetchline(void *opaque)
 
 static int do_qemuio_command(const char *cmd)
 {
-    int ret;
-    AioContext *ctx =
-        qemuio_blk ? blk_get_aio_context(qemuio_blk) : qemu_get_aio_context();
-
-    aio_context_acquire(ctx);
-    ret = qemuio_command(qemuio_blk, cmd);
-    aio_context_release(ctx);
-
-    return ret;
+    return qemuio_command(qemuio_blk, cmd);
 }
 
 static int command_loop(void)
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 186e6468b1..bac0b5e3ec 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1123,9 +1123,7 @@ int main(int argc, char **argv)
         qdict_put_str(raw_opts, "file", bs->node_name);
         qdict_put_int(raw_opts, "offset", dev_offset);
 
-        aio_context_acquire(qemu_get_aio_context());
         bs = bdrv_open(NULL, NULL, raw_opts, flags, &error_fatal);
-        aio_context_release(qemu_get_aio_context());
 
         blk_remove_bs(blk);
         blk_insert_bs(blk, bs, &error_fatal);
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 3e60549a4a..82c66fff26 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -144,7 +144,6 @@ static char *replay_find_nearest_snapshot(int64_t icount,
     char *ret = NULL;
     int rv;
     int nb_sns, i;
-    AioContext *aio_context;
 
     *snapshot_icount = -1;
 
@@ -152,11 +151,8 @@ static char *replay_find_nearest_snapshot(int64_t icount,
     if (!bs) {
         goto fail;
     }
-    aio_context = bdrv_get_aio_context(bs);
 
-    aio_context_acquire(aio_context);
     nb_sns = bdrv_snapshot_list(bs, &sn_tab);
-    aio_context_release(aio_context);
 
     for (i = 0; i < nb_sns; i++) {
         rv = bdrv_all_has_snapshot(sn_tab[i].name, false, NULL, NULL);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index d9754dfebc..17830a69c1 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -179,13 +179,7 @@ static void do_drain_end(enum drain_type drain_type, BlockDriverState *bs)
 
 static void do_drain_begin_unlocked(enum drain_type drain_type, BlockDriverState *bs)
 {
-    if (drain_type != BDRV_DRAIN_ALL) {
-        aio_context_acquire(bdrv_get_aio_context(bs));
-    }
     do_drain_begin(drain_type, bs);
-    if (drain_type != BDRV_DRAIN_ALL) {
-        aio_context_release(bdrv_get_aio_context(bs));
-    }
 }
 
 static BlockBackend * no_coroutine_fn test_setup(void)
@@ -209,13 +203,7 @@ static BlockBackend * no_coroutine_fn test_setup(void)
 
 static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *bs)
 {
-    if (drain_type != BDRV_DRAIN_ALL) {
-        aio_context_acquire(bdrv_get_aio_context(bs));
-    }
     do_drain_end(drain_type, bs);
-    if (drain_type != BDRV_DRAIN_ALL) {
-        aio_context_release(bdrv_get_aio_context(bs));
-    }
 }
 
 /*
@@ -520,12 +508,8 @@ static void test_iothread_main_thread_bh(void *opaque)
 {
     struct test_iothread_data *data = opaque;
 
-    /* Test that the AioContext is not yet locked in a random BH that is
-     * executed during drain, otherwise this would deadlock. */
-    aio_context_acquire(bdrv_get_aio_context(data->bs));
     bdrv_flush(data->bs);
     bdrv_dec_in_flight(data->bs); /* incremented by test_iothread_common() */
-    aio_context_release(bdrv_get_aio_context(data->bs));
 }
 
 /*
@@ -567,7 +551,6 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
     blk_set_disable_request_queuing(blk, true);
 
     blk_set_aio_context(blk, ctx_a, &error_abort);
-    aio_context_acquire(ctx_a);
 
     s->bh_indirection_ctx = ctx_b;
 
@@ -582,8 +565,6 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
     g_assert(acb != NULL);
     g_assert_cmpint(aio_ret, ==, -EINPROGRESS);
 
-    aio_context_release(ctx_a);
-
     data = (struct test_iothread_data) {
         .bs         = bs,
         .drain_type = drain_type,
@@ -592,10 +573,6 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
 
     switch (drain_thread) {
     case 0:
-        if (drain_type != BDRV_DRAIN_ALL) {
-            aio_context_acquire(ctx_a);
-        }
-
         /*
          * Increment in_flight so that do_drain_begin() waits for
          * test_iothread_main_thread_bh(). This prevents the race between
@@ -613,20 +590,10 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
         do_drain_begin(drain_type, bs);
         g_assert_cmpint(bs->in_flight, ==, 0);
 
-        if (drain_type != BDRV_DRAIN_ALL) {
-            aio_context_release(ctx_a);
-        }
         qemu_event_wait(&done_event);
-        if (drain_type != BDRV_DRAIN_ALL) {
-            aio_context_acquire(ctx_a);
-        }
 
         g_assert_cmpint(aio_ret, ==, 0);
         do_drain_end(drain_type, bs);
-
-        if (drain_type != BDRV_DRAIN_ALL) {
-            aio_context_release(ctx_a);
-        }
         break;
     case 1:
         co = qemu_coroutine_create(test_iothread_drain_co_entry, &data);
@@ -637,9 +604,7 @@ static void test_iothread_common(enum drain_type drain_type, int drain_thread)
         g_assert_not_reached();
     }
 
-    aio_context_acquire(ctx_a);
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
-    aio_context_release(ctx_a);
 
     bdrv_unref(bs);
     blk_unref(blk);
@@ -757,7 +722,6 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     BlockJob *job;
     TestBlockJob *tjob;
     IOThread *iothread = NULL;
-    AioContext *ctx;
     int ret;
 
     src = bdrv_new_open_driver(&bdrv_test, "source", BDRV_O_RDWR,
@@ -787,11 +751,11 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     }
 
     if (use_iothread) {
+        AioContext *ctx;
+
         iothread = iothread_new();
         ctx = iothread_get_aio_context(iothread);
         blk_set_aio_context(blk_src, ctx, &error_abort);
-    } else {
-        ctx = qemu_get_aio_context();
     }
 
     target = bdrv_new_open_driver(&bdrv_test, "target", BDRV_O_RDWR,
@@ -800,7 +764,6 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     blk_insert_bs(blk_target, target, &error_abort);
     blk_set_allow_aio_context_change(blk_target, true);
 
-    aio_context_acquire(ctx);
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
                             0, BLK_PERM_ALL,
                             0, 0, NULL, NULL, &error_abort);
@@ -821,7 +784,6 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
         tjob->prepare_ret = -EIO;
         break;
     }
-    aio_context_release(ctx);
 
     job_start(&job->job);
 
@@ -912,12 +874,10 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     }
     g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
 
-    aio_context_acquire(ctx);
     if (use_iothread) {
         blk_set_aio_context(blk_src, qemu_get_aio_context(), &error_abort);
         assert(blk_get_aio_context(blk_target) == qemu_get_aio_context());
     }
-    aio_context_release(ctx);
 
     blk_unref(blk_src);
     blk_unref(blk_target);
@@ -1401,9 +1361,7 @@ static void test_append_to_drained(void)
     g_assert_cmpint(base_s->drain_count, ==, 1);
     g_assert_cmpint(base->in_flight, ==, 0);
 
-    aio_context_acquire(qemu_get_aio_context());
     bdrv_append(overlay, base, &error_abort);
-    aio_context_release(qemu_get_aio_context());
 
     g_assert_cmpint(base->in_flight, ==, 0);
     g_assert_cmpint(overlay->in_flight, ==, 0);
@@ -1438,16 +1396,11 @@ static void test_set_aio_context(void)
 
     bdrv_drained_begin(bs);
     bdrv_try_change_aio_context(bs, ctx_a, NULL, &error_abort);
-
-    aio_context_acquire(ctx_a);
     bdrv_drained_end(bs);
 
     bdrv_drained_begin(bs);
     bdrv_try_change_aio_context(bs, ctx_b, NULL, &error_abort);
-    aio_context_release(ctx_a);
-    aio_context_acquire(ctx_b);
     bdrv_try_change_aio_context(bs, qemu_get_aio_context(), NULL, &error_abort);
-    aio_context_release(ctx_b);
     bdrv_drained_end(bs);
 
     bdrv_unref(bs);
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 8ee6ef38d8..cafc023db4 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -142,10 +142,8 @@ static void test_update_perm_tree(void)
                       BDRV_CHILD_DATA, &error_abort);
     bdrv_graph_wrunlock();
 
-    aio_context_acquire(qemu_get_aio_context());
     ret = bdrv_append(filter, bs, NULL);
     g_assert_cmpint(ret, <, 0);
-    aio_context_release(qemu_get_aio_context());
 
     bdrv_unref(filter);
     blk_unref(root);
@@ -211,9 +209,7 @@ static void test_should_update_child(void)
     bdrv_attach_child(filter, target, "target", &child_of_bds,
                       BDRV_CHILD_DATA, &error_abort);
     bdrv_graph_wrunlock();
-    aio_context_acquire(qemu_get_aio_context());
     bdrv_append(filter, bs, &error_abort);
-    aio_context_release(qemu_get_aio_context());
 
     bdrv_graph_rdlock_main_loop();
     g_assert(target->backing->bs == bs);
@@ -440,9 +436,7 @@ static void test_append_greedy_filter(void)
                       &error_abort);
     bdrv_graph_wrunlock();
 
-    aio_context_acquire(qemu_get_aio_context());
     bdrv_append(fl, base, &error_abort);
-    aio_context_release(qemu_get_aio_context());
     bdrv_unref(fl);
     bdrv_unref(top);
 }
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 9b15d2768c..3766d5de6b 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -483,7 +483,6 @@ static void test_sync_op(const void *opaque)
     bdrv_graph_rdunlock_main_loop();
 
     blk_set_aio_context(blk, ctx, &error_abort);
-    aio_context_acquire(ctx);
     if (t->fn) {
         t->fn(c);
     }
@@ -491,7 +490,6 @@ static void test_sync_op(const void *opaque)
         t->blkfn(blk);
     }
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
-    aio_context_release(ctx);
 
     bdrv_unref(bs);
     blk_unref(blk);
@@ -576,9 +574,7 @@ static void test_attach_blockjob(void)
         aio_poll(qemu_get_aio_context(), false);
     }
 
-    aio_context_acquire(ctx);
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
-    aio_context_release(ctx);
 
     tjob->n = 0;
     while (tjob->n == 0) {
@@ -595,9 +591,7 @@ static void test_attach_blockjob(void)
     WITH_JOB_LOCK_GUARD() {
         job_complete_sync_locked(&tjob->common.job, &error_abort);
     }
-    aio_context_acquire(ctx);
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
-    aio_context_release(ctx);
 
     bdrv_unref(bs);
     blk_unref(blk);
@@ -654,9 +648,7 @@ static void test_propagate_basic(void)
 
     /* Switch the AioContext back */
     main_ctx = qemu_get_aio_context();
-    aio_context_acquire(ctx);
     blk_set_aio_context(blk, main_ctx, &error_abort);
-    aio_context_release(ctx);
     g_assert(blk_get_aio_context(blk) == main_ctx);
     g_assert(bdrv_get_aio_context(bs_a) == main_ctx);
     g_assert(bdrv_get_aio_context(bs_verify) == main_ctx);
@@ -732,9 +724,7 @@ static void test_propagate_diamond(void)
 
     /* Switch the AioContext back */
     main_ctx = qemu_get_aio_context();
-    aio_context_acquire(ctx);
     blk_set_aio_context(blk, main_ctx, &error_abort);
-    aio_context_release(ctx);
     g_assert(blk_get_aio_context(blk) == main_ctx);
     g_assert(bdrv_get_aio_context(bs_verify) == main_ctx);
     g_assert(bdrv_get_aio_context(bs_a) == main_ctx);
@@ -764,13 +754,11 @@ static void test_propagate_mirror(void)
                                   &error_abort);
 
     /* Start a mirror job */
-    aio_context_acquire(main_ctx);
     mirror_start("job0", src, target, NULL, JOB_DEFAULT, 0, 0, 0,
                  MIRROR_SYNC_MODE_NONE, MIRROR_OPEN_BACKING_CHAIN, false,
                  BLOCKDEV_ON_ERROR_REPORT, BLOCKDEV_ON_ERROR_REPORT,
                  false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
                  &error_abort);
-    aio_context_release(main_ctx);
 
     WITH_JOB_LOCK_GUARD() {
         job = job_get_locked("job0");
@@ -785,9 +773,7 @@ static void test_propagate_mirror(void)
     g_assert(job->aio_context == ctx);
 
     /* Change the AioContext of target */
-    aio_context_acquire(ctx);
     bdrv_try_change_aio_context(target, main_ctx, NULL, &error_abort);
-    aio_context_release(ctx);
     g_assert(bdrv_get_aio_context(src) == main_ctx);
     g_assert(bdrv_get_aio_context(target) == main_ctx);
     g_assert(bdrv_get_aio_context(filter) == main_ctx);
@@ -805,10 +791,8 @@ static void test_propagate_mirror(void)
     g_assert(bdrv_get_aio_context(filter) == main_ctx);
 
     /* ...unless we explicitly allow it */
-    aio_context_acquire(ctx);
     blk_set_allow_aio_context_change(blk, true);
     bdrv_try_change_aio_context(target, ctx, NULL, &error_abort);
-    aio_context_release(ctx);
 
     g_assert(blk_get_aio_context(blk) == ctx);
     g_assert(bdrv_get_aio_context(src) == ctx);
@@ -817,10 +801,8 @@ static void test_propagate_mirror(void)
 
     job_cancel_sync_all();
 
-    aio_context_acquire(ctx);
     blk_set_aio_context(blk, main_ctx, &error_abort);
     bdrv_try_change_aio_context(target, main_ctx, NULL, &error_abort);
-    aio_context_release(ctx);
 
     blk_unref(blk);
     bdrv_unref(src);
@@ -836,7 +818,6 @@ static void test_attach_second_node(void)
     BlockDriverState *bs, *filter;
     QDict *options;
 
-    aio_context_acquire(main_ctx);
     blk = blk_new(ctx, BLK_PERM_ALL, BLK_PERM_ALL);
     bs = bdrv_new_open_driver(&bdrv_test, "base", BDRV_O_RDWR, &error_abort);
     blk_insert_bs(blk, bs, &error_abort);
@@ -846,15 +827,12 @@ static void test_attach_second_node(void)
     qdict_put_str(options, "file", "base");
 
     filter = bdrv_open(NULL, NULL, options, BDRV_O_RDWR, &error_abort);
-    aio_context_release(main_ctx);
 
     g_assert(blk_get_aio_context(blk) == ctx);
     g_assert(bdrv_get_aio_context(bs) == ctx);
     g_assert(bdrv_get_aio_context(filter) == ctx);
 
-    aio_context_acquire(ctx);
     blk_set_aio_context(blk, main_ctx, &error_abort);
-    aio_context_release(ctx);
     g_assert(blk_get_aio_context(blk) == main_ctx);
     g_assert(bdrv_get_aio_context(bs) == main_ctx);
     g_assert(bdrv_get_aio_context(filter) == main_ctx);
@@ -868,11 +846,9 @@ static void test_attach_preserve_blk_ctx(void)
 {
     IOThread *iothread = iothread_new();
     AioContext *ctx = iothread_get_aio_context(iothread);
-    AioContext *main_ctx = qemu_get_aio_context();
     BlockBackend *blk;
     BlockDriverState *bs;
 
-    aio_context_acquire(main_ctx);
     blk = blk_new(ctx, BLK_PERM_ALL, BLK_PERM_ALL);
     bs = bdrv_new_open_driver(&bdrv_test, "base", BDRV_O_RDWR, &error_abort);
     bs->total_sectors = 65536 / BDRV_SECTOR_SIZE;
@@ -881,25 +857,18 @@ static void test_attach_preserve_blk_ctx(void)
     blk_insert_bs(blk, bs, &error_abort);
     g_assert(blk_get_aio_context(blk) == ctx);
     g_assert(bdrv_get_aio_context(bs) == ctx);
-    aio_context_release(main_ctx);
 
     /* Remove the node again */
-    aio_context_acquire(ctx);
     blk_remove_bs(blk);
-    aio_context_release(ctx);
     g_assert(blk_get_aio_context(blk) == ctx);
     g_assert(bdrv_get_aio_context(bs) == qemu_get_aio_context());
 
     /* Re-attach the node */
-    aio_context_acquire(main_ctx);
     blk_insert_bs(blk, bs, &error_abort);
-    aio_context_release(main_ctx);
     g_assert(blk_get_aio_context(blk) == ctx);
     g_assert(bdrv_get_aio_context(bs) == ctx);
 
-    aio_context_acquire(ctx);
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
-    aio_context_release(ctx);
     bdrv_unref(bs);
     blk_unref(blk);
 }
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index a130f6fefb..fe3e0d2d38 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -228,7 +228,6 @@ static void cancel_common(CancelJob *s)
     BlockJob *job = &s->common;
     BlockBackend *blk = s->blk;
     JobStatus sts = job->job.status;
-    AioContext *ctx = job->job.aio_context;
 
     job_cancel_sync(&job->job, true);
     WITH_JOB_LOCK_GUARD() {
@@ -240,9 +239,7 @@ static void cancel_common(CancelJob *s)
         job_unref_locked(&job->job);
     }
 
-    aio_context_acquire(ctx);
     destroy_blk(blk);
-    aio_context_release(ctx);
 
 }
 
@@ -391,132 +388,6 @@ static void test_cancel_concluded(void)
     cancel_common(s);
 }
 
-/* (See test_yielding_driver for the job description) */
-typedef struct YieldingJob {
-    BlockJob common;
-    bool should_complete;
-} YieldingJob;
-
-static void yielding_job_complete(Job *job, Error **errp)
-{
-    YieldingJob *s = container_of(job, YieldingJob, common.job);
-    s->should_complete = true;
-    job_enter(job);
-}
-
-static int coroutine_fn yielding_job_run(Job *job, Error **errp)
-{
-    YieldingJob *s = container_of(job, YieldingJob, common.job);
-
-    job_transition_to_ready(job);
-
-    while (!s->should_complete) {
-        job_yield(job);
-    }
-
-    return 0;
-}
-
-/*
- * This job transitions immediately to the READY state, and then
- * yields until it is to complete.
- */
-static const BlockJobDriver test_yielding_driver = {
-    .job_driver = {
-        .instance_size  = sizeof(YieldingJob),
-        .free           = block_job_free,
-        .user_resume    = block_job_user_resume,
-        .run            = yielding_job_run,
-        .complete       = yielding_job_complete,
-    },
-};
-
-/*
- * Test that job_complete_locked() works even on jobs that are in a paused
- * state (i.e., STANDBY).
- *
- * To do this, run YieldingJob in an IO thread, get it into the READY
- * state, then have a drained section.  Before ending the section,
- * acquire the context so the job will not be entered and will thus
- * remain on STANDBY.
- *
- * job_complete_locked() should still work without error.
- *
- * Note that on the QMP interface, it is impossible to lock an IO
- * thread before a drained section ends.  In practice, the
- * bdrv_drain_all_end() and the aio_context_acquire() will be
- * reversed.  However, that makes for worse reproducibility here:
- * Sometimes, the job would no longer be in STANDBY then but already
- * be started.  We cannot prevent that, because the IO thread runs
- * concurrently.  We can only prevent it by taking the lock before
- * ending the drained section, so we do that.
- *
- * (You can reverse the order of operations and most of the time the
- * test will pass, but sometimes the assert(status == STANDBY) will
- * fail.)
- */
-static void test_complete_in_standby(void)
-{
-    BlockBackend *blk;
-    IOThread *iothread;
-    AioContext *ctx;
-    Job *job;
-    BlockJob *bjob;
-
-    /* Create a test drive, move it to an IO thread */
-    blk = create_blk(NULL);
-    iothread = iothread_new();
-
-    ctx = iothread_get_aio_context(iothread);
-    blk_set_aio_context(blk, ctx, &error_abort);
-
-    /* Create our test job */
-    bjob = mk_job(blk, "job", &test_yielding_driver, true,
-                  JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
-    job = &bjob->job;
-    assert_job_status_is(job, JOB_STATUS_CREATED);
-
-    /* Wait for the job to become READY */
-    job_start(job);
-    /*
-     * Here we are waiting for the status to change, so don't bother
-     * protecting the read every time.
-     */
-    AIO_WAIT_WHILE_UNLOCKED(ctx, job->status != JOB_STATUS_READY);
-
-    /* Begin the drained section, pausing the job */
-    bdrv_drain_all_begin();
-    assert_job_status_is(job, JOB_STATUS_STANDBY);
-
-    /* Lock the IO thread to prevent the job from being run */
-    aio_context_acquire(ctx);
-    /* This will schedule the job to resume it */
-    bdrv_drain_all_end();
-    aio_context_release(ctx);
-
-    WITH_JOB_LOCK_GUARD() {
-        /* But the job cannot run, so it will remain on standby */
-        assert(job->status == JOB_STATUS_STANDBY);
-
-        /* Even though the job is on standby, this should work */
-        job_complete_locked(job, &error_abort);
-
-        /* The test is done now, clean up. */
-        job_finish_sync_locked(job, NULL, &error_abort);
-        assert(job->status == JOB_STATUS_PENDING);
-
-        job_finalize_locked(job, &error_abort);
-        assert(job->status == JOB_STATUS_CONCLUDED);
-
-        job_dismiss_locked(&job, &error_abort);
-    }
-
-    aio_context_acquire(ctx);
-    destroy_blk(blk);
-    aio_context_release(ctx);
-    iothread_join(iothread);
-}
-
 int main(int argc, char **argv)
 {
     qemu_init_main_loop(&error_abort);
@@ -531,13 +402,5 @@ int main(int argc, char **argv)
     g_test_add_func("/blockjob/cancel/standby", test_cancel_standby);
     g_test_add_func("/blockjob/cancel/pending", test_cancel_pending);
     g_test_add_func("/blockjob/cancel/concluded", test_cancel_concluded);
-
-    /*
-     * This test is flaky and sometimes fails in CI and otherwise:
-     * don't run unless user opts in via environment variable.
-     */
-    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
-        g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
-    }
     return g_test_run();
 }
diff --git a/tests/unit/test-replication.c b/tests/unit/test-replication.c
index afff908d77..5d2003b8ce 100644
--- a/tests/unit/test-replication.c
+++ b/tests/unit/test-replication.c
@@ -199,17 +199,13 @@ static BlockBackend *start_primary(void)
 static void teardown_primary(void)
 {
     BlockBackend *blk;
-    AioContext *ctx;
 
     /* remove P_ID */
     blk = blk_by_name(P_ID);
     assert(blk);
 
-    ctx = blk_get_aio_context(blk);
-    aio_context_acquire(ctx);
     monitor_remove_blk(blk);
     blk_unref(blk);
-    aio_context_release(ctx);
 }
 
 static void test_primary_read(void)
@@ -345,27 +341,20 @@ static void teardown_secondary(void)
 {
     /* only need to destroy two BBs */
     BlockBackend *blk;
-    AioContext *ctx;
 
     /* remove S_LOCAL_DISK_ID */
     blk = blk_by_name(S_LOCAL_DISK_ID);
     assert(blk);
 
-    ctx = blk_get_aio_context(blk);
-    aio_context_acquire(ctx);
     monitor_remove_blk(blk);
     blk_unref(blk);
-    aio_context_release(ctx);
 
     /* remove S_ID */
     blk = blk_by_name(S_ID);
     assert(blk);
 
-    ctx = blk_get_aio_context(blk);
-    aio_context_acquire(ctx);
     monitor_remove_blk(blk);
     blk_unref(blk);
-    aio_context_release(ctx);
 }
 
 static void test_secondary_read(void)
diff --git a/util/async.c b/util/async.c
index 04ee83d220..dfd44ef612 100644
--- a/util/async.c
+++ b/util/async.c
@@ -562,12 +562,10 @@ static void co_schedule_bh_cb(void *opaque)
         Coroutine *co = QSLIST_FIRST(&straight);
         QSLIST_REMOVE_HEAD(&straight, co_scheduled_next);
         trace_aio_co_schedule_bh_cb(ctx, co);
-        aio_context_acquire(ctx);
 
         /* Protected by write barrier in qemu_aio_coroutine_enter */
         qatomic_set(&co->scheduled, NULL);
         qemu_aio_coroutine_enter(ctx, co);
-        aio_context_release(ctx);
     }
 }
 
@@ -707,9 +705,7 @@ void aio_co_enter(AioContext *ctx, Coroutine *co)
         assert(self != co);
         QSIMPLEQ_INSERT_TAIL(&self->co_queue_wakeup, co, co_queue_next);
     } else {
-        aio_context_acquire(ctx);
         qemu_aio_coroutine_enter(ctx, co);
-        aio_context_release(ctx);
     }
 }
 
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index a9a48fffb8..3bfb1ad3ec 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -360,10 +360,7 @@ static void vu_accept(QIONetListener *listener, QIOChannelSocket *sioc,
 
     qio_channel_set_follow_coroutine_ctx(server->ioc, true);
 
-    /* Attaching the AioContext starts the vu_client_trip coroutine */
-    aio_context_acquire(server->ctx);
     vhost_user_server_attach_aio_context(server, server->ctx);
-    aio_context_release(server->ctx);
 }
 
 /* server->ctx acquired by caller */
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 38364fa557..c9c09fcacd 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -278,12 +278,9 @@ def gen_no_co_wrapper(func: FuncDecl) -> str:
 static void {name}_bh(void *opaque)
 {{
     {struct_name} *s = opaque;
-    AioContext *ctx = {func.gen_ctx('s->')};
 
 {graph_lock}
-    aio_context_acquire(ctx);
     {func.get_result}{name}({ func.gen_list('s->{name}') });
-    aio_context_release(ctx);
 {graph_unlock}
 
     aio_co_wake(s->co);
diff --git a/tests/tsan/suppressions.tsan b/tests/tsan/suppressions.tsan
index d9a002a2ef..b3ef59c27c 100644
--- a/tests/tsan/suppressions.tsan
+++ b/tests/tsan/suppressions.tsan
@@ -4,7 +4,6 @@
 
 # TSan reports a double lock on RECURSIVE mutexes.
 # Since the recursive lock is intentional, we choose to ignore it.
-mutex:aio_context_acquire
 mutex:pthread_mutex_lock
 
 # TSan reports a race between pthread_mutex_init() and
-- 
2.43.0


