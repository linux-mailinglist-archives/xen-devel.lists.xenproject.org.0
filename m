Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF87FE0ED
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 21:23:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644227.1005005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8R5S-00087S-TU; Wed, 29 Nov 2023 20:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644227.1005005; Wed, 29 Nov 2023 20:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8R5S-00084N-OP; Wed, 29 Nov 2023 20:23:10 +0000
Received: by outflank-mailman (input) for mailman id 644227;
 Wed, 29 Nov 2023 20:23:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8Qfq-0000tx-L6
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6937fb68-8ef1-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:56:40 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-RuQccRyZNLa7YHgHxw2Ysw-1; Wed, 29 Nov 2023 14:56:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C409101A54C;
 Wed, 29 Nov 2023 19:56:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17D701121308;
 Wed, 29 Nov 2023 19:56:31 +0000 (UTC)
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
X-Inumbo-ID: 6937fb68-8ef1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/coadPn+sc9xiWSzcANbfgrPP5rjPXDBWuHi5ymh2L8=;
	b=fk1TST1/zS3M+iZkr7k5t8MGj4hGyXCz7ZeT+nd+CkbRLWNOre3rn/CFRe5SxcBuG1vH+T
	psZ2b2cmi4tgaXn+ksB5a6kG4LM5YbJ1fOmNUKTdPIVArwpcP0GLTwFcGoydwwHKNYBUD9
	R06ZGlorb0/1L8BARRYI9iKsPep70ts=
X-MC-Unique: RuQccRyZNLa7YHgHxw2Ysw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Wen Congyang <wencongyang2@huawei.com>,
	<qemu-block@nongnu.org>,
	xen-devel@lists.xenproject.org,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Ari Sundholm <ari@tuxera.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Cleber Rosa <crosa@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhang Chen <chen.zhang@intel.com>,
	Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Fam Zheng <fam@euphon.net>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 12/12] block: remove outdated AioContext locking comments
Date: Wed, 29 Nov 2023 14:55:53 -0500
Message-ID: <20231129195553.942921-13-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

The AioContext lock no longer exists.

There is one noteworthy change:

  - * More specifically, these functions use BDRV_POLL_WHILE(bs), which
  - * requires the caller to be either in the main thread and hold
  - * the BlockdriverState (bs) AioContext lock, or directly in the
  - * home thread that runs the bs AioContext. Calling them from
  - * another thread in another AioContext would cause deadlocks.
  + * More specifically, these functions use BDRV_POLL_WHILE(bs), which requires
  + * the caller to be either in the main thread or directly in the home thread
  + * that runs the bs AioContext. Calling them from another thread in another
  + * AioContext would cause deadlocks.

I am not sure whether deadlocks are still possible. Maybe they have just
moved to the fine-grained locks that have replaced the AioContext. Since
I am not sure if the deadlocks are gone, I have kept the substance
unchanged and just removed mention of the AioContext.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-common.h         |  3 --
 include/block/block-io.h             |  9 ++--
 include/block/block_int-common.h     |  2 -
 block.c                              | 73 ++++++----------------------
 block/block-backend.c                |  8 ---
 block/export/vhost-user-blk-server.c |  4 --
 tests/qemu-iotests/202               |  2 +-
 tests/qemu-iotests/203               |  3 +-
 8 files changed, 22 insertions(+), 82 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index d7599564db..a846023a09 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -70,9 +70,6 @@
  * automatically takes the graph rdlock when calling the wrapped function. In
  * the same way, no_co_wrapper_bdrv_wrlock functions automatically take the
  * graph wrlock.
- *
- * If the first parameter of the function is a BlockDriverState, BdrvChild or
- * BlockBackend pointer, the AioContext lock for it is taken in the wrapper.
  */
 #define no_co_wrapper
 #define no_co_wrapper_bdrv_rdlock
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 8eb39a858b..b49e0537dd 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -332,11 +332,10 @@ bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
  * "I/O or GS" API functions. These functions can run without
  * the BQL, but only in one specific iothread/main loop.
  *
