Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F148C928
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 18:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256778.440837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hEg-0005Ba-Mk; Wed, 12 Jan 2022 17:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256778.440837; Wed, 12 Jan 2022 17:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7hEg-00058M-It; Wed, 12 Jan 2022 17:16:34 +0000
Received: by outflank-mailman (input) for mailman id 256778;
 Wed, 12 Jan 2022 17:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmOE=R4=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1n7hEe-00057V-TS
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 17:16:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 627151e5-73cb-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 18:16:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-yktkATvTO-uTf4aP_dmcXA-1; Wed, 12 Jan 2022 12:16:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47CC41018724;
 Wed, 12 Jan 2022 17:16:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7093105C89A;
 Wed, 12 Jan 2022 17:16:23 +0000 (UTC)
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
X-Inumbo-ID: 627151e5-73cb-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642007790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZO4PTDIj23J8uv/+cKDtCuqXWq72LiUYuH0KK782SUk=;
	b=KI+DnpvAGDKmjBkmFYkdqMc706mLrTzYSqbXgDJRFL6LaetE5gjUYrJkfFRPwLY/7+gWmc
	k7BCU8aVa3/27Sj979GF46Mgp2k2xfXoDS9ZQyUgF8XcZs1u3cGdeP0Od52AadL482wKPx
	ly344SooNpwTp9NyeHxKvTe9qFdihGc=
X-MC-Unique: yktkATvTO-uTf4aP_dmcXA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Coiby Xu <Coiby.Xu@gmail.com>,
	Fam Zheng <fam@euphon.net>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	qemu-block@nongnu.org,
	Julia Suvorova <jusual@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 3/6] virtio-blk: drop unused virtio_blk_handle_vq() return value
Date: Wed, 12 Jan 2022 17:13:59 +0000
Message-Id: <20220112171402.112183-4-stefanha@redhat.com>
In-Reply-To: <20220112171402.112183-1-stefanha@redhat.com>
References: <20220112171402.112183-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20211207132336.36627-4-stefanha@redhat.com
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
2.34.1


