Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38777FE082
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644177.1004893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QfN-00014O-27; Wed, 29 Nov 2023 19:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644177.1004893; Wed, 29 Nov 2023 19:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QfM-00012H-Un; Wed, 29 Nov 2023 19:56:12 +0000
Received: by outflank-mailman (input) for mailman id 644177;
 Wed, 29 Nov 2023 19:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8QfL-0000tx-Hh
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:56:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56595fa9-8ef1-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:56:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-cCc6c86vMTanlI7Lk6yCzA-1; Wed, 29 Nov 2023 14:56:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54B1D85A5B5;
 Wed, 29 Nov 2023 19:56:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 945FCC15881;
 Wed, 29 Nov 2023 19:56:02 +0000 (UTC)
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
X-Inumbo-ID: 56595fa9-8ef1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701287768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aS2QKCjvSUaDgBLp5BpYBu5ELqUNynQgUkZ8pGmrnOA=;
	b=PkczHfrzBWmQuzJGedWZd53LHhHi3jf8PdjtMTrPqN/CNxgTNh7ZSXqkqEETi4WIOE0k/d
	EPxoRgLEtGnjw22GwN0wxh68q4dpva4ypKt4rVZfrhncM9ZJRZXsjKhjIZa5oVD4WpeE+Q
	Zui5Ty3ln5q/9hdXj06cIeFxIFzLeTY=
X-MC-Unique: cCc6c86vMTanlI7Lk6yCzA-1
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
Subject: [PATCH 02/12] tests: remove aio_context_acquire() tests
Date: Wed, 29 Nov 2023 14:55:43 -0500
Message-ID: <20231129195553.942921-3-stefanha@redhat.com>
In-Reply-To: <20231129195553.942921-1-stefanha@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

The aio_context_acquire() API is being removed. Drop the test case that
calls the API.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/unit/test-aio.c | 67 +------------------------------------------
 1 file changed, 1 insertion(+), 66 deletions(-)

diff --git a/tests/unit/test-aio.c b/tests/unit/test-aio.c
index 337b6e4ea7..e77d86be87 100644
--- a/tests/unit/test-aio.c
+++ b/tests/unit/test-aio.c
@@ -100,76 +100,12 @@ static void event_ready_cb(EventNotifier *e)
 
 /* Tests using aio_*.  */
 
-typedef struct {
-    QemuMutex start_lock;
-    EventNotifier notifier;
-    bool thread_acquired;
-} AcquireTestData;
-
-static void *test_acquire_thread(void *opaque)
-{
-    AcquireTestData *data = opaque;
-
-    /* Wait for other thread to let us start */
-    qemu_mutex_lock(&data->start_lock);
-    qemu_mutex_unlock(&data->start_lock);
-
-    /* event_notifier_set might be called either before or after
-     * the main thread's call to poll().  The test case's outcome
-     * should be the same in either case.
-     */
-    event_notifier_set(&data->notifier);
-    aio_context_acquire(ctx);
-    aio_context_release(ctx);
-
-    data->thread_acquired = true; /* success, we got here */
-
-    return NULL;
-}
-
 static void set_event_notifier(AioContext *nctx, EventNotifier *notifier,
                                EventNotifierHandler *handler)
 {
     aio_set_event_notifier(nctx, notifier, handler, NULL, NULL);
 }
 
-static void dummy_notifier_read(EventNotifier *n)
-{
-    event_notifier_test_and_clear(n);
-}
-
-static void test_acquire(void)
-{
-    QemuThread thread;
-    AcquireTestData data;
-
-    /* Dummy event notifier ensures aio_poll() will block */
-    event_notifier_init(&data.notifier, false);
-    set_event_notifier(ctx, &data.notifier, dummy_notifier_read);
-    g_assert(!aio_poll(ctx, false)); /* consume aio_notify() */
-
-    qemu_mutex_init(&data.start_lock);
-    qemu_mutex_lock(&data.start_lock);
-    data.thread_acquired = false;
-
-    qemu_thread_create(&thread, "test_acquire_thread",
-                       test_acquire_thread,
-                       &data, QEMU_THREAD_JOINABLE);
-
-    /* Block in aio_poll(), let other thread kick us and acquire context */
-    aio_context_acquire(ctx);
-    qemu_mutex_unlock(&data.start_lock); /* let the thread run */
-    g_assert(aio_poll(ctx, true));
-    g_assert(!data.thread_acquired);
-    aio_context_release(ctx);
-
-    qemu_thread_join(&thread);
-    set_event_notifier(ctx, &data.notifier, NULL);
-    event_notifier_cleanup(&data.notifier);
-
-    g_assert(data.thread_acquired);
-}
-
 static void test_bh_schedule(void)
 {
     BHTestData data = { .n = 0 };
@@ -879,7 +815,7 @@ static void test_worker_thread_co_enter(void)
     qemu_thread_get_self(&this_thread);
     co = qemu_coroutine_create(co_check_current_thread, &this_thread);
 
-    qemu_thread_create(&worker_thread, "test_acquire_thread",
+    qemu_thread_create(&worker_thread, "test_aio_co_enter",
                        test_aio_co_enter,
                        co, QEMU_THREAD_JOINABLE);
 
@@ -899,7 +835,6 @@ int main(int argc, char **argv)
     while (g_main_context_iteration(NULL, false));
 
     g_test_init(&argc, &argv, NULL);
-    g_test_add_func("/aio/acquire",                 test_acquire);
     g_test_add_func("/aio/bh/schedule",             test_bh_schedule);
     g_test_add_func("/aio/bh/schedule10",           test_bh_schedule10);
     g_test_add_func("/aio/bh/cancel",               test_bh_cancel);
-- 
2.42.0


