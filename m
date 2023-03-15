Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386236BA693
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 06:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509894.786594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJSc-0006Oe-WB; Wed, 15 Mar 2023 05:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509894.786594; Wed, 15 Mar 2023 05:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcJSc-0006KG-Re; Wed, 15 Mar 2023 05:14:02 +0000
Received: by outflank-mailman (input) for mailman id 509894;
 Wed, 15 Mar 2023 05:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=unbF=7H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pcJSb-00061o-Jm
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 05:14:01 +0000
Received: from sonic316-8.consmr.mail.gq1.yahoo.com
 (sonic316-8.consmr.mail.gq1.yahoo.com [98.137.69.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ffbba38-c2f0-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 06:13:58 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 15 Mar 2023 05:13:56 +0000
Received: by hermes--production-ne1-759c9b8c64-f7wvp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 96a4225277b909cacfff2106b7580bc2; 
 Wed, 15 Mar 2023 05:13:55 +0000 (UTC)
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
X-Inumbo-ID: 2ffbba38-c2f0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678857236; bh=Q0XT1QQYOz5Utc07CCwIzZ4mh2OSgk2Itg/6nDFk02o=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=DBLkXR5qItNdj7IB5Mocib0e7lnRUTJV4h8pFUhfzy/PGBJVbbravppO8dWn0xAf8LI4SKP8GMbU9tCHlOHtrG57N/QnydzQpTnI1IHzKXOU+owmYfxhIIN9l/tr5YhwJ05SDs22tlHcAPMHjD2QxlBfV/B9zM4KZR4p4OFKO2cZzH4WfJnI3gOQAIB7koeby5UDTUNCDfjLcx/kGX0SKkJqFPedZU4JHPbwzGbYKnbnxiMhx60sD/GisOW5g4/4ozrvNky/d4wyh+nVDrtSn4PoUWwF14077b0gKq3JEnHbR6l2v/Aj6rUIOcUx2OSgWbC+uI6FhaHbIoQf7fiajQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678857236; bh=ShaupOz04ZK/Avyjra5SI9Y1u94kMyAAUosDFXRSnkh=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=r8SaCtP5TR1E7vT3HnwSi5f+K4DJkygL7N06d+BhNYnHVhbLHOGnn+Iep2Izw7CHCetm15K8K4nldqc00LltXz/hSgx7ybMW6kTfyu4LbV7T7QsbzSYOcjFGXX4n3kRjTbb+MVQXlL7qNLjmnl2Mb+3umG8k4re+0rqtWN2FSxMjolIQrJsbQAQItmzxVc0GNBafQtyBvPWKDBVatKAMOyJ26rz13r7O+H8ooJSiq+rITxMyo9+CCwbOj5gcmJCQhwy/Ldqr5IKRiqQuUOVHuocdCqfWrIbIVsnoQT4kQEzIQEluf7Fo8Hprh74l5ZNqx9ik7CkeKebVqlFCXyokqQ==
X-YMail-OSG: tt9De90VM1nUtWI7MldM0UB64dhKT41tuhOByewHdnowbRAJvnWEBQImhJesqqP
 MhtLE9jTK.8jLBWTbNKtQ0IOnB5Nh_Ku3ANawmC2lVFtw4BvVmbMrQ6fmum5g3NfhLSVlOs3DHpa
 1MaDpJdnCpdsMfg2bx6uc3F9zUOByVDxO6e9.DdY6lA0Z8yI9qBml2DX6wfLH4jfd6hsM1mx4klp
 _hPGPs.TvFxB4SjucORCM4ldt4VMD1CF81cDsyLSmxMpLlCnAa5awSxwoNSN1sChPNiagqFSvLjB
 4hHdw_JF7d.YTuOkhjHONUqqwLyry_t76fNYAsfminVbKIDZi3YeIMlkMlDEQL06XqGVjl1k.mP4
 KpfZgdzVIqd8l3ygrKWB.UrfBnc6dteDpj4XWwvEUL88ZRT52u5WouG6eiWD5A5pGYDk8UXmPYkJ
 N9.gIyYnq9j4Ez.cKicTuQBNYWO3V7qPfEp1GGSRR98RzkV66YYTMWHkqnyjcxxHTP8OtMTIdV1f
 qxTcCrPj.3hDnisJ2.GKb6R3MmHBe88llvpZV.vkzrswx_ldMcPb.fd8MvIRBDGVldfYJppvi9Qo
 oWqS1fso__RGuLvju.ccbhzPAVJqbV5oa7WOd1Yood6SqFZxj6r1uk.wtOJlwfwtaPn7GmhNM41G
 qO3FO9ESIN4F1bN6nl7dN1GtSYtlk3e0LnjMG2hKBmPFOcHr7Gw4YxyeET4nYQGsPqOsOsAUk5JA
 mdAIo6C5G.ZXDBbN9gCp9qL0vkElXHBp3jbkdpqHaioalfM7kQmyJqvmknBraTHzwnf7TxxbeE_H
 d4UYtqTI7z5wsEeOVSy396wahsLb5rSUcTchUbLtRLX8klaAegD2WfdQKT9PdR_oV3CfPy8Ywt97
 V0lxNOQsrRd8UuvPTPUlPRZCZlD7V_qb909lyE.wL6We4aazlglWpVM1Kr_4oOtTeuaFR0JxlYxo
 5xHJn.zocITBiSWjIWSSiZEWPCloQ8Ai1273fx3zYhtilvQoA9O986.mV5gAIT9mZn.ZGbIWo01M
 yAiJCq6zOk2zba7l6ScNyWSMA1cb4QExivWVp61vve99o961hVWoiO2CA6fIRKGoh71lMrZxRGK1
 iIMvVH6boObeIWU.diLBYHRLuPLv2fzVke1VQmwiIC4K4kcjyCGe82lRNQR_ue9CPjw1sdjAe_bm
 jNyJzCVnPephmcu.eBBr_nRUR6pGT1FoaimsfHLnHN2JZIUADjYSRNHk.rEsDpNt8lCgb7oKFlyp
 JxsZdEqJxm_qbHk_dRdeJStSUw1KUPFBJ95IcROrUJukGYtonoFkMz244uwmpcXPyXnKRGolt3uz
 nBGbUyDh6SiS_NPBPp1KTFtYYOelfq7jJp6pfPnEhnEDNenpLbCaXFjoYT0ix.VJu3U1dRGR6BKF
 rtzLx2jq8_8NOP3_pbGaWyvBjUtu1Vz7VKSRonPPAdyCx0.6vnzSbMN2UwLOJogorZomBzfdi1D7
 5Y5v0tHahTibUxugIkKCuTjnXCCL0cGhLXpRraB7ZTDvbZU21uhsuqN6ipPAvr..9axbURvk3uoO
 NSRbQZ1ExrV3phc8iwrKvEiE3pmhhztRonFDdAJiICrWH_ZU71r_UX11alQ3XATb1DRPgAtjM1.T
 NGWLRxtG4nGkUU3Fa5na.ENVfmpKkYSFTJqv0QxFIdPqTPrEq0SkgGc3GiA4gPugZi5fknpF8NQ9
 J5RxZOenAW_qFOFH1xZJC6R0x66MjIItavB864hw._E3Ioehg.S3Mo1xUt78cQtqNiWdtf8e24gX
 3rnUb.iCv9vpIECwatG.6lRy2rgwZVYGvpJvPnlsldtvPLjnx_W7zsM6djHBQnHa5LgR2hIhDNOO
 nlBi2oZxeeVE3qGusEaOx8mb5VtXP7hWYpYZV8S0W7zPHPeeqC1tRnoAMVDeDl5MjXVChhBrdUGy
 v.wN13JKJ2WEpjxPaooABi1m16Y.ni7HaUReVrfRvh_An0xT2OzG6xzYPJN2Cuul6xa0RFtF.75B
 26LXkjsrAcwf8fvj2.6yNs1kpowaUfP8AaK6nenscsZZLe5cpCMF5vEKTbVBHk_yN3DpbMswnPbg
 8mZIHmFhX.EG1Q1MRfEMpRf6PmTrBBiCsgL6UyvtlNX4Bg132WuNPagcvqF4ldYQOnEQPVAD1u60
 eP4vxb8Esa0A7sPlBH9UDN12BC9inlytBuwa4ZhNhdhlVJBFu9PKjmkdWRVcZ0HhQ6sYtLEQW8ZX
 uVjAufQ--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 0cbd98fc-95bc-4a4a-85f8-c2c3b598fe02
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
Subject: [PATCH v3 2/2] pci: introduce slot_reserved_auto_mask and slot_reserved_manual_mask
Date: Wed, 15 Mar 2023 01:13:42 -0400
Message-Id: <a98d9394aca40f4c47567169f1483ceb56cbaa0d.1678851637.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678851637.git.brchuckz@aol.com>
References: <cover.1678851637.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
uses slot_reserved_mask to reserve slot 2 for the Intel igd for the
xenfv machine when the guest is configured for igd-passthru.

Prior to that commit, a single 32-bit mask was sufficient to meet the
needs of the only machine that used the 32-bit slot_reserved_mask, the
sun4u machine. However, the requirements of the xenfv machine with
igd-passthru is somewhat different from the requirements of the sun4u
machine.

First, the sun4u machine reserves slots in such a way that no device
can be assigned to a reserved slot, but the xenfv machine needs to
reserve a single slot that is reserved for a particular device, the
Intel igd. The necessary logic to ensure that the reserved slot is used
by the Intel igd was recently added by the aforementioned commit.

Second, it is useful to limit slot reservation in the case of the xenfv
machine with the Intel igd to devices configured for automatic slot
assignment so an administrator can assign a device to the reserved slot
by manually specifying the reserved slot address on the command line,
but the sun4u machine requires slot reservation for all devices, whether
or not the device is configured for automatic slot assignment or
configured manually by specifying a slot address on the command line. In
other words, for the sun4u machine, the required behavior is that an
attempt to assign a reserved slot to a device must always result in an
error, but it is useful to allow manual assignment of a reserved slot to
succeed for the xenfv machine with the Intel igd.

The necessary logic to implement the desired behavior of reserving one
or more slots only for the case of automatic slot allocation has not yet
been implemented, and that is the purpose of this patch.

The implementation is simple: the xenfv machine only sets
slot_reserved_auto_mask and the sun4u machine sets both
slot_reserved_manual_mask and slot_reserved_auto_mask. A single
"set" accessor function allows xenfv and sun4u machines to set the
value of the two masks appropriately for each use case.

Since the xenfv machine needs to implement additional logic to detect
the Intel igd and clear the bit in the mask to allow a particular device
to use the reserved slot, there is a need for a "get" and "clear" accessor
function for slot_reserved_auto_mask, but these accessor functions are
not needed for slot_reserved_manual_mask because the sun4u machine has
no need to get the value of the mask or clear bits in the mask.

Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changelog

v3: Change Subject of patch from
    "pci: allow slot_reserved_mask to be ignored with manual slot assignment" To
    "pci: introduce slot_reserved_auto_mask and slot_reserved_manual_mask"
    
    Substantially reword the commit message to clearly explain the reasons
    this patch is needed

    Apply changes in response to comments on v2:
       - slot_reserved_mask -> slot_reserved_auto_mask
       - remove enforce_slot_reserved_mask_manual
       - remove pci_bus_ignore_slot_reserved_mask_manual
       - add slot_reserved_manual_mask
       - pci_bus_devfn_reserved -> pci_bus_devfn_reserved_auto
       - change code in pci_bus_devfn_reserved_manual appropriately
       - pci_bus_set_slot_reserved_mask -> pci_bus_set_slot_reserved_masks
           - use renamed "set" function to set value of both masks for sun4u and xenfv cases
       - pci_bus_get_slot_reserved_mask -> pci_bus_get_slot_reserved_auto_mask
       - pci_bus_clear_slot_reserved_mask -> pci_bus_clear_slot_reserved_auto_mask

v2: Change Subject of patch from
    "pci: add enforce_slot_reserved_mask_manual property" To
    "pci: allow slot_reserved_mask to be ignored with manual slot assignment"

    Add pci_bus_ignore_slot_reserved_mask_manual function

    Call pci_bus_ignore_slot_reserved_mask_manual at appropriate place
    in hw/pci-host/i440fx.c

 hw/pci/pci.c             | 29 ++++++++++++++++++-----------
 hw/sparc64/sun4u.c       |  6 +++---
 hw/xen/xen_pt.c          |  6 +++---
 include/hw/pci/pci.h     |  6 +++---
 include/hw/pci/pci_bus.h |  3 ++-
 5 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8a87ccc8b0..58a530a651 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -500,7 +500,8 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
 {
     assert(PCI_FUNC(devfn_min) == 0);
     bus->devfn_min = devfn_min;
-    bus->slot_reserved_mask = 0x0;
+    bus->slot_reserved_auto_mask = 0x0;
+    bus->slot_reserved_manual_mask = 0x0;
     bus->address_space_mem = address_space_mem;
     bus->address_space_io = address_space_io;
     bus->flags |= PCI_BUS_IS_ROOT;
@@ -1111,24 +1112,30 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
     return !(bus->devices[devfn]);
 }
 
-static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
+static bool pci_bus_devfn_reserved_auto(PCIBus *bus, int devfn)
 {
-    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
+    return bus->slot_reserved_auto_mask & (1UL << PCI_SLOT(devfn));
 }
 
-uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
+static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
 {
-    return bus->slot_reserved_mask;
+    return bus->slot_reserved_manual_mask & (1UL << PCI_SLOT(devfn));
 }
 
-void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+void pci_bus_set_slot_reserved_masks(PCIBus *bus, uint32_t auto_mask, uint32_t manual_mask)
 {
-    bus->slot_reserved_mask |= mask;
+    bus->slot_reserved_auto_mask |= auto_mask;
+    bus->slot_reserved_manual_mask |= manual_mask;
 }
 
-void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+void pci_bus_clear_slot_reserved_auto_mask(PCIBus *bus, uint32_t mask)
 {
-    bus->slot_reserved_mask &= ~mask;
+    bus->slot_reserved_auto_mask &= ~mask;
+}
+
+uint32_t pci_bus_get_slot_reserved_auto_mask(PCIBus *bus)
+{
+    return bus->slot_reserved_auto_mask;
 }
 
 /* -1 for devfn means auto assign */
@@ -1156,7 +1163,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
         for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
             devfn += PCI_FUNC_MAX) {
             if (pci_bus_devfn_available(bus, devfn) &&
-                   !pci_bus_devfn_reserved(bus, devfn)) {
+                   !pci_bus_devfn_reserved_auto(bus, devfn)) {
                 goto found;
             }
         }
@@ -1164,7 +1171,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                    "or reserved", name);
         return NULL;
     found: ;
