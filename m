Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7956F75AF
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 22:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530110.825489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7W-0005Cw-C5; Thu, 04 May 2023 20:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530110.825489; Thu, 04 May 2023 20:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf7W-0005As-6v; Thu, 04 May 2023 20:00:06 +0000
Received: by outflank-mailman (input) for mailman id 530110;
 Thu, 04 May 2023 20:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1y-0003xx-0Y
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:54:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 752ae21e-eab5-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:54:20 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-rnzRckGWN_uYxyN68Qx0aw-1; Thu, 04 May 2023 15:54:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A63E5101A531;
 Thu,  4 May 2023 19:54:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E92B763F3E;
 Thu,  4 May 2023 19:54:12 +0000 (UTC)
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
X-Inumbo-ID: 752ae21e-eab5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94EbW6UEPYMLwV9zB8HOwndWfCZlP2kutpuX+h7WMqo=;
	b=TaCAoYoEpnhHFw4ZKWwTsG7GbZ0YvaDn5NTWcZ/jZDa3c4KlIcULOT36dZiExKMMTVnE7o
	UBao6Axld3t7VTAfWW3isW+Ye8ny5/OtoWfP+3Z2s7drTiyrp8aidxwNY9jwqu3QjltNcY
	p8HKKe6OkyZ4msncWm5i5djPhMndmko=
X-MC-Unique: rnzRckGWN_uYxyN68Qx0aw-1
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
Subject: [PATCH v5 17/21] virtio: make it possible to detach host notifier from any thread
Date: Thu,  4 May 2023 15:53:23 -0400
Message-Id: <20230504195327.695107-18-stefanha@redhat.com>
In-Reply-To: <20230504195327.695107-1-stefanha@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

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
index a6202997ee..27eafa6c92 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -287,8 +287,10 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
 
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
2.40.1


