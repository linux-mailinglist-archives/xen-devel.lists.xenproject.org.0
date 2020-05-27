Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C175C1E42BC
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 14:53:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdvXj-0001Sn-2O; Wed, 27 May 2020 12:52:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVnz=7J=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jdvR5-0000fi-Ug
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 12:45:31 +0000
X-Inumbo-ID: f1a58490-a017-11ea-a740-12813bfff9fa
Received: from forwardcorp1o.mail.yandex.net (unknown [95.108.205.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1a58490-a017-11ea-a740-12813bfff9fa;
 Wed, 27 May 2020 12:45:29 +0000 (UTC)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 760832E14EF;
 Wed, 27 May 2020 15:45:28 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 EY5t1VtL3U-jMICaEGx; Wed, 27 May 2020 15:45:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590583528; bh=7R0FdQjVPrwj0NU+a9BW8mDIxABy3m6MTEZ4IgcH4AU=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=XnEB0m+xvqUPsgGEBKNnCHr3Pj4SBPUXBm6pEXDiyjEO+oDAb+Q5Wyj/VuYKUTIxm
 rkNBfvVM0iGMkCmzIEghsxLBVLv4pC0zURwZEQkKUa2InvSPmPgCzc2wSrm/yvJ2q9
 Vvv2sUJPBNPMINIPTzIK7+eUl9i3m9u7p1Rl2zr0=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:12])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bzO5qPtczO-jMWOe2sb; Wed, 27 May 2020 15:45:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/5] block: consolidate blocksize properties consistency
 checks
Date: Wed, 27 May 2020 15:45:08 +0300
Message-Id: <20200527124511.986099-3-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527124511.986099-1-rvkagan@yandex-team.ru>
References: <20200527124511.986099-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 May 2020 12:52:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Several block device properties related to blocksize configuration must
be in certain relationship WRT each other: physical block must be no
smaller than logical block; min_io_size, opt_io_size, and
discard_granularity must be a multiple of a logical block.

To ensure these requirements are met, add corresponding consistency
checks to blkconf_blocksizes, adjusting its signature to communicate
possible error to the caller.  Also remove the now redundant consistency
checks from the specific devices.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
v5 -> v6:
- fix forgotten xen-block and swim

v4 -> v5:
- fix/reword error messages [Philippe, Kevin]
- do early return on failed consistency check [Philippe]
- use QEMU_IS_ALIGNED instead of open coding [Philippe]

 include/hw/block/block.h   |  2 +-
 hw/block/block.c           | 30 +++++++++++++++++++++++++++++-
 hw/block/fdc.c             |  5 ++++-
 hw/block/nvme.c            |  5 ++++-
 hw/block/swim.c            |  5 ++++-
 hw/block/virtio-blk.c      |  7 +------
 hw/block/xen-block.c       |  6 +-----
 hw/ide/qdev.c              |  5 ++++-
 hw/scsi/scsi-disk.c        | 12 +++++-------
 hw/usb/dev-storage.c       |  5 ++++-
 tests/qemu-iotests/172.out |  2 +-
 11 files changed, 58 insertions(+), 26 deletions(-)

diff --git a/include/hw/block/block.h b/include/hw/block/block.h
index d7246f3862..784953a237 100644
--- a/include/hw/block/block.h
+++ b/include/hw/block/block.h
@@ -87,7 +87,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
 bool blkconf_geometry(BlockConf *conf, int *trans,
                       unsigned cyls_max, unsigned heads_max, unsigned secs_max,
                       Error **errp);
-void blkconf_blocksizes(BlockConf *conf);
+bool blkconf_blocksizes(BlockConf *conf, Error **errp);
 bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
                                    bool resizable, Error **errp);
 
diff --git a/hw/block/block.c b/hw/block/block.c
index bf56c7612b..b22207c921 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -61,7 +61,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
     return true;
 }
 
-void blkconf_blocksizes(BlockConf *conf)
+bool blkconf_blocksizes(BlockConf *conf, Error **errp)
 {
     BlockBackend *blk = conf->blk;
     BlockSizes blocksizes;
@@ -83,6 +83,34 @@ void blkconf_blocksizes(BlockConf *conf)
             conf->logical_block_size = BDRV_SECTOR_SIZE;
         }
     }
+
+    if (conf->logical_block_size > conf->physical_block_size) {
+        error_setg(errp,
+                   "logical_block_size > physical_block_size not supported");
+        return false;
+    }
+
+    if (!QEMU_IS_ALIGNED(conf->min_io_size, conf->logical_block_size)) {
+        error_setg(errp,
+                   "min_io_size must be a multiple of logical_block_size");
+        return false;
+    }
+
+    if (!QEMU_IS_ALIGNED(conf->opt_io_size, conf->logical_block_size)) {
+        error_setg(errp,
+                   "opt_io_size must be a multiple of logical_block_size");
+        return false;
+    }
+
+    if (conf->discard_granularity != -1 &&
+        !QEMU_IS_ALIGNED(conf->discard_granularity,
+                         conf->logical_block_size)) {
+        error_setg(errp, "discard_granularity must be "
+                   "a multiple of logical_block_size");
+        return false;
+    }
+
+    return true;
 }
 
 bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index c5fb9d6ece..8eda572ef4 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -554,7 +554,10 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
         read_only = !blk_bs(dev->conf.blk) || blk_is_read_only(dev->conf.blk);
     }
 
