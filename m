Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF646E8053
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 19:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523643.813912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbf-0002Wg-8P; Wed, 19 Apr 2023 17:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523643.813912; Wed, 19 Apr 2023 17:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppBbf-0002TJ-46; Wed, 19 Apr 2023 17:28:35 +0000
Received: by outflank-mailman (input) for mailman id 523643;
 Wed, 19 Apr 2023 17:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu/K=AK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppBbd-0001ia-Br
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 17:28:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a72062f-ded7-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 19:28:31 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-r-TkgJWjMKico9NCxDBaVg-1; Wed, 19 Apr 2023 13:28:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E9633801F59;
 Wed, 19 Apr 2023 17:28:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CB2D40C2064;
 Wed, 19 Apr 2023 17:28:27 +0000 (UTC)
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
X-Inumbo-ID: 9a72062f-ded7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681925310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mEUiDYhTGG6/grGbCAPXx5jwh+m436EKZLWWN7O6BQM=;
	b=BhrFeIxCW9QgSBsPhxIzmYgXwF4ynexsTTCtwuv8ZSeFV0jGMBFJ2MNHwYtUqeyOh5Dsr1
	3JQOJPSUC7tS23brp+NgPvi2qjrVjxWms1DAp9fKKGXbHNAWhbRWL4H5s2G3R627eLtDZM
	94o726pLFl8s0+jYx56nZBr5tnBVlh8=
X-MC-Unique: r-TkgJWjMKico9NCxDBaVg-1
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
	David Woodhouse <dwmw2@infradead.org>,
	Zhengui Li <lizhengui@huawei.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [PATCH v2 03/16] virtio-scsi: stop using aio_disable_external() during unplug
Date: Wed, 19 Apr 2023 13:28:04 -0400
Message-Id: <20230419172817.272758-4-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

This patch is part of an effort to remove the aio_disable_external()
API because it does not fit in a multi-queue block layer world where
many AioContexts may be submitting requests to the same disk.

The SCSI emulation code is already in good shape to stop using
aio_disable_external(). It was only used by commit 9c5aad84da1c
("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi
disk") to ensure that virtio_scsi_hotunplug() works while the guest
driver is submitting I/O.

Ensure virtio_scsi_hotunplug() is safe as follows:

1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
   device_set_realized() calls qatomic_set(&dev->realized, false) so
   that future scsi_device_get() calls return NULL because they exclude
   SCSIDevices with realized=false.

   That means virtio-scsi will reject new I/O requests to this
   SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
   virtio_scsi_hotunplug() is still executing. We are protected against
   new requests!

2. Add a call to scsi_device_purge_requests() from scsi_unrealize() so
   that in-flight requests are cancelled synchronously. This ensures
   that no in-flight requests remain once qdev_simple_device_unplug_cb()
   returns.

Thanks to these two conditions we don't need aio_disable_external()
anymore.

Cc: Zhengui Li <lizhengui@huawei.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/scsi-disk.c   | 1 +
 hw/scsi/virtio-scsi.c | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 97c9b1c8cd..e01bd84541 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2522,6 +2522,7 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
 
 static void scsi_unrealize(SCSIDevice *dev)
 {
+    scsi_device_purge_requests(dev, SENSE_CODE(RESET));
     del_boot_device_lchs(&dev->qdev, NULL);
 }
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 000961446c..a02f9233ec 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1061,11 +1061,8 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtIODevice *vdev = VIRTIO_DEVICE(hotplug_dev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     SCSIDevice *sd = SCSI_DEVICE(dev);
-    AioContext *ctx = s->ctx ?: qemu_get_aio_context();
 
-    aio_disable_external(ctx);
     qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
-    aio_enable_external(ctx);
 
     if (s->ctx) {
         virtio_scsi_acquire(s);
-- 
2.39.2


