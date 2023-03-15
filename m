Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F76BB5F0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 15:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510084.787151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcS5a-0005OV-9T; Wed, 15 Mar 2023 14:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510084.787151; Wed, 15 Mar 2023 14:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcS5a-0005MF-5Y; Wed, 15 Mar 2023 14:26:50 +0000
Received: by outflank-mailman (input) for mailman id 510084;
 Wed, 15 Mar 2023 14:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=unbF=7H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pcS5Y-0004WZ-JU
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 14:26:48 +0000
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6969c0bd-c33d-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 15:26:46 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Wed, 15 Mar 2023 14:26:44 +0000
Received: by hermes--production-bf1-777648578f-gg2qh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 60044a03c62ff9d9db8c181d26f4f55f; 
 Wed, 15 Mar 2023 14:26:39 +0000 (UTC)
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
X-Inumbo-ID: 6969c0bd-c33d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678890404; bh=Ca+KKFwJ0KdgZWsUXX/B0MDs5o4euAP6c75jaBfjDug=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=fPJoGa8rwvuRLtguFIDgH52v2n3xQVZyLN1+jEBNe96PlRJ7Ts5FJrDimJvpMrkAeCusnpEwP4YE4svXTAkvkPs+C3iCALBfE4QZFzy40YTxhqkMiYtgy/VHY6V+rukmMuPdwvl3IbChMIdGZFFXf8AFLkn+ZLgBhH134cBksd2U0iXUw+Er44JUAHsT0ZzTIfAUyEkFWu+1S2j4K0CF8e9V03gasoi5f0qKb2RbpArL3JCEgqbmEwF0lulzmQZKOd+saGOI8c/KaeH1RJ39on4KYF+LbsOI56Tauca6H/e5WAmzF6s+OWIY8SFNjSCCEDSuKNTLzo5kT4kR6WzxVQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678890404; bh=/gC+Bih04/ukPqCG4N79CLQAsu8eUfDR2HTQLVkxP5j=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=KtCY/TEii8vRgNj6VKVc4DMq+/FqR6gpEF9OPNq8bBo00zcnSQtXP0W5fqEsEOmmse+kZmwxZZ18HYeiZ8Hp6h5cTjU1gp9s+ED5Z1N2EDeJPGkn2fHkOV60QivOG03XykoqxRKDFjNTLDD5f0KKwAGUT7+JLvrniFO6yOF9487lRMf06O/mlUC5LX64c4idW3RtCVLpFfVoILrA9kQi2KEomBcoMOn2mKUtO8/S+pEMRUR7WzXwG59sF+evubYPQtjRiXnGqpiJBx+X18gys8DsAFpWEVKZ5VEikH4iz+0XQgTbzSIIaJsLhfu44SSwNcRxjD0tqQrmnF9QhufGvQ==
X-YMail-OSG: av6waTEVM1mM7u3FHKOq7bvHfs1oIFwOve.U2Om83wqFoIOfOyKSqPdXIRjAEZ8
 mJHqh8JblRTRbu9GnrmU1PZ2uli.MYwkz7Su.F3lmNrlti1ABr520.A72uuD9pq4Kd.R1R5VRTOX
 8_IIzen3n7fy6tsM7QbUs9dqyJl089C753BJMPNo5S_xUEqTz..EE0ctmjMvPMCkED_1YisRQFSm
 usnVCU4R.7GkT4DjoWeokZYRDcysVeudlaPK7tjRUE0fV7bgs_2VuvCAnBlCJA0KFEhs9_JqC9NL
 u8AjJYX_dAfGC93jyh7nhrg3j6yNkR6f8S.0plEIPVWxz1QVQC5OUfhfknWVUABS6bZqsaXewcL3
 nFJ08_be9sKdzMP2Q6P5x80ucsYcl.kgNBYZAnlrWo1.8u2qWoQzJOvk9Yt85kEsdQ92eAhXd8cq
 .6mnbwwvwcoQucQydEUpv09jXqDwsKNV_GOm_XQq92BUi.N63XE1rPuX_ke3S3tX9agAmJH28HmC
 YVhGTiMhw06BE5cYX4er8Q77Bex2caPY9cI4Vjw0Vo2ae5QhY2LGt6x96mKJFpDSe3lyoJsldyRf
 aIBywhRlGYzFSS0dT5rJET1Xh5ykod5fkUs5KZX9HKHGMmcMxXj2Lq8gYSVNPDbUKxWEeNf7oNG1
 wcFNqW9QMhbAjhF64ZCCMU2m1iA3qrD4vZHCyt8zs2SYRME3UAdf9udvDrk4Tr..MQbQmiuKFtjo
 FQhFWF5R_HOMHahIeLxaNktwbNLbPhm0vbfrbQDY9ukV_C6YVvGIVrHZ.fB6k9jgVduCjcyI.iH.
 xhZeAWiI_mE7ARIBGMIficU0m3b1ov2_3t3L3tlxuB8gfgfpNHhXE1O4zpZGCqJu5Lv.McCfRVG2
 lu6uZTt2IlD0k9b5Pew8pwQN5Vu27T2Z7jE59JunXcClYu9GoGkPBhOh2zojRrfP_ysWz5Xwr2Vm
 GigXBi7gAr8JEM2ZBaI_4YX0Lbl3iZaLMBCGZqX.8m_a410YAWkeAM1f1bqxcHBloCGN3cziDj3r
 lvB6p0Lbu9QBwfLCBznS_wMM3DoH59.0NjCzn.LI7b8xG68ceu0i7Qj5jj.tSRKCpLVOWPNdtsb1
 x0KoA6Gz.KpZVt2dE2t0UnHQRJDuQslas8mBGwD4xWdVRvHdGug6DFmD26LvZBPMKBDShwDwGI4e
 MJiIyo.DdOeXrt7NT_dVYIVtjwZFoZTDMsTC9SCchkPNZxHoHm8S8zOjgf6MgGIsO8VbC.c7MPGl
 l8zd5h_0PGxUBYr4Lu.BPDisQEdQpVAaUS8WUpK8gr.zuGV68K7vDtpNz6V3d5t4bGellu7.CNve
 HN7gndbfnjE6uIMLAIXt1JrYaPc12eWF0XfiGK8cLDqPcPOCF41vHnjaItc935wLvfk63xX115a4
 1jcXk13N9iHd7Lx2I7jj.iJh3mBnlkAs5kURe5.GVXBt5otjUBV5JFAeqaYUU4HFrk4x6MvH92eu
 Mm52LQ35dGTb2E98VorpcVCgpkcxIJ3jpx_wHTpTkpKBhE6eOqZMDzXQDVmZhfJpswUHZykxe2iP
 MLOOjp0vohBw_WlYCrS6ekdD5QU0AC0WITj22e971cU7Et1mo_p3OGuEipUdMkq40n5M_vw1JSIq
 236bWq9cWgBhCE1K.N5p0K5HFo4FIGNJ9mSbRcVNja47jS1GCSRDLg2CUBdPnHwE4YRuhQIwWDwt
 d2EexOOC_30YO8e2vaZdND7obny1fz2uUlLmeIGNU8gxHM1xMDIfDvFjcxjEGZM_li8hdEI9.g_8
 mR14lkYdKWfT0gEvUGgcnH0dsefd08yDlQHL_0Xx7K8h3y9nRMM81QFtGIB8BnrX0hHSEL7EHhmL
 0CYVfWyvj0ishPUsqM8UqiT575xBVKVyBN41r5SKKbfdUNCarZIsDam1kbI0t2jnIyEBkP.K05hz
 xxQeCGvYVFi6gbJub3FGPPGR_Zp9iJn9OnB5nelC6ul1AUbfwqIi_M7k7SbnsZmYLOWJNw0baUml
 hYmZJgYj2whhzvU1_ZYL8oP9P8mqbG4.DeimnVbexBXPb3wyKNQ576A82RwFIANk0caR3vOHJWEJ
 YgYEBCJIB.tLb162LBX5lNisv.bnPXRBP9qeP701hDUpa8.2_j6IyIpAF5QIJ8zXe8WdY__bMoIK
 76gUdCHHoGhG1rvCrdl1b5Uqd2Px_7HddJ5kJEkr2cSAWhwUG.WgLDlp3kWeMcDuhPG3HLnweU1M
 iln37MWw-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 747eaab4-cd4e-430a-955a-e1359176afc9
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
Subject: [PATCH v4 2/2] pci: introduce slot_reserved_auto_mask and slot_reserved_manual_mask
Date: Wed, 15 Mar 2023 10:26:20 -0400
Message-Id: <c35f865c9bec15ad9da65c97696a7cc5a2949d99.1678888385.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678888385.git.brchuckz@aol.com>
References: <cover.1678888385.git.brchuckz@aol.com>
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

