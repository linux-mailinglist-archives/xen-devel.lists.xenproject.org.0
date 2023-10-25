Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE47D7034
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623052.970517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfKn-0007xu-Nb; Wed, 25 Oct 2023 14:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623052.970517; Wed, 25 Oct 2023 14:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfKn-0007uH-KY; Wed, 25 Oct 2023 14:58:13 +0000
Received: by outflank-mailman (input) for mailman id 623052;
 Wed, 25 Oct 2023 14:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7q9=GH=desiato.srs.infradead.org=BATV+fe87d11d956b9f6f1554+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfEB-0000WU-Dt
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:23 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f50f3a4c-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:19 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qvfDZ-00GPM0-01; Wed, 25 Oct 2023 14:50:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDY-002dEp-2E; Wed, 25 Oct 2023 15:50:44 +0100
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
X-Inumbo-ID: f50f3a4c-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ga7fdRezSCKkw56oddJDf5PSF3aHuZeS/N2m1OsP10s=; b=SvFORSmuOPtT7hodiNrUuUpIdR
	BgL4DHHiwD4DSEr2bo1GfcbNMKWqCTbKDCxcB+fAJ2Nuahv3RPyr6ves2JjS3MFoVdr6cvCCifigm
	PUzvODEyKHKyOS88vKQvaQO+OvAjvM0MlsAgCZOqe9EM/Pi1/dHzCLDzTlBFHWBrOtKJFLUpYxWJ/
	UL5Xqm1O82SdYKbfkDB8y5pOivPKsD7pEaWFNDeXZrKGki1cvU81VF+jpoMcWFrXaaQnNb2FrVDBx
	SaoTEwgshgIfj3kgQxKhtK5yVJIPjbcCGhyQdU5iuSQCW3SxtH4Meuj25JG4TFSzwoOgPA36ID0xG
	evBsdDAQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v3 13/28] hw/xen: automatically assign device index to block devices
Date: Wed, 25 Oct 2023 15:50:27 +0100
Message-Id: <20231025145042.627381-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

There's no need to force the user to assign a vdev. We can automatically
assign one, starting at xvda and searching until we find the first disk
name that's unused.

This means we can now allow '-drive if=xen,file=xxx' to work without an
explicit separate -driver argument, just like if=virtio.

Rip out the legacy handling from the xenpv machine, which was scribbling
over any disks configured by the toolstack, and didn't work with anything
but raw images.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c                          | 15 +++++++++---
 hw/block/xen-block.c                | 38 +++++++++++++++++++++++++++++
 hw/xen/xen_devconfig.c              | 28 ---------------------
 hw/xenpv/xen_machine_pv.c           |  9 -------
 include/hw/xen/xen-legacy-backend.h |  1 -
 5 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index a01c62596b..5d9f2e5395 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -255,13 +255,13 @@ void drive_check_orphaned(void)
          * Ignore default drives, because we create certain default
          * drives unconditionally, then leave them unclaimed.  Not the
          * users fault.
-         * Ignore IF_VIRTIO, because it gets desugared into -device,
-         * so we can leave failing to -device.
+         * Ignore IF_VIRTIO or IF_XEN, because it gets desugared into
+         * -device, so we can leave failing to -device.
          * Ignore IF_NONE, because leaving unclaimed IF_NONE remains
          * available for device_add is a feature.
          */
         if (dinfo->is_default || dinfo->type == IF_VIRTIO
-            || dinfo->type == IF_NONE) {
+            || dinfo->type == IF_XEN || dinfo->type == IF_NONE) {
             continue;
         }
         if (!blk_get_attached_dev(blk)) {
@@ -977,6 +977,15 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
         qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
         qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
                      &error_abort);
+    } else if (type == IF_XEN) {
+        QemuOpts *devopts;
+        devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
+                                   &error_abort);
+        qemu_opt_set(devopts, "driver",
+                     (media == MEDIA_CDROM) ? "xen-cdrom" : "xen-disk",
+                     &error_abort);
+        qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
+                     &error_abort);
     }
 
     filename = qemu_opt_get(legacy_opts, "file");
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 64470fc579..5011fe9430 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -27,6 +27,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/iothread.h"
 #include "dataplane/xen-block.h"
+#include "hw/xen/interface/io/xs_wire.h"
 #include "trace.h"
 
 static char *xen_block_get_name(XenDevice *xendev, Error **errp)
