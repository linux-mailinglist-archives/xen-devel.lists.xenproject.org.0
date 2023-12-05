Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF2805D1E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648189.1012343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2I-0004z9-Mx; Tue, 05 Dec 2023 18:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648189.1012343; Tue, 05 Dec 2023 18:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2I-0004vh-I8; Tue, 05 Dec 2023 18:20:46 +0000
Received: by outflank-mailman (input) for mailman id 648189;
 Tue, 05 Dec 2023 18:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa2G-0002fT-Pz
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0076e629-939b-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 19:20:44 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-aLTBzfH7NZ6pFUQL-ZClUQ-1; Tue,
 05 Dec 2023 13:20:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D0029ABA04;
 Tue,  5 Dec 2023 18:20:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D27EE3C25;
 Tue,  5 Dec 2023 18:20:35 +0000 (UTC)
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
X-Inumbo-ID: 0076e629-939b-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTK1D/m0rA2DrSG0310cQh9Ae3M4PF5cLiXTsHSalhM=;
	b=CqFKd2elAa5X3eJu7+hCP5rmtkCEBMWlGP84WpDOw6sLupBFEpIYWts9p3tw8F0VrAstGk
	/v7tLUpPhnJ69lmj4gqauHXfFYe3RaN2MMcE/mRAsttXwZSwQHOShcC0TPALUhO1zJ/cEC
	Sqd1BURKoB6wK0AHFl10TI9O//xqHLY=
X-MC-Unique: aLTBzfH7NZ6pFUQL-ZClUQ-1
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
Subject: [PATCH v2 07/14] block: remove bdrv_co_lock()
Date: Tue,  5 Dec 2023 13:20:04 -0500
Message-ID: <20231205182011.1976568-8-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

The bdrv_co_lock() and bdrv_co_unlock() functions are already no-ops.
Remove them.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-global-state.h | 14 --------------
 block.c                            | 10 ----------
 blockdev.c                         |  4 ----
 3 files changed, 28 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 0327f1c605..4ec0b217f0 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -267,20 +267,6 @@ int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag);
 int bdrv_debug_resume(BlockDriverState *bs, const char *tag);
 bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag);
 
-/**
- * Locks the AioContext of @bs if it's not the current AioContext. This avoids
- * double locking which could lead to deadlocks: This is a coroutine_fn, so we
- * know we already own the lock of the current AioContext.
- *
- * May only be called in the main thread.
- */
-void coroutine_fn bdrv_co_lock(BlockDriverState *bs);
-
-/**
- * Unlocks the AioContext of @bs if it's not the current AioContext.
- */
-void coroutine_fn bdrv_co_unlock(BlockDriverState *bs);
-
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GHashTable *visited, Transaction *tran,
                                    Error **errp);
diff --git a/block.c b/block.c
index 91ace5d2d5..434b7f4d72 100644
--- a/block.c
+++ b/block.c
@@ -7431,16 +7431,6 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx)
     bdrv_dec_in_flight(bs);
 }
 
-void coroutine_fn bdrv_co_lock(BlockDriverState *bs)
-{
-    /* TODO removed in next patch */
-}
-
-void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
-{
-    /* TODO removed in next patch */
-}
-
 static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
 {
     GLOBAL_STATE_CODE();
diff --git a/blockdev.c b/blockdev.c
index 8a1b28f830..3a5e7222ec 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2264,18 +2264,14 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
         return;
     }
 
-    bdrv_co_lock(bs);
     bdrv_drained_begin(bs);
-    bdrv_co_unlock(bs);
 
     old_ctx = bdrv_co_enter(bs);
     blk_co_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
     bdrv_co_leave(bs, old_ctx);
 
-    bdrv_co_lock(bs);
     bdrv_drained_end(bs);
     blk_co_unref(blk);
-    bdrv_co_unlock(bs);
 }
 
 void qmp_block_stream(const char *job_id, const char *device,
-- 
2.43.0


