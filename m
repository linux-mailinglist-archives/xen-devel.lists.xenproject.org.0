Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20851805D1D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648187.1012322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2E-0004FU-Ew; Tue, 05 Dec 2023 18:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648187.1012322; Tue, 05 Dec 2023 18:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2E-0004D8-B9; Tue, 05 Dec 2023 18:20:42 +0000
Received: by outflank-mailman (input) for mailman id 648187;
 Tue, 05 Dec 2023 18:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa2C-0002fT-1s
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcff71f5-939a-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 19:20:38 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-3t8RjCJkMrO520wzfyhiUw-1; Tue, 05 Dec 2023 13:20:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E76485A59A;
 Tue,  5 Dec 2023 18:20:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9070F1C060AF;
 Tue,  5 Dec 2023 18:20:28 +0000 (UTC)
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
X-Inumbo-ID: fcff71f5-939a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSOsE0toGbQZwizSCs5XmoIfQBJx0yD5NLfMU2oeOow=;
	b=Rj0w8tM20pwOGpe2UnROK3UirMzh1O74dNJmDYtbnUr46vW4uHMfQEfB2SXVAFhS46injD
	pYgn5dm5ZjeQ5Uw2JQwMQXj3NEg2CTDbdR3C4Zd5tdhQAq3KtczBnNyLQX+XwB/WmpI74Y
	Vyyk1UY6Af1/HwA88YA8X8Em1T/fWsY=
X-MC-Unique: 3t8RjCJkMrO520wzfyhiUw-1
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
Subject: [PATCH v2 05/14] graph-lock: remove AioContext locking
Date: Tue,  5 Dec 2023 13:20:02 -0500
Message-ID: <20231205182011.1976568-6-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Stop acquiring/releasing the AioContext lock in
bdrv_graph_wrlock()/bdrv_graph_unlock() since the lock no longer has any
effect.

The distinction between bdrv_graph_wrunlock() and
bdrv_graph_wrunlock_ctx() becomes meaningless and they can be collapsed
into one function.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h         | 21 ++-----------
 block.c                            | 50 +++++++++++++++---------------
 block/backup.c                     |  4 +--
 block/blklogwrites.c               |  8 ++---
 block/blkverify.c                  |  4 +--
 block/block-backend.c              | 11 +++----
 block/commit.c                     | 16 +++++-----
 block/graph-lock.c                 | 44 ++------------------------
 block/mirror.c                     | 22 ++++++-------
 block/qcow2.c                      |  4 +--
 block/quorum.c                     |  8 ++---
 block/replication.c                | 14 ++++-----
 block/snapshot.c                   |  4 +--
 block/stream.c                     | 12 +++----
 block/vmdk.c                       | 20 ++++++------
 blockdev.c                         |  8 ++---
 blockjob.c                         | 12 +++----
 tests/unit/test-bdrv-drain.c       | 40 ++++++++++++------------
 tests/unit/test-bdrv-graph-mod.c   | 20 ++++++------
 scripts/block-coroutine-wrapper.py |  4 +--
 20 files changed, 133 insertions(+), 193 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 22b5db1ed9..d7545e82d0 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -110,34 +110,17 @@ void unregister_aiocontext(AioContext *ctx);
  *
  * The wrlock can only be taken from the main loop, with BQL held, as only the
  * main loop is allowed to modify the graph.
- *
- * If @bs is non-NULL, its AioContext is temporarily released.
- *
- * This function polls. Callers must not hold the lock of any AioContext other
- * than the current one and the one of @bs.
  */
 void no_coroutine_fn TSA_ACQUIRE(graph_lock) TSA_NO_TSA
-bdrv_graph_wrlock(BlockDriverState *bs);
+bdrv_graph_wrlock(void);
 
 /*
  * bdrv_graph_wrunlock:
  * Write finished, reset global has_writer to 0 and restart
  * all readers that are waiting.
- *
- * If @bs is non-NULL, its AioContext is temporarily released.
  */
 void no_coroutine_fn TSA_RELEASE(graph_lock) TSA_NO_TSA
