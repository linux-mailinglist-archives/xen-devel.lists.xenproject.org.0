Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8176A6B8943
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 05:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509441.785190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbvqt-0003Hc-Q5; Tue, 14 Mar 2023 04:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509441.785190; Tue, 14 Mar 2023 04:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbvqt-0003Fu-MN; Tue, 14 Mar 2023 04:01:31 +0000
Received: by outflank-mailman (input) for mailman id 509441;
 Tue, 14 Mar 2023 04:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LtO=7G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pbvqq-0003Fb-Kv
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 04:01:29 +0000
Received: from sonic313-21.consmr.mail.gq1.yahoo.com
 (sonic313-21.consmr.mail.gq1.yahoo.com [98.137.65.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e313a1d5-c21c-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 05:01:26 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 04:01:23 +0000
Received: by hermes--production-ne1-759c9b8c64-fztnz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 76100b2c878269fd1c2471a41328eeeb; 
 Tue, 14 Mar 2023 04:01:19 +0000 (UTC)
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
X-Inumbo-ID: e313a1d5-c21c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678766483; bh=hfIkxSt+f+w40Cm5/M8txYvuJH0EIEq7wMJSl6CHjTc=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Hn2KFrOTdsWVmqwlYzlCNlDd6dqHo8PgxkHCnLsmTwWHW593iiSsON92yeIfmYVVMfA622tx9wvf7tDmz+5QgYzs+CyancqvLUGmBVKnP9lgNec7GbUdi9p5wzvFLpbVC1Fbc5dudbvZxqqqEAMm1+ONnz6m9HDd+hqCy2NKKYtxg9aFeRyJ368WyHfO2KPTh44SsNIDN4lgxwuS7UepDFW0hw4ASdAffV4Ps3TCUQsnct53crItSNwELd8A9DF+iDEPF/V0gOnQjNlYsauTJk5W5YPGmHvpNhSTgMuRMMtMeLbobCdusRQozSLK2FCpTkJRwQmUMzEoOa0b/eYqmg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678766483; bh=/VOoJql8lXeru8oKxaUG/fk6MHm8CuHBVdiEt+8+QoE=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=L5SB8/I4MIZ7KgcWKEAFrmw72vNMvOt2IBCKEKrEPtMcxLW1/70bWPohEW1Ug+hUUS2nbtXCLnk95S3SEdhSgnIwjpU5qyY2zKQEJVpU8Pmlug2GABleHgZREQaaziiUQH4NSKTO3fygO7tosJD0vmigNePWCFixdmb37gEscAYTaRLi6qKND4eEjc8rlAoHaKcGX4zJkEV88og9XrlQMloFIEm5gkSJQTi/ckB4awsnJ/TlwFVjSCj4lZXvudr2dcG4IPTxeO6wYdkjbrfksmqQzZ6/wncn0hvtI7C/9IKFdyNlo0BgUm3ZVRETwePGmfgS8Mxf9JZ9bzABRscXSA==
X-YMail-OSG: D_Z9IvAVM1kLR_jhTFM_ZCB2sg5gSZYx_12HH28Rf7FQWEw3EksJQKnda7SlG4l
 VJoP8O3qGRs2ouoMQ8_lTvWLFHCx9Y6Iw5gemgzjSKegTd5EIl9IRiQhoFSUz_mmQlbdH7R0etsb
 Oosh3OyCJ_djOxxGSQIoVqo0NM5aG9J0mphAvz1XfTXvOjaZXqB3RG.ZX3lH3JUkVcWzHT0OuSyY
 PXZ24bF.0XMR9gw7kIBwKZNYGu7M164CJqRcS3IZETxzTIS3.0eCt1bMJ3LkReOH_lPzxeF82wuJ
 i0SDJmrrCm9zJ9Jii762e1m70.tQ_N2dSnSLK51CQpD8pptW7_FkJ6aoBVBDQbMd9kfNWSJLBQiD
 1oC20nTBecTahDb.0ihBESrmE4Zj8lG3shpYwV.yTSR3Z3NA8WECiJOsf6J5vxIzhMcWpIxxJyYo
 zgU_PRDrYE68vYFfYZutiA7xVvZ8mV.qLRXlT3srhonLf02genJzKG.JjJ4qtrpb2HwgTY3ODUsu
 7k.p1SX4xBZa6Gusfpe6KkMcxhcI.iUYPbmdJpNVSqwqoTm5aLab0ryr7sMFQac_NKcBjdqwOhwb
 STXCuMxfBdJP0_j8Xp3vOmXxURNDVunc2F8eEv7miti.d3W.wmF8u6PiCB5uT944BDz992CYT131
 NE2ySUcKnADsnwYVcxKHlhfXX22APh0ICjbtp.QrqC8QWTmHWEurgQDT5BNmVsD8BrgQi2LeiTD5
 cg6hzc.iAafBwto1SDEmthllDs4.qtHYMKmNzhXWWJIuY3hBXGOansle34e9py9Po0sQ8p.ixBZg
 UKuoNzW_6oIteO3OQxpXBCT0Q7GiunzAG.7fN0HdP1B1xf_42vF.SRcnAeoA3nwfep.0pvFo78_y
 fIeOuYQ3wvx7rJa_B6.ZGHJ.MWCV.LGcm8ySmhjdfQ5Nl11t9WwnDSJ2OaIHUrEPwmgYXrpayAJI
 BQjErTZT.xOFVJeM_7Nc.kwpq_Qhd5jErkK9Ak8KviTFqtBc7c3VI8pJuDq4b1SQChS7B_QgYQOe
 Dl3pP4Vu_vqJnPCltc.zgeyP5o2YgBfRWb9iSdOsAcRPI3.GQcwn6Ss49JLpjwafOmbRiHLhR0V_
 PUVomBnpvk7N7JxCCYDjkDaiAoRDtWWUz3asUUZqSRB1Geoc9GYpKRPMoSYhQVnERHZ2KKzPe34T
 pC_bdGPXn12nn1dxgI6bOuI.N_7ANsHRHYO1rHju0O.eVQx07IWH5W8vaELGg6PgfMlR1q3pafAR
 kcbldX31PtJ64BXaEVprQ8PvX6mzvwctW1yAynKQ_5UQJF1hTJASASqWS3KfEQMVRZ8b6FjYWa0d
 dlXfmAMqswVDvQ4q.P_hJNiiUhEL2ySbHWJ0cQ1SyZ186vp.fwJfibk6uu5RkBxIDO3uuqZY_fuw
 y03akzbmXaDGTw9lmNN_RRZdzwcKE3CGZhGJ8D01NVO8yqUlp61co0F0Dk3DUAe4HuF31cGvhyVI
 SvDBA7prZ7iq9UZp9reNfo01LWtFgyuVhHsqx5pN64mQUBhekXta.voxq0J6w577Xf2INwYmJ9hN
 ydIYcXla3agUYmBKUQlzu.z5ChgOT8BxlFZHj9RqxpHeq5bzfZlMY42IlnIdZgwHQ_AiqYoYjR2m
 9w7QOgrCpa1m.pP.KMMGpQmIHWN1rnF.qO70Bc8C6l4vqxsz5IjbaQEsT1DtnxwiMlmgq9y8NWUV
 04LbHb2Z4HwWTGd.iPvgla7pCU__Vbp5pl54URt7TW4ynqPRTaLvsz_w1JpvkRNt6vSdwZZ9EVqW
 54SFxeBQJMuKm.KwKdJYZHhslbrd4p6mSl5GOPUjBrh2gfgSkmaivMQ7IIz3P2OQnPbSqNsqqtfS
 eWPLQHfD3sJhq9wnxG5PBELMsO0HCGYIqGOmTIcbIn8OArp5aoiz93aoJpaHj03_0AZgIonW6WDJ
 zBWRpLw9ID2T0m40r6G.IgMn7lK.YJdmp4UMkJMR2No7ZBK6oEgAMk_NK4PyzmF9.84bHbL8jtjN
 D.eS9RuaGFjX9HUthTaFpqNfMU5Web6lljPpbEgH_KKOvBALw.iUqdpPOLE7Mg4t8C1tOBET6XWW
 smjghbpLkggqqOriVRCrDr9WMvXU8QBHH1KWMIda3rES7zrjK9brc0X1rLxQRm_FXvXN4k4otNtj
 89nkIFCSrE6jcHzDoOkdC6EEIjJRC3mc8WUG1NRRhvbl_GYKlYCsSKjeHNmW5f1VhzEL4NjQj
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 511d7520-f088-48d5-93aa-9784919af414
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/2] pci: avoid accessing slot_reserved_mask directly outside of pci.c
Date: Tue, 14 Mar 2023 00:01:08 -0400
Message-Id: <7248ee8127e73299c53e38a635505033685787e0.1678763217.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678763217.git.brchuckz@aol.com>
References: <cover.1678763217.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch provides accessor functions as replacements for direct
access to slot_reserved_mask according to the comment at the top
of include/hw/pci/pci_bus.h which advises that data structures for
PCIBus should not be directly accessed but instead be accessed using
accessor functions in pci.h.

Three accessor functions can conveniently replace all direct accesses
of slot_reserved_mask. With this patch, the new accessor functions are
used in hw/sparc64/sun4u.c and hw/xen/xen_pt.c and pci_bus.h is removed
from the included header files of the same two files.

No functional change intended.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
v2: This is the first version of this patch, it did not exist in v1.

 hw/pci/pci.c         | 15 +++++++++++++++
 hw/sparc64/sun4u.c   |  7 +++----
 hw/xen/xen_pt.c      |  7 +++----
 include/hw/pci/pci.h |  3 +++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..8a87ccc8b0 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1116,6 +1116,21 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
     return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
 }
 
+uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
+{
+    return bus->slot_reserved_mask;
+}
+
+void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+{
+    bus->slot_reserved_mask |= mask;
+}
+
+void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+{
+    bus->slot_reserved_mask &= ~mask;
+}
+
 /* -1 for devfn means auto assign */
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                                          const char *name, int devfn,
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index a25e951f9d..eae7589462 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -31,7 +31,6 @@
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/sabre.h"
@@ -608,9 +607,9 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
        reserved (leaving no slots free after on-board devices) however slots
        0-3 are free on busB */
-    pci_bus->slot_reserved_mask = 0xfffffffc;
-    pci_busA->slot_reserved_mask = 0xfffffff1;
-    pci_busB->slot_reserved_mask = 0xfffffff0;
+    pci_bus_set_slot_reserved_mask(pci_bus, 0xfffffffc);
+    pci_bus_set_slot_reserved_mask(pci_busA, 0xfffffff1);
+    pci_bus_set_slot_reserved_mask(pci_busB, 0xfffffff0);
 
     ebus = pci_new_multifunction(PCI_DEVFN(1, 0), true, TYPE_EBUS);
     qdev_prop_set_uint64(DEVICE(ebus), "console-serial-base",
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 2d33d178ad..a540149639 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -57,7 +57,6 @@
 #include <sys/ioctl.h>
 
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "xen_pt.h"
@@ -951,7 +950,7 @@ void xen_igd_reserve_slot(PCIBus *pci_bus)
     }
 
     XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
-    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
+    pci_bus_set_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
 }
 
 static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
@@ -971,7 +970,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         return;
     }
 
-    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK)) {
+    if (!(pci_bus_get_slot_reserved_mask(pci_bus) & XEN_PCI_IGD_SLOT_MASK)) {
         xpdc->pci_qdev_realize(qdev, errp);
         return;
     }
@@ -982,7 +981,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         s->real_device.dev == XEN_PCI_IGD_DEV &&
         s->real_device.func == XEN_PCI_IGD_FN &&
         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
-        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        pci_bus_clear_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
         XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
     }
     xpdc->pci_qdev_realize(qdev, errp);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d5a40cd058..935b4b91b4 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -287,6 +287,9 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
 void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
 void pci_bus_irqs_cleanup(PCIBus *bus);
 int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
+uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
+void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
+void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
 /* 0 <= pin <= 3 0 = INTA, 1 = INTB, 2 = INTC, 3 = INTD */
 static inline int pci_swizzle(int slot, int pin)
 {
-- 
2.39.2


