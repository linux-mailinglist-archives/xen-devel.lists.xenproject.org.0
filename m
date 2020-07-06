Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C33215849
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 15:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsR8r-00037l-Cg; Mon, 06 Jul 2020 13:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MnCI=AR=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jsR8q-00036i-5w
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 13:26:40 +0000
X-Inumbo-ID: 4ec70d86-bf8c-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ec70d86-bf8c-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 13:26:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so39340130wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=am5VN7/n2uE761M3Be1VEooh2n0rBobtAPOGmP3qI4M=;
 b=PlGM7K2N9i/6GjPrNncv7DxyXCLNbt7NBGOom7aipSBKKp5prlHJhp+HFPsFuT4+is
 xseCSUB/jgvFhr3ULyxOwZdS9u0bk3Wwu9+YTHByX2wlHB71sQivtYCnoRIvFt2KY3uf
 fN4I4vvRh1d8nRqWcB8UklaPnOBI/51LHmUjaSDGrHwDIlgzALaxwhtH31OD6oSKnhZD
 r0Xi5YaZiwHwhZTwvQu2XwsVQ7cjbKYhMwVJrzc9WJii2XY3MFJNKMfCBYF/noAuJjgo
 T8mULoejBWDQVOgUE6fIPARLJ+vYQMu6ou6bP2zwbFHxoiRiXgo3x3KzgTiRV19hr3QV
 3Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=am5VN7/n2uE761M3Be1VEooh2n0rBobtAPOGmP3qI4M=;
 b=szhSuiOwhImdXWjpaKugBgwse1x9GMYGEk4ZOrEiFyZUN7xpdSlbI+wUEyzMqSyFjD
 aVmLNDXDE99vIA0F7BEnprqzKBJ5em77XOGwZ1Ef9FcdbqzLp6cwg4pwKOSx0ddrVUP5
 6YiExWQKS9qzuAmlhqMffotK1iTtUi4Ns1v5LHcBgw2/KHGCgvxoG53h3l+PdXn0xtB/
 b5aLWq28NmWNIUTlegH9IN35VnnuDLR8l9qxJB/PKLDse6ZU1Du8tns/IariHXYl0Qg8
 2K7j/OQDIbt4NuVe1NC+2boRtAFnPtjDL9eLX4naRj3lFmQrUaSQpB1M+GmF7hMYQVM5
 Li6A==
X-Gm-Message-State: AOAM532iwGo515bzDCPkRdXZhyAN6vJBX4JBLRp/TVs6YE5kDfc+FCuR
 tRocxKTF8m5ef61xSNfif5A=
X-Google-Smtp-Source: ABdhPJx9IhLPFnhwHRB01b+AXuniNDNUxthdSjEywHNwuq58/NRF/JoFZuUsEzKmhlDAFVaeOqBIOw==
X-Received: by 2002:a7b:c0c9:: with SMTP id s9mr46471167wmh.166.1594041992205; 
 Mon, 06 Jul 2020 06:26:32 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w2sm24447004wrs.77.2020.07.06.06.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 06:26:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] block/block-backend: Let blk_attach_dev() provide
 helpful error
Date: Mon,  6 Jul 2020 15:26:26 +0200
Message-Id: <20200706132626.22133-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200706132626.22133-1-f4bug@amsat.org>
References: <20200706132626.22133-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Let blk_attach_dev() take an Error* object to return helpful
information. Adapt the callers.

  $ qemu-system-arm -M n800
  qemu-system-arm: sd_init failed: cannot attach blk 'sd0' to device 'sd-card' because it is already attached by device 'omap2-mmc'
  Drive 'sd0' is already in use because it has been automatically connected to another device (did you need 'if=none' in the drive options?)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: I'm not sure the error API is correctly used in
     set_drive_helper().

 include/sysemu/block-backend.h   |  2 +-
 block/block-backend.c            | 11 ++++++++++-
 hw/block/fdc.c                   |  4 +---
 hw/block/swim.c                  |  4 +---
 hw/block/xen-block.c             |  5 +++--
 hw/core/qdev-properties-system.c | 17 ++++++++++-------
 hw/ide/qdev.c                    |  4 +---
 hw/scsi/scsi-disk.c              |  4 +---
 8 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 8203d7f6f9..118fbad0b4 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -113,7 +113,7 @@ BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk);
 void blk_iostatus_disable(BlockBackend *blk);
 void blk_iostatus_reset(BlockBackend *blk);
 void blk_iostatus_set_err(BlockBackend *blk, int error);
