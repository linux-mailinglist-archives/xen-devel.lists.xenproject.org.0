Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7151ECEA
	for <lists+xen-devel@lfdr.de>; Sun,  8 May 2022 12:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323995.545882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nneFs-00043k-PI; Sun, 08 May 2022 10:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323995.545882; Sun, 08 May 2022 10:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nneFs-000412-ML; Sun, 08 May 2022 10:35:12 +0000
Received: by outflank-mailman (input) for mailman id 323995;
 Sun, 08 May 2022 10:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I6m9=VQ=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1nneFr-00040w-Ov
 for xen-devel@lists.xenproject.org; Sun, 08 May 2022 10:35:11 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87ed232b-ceba-11ec-a406-831a346695d4;
 Sun, 08 May 2022 12:35:09 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id l18so21820494ejc.7
 for <xen-devel@lists.xenproject.org>; Sun, 08 May 2022 03:35:08 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-246-161.77.183.pool.telefonica.de. [77.183.246.161])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f388f6f927sm3901948ejc.1.2022.05.08.03.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 03:35:07 -0700 (PDT)
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
X-Inumbo-ID: 87ed232b-ceba-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ij5oGJCJI6PW/a2beKsWQ2NZIiZzUBei2wkeohldNg0=;
        b=qy1+i0Nrp7bat4BckqAb7DFru/UJobFqUCSHUm86RtfvAfhDDeVdEUFGwgyJcMBNMd
         ysRMszci8ba/1p6p4KzMGdnlcGqn9uukof7N0Zd3IaK7gq2jLk+XzRgIc/QPdH+DYeAN
         BitjM5O/pasuYw7o+1OD+1BPYa5jcqWsxOJo1wHXzm1xNTSXOK9rU6mWBWmNF9sEJpRD
         6PSzw4TDbbxM9wK1WvAjg+poctNAhSV1ZMdliQMnSGMuC79VgWYQ3C5rljxjljJg0TcP
         BQcsXHoC5WJJjYEoCmlczUgj84ZX5S+0gj2QwAAlNBftxigkqrhBA1fE06FuEoorMg8C
         3sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ij5oGJCJI6PW/a2beKsWQ2NZIiZzUBei2wkeohldNg0=;
        b=vnw3xO2nXZ21YA9d+YVZXN81N+ippJT+Mzh6bszzr7BNhngfxNp9ysRYVYtbqv2iDX
         3pEz/cAwpK2SqZqc2G8FL6xte3XDnDRaCPr5p+2cD0dlTsbFDqDkdoPwZKuAj0+cp/mW
         I2Mn3eKe7lXbMFKuG2JSXSrSoS6u0M5vHQjESwF9EBWI4szza1NlG2QWcjaUrv1yOZL3
         vR8xFkW/Ot1DcxXie/D32/mnns6TNYANAZg5G/CqRlgqhGksGjnnuW7E3NXPIiksGuye
         jKRs7DD242GaLU7V3cAGOtz5UuWd5khAO88ZTJzDGcxT63wXNDcDkFF1zSRm6DntqEiq
         F29w==
X-Gm-Message-State: AOAM533OyQGSOZu66B84/sXepdA17pt+tle+Oi3+BYNwX/ch6c3OUnm6
	SeH00D/KEnEdpCe7THtBAyvxSOvWPyM3Yw==
X-Google-Smtp-Source: ABdhPJz2AmiXieVCbzTsOl+b158iSqM9IPIh52EIWcA9jlMcRkM1lrjwbjNUt1QadDAhCun39mirMQ==
X-Received: by 2002:a17:907:7f14:b0:6f4:2a57:e1df with SMTP id qf20-20020a1709077f1400b006f42a57e1dfmr10348828ejc.18.1652006107890;
        Sun, 08 May 2022 03:35:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	John Snow <jsnow@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
	qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Date: Sun,  8 May 2022 12:34:32 +0200
Message-Id: <20220508103432.14874-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220508103432.14874-1-shentey@gmail.com>
References: <20220508103432.14874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function was declared in a generic and public header, implemented
in a device-specific source file but only used in xen_platform. Given its
'aux' parameter, this function is more xen-specific than piix-specific.
Also, the hardcoded magic constants seem to be generic and related to
PCIIDEState and IDEBus rather than piix.

