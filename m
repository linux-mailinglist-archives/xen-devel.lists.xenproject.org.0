Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0865A544E54
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 16:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345547.571190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzIkM-0001L8-Cw; Thu, 09 Jun 2022 14:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345547.571190; Thu, 09 Jun 2022 14:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzIkM-0001JM-9x; Thu, 09 Jun 2022 14:02:50 +0000
Received: by outflank-mailman (input) for mailman id 345547;
 Thu, 09 Jun 2022 14:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pGOA=WQ=citrix.com=prvs=1525abdf4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nzIkK-0001J0-DE
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 14:02:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5cae84f-e7fc-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 16:02:46 +0200 (CEST)
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
X-Inumbo-ID: d5cae84f-e7fc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654783366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2U3jUoNslZi3eqK5NFra4Ihi53xzZqdKWsALmkjx8cU=;
  b=NuPnBJQTgBdyxhbZInEKjXdjsqqHls7O/OspTlhqigMK9vJtSbOke0ri
   j1BPhAA74O0kFO6iCuB12i7AIb+vaEZoha+JJN+goLBRErb6ySCgiiahk
   9PP4myjiRZKVzPNNol8AyhUGKzdTHF+R1SBWGFX9/J2TGospXM2TSLMpi
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72584691
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/nEWgK+ZETWmMnB+WLlxDrUDJ36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jEdWDiPM/yNMGP9edF2aN+xpE1TusCAydVnQVFp/n88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw34DpW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnczoTDksMKzyo7wyCCtjHwh5BYZL46CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JBEOWYxPU2ojxtnancZCJEag+eTl2TOeH5n80mTi7sM7D2GpOB2+Oe0a4eEEjCQfu1Ql1yTq
 2aA9nz3DxUQPcGa4TWA+3OowOTImEvTXZkOPKe1+v5jnBuYwWl7IBAaSFKhrf6Rike0WNVEN
 woS9zZGhbE/8VHuRN36VB6QpnmCsRgBHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRtq7uSVlqH+7uUpC/0Mi8QRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXuGTz23
 z2bhCc7jrQXy8UM0s2T5F3Cnnegq4bESiYz4QPYWH/j6Rl2DKa/Zoeo4ELXq/ZNKoqUVEKGu
 lAAms6X9udICouC/ASVSuILDrCv5t6fPTHciEIpFJ4knxy18mOnVZBd5nd5PkgBDyofUWa3O
 gmJ41oXvcINeivxBUNqX26vI5RyyJblG9Xbbaj7Neh1brF2TCSK5z47MCZ8wFvRfFgQfbAXY
 MnGLZjxVypKVsyL3xLtGb5DjOZDKjQWgDqKGMull0nPPa+2Pib9dFsTDLeZggnVBougqR6dz
 dtQPtDiJ/53ALynOXm/HWL+wDk3wZkH6XPe8ZU/mhareFYOJY3YI6a5LUkdU4Jkhb9JsezD4
 2uwXERVoHKm2yCbdlzRMCA/Nui3NXqakZ7cFXV0VWtEJlB5Odr/hEvhX8BfkUYbGBxLkqcvE
 qhtlzSoCfVTUDXXkwkggW3GhNU6LnyD3FvWVwL8OWRXV8MxHGThp467FjYDAQFTV0JbQ+Nl+
 +3+vu4aKLJeLzlf4DH+OKr1nwrg5ihE8A+wNmORSuRulIzX2NACA0TMYjUfeqng9T2rKuOm6
 jur
IronPort-HdrOrdr: A9a23:F79vfakFKVUIC4pgni6YLoKgTvnpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7gr5OUtQ/uxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyIMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; 
   d="scan'208";a="72584691"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Bernhard Beschow <shentey@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
	<xen-devel@lists.xenproject.org>, <qemu-block@nongnu.org>
Subject: [PULL 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Date: Thu, 9 Jun 2022 15:02:02 +0100
Message-ID: <20220609140202.45227-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220609140202.45227-1-anthony.perard@citrix.com>
References: <20220609140202.45227-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Bernhard Beschow <shentey@gmail.com>

This function was declared in a generic and public header, implemented
in a device-specific source file but only used in xen_platform. Given its
'aux' parameter, this function is more xen-specific than piix-specific.
Also, the hardcoded magic constants seem to be generic and related to
PCIIDEState and IDEBus rather than piix.

Therefore, move this function to xen_platform, unexport it, and drop the
"piix3" in the function name as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220513180957.90514-4-shentey@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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
Anthony PERARD


