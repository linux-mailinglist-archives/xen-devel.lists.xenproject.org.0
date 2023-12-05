Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA02805D1B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648186.1012308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa27-0003aZ-8O; Tue, 05 Dec 2023 18:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648186.1012308; Tue, 05 Dec 2023 18:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa27-0003SQ-1q; Tue, 05 Dec 2023 18:20:35 +0000
Received: by outflank-mailman (input) for mailman id 648186;
 Tue, 05 Dec 2023 18:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa25-0002fT-Ls
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9c4140d-939a-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 19:20:33 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551--Te_eBzINpij5dm8ZX6ilA-1; Tue,
 05 Dec 2023 13:20:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCAF2386A0AF;
 Tue,  5 Dec 2023 18:20:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFE9A3C25;
 Tue,  5 Dec 2023 18:20:25 +0000 (UTC)
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
X-Inumbo-ID: f9c4140d-939a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xkZi3XPrXCgy6FPT4RsS2T7UTaP09qNkYfhhg0EmAc=;
	b=Ku+Yxukh1G++AZSyP02JQQxBVn8GBn/4scck2VsAmUe2U9uSZqmeY6obnyyaOXYYfVRsKk
	du6+uuBJxnixlsSOeB1Wp+jjwrlIi9xJesxliFZg/gA+FqLHLwObG01yZ9ZPnMECcX87Fm
	KZbM2fbp0pBqIngxPPj2GFEYuWlCA08=
X-MC-Unique: -Te_eBzINpij5dm8ZX6ilA-1
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
Subject: [PATCH v2 04/14] aio: make aio_context_acquire()/aio_context_release() a no-op
Date: Tue,  5 Dec 2023 13:20:01 -0500
Message-ID: <20231205182011.1976568-5-stefanha@redhat.com>
In-Reply-To: <20231205182011.1976568-1-stefanha@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

aio_context_acquire()/aio_context_release() has been replaced by
fine-grained locking to protect state shared by multiple threads. The
AioContext lock still plays the role of balancing locking in
AIO_WAIT_WHILE() and many functions in QEMU either require that the
AioContext lock is held or not held for this reason. In other words, the
AioContext lock is purely there for consistency with itself and serves
no real purpose anymore.

Stop actually acquiring/releasing the lock in
aio_context_acquire()/aio_context_release() so that subsequent patches
can remove callers across the codebase incrementally.

I have performed "make check" and qemu-iotests stress tests across
x86-64, ppc64le, and aarch64 to confirm that there are no failures as a
result of eliminating the lock.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
---
 util/async.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/async.c b/util/async.c
index 8f90ddc304..04ee83d220 100644
--- a/util/async.c
+++ b/util/async.c
@@ -725,12 +725,12 @@ void aio_context_unref(AioContext *ctx)
 
 void aio_context_acquire(AioContext *ctx)
 {
-    qemu_rec_mutex_lock(&ctx->lock);
+    /* TODO remove this function */
 }
 
 void aio_context_release(AioContext *ctx)
 {
-    qemu_rec_mutex_unlock(&ctx->lock);
+    /* TODO remove this function */
 }
 
 QEMU_DEFINE_STATIC_CO_TLS(AioContext *, my_aiocontext)
-- 
2.43.0


