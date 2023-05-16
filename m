Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B55705699
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535455.833181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzwq-0002m7-9Y; Tue, 16 May 2023 19:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535455.833181; Tue, 16 May 2023 19:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzwq-0002jk-6A; Tue, 16 May 2023 19:03:00 +0000
Received: by outflank-mailman (input) for mailman id 535455;
 Tue, 16 May 2023 19:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzm0=BF=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pyzwo-0002eu-Nd
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:02:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43463480-f41c-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 21:02:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-VQz7vN_JPiauZfBJGMjQqA-1; Tue, 16 May 2023 15:02:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD23E857DF7;
 Tue, 16 May 2023 19:02:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02BBC2026D16;
 Tue, 16 May 2023 19:02:47 +0000 (UTC)
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
X-Inumbo-ID: 43463480-f41c-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684263774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGfiJ3QdLqEJFIVBe0dFRaZLYBYa5r932VA0IFYrkjY=;
	b=WwbE7jbSPTZF+KABzIdyjc0RaOdpMsX+NvPTPXPubVcvr8iIwP/XltbZkqda6a77jIF7Jm
	Kw4hOxuEzNLP77AeGv3CicrKwULoLYG03apyKAyixP0dN87HU7nNye90y1RjUMQlgnRF1J
	cqlje3UhNe/nIP3qAZXq4Qn+/03bIQk=
X-MC-Unique: VQz7vN_JPiauZfBJGMjQqA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Coiby Xu <Coiby.Xu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	xen-devel@lists.xenproject.org,
	Kevin Wolf <kwolf@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	eesposit@redhat.com,
	Fam Zheng <fam@euphon.net>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Xie Yongji <xieyongji@bytedance.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Paul Durrant <paul@xen.org>,
	Stefan Weil <sw@weilnetz.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Juan Quintela <quintela@redhat.com>
Subject: [PATCH v6 01/20] block-backend: split blk_do_set_aio_context()
Date: Tue, 16 May 2023 15:02:19 -0400
Message-Id: <20230516190238.8401-2-stefanha@redhat.com>
In-Reply-To: <20230516190238.8401-1-stefanha@redhat.com>
References: <20230516190238.8401-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

blk_set_aio_context() is not fully transactional because
blk_do_set_aio_context() updates blk->ctx outside the transaction. Most
of the time this goes unnoticed but a BlockDevOps.drained_end() callback
that invokes blk_get_aio_context() fails assert(ctx == blk->ctx). This
happens because blk->ctx is only assigned after
BlockDevOps.drained_end() is called and we're in an intermediate state
where BlockDrvierState nodes already have the new context and the
BlockBackend still has the old context.

Making blk_set_aio_context() fully transactional solves this assertion
failure because the BlockBackend's context is updated as part of the
transaction (before BlockDevOps.drained_end() is called).

Split blk_do_set_aio_context() in order to solve this assertion failure.
This helper function actually serves two different purposes:
1. It drives blk_set_aio_context().
2. It responds to BdrvChildClass->change_aio_ctx().

Get rid of the helper function. Do #1 inside blk_set_aio_context() and
do #2 inside blk_root_set_aio_ctx_commit(). This simplifies the code.

The only drawback of the fully transactional approach is that
blk_set_aio_context() must contend with blk_root_set_aio_ctx_commit()
being invoked as part of the AioContext change propagation. This can be
solved by temporarily setting blk->allow_aio_context_change to true.

Future patches call blk_get_aio_context() from
BlockDevOps->drained_end(), so this patch will become necessary.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 71 +++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ca537cd0ad..68087437ac 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2411,52 +2411,31 @@ static AioContext *blk_aiocb_get_aio_context(BlockAIOCB *acb)
     return blk_get_aio_context(blk_acb->blk);
 }
 
-static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
-                                  bool update_root_node, Error **errp)
-{
-    BlockDriverState *bs = blk_bs(blk);
-    ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
-    int ret;
-
-    if (bs) {
-        bdrv_ref(bs);
-
-        if (update_root_node) {
-            /*
-             * update_root_node MUST be false for blk_root_set_aio_ctx_commit(),
-             * as we are already in the commit function of a transaction.
-             */
-            ret = bdrv_try_change_aio_context(bs, new_context, blk->root, errp);
-            if (ret < 0) {
-                bdrv_unref(bs);
-                return ret;
-            }
-        }
-        /*
-         * Make blk->ctx consistent with the root node before we invoke any
-         * other operations like drain that might inquire blk->ctx
-         */
-        blk->ctx = new_context;
-        if (tgm->throttle_state) {
-            bdrv_drained_begin(bs);
-            throttle_group_detach_aio_context(tgm);
-            throttle_group_attach_aio_context(tgm, new_context);
-            bdrv_drained_end(bs);
-        }
-
-        bdrv_unref(bs);
-    } else {
-        blk->ctx = new_context;
-    }
-
-    return 0;
-}
-
 int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
                         Error **errp)
 {
+    bool old_allow_change;
+    BlockDriverState *bs = blk_bs(blk);
+    int ret;
+
     GLOBAL_STATE_CODE();
-    return blk_do_set_aio_context(blk, new_context, true, errp);
+
+    if (!bs) {
+        blk->ctx = new_context;
+        return 0;
+    }
+
+    bdrv_ref(bs);
+
+    old_allow_change = blk->allow_aio_context_change;
+    blk->allow_aio_context_change = true;
+
+    ret = bdrv_try_change_aio_context(bs, new_context, NULL, errp);
+
+    blk->allow_aio_context_change = old_allow_change;
+
+    bdrv_unref(bs);
+    return ret;
 }
 
 typedef struct BdrvStateBlkRootContext {
@@ -2468,8 +2447,14 @@ static void blk_root_set_aio_ctx_commit(void *opaque)
 {
     BdrvStateBlkRootContext *s = opaque;
     BlockBackend *blk = s->blk;
+    AioContext *new_context = s->new_ctx;
+    ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
 
-    blk_do_set_aio_context(blk, s->new_ctx, false, &error_abort);
+    blk->ctx = new_context;
+    if (tgm->throttle_state) {
+        throttle_group_detach_aio_context(tgm);
+        throttle_group_attach_aio_context(tgm, new_context);
+    }
 }
 
 static TransactionActionDrv set_blk_root_context = {
-- 
2.40.1


