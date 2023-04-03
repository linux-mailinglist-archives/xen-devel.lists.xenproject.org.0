Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D96D506C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517550.803052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwr-0004og-Et; Mon, 03 Apr 2023 18:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517550.803052; Mon, 03 Apr 2023 18:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwr-0004mT-9Z; Mon, 03 Apr 2023 18:30:33 +0000
Received: by outflank-mailman (input) for mailman id 517550;
 Mon, 03 Apr 2023 18:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOwp-0004HH-5d
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9baee2a3-d24d-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 20:30:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-2uGakXqQNEinBtqwH2bvkA-1; Mon, 03 Apr 2023 14:30:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07C581C27DBC;
 Mon,  3 Apr 2023 18:30:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F35E2166B26;
 Mon,  3 Apr 2023 18:30:16 +0000 (UTC)
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
X-Inumbo-ID: 9baee2a3-d24d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpef4kT6gqf7n/rR0/ynntTmCBLqt8QRSEC7iM5/ics=;
	b=ffR9Y3K7u6+01Mx2Q47gj+8wq/GyXU0w05hTOcdsfp3Aewhmmd9SpVIs+UPuDgm4qXvbdl
	Uq4PldBdZbSCy/MljL4kEmO0k5iA9PXy6yku4nOslN8OZWoSycHJfzbSD77K1t3or/GZiK
	CiJi195aeO5BZvOeY0rVXdthKlTf1dg=
X-MC-Unique: 2uGakXqQNEinBtqwH2bvkA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	<qemu-block@nongnu.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	eesposit@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH 03/13] block/export: only acquire AioContext once for vhost_user_server_stop()
Date: Mon,  3 Apr 2023 14:29:54 -0400
Message-Id: <20230403183004.347205-4-stefanha@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

vhost_user_server_stop() uses AIO_WAIT_WHILE(). AIO_WAIT_WHILE()
requires that AioContext is only acquired once.

Since blk_exp_request_shutdown() already acquires the AioContext it
shouldn't be acquired again in vhost_user_server_stop().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vhost-user-server.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 40f36ea214..5b6216069c 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -346,10 +346,9 @@ static void vu_accept(QIONetListener *listener, QIOChannelSocket *sioc,
     aio_context_release(server->ctx);
 }
 
+/* server->ctx acquired by caller */
 void vhost_user_server_stop(VuServer *server)
 {
-    aio_context_acquire(server->ctx);
-
     qemu_bh_delete(server->restart_listener_bh);
     server->restart_listener_bh = NULL;
 
@@ -366,8 +365,6 @@ void vhost_user_server_stop(VuServer *server)
         AIO_WAIT_WHILE(server->ctx, server->co_trip);
     }
 
-    aio_context_release(server->ctx);
-
     if (server->listener) {
         qio_net_listener_disconnect(server->listener);
         object_unref(OBJECT(server->listener));
-- 
2.39.2


