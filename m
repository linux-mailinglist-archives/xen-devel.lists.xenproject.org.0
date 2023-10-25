Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB87D6FBE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622972.970370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfE1-00034D-Ek; Wed, 25 Oct 2023 14:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622972.970370; Wed, 25 Oct 2023 14:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfE0-0002xs-U5; Wed, 25 Oct 2023 14:51:12 +0000
Received: by outflank-mailman (input) for mailman id 622972;
 Wed, 25 Oct 2023 14:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJSz=GH=casper.srs.infradead.org=BATV+85b1c44ac99574f3713d+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfDy-0000WU-OZ
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:10 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed910d57-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:07 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvfDZ-009Nmp-OP; Wed, 25 Oct 2023 14:50:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDZ-002dFP-0x; Wed, 25 Oct 2023 15:50:45 +0100
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
X-Inumbo-ID: ed910d57-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=y4cEjsiuJ1bFNsoLeKKWM6n6686E9X1lvqONj/DtYQs=; b=lrSrOgOplofh9XNYvO/Y6Cc20E
	b2BRTomTqLlH4ivgwD4sBmyXjLP3I1Fai6wk4h8Si1HSDLa25iMcQJekBASDQUPnHVIhgwPDGuIPe
	/fiD7p1xKwU7WPhmYzbbiUGkYAMCw9eYzzmKLc7jSYCCrbc9Il3cn+XOaaQle1LLOunGnghcs49bw
	3xgOTsVL24eBNSqWchz1Vf7eCnWmMNu5ej9mU2LmU4o06Qtg1DKPiu8P5eSAmOZnGMDFsJIQQAZUI
	06foiSUf0y/lJX5p1rYRRqKVhWC+mTGRpDqqHpAJiAZgoYQGU7Q2itxuffQXtTSt1ckoY4gF2ShZl
	N4J97H8w==;
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
Subject: [PATCH v3 21/28] xen-platform: unplug AHCI disks
Date: Wed, 25 Oct 2023 15:50:35 +0100
Message-Id: <20231025145042.627381-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

To support Xen guests using the Q35 chipset, the unplug protocol needs
to also remove AHCI disks.

Make pci_xen_ide_unplug() more generic, iterating over the children
of the PCI device and destroying the "ide-hd" devices. That works the
same for both AHCI and IDE, as does the detection of the primary disk
as unit 0 on the bus named "ide.0".

Then pci_xen_ide_unplug() can be used for both AHCI and IDE devices.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/xen/xen_platform.c | 68 +++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index e2dd1b536a..ef7d3fc05f 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -169,39 +169,60 @@ static void pci_unplug_nics(PCIBus *bus)
  *
  * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
  */
-static void pci_xen_ide_unplug(PCIDevice *d, bool aux)
+struct ide_unplug_state {
+    bool aux;
+    int nr_unplugged;
+};
+
+static int ide_dev_unplug(DeviceState *dev, void *_st)
 {
-    DeviceState *dev = DEVICE(d);
-    PCIIDEState *pci_ide;
-    int i;
+    struct ide_unplug_state *st = _st;
     IDEDevice *idedev;
     IDEBus *idebus;
     BlockBackend *blk;
+    int unit;
+
+    idedev = IDE_DEVICE(object_dynamic_cast(OBJECT(dev), "ide-hd"));
+    if (!idedev) {
+        return 0;
+    }
 
-    pci_ide = PCI_IDE(dev);
+    idebus = IDE_BUS(qdev_get_parent_bus(dev));
 
-    for (i = aux ? 1 : 0; i < 4; i++) {
-        idebus = &pci_ide->bus[i / 2];
-        blk = idebus->ifs[i % 2].blk;
+    unit = (idedev == idebus->slave);
+    assert(unit || idedev == idebus->master);
 
-        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
-            if (!(i % 2)) {
-                idedev = idebus->master;
-            } else {
-                idedev = idebus->slave;
-            }
+    if (st->aux && !unit && !strcmp(BUS(idebus)->name, "ide.0")) {
+        return 0;
+    }
 
-            blk_drain(blk);
-            blk_flush(blk);
+    blk = idebus->ifs[unit].blk;
+    if (blk) {
+        blk_drain(blk);
+        blk_flush(blk);
 
-            blk_detach_dev(blk, DEVICE(idedev));
-            idebus->ifs[i % 2].blk = NULL;
-            idedev->conf.blk = NULL;
-            monitor_remove_blk(blk);
-            blk_unref(blk);
-        }
+        blk_detach_dev(blk, DEVICE(idedev));
+        idebus->ifs[unit].blk = NULL;
+        idedev->conf.blk = NULL;
+        monitor_remove_blk(blk);
+        blk_unref(blk);
+    }
+
+    object_unparent(OBJECT(dev));
+    st->nr_unplugged++;
+
+    return 0;
+}
+
+static void pci_xen_ide_unplug(PCIDevice *d, bool aux)
+{
+    struct ide_unplug_state st = { aux, 0 };
+    DeviceState *dev = DEVICE(d);
+
+    qdev_walk_children(dev, NULL, NULL, ide_dev_unplug, NULL, &st);
+    if (st.nr_unplugged) {
+        pci_device_reset(d);
     }
-    pci_device_reset(d);
 }
 
 static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
@@ -216,6 +237,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
+    case PCI_CLASS_STORAGE_SATA:
         pci_xen_ide_unplug(d, aux);
         break;
 
-- 
2.40.1