-bdrv_graph_wrunlock(BlockDriverState *bs);
-
-/*
- * bdrv_graph_wrunlock_ctx:
- * Write finished, reset global has_writer to 0 and restart
- * all readers that are waiting.
- *
- * If @ctx is non-NULL, its lock is temporarily released.
- */
-void no_coroutine_fn TSA_RELEASE(graph_lock) TSA_NO_TSA
-bdrv_graph_wrunlock_ctx(AioContext *ctx);
+bdrv_graph_wrunlock(void);
 
 /*
  * bdrv_graph_co_rdlock:
diff --git a/block.c b/block.c
index bfb0861ec6..25e1ebc606 100644
--- a/block.c
+++ b/block.c
@@ -1708,12 +1708,12 @@ bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv, const char *node_name,
 open_failed:
     bs->drv = NULL;
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     if (bs->file != NULL) {
         bdrv_unref_child(bs, bs->file);
         assert(!bs->file);
     }
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     g_free(bs->opaque);
     bs->opaque = NULL;
@@ -3575,9 +3575,9 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 
     bdrv_ref(drain_bs);
     bdrv_drained_begin(drain_bs);
-    bdrv_graph_wrlock(backing_hd);
+    bdrv_graph_wrlock();
     ret = bdrv_set_backing_hd_drained(bs, backing_hd, errp);
-    bdrv_graph_wrunlock(backing_hd);
+    bdrv_graph_wrunlock();
     bdrv_drained_end(drain_bs);
     bdrv_unref(drain_bs);
 
@@ -3790,13 +3790,13 @@ BdrvChild *bdrv_open_child(const char *filename,
         return NULL;
     }
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     ctx = bdrv_get_aio_context(bs);
     aio_context_acquire(ctx);
     child = bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
                               errp);
     aio_context_release(ctx);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     return child;
 }
@@ -4650,9 +4650,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         aio_context_release(ctx);
     }
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     tran_commit(tran);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
         BlockDriverState *bs = bs_entry->state.bs;
@@ -4669,9 +4669,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     goto cleanup;
 
 abort:
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     tran_abort(tran);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
         if (bs_entry->prepared) {
@@ -4852,12 +4852,12 @@ bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
     }
 
     bdrv_graph_rdunlock_main_loop();
-    bdrv_graph_wrlock(new_child_bs);
+    bdrv_graph_wrlock();
 
     ret = bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
                                           tran, errp);
 
-    bdrv_graph_wrunlock_ctx(ctx);
+    bdrv_graph_wrunlock();
 
     if (old_ctx != ctx) {
         aio_context_release(ctx);
@@ -5209,14 +5209,14 @@ static void bdrv_close(BlockDriverState *bs)
         bs->drv = NULL;
     }
 
-    bdrv_graph_wrlock(bs);
+    bdrv_graph_wrlock();
     QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
         bdrv_unref_child(bs, child);
     }
 
     assert(!bs->backing);
     assert(!bs->file);
-    bdrv_graph_wrunlock(bs);
+    bdrv_graph_wrunlock();
 
     g_free(bs->opaque);
     bs->opaque = NULL;
@@ -5509,9 +5509,9 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
     bdrv_graph_rdunlock_main_loop();
 
     bdrv_drained_begin(child_bs);
-    bdrv_graph_wrlock(bs);
+    bdrv_graph_wrlock();
     ret = bdrv_replace_node_common(bs, child_bs, true, true, errp);
-    bdrv_graph_wrunlock(bs);
+    bdrv_graph_wrunlock();
     bdrv_drained_end(child_bs);
 
     return ret;
@@ -5561,7 +5561,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     aio_context_acquire(old_context);
     new_context = NULL;
 
-    bdrv_graph_wrlock(bs_top);
+    bdrv_graph_wrlock();
 
     child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
                                      &child_of_bds, bdrv_backing_role(bs_new),
@@ -5593,7 +5593,7 @@ out:
     tran_finalize(tran, ret);
 
     bdrv_refresh_limits(bs_top, NULL, NULL);
-    bdrv_graph_wrunlock(bs_top);
+    bdrv_graph_wrunlock();
 
     bdrv_drained_end(bs_top);
     bdrv_drained_end(bs_new);
@@ -5620,7 +5620,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_ref(old_bs);
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
-    bdrv_graph_wrlock(new_bs);
+    bdrv_graph_wrlock();
 
     bdrv_replace_child_tran(child, new_bs, tran);
 
@@ -5631,7 +5631,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 
     tran_finalize(tran, ret);
 
-    bdrv_graph_wrunlock(new_bs);
+    bdrv_graph_wrunlock();
     bdrv_drained_end(old_bs);
     bdrv_drained_end(new_bs);
     bdrv_unref(old_bs);
@@ -5718,9 +5718,9 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
     bdrv_ref(bs);
     bdrv_drained_begin(bs);
     bdrv_drained_begin(new_node_bs);
-    bdrv_graph_wrlock(new_node_bs);
+    bdrv_graph_wrlock();
     ret = bdrv_replace_node(bs, new_node_bs, errp);
-    bdrv_graph_wrunlock(new_node_bs);
+    bdrv_graph_wrunlock();
     bdrv_drained_end(new_node_bs);
     bdrv_drained_end(bs);
     bdrv_unref(bs);
@@ -5975,7 +5975,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
 
     bdrv_ref(top);
     bdrv_drained_begin(base);
-    bdrv_graph_wrlock(base);
+    bdrv_graph_wrlock();
 
     if (!top->drv || !base->drv) {
         goto exit_wrlock;
@@ -6015,7 +6015,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
      * That's a FIXME.
      */
     bdrv_replace_node_common(top, base, false, false, &local_err);