v4: Style corrections, 3 lines in v3 were too long:

    1. In hw/pci/pci.c:

void pci_bus_set_slot_reserved_masks(PCIBus *bus, uint32_t auto_mask, uint32_t manual_mask)

is changed to

void pci_bus_set_slot_reserved_masks(PCIBus *bus, uint32_t auto_mask,
                                     uint32_t manual_mask)
...
    2. In hw/xen/xen_pt.c:

    if (!(pci_bus_get_slot_reserved_auto_mask(pci_bus) & XEN_PCI_IGD_SLOT_MASK)) {

is changed to

    if (!(pci_bus_get_slot_reserved_auto_mask(pci_bus) &
          XEN_PCI_IGD_SLOT_MASK)) {
...
    3. In include/hw/pci/pci.h:

void pci_bus_set_slot_reserved_masks(PCIBus *bus, uint32_t auto_mask, uint32_t manual_mask);

is changed to

void pci_bus_set_slot_reserved_masks(PCIBus *, uint32_t, uint32_t);

    No other changes since v3

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

 hw/pci/pci.c             | 30 +++++++++++++++++++-----------
 hw/sparc64/sun4u.c       |  6 +++---
 hw/xen/xen_pt.c          |  7 ++++---
 include/hw/pci/pci.h     |  6 +++---
 include/hw/pci/pci_bus.h |  3 ++-
 5 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8a87ccc8b0..606adda9da 100644
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
@@ -1111,24 +1112,31 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
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
+void pci_bus_set_slot_reserved_masks(PCIBus *bus, uint32_t auto_mask,
+                                     uint32_t manual_mask)
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
@@ -1156,7 +1164,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
         for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
             devfn += PCI_FUNC_MAX) {
             if (pci_bus_devfn_available(bus, devfn) &&
-                   !pci_bus_devfn_reserved(bus, devfn)) {
+                   !pci_bus_devfn_reserved_auto(bus, devfn)) {
                 goto found;
             }
         }
@@ -1164,7 +1172,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
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
index a540149639..106972647d 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -950,7 +950,7 @@ void xen_igd_reserve_slot(PCIBus *pci_bus)
     }
 
     XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
-    pci_bus_set_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
+    pci_bus_set_slot_reserved_masks(pci_bus, XEN_PCI_IGD_SLOT_MASK, 0x0);
 }
 
 static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
@@ -970,7 +970,8 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         return;
     }
 
-    if (!(pci_bus_get_slot_reserved_mask(pci_bus) & XEN_PCI_IGD_SLOT_MASK)) {
+    if (!(pci_bus_get_slot_reserved_auto_mask(pci_bus) &
+          XEN_PCI_IGD_SLOT_MASK)) {
         xpdc->pci_qdev_realize(qdev, errp);
         return;
     }
@@ -981,7 +982,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         s->real_device.dev == XEN_PCI_IGD_DEV &&
         s->real_device.func == XEN_PCI_IGD_FN &&
         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
-        pci_bus_clear_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
+        pci_bus_clear_slot_reserved_auto_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
         XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
     }
     xpdc->pci_qdev_realize(qdev, errp);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 935b4b91b4..226007407c 100644
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
+void pci_bus_set_slot_reserved_masks(PCIBus *, uint32_t, uint32_t);
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


