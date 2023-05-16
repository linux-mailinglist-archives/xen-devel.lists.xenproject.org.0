Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9BB70569D
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535459.833221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzx2-00043N-Ku; Tue, 16 May 2023 19:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535459.833221; Tue, 16 May 2023 19:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzx2-0003zo-HE; Tue, 16 May 2023 19:03:12 +0000
Received: by outflank-mailman (input) for mailman id 535459;
 Tue, 16 May 2023 19:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzm0=BF=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pyzx1-0002US-Jg
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:03:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bff89f6-f41c-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:03:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-OBDdMVeVNAuZ1qrl1VHmbQ-1; Tue, 16 May 2023 15:03:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58E9329A9D28;
 Tue, 16 May 2023 19:03:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 647022166B32;
 Tue, 16 May 2023 19:03:00 +0000 (UTC)
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
X-Inumbo-ID: 4bff89f6-f41c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684263788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QN5dUSHOXHxwuqPaPoFoBIoQO1wy9z42Wgl8ufTpgyA=;
	b=WzaVG5MaQyG9P6T/wzFKvz58omq6ynPyCZabP5mL0PdruVaHgdJSKbhcsadkNRcvmfau9n
	YgzGLkV+VQBVg+0CpBtlxT576dbYGjPfmsEw+OytEzlWcU5+5XkxX5G4uzyit2yivvztb7
	uwdtPGI0do/si2SohMIH3ljUPn05cLg=
X-MC-Unique: OBDdMVeVNAuZ1qrl1VHmbQ-1
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
Subject: [PATCH v6 05/20] util/vhost-user-server: rename refcount to in_flight counter
Date: Tue, 16 May 2023 15:02:23 -0400
Message-Id: <20230516190238.8401-6-stefanha@redhat.com>
In-Reply-To: <20230516190238.8401-1-stefanha@redhat.com>
References: <20230516190238.8401-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

The VuServer object has a refcount field and ref/unref APIs. The name is
confusing because it's actually an in-flight request counter instead of
a refcount.

Normally a refcount destroys the object upon reaching zero. The VuServer
counter is used to wake up the vhost-user coroutine when there are no
more requests.

Avoid confusing by renaming refcount and ref/unref to in_flight and
inc/dec.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/vhost-user-server.h     |  6 +++---
 block/export/vhost-user-blk-server.c | 11 +++++++----
 util/vhost-user-server.c             | 14 +++++++-------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
index 25c72433ca..bc0ac9ddb6 100644
--- a/include/qemu/vhost-user-server.h
+++ b/include/qemu/vhost-user-server.h
@@ -41,7 +41,7 @@ typedef struct {
     const VuDevIface *vu_iface;
 
     /* Protected by ctx lock */
-    unsigned int refcount;
+    unsigned int in_flight;
     bool wait_idle;
     VuDev vu_dev;
     QIOChannel *ioc; /* The I/O channel with the client */
@@ -60,8 +60,8 @@ bool vhost_user_server_start(VuServer *server,
 
 void vhost_user_server_stop(VuServer *server);
 
-void vhost_user_server_ref(VuServer *server);
-void vhost_user_server_unref(VuServer *server);
+void vhost_user_server_inc_in_flight(VuServer *server);
+void vhost_user_server_dec_in_flight(VuServer *server);
 
 void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx);
 void vhost_user_server_detach_aio_context(VuServer *server);
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index e56b92f2e2..841acb36e3 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -50,7 +50,10 @@ static void vu_blk_req_complete(VuBlkReq *req, size_t in_len)
     free(req);
 }
 
-/* Called with server refcount increased, must decrease before returning */
+/*
+ * Called with server in_flight counter increased, must decrease before
+ * returning.
+ */
 static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
 {
     VuBlkReq *req = opaque;
@@ -68,12 +71,12 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
                                     in_num, out_num);
     if (in_len < 0) {
         free(req);
-        vhost_user_server_unref(server);
+        vhost_user_server_dec_in_flight(server);
         return;
     }
 
     vu_blk_req_complete(req, in_len);
-    vhost_user_server_unref(server);
+    vhost_user_server_dec_in_flight(server);
 }
 
 static void vu_blk_process_vq(VuDev *vu_dev, int idx)
@@ -95,7 +98,7 @@ static void vu_blk_process_vq(VuDev *vu_dev, int idx)
         Coroutine *co =
             qemu_coroutine_create(vu_blk_virtio_process_req, req);
 
-        vhost_user_server_ref(server);
+        vhost_user_server_inc_in_flight(server);
         qemu_coroutine_enter(co);
     }
 }
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 5b6216069c..1622f8cfb3 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -75,16 +75,16 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
     error_report("vu_panic: %s", buf);
 }
 
-void vhost_user_server_ref(VuServer *server)
+void vhost_user_server_inc_in_flight(VuServer *server)
 {
     assert(!server->wait_idle);
-    server->refcount++;
+    server->in_flight++;
 }
 
-void vhost_user_server_unref(VuServer *server)
+void vhost_user_server_dec_in_flight(VuServer *server)
 {
-    server->refcount--;
-    if (server->wait_idle && !server->refcount) {
+    server->in_flight--;
+    if (server->wait_idle && !server->in_flight) {
         aio_co_wake(server->co_trip);
     }
 }
@@ -192,13 +192,13 @@ static coroutine_fn void vu_client_trip(void *opaque)
         /* Keep running */
     }
 
-    if (server->refcount) {
+    if (server->in_flight) {
         /* Wait for requests to complete before we can unmap the memory */
         server->wait_idle = true;
         qemu_coroutine_yield();
         server->wait_idle = false;
     }
-    assert(server->refcount == 0);
+    assert(server->in_flight == 0);
 
     vu_deinit(vu_dev);
 
-- 
2.40.1