-    bdrv_graph_wrunlock(base);
+    bdrv_graph_wrunlock();
 
     if (local_err) {
         error_report_err(local_err);
@@ -6052,7 +6052,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
     goto exit;
 
 exit_wrlock:
-    bdrv_graph_wrunlock(base);
+    bdrv_graph_wrunlock();
 exit:
     bdrv_drained_end(base);
     bdrv_unref(top);
diff --git a/block/backup.c b/block/backup.c
index 8aae5836d7..ec29d6b810 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -496,10 +496,10 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     block_copy_set_speed(bcs, speed);
 
     /* Required permissions are taken by copy-before-write filter target */
-    bdrv_graph_wrlock(target);
+    bdrv_graph_wrlock();
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
                        &error_abort);
-    bdrv_graph_wrunlock(target);
+    bdrv_graph_wrunlock();
 
     return &job->common;
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 3678f6cf42..7207b2e757 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -251,9 +251,9 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
     ret = 0;
 fail_log:
     if (ret < 0) {
-        bdrv_graph_wrlock(NULL);
+        bdrv_graph_wrlock();
         bdrv_unref_child(bs, s->log_file);
-        bdrv_graph_wrunlock(NULL);
+        bdrv_graph_wrunlock();
         s->log_file = NULL;
     }
 fail:
@@ -265,10 +265,10 @@ static void blk_log_writes_close(BlockDriverState *bs)
 {
     BDRVBlkLogWritesState *s = bs->opaque;
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_unref_child(bs, s->log_file);
     s->log_file = NULL;
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 }
 
 static int64_t coroutine_fn GRAPH_RDLOCK
diff --git a/block/blkverify.c b/block/blkverify.c
index 9b17c46644..ec45d8335e 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -151,10 +151,10 @@ static void blkverify_close(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_unref_child(bs, s->test_file);
     s->test_file = NULL;
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 }
 
 static int64_t coroutine_fn GRAPH_RDLOCK
diff --git a/block/block-backend.c b/block/block-backend.c
index ec21148806..abac4e0235 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -889,7 +889,6 @@ void blk_remove_bs(BlockBackend *blk)
 {
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     BdrvChild *root;
-    AioContext *ctx;
 
     GLOBAL_STATE_CODE();
 
@@ -919,10 +918,9 @@ void blk_remove_bs(BlockBackend *blk)
     root = blk->root;
     blk->root = NULL;
 
-    ctx = bdrv_get_aio_context(root->bs);
-    bdrv_graph_wrlock(root->bs);
+    bdrv_graph_wrlock();
     bdrv_root_unref_child(root);
-    bdrv_graph_wrunlock_ctx(ctx);
+    bdrv_graph_wrunlock();
 }
 
 /*
@@ -933,16 +931,15 @@ void blk_remove_bs(BlockBackend *blk)
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
 {
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
-    AioContext *ctx = bdrv_get_aio_context(bs);
 
     GLOBAL_STATE_CODE();
     bdrv_ref(bs);
-    bdrv_graph_wrlock(bs);
+    bdrv_graph_wrlock();
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                                        blk->perm, blk->shared_perm,
                                        blk, errp);
-    bdrv_graph_wrunlock_ctx(ctx);
+    bdrv_graph_wrunlock();
     if (blk->root == NULL) {
         return -EPERM;
     }
diff --git a/block/commit.c b/block/commit.c
index 69cc75be0c..1dd7a65ffb 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -100,9 +100,9 @@ static void commit_abort(Job *job)
     bdrv_graph_rdunlock_main_loop();
 
     bdrv_drained_begin(commit_top_backing_bs);
-    bdrv_graph_wrlock(commit_top_backing_bs);
+    bdrv_graph_wrlock();
     bdrv_replace_node(s->commit_top_bs, commit_top_backing_bs, &error_abort);
-    bdrv_graph_wrunlock(commit_top_backing_bs);
+    bdrv_graph_wrunlock();
     bdrv_drained_end(commit_top_backing_bs);
 
     bdrv_unref(s->commit_top_bs);
@@ -339,7 +339,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
      * this is the responsibility of the interface (i.e. whoever calls
      * commit_start()).
      */
-    bdrv_graph_wrlock(top);
+    bdrv_graph_wrlock();
     s->base_overlay = bdrv_find_overlay(top, base);
     assert(s->base_overlay);
 
@@ -370,19 +370,19 @@ void commit_start(const char *job_id, BlockDriverState *bs,
         ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
                                  iter_shared_perms, errp);
         if (ret < 0) {
-            bdrv_graph_wrunlock(top);
+            bdrv_graph_wrunlock();
             goto fail;
         }
     }
 
     if (bdrv_freeze_backing_chain(commit_top_bs, base, errp) < 0) {
-        bdrv_graph_wrunlock(top);
+        bdrv_graph_wrunlock();
         goto fail;
     }
     s->chain_frozen = true;
 
     ret = block_job_add_bdrv(&s->common, "base", base, 0, BLK_PERM_ALL, errp);
-    bdrv_graph_wrunlock(top);
+    bdrv_graph_wrunlock();
 
     if (ret < 0) {
         goto fail;
@@ -434,9 +434,9 @@ fail:
      * otherwise this would fail because of lack of permissions. */
     if (commit_top_bs) {
         bdrv_drained_begin(top);
-        bdrv_graph_wrlock(top);
+        bdrv_graph_wrlock();
         bdrv_replace_node(commit_top_bs, top, &error_abort);
-        bdrv_graph_wrunlock(top);
+        bdrv_graph_wrunlock();
         bdrv_drained_end(top);
     }
 }