-    } else if (pci_bus_devfn_reserved(bus, devfn)) {
+    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
         error_setg(errp, "PCI: slot %d function %d not available for %s,"
                    " reserved",
                    PCI_SLOT(devfn), PCI_FUNC(devfn), name);
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index eae7589462..21ab12f6f7 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -607,9 +607,9 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
        reserved (leaving no slots free after on-board devices) however slots
        0-3 are free on busB */
-    pci_bus_set_slot_reserved_mask(pci_bus, 0xfffffffc);
-    pci_bus_set_slot_reserved_mask(pci_busA, 0xfffffff1);
-    pci_bus_set_slot_reserved_mask(pci_busB, 0xfffffff0);
+    pci_bus_set_slot_reserved_masks(pci_bus, 0xfffffffc, 0xfffffffc);
+    pci_bus_set_slot_reserved_masks(pci_busA, 0xfffffff1, 0xfffffff1);
+    pci_bus_set_slot_reserved_masks(pci_busB, 0xfffffff0, 0xfffffff0);
 
     ebus = pci_new_multifunction(PCI_DEVFN(1, 0), true, TYPE_EBUS);
     qdev_prop_set_uint64(DEVICE(ebus), "console-serial-base",
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index a540149639..3d3290ec02 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -950,7 +950,7 @@ void xen_igd_reserve_slot(PCIBus *pci_bus)
     }
 
     XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
-    pci_bus_set_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
+    pci_bus_set_slot_reserved_masks(pci_bus, XEN_PCI_IGD_SLOT_MASK, 0x0);
 }
 
 static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
