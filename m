Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BA6F74DF
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530066.825389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1U-0005TL-G0; Thu, 04 May 2023 19:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530066.825389; Thu, 04 May 2023 19:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1U-0005P9-Bc; Thu, 04 May 2023 19:53:52 +0000
Received: by outflank-mailman (input) for mailman id 530066;
 Thu, 04 May 2023 19:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1T-0003iB-C6
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:53:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6378c682-eab5-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:53:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-Q3sOoSu5NLOST1Dr08hq8A-1; Thu, 04 May 2023 15:53:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D133A811E7B;
 Thu,  4 May 2023 19:53:46 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35F9F1410F29;
 Thu,  4 May 2023 19:53:45 +0000 (UTC)
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
X-Inumbo-ID: 6378c682-eab5-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh9JsAzQBVO7FYeYzOSkBp65HQ8Exa/aGS/jTv3In5w=;
	b=EzZQBmmhNU4ngSGJiFO3DnxrSckJJBnghhkyNeVJXLS0C5BOvjHPSqdaNsbAB27GKPdln4
	TZPPF56oof8Ztitpzo9qCrWwFS3b2PO6Dbr4/8nfab7sPM5rL6NQnlBwe8oSYm9u2an1Zc
	lVLQ13sCnnKTIaGjt41I5Qd5tcg/LXo=
X-MC-Unique: Q3sOoSu5NLOST1Dr08hq8A-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 06/21] util/vhost-user-server: rename refcount to in_flight counter
Date: Thu,  4 May 2023 15:53:12 -0400
Message-Id: <20230504195327.695107-7-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

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