diff --git a/block/graph-lock.c b/block/graph-lock.c
index 079e878d9b..c81162b147 100644
--- a/block/graph-lock.c
+++ b/block/graph-lock.c
@@ -106,27 +106,12 @@ static uint32_t reader_count(void)
     return rd;
 }
 
-void no_coroutine_fn bdrv_graph_wrlock(BlockDriverState *bs)
+void no_coroutine_fn bdrv_graph_wrlock(void)
 {
-    AioContext *ctx = NULL;
-
     GLOBAL_STATE_CODE();
     assert(!qatomic_read(&has_writer));
     assert(!qemu_in_coroutine());
 
-    /*
-     * Release only non-mainloop AioContext. The mainloop often relies on the
-     * BQL and doesn't lock the main AioContext before doing things.
-     */
-    if (bs) {
-        ctx = bdrv_get_aio_context(bs);
-        if (ctx != qemu_get_aio_context()) {
-            aio_context_release(ctx);
-        } else {
-            ctx = NULL;
-        }
-    }
-
     /* Make sure that constantly arriving new I/O doesn't cause starvation */
     bdrv_drain_all_begin_nopoll();
 
@@ -155,27 +140,13 @@ void no_coroutine_fn bdrv_graph_wrlock(BlockDriverState *bs)
     } while (reader_count() >= 1);
 
     bdrv_drain_all_end();
-
-    if (ctx) {
-        aio_context_acquire(bdrv_get_aio_context(bs));
-    }
 }
 
-void no_coroutine_fn bdrv_graph_wrunlock_ctx(AioContext *ctx)
+void no_coroutine_fn bdrv_graph_wrunlock(void)
 {
     GLOBAL_STATE_CODE();
     assert(qatomic_read(&has_writer));
 
-    /*
-     * Release only non-mainloop AioContext. The mainloop often relies on the
-     * BQL and doesn't lock the main AioContext before doing things.
-     */
-    if (ctx && ctx != qemu_get_aio_context()) {
-        aio_context_release(ctx);
-    } else {
-        ctx = NULL;
-    }
-
     WITH_QEMU_LOCK_GUARD(&aio_context_list_lock) {
         /*
          * No need for memory barriers, this works in pair with
@@ -197,17 +168,6 @@ void no_coroutine_fn bdrv_graph_wrunlock_ctx(AioContext *ctx)
      * progress.
      */
     aio_bh_poll(qemu_get_aio_context());
-
-    if (ctx) {
-        aio_context_acquire(ctx);
-    }
-}
-
-void no_coroutine_fn bdrv_graph_wrunlock(BlockDriverState *bs)
-{
-    AioContext *ctx = bs ? bdrv_get_aio_context(bs) : NULL;
-
-    bdrv_graph_wrunlock_ctx(ctx);
 }
 
 void coroutine_fn bdrv_graph_co_rdlock(void)
diff --git a/block/mirror.c b/block/mirror.c
index cd9d3ad4a8..51f9e2f17c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -764,7 +764,7 @@ static int mirror_exit_common(Job *job)
          * check for an op blocker on @to_replace, and we have our own
          * there.
          */
-        bdrv_graph_wrlock(target_bs);
+        bdrv_graph_wrlock();
         if (bdrv_recurse_can_replace(src, to_replace)) {
             bdrv_replace_node(to_replace, target_bs, &local_err);
         } else {
@@ -773,7 +773,7 @@ static int mirror_exit_common(Job *job)
                        "would not lead to an abrupt change of visible data",
                        to_replace->node_name, target_bs->node_name);
         }
-        bdrv_graph_wrunlock(target_bs);
+        bdrv_graph_wrunlock();
         bdrv_drained_end(to_replace);
         if (local_err) {
             error_report_err(local_err);
@@ -796,9 +796,9 @@ static int mirror_exit_common(Job *job)
      * valid.
      */
     block_job_remove_all_bdrv(bjob);
-    bdrv_graph_wrlock(mirror_top_bs);
+    bdrv_graph_wrlock();
     bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &error_abort);
-    bdrv_graph_wrunlock(mirror_top_bs);
+    bdrv_graph_wrunlock();
 
     bdrv_drained_end(target_bs);
     bdrv_unref(target_bs);
