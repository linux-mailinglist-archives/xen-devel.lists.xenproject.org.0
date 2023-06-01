Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF471A28B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 17:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542624.846725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBp-0005Vx-BK; Thu, 01 Jun 2023 15:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542624.846725; Thu, 01 Jun 2023 15:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBp-0005Rh-7Q; Thu, 01 Jun 2023 15:26:13 +0000
Received: by outflank-mailman (input) for mailman id 542624;
 Thu, 01 Jun 2023 15:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z77Y=BV=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q4kBo-0004Ci-3d
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 15:26:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a26a0bd0-0090-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 17:26:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-lczibXIIP_WCrqNM8ZWL6A-1; Thu, 01 Jun 2023 11:26:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6140A3823A28;
 Thu,  1 Jun 2023 15:26:07 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C73522166B25;
 Thu,  1 Jun 2023 15:26:06 +0000 (UTC)
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
X-Inumbo-ID: a26a0bd0-0090-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685633169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBeGNWL9b7nl56yHjfm0zojV1HoxshEgnMZCDHHylAU=;
	b=LyPk4dI/cDdrCQjQBUSX2TTGVG9gs4tJaiaasJGSCwlqqOEWzZ4OltEHmNsTRrHBsIP0VP
	2RrSS5NNAohhdgTOVPZbyE2hhfva19bj/NENG83GqHPiMlbqVpeS6aayEpa1gNreEJgA08
	CAStz4ck5eho+5+nbHXm501qtSQiws4=
X-MC-Unique: lczibXIIP_WCrqNM8ZWL6A-1
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
Subject: [PULL 6/8] block: remove bdrv_co_io_plug() API
Date: Thu,  1 Jun 2023 11:25:50 -0400
Message-Id: <20230601152552.1603119-7-stefanha@redhat.com>
In-Reply-To: <20230601152552.1603119-1-stefanha@redhat.com>
References: <20230601152552.1603119-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

No block driver implements .bdrv_co_io_plug() anymore. Get rid of the
function pointers.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20230530180959.1108766-7-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
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
index b1cbc1e00c..74195c3004 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -768,11 +768,6 @@ struct BlockDriver {
     void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_debug_event)(
         BlockDriverState *bs, BlkdebugEvent event);
 
-    /* io queue for linux-aio */
-    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_plug)(BlockDriverState *bs);
-    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_unplug)(
-        BlockDriverState *bs);
-
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
 
     bool coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_can_store_new_dirty_bitmap)(
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
index 540bf8d26d..f2dfc7c405 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3223,43 +3223,6 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
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