-int blk_attach_dev(BlockBackend *blk, DeviceState *dev);
+int blk_attach_dev(BlockBackend *blk, DeviceState *dev, Error **errp);
 void blk_detach_dev(BlockBackend *blk, DeviceState *dev);
 DeviceState *blk_get_attached_dev(BlockBackend *blk);
 char *blk_get_attached_dev_id(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index 23caa45e6a..29480a121d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -882,12 +882,21 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
 
 /*
  * Attach device model @dev to @blk.
+ *
+ * @blk: Block backend
+ * @dev: Device to attach the block backend to
+ * @errp: pointer to NULL initialized error object
+ *
  * Return 0 on success, -EBUSY when a device model is attached already.
  */
-int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
+int blk_attach_dev(BlockBackend *blk, DeviceState *dev, Error **errp)
 {
     trace_blk_attach_dev(blk_name(blk), object_get_typename(OBJECT(dev)));
     if (blk->dev) {
+        error_setg(errp, "cannot attach blk '%s' to device '%s' because it is "
+                         "already attached by device '%s'",
+                   blk_name(blk), object_get_typename(OBJECT(dev)),
+                   object_get_typename(OBJECT(blk->dev)));
         return -EBUSY;
     }
 
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 3425d56e2a..5765b5d4f2 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -519,7 +519,6 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
     FloppyBus *bus = FLOPPY_BUS(qdev->parent_bus);
     FDrive *drive;
     bool read_only;
-    int ret;
 
     if (dev->unit == -1) {
         for (dev->unit = 0; dev->unit < MAX_FD; dev->unit++) {
@@ -545,8 +544,7 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
     if (!dev->conf.blk) {
         /* Anonymous BlockBackend for an empty drive */
         dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
-        ret = blk_attach_dev(dev->conf.blk, qdev);
-        assert(ret == 0);
+        blk_attach_dev(dev->conf.blk, qdev, &error_abort);
 
         /* Don't take write permissions on an empty drive to allow attaching a
          * read-only node later */
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 74f56e8f46..2f1ecd0bb2 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -159,7 +159,6 @@ static void swim_drive_realize(DeviceState *qdev, Error **errp)
     SWIMDrive *dev = SWIM_DRIVE(qdev);
     SWIMBus *bus = SWIM_BUS(qdev->parent_bus);
     FDrive *drive;
-    int ret;
 
     if (dev->unit == -1) {
         for (dev->unit = 0; dev->unit < SWIM_MAX_FD; dev->unit++) {
@@ -185,8 +184,7 @@ static void swim_drive_realize(DeviceState *qdev, Error **errp)
     if (!dev->conf.blk) {
         /* Anonymous BlockBackend for an empty drive */
         dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
-        ret = blk_attach_dev(dev->conf.blk, qdev);
-        assert(ret == 0);
+        blk_attach_dev(dev->conf.blk, qdev, &error_abort);
     }
 
     if (!blkconf_blocksizes(&dev->conf, errp)) {
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 1b7bc5de08..81650208dc 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -616,14 +616,15 @@ static void xen_cdrom_realize(XenBlockDevice *blockdev, Error **errp)
     blockdev->device_type = "cdrom";
 
     if (!conf->blk) {
+        Error *local_err = NULL;
         int rc;
 
         /* Set up an empty drive */
         conf->blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
 
-        rc = blk_attach_dev(conf->blk, DEVICE(blockdev));
+        rc = blk_attach_dev(conf->blk, DEVICE(blockdev), &local_err);
         if (!rc) {
-            error_setg_errno(errp, -rc, "failed to create drive");
+            error_propagate_prepend(errp, local_err, "failed to create drive");
             return;
         }
     }
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 38b0c9f09b..26dc9f1779 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -139,18 +139,21 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
                    object_get_typename(OBJECT(dev)), prop->name, str);
         goto fail;
     }
-    if (blk_attach_dev(blk, dev) < 0) {
+    if (blk_attach_dev(blk, dev, &local_err) < 0) {
         DriveInfo *dinfo = blk_legacy_dinfo(blk);
 
         if (dinfo && dinfo->type != IF_NONE) {
-            error_setg(errp, "Drive '%s' is already in use because "
-                       "it has been automatically connected to another "
-                       "device (did you need 'if=none' in the drive options?)",
-                       str);
+            error_append_hint(&local_err,
+                              "Drive '%s' is already in use because it has "
+                              "been automatically connected to another device "
+                              "(did you need 'if=none' in the drive options?)"
+                              "\n", str);
         } else {
-            error_setg(errp, "Drive '%s' is already in use by another device",
-                       str);
+            error_append_hint(&local_err,
+                              "Drive '%s' is already in use by another device",
+                              str);
         }
+        error_propagate(errp, local_err);
         goto fail;
     }
 
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index f68fbee93d..b36499c9ee 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -165,7 +165,6 @@ static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **errp)
 {
     IDEBus *bus = DO_UPCAST(IDEBus, qbus, dev->qdev.parent_bus);
     IDEState *s = bus->ifs + dev->unit;
-    int ret;
 
     if (!dev->conf.blk) {
         if (kind != IDE_CD) {
@@ -174,8 +173,7 @@ static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **errp)
         } else {
             /* Anonymous BlockBackend for an empty drive */
             dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
-            ret = blk_attach_dev(dev->conf.blk, &dev->qdev);
-            assert(ret == 0);
+            blk_attach_dev(dev->conf.blk, &dev->qdev, &error_abort);
         }
     }
 
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 8ce68a9dd6..92350642c7 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2451,14 +2451,12 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
     AioContext *ctx;
-    int ret;
 
     if (!dev->conf.blk) {
         /* Anonymous BlockBackend for an empty drive. As we put it into
          * dev->conf, qdev takes care of detaching on unplug. */
         dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
-        ret = blk_attach_dev(dev->conf.blk, &dev->qdev);
-        assert(ret == 0);
+        blk_attach_dev(dev->conf.blk, &dev->qdev, &error_abort);
     }
 
     ctx = blk_get_aio_context(dev->conf.blk);
-- 
2.21.3