@@ -1914,13 +1914,13 @@ static BlockJob *mirror_start_job(
      */
     bdrv_disable_dirty_bitmap(s->dirty_bitmap);
 
-    bdrv_graph_wrlock(bs);
+    bdrv_graph_wrlock();
     ret = block_job_add_bdrv(&s->common, "source", bs, 0,
                              BLK_PERM_WRITE_UNCHANGED | BLK_PERM_WRITE |
                              BLK_PERM_CONSISTENT_READ,
                              errp);
     if (ret < 0) {
-        bdrv_graph_wrunlock(bs);
+        bdrv_graph_wrunlock();
         goto fail;
     }
 
@@ -1965,17 +1965,17 @@ static BlockJob *mirror_start_job(
             ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
                                      iter_shared_perms, errp);
             if (ret < 0) {
-                bdrv_graph_wrunlock(bs);
+                bdrv_graph_wrunlock();
                 goto fail;
             }
         }
 
         if (bdrv_freeze_backing_chain(mirror_top_bs, target, errp) < 0) {
-            bdrv_graph_wrunlock(bs);
+            bdrv_graph_wrunlock();
             goto fail;
         }
     }
-    bdrv_graph_wrunlock(bs);
+    bdrv_graph_wrunlock();
 
     QTAILQ_INIT(&s->ops_in_flight);
 
@@ -2001,12 +2001,12 @@ fail:
 
     bs_opaque->stop = true;
     bdrv_drained_begin(bs);
-    bdrv_graph_wrlock(bs);
+    bdrv_graph_wrlock();
     assert(mirror_top_bs->backing->bs == bs);
     bdrv_child_refresh_perms(mirror_top_bs, mirror_top_bs->backing,
                              &error_abort);
     bdrv_replace_node(mirror_top_bs, bs, &error_abort);
-    bdrv_graph_wrunlock(bs);
+    bdrv_graph_wrunlock();
     bdrv_drained_end(bs);
 
     bdrv_unref(mirror_top_bs);
diff --git a/block/qcow2.c b/block/qcow2.c
index 13e032bd5e..9bee66fff5 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2807,9 +2807,9 @@ qcow2_do_close(BlockDriverState *bs, bool close_data_file)
     if (close_data_file && has_data_file(bs)) {
         GLOBAL_STATE_CODE();
         bdrv_graph_rdunlock_main_loop();
-        bdrv_graph_wrlock(NULL);
+        bdrv_graph_wrlock();
         bdrv_unref_child(bs, s->data_file);
-        bdrv_graph_wrunlock(NULL);
+        bdrv_graph_wrunlock();
         s->data_file = NULL;
         bdrv_graph_rdlock_main_loop();
     }
diff --git a/block/quorum.c b/block/quorum.c
index 505b8b3e18..db8fe891c4 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1037,14 +1037,14 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
 
 close_exit:
     /* cleanup on error */
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     for (i = 0; i < s->num_children; i++) {
         if (!opened[i]) {
             continue;
         }
         bdrv_unref_child(bs, s->children[i]);
     }
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
     g_free(s->children);
     g_free(opened);
 exit:
@@ -1057,11 +1057,11 @@ static void quorum_close(BlockDriverState *bs)
     BDRVQuorumState *s = bs->opaque;
     int i;
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     for (i = 0; i < s->num_children; i++) {
         bdrv_unref_child(bs, s->children[i]);
     }
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     g_free(s->children);
 }
diff --git a/block/replication.c b/block/replication.c
index 5ded5f1ca9..424b537ff7 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -560,7 +560,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             return;
         }
 
-        bdrv_graph_wrlock(bs);
+        bdrv_graph_wrlock();
 
         bdrv_ref(hidden_disk->bs);
         s->hidden_disk = bdrv_attach_child(bs, hidden_disk->bs, "hidden disk",
@@ -568,7 +568,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
                                            &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
-            bdrv_graph_wrunlock(bs);
+            bdrv_graph_wrunlock();
             aio_context_release(aio_context);
             return;
         }
@@ -579,7 +579,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
                                               BDRV_CHILD_DATA, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
-            bdrv_graph_wrunlock(bs);
+            bdrv_graph_wrunlock();
             aio_context_release(aio_context);
             return;
         }
