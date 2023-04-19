Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2CC6E8081
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 19:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523675.814014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBlm-0000aO-RR; Wed, 19 Apr 2023 17:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523675.814014; Wed, 19 Apr 2023 17:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBlm-0000Si-GR; Wed, 19 Apr 2023 17:39:02 +0000
Received: by outflank-mailman (input) for mailman id 523675;
 Wed, 19 Apr 2023 17:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu/K=AK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppBcW-0001ia-0d
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 17:29:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb7d62a9-ded7-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 19:29:27 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-UORK3zzVOxmLu7977uaTMQ-1; Wed, 19 Apr 2023 13:29:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59D9D1C189A4;
 Wed, 19 Apr 2023 17:29:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8045B40C2064;
 Wed, 19 Apr 2023 17:29:20 +0000 (UTC)
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
X-Inumbo-ID: bb7d62a9-ded7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681925366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qs0Wu6hxc7j58DwPPRdDhx+qIxo2MCSBXMmfJ14jr7A=;
	b=P81Hbad2MkrxYTfi71uOxxkGaggxm+9W6bTi5GM2BTkPDcPFnK7pF6YXAlQOQkOq/8nV1O
	hWV0a02+t5ibJI9zvKkiL8RyS6ToCmoM4vuje/hz+FkZktCEZmssTifAfPzGl6DH0z5Wb/
	GjxSdH06n467P6qYOIzjoaC5c7SG0UE=
X-MC-Unique: UORK3zzVOxmLu7977uaTMQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Fam Zheng <fam@euphon.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Lieven <pl@kamp.de>,
	eesposit@redhat.com,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 16/16] virtio: make it possible to detach host notifier from any thread
Date: Wed, 19 Apr 2023 13:28:17 -0400
Message-Id: <20230419172817.272758-17-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

virtio_queue_aio_detach_host_notifier() does two things:
1. It removes the fd handler from the event loop.
2. It processes the virtqueue one last time.

The first step can be peformed by any thread and without taking the
AioContext lock.

The second step may need the AioContext lock (depending on the device
implementation) and runs in the thread where request processing takes
place. virtio-blk and virtio-scsi therefore call
virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
AioContext

Scheduling a BH is undesirable for .drained_begin() functions. The next
patch will introduce a .drained_begin() function that needs to call
virtio_queue_aio_detach_host_notifier().

Move the virtqueue processing out to the callers of
virtio_queue_aio_detach_host_notifier() so that the function can be
called from any thread. This is in preparation for the next patch.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 2 ++
 hw/scsi/virtio-scsi-dataplane.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index b28d81737e..bd7cc6e76b 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -286,8 +286,10 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
 
     for (i = 0; i < s->conf->num_queues; i++) {
         VirtQueue *vq = virtio_get_queue(s->vdev, i);
+        EventNotifier *host_notifier = virtio_queue_get_host_notifier(vq);
 
         virtio_queue_aio_detach_host_notifier(vq, s->ctx);
+        virtio_queue_host_notifier_read(host_notifier);
     }
 }
 
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 20bb91766e..81643445ed 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -71,12 +71,21 @@ static void virtio_scsi_dataplane_stop_bh(void *opaque)
 {
     VirtIOSCSI *s = opaque;
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
+    EventNotifier *host_notifier;
     int i;
 
     virtio_queue_aio_detach_host_notifier(vs->ctrl_vq, s->ctx);
+    host_notifier = virtio_queue_get_host_notifier(vs->ctrl_vq);
+    virtio_queue_host_notifier_read(host_notifier);
+
     virtio_queue_aio_detach_host_notifier(vs->event_vq, s->ctx);
+    host_notifier = virtio_queue_get_host_notifier(vs->event_vq);
+    virtio_queue_host_notifier_read(host_notifier);
+
     for (i = 0; i < vs->conf.num_queues; i++) {
         virtio_queue_aio_detach_host_notifier(vs->cmd_vqs[i], s->ctx);
+        host_notifier = virtio_queue_get_host_notifier(vs->cmd_vqs[i]);
+        virtio_queue_host_notifier_read(host_notifier);
     }
 }
 
-- 
2.39.2


