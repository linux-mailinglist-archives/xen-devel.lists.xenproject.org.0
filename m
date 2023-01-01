Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8350865ABB0
	for <lists+xen-devel@lfdr.de>; Sun,  1 Jan 2023 22:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470142.729584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC5m0-0000ds-0K; Sun, 01 Jan 2023 21:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470142.729584; Sun, 01 Jan 2023 21:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC5lz-0000aR-TZ; Sun, 01 Jan 2023 21:21:39 +0000
Received: by outflank-mailman (input) for mailman id 470142;
 Sun, 01 Jan 2023 21:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fqzy=46=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pC5ly-0000aL-Fz
 for xen-devel@lists.xenproject.org; Sun, 01 Jan 2023 21:21:38 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 442f083c-8a1a-11ed-91b6-6bf2151ebd3b;
 Sun, 01 Jan 2023 22:21:35 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Sun, 1 Jan 2023 21:21:32 +0000
Received: by hermes--production-ne1-7b69748c4d-srx4j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7f437a9e58cf454b53c47f515b720546; 
 Sun, 01 Jan 2023 21:21:29 +0000 (UTC)
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
X-Inumbo-ID: 442f083c-8a1a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672608092; bh=S30WlSSONBXrZ2BF/FPFcCpOU+QISMNJ7oj/4DgswUw=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Huz+R3UeJtZmUYPS++HCKp2ESoNmFKrmWAcdYeqlOq+dRVqpqkYdvgICTnBinTh/dRLch50n7vvbSkhd12SZmXpbS0c8T7LIbqW/ktfVg8+bXzjixBE6oqYDTA/IOss1pDkGI3dWZ3lM6kPwZicZsXDcewuJTv3F9NHbkhBBAq4XEuKrhyi9Po4ky6BSXMhS39sB1zVMJuTc2iBhhsUoWiZsy2ahpDYQBiiMzXRancv9G748+pecZ9crI99U8rSa21F/HQvA2vt83sry8DjGjUfRGuqbCoNxKY65TAzFD/WSQWlkhwlEHY+nUp8YwhlLd3jsiM9V7Wz/usxcabYL8A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672608092; bh=r/yy/ZKK2KArZy546ewlwnBrVacT2a5OP52yPzVlDHf=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BZ8kVUKyjl0/D637pX9LdAwQLGWUyx1Q1Rya1KgL9hMZ2lzfN+ScNMcqRf0+KMnqrdF0RNmJE+Tion5D5o3fMFk3Jd9yzg/qU7HW7wL790Koq/QVmp5HvJpcX0dxoYCYsXSnSg7aW2poRvnqTVDho648mxNKq1y8z5vhg/45lAC/L4koJIM2lXNR/aWFU1WYJ433qOl6gkj1gNng54mXmVW7+LnNoE9kpaXSzWMlOCqr+Iwo1LS1DtDp0TcJLxJNuQCSaPHsmL/aHcSTi5S6FBvxulTKX3yKVnZOjZXUbGQP/xUJ6ax8sY2mMVGB8Mzmp62G2voIMd/rQsjSaMZc8w==
X-YMail-OSG: BCDhSkMVM1mJ85S6opULzSNIPRuCztzSVruPbT59egn165AIS3i4QGYt35uPTCW
 IFT99kYLyRzdwTdlnXJBSdu2It0yYWn30BgoBX9eOATBQzzQw00KmDvoEUM1ws66tauVgglfktd1
 r0kOUE7DOiR2IjzZsD1GR_ECFHFZgUbtDj5WSz4p2zj_UWU3uVUhiHPAgY3QjoI9rtC2FLNR93am
 HT3wHtfk6GKw8Z1j1My01aYii8r87DXcE5EQjsFzkW6Tww_MAN5VauXBD5aevzoVnxWWQGszeujY
 RhU_B5oMVW5Nfh0F7TgpXwjK2CGb3W6fhbLn4cOMKqEq2_ivNBiM9SRCpYce4lS6IjntD6P7PaA9
 VX1KJuR7DdegHeawktOLhkkSUh6tyKTHE4wjskptrL3pDx1uK0Om0yrDBp9UjNw.Os2cWKreVWYp
 0HZ66r8GpypWmMzwfcbjy4LFE3NmU821lW7q2m3yZm9d_zPI2p9gsgfqV5gCLoXgYk5CWYr_JHPz
 94djlnqQg6WV8gykzmtdCDqIbJ1DR_WtqskzE5Kj8_vSqylU76TPOb90b3MEf2agpKCoJjamGEZp
 0fNdOzocqgy7dpQ9yxdg2tyZ2EJxglsFEEqy763054_w9.Y2dOvDu.lQ21s4offltFJoVrpQdhsA
 wgAf4R7nKH2YPULO_KbPZFWzUMd0sbOZ.Maj5jYRI1FVEnYN4CXisDGZ_b7f5X.fM5tALYbHvrDu
 7BPk93JqRZqvSF.Iy_oDD8CCfM6mS3gIQCWkzfCOtuwD.wsRs6QwLs3HwVxsWHLB2Hp2BHt81M9o
 xQleAZsfBsYfwxvISvluAxQLiNFGk8ObZhlWo5YHQBxOdsQeQNTpKlDrseyLDfsCxZjp5UDCD2ZE
 apRBWRistAxqb7fSXQYu00SaVvA22.6jOAdR_k.cZV05hiCCJquABK7fbq8cC0BdIQM1Cb9MAjOc
 Ie8KelimQWjpLNgXXyQNayPx20cxycoPFnVDLyWb5c1ejiTpsU0twNib5bkhwV3O.Y4HBYfJXuiW
 b5Xk6MILzaGpKWQXzp3ikPhZZ0_p9.0tpVIKOuSVb.88HKfml6ce_d6WbnEurcYx7g_46uHIW2ds
 creTYERfYLhlJYrVPZ_7lUdRuy6YQYADzatmuvunUQrUXJbHefe8lnYNLDcpjsFPrcQNWmoUfkk9
 wFHId_F3SFnNlU_P.lJ2tKVEGSYSa6cXFW4GmpvUEFYiTnWp3G8c2nGzrWY.2fODXt.TaqT7y3QU
 lgDexhh8zApNRgeVGttwNuhGrHS_NtRI4FDDjqBphr6DhULPZvaxkjoSRtsEU6wbgUpoEKN.PYPk
 qtScsOWYuq0UwCSSaj8PuqJ1oCgkbwvIGTNrPY27gFmPT.yDC1eHvftq_WbWyQMaEwe_BuS.D5VP
 DwNhMrVXDrQ6Ud6ITstP2DbaW46cTe6mZ3VmKxBEuO.QFGk45rHK1KENvG4JbbJIei4e2fIS0bOP
 0qFVnPIvEMNwMr.WHY1UiMid4RfpcInzp_xGUCu3M7rcsN4BAwBMg0IffrYSLMpZXosmU8B3rCRf
 5WEAu7NR5RZyoT8y_1dv.QUS_HnORYznYi90nZSAs4_VXnn5EJSUwfEA74qVBxmATzKqowxKBuks
 M9dGV3WuclyKjjgDDrtSqp6bjx4VW_H2_1MwIL5Edz49Xu5OgAZvsbuvmecEiuEe.eJ9gnJi0kfb
 r01pauFVeLNt5QyAR3l5_0KTsfManc_QvHFHtHn_3EWZNO1TfaCxWw4eFmGHxZKuAckbHGla45_2
 9FUTfHHnlaEU6DaYvxPAg3dbemMOAIVrjGiJXnOmp9PFs6Lg.76ZO2QtSDf_I.1JrtWHajLWis9K
 4eD8xPir6V8us9OVw1HjQ1lpTTtOTg4TfBQsMFZcJeMoRYpZwTGvthnHpHC_7jIy8act2pbb9gEq
 G92QNc9i5gLkgQVgFHMJEXFAJWI_lhp7aya9EW4gyIFNNZv8LQ9NzdjA9udyJqFgpbpEmV8g.0ho
 mn34igxj9coaUmrtMnSrOo5gRjOuj.3FH8L_wzhNtP.wc7UYvsCCouFMlPNgUzwlUV8ejC2tc.nh
 Rf2lNwl.YX4ipLaeOqmmwEkvG9.oEPGoyfPAUq49ZX1sfy12cl9UVoj_gSP7jtZEJYCWZ_gS0KTb
 nnAo7wYwNxh68MhnbZX_UR_DZCY9XBcyLYdmcHGgdbWVIz0eRjg4q6Jn1iIt8FJCVpTJlA_O.Zov
 Bgcc-
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
Subject: [PATCH v5] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Sun,  1 Jan 2023 16:21:19 -0500
Message-Id: <f600368591f6fafea4b00e1c5205782052e43ddb.1672605633.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <f600368591f6fafea4b00e1c5205782052e43ddb.1672605633.git.brchuckz.ref@aol.com>

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

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/xen_pt.c      | 56 +++++++++++++++++++++++++++++++++-----------
 hw/xen/xen_pt.h      | 16 +++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 4 files changed, 65 insertions(+), 14 deletions(-)

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
index 0ec7e52183..7e54500b27 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -775,20 +775,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
     int pirq = XEN_PT_UNASSIGNED_PIRQ;
 
     /* register real device */
-    XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
-               " to devfn 0x%x\n",
-               s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
-               s->dev.devfn);
-
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
@@ -950,11 +936,52 @@ static void xen_pci_passthrough_instance_init(Object *obj)
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
+    XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
+               " to devfn 0x%x\n",
+               s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
+               s->dev.devfn);
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
@@ -977,6 +1004,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_size = sizeof(XenPCIPassthroughState),
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
+    .class_size = sizeof(XenPTDeviceClass),
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index e7c4316a7d..40b31b5263 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -3,6 +3,7 @@
 
 #include "hw/xen/xen_common.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
@@ -41,7 +42,20 @@ typedef struct XenPTReg XenPTReg;
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
@@ -76,6 +90,8 @@ typedef int (*xen_pt_conf_byte_read)
 
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


