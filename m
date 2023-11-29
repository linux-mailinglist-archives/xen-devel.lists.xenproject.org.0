Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473F57FE08A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644188.1004954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfg-0003Sz-HG; Wed, 29 Nov 2023 19:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644188.1004954; Wed, 29 Nov 2023 19:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfg-0003QG-CK; Wed, 29 Nov 2023 19:56:32 +0000
Received: by outflank-mailman (input) for mailman id 644188;
 Wed, 29 Nov 2023 19:56:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8Qfe-0000tx-Pm
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61ca406b-8ef1-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:56:28 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-kXGyFUX-NIuQCfHv6oG-HA-1; Wed, 29 Nov 2023 14:56:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8B9585A59D;
 Wed, 29 Nov 2023 19:56:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D6602026D66;
 Wed, 29 Nov 2023 19:56:18 +0000 (UTC)
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
X-Inumbo-ID: 61ca406b-8ef1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTcDFzFaOMJ4phQ9Kw9SCD8w63fmY3HfH7RTFoWnJ+c=;
	b=UnrAJUJxEHGyrHIGQ9OTEpvajlA8X8lae+B6Gm44ReFHpoctQD18Zfp0rFIpuiK63tHfjt
	tQaAC1KDbMp2QKS2pQ7DGfydhhN6XbVN4vzQqI+fVR+XSU718tmxSqzBPtGhz9v4f4IXni
	BeYsCbqNyX5TGoUDVjp9AWUgxnNMwgE=
X-MC-Unique: kXGyFUX-NIuQCfHv6oG-HA-1
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
Subject: [PATCH 07/12] aio-wait: draw equivalence between AIO_WAIT_WHILE() and AIO_WAIT_WHILE_UNLOCKED()
Date: Wed, 29 Nov 2023 14:55:48 -0500
Message-ID: <20231129195553.942921-8-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Now that the AioContext lock no longer exists, AIO_WAIT_WHILE() and
AIO_WAIT_WHILE_UNLOCKED() are equivalent.

A future patch will get rid of AIO_WAIT_WHILE_UNLOCKED().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/aio-wait.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index 5449b6d742..157f105916 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -63,9 +63,6 @@ extern AioWait global_aio_wait;
  * @ctx: the aio context, or NULL if multiple aio contexts (for which the
  *       caller does not hold a lock) are involved in the polling condition.
  * @cond: wait while this conditional expression is true
- * @unlock: whether to unlock and then lock again @ctx. This applies
- * only when waiting for another AioContext from the main loop.
- * Otherwise it's ignored.
  *
  * Wait while a condition is true.  Use this to implement synchronous
  * operations that require event loop activity.
@@ -78,7 +75,7 @@ extern AioWait global_aio_wait;
  * wait on conditions between two IOThreads since that could lead to deadlock,
  * go via the main loop instead.
  */
-#define AIO_WAIT_WHILE_INTERNAL(ctx, cond, unlock) ({              \
+#define AIO_WAIT_WHILE_INTERNAL(ctx, cond) ({                      \
     bool waited_ = false;                                          \
     AioWait *wait_ = &global_aio_wait;                             \
     AioContext *ctx_ = (ctx);                                      \
@@ -95,13 +92,7 @@ extern AioWait global_aio_wait;
         assert(qemu_get_current_aio_context() ==                   \
                qemu_get_aio_context());                            \
         while ((cond)) {                                           \
-            if (unlock && ctx_) {                                  \
-                aio_context_release(ctx_);                         \
-            }                                                      \
             aio_poll(qemu_get_aio_context(), true);                \
-            if (unlock && ctx_) {                                  \
-                aio_context_acquire(ctx_);                         \
-            }                                                      \
             waited_ = true;                                        \
         }                                                          \
     }                                                              \
@@ -109,10 +100,11 @@ extern AioWait global_aio_wait;
     waited_; })
 
 #define AIO_WAIT_WHILE(ctx, cond)                                  \
-    AIO_WAIT_WHILE_INTERNAL(ctx, cond, true)
+    AIO_WAIT_WHILE_INTERNAL(ctx, cond)
 
+/* TODO replace this with AIO_WAIT_WHILE() in a future patch */
 #define AIO_WAIT_WHILE_UNLOCKED(ctx, cond)                         \
-    AIO_WAIT_WHILE_INTERNAL(ctx, cond, false)
+    AIO_WAIT_WHILE_INTERNAL(ctx, cond)
 
 /**
  * aio_wait_kick:
-- 
2.42.0