@@ -970,7 +970,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         return;
     }
 
-    if (!(pci_bus_get_slot_reserved_mask(pci_bus) & XEN_PCI_IGD_SLOT_MASK)) {
+    if (!(pci_bus_get_slot_reserved_auto_mask(pci_bus) & XEN_PCI_IGD_SLOT_MASK)) {
         xpdc->pci_qdev_realize(qdev, errp);
         return;
     }
@@ -981,7 +981,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         s->real_device.dev == XEN_PCI_IGD_DEV &&
         s->real_device.func == XEN_PCI_IGD_FN &&
         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
-        pci_bus_clear_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
+        pci_bus_clear_slot_reserved_auto_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
         XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
     }
     xpdc->pci_qdev_realize(qdev, errp);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 935b4b91b4..7e941e1c87 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -287,9 +287,9 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
 void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
 void pci_bus_irqs_cleanup(PCIBus *bus);
 int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
-uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
-void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
-void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
+uint32_t pci_bus_get_slot_reserved_auto_mask(PCIBus *bus);
+void pci_bus_set_slot_reserved_masks(PCIBus *bus, uint32_t auto_mask, uint32_t manual_mask);
+void pci_bus_clear_slot_reserved_auto_mask(PCIBus *bus, uint32_t mask);
 /* 0 <= pin <= 3 0 = INTA, 1 = INTB, 2 = INTC, 3 = INTD */
 static inline int pci_swizzle(int slot, int pin)
 {
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 5653175957..3c2b3b8e32 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -36,7 +36,8 @@ struct PCIBus {
     PCIIOMMUFunc iommu_fn;
     void *iommu_opaque;
     uint8_t devfn_min;
-    uint32_t slot_reserved_mask;
+    uint32_t slot_reserved_auto_mask;
+    uint32_t slot_reserved_manual_mask;
     pci_set_irq_fn set_irq;
     pci_map_irq_fn map_irq;
     pci_route_irq_fn route_intx_to_irq;
-- 
2.39.2


