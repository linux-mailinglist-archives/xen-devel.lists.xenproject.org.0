Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5B66A976
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 06:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477619.740404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGZGl-0006AF-NB; Sat, 14 Jan 2023 05:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477619.740404; Sat, 14 Jan 2023 05:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGZGl-00067l-JP; Sat, 14 Jan 2023 05:39:55 +0000
Received: by outflank-mailman (input) for mailman id 477619;
 Sat, 14 Jan 2023 05:39:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NrQy=5L=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pGZGk-00067f-0Q
 for xen-devel@lists.xenproject.org; Sat, 14 Jan 2023 05:39:54 +0000
Received: from sonic315-8.consmr.mail.gq1.yahoo.com
 (sonic315-8.consmr.mail.gq1.yahoo.com [98.137.65.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db5ad0c2-93cd-11ed-b8d0-410ff93cb8f0;
 Sat, 14 Jan 2023 06:39:49 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Sat, 14 Jan 2023 05:39:46 +0000
Received: by hermes--production-bf1-6cb45cc684-d52fx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e8ce94261cee09d281f8d4a72d11a3b7; 
 Sat, 14 Jan 2023 05:39:42 +0000 (UTC)
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
X-Inumbo-ID: db5ad0c2-93cd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673674786; bh=fctXFxmPmvHl4ulPv84zQrc4Ivg9P7AFLuODVVW/rdk=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=b7W0uH6un0yOLgTNt97OhiZUDt/IOL9GIr4X3Jq1N4zoagvcrnGCDjf1BislWyXHzNBxj/tkIVkaDnoCBUvHK09n9haV1Dj6ugbD6qLyfSLisFRmZ4CJiSF6/jaskkPCUVyib1HoiQuMoesF3sPgMxzEaqXGDO17Ox1sHepEuI9C0QA4bGTezriPB8dc89SSeeyvTk0e/pXN+sgyrVh79DUHhQFRd/R9JlvDWfRJt4UMcNLx+wYEOr9qIrZl5bUeFpX4GUkf0oEIkheg7+6KeE/epfYFXZUoA3Xk+47V+X5MMkZiDlV7eI8pMG/GZ/prJzxjqld7rTAQXiiXeJDczQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673674786; bh=mmQMEU5nLF0uI4t9I+YwJMas/ozl1uhjPpILUl0PQMv=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=CDDIprPawkZiOl6Wz+GP5q015lnWdDHUAGYcwxEBlyu/CiERkyprVGg7wLL348pG7y/O3W+Xtcqk3JCbzDFMKBESNYHYit8pWSX1Ao1gB8hAE3+ZZ+t8mYTpapUnWgrkY82ncL7YHj/JBcgdSl25Ms0tpfptqjLjQ6fqO9gAS6DMYQQGXMIMFTcMupkpXmGr4IkcOvfci2wMHBbLGGQgc2MeMiocpnSegtSk8rMfHXVABYv9u/e7I/WN0+acCJQS+VBCr2XFg02c7m3zNEQGekzdOR5WoTH9ooCcoSrZdSpGTRiFBo0ag3ey3kvFJuB0ya/VUsYANSQTcD1wKNPdYA==
X-YMail-OSG: sPAqr20VM1luqqhoVH3alx6THea5G6EII4F4KXQ0LVqbMC.DWXDa4ns72JaSohr
 r7rx6yKV2wWJxvLkD.v06xx7ty0Qv3oKO1lNlheg5y15EWcr3Exim8tAImnXDIcnE4B3QrFr2eGI
 RYD2XIATlZ3ZENANq7LopNBlANo3kqDoCm3zoFCRIO5TR.wpGxYSen1CNzTUxRoE2w.N8R6WtMfV
 fcQBK40JH1ugakSO8w0TsjAXXXXk2mLdlm.5qKyQAVL1igKoArzAmL1D.pGbaFArlr.ICl4t2W2S
 yyK88ohfg_fJnjhqP0NTPQNhANEZqXmfv9VcUsHia5t1RScKpSRvtTumJ44CfVk7QNNG_W.aIJUw
 h09IqnjNZy2YdeFdjNr.q64wNpvaJE79AHhzcASk1ya1K831BpvQ6ef7bjyWeXyR.8iKS6jXPSTh
 usSTsVYqdAvK5EnagljD8h94IYhdNhzaSVeycg9NVcD9uNLJDX8Mzs9VsRbFPRGuaJcP0.YgAGc6
 pOvq8QqJPzn8uglCYG4r_s50Ez_xBvPPU3a_ArsGtV2EHcFtV9y.Rh6X7p1gabMBQpYU8xM2Bj4t
 07fYWm3cgoGC.BHdOyBh7FvvDF2xkDImXRGXoTxS2zGdCQYu0fOqDCqZRTZsMhd5gQ75icpuCvvo
 7ZTsrmnSkou5tOVqGHYVaPbsZYg49oX9hyakx03oaN_l8w_JiMqmOh32ZwgzOxKL9mJACppVge9Y
 QIUbLnmaTgddP2AQ3dUDldR.ePDlOdK1fYb_NPRHRRsi9rDFwcHFulb3z2VTc6mJpWrNK0VoJefq
 WVGRNk.rPwWcoBx8lcFhpVmb_4VJxq.DTCz5ivAn5hx6aggRJB2tJQDXhZ_yI86K1XfdFcddibY3
 xT8k7PKfOjiuBQyvwsDJc22d24wqCT4W3TVXXf2PyZkQN8xnerG2UcDrJFR5bYy36KrZ7Ddc61TC
 NIH4VE1G8k0Ugs6VjHlmXg5w4.UibTPFxB1o56J5502OO5D3IylBlLOx6uCBsUREcDxCAWoenyDW
 rfqQOzvcWzjhNLW1dr7nlfy9bwfCu_p_XqGqjDkZScofzdwsSYe7NsAiomCwr1K9qjlWqXVgH7ui
 eJXcPzGyfGevY92Pq4BPcMvROatTE2EcNy2yKeL11P04MkXcsPTrv8vQJcoHv.__4Fv9j.J2hbsm
 Nrn3nRmRXXeAsJeGwOZ96v83Lx6V1aZpvXEfiJp_4b8sXYpdtX5Sk_xlSO1FVMgTkmksX79LYWvG
 s82Xz636dVFghOwZ3TcP7tj42vz.z9AoZC8uFwO0Wz4ZdbUc3DjE54pNMEGxoRIrtz7_vXacs47i
 Vaq5mYIdR57YqjgaTWHDCkk7B2Qm.r.J7KDNkYx6QIrOvFZpMeSmqrw2JExb.MYElQn9cJW8shbw
 Y83bC2jt9CB3FaT6Q6ikGSbXNbxDCZKjaWEM96zwT3837i5dZ.XcumQHnqGINk0_NNMhM8ktHXF.
 kXoauTq_UivYNG_zxVmrPOoR_YSbA1FCYBVM2MM_ZDfPGe2zppLQz18jBbm.rvrPAbcQkRo8asFd
 EPh8g8VOFHEvb.wcGyShlAWIZHz2_I_xs8v6dQoqYlRtUhv941KkMorkGAFR8KVKhfKv0ofuJ3Yv
 KJYZbDHUSL7.Vj_hRbhQQZ45ZepbanFirOeyR.FoRg6UUMwcOEHzgBGGmt06dMXgCRFQwibhn3N2
 D2NzRNs5t1ZOL7KXPXCTVU0FBI5gUjVfiFs_Wut9ISaQUfNG7sXty4mg3TDs2EU522iAfLnBH3jC
 w6umtO0djPMd6Hw8L3y81UwmfaNGZkIE909GI.y7pA7AzsZqLyRtNfhkMMd1Iu33NMGPMTIq9Uns
 IXfSttbbrT5_jXJxCIj.LYgsfyyYgP3a97fHQKKV8drzPV14UNxj35aXbfU1P03zmVqvDrb0aS_3
 FIHuepK7XItTku_d6ZNqfGWl4XSit44I3zLeoeQi1zMvEBxic5WrQEIcPWnoVu29S0g4u8dYOVp0
 9opgoPWM6bPC9MyDQchu8hV2Np2r9pA3uiMesPB2p0X4SAakl3IHHon_3uYJtW4LChLgIzHqiwpu
 xSWBRylujlniIUrYH05I.XBMZc82fcwLzxOnjYaXBDU.1Waj38YVK4mk81ox.ZFnI23PLMPR_pz8
 O3DZZq7K3KKmZOz6nYPZmJxLX9PIpDYCHtnJazw_xINQUc.UVbfC_.GWhUazpt2n2lPVMNFyX7c9
 eFwjGCvI4VNPpNg--
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-stable@nongnu.org
Subject: [PATCH v9] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Sat, 14 Jan 2023 00:39:33 -0500
Message-Id: <974c616b8632f1d7ca3917f8143d8cebf946a55c.1673672956.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <974c616b8632f1d7ca3917f8143d8cebf946a55c.1673672956.git.brchuckz.ref@aol.com>

Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
as noted in docs/igd-assign.txt in the Qemu source code.

Currently, when the xl toolstack is used to configure a Xen HVM guest with
Intel IGD passthrough to the guest with the Qemu upstream device model,
a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
a different slot. This problem often prevents the guest from booting.

The only available workaround is not good: Configure Xen HVM guests to use
the old and no longer maintained Qemu traditional device model available
from xenbits.xen.org which does reserve slot 2 for the Intel IGD.

To implement this feature in the Qemu upstream device model for Xen HVM
guests, introduce the following new functions, types, and macros:

* XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
* XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
* typedef XenPTQdevRealize function pointer
* XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
* xen_igd_reserve_slot and xen_igd_clear_slot functions

Michael Tsirkin:
* Introduce XEN_PCI_IGD_DOMAIN, XEN_PCI_IGD_BUS, XEN_PCI_IGD_DEV, and
  XEN_PCI_IGD_FN - use them to compute the value of XEN_PCI_IGD_SLOT_MASK

The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
the xl toolstack with the gfx_passthru option enabled, which sets the
igd-passthru=on option to Qemu for the Xen HVM machine type.

The new xen_igd_reserve_slot function also needs to be implemented in
hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
in which case it does nothing.

The new xen_igd_clear_slot function overrides qdev->realize of the parent
PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
created in hw/i386/pc_piix.c for the case when igd-passthru=on.

Move the call to xen_host_pci_device_get, and the associated error
handling, from xen_pt_realize to the new xen_igd_clear_slot function to
initialize the device class and vendor values which enables the checks for
the Intel IGD to succeed. The verification that the host device is an
Intel IGD to be passed through is done by checking the domain, bus, slot,
and function values as well as by checking that gfx_passthru is enabled,
the device class is VGA, and the device vendor in Intel.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Notes that might be helpful to reviewers of patched code in hw/xen:

The new functions and types are based on recommendations from Qemu docs:
https://qemu.readthedocs.io/en/latest/devel/qom.html

Notes that might be helpful to reviewers of patched code in hw/i386:

The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
not affect builds that do not have CONFIG_XEN defined.

xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
existing function that is only true when Qemu is built with
xen-pci-passthrough enabled and the administrator has configured the Xen
HVM guest with Qemu's igd-passthru=on option.

v2: Remove From: <email address> tag at top of commit message

v3: Changed the test for the Intel IGD in xen_igd_clear_slot:

    if (is_igd_vga_passthrough(&s->real_device) &&
        (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {

    is changed to

    if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
        && (s->hostaddr.function == 0)) {

    I hoped that I could use the test in v2, since it matches the
    other tests for the Intel IGD in Qemu and Xen, but those tests
    do not work because the necessary data structures are not set with
    their values yet. So instead use the test that the administrator
    has enabled gfx_passthru and the device address on the host is
    02.0. This test does detect the Intel IGD correctly.

v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
    email address to match the address used by the same author in commits
    be9c61da and c0e86b76
    
    Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc

v5: The patch of xen_pt.c was re-worked to allow a more consistent test
    for the Intel IGD that uses the same criteria as in other places.
    This involved moving the call to xen_host_pci_device_get from
    xen_pt_realize to xen_igd_clear_slot and updating the checks for the
    Intel IGD in xen_igd_clear_slot:
    
    if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
        && (s->hostaddr.function == 0)) {

    is changed to

    if (is_igd_vga_passthrough(&s->real_device) &&
        s->real_device.domain == 0 && s->real_device.bus == 0 &&
        s->real_device.dev == 2 && s->real_device.func == 0 &&
        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {

    Added an explanation for the move of xen_host_pci_device_get from
    xen_pt_realize to xen_igd_clear_slot to the commit message.

    Rebase.

v6: Fix logging by removing these lines from the move from xen_pt_realize
    to xen_igd_clear_slot that was done in v5:

    XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
               " to devfn 0x%x\n",
               s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
               s->dev.devfn);

    This log needs to be in xen_pt_realize because s->dev.devfn is not
    set yet in xen_igd_clear_slot.

v7: The v7 that was posted to the mailing list was incorrect. v8 is what
    v7 was intended to be.

v8: Inhibit out of context log message and needless processing by
    adding 2 lines at the top of the new xen_igd_clear_slot function:

    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
        return;

    Rebase. This removed an unnecessary header file from xen_pt.h 

v9: Move check for xen_igd_gfx_pt_enabled() from pc_piix.c to xen_pt.c

    Move #include "hw/pci/pci_bus.h" from xen_pt.h to xen_pt.c

    Introduce macros for the IGD devfn constants and use them to compute
    the value of XEN_PCI_IGD_SLOT_MASK

    Also use the new macros at an appropriate place in xen_pt_realize

    Add Cc: to stable - This has been broken for a long time, ever since
                        support for igd-passthru was added to Qemu 7
                        years ago.

    Mention new macros in the commit message (Michael Tsirkin)

    N.B.: I could not follow the suggestion to move the statement
    pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK; to after
    pci_qdev_realize for symmetry. Doing that results in an error when
    creating the guest:
    
    libxl: error: libxl_qmp.c:1837:qmp_ev_parse_error_messages: Domain 4:PCI: slot 2 function 0 not available for xen-pci-passthrough, reserved
    libxl: error: libxl_pci.c:1809:device_pci_add_done: Domain 4:libxl__device_pci_add failed for PCI device 0:0:2.0 (rc -28)
    libxl: error: libxl_create.c:1921:domcreate_attach_devices: Domain 4:unable to add pci devices

 hw/i386/pc_piix.c    |  1 +
 hw/xen/xen_pt.c      | 61 ++++++++++++++++++++++++++++++++++++--------
 hw/xen/xen_pt.h      | 20 +++++++++++++++
 hw/xen/xen_pt_stub.c |  4 +++
 4 files changed, 75 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b48047f50c..8fc96eb63b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -405,6 +405,7 @@ static void pc_xen_hvm_init(MachineState *machine)
     }
 
     pc_xen_hvm_init_pci(machine);
+    xen_igd_reserve_slot(pcms->bus);
     pci_create_simple(pcms->bus, -1, "xen-platform");
 }
 #endif
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..51f100f64a 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -57,6 +57,7 @@
 #include <sys/ioctl.h>
 
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/xen/xen.h"
@@ -780,15 +781,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
                s->dev.devfn);
 
-    xen_host_pci_device_get(&s->real_device,
-                            s->hostaddr.domain, s->hostaddr.bus,
-                            s->hostaddr.slot, s->hostaddr.function,
-                            errp);
-    if (*errp) {
-        error_append_hint(errp, "Failed to \"open\" the real pci device");
-        return;
-    }
-
     s->is_virtfn = s->real_device.is_virtfn;
     if (s->is_virtfn) {
         XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
@@ -803,8 +795,10 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
     s->io_listener = xen_pt_io_listener;
 
     /* Setup VGA bios for passthrough GFX */
-    if ((s->real_device.domain == 0) && (s->real_device.bus == 0) &&
-        (s->real_device.dev == 2) && (s->real_device.func == 0)) {
+    if ((s->real_device.domain == XEN_PCI_IGD_DOMAIN) &&
+        (s->real_device.bus == XEN_PCI_IGD_BUS) &&
+        (s->real_device.dev == XEN_PCI_IGD_DEV) &&
+        (s->real_device.func == XEN_PCI_IGD_FN)) {
         if (!is_igd_vga_passthrough(&s->real_device)) {
             error_setg(errp, "Need to enable igd-passthru if you're trying"
                     " to passthrough IGD GFX");
@@ -950,11 +944,55 @@ static void xen_pci_passthrough_instance_init(Object *obj)
     PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+    if (!xen_igd_gfx_pt_enabled())
+        return;
+
+    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
+    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
+}
+
+static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
+{
+    ERRP_GUARD();
+    PCIDevice *pci_dev = (PCIDevice *)qdev;
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
+    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
+        return;
+
+    xen_host_pci_device_get(&s->real_device,
+                            s->hostaddr.domain, s->hostaddr.bus,
+                            s->hostaddr.slot, s->hostaddr.function,
+                            errp);
+    if (*errp) {
+        error_append_hint(errp, "Failed to \"open\" the real pci device");
+        return;
+    }
+
+    if (is_igd_vga_passthrough(&s->real_device) &&
+        s->real_device.domain == XEN_PCI_IGD_DOMAIN &&
+        s->real_device.bus == XEN_PCI_IGD_BUS &&
+        s->real_device.dev == XEN_PCI_IGD_DEV &&
+        s->real_device.func == XEN_PCI_IGD_FN &&
+        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
+        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
+    }
+    xpdc->pci_qdev_realize(qdev, errp);
+}
+
 static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
+    xpdc->pci_qdev_realize = dc->realize;
+    dc->realize = xen_igd_clear_slot;
     k->realize = xen_pt_realize;
     k->exit = xen_pt_unregister_device;
     k->config_read = xen_pt_pci_read_config;
@@ -977,6 +1015,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_size = sizeof(XenPCIPassthroughState),
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
+    .class_size = sizeof(XenPTDeviceClass),
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index cf10fc7bbf..e184699740 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -40,7 +40,20 @@ typedef struct XenPTReg XenPTReg;
 #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
 OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
+#define XEN_PT_DEVICE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
+#define XEN_PT_DEVICE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
+
+typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
+
+typedef struct XenPTDeviceClass {
+    PCIDeviceClass parent_class;
+    XenPTQdevRealize pci_qdev_realize;
+} XenPTDeviceClass;
+
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
+void xen_igd_reserve_slot(PCIBus *pci_bus);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
                                            XenHostPCIDevice *dev);
@@ -75,6 +88,13 @@ typedef int (*xen_pt_conf_byte_read)
 
 #define XEN_PCI_INTEL_OPREGION 0xfc
 
+#define XEN_PCI_IGD_DOMAIN 0
+#define XEN_PCI_IGD_BUS 0
+#define XEN_PCI_IGD_DEV 2
+#define XEN_PCI_IGD_FN 0
+#define XEN_PCI_IGD_SLOT_MASK \
+    (1UL << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
+
 typedef enum {
     XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
     XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
index 2d8cac8d54..5c108446a8 100644
--- a/hw/xen/xen_pt_stub.c
+++ b/hw/xen/xen_pt_stub.c
@@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
         error_setg(errp, "Xen PCI passthrough support not built in");
     }
 }
+
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+}
-- 
2.39.0