@@ -592,7 +592,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (!top_bs || !bdrv_is_root_node(top_bs) ||
             !check_top_bs(top_bs, bs)) {
             error_setg(errp, "No top_bs or it is invalid");
-            bdrv_graph_wrunlock(bs);
+            bdrv_graph_wrunlock();
             reopen_backing_file(bs, false, NULL);
             aio_context_release(aio_context);
             return;
@@ -600,7 +600,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         bdrv_op_block_all(top_bs, s->blocker);
         bdrv_op_unblock(top_bs, BLOCK_OP_TYPE_DATAPLANE, s->blocker);
 
-        bdrv_graph_wrunlock(bs);
+        bdrv_graph_wrunlock();
 
         s->backup_job = backup_job_create(
                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
@@ -691,12 +691,12 @@ static void replication_done(void *opaque, int ret)
     if (ret == 0) {
         s->stage = BLOCK_REPLICATION_DONE;
 
-        bdrv_graph_wrlock(NULL);
+        bdrv_graph_wrlock();
         bdrv_unref_child(bs, s->secondary_disk);
         s->secondary_disk = NULL;
         bdrv_unref_child(bs, s->hidden_disk);
         s->hidden_disk = NULL;
-        bdrv_graph_wrunlock(NULL);
+        bdrv_graph_wrunlock();
 
         s->error = 0;
     } else {
diff --git a/block/snapshot.c b/block/snapshot.c
index ec8cf4810b..e486d3e205 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -290,9 +290,9 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /* .bdrv_open() will re-attach it */
-        bdrv_graph_wrlock(NULL);
+        bdrv_graph_wrlock();
         bdrv_unref_child(bs, fallback);
-        bdrv_graph_wrunlock(NULL);
+        bdrv_graph_wrunlock();
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
diff --git a/block/stream.c b/block/stream.c
index 01fe7c0f16..048c2d282f 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -99,9 +99,9 @@ static int stream_prepare(Job *job)
             }
         }
 
-        bdrv_graph_wrlock(s->target_bs);
+        bdrv_graph_wrlock();
         bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
-        bdrv_graph_wrunlock(s->target_bs);
+        bdrv_graph_wrunlock();
 
         /*
          * This call will do I/O, so the graph can change again from here on.
@@ -366,10 +366,10 @@ void stream_start(const char *job_id, BlockDriverState *bs,
      * already have our own plans. Also don't allow resize as the image size is
      * queried only at the job start and then cached.
      */
-    bdrv_graph_wrlock(bs);
+    bdrv_graph_wrlock();
     if (block_job_add_bdrv(&s->common, "active node", bs, 0,
                            basic_flags | BLK_PERM_WRITE, errp)) {
-        bdrv_graph_wrunlock(bs);
+        bdrv_graph_wrunlock();
         goto fail;
     }
 
@@ -389,11 +389,11 @@ void stream_start(const char *job_id, BlockDriverState *bs,
         ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
                                  basic_flags, errp);
         if (ret < 0) {
-            bdrv_graph_wrunlock(bs);
+            bdrv_graph_wrunlock();
             goto fail;
         }
     }
-    bdrv_graph_wrunlock(bs);
+    bdrv_graph_wrunlock();
 
     s->base_overlay = base_overlay;
     s->above_base = above_base;
diff --git a/block/vmdk.c b/block/vmdk.c
index d6971c7067..bf78e12383 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -272,7 +272,7 @@ static void vmdk_free_extents(BlockDriverState *bs)
     BDRVVmdkState *s = bs->opaque;
     VmdkExtent *e;
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     for (i = 0; i < s->num_extents; i++) {
         e = &s->extents[i];
         g_free(e->l1_table);
@@ -283,7 +283,7 @@ static void vmdk_free_extents(BlockDriverState *bs)
             bdrv_unref_child(bs, e->file);
         }
     }
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     g_free(s->extents);
 }
@@ -1247,9 +1247,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
                             0, 0, 0, 0, 0, &extent, errp);
             if (ret < 0) {
                 bdrv_graph_rdunlock_main_loop();
-                bdrv_graph_wrlock(NULL);
+                bdrv_graph_wrlock();
                 bdrv_unref_child(bs, extent_file);
-                bdrv_graph_wrunlock(NULL);
+                bdrv_graph_wrunlock();
                 bdrv_graph_rdlock_main_loop();
                 goto out;
             }
@@ -1266,9 +1266,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
             g_free(buf);
             if (ret) {
                 bdrv_graph_rdunlock_main_loop();
-                bdrv_graph_wrlock(NULL);
+                bdrv_graph_wrlock();
                 bdrv_unref_child(bs, extent_file);
-                bdrv_graph_wrunlock(NULL);
+                bdrv_graph_wrunlock();
                 bdrv_graph_rdlock_main_loop();
                 goto out;
             }
@@ -1277,9 +1277,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
             ret = vmdk_open_se_sparse(bs, extent_file, bs->open_flags, errp);
             if (ret) {
                 bdrv_graph_rdunlock_main_loop();
-                bdrv_graph_wrlock(NULL);
+                bdrv_graph_wrlock();
                 bdrv_unref_child(bs, extent_file);
-                bdrv_graph_wrunlock(NULL);
+                bdrv_graph_wrunlock();
                 bdrv_graph_rdlock_main_loop();
                 goto out;
             }
@@ -1287,9 +1287,9 @@ vmdk_parse_extents(const char *desc, BlockDriverState *bs, QDict *options,
         } else {
             error_setg(errp, "Unsupported extent type '%s'", type);
             bdrv_graph_rdunlock_main_loop();
-            bdrv_graph_wrlock(NULL);
+            bdrv_graph_wrlock();
             bdrv_unref_child(bs, extent_file);
-            bdrv_graph_wrunlock(NULL);
+            bdrv_graph_wrunlock();
             bdrv_graph_rdlock_main_loop();
             ret = -ENOTSUP;
             goto out;
diff --git a/blockdev.c b/blockdev.c
index 4c1177e8db..db9cc96510 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1611,9 +1611,9 @@ static void external_snapshot_abort(void *opaque)
             }
 
             bdrv_drained_begin(state->new_bs);
-            bdrv_graph_wrlock(state->old_bs);
+            bdrv_graph_wrlock();
             bdrv_replace_node(state->new_bs, state->old_bs, &error_abort);