- * More specifically, these functions use BDRV_POLL_WHILE(bs), which
- * requires the caller to be either in the main thread and hold
- * the BlockdriverState (bs) AioContext lock, or directly in the
- * home thread that runs the bs AioContext. Calling them from
- * another thread in another AioContext would cause deadlocks.
+ * More specifically, these functions use BDRV_POLL_WHILE(bs), which requires
+ * the caller to be either in the main thread or directly in the home thread
+ * that runs the bs AioContext. Calling them from another thread in another
+ * AioContext would cause deadlocks.
  *
  * Therefore, these functions are not proper I/O, because they
  * can't run in *any* iothreads, but only in a specific one.
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 4e31d161c5..151279d481 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1192,8 +1192,6 @@ struct BlockDriverState {
     /* The error object in use for blocking operations on backing_hd */
     Error *backing_blocker;
 
-    /* Protected by AioContext lock */
-
     /*
      * If we are reading a disk image, give its size in sectors.
      * Generally read-only; it is written to by load_snapshot and
diff --git a/block.c b/block.c
index 91ace5d2d5..e773584dfd 100644
--- a/block.c
+++ b/block.c
@@ -1616,11 +1616,6 @@ out:
     g_free(gen_node_name);
 }
 
-/*
- * The caller must always hold @bs AioContext lock, because this function calls
- * bdrv_refresh_total_sectors() which polls when called from non-coroutine
- * context.
- */
 static int no_coroutine_fn GRAPH_UNLOCKED
 bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv, const char *node_name,
                  QDict *options, int open_flags, Error **errp)
@@ -2901,7 +2896,7 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
  * Replaces the node that a BdrvChild points to without updating permissions.
  *
  * If @new_bs is non-NULL, the parent of @child must already be drained through
- * @child and the caller must hold the AioContext lock for @new_bs.
+ * @child.
  */
 static void GRAPH_WRLOCK
 bdrv_replace_child_noperm(BdrvChild *child, BlockDriverState *new_bs)
@@ -3041,9 +3036,8 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
  *
  * Returns new created child.
  *
