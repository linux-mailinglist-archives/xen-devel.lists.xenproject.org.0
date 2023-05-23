Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2504670E29D
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 19:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538638.838808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VZf-000519-LX; Tue, 23 May 2023 17:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538638.838808; Tue, 23 May 2023 17:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VZf-0004yR-Hb; Tue, 23 May 2023 17:13:27 +0000
Received: by outflank-mailman (input) for mailman id 538638;
 Tue, 23 May 2023 17:13:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ9c=BM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q1VZd-0003JO-Mf
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 17:13:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f463b3e-f98d-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 19:13:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-GrPxPye5NiuvRcUuQhgTnA-1; Tue, 23 May 2023 13:13:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2F6A29ABA06;
 Tue, 23 May 2023 17:13:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E427C1ED99;
 Tue, 23 May 2023 17:13:16 +0000 (UTC)
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
X-Inumbo-ID: 1f463b3e-f98d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684862002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czTdm2uRIahqSqIwAZcPFjYWVpvuZBgfbd8HjxPRqIY=;
	b=NTWymu704nh97POzPIa++gf4NVdb8NzWeFzTQOK4yVJyOrWJcyad59z+N+gw3GE1Iwd8F7
	2KU3NaF/z0XC8qqB9rLXAy/45fsW7jRmreAFtoD5cclVkvgl3+Euww5A8acKVgdc5G2Jfs
	h9LTJHiSDwc7/AnMBwCPI/q1VmhwXAk=
X-MC-Unique: GrPxPye5NiuvRcUuQhgTnA-1
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
Subject: [PATCH v2 6/6] block: remove bdrv_co_io_plug() API
Date: Tue, 23 May 2023 13:13:00 -0400
Message-Id: <20230523171300.132347-7-stefanha@redhat.com>
In-Reply-To: <20230523171300.132347-1-stefanha@redhat.com>
References: <20230523171300.132347-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

No block driver implements .bdrv_co_io_plug() anymore. Get rid of the
function pointers.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block-io.h         |  3 ---
 include/block/block_int-common.h | 11 ----------
 block/io.c                       | 37 --------------------------------
 3 files changed, 51 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index a27e471a87..43af816d75 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -259,9 +259,6 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx);
 
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
-void coroutine_fn GRAPH_RDLOCK bdrv_co_io_plug(BlockDriverState *bs);
-void coroutine_fn GRAPH_RDLOCK bdrv_co_io_unplug(BlockDriverState *bs);
-
 bool coroutine_fn GRAPH_RDLOCK
 bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                    uint32_t granularity, Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 6492a1e538..958962aa3a 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -753,11 +753,6 @@ struct BlockDriver {
     void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_debug_event)(
         BlockDriverState *bs, BlkdebugEvent event);
 
-    /* io queue for linux-aio */
-    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_plug)(BlockDriverState *bs);
-    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_unplug)(
-        BlockDriverState *bs);
-
     /**
      * bdrv_drain_begin is called if implemented in the beginning of a
      * drain operation to drain and stop any internal sources of requests in
@@ -1227,12 +1222,6 @@ struct BlockDriverState {
     unsigned int in_flight;
     unsigned int serialising_in_flight;
 
-    /*
-     * counter for nested bdrv_io_plug.
-     * Accessed with atomic ops.
-     */
-    unsigned io_plugged;
-
     /* do we need to tell the quest if we have a volatile write cache? */
     int enable_write_cache;
 
diff --git a/block/io.c b/block/io.c
index 4d54fda593..56b0c1ce6c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3219,43 +3219,6 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
     return mem;
 }
 
-void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
-{
-    BdrvChild *child;
-    IO_CODE();
-    assert_bdrv_graph_readable();
-
-    QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_co_io_plug(child->bs);
-    }
-
-    if (qatomic_fetch_inc(&bs->io_plugged) == 0) {
-        BlockDriver *drv = bs->drv;
-        if (drv && drv->bdrv_co_io_plug) {
-            drv->bdrv_co_io_plug(bs);
-        }
-    }
-}
-
-void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
-{
-    BdrvChild *child;
-    IO_CODE();
-    assert_bdrv_graph_readable();
-
-    assert(bs->io_plugged);
-    if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
-        BlockDriver *drv = bs->drv;
-        if (drv && drv->bdrv_co_io_unplug) {
-            drv->bdrv_co_io_unplug(bs);
-        }
-    }
-
-    QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_co_io_unplug(child->bs);
-    }
-}
-
 /* Helper that undoes bdrv_register_buf() when it fails partway through */
 static void GRAPH_RDLOCK
 bdrv_register_buf_rollback(BlockDriverState *bs, void *host, size_t size,
-- 
2.40.1


