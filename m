Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8144666D2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236802.410695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mso9Z-0006Aw-RZ; Thu, 02 Dec 2021 15:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236802.410695; Thu, 02 Dec 2021 15:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mso9Z-00068F-OK; Thu, 02 Dec 2021 15:37:45 +0000
Received: by outflank-mailman (input) for mailman id 236802;
 Thu, 02 Dec 2021 15:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4zFf=QT=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1mso9Y-000685-Lm
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:37:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9aaf6ea-5385-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 16:37:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-tuIF1GbzP5eXzS-jg1-eyg-1; Thu, 02 Dec 2021 10:37:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AF5B83DD2C;
 Thu,  2 Dec 2021 15:37:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A08401836B;
 Thu,  2 Dec 2021 15:36:22 +0000 (UTC)
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
X-Inumbo-ID: c9aaf6ea-5385-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638459461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tv6ZgPeF9JqTqvfrT/Nt5ske7VQh6DKKAYcNLfnUvF0=;
	b=Rpk75dmH4cc2+Fgmq31cuSXp9tTrveS7f9St0m7h0dw/r4uKOujfnFckpuDD3zPXt/qZwZ
	/2s5APSNTODPBH8ns0Ol7Pl9Keqf1vJlTylYIS+5KwZodBJ161veMMEq4S/Kd3Zeqie4Rw
	MljLKUgy7WCCtKYKWF4okuHAETUUg8o=
X-MC-Unique: tuIF1GbzP5eXzS-jg1-eyg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Lieven <pl@kamp.de>
Subject: [PATCH v2 3/6] virtio-blk: drop unused virtio_blk_handle_vq() return value
Date: Thu,  2 Dec 2021 15:33:59 +0000
Message-Id: <20211202153402.604951-4-stefanha@redhat.com>
In-Reply-To: <20211202153402.604951-1-stefanha@redhat.com>
References: <20211202153402.604951-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The return value of virtio_blk_handle_vq() is no longer used. Get rid of
it. This is a step towards unifying the dataplane and non-dataplane
virtqueue handler functions.

Prepare virtio_blk_handle_output() to be used by both dataplane and
non-dataplane by making the condition for starting ioeventfd more
specific. This way it won't trigger when dataplane has already been
started.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-blk.h |  2 +-
 hw/block/virtio-blk.c          | 14 +++-----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 29655a406d..d311c57cca 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -90,7 +90,7 @@ typedef struct MultiReqBuffer {
     bool is_write;
 } MultiReqBuffer;
 
-bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
+void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh);
 
 #endif
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7cc9..82676cdd01 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -767,12 +767,11 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     return 0;
 }
 
-bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
+void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
 {
     VirtIOBlockReq *req;
     MultiReqBuffer mrb = {};
     bool suppress_notifications = virtio_queue_get_notification(vq);
-    bool progress = false;
 
     aio_context_acquire(blk_get_aio_context(s->blk));
     blk_io_plug(s->blk);
@@ -783,7 +782,6 @@ bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
         }
 
         while ((req = virtio_blk_get_request(s, vq))) {
-            progress = true;
             if (virtio_blk_handle_request(req, &mrb)) {
                 virtqueue_detach_element(req->vq, &req->elem, 0);
                 virtio_blk_free_request(req);
@@ -802,19 +800,13 @@ bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
 
     blk_io_unplug(s->blk);
     aio_context_release(blk_get_aio_context(s->blk));
-    return progress;
-}
-
-static void virtio_blk_handle_output_do(VirtIOBlock *s, VirtQueue *vq)
-{
-    virtio_blk_handle_vq(s, vq);
 }
 
 static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOBlock *s = (VirtIOBlock *)vdev;
 
-    if (s->dataplane) {
+    if (s->dataplane && !s->dataplane_started) {
         /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
          * dataplane here instead of waiting for .set_status().
          */
@@ -823,7 +815,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
             return;
         }
     }
-    virtio_blk_handle_output_do(s, vq);
+    virtio_blk_handle_vq(s, vq);
 }
 
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
-- 
2.33.1


