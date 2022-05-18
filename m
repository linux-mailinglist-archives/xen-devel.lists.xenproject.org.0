Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10952BB5B
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332115.555761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJR8-0001n7-8n; Wed, 18 May 2022 13:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332115.555761; Wed, 18 May 2022 13:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJR8-0001kf-4w; Wed, 18 May 2022 13:09:58 +0000
Received: by outflank-mailman (input) for mailman id 332115;
 Wed, 18 May 2022 13:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAy6=V2=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1nrJR6-0001YW-Fr
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:09:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc6a0f0e-d6ab-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 15:09:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-ngHoSp9hM-2D9F5m28W-Cg-1; Wed, 18 May 2022 09:09:48 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3041A294EDC0;
 Wed, 18 May 2022 13:09:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 596B4492CA2;
 Wed, 18 May 2022 13:09:46 +0000 (UTC)
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
X-Inumbo-ID: cc6a0f0e-d6ab-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652879394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K801eJCmU2pj2pPB6zBLBAL3MRfzoEeZW44TvBJ7tvo=;
	b=adCb/tEzf8MiMzregr0D3rsk9Rko1ac6qb26i7NqMasNE5tW5Z3nEZ/Wh+ifyMkw+UPFgj
	bWp8AfoI4ZUb7UFGyPTeh2YtTxtj+mNOfumPrGJHSvhyZMc+1aDuNG/r+q2HqixLH0C+wN
	v09HtMOqM6QnVo+9IvOgrQcyfsoaJWc=
X-MC-Unique: ngHoSp9hM-2D9F5m28W-Cg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Anthony Perard <anthony.perard@citrix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Xie Yongji <xieyongji@bytedance.com>
Subject: [PATCH] block: get rid of blk->guest_block_size
Date: Wed, 18 May 2022 14:09:45 +0100
Message-Id: <20220518130945.2657905-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

Commit 1b7fd729559c ("block: rename buffer_alignment to
guest_block_size") noted:

  At this point, the field is set by the device emulation, but completely
  ignored by the block layer.

The last time the value of buffer_alignment/guest_block_size was
actually used was before commit 339064d50639 ("block: Don't use guest
sector size for qemu_blockalign()").

This value has not been used since 2013. Get rid of it.

Cc: Xie Yongji <xieyongji@bytedance.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/sysemu/block-backend-io.h    |  1 -
 block/block-backend.c                | 10 ----------
 block/export/vhost-user-blk-server.c |  1 -
 hw/block/virtio-blk.c                |  1 -
 hw/block/xen-block.c                 |  1 -
 hw/ide/core.c                        |  1 -
 hw/scsi/scsi-disk.c                  |  1 -
 hw/scsi/scsi-generic.c               |  1 -
 8 files changed, 17 deletions(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6517c39295..ccef514023 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -72,7 +72,6 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
 void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
-void blk_set_guest_block_size(BlockBackend *blk, int align);
 
 void blk_io_plug(BlockBackend *blk);
 void blk_io_unplug(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..d4abdf8faa 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -56,9 +56,6 @@ struct BlockBackend {
     const BlockDevOps *dev_ops;
     void *dev_opaque;
 
-    /* the block size for which the guest device expects atomicity */
-    int guest_block_size;
-
     /* If the BDS tree is removed, some of its options are stored here (which
      * can be used to restore those options in the new BDS on insert) */
     BlockBackendRootState root_state;
@@ -998,7 +995,6 @@ void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
     blk->dev = NULL;
     blk->dev_ops = NULL;
     blk->dev_opaque = NULL;
-    blk->guest_block_size = 512;
     blk_set_perm(blk, 0, BLK_PERM_ALL, &error_abort);
     blk_unref(blk);
 }
@@ -2100,12 +2096,6 @@ int blk_get_max_iov(BlockBackend *blk)
     return blk->root->bs->bl.max_iov;
 }
 
-void blk_set_guest_block_size(BlockBackend *blk, int align)
-{
-    IO_CODE();
-    blk->guest_block_size = align;
-}
-
 void *blk_try_blockalign(BlockBackend *blk, size_t size)
 {
     IO_CODE();
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index a129204c44..b2e458ade3 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -495,7 +495,6 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         return -EINVAL;
     }
     vexp->blk_size = logical_block_size;
-    blk_set_guest_block_size(exp->blk, logical_block_size);
 
     if (vu_opts->has_num_queues) {
         num_queues = vu_opts->num_queues;
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index cd804795c6..e9ba752f6b 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1228,7 +1228,6 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
     blk_set_dev_ops(s->blk, &virtio_block_ops, s);
-    blk_set_guest_block_size(s->blk, s->conf.conf.logical_block_size);
 
     blk_iostatus_enable(s->blk);
 
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 674953f1ad..345b284d70 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -243,7 +243,6 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     }
 
     blk_set_dev_ops(blk, &xen_block_dev_ops, blockdev);
-    blk_set_guest_block_size(blk, conf->logical_block_size);
 
     if (conf->discard_granularity == -1) {
         conf->discard_granularity = conf->physical_block_size;
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 3a5afff5d7..f7ec68513f 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2544,7 +2544,6 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
     s->smart_selftest_count = 0;
     if (kind == IDE_CD) {
         blk_set_dev_ops(blk, &ide_cd_block_ops, s);
-        blk_set_guest_block_size(blk, 2048);
     } else {
         if (!blk_is_inserted(s->blk)) {
             error_setg(errp, "Device needs media, but drive is empty");
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 072686ed58..91acb5c0ce 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2419,7 +2419,6 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
     } else {
         blk_set_dev_ops(s->qdev.conf.blk, &scsi_disk_block_ops, s);
     }
-    blk_set_guest_block_size(s->qdev.conf.blk, s->qdev.blocksize);
 
     blk_iostatus_enable(s->qdev.conf.blk);
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 0ab00ef85c..ada24d7486 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -321,7 +321,6 @@ static void scsi_read_complete(void * opaque, int ret)
         s->blocksize = ldl_be_p(&r->buf[8]);
         s->max_lba = ldq_be_p(&r->buf[0]);
     }
-    blk_set_guest_block_size(s->conf.blk, s->blocksize);
 
     /*
      * Patch MODE SENSE device specific parameters if the BDS is opened
-- 
2.36.1


