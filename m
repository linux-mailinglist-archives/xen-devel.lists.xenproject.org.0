Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48851526900
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 20:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328679.551787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZjw-0006QO-TH; Fri, 13 May 2022 18:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328679.551787; Fri, 13 May 2022 18:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZjw-0006Kl-OI; Fri, 13 May 2022 18:10:12 +0000
Received: by outflank-mailman (input) for mailman id 328679;
 Fri, 13 May 2022 18:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eu56=VV=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1npZjv-0005kx-Me
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 18:10:11 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed969dc2-d2e7-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 20:10:10 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id ks9so17763395ejb.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 11:10:10 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:10 -0700 (PDT)
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
X-Inumbo-ID: ed969dc2-d2e7-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBXAkFrCGs28BI30AzYWmYh3sIrQDSjFAmvH5xdAdFk=;
        b=Bgcy7jIh1t61wlZnBAq+JZld3nOesqYuWWAdJJQ0sl5bxUB9nsHbDiHngRu1OutYbW
         OG4VHmgNSqmhme8qgcCXmbEvIbIkbJDxxYz0+LuY/SJhWJjQ3/CYEQ9XFbgPX1dsLuxf
         XIGJ53kceKKUz2qVjgUC/cWmwF3HbLDV5msbnHnu8HPlavKmPUxicAXfXl2G0GqjwW32
         mYHwZUV1bTyn8D8pLeBFHjF+NFVyzw1boC9HcP8y/EX8ZZ4I4r3zhkHORo6RIDVJjr/l
         ESmOonSf3nBPpEBH/WkgN4DFFIGJVy2vYJJOgtj8wUkMscuLJRjrQ4/xw3nRhil/1CJL
         xNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBXAkFrCGs28BI30AzYWmYh3sIrQDSjFAmvH5xdAdFk=;
        b=BxpW4U0cJuvwGLVQgedT6caloKpfusMQgV0qSBCMjsYi5uGjg8x6WnZeVQUA31ID2j
         X+t7kGPSenj4fQTykkKVjL6f7JCt3fF3Kaszr5ToudqfjLXN7+oF69FRfTr4VZLxBiuk
         /nlp3+hSsm7NiluzD+JF/rfictZlc1EfOPxNYh2QoPtCBwYKIwqN98nHkekSI5q+ZQeD
         QiH8JKx9dpLzrQYrp2Sbh96+EEHkkYgmjX1xllDWwMecYDrqCry3sB1XOdeNtWvmrjXz
         xIE830UMbzMGTKS/e7JfTbC5xKypzg+kmskqff7o4mVeqkbdMabtm8RF+KwI68EtIgAY
         HTVA==
X-Gm-Message-State: AOAM530G4mfcCJWICuqfTrpse97scmoYudE1KVtiNVRtNEksrWZmc/iB
	taiH2YgkiW4odyx+KojasNM=
X-Google-Smtp-Source: ABdhPJzd1ozMHGZZFnRvVPDcf7J6MJFx90w5pAiPDrPJQobwuWQ40761pwClkT/3oeGExjerubnvSw==
X-Received: by 2002:a17:907:97c4:b0:6f8:5ec5:61e2 with SMTP id js4-20020a17090797c400b006f85ec561e2mr5456098ejc.559.1652465410414;
        Fri, 13 May 2022 11:10:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v2 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Date: Fri, 13 May 2022 20:09:57 +0200
Message-Id: <20220513180957.90514-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 46 ------------------------------------
 include/hw/ide.h           |  3 ---
 3 files changed, 47 insertions(+), 50 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 72028449ba..a64265cca0 100644
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
@@ -134,6 +135,51 @@ static void pci_unplug_nics(PCIBus *bus)
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
+static void pci_xen_ide_unplug(DeviceState *dev, bool aux)
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
+}
+
 static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 {
     uint32_t flags = *(uint32_t *)opaque;
@@ -147,7 +193,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
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


