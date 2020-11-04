Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C682A6564
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 14:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19130.44362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJ33-0007zh-NM; Wed, 04 Nov 2020 13:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19130.44362; Wed, 04 Nov 2020 13:42:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJ33-0007zI-Jt; Wed, 04 Nov 2020 13:42:01 +0000
Received: by outflank-mailman (input) for mailman id 19130;
 Wed, 04 Nov 2020 13:40:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5Gd=EK=huawei.com=zhangxinhao1@srs-us1.protection.inumbo.net>)
 id 1kaJ1I-0007xK-8u
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:40:12 +0000
Received: from szxga05-in.huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a2a619a-caf9-4cf0-bb75-30da3e1cd77a;
 Wed, 04 Nov 2020 13:40:04 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CR76H58CBzhg5H;
 Wed,  4 Nov 2020 21:39:03 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 21:38:59 +0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=w5Gd=EK=huawei.com=zhangxinhao1@srs-us1.protection.inumbo.net>)
	id 1kaJ1I-0007xK-8u
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:40:12 +0000
X-Inumbo-ID: 4a2a619a-caf9-4cf0-bb75-30da3e1cd77a
Received: from szxga05-in.huawei.com (unknown [45.249.212.191])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4a2a619a-caf9-4cf0-bb75-30da3e1cd77a;
	Wed, 04 Nov 2020 13:40:04 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CR76H58CBzhg5H;
	Wed,  4 Nov 2020 21:39:03 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 21:38:59 +0800
From: Xinhao Zhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
	<dengkai1@huawei.com>, <alex.chen@huawei.com>, <qemu-trivial@nongnu.org>
Subject: [PATCH] hw/xen: Don't use '#' flag of printf format
Date: Wed, 4 Nov 2020 21:37:09 +0800
Message-ID: <20201104133709.3326630-1-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected

Fix code style. Don't use '#' flag of printf format ('%#') in
format strings, use '0x' prefix instead

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
---
 hw/xen/xen_pt.c             | 10 +++++-----
 hw/xen/xen_pt_config_init.c |  6 +++---
 hw/xen/xen_pt_msi.c         | 16 ++++++++--------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 6d359ee486..a5f3dd590c 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -489,7 +489,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
         pci_register_bar(&s->dev, i, type, &s->bar[i]);
 
         XEN_PT_LOG(&s->dev, "IO region %i registered (size=0x%08"PRIx64
-                   " base_addr=0x%08"PRIx64" type: %#x)\n",
+                   " base_addr=0x%08"PRIx64" type: 0x%x)\n",
                    i, r->size, r->base_addr, type);
     }
 
@@ -578,7 +578,7 @@ static void xen_pt_check_bar_overlap(PCIBus *bus, PCIDevice *d, void *opaque)
         if (ranges_overlap(arg->addr, arg->size, r->addr, r->size)) {
             XEN_PT_WARN(&s->dev,
                         "Overlapped to device [%02x:%02x.%d] Region: %i"
-                        " (addr: %#"FMT_PCIBUS", len: %#"FMT_PCIBUS")\n",
+                        " (addr: 0x%"FMT_PCIBUS", len: 0x%"FMT_PCIBUS")\n",
                         pci_bus_num(bus), PCI_SLOT(d->devfn),
                         PCI_FUNC(d->devfn), i, r->addr, r->size);
             arg->rc = true;
@@ -618,8 +618,8 @@ static void xen_pt_region_update(XenPCIPassthroughState *s,
     pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
                         xen_pt_check_bar_overlap, &args);
     if (args.rc) {
-        XEN_PT_WARN(d, "Region: %d (addr: %#"FMT_PCIBUS
-                    ", len: %#"FMT_PCIBUS") is overlapped.\n",
+        XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
+                    ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
                     bar, sec->offset_within_address_space,
                     int128_get64(sec->size));
     }
@@ -786,7 +786,7 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
 
     /* register real device */
     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
-               " to devfn %#x\n",
+               " to devfn 0x%x\n",
                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
                s->dev.devfn);
 
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c8724cc7c8..c5c4e943a8 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1622,7 +1622,7 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
         case PCI_EXP_TYPE_PCIE_BRIDGE:
         case PCI_EXP_TYPE_RC_EC:
         default:
-            XEN_PT_ERR(d, "Unsupported device/port type %#x.\n", type);
+            XEN_PT_ERR(d, "Unsupported device/port type 0x%x.\n", type);
             return -1;
         }
     }
@@ -1645,11 +1645,11 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
         case PCI_EXP_TYPE_PCIE_BRIDGE:
         case PCI_EXP_TYPE_RC_EC:
         default:
-            XEN_PT_ERR(d, "Unsupported device/port type %#x.\n", type);
+            XEN_PT_ERR(d, "Unsupported device/port type 0x%x.\n", type);
             return -1;
         }
     } else {
-        XEN_PT_ERR(d, "Unsupported capability version %#x.\n", version);
+        XEN_PT_ERR(d, "Unsupported capability version 0x%x.\n", version);
         return -1;
     }
 
diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index fb4b887b92..b71563f98a 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -123,7 +123,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
             *ppirq = XEN_PT_UNASSIGNED_PIRQ;
         } else {
             XEN_PT_LOG(&s->dev, "requested pirq %d for MSI%s"
-                       " (vec: %#x, entry: %#x)\n",
+                       " (vec: 0x%x, entry: 0x%x)\n",
                        *ppirq, is_msix ? "-X" : "", gvec, msix_entry);
         }
     }
@@ -142,7 +142,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
                                      msix_entry, table_base);
         if (rc) {
             XEN_PT_ERR(&s->dev,
-                       "Mapping of MSI%s (err: %i, vec: %#x, entry %#x)\n",
+                       "Mapping of MSI%s (err: %i, vec: 0x%x, entry 0x%x)\n",
                        is_msix ? "-X" : "", errno, gvec, msix_entry);
             return rc;
         }
@@ -165,8 +165,8 @@ static int msi_msix_update(XenPCIPassthroughState *s,
     int rc = 0;
     uint64_t table_addr = 0;
 
-    XEN_PT_LOG(d, "Updating MSI%s with pirq %d gvec %#x gflags %#x"
-               " (entry: %#x)\n",
+    XEN_PT_LOG(d, "Updating MSI%s with pirq %d gvec 0x%x gflags 0x%x"
+               " (entry: 0x%x)\n",
                is_msix ? "-X" : "", pirq, gvec, gflags, msix_entry);
 
     if (is_msix) {
@@ -208,11 +208,11 @@ static int msi_msix_disable(XenPCIPassthroughState *s,
     }
 
     if (is_binded) {
-        XEN_PT_LOG(d, "Unbind MSI%s with pirq %d, gvec %#x\n",
+        XEN_PT_LOG(d, "Unbind MSI%s with pirq %d, gvec 0x%x\n",
                    is_msix ? "-X" : "", pirq, gvec);
         rc = xc_domain_unbind_msi_irq(xen_xc, xen_domid, gvec, pirq, gflags);
         if (rc) {
-            XEN_PT_ERR(d, "Unbinding of MSI%s failed. (err: %d, pirq: %d, gvec: %#x)\n",
+            XEN_PT_ERR(d, "Unbinding of MSI%s failed. (err: %d, pirq: %d, gvec: 0x%x)\n",
                        is_msix ? "-X" : "", errno, pirq, gvec);
             return rc;
         }
@@ -539,7 +539,7 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
     }
 
     if (id != PCI_CAP_ID_MSIX) {
-        XEN_PT_ERR(d, "Invalid id %#x base %#x\n", id, base);
+        XEN_PT_ERR(d, "Invalid id 0x%x base 0x%x\n", id, base);
         return -1;
     }
 
@@ -582,7 +582,7 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
         XEN_PT_ERR(d, "Can't open /dev/mem: %s\n", strerror(errno));
         goto error_out;
     }
-    XEN_PT_LOG(d, "table_off = %#x, total_entries = %d\n",
+    XEN_PT_LOG(d, "table_off = 0x%x, total_entries = %d\n",
                table_off, total_entries);
     msix->table_offset_adjust = table_off & 0x0fff;
     msix->phys_iomem_base =
-- 
2.29.0-rc1