-    blkconf_blocksizes(&dev->conf);
+    if (!blkconf_blocksizes(&dev->conf, errp)) {
+        return;
+    }
+
     if (dev->conf.logical_block_size != 512 ||
         dev->conf.physical_block_size != 512)
     {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2f3100e56c..672650e162 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1390,7 +1390,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         host_memory_backend_set_mapped(n->pmrdev, true);
     }
 
-    blkconf_blocksizes(&n->conf);
+    if (!blkconf_blocksizes(&n->conf, errp)) {
+        return;
+    }
+
     if (!blkconf_apply_backend_options(&n->conf, blk_is_read_only(n->conf.blk),
                                        false, errp)) {
         return;
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 8f124782f4..74f56e8f46 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -189,7 +189,10 @@ static void swim_drive_realize(DeviceState *qdev, Error **errp)
         assert(ret == 0);
     }
 
-    blkconf_blocksizes(&dev->conf);
+    if (!blkconf_blocksizes(&dev->conf, errp)) {
+        return;
+    }
+
     if (dev->conf.logical_block_size != 512 ||
         dev->conf.physical_block_size != 512)
     {
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 413083e62f..4ffdb130be 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1162,12 +1162,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    blkconf_blocksizes(&conf->conf);
-
-    if (conf->conf.logical_block_size >
-        conf->conf.physical_block_size) {
-        error_setg(errp,
-                   "logical_block_size > physical_block_size not supported");
+    if (!blkconf_blocksizes(&conf->conf, errp)) {
         return;
     }
 
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 570489d6d9..e17fec50e1 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -239,11 +239,7 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
         return;
     }
 
-    blkconf_blocksizes(conf);
-
-    if (conf->logical_block_size > conf->physical_block_size) {
-        error_setg(
-            errp, "logical_block_size > physical_block_size not supported");
+    if (!blkconf_blocksizes(conf, errp)) {
         return;
     }
 
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 06b11583f5..b4821b2403 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -187,7 +187,10 @@ static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **errp)
         return;
     }
 
-    blkconf_blocksizes(&dev->conf);
+    if (!blkconf_blocksizes(&dev->conf, errp)) {
+        return;
+    }
+
     if (dev->conf.logical_block_size != 512) {
         error_setg(errp, "logical_block_size must be 512 for IDE");
         return;
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 387503e11b..8ce68a9dd6 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2346,12 +2346,7 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
         return;
     }
 
-    blkconf_blocksizes(&s->qdev.conf);
-
-    if (s->qdev.conf.logical_block_size >
-        s->qdev.conf.physical_block_size) {
-        error_setg(errp,
-                   "logical_block_size > physical_block_size not supported");
+    if (!blkconf_blocksizes(&s->qdev.conf, errp)) {
         return;
     }
 
@@ -2436,7 +2431,9 @@ static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
     if (s->qdev.conf.blk) {
         ctx = blk_get_aio_context(s->qdev.conf.blk);
         aio_context_acquire(ctx);
-        blkconf_blocksizes(&s->qdev.conf);
+        if (!blkconf_blocksizes(&s->qdev.conf, errp)) {
+            goto out;
+        }
     }
     s->qdev.blocksize = s->qdev.conf.logical_block_size;
     s->qdev.type = TYPE_DISK;
@@ -2444,6 +2441,7 @@ static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
         s->product = g_strdup("QEMU HARDDISK");
     }
     scsi_realize(&s->qdev, errp);
+out:
     if (ctx) {
         aio_context_release(ctx);
     }
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 4eba47538d..de461f37bd 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -599,7 +599,10 @@ static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
         return;
     }
 
-    blkconf_blocksizes(&s->conf);
+    if (!blkconf_blocksizes(&s->conf, errp)) {
+        return;
+    }
+
     if (!blkconf_apply_backend_options(&s->conf, blk_is_read_only(blk), true,
                                        errp)) {
         return;
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 7abbe82427..59cc70aebb 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -1204,7 +1204,7 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
                 drive-type = "144"
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical_block_size=4096
-QEMU_PROG: -device floppy,drive=none0,logical_block_size=4096: Physical and logical block size must be 512 for floppy
+QEMU_PROG: -device floppy,drive=none0,logical_block_size=4096: logical_block_size > physical_block_size not supported
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physical_block_size=1024
 QEMU_PROG: -device floppy,drive=none0,physical_block_size=1024: Physical and logical block size must be 512 for floppy
-- 
2.26.2


