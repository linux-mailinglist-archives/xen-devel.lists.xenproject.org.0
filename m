Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E546BC74
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 14:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241099.417954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaTF-0005kC-Bs; Tue, 07 Dec 2021 13:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241099.417954; Tue, 07 Dec 2021 13:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaTF-0005hv-5l; Tue, 07 Dec 2021 13:25:25 +0000
Received: by outflank-mailman (input) for mailman id 241099;
 Tue, 07 Dec 2021 13:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kpq=QY=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1muaTD-0004L1-Gd
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 13:25:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20df2204-5761-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 14:25:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-5v2E1M36P3K2-fPgHlnIgA-1; Tue, 07 Dec 2021 08:25:18 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C17A1B2C980;
 Tue,  7 Dec 2021 13:25:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08DE818369;
 Tue,  7 Dec 2021 13:25:15 +0000 (UTC)
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
X-Inumbo-ID: 20df2204-5761-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638883521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tv6ZgPeF9JqTqvfrT/Nt5ske7VQh6DKKAYcNLfnUvF0=;
	b=bvbBb+LVwVqgLle+ai235/CUQZ6nKtPJ1gGsUO2yZx1YRR5he2arpu0E+TUHCm1wu9gK9t
	jAG680Siz39JIbKc1a+wD+4s225SesvRPHTxcU+ek+uxjv+7nSVem8kzZbZHOFi0G/ya34
	jz+zj1VBt1InDeFnhGr+Z5StFwe3CVc=
X-MC-Unique: 5v2E1M36P3K2-fPgHlnIgA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Peter Lieven <pl@kamp.de>
Subject: [PATCH v3 3/6] virtio-blk: drop unused virtio_blk_handle_vq() return value
Date: Tue,  7 Dec 2021 13:23:33 +0000
Message-Id: <20211207132336.36627-4-stefanha@redhat.com>
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
References: <20211207132336.36627-1-stefanha@redhat.com>
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


