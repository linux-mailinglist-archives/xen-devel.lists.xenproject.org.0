Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674DB222267
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 14:37:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw38a-00017i-4V; Thu, 16 Jul 2020 12:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxFF=A3=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jw38Z-000173-27
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 12:37:19 +0000
X-Inumbo-ID: 12a88cd0-c761-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12a88cd0-c761-11ea-bb8b-bc764e2007e4;
 Thu, 16 Jul 2020 12:37:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z13so6899519wrw.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2020 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yt7eySGtavnjPzGN+i8j014hrBU1DwpMXeuXr5l5jTo=;
 b=GwJrWi7NzhlZA4yxH4OfDvTOmFPCV1YmqJH5FABJF0+CA65AsrRknug6fPfWlv83Qd
 GkI3GoROwQQP9LuFLuo2xdfVAEmPqS0thSSDl9K+vaJr5F1/sZPXuAPl0CB20fO0SFSP
 3b117ls+ZNIOevkLPFyAac3rN9DwA6g31571KA6tdQx2DCPu3wYuhFJfrf8Vny5liIV/
 yyjO4JRhTwcI4M5s7rYk0QOLELwhyggUNLk5uuPiilLonV1m60Lp08kmF4wkmYnaarQe
 Pr4BqRZ8V1+7DkIZUIec5c3kcSyfPOk+bUMv8WC9AC/9XwSpqnfIrH9R/hNhvJyu5Fzv
 D0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yt7eySGtavnjPzGN+i8j014hrBU1DwpMXeuXr5l5jTo=;
 b=IU3LOE7hORG/knbT8dE/cb2fSvNJQyPvdw4n7ilnitYY7iQfCk3WRNbsXXWosPLAIz
 NuWp5igJrXRFW2wMyK/VYkGqPn08D34uPr0y3OrW8rKrRZsII72xKX3cNsxpSNXCnvXx
 LeiGYXqfAZokQHuzefsRQzaFC7L9rMbb1ucxSoOwFKlQ1Tc/nSJscqLQrYkDtuy3/j0/
 6Tiz/fKZ4yUSsnw8F5D1Y5zjwO9e7EB/KdYZq+zgHPUMAJeCrXgfTiHHUYu1kaj23ymL
 xUns9mKckw2qlWcNWOS8vQGBUgOc9Ul1bxdGcsMSp3G3fEJJYFzNR9fa/JXNayPx6rHw
 Ibag==
X-Gm-Message-State: AOAM533zRRGydsp+ZPSdoclm1wCHRYsrEF0EUoylsa+E9yzbTo64fTyG
 4O/ytsNGcHxCAngSrtvmpVg=
X-Google-Smtp-Source: ABdhPJz9Mv+iabMWKJD6ocXUgDtFCLEwVYiCUdorqAbxwQkYska8o+cgZhIN7hekPn4aaRBpVKJSaA==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr4826248wra.165.1594903032286; 
 Thu, 16 Jul 2020 05:37:12 -0700 (PDT)
Received: from x1w.redhat.com (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id c194sm8336673wme.8.2020.07.16.05.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:37:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2 v2 2/2] block/block-backend: Let blk_attach_dev()
 provide helpful error
Date: Thu, 16 Jul 2020 14:37:04 +0200
Message-Id: <20200716123704.6557-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716123704.6557-1-f4bug@amsat.org>
References: <20200716123704.6557-1-f4bug@amsat.org>
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
  qemu-system-arm: sd_init failed: cannot attach blk 'sd0' to device 'sd-card'
  blk 'sd0' is already attached by device 'omap2-mmc'
  Drive 'sd0' is already in use because it has been automatically connected to another device
  (do you need 'if=none' in the drive options?)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Rebased after 668f62ec62 ("error: Eliminate error_propagate()")
---
 include/sysemu/block-backend.h   |  2 +-
 block/block-backend.c            | 11 ++++++++++-
 hw/block/fdc.c                   |  4 +---
 hw/block/swim.c                  |  4 +---
 hw/block/xen-block.c             |  5 +++--
 hw/core/qdev-properties-system.c | 16 +++++++++-------
 hw/ide/qdev.c                    |  4 +---
 hw/scsi/scsi-disk.c              |  4 +---
 8 files changed, 27 insertions(+), 23 deletions(-)

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
index 63ff940ef9..b7be0a4619 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -884,12 +884,21 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
 
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
+        error_setg(errp, "cannot attach blk '%s' to device '%s'",
+                   blk_name(blk), object_get_typename(OBJECT(dev)));
+        error_append_hint(errp, "blk '%s' is already attached by device '%s'\n",
+                          blk_name(blk), object_get_typename(OBJECT(blk->dev)));
         return -EBUSY;
     }
 
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index e9ed3eef45..bc39244152 100644
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
index 8a7a3f5452..eb99757faf 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -609,14 +609,15 @@ static void xen_cdrom_realize(XenBlockDevice *blockdev, Error **errp)
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
index 3e4f16fc21..e3a757b1c3 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -136,17 +136,19 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
                    object_get_typename(OBJECT(dev)), prop->name, str);
         goto fail;
     }
-    if (blk_attach_dev(blk, dev) < 0) {
+    if (blk_attach_dev(blk, dev, errp) < 0) {
         DriveInfo *dinfo = blk_legacy_dinfo(blk);
 
         if (dinfo && dinfo->type != IF_NONE) {
-            error_setg(errp, "Drive '%s' is already in use because "
-                       "it has been automatically connected to another "
-                       "device (did you need 'if=none' in the drive options?)",
-                       str);
+            error_append_hint(errp,
+                              "Drive '%s' is already in use because it has "
+                              "been automatically connected to another device\n"
+                              "(do you need 'if=none' in the drive options?)\n",
+                              str);
         } else {
-            error_setg(errp, "Drive '%s' is already in use by another device",
-                       str);
+            error_append_hint(errp,
+                              "Drive '%s' is already in use by another device",
+                              str);
         }
         goto fail;
     }
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 27ff1f7f66..9a02eb87f4 100644
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


