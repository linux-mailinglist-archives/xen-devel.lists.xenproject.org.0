Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACB6639B9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 08:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474296.735392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF8kn-0001Bb-EC; Tue, 10 Jan 2023 07:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474296.735392; Tue, 10 Jan 2023 07:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF8kn-00018i-9M; Tue, 10 Jan 2023 07:09:01 +0000
Received: by outflank-mailman (input) for mailman id 474296;
 Tue, 10 Jan 2023 07:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF8kl-00018Z-DL
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 07:08:59 +0000
Received: from sonic308-54.consmr.mail.gq1.yahoo.com
 (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4412fec-90b5-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 08:08:55 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 07:08:52 +0000
Received: by hermes--production-bf1-5458f64d4-c7wsl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 685679c689afdd034d61b58b257d2b66; 
 Tue, 10 Jan 2023 07:08:46 +0000 (UTC)
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
X-Inumbo-ID: a4412fec-90b5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673334532; bh=KuWJYIFENPkHWbAOvcCiwKQm/Xx2ED603nRvGGU94Ig=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=FfPNwFdGlr/JEBG8LpuBgUR4pP8x+J1GCalVPRus3zAXJ/rwTVkg37O6Kn+NzOKHI2SJZNmWkvellckj/KKyJUpdfPfK9otQkVlrfk145vWBo6GAGZGdFHIRP/sOEDOcaCPh3cRTyPEjyz2uvTaKk6K1/BaVzQ2scp0mmTkWPgatVjd6MBRDwuRABCwmUKZ5GJKfk96WV5Dz7jHzzqES1a+OOEMSDk5y5BOEfuq9t0F5sUZcEeK9cZMD2doH16ZArmU1Wwhfmron0ZD8zj1xmF2YHsL8h2PUa1htGxwYReH1J4CZVKCWA3r/RT/jp+WCjWwRWxhnO1231PRL6sNSZg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673334532; bh=mFeK+N6el/Uveabs+Ic/qDm85kO91cY93TU7fteohwD=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=osFbjclQ98zHsNwWrC1Bz6Nh6SexcWqDziCA/ShandMHF4rrNpq3Inq9uWI7LyM7pSSXzyyl6q5NB8xDtWw3j+H3Dwdib3PblkO6ojjJMXlc06Mh1tmMUXGRDFD7YsNsc5JPEvvD7/Kr9KrwKWZjBnqQQGieict1a3oYvLx57q78YAj8DibvAbzHhWDN7N0YrZgWUtJUWSR0/iAta8qH/grdMw0tL3PT7xkAUok07Lixg2jPHNqX9LGqXc5ZWIUN9nky7O61WopPRYlMo0juKRNGZ+ttDrLiZc6dF1OChLGkc+XRuDshLeyjLcGBL5LFoH8gpHBMmfbas7WjUB1aGQ==
X-YMail-OSG: auhjzb0VM1lZiBqxL1p4B_eR6C.6nYduSpSAXeEvBtNl8ew1jZGRz95R8kj8pls
 9xgM65wpRxnoWwSI6HDcFsDfsXdrVeMw1fmxMsC0AmOn9TQItZEnUgjkls0s0Qv.LiHsm2bBX8pz
 TDzC7lAP00xw8nH66NZff0j3xqarkzzu7oc8JQ7YV9H3wuQM5diQGw8HQUHSm_dNjF9wSpVb1Nq5
 lNlNG4dP3_k0wnpoCqd0_j1GgN.IDqShVvHh5H5zwhG9L6NnN0VWACekknFxmRaN0G5a2xQUTUqS
 31GiJrOPibgImZVyUjosrtwPlmpCcI3zAA.65IgKCLsTOCiB64F2tlBJkWl_1Rs2EEJYhWwYF8SE
 wpFnRDC3_dMxB6ZwEH8yZ1g2iJkH6oDL2tkFZp6hHUWJvmeceCvyTxfNaawHamYmWHnFadSvDOwf
 KVcLDd8R3paNgn0LLYbTLrP_hbgkWACQr1f3RnRYkgUvDExolWL.qKiEwWhc4mz0wXG2IIly_3A6
 XmV3y2._jv7dqJj7FbCCUG1DIVtWVNohiDS4l8N4B5ch.e5dg3OPnscNYAinKppGSFrX884fkeoC
 8iQFgtVddi.ouLH6T5SLQPFcZhnvEVYACibIAS8uC1kXGvQG_O._kqaJS1diNTKTuZ3yh1DiGxdH
 b_18wOvyG64g1TzIIavhtpn4h6mStbRxGEoEEW3IAH_Wzgh3w5e2LV8Vtag055d6iV4WNGAooQuE
 fEeTvUldgA9NRbRW7_aVZoreyg.TnONatnU9X1IM9NTFq5UJsz1MMIIoGHS4xZil8BxXk0Fbdf3X
 uUAj54gJ7saOi9F9O93R4sJOzaj9UGMDZ5XeLe8uLNXUB_DfUA01HOFb3s7emhtK0rXfPivrI5ng
 d738G7pu_3A9.OLydaUK6e3xYnn0GFfvFX11LiWemqkdEtykcntZO_RXHJUsJxZvtXRJv1u54wle
 fpgFepNLmA5_UEFmnz3MCKuIL0DYUKwyAaKGVBB2i0putP_WKGwudYTt7MI9Y_Xt5470NpzMT0lI
 HubRWwWMRlFUejLzDJNJtcaVGrhtnNAOgkVbx6XvzHNaiL4hNWTTzrG3aTSO.J7Z1MhIlm4T4gc8
 mJiJ7kaJRYYqBuvI9bmYqTape4Q9F3dXgaGbCsys7rkCnMvicbSUt4zg5zS3Ybf.qgTw3dT0NWSh
 k2kUjA1SOTJt_AKVQHnkdw57xvhkeFj0yh492_6.CKfgBiPvnoOZmCEKbH6I_45Bj3neS2Vmr.x9
 NeuNA8qn3fy1vBm6bpaIkd6x_UMYrt438Ycq84Idiako5Z9sBVBxCXpu9PFBz9GofbUfly9Qau6j
 ZmqqS6DydwxoVN7OTP5o5w49x1Hk7zgXBbrg8b_.NN1qZll9.lGOOg5DkCtyDYyeR2L0vUE8CcNf
 kUUTVNLkFJoNOVQTuSjuyBc3lOmjG9cKkURTFh7V1OappEVlG19e4keOBv9cWt2BCdxw5PdoIRF1
 kmfIlIVD7IAX1h9yLaMpOpZmGsgO8G2FG57AWE4SPpiFNuFjIRunrSkzaLRcaJN6C41lMghvkgPa
 6nc73Tuf3KeZ_DhuchzjzlgNOQ1n451L1W01x91w9qd6veBKAtfPOaLzqEq6I9Yxv26KAfNlfY8Z
 zkdh5TBU0aTozVjyfGY_PqcPmYtM8BB6zGJ6Dn0NSwnUcmiQV5bTcO4I8mez1ADbghF1HstKMbl3
 xD3DyCC1kiEkeLyl2OWis96F4K7GdaXPTsdsi8KbxnwYmLaABRGENqVxXAbKQFHu8M9U_8bFYKFN
 ES7iNEOj0YT2WeFnV3Jou.MjHk4fkFAq4sUWnbAVt0jo4UX_CTkixWHV853ka_LUqi2jizlzO0WK
 oROCiEKyZhdItFZfXcyTPCbprX5pPJvwg1jeHwgNZTejDuaX9DX37Sh1yvGAYkmYJ66D7txwzhyg
 He7Oo7xZTHdjE43RGFC3wTzfXkQ_QKiaihsOEURKAOriCcWwVXYAFL9BlHr84hPUertLTPvdM4Vm
 ezEnZg30S.wRB1gT1MmWRmfbla9q_NfnTvVrj11lfJRPz3E9b7PxLp9bcTxDLSOCvnokDoKqtgT3
 uD.LMgR.AUhZJDdYTSAfEAprMeqXdz9E_7R1KZIippQJKCVs9_65mclJw1pocO2S9KqPKkXyCOm0
 hgYcSVrtK9Vsl8TKFe_Rjs9qfV_XHooxoXQZfCYmOSoRg.3Ff5Jc2Hza1jebssXD2qr2uXFWnTu9
 It0QAUUZFUg--
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Tue, 10 Jan 2023 02:08:34 -0500
Message-Id: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>

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

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/xen_pt.c      | 49 ++++++++++++++++++++++++++++++++++++--------
 hw/xen/xen_pt.h      | 16 +++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 4 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b48047f50c..bc5efa4f59 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
     }
 
     pc_xen_hvm_init_pci(machine);
+    if (xen_igd_gfx_pt_enabled()) {
+        xen_igd_reserve_slot(pcms->bus);
+    }
     pci_create_simple(pcms->bus, -1, "xen-platform");
 }
 #endif
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..eff38155ef 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
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
@@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Object *obj)
     PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
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
+        s->real_device.domain == 0 && s->real_device.bus == 0 &&
+        s->real_device.dev == 2 && s->real_device.func == 0 &&
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
@@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_size = sizeof(XenPCIPassthroughState),
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
+    .class_size = sizeof(XenPTDeviceClass),
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index cf10fc7bbf..8c25932b4b 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -2,6 +2,7 @@
 #define XEN_PT_H
 
 #include "hw/xen/xen_common.h"
+#include "hw/pci/pci_bus.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
@@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
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
@@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
 
 #define XEN_PCI_INTEL_OPREGION 0xfc
 
+#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
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