- * The caller must hold the AioContext lock for @child_bs. Both @parent_bs and
- * @child_bs can move to a different AioContext in this function. Callers must
- * make sure that their AioContext locking is still correct after this.
+ * Both @parent_bs and @child_bs can move to a different AioContext in this
+ * function.
  */
 static BdrvChild * GRAPH_WRLOCK
 bdrv_attach_child_common(BlockDriverState *child_bs,
@@ -3142,9 +3136,8 @@ bdrv_attach_child_common(BlockDriverState *child_bs,
 /*
  * Function doesn't update permissions, caller is responsible for this.
  *
- * The caller must hold the AioContext lock for @child_bs. Both @parent_bs and
- * @child_bs can move to a different AioContext in this function. Callers must
- * make sure that their AioContext locking is still correct after this.
+ * Both @parent_bs and @child_bs can move to a different AioContext in this
+ * function.
  *
  * After calling this function, the transaction @tran may only be completed
  * while holding a writer lock for the graph.
@@ -3184,9 +3177,6 @@ bdrv_attach_child_noperm(BlockDriverState *parent_bs,
  *
  * On failure NULL is returned, errp is set and the reference to
  * child_bs is also dropped.
- *
- * The caller must hold the AioContext lock @child_bs, but not that of @ctx
- * (unless @child_bs is already in @ctx).
  */
 BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
@@ -3226,9 +3216,6 @@ out:
  *
  * On failure NULL is returned, errp is set and the reference to
  * child_bs is also dropped.
- *
- * If @parent_bs and @child_bs are in different AioContexts, the caller must
- * hold the AioContext lock for @child_bs, but not for @parent_bs.
  */
 BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BlockDriverState *child_bs,
@@ -3418,9 +3405,8 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  *
  * Function doesn't update permissions, caller is responsible for this.
  *
- * The caller must hold the AioContext lock for @child_bs. Both @parent_bs and
- * @child_bs can move to a different AioContext in this function. Callers must
- * make sure that their AioContext locking is still correct after this.
+ * Both @parent_bs and @child_bs can move to a different AioContext in this
+ * function.
  *
  * After calling this function, the transaction @tran may only be completed
  * while holding a writer lock for the graph.
@@ -3513,9 +3499,8 @@ out:
 }
 
 /*
- * The caller must hold the AioContext lock for @backing_hd. Both @bs and
- * @backing_hd can move to a different AioContext in this function. Callers must
- * make sure that their AioContext locking is still correct after this.
+ * Both @bs and @backing_hd can move to a different AioContext in this
+ * function.
  *
  * If a backing child is already present (i.e. we're detaching a node), that
  * child node must be drained.
@@ -3574,8 +3559,6 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
  * itself, all options starting with "${bdref_key}." are considered part of the
  * BlockdevRef.
  *
- * The caller must hold the main AioContext lock.
- *
  * TODO Can this be unified with bdrv_open_image()?
  */
 int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
@@ -3745,9 +3728,7 @@ done:
  *
  * The BlockdevRef will be removed from the options QDict.
  *
- * The caller must hold the lock of the main AioContext and no other AioContext.
- * @parent can move to a different AioContext in this function. Callers must
- * make sure that their AioContext locking is still correct after this.
+ * @parent can move to a different AioContext in this function.
  */
 BdrvChild *bdrv_open_child(const char *filename,
                            QDict *options, const char *bdref_key,
@@ -3778,9 +3759,7 @@ BdrvChild *bdrv_open_child(const char *filename,
 /*
  * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
  *
- * The caller must hold the lock of the main AioContext and no other AioContext.
- * @parent can move to a different AioContext in this function. Callers must
- * make sure that their AioContext locking is still correct after this.
+ * @parent can move to a different AioContext in this function.
  */
 int bdrv_open_file_child(const char *filename,
                          QDict *options, const char *bdref_key,
@@ -3923,8 +3902,6 @@ out:
  * The reference parameter may be used to specify an existing block device which
  * should be opened. If specified, neither options nor a filename may be given,
  * nor can an existing BDS be reused (that is, *pbs has to be NULL).
- *
- * The caller must always hold the main AioContext lock.
  */
 static BlockDriverState * no_coroutine_fn
 bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
@@ -4217,7 +4194,6 @@ close_and_fail:
     return NULL;
 }
 
-/* The caller must always hold the main AioContext lock. */
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp)
 {
@@ -4665,10 +4641,7 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
  *
  * Return 0 on success, otherwise return < 0 and set @errp.
  *
- * The caller must hold the AioContext lock of @reopen_state->bs.
  * @reopen_state->bs can move to a different AioContext in this function.
- * Callers must make sure that their AioContext locking is still correct after
- * this.
  */
 static int GRAPH_UNLOCKED
 bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
@@ -4801,8 +4774,6 @@ out_rdlock:
  * It is the responsibility of the caller to then call the abort() or
  * commit() for any other BDS that have been left in a prepare() state
  *
- * The caller must hold the AioContext lock of @reopen_state->bs.
- *
  * After calling this function, the transaction @change_child_tran may only be
  * completed while holding a writer lock for the graph.
  */
@@ -5437,8 +5408,6 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
  * child.
  *
  * This function does not create any image files.
- *
- * The caller must hold the AioContext lock for @bs_top.
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
@@ -5545,9 +5514,8 @@ static void bdrv_delete(BlockDriverState *bs)
  * after the call (even on failure), so if the caller intends to reuse the
  * dictionary, it needs to use qobject_ref() before calling bdrv_open.
  *
- * The caller holds the AioContext lock for @bs. It must make sure that @bs
- * stays in the same AioContext, i.e. @options must not refer to nodes in a
- * different AioContext.
+ * The caller must make sure that @bs stays in the same AioContext, i.e.
+ * @options must not refer to nodes in a different AioContext.
  */
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
                                    int flags, Error **errp)
@@ -7575,10 +7543,6 @@ static TransactionActionDrv set_aio_context = {
  *
  * Must be called from the main AioContext.
  *
- * The caller must own the AioContext lock for the old AioContext of bs, but it
- * must not own the AioContext lock for new_context (unless new_context is the
- * same as the current context of bs).
- *
  * @visited will accumulate all visited BdrvChild objects. The caller is
  * responsible for freeing the list afterwards.
  */
@@ -7631,13 +7595,6 @@ static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
  *
  * If ignore_child is not NULL, that child (and its subgraph) will not
  * be touched.
- *
- * This function still requires the caller to take the bs current
- * AioContext lock, otherwise draining will fail since AIO_WAIT_WHILE
- * assumes the lock is always held if bs is in another AioContext.
- * For the same reason, it temporarily also holds the new AioContext, since
- * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
- * Therefore the new AioContext lock must not be taken by the caller.
  */
 int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
                                 BdrvChild *ignore_child, Error **errp)
@@ -7663,8 +7620,8 @@ int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
 
     /*
      * Linear phase: go through all callbacks collected in the transaction.
-     * Run all callbacks collected in the recursion to switch all nodes
-     * AioContext lock (transaction commit), or undo all changes done in the
+     * Run all callbacks collected in the recursion to switch every node's
+     * AioContext (transaction commit), or undo all changes done in the
      * recursion (transaction abort).
      */
 
diff --git a/block/block-backend.c b/block/block-backend.c
index f412bed274..209eb07528 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -390,8 +390,6 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
  * Both sets of permissions can be changed later using blk_set_perm().
  *
  * Return the new BlockBackend on success, null on failure.
- *
- * Callers must hold the AioContext lock of @bs.
  */
 BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
                               uint64_t shared_perm, Error **errp)
@@ -416,8 +414,6 @@ BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
  * Just as with bdrv_open(), after having called this function the reference to
  * @options belongs to the block layer (even on failure).
  *
- * Called without holding an AioContext lock.
- *
  * TODO: Remove @filename and @flags; it should be possible to specify a whole
  * BDS tree just by specifying the @options QDict (or @reference,
  * alternatively). At the time of adding this function, this is not possible,
@@ -872,8 +868,6 @@ BlockBackend *blk_by_public(BlockBackendPublic *public)
 
 /*
  * Disassociates the currently associated BlockDriverState from @blk.
- *
- * The caller must hold the AioContext lock for the BlockBackend.
  */
 void blk_remove_bs(BlockBackend *blk)
 {
@@ -915,8 +909,6 @@ void blk_remove_bs(BlockBackend *blk)
 
 /*
  * Associates a new BlockDriverState with @blk.
- *
- * Callers must hold the AioContext lock of @bs.
  */
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
 {
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 16f48388d3..50c358e8cd 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -278,7 +278,6 @@ static void vu_blk_exp_resize(void *opaque)
     vu_config_change_msg(&vexp->vu_server.vu_dev);
 }
 
-/* Called with vexp->export.ctx acquired */
 static void vu_blk_drained_begin(void *opaque)
 {
     VuBlkExport *vexp = opaque;
@@ -287,7 +286,6 @@ static void vu_blk_drained_begin(void *opaque)
     vhost_user_server_detach_aio_context(&vexp->vu_server);
 }
 
-/* Called with vexp->export.blk AioContext acquired */
 static void vu_blk_drained_end(void *opaque)
 {
     VuBlkExport *vexp = opaque;
@@ -300,8 +298,6 @@ static void vu_blk_drained_end(void *opaque)
  * Ensures that bdrv_drained_begin() waits until in-flight requests complete
  * and the server->co_trip coroutine has terminated. It will be restarted in
  * vhost_user_server_attach_aio_context().
- *
- * Called with vexp->export.ctx acquired.
  */
 static bool vu_blk_drained_poll(void *opaque)
 {
diff --git a/tests/qemu-iotests/202 b/tests/qemu-iotests/202
index b784dcd791..13304242e5 100755
--- a/tests/qemu-iotests/202
+++ b/tests/qemu-iotests/202
@@ -21,7 +21,7 @@
 # Check that QMP 'transaction' blockdev-snapshot-sync with multiple drives on a
 # single IOThread completes successfully.  This particular command triggered a
 # hang due to recursive AioContext locking and BDRV_POLL_WHILE().  Protect
-# against regressions.
+# against regressions even though the AioContext lock no longer exists.
 
 import iotests
 
diff --git a/tests/qemu-iotests/203 b/tests/qemu-iotests/203
index ab80fd0e44..1ba878522b 100755
--- a/tests/qemu-iotests/203
+++ b/tests/qemu-iotests/203
@@ -21,7 +21,8 @@
 # Check that QMP 'migrate' with multiple drives on a single IOThread completes
 # successfully.  This particular command triggered a hang in the source QEMU
 # process due to recursive AioContext locking in bdrv_invalidate_all() and
-# BDRV_POLL_WHILE().
+# BDRV_POLL_WHILE().  Protect against regressions even though the AioContext
+# lock no longer exists.
 
 import iotests
 
-- 
2.42.0