@@ -34,6 +35,43 @@ static char *xen_block_get_name(XenDevice *xendev, Error **errp)
     XenBlockDevice *blockdev = XEN_BLOCK_DEVICE(xendev);
     XenBlockVdev *vdev = &blockdev->props.vdev;
 
+    if (blockdev->props.vdev.type == XEN_BLOCK_VDEV_TYPE_INVALID) {
+        XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
+        char fe_path[XENSTORE_ABS_PATH_MAX + 1];
+        char *value;
+        int disk = 0;
+        unsigned long idx;
+
+        /* Find an unoccupied device name */
+        while (disk < (1 << 20)) {
+            if (disk < (1 << 4)) {
+                idx = (202 << 8) | (disk << 4);
+            } else {
+                idx = (1 << 28) | (disk << 8);
+            }
+            snprintf(fe_path, sizeof(fe_path),
+                     "/local/domain/%u/device/vbd/%lu",
+                     xendev->frontend_id, idx);
+            value = qemu_xen_xs_read(xenbus->xsh, XBT_NULL, fe_path, NULL);
+            if (!value) {
+                if (errno == ENOENT) {
+                    vdev->type = XEN_BLOCK_VDEV_TYPE_XVD;
+                    vdev->partition = 0;
+                    vdev->disk = disk;
+                    vdev->number = idx;
+                    goto found;
+                }
+                error_setg(errp, "cannot read %s: %s", fe_path,
+                           strerror(errno));
+                return NULL;
+            }
+            free(value);
+            disk++;
+        }
+        error_setg(errp, "cannot find device vdev for block device");
+        return NULL;
+    }
+ found:
     return g_strdup_printf("%lu", vdev->number);
 }
 
diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index 9b7304e544..3f77c675c6 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -46,34 +46,6 @@ static int xen_config_dev_all(char *fe, char *be)
 
 /* ------------------------------------------------------------- */
 
-int xen_config_dev_blk(DriveInfo *disk)
-{
-    char fe[256], be[256], device_name[32];
-    int vdev = 202 * 256 + 16 * disk->unit;
-    int cdrom = disk->media_cd;
-    const char *devtype = cdrom ? "cdrom" : "disk";
-    const char *mode    = cdrom ? "r"     : "w";
-    const char *filename = qemu_opt_get(disk->opts, "file");
-
-    snprintf(device_name, sizeof(device_name), "xvd%c", 'a' + disk->unit);
-    xen_pv_printf(NULL, 1, "config disk %d [%s]: %s\n",
-                  disk->unit, device_name, filename);
-    xen_config_dev_dirs("vbd", "qdisk", vdev, fe, be, sizeof(fe));
-
-    /* frontend */
-    xenstore_write_int(fe, "virtual-device",  vdev);
-    xenstore_write_str(fe, "device-type",     devtype);
-
-    /* backend */
-    xenstore_write_str(be, "dev",             device_name);
-    xenstore_write_str(be, "type",            "file");
-    xenstore_write_str(be, "params",          filename);
-    xenstore_write_str(be, "mode",            mode);
-
-    /* common stuff */
-    return xen_config_dev_all(fe, be);
-}
-
 int xen_config_dev_nic(NICInfo *nic)
 {
     char fe[256], be[256];
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 17cda5ec13..1533f5dfb4 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -32,7 +32,6 @@
 
 static void xen_init_pv(MachineState *machine)
 {
-    DriveInfo *dinfo;
     int i;
 
     setup_xen_backend_ops();
@@ -64,14 +63,6 @@ static void xen_init_pv(MachineState *machine)
         vga_interface_created = true;
     }
 
-    /* configure disks */
-    for (i = 0; i < 16; i++) {
-        dinfo = drive_get(IF_XEN, 0, i);
-        if (!dinfo)
-            continue;
-        xen_config_dev_blk(dinfo);
-    }
-
     /* configure nics */
     for (i = 0; i < nb_nics; i++) {
         if (!nd_table[i].model || 0 != strcmp(nd_table[i].model, "xen"))
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 6c307c5f2c..fc42146bc2 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -81,7 +81,6 @@ extern struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
 
 /* configuration (aka xenbus setup) */
 void xen_config_cleanup(void);
-int xen_config_dev_blk(DriveInfo *disk);
 int xen_config_dev_nic(NICInfo *nic);
 int xen_config_dev_vfb(int vdev, const char *type);
 int xen_config_dev_vkbd(int vdev);
-- 
2.40.1


