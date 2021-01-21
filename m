Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CAB2FDF78
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 03:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71861.129039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Pqc-0000FY-OE; Thu, 21 Jan 2021 02:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71861.129039; Thu, 21 Jan 2021 02:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Pqc-0000FC-KX; Thu, 21 Jan 2021 02:37:22 +0000
Received: by outflank-mailman (input) for mailman id 71861;
 Thu, 21 Jan 2021 02:37:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fZR3=GY=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1l2Pqb-0000F7-IC
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 02:37:21 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 98fea4ce-4cbe-4294-a99e-d71fe66ba4e9;
 Thu, 21 Jan 2021 02:37:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-OmmbbNF5OmWTvn1XXuQuCw-1; Wed, 20 Jan 2021 21:37:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D68018030A3;
 Thu, 21 Jan 2021 02:37:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A085D764;
 Thu, 21 Jan 2021 02:37:02 +0000 (UTC)
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
X-Inumbo-ID: 98fea4ce-4cbe-4294-a99e-d71fe66ba4e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611196638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWsNbfno5eQmALjcQ0NugNktpINR/bP8vlBM0Vwjwe4=;
	b=i9aeznTA3v25zkraHXqGWlY1cda4vQQc0qYRjkRLlygXHUwPi0KxIOx5ViOcVd+4b0e5Xh
	wiDyMKijohNAQhrprsv+nW4/x6aZhfCb9cRSotGvbyH+cT0FsDGADQbWog/ujFWupFdDmU
	IX/Tycnbl0+UENXD4BIHVqJs2vWiS0g=
X-MC-Unique: OmmbbNF5OmWTvn1XXuQuCw-1
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Sergio Lopez <slp@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-block@nongnu.org (open list:virtio-blk),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PULL 03/13] block: Honor blk_set_aio_context() context requirements
Date: Wed, 20 Jan 2021 20:36:47 -0600
Message-Id: <20210121023657.1186241-4-eblake@redhat.com>
In-Reply-To: <20210121023657.1186241-1-eblake@redhat.com>
References: <20210121023657.1186241-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Sergio Lopez <slp@redhat.com>

The documentation for bdrv_set_aio_context_ignore() states this:

 * The caller must own the AioContext lock for the old AioContext of bs, but it
 * must not own the AioContext lock for new_context (unless new_context is the
 * same as the current context of bs).

As blk_set_aio_context() makes use of this function, this rule also
applies to it.

Fix all occurrences where this rule wasn't honored.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20201214170519.223781-2-slp@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 4 ++++
 hw/block/dataplane/xen-block.c  | 7 ++++++-
 hw/scsi/virtio-scsi.c           | 6 ++++--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 37499c556482..e9050c8987e7 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -172,6 +172,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     VirtIOBlockDataPlane *s = vblk->dataplane;
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vblk)));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    AioContext *old_context;
     unsigned i;
     unsigned nvqs = s->conf->num_queues;
     Error *local_err = NULL;
@@ -214,7 +215,10 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     vblk->dataplane_started = true;
     trace_virtio_blk_data_plane_start(s);

+    old_context = blk_get_aio_context(s->conf->conf.blk);
+    aio_context_acquire(old_context);
     r = blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
+    aio_context_release(old_context);
     if (r < 0) {
         error_report_err(local_err);
         goto fail_guest_notifiers;
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 71c337c7b7e7..3675f8deaf9d 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -725,6 +725,7 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
 {
     ERRP_GUARD();
     XenDevice *xendev = dataplane->xendev;
+    AioContext *old_context;
     unsigned int ring_size;
     unsigned int i;

@@ -808,10 +809,14 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
         goto stop;
     }

-    aio_context_acquire(dataplane->ctx);
+    old_context = blk_get_aio_context(dataplane->blk);
+    aio_context_acquire(old_context);
     /* If other users keep the BlockBackend in the iothread, that's ok */
     blk_set_aio_context(dataplane->blk, dataplane->ctx, NULL);
+    aio_context_release(old_context);
+
     /* Only reason for failure is a NULL channel */
+    aio_context_acquire(dataplane->ctx);
     xen_device_set_event_channel_context(xendev, dataplane->event_channel,
                                          dataplane->ctx, &error_abort);
     aio_context_release(dataplane->ctx);
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 9690bc63c860..99ff261cead1 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -849,15 +849,17 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtIODevice *vdev = VIRTIO_DEVICE(hotplug_dev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     SCSIDevice *sd = SCSI_DEVICE(dev);
+    AioContext *old_context;
     int ret;

     if (s->ctx && !s->dataplane_fenced) {
         if (blk_op_is_blocked(sd->conf.blk, BLOCK_OP_TYPE_DATAPLANE, errp)) {
             return;
         }
-        virtio_scsi_acquire(s);
+        old_context = blk_get_aio_context(sd->conf.blk);
+        aio_context_acquire(old_context);
         ret = blk_set_aio_context(sd->conf.blk, s->ctx, errp);
-        virtio_scsi_release(s);
+        aio_context_release(old_context);
         if (ret < 0) {
             return;
         }
-- 
2.30.0


