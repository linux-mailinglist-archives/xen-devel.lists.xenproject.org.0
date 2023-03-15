Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D0E6BA691
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 06:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509892.786578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJSb-00064m-CD; Wed, 15 Mar 2023 05:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509892.786578; Wed, 15 Mar 2023 05:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJSb-00061z-8w; Wed, 15 Mar 2023 05:14:01 +0000
Received: by outflank-mailman (input) for mailman id 509892;
 Wed, 15 Mar 2023 05:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=unbF=7H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pcJSZ-00061o-UW
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 05:14:00 +0000
Received: from sonic317-22.consmr.mail.gq1.yahoo.com
 (sonic317-22.consmr.mail.gq1.yahoo.com [98.137.66.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f016344-c2f0-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 06:13:57 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Wed, 15 Mar 2023 05:13:54 +0000
Received: by hermes--production-ne1-759c9b8c64-f7wvp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 96a4225277b909cacfff2106b7580bc2; 
 Wed, 15 Mar 2023 05:13:53 +0000 (UTC)
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
X-Inumbo-ID: 2f016344-c2f0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678857234; bh=F9KsY+/Y90uQDNeE4eLqItY5YwC2xDwyG1hbbTr85xo=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=p9YN7VqyjmOukFXlxyruJtleNDUkqxs9Ql4dKEl/w3Xplp137dMgCEw4IuDDlmmSqK8emkSURKxPoEQtyqv0yOAaZF71IGcnOrjr4eAEcU4u4O2YuI9MFyHQ6wSTfDY0Y4Rt8zWYzl8T4vYmhifovZ6qZ4M9PUrwxnAYQe5a+ppWLspoOPebWEss3NTZP37t+7A8VIBR3gke7luGZoMmi5fqI8z2SgW5H9ILJR1eADiQbXfLfzAZUkmSBhaiaFMuWWE7GnjlA+b8nkcStgP8hk+9+NZLF+Ua9EUpJOSPPSMWIJVew9n5toBsgZogaTmTWCQFtyjeOVbq1hb7kmuIXg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678857234; bh=r66pmpen/CDgyOZ0u5YeD2OIwCo+4rRYWxBwfRhi7/n=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=cDhoq4Wbjc/vkgk1EjUsQEAJ27X3kavm0dSdaHlun/2GuLeMizlDkvVz0Lc6gEEi+KtuwJ60j2K77Km/23gDgJlAVKTgcSF0rl8jqVvY+16ZeGgfy+ifvVl9CSV1E/87uIfGUx4Uqak7ZuevYvBmjYJx7T9L0HGsAZgPpLEQCoIzau/wXU0vqd8W9+iFUJfFtmhoSxOSZEkwb4NPa0jtd+jp0ucgORLIQIsEFnHHToahXR0CAnCELchpAFQda0+UXBc1HdmH3FGPD19+j+O3ohx7WxQXLTY+m+gFJusPAcnB4iVgiKD6EFTdPMfGckU9wJ0IiA2Xg7nUEfqCbJhyyw==
X-YMail-OSG: lIWPx_cVM1lwlWKEVRdW7zVGbIDet8pd3jLPX208cXjeuk3Anj7SHy.6mEfwHuo
 To.XPZeLR2_bXM_LSlJTOp9SKqsfti2mKeB32WFPvTNm5jo8oI_hCA0tiXzglGu4wqHofq9swbur
 7dbfjy2EFRST6ekk66HdYwBF_FruKszuj7ufQbwBayGAPg8BrCRulPRcPT.T4mF22kSdrn.1Bk.D
 2RNYj86Qt7dpzAXvR5HzbdXAxgcuKWoUzlikHGLw_0U73B_e2NCUDMGvPhRKGBBp2YhY9jhTWq68
 MsIZ0rJVFBhgpQcvTWztlt_NpakWngoPXoh1be3XY17qjlwigKv66HedvgABM5CbPz1X0xT5NQYY
 8oFDgqNuLJ9ZPDRrR5PyrLlDsuFv8T1Z60E8rfScw5NRyQScQUOHzCE_5NZc8Ik9ey9pMKjKEZrN
 4U37S79B4V_Tkq16FdEdCidc690y81FoZY3IltoKE3Qw8TIR4o7bXwArc5Lu0z3u9FY2wM5q4wBB
 MMy9pd3zPvn9fWSmSY0bDsymVZXwYnxxTTpxAMn28pKRxeOQqxYW9MpdEmMIJGyeXlu5GDNUy8LJ
 y9wg3eerF9.oT7AtSwl8nr76acm0.EoalFnt7zyLzu3DTy1YUJCZdWyLwXfFdK0HcraXkzY12R0B
 npLgUbAxWr0.nJqaTpuooCuoRe.TnrzjYT_SKRr0eat3w0sJm5XdHun887IDcUuZw35hgCTQkS_R
 7W9XiPBsQruCvzgMw9SWWJqMlYguuiKqagyQ3FcX0VcO8IzGt9GLxH0p1xPEWI0Ve6egW_kPiorK
 v5AH61CH1kvkT1_HaX27GUGu.OCcDB62EAJHd.dwhF2QpjSExm2E46QiKW0MXZzSdgP7cP9bevMo
 THyPe82juLEoaErUFH3I81RPIhNBCPkWolNdZp8cqi1KoV0v47WAWdCrV387PZFZHmiB0AQNQ95W
 NsHFWwOVY9Fq.N4Qz2bv5l9QXWjivXo6xvFna34Uas6QxyHesnEiytJFa6GpTVYECgQVbGfgR.fG
 SLAsRp0l99ggLT6wpVwht2P3vA9EwTZvl4XlkJtYL9GNfnY7G_DadRdWKZztJbVNKOjZ61srBn7t
 _ZYWK.Xer.g4elJagbXYMQgcyhnuzCZO4wmB.8XO..CcRV0BWJrFdKqbSsFBSKQq.fQqdS4RQfcw
 0XV6pK6Elh7IkIQQ_ysO8DkNVMN659Pe0VijUsLrBiTZBsGkE0ITdxPHnowcyuJBYfEYJJJQ6W.R
 5WGPnyn2KlU5RWCNTIBWDaHLWi.Pv77n4JuzozagXZ8u7S4B.ZjlnxqvqR6KGops6IQQ.9mO2Ljq
 Hh4fZBH7BasLoQ_rGGWEHfWas1x3xElg4_ZKtqCwZ0jixPh6Sfu3bQc4PYxCvlE2GBudxi3s6v7O
 eiwff8zXxXTuvVkx5_qj5g0rjE37vr9BGJSaY3Imp7ebYts.nhS39_uZb.RCXlejSTD6FdXh0FMH
 Xp6Nx2Y6RaUPtcTWENOu4uMBFcGOSoLYx2tR4hOvOjOK_8nRQbLiOdoyEEGepgfp7V60X3cjfbLA
 gZMAxeyArSPRqOzqTiGVDvvPM_JlzuI2jDjRsLhKy9NhPPJCQEavCJeZ0nzJccW6fXj1Cl3Rz339
 dfL8fP3ybyGwS6fCi3SgVMdxLiIlM9iDoBDqQ8j_.LfjRe_QrmycDspFAA1q9NLkoh2As6u3_zyz
 39i9COVZZxC0i.e_VVsopEPNVFejpLtbfX6JWYxdMwjqSwGMItEsw5M0noE48A_MyCV03TdrSOeH
 QXlJNNjxsqJVAOiiqjuXkZE.HV8oSJArMtWIww5G.KEleiqFuW9dVaxD64pNDbKJmXJj34bePwDH
 6rnO2NON3C0zWAwUW2DZNDGrzGftal42FFUE.LobDR14dT7xV0UVdyocB7H.IoWqdSDcKbPOrkEY
 vMsK6g9JLYC.A6c6BzNYtBwfst.C8Y0pKrX6U_EvLUK4q9c.teaDveYv9wsB1BQduH18VzPtd0Yi
 5L3vaqAIJaxohI9gKWSHYwlv7Fspz78j6KulLp0owLk_VVKCmSrx9l3o1g5ruG4STSfx08RqZDYB
 uPxD6T33NnJbFmNxEk.xKuY2JlCu33xjZ7OiH97Gv1ygY8vDyCMsXLPc5F0JInt4qrFPoARm9jWq
 iEgiuF7j8spVmHUjJsERwh7NFAewkbowpxLbLnPs5Nf3rK87wVandTFMSUn42xWy5EtqeRm.gAZm
 _
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: ed68d27d-d92f-4969-a28c-6b51268c4f58
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
Subject: [PATCH v3 1/2] pci: avoid accessing slot_reserved_mask directly outside of pci.c
Date: Wed, 15 Mar 2023 01:13:41 -0400
Message-Id: <df167a18d1302d55d805ece9f24f59a72dfed95a.1678851637.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678851637.git.brchuckz@aol.com>
References: <cover.1678851637.git.brchuckz@aol.com>
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
Changelog

v3: This patch is unchanged since v2.

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


