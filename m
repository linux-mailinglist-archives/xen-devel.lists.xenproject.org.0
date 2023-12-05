Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C41805D23
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648196.1012373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2Q-0006DS-WC; Tue, 05 Dec 2023 18:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648196.1012373; Tue, 05 Dec 2023 18:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa2Q-00068I-MP; Tue, 05 Dec 2023 18:20:54 +0000
Received: by outflank-mailman (input) for mailman id 648196;
 Tue, 05 Dec 2023 18:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa2P-0002wG-0G
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03bfa233-939b-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 19:20:49 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-vcT85WOuNBCsPHqsqxe_sw-1; Tue,
 05 Dec 2023 13:20:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 309EC3C2A1C8;
 Tue,  5 Dec 2023 18:20:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 716931121312;
 Tue,  5 Dec 2023 18:20:40 +0000 (UTC)
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
X-Inumbo-ID: 03bfa233-939b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcv/XqVh2Z7iu9z6gUwclnS+Bu4/7vR59iug4jWCKh4=;
	b=dPeenLW2QWqasP3i4IT7DuHtatnhn/4Qc5MekdMRc8bHeur3/M1H/Tpk+ShhgP5QMg5Lym
	+4MCB/mVaQm/PioyJmr3sO2WTxbkrKCz4YHbBbqTVHaVC16nURBx+bXeEE1c2Ms5ywI1OQ
	Th1/A7dQySjgJ42NCYMW/jUquN4S6mk=
X-MC-Unique: vcT85WOuNBCsPHqsqxe_sw-1
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
Subject: [PATCH v2 09/14] aio-wait: draw equivalence between AIO_WAIT_WHILE() and AIO_WAIT_WHILE_UNLOCKED()
Date: Tue,  5 Dec 2023 13:20:06 -0500
Message-ID: <20231205182011.1976568-10-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Now that the AioContext lock no longer exists, AIO_WAIT_WHILE() and
AIO_WAIT_WHILE_UNLOCKED() are equivalent.

A future patch will get rid of AIO_WAIT_WHILE_UNLOCKED().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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
2.43.0