-            bdrv_graph_wrunlock(state->old_bs);
+            bdrv_graph_wrunlock();
             bdrv_drained_end(state->new_bs);
 
             bdrv_unref(state->old_bs); /* bdrv_replace_node() ref'ed old_bs */
@@ -3656,7 +3656,7 @@ void qmp_x_blockdev_change(const char *parent, const char *child,
     BlockDriverState *parent_bs, *new_bs = NULL;
     BdrvChild *p_child;
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
 
     parent_bs = bdrv_lookup_bs(parent, parent, errp);
     if (!parent_bs) {
@@ -3692,7 +3692,7 @@ void qmp_x_blockdev_change(const char *parent, const char *child,
     }
 
 out:
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 }
 
 BlockJobInfoList *qmp_query_block_jobs(Error **errp)
diff --git a/blockjob.c b/blockjob.c
index b7a29052b9..7310412313 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -199,7 +199,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
      * to process an already freed BdrvChild.
      */
     aio_context_release(job->job.aio_context);
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     aio_context_acquire(job->job.aio_context);
     while (job->nodes) {
         GSList *l = job->nodes;
@@ -212,7 +212,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
 
         g_slist_free_1(l);
     }
-    bdrv_graph_wrunlock_ctx(job->job.aio_context);
+    bdrv_graph_wrunlock();
 }
 
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
@@ -514,7 +514,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     int ret;
     GLOBAL_STATE_CODE();
 
-    bdrv_graph_wrlock(bs);
+    bdrv_graph_wrlock();
 
     if (job_id == NULL && !(flags & JOB_INTERNAL)) {
         job_id = bdrv_get_device_name(bs);
@@ -523,7 +523,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     job = job_create(job_id, &driver->job_driver, txn, bdrv_get_aio_context(bs),
                      flags, cb, opaque, errp);
     if (job == NULL) {
-        bdrv_graph_wrunlock(bs);
+        bdrv_graph_wrunlock();
         return NULL;
     }
 
@@ -563,11 +563,11 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
         goto fail;
     }
 
-    bdrv_graph_wrunlock(bs);
+    bdrv_graph_wrunlock();
     return job;
 
 fail:
-    bdrv_graph_wrunlock(bs);
+    bdrv_graph_wrunlock();
     job_early_fail(&job->job);
     return NULL;
 }
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 704d1a3f36..d9754dfebc 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -807,9 +807,9 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     tjob->bs = src;
     job = &tjob->common;
 
-    bdrv_graph_wrlock(target);
+    bdrv_graph_wrlock();
     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_abort);