Therefore, move this function to xen_platform, unexport it, and drop the
"piix3" in the function name as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen_platform.c | 49 +++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 46 -----------------------------------
 include/hw/ide.h           |  3 ---
 3 files changed, 48 insertions(+), 50 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 72028449ba..124ffeae35 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/ide.h"
+#include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "hw/xen/xen_common.h"
 #include "migration/vmstate.h"
@@ -134,6 +135,52 @@ static void pci_unplug_nics(PCIBus *bus)
     pci_for_each_device(bus, 0, unplug_nic, NULL);
 }
 
+/*
+ * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
+ * request unplug of 'aux' disks (which is stated to mean all IDE disks,
+ * except the primary master).
+ *
+ * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
+ *       is simultaneously requested is not clear. The implementation assumes
+ *       that an 'all' request overrides an 'aux' request.
+ *
+ * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
+ */
+static int pci_xen_ide_unplug(DeviceState *dev, bool aux)
+{
+    PCIIDEState *pci_ide;
+    int i;
+    IDEDevice *idedev;
+    IDEBus *idebus;
+    BlockBackend *blk;
+
+    pci_ide = PCI_IDE(dev);
+
+    for (i = aux ? 1 : 0; i < 4; i++) {
+        idebus = &pci_ide->bus[i / 2];
+        blk = idebus->ifs[i % 2].blk;
+
+        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
+            if (!(i % 2)) {
+                idedev = idebus->master;
+            } else {
+                idedev = idebus->slave;
+            }
+
+            blk_drain(blk);
+            blk_flush(blk);
+
+            blk_detach_dev(blk, DEVICE(idedev));
+            idebus->ifs[i % 2].blk = NULL;
+            idedev->conf.blk = NULL;
+            monitor_remove_blk(blk);
+            blk_unref(blk);
+        }
+    }
+    qdev_reset_all(dev);
+    return 0;
+}
+
 static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 {
     uint32_t flags = *(uint32_t *)opaque;
@@ -147,7 +194,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-        pci_piix3_xen_ide_unplug(DEVICE(d), aux);
+        pci_xen_ide_unplug(DEVICE(d), aux);
         break;
 
     case PCI_CLASS_STORAGE_SCSI:
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index bc1b37512a..9a9b28078e 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -173,52 +173,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-/*
- * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
- * request unplug of 'aux' disks (which is stated to mean all IDE disks,
- * except the primary master).
- *
- * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
- *       is simultaneously requested is not clear. The implementation assumes
- *       that an 'all' request overrides an 'aux' request.
- *
- * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
- */
-int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
-{
-    PCIIDEState *pci_ide;
-    int i;
-    IDEDevice *idedev;
-    IDEBus *idebus;
-    BlockBackend *blk;
-
-    pci_ide = PCI_IDE(dev);
-
-    for (i = aux ? 1 : 0; i < 4; i++) {
-        idebus = &pci_ide->bus[i / 2];
-        blk = idebus->ifs[i % 2].blk;
-
-        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
-            if (!(i % 2)) {
-                idedev = idebus->master;
-            } else {
-                idedev = idebus->slave;
-            }
-
-            blk_drain(blk);
-            blk_flush(blk);
-
-            blk_detach_dev(blk, DEVICE(idedev));
-            idebus->ifs[i % 2].blk = NULL;
-            idedev->conf.blk = NULL;
-            monitor_remove_blk(blk);
-            blk_unref(blk);
-        }
-    }
-    qdev_reset_all(dev);
-    return 0;
-}
-
 static void pci_piix_ide_exitfn(PCIDevice *dev)
 {
     PCIIDEState *d = PCI_IDE(dev);
diff --git a/include/hw/ide.h b/include/hw/ide.h
index c5ce5da4f4..60f1f4f714 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -8,9 +8,6 @@
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
-/* ide-pci.c */
-int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux);
-
 /* ide-mmio.c */
 void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
 
-- 
2.36.1


