Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D82046BC7F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 14:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241124.418010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaUo-0000ZN-Ie; Tue, 07 Dec 2021 13:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241124.418010; Tue, 07 Dec 2021 13:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaUo-0000V9-DE; Tue, 07 Dec 2021 13:27:02 +0000
Received: by outflank-mailman (input) for mailman id 241124;
 Tue, 07 Dec 2021 13:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kpq=QY=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1muaTr-0005E4-La
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 13:26:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38291668-5761-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 14:26:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-THj-iKtlMaqBgcbjuGxKng-1; Tue, 07 Dec 2021 08:25:57 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00A56801AFC;
 Tue,  7 Dec 2021 13:25:56 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63BF160843;
 Tue,  7 Dec 2021 13:25:19 +0000 (UTC)
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
X-Inumbo-ID: 38291668-5761-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638883560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nlInce6IWTRh/rB2Z2ehw0FDNveTv4bBVY9vPQnOQcs=;
	b=C5WA5KmJmBD9hIBqzruHVACVORpCqsl5akFJ5zLwnplxHx5dGActfizoWjh2nMqAYjI464
	hZpEVNLcD7u8orrkn1hQNk3dNvNJuob51JKvz+cxrI9gGqdF/dNAsbbui6R0Y1rCSBKKs0
	6qYQUdMzYeeqLUbThS2RwJW0fay60gQ=
X-MC-Unique: THj-iKtlMaqBgcbjuGxKng-1
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
Subject: [PATCH v3 5/6] virtio: use ->handle_output() instead of ->handle_aio_output()
Date: Tue,  7 Dec 2021 13:23:35 +0000
Message-Id: <20211207132336.36627-6-stefanha@redhat.com>
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
References: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The difference between ->handle_output() and ->handle_aio_output() was
that ->handle_aio_output() returned a bool return value indicating
progress. This was needed by the old polling API but now that the bool
return value is gone, the two functions can be unified.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/virtio.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index c042be3935..a97a406d3c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -125,7 +125,6 @@ struct VirtQueue
 
     uint16_t vector;
     VirtIOHandleOutput handle_output;
-    VirtIOHandleOutput handle_aio_output;
     VirtIODevice *vdev;
     EventNotifier guest_notifier;
     EventNotifier host_notifier;
@@ -2300,20 +2299,6 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
     }
 }
 
-static void virtio_queue_notify_aio_vq(VirtQueue *vq)
-{
-    if (vq->vring.desc && vq->handle_aio_output) {
-        VirtIODevice *vdev = vq->vdev;
-
-        trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
-        vq->handle_aio_output(vdev, vq);
-
-        if (unlikely(vdev->start_on_kick)) {
-            virtio_set_started(vdev, true);
-        }
-    }
-}
-
 static void virtio_queue_notify_vq(VirtQueue *vq)
 {
     if (vq->vring.desc && vq->handle_output) {
@@ -2392,7 +2377,6 @@ VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
     vdev->vq[i].vring.num_default = queue_size;
     vdev->vq[i].vring.align = VIRTIO_PCI_VRING_ALIGN;
     vdev->vq[i].handle_output = handle_output;
-    vdev->vq[i].handle_aio_output = NULL;
     vdev->vq[i].used_elems = g_malloc0(sizeof(VirtQueueElement) *
                                        queue_size);
 
@@ -2404,7 +2388,6 @@ void virtio_delete_queue(VirtQueue *vq)
     vq->vring.num = 0;
     vq->vring.num_default = 0;
     vq->handle_output = NULL;
-    vq->handle_aio_output = NULL;
     g_free(vq->used_elems);
     vq->used_elems = NULL;
     virtio_virtqueue_reset_region_cache(vq);
@@ -3509,14 +3492,6 @@ EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
     return &vq->guest_notifier;
 }
 
-static void virtio_queue_host_notifier_aio_read(EventNotifier *n)
-{
-    VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
-    if (event_notifier_test_and_clear(n)) {
-        virtio_queue_notify_aio_vq(vq);
-    }
-}
-
 static void virtio_queue_host_notifier_aio_poll_begin(EventNotifier *n)
 {
     VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
@@ -3536,7 +3511,7 @@ static void virtio_queue_host_notifier_aio_poll_ready(EventNotifier *n)
 {
     VirtQueue *vq = container_of(n, VirtQueue, host_notifier);
 
-    virtio_queue_notify_aio_vq(vq);
+    virtio_queue_notify_vq(vq);
 }
 
 static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
@@ -3551,9 +3526,8 @@ void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
         VirtIOHandleOutput handle_output)
 {
     if (handle_output) {
-        vq->handle_aio_output = handle_output;
         aio_set_event_notifier(ctx, &vq->host_notifier, true,
-                               virtio_queue_host_notifier_aio_read,
+                               virtio_queue_host_notifier_read,
                                virtio_queue_host_notifier_aio_poll,
                                virtio_queue_host_notifier_aio_poll_ready);
         aio_set_event_notifier_poll(ctx, &vq->host_notifier,
@@ -3563,8 +3537,7 @@ void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
         aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
         /* Test and clear notifier before after disabling event,
          * in case poll callback didn't have time to run. */
-        virtio_queue_host_notifier_aio_read(&vq->host_notifier);
-        vq->handle_aio_output = NULL;
+        virtio_queue_host_notifier_read(&vq->host_notifier);
     }
 }
 
-- 
2.33.1