-    bdrv_graph_wrunlock(target);
+    bdrv_graph_wrunlock();
 
     switch (result) {
     case TEST_JOB_SUCCESS:
@@ -991,11 +991,11 @@ static void bdrv_test_top_close(BlockDriverState *bs)
 {
     BdrvChild *c, *next_c;
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     QLIST_FOREACH_SAFE(c, &bs->children, next, next_c) {
         bdrv_unref_child(bs, c);
     }
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 }
 
 static int coroutine_fn GRAPH_RDLOCK
@@ -1085,10 +1085,10 @@ static void do_test_delete_by_drain(bool detach_instead_of_delete,
 
     null_bs = bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_PROTOCOL,
                         &error_abort);
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds,
                       BDRV_CHILD_DATA, &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     /* This child will be the one to pass to requests through to, and
      * it will stall until a drain occurs */
@@ -1096,21 +1096,21 @@ static void do_test_delete_by_drain(bool detach_instead_of_delete,
                                     &error_abort);
     child_bs->total_sectors = 65536 >> BDRV_SECTOR_BITS;
     /* Takes our reference to child_bs */
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     tts->wait_child = bdrv_attach_child(bs, child_bs, "wait-child",
                                         &child_of_bds,
                                         BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
                                         &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     /* This child is just there to be deleted
      * (for detach_instead_of_delete == true) */
     null_bs = bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_PROTOCOL,
                         &error_abort);
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds, BDRV_CHILD_DATA,
                       &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
     blk_insert_bs(blk, bs, &error_abort);
@@ -1193,14 +1193,14 @@ static void no_coroutine_fn detach_indirect_bh(void *opaque)
 
     bdrv_dec_in_flight(data->child_b->bs);
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_unref_child(data->parent_b, data->child_b);
 
     bdrv_ref(data->c);
     data->child_c = bdrv_attach_child(data->parent_b, data->c, "PB-C",
                                       &child_of_bds, BDRV_CHILD_DATA,
                                       &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 }
 
 static void coroutine_mixed_fn detach_by_parent_aio_cb(void *opaque, int ret)
@@ -1298,7 +1298,7 @@ static void TSA_NO_TSA test_detach_indirect(bool by_parent_cb)
     /* Set child relationships */
     bdrv_ref(b);
     bdrv_ref(a);
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     child_b = bdrv_attach_child(parent_b, b, "PB-B", &child_of_bds,
                                 BDRV_CHILD_DATA, &error_abort);
     child_a = bdrv_attach_child(parent_b, a, "PB-A", &child_of_bds,
@@ -1308,7 +1308,7 @@ static void TSA_NO_TSA test_detach_indirect(bool by_parent_cb)
     bdrv_attach_child(parent_a, a, "PA-A",
                       by_parent_cb ? &child_of_bds : &detach_by_driver_cb_class,
                       BDRV_CHILD_DATA, &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     g_assert_cmpint(parent_a->refcnt, ==, 1);
     g_assert_cmpint(parent_b->refcnt, ==, 1);
@@ -1727,7 +1727,7 @@ static void test_drop_intermediate_poll(void)
      * Establish the chain last, so the chain links are the first
      * elements in the BDS.parents lists
      */
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     for (i = 0; i < 3; i++) {
         if (i) {
             /* Takes the reference to chain[i - 1] */
@@ -1735,7 +1735,7 @@ static void test_drop_intermediate_poll(void)
                               &chain_child_class, BDRV_CHILD_COW, &error_abort);
         }
     }
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     job = block_job_create("job", &test_simple_job_driver, NULL, job_node,
                            0, BLK_PERM_ALL, 0, 0, NULL, NULL, &error_abort);
@@ -1982,10 +1982,10 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
     new_child_bs->total_sectors = 1;
 
     bdrv_ref(old_child_bs);
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
                       BDRV_CHILD_COW, &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
     parent_s->setup_completed = true;
 
     for (i = 0; i < old_drain_count; i++) {
@@ -2016,9 +2016,9 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
     g_assert(parent_bs->quiesce_counter == old_drain_count);
     bdrv_drained_begin(old_child_bs);
     bdrv_drained_begin(new_child_bs);
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_replace_node(old_child_bs, new_child_bs, &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
     bdrv_drained_end(new_child_bs);
     bdrv_drained_end(old_child_bs);
     g_assert(parent_bs->quiesce_counter == new_drain_count);
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 074adcbb93..8ee6ef38d8 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -137,10 +137,10 @@ static void test_update_perm_tree(void)
 
     blk_insert_bs(root, bs, &error_abort);
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_attach_child(filter, bs, "child", &child_of_bds,
                       BDRV_CHILD_DATA, &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     aio_context_acquire(qemu_get_aio_context());
     ret = bdrv_append(filter, bs, NULL);
@@ -206,11 +206,11 @@ static void test_should_update_child(void)
 
     bdrv_set_backing_hd(target, bs, &error_abort);
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     g_assert(target->backing->bs == bs);
     bdrv_attach_child(filter, target, "target", &child_of_bds,
                       BDRV_CHILD_DATA, &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
     aio_context_acquire(qemu_get_aio_context());
     bdrv_append(filter, bs, &error_abort);
     aio_context_release(qemu_get_aio_context());
@@ -248,7 +248,7 @@ static void test_parallel_exclusive_write(void)
     bdrv_ref(base);
     bdrv_ref(fl1);
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_attach_child(top, fl1, "backing", &child_of_bds,
                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
@@ -260,7 +260,7 @@ static void test_parallel_exclusive_write(void)
                       &error_abort);
 
     bdrv_replace_node(fl1, fl2, &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     bdrv_drained_end(fl2);
     bdrv_drained_end(fl1);
@@ -367,7 +367,7 @@ static void test_parallel_perm_update(void)
      */
     bdrv_ref(base);
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_attach_child(top, ws, "file", &child_of_bds, BDRV_CHILD_DATA,
                       &error_abort);
     c_fl1 = bdrv_attach_child(ws, fl1, "first", &child_of_bds,
@@ -380,7 +380,7 @@ static void test_parallel_perm_update(void)
     bdrv_attach_child(fl2, base, "backing", &child_of_bds,
                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     /* Select fl1 as first child to be active */
     s->selected = c_fl1;
@@ -434,11 +434,11 @@ static void test_append_greedy_filter(void)
     BlockDriverState *base = no_perm_node("base");
     BlockDriverState *fl = exclusive_writer_node("fl1");
 
-    bdrv_graph_wrlock(NULL);
+    bdrv_graph_wrlock();
     bdrv_attach_child(top, base, "backing", &child_of_bds,
                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_graph_wrunlock(NULL);
+    bdrv_graph_wrunlock();
 
     aio_context_acquire(qemu_get_aio_context());
     bdrv_append(fl, base, &error_abort);
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index a38e5833fb..38364fa557 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -261,8 +261,8 @@ def gen_no_co_wrapper(func: FuncDecl) -> str:
         graph_lock='    bdrv_graph_rdlock_main_loop();'
         graph_unlock='    bdrv_graph_rdunlock_main_loop();'
     elif func.graph_wrlock:
-        graph_lock='    bdrv_graph_wrlock(NULL);'
-        graph_unlock='    bdrv_graph_wrunlock(NULL);'
+        graph_lock='    bdrv_graph_wrlock();'
+        graph_unlock='    bdrv_graph_wrunlock();'
 
     return f"""\
 /*
-- 
2.43.0


