Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF67FE08D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644189.1004963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfh-0003oM-Tx; Wed, 29 Nov 2023 19:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644189.1004963; Wed, 29 Nov 2023 19:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Qfh-0003j3-Pj; Wed, 29 Nov 2023 19:56:33 +0000
Received: by outflank-mailman (input) for mailman id 644189;
 Wed, 29 Nov 2023 19:56:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8Qfg-0000Sw-4W
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63bcdf84-8ef1-11ee-98e4-6d05b1d4d9a1;
 Wed, 29 Nov 2023 20:56:31 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-z9E51FFMPQOGFuJl_yEIDg-1; Wed, 29 Nov 2023 14:56:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 569E8852ACC;
 Wed, 29 Nov 2023 19:56:25 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6CB32026D66;
 Wed, 29 Nov 2023 19:56:23 +0000 (UTC)
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
X-Inumbo-ID: 63bcdf84-8ef1-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEy9EWuebl4CuFgfogaWwDt3UnxTDs2t+LuSpg8gM1k=;
	b=QIpFOEM3P+UcwlRS8PFadX67/n06mUI3wwBsyA+41zLZhFgbmON4Pj/jS6JA6dc6XfHOLu
	gsJQo+9PEPCTTIOD79+BEp+MZNDsTvvbS9qIOOwLO0OXT44Cvnt2WzP4doAebFJPr0cHrk
	1f4lS52OFLkIsh1D1hfzWsQTlMe8xm0=
X-MC-Unique: z9E51FFMPQOGFuJl_yEIDg-1
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
Subject: [PATCH 09/12] docs: remove AioContext lock from IOThread docs
Date: Wed, 29 Nov 2023 14:55:50 -0500
Message-ID: <20231129195553.942921-10-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Encourage the use of locking primitives and stop mentioning the
AioContext lock since it is being removed.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/multiple-iothreads.txt | 45 +++++++++++--------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iothreads.txt
index a3e949f6b3..4865196bde 100644
--- a/docs/devel/multiple-iothreads.txt
+++ b/docs/devel/multiple-iothreads.txt
@@ -88,27 +88,18 @@ loop, depending on which AioContext instance the caller passes in.
 
 How to synchronize with an IOThread
 -----------------------------------
-AioContext is not thread-safe so some rules must be followed when using file
-descriptors, event notifiers, timers, or BHs across threads:
+Variables that can be accessed by multiple threads require some form of
+synchronization such as qemu_mutex_lock(), rcu_read_lock(), etc.
 
-1. AioContext functions can always be called safely.  They handle their
-own locking internally.
-
-2. Other threads wishing to access the AioContext must use
-aio_context_acquire()/aio_context_release() for mutual exclusion.  Once the
-context is acquired no other thread can access it or run event loop iterations
-in this AioContext.
-
-Legacy code sometimes nests aio_context_acquire()/aio_context_release() calls.
-Do not use nesting anymore, it is incompatible with the BDRV_POLL_WHILE() macro
-used in the block layer and can lead to hangs.
-
-There is currently no lock ordering rule if a thread needs to acquire multiple
-AioContexts simultaneously.  Therefore, it is only safe for code holding the
-QEMU global mutex to acquire other AioContexts.
+AioContext functions like aio_set_fd_handler(), aio_set_event_notifier(),
+aio_bh_new(), and aio_timer_new() are thread-safe. They can be used to trigger
+activity in an IOThread.
 
 Side note: the best way to schedule a function call across threads is to call
-aio_bh_schedule_oneshot().  No acquire/release or locking is needed.
+aio_bh_schedule_oneshot().
+
+The main loop thread can wait synchronously for a condition using
+AIO_WAIT_WHILE().
 
 AioContext and the block layer
 ------------------------------
@@ -124,22 +115,16 @@ Block layer code must therefore expect to run in an IOThread and avoid using
 old APIs that implicitly use the main loop.  See the "How to program for
 IOThreads" above for information on how to do that.
 
-If main loop code such as a QMP function wishes to access a BlockDriverState
-it must first call aio_context_acquire(bdrv_get_aio_context(bs)) to ensure
-that callbacks in the IOThread do not run in parallel.
-
 Code running in the monitor typically needs to ensure that past
 requests from the guest are completed.  When a block device is running
 in an IOThread, the IOThread can also process requests from the guest
 (via ioeventfd).  To achieve both objects, wrap the code between
 bdrv_drained_begin() and bdrv_drained_end(), thus creating a "drained
-section".  The functions must be called between aio_context_acquire()
-and aio_context_release().  You can freely release and re-acquire the
-AioContext within a drained section.
+section".
 
-Long-running jobs (usually in the form of coroutines) are best scheduled in
-the BlockDriverState's AioContext to avoid the need to acquire/release around
-each bdrv_*() call.  The functions bdrv_add/remove_aio_context_notifier,
-or alternatively blk_add/remove_aio_context_notifier if you use BlockBackends,
-can be used to get a notification whenever bdrv_try_change_aio_context() moves a
+Long-running jobs (usually in the form of coroutines) are often scheduled in
+the BlockDriverState's AioContext.  The functions
+bdrv_add/remove_aio_context_notifier, or alternatively
+blk_add/remove_aio_context_notifier if you use BlockBackends, can be used to
+get a notification whenever bdrv_try_change_aio_context() moves a
 BlockDriverState to a different AioContext.
-- 
2.42.0


