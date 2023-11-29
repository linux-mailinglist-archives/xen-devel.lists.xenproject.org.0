Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461A7FE089
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644185.1004944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfe-00035R-6z; Wed, 29 Nov 2023 19:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644185.1004944; Wed, 29 Nov 2023 19:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfe-000327-1k; Wed, 29 Nov 2023 19:56:30 +0000
Received: by outflank-mailman (input) for mailman id 644185;
 Wed, 29 Nov 2023 19:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8Qfc-0000tx-PS
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6119a210-8ef1-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:56:27 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-V4RCa5FgOVyNOyjvlaQEWQ-1; Wed, 29 Nov 2023 14:56:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDC72185A781;
 Wed, 29 Nov 2023 19:56:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59B8540C6EBA;
 Wed, 29 Nov 2023 19:56:21 +0000 (UTC)
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
X-Inumbo-ID: 6119a210-8ef1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKDLiHF1X71kKBGZSvHJbLZCC/+L9f9ZlF5nJQ5JHss=;
	b=X6wSY8RxPat3bgpHmYKU1oqbd3c//eONLxQ1eaNz39Wai9PtSKLF8wwc4zfknFGD/bvHqu
	pNsRCfimNe2IglWYCueTa/Y9hnovs0h58Sq4D9MEPKrCsCBdJnXWXdV4BXfzAfVv1PerbD
	ag9HkoGrIqvN19S4PF3ADTLkc29uQKU=
X-MC-Unique: V4RCa5FgOVyNOyjvlaQEWQ-1
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
Subject: [PATCH 08/12] aio: remove aio_context_acquire()/aio_context_release() API
Date: Wed, 29 Nov 2023 14:55:49 -0500
Message-ID: <20231129195553.942921-9-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Delete these functions because nothing calls these functions anymore.

I introduced these APIs in commit 98563fc3ec44 ("aio: add
aio_context_acquire() and aio_context_release()") in 2014. It's with a
sigh of relief that I delete these APIs almost 10 years later.

Thanks to Paolo Bonzini's vision for multi-queue QEMU, we got an
understanding of where the code needed to go in order to remove the
limitations that the original dataplane and the IOThread/AioContext
approach that followed it.

Emanuele Giuseppe Esposito had the splendid determination to convert
large parts of the codebase so that they no longer needed the AioContext
lock. This was a painstaking process, both in the actual code changes
required and the iterations of code review that Emanuele eeked out of
Kevin and me over many months.

Kevin Wolf tackled multitudes of graph locking conversions to protect
in-flight I/O from run-time changes to the block graph as well as the
clang Thread Safety Analysis annotations that allow the compiler to
check whether the graph lock is being used correctly.

And me, well, I'm just here to add some pizzazz to the QEMU multi-queue
block layer :). Thank you to everyone who helped with this effort,
including Eric Blake, code reviewer extraordinaire, and others who I've
forgotten to mention.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/aio.h | 17 -----------------
 util/async.c        | 10 ----------
 2 files changed, 27 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index f08b358077..af05512a7d 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -278,23 +278,6 @@ void aio_context_ref(AioContext *ctx);
  */
 void aio_context_unref(AioContext *ctx);
 
-/* Take ownership of the AioContext.  If the AioContext will be shared between
- * threads, and a thread does not want to be interrupted, it will have to
- * take ownership around calls to aio_poll().  Otherwise, aio_poll()
- * automatically takes care of calling aio_context_acquire and
- * aio_context_release.
- *
- * Note that this is separate from bdrv_drained_begin/bdrv_drained_end.  A
- * thread still has to call those to avoid being interrupted by the guest.
- *
- * Bottom halves, timers and callbacks can be created or removed without
- * acquiring the AioContext.
- */
-void aio_context_acquire(AioContext *ctx);
-
-/* Relinquish ownership of the AioContext. */
-void aio_context_release(AioContext *ctx);
-
 /**
  * aio_bh_schedule_oneshot_full: Allocate a new bottom half structure that will
  * run only once and as soon as possible.
diff --git a/util/async.c b/util/async.c
index dfd44ef612..460529057c 100644
--- a/util/async.c
+++ b/util/async.c
@@ -719,16 +719,6 @@ void aio_context_unref(AioContext *ctx)
     g_source_unref(&ctx->source);
 }
 
-void aio_context_acquire(AioContext *ctx)
-{
-    /* TODO remove this function */
-}
-
-void aio_context_release(AioContext *ctx)
-{
-    /* TODO remove this function */
-}
-
 QEMU_DEFINE_STATIC_CO_TLS(AioContext *, my_aiocontext)
 
 AioContext *qemu_get_current_aio_context(void)
-- 
2.42.0


