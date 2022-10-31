Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C90613FFF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 22:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433215.686123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcSB-0006i0-F5; Mon, 31 Oct 2022 21:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433215.686123; Mon, 31 Oct 2022 21:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcSB-0006g2-BU; Mon, 31 Oct 2022 21:36:19 +0000
Received: by outflank-mailman (input) for mailman id 433215;
 Mon, 31 Oct 2022 21:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2TDv=3A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1opcS8-0006bP-WF
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 21:36:17 +0000
Received: from sonic306-21.consmr.mail.gq1.yahoo.com
 (sonic306-21.consmr.mail.gq1.yahoo.com [98.137.68.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7917e4-5964-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 22:36:14 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Mon, 31 Oct 2022 21:36:11 +0000
Received: by hermes--production-ne1-c47ffd5f5-2l5gs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1d450870d12d3f727fe97841ca3633d5; 
 Mon, 31 Oct 2022 21:36:06 +0000 (UTC)
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
X-Inumbo-ID: 0a7917e4-5964-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1667252171; bh=lUp3HSP1TAIWIvem3keOMtwYZCq25W+DMpaMWizwQ7o=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=NoGQygL4UHhKlwiW+SVvwQKD4IhNC1iniRVPGMuosQiVwzedgpi3nSTsrapsFpjzz71xayZaZDhqP+t72BuS+XSfIDkAjsfVhb2/rrI03pMJHY7lUMIzHdGl/UHHV9ZIvf3/mCwAPLdXbk8IrNvCFb9F32vafI4odYpQY1wCM/E2Rq2kt9alo8oOe/8b4CM94BmiUtQ0aJ3wUf7WIjdknl6NBBpWV/is4SK6xAEic5A22vND6G3hCa7igkJ29e2QdNLaaPc1RHoUFtmbdtQ+0TS6MwxGpN6pqX0Y4/uTNUO7Zu1V/GWw7QWsJDfUk+oQDND0H0Ygw6ZqgqMClbZCIQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1667252171; bh=lhYpS8kXk/l9ipGQjwGSK6jo6Jo0+l9WeUuGiT4eAyV=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=HQxPjhR0+gRN0vZ5kYsnd3tQNqcorKUJjnygvO+DLLxVXBM5C5oAY8zUqLTtCsC9fKGe6emW5GKa2YVHOm39rXFTeAnJpB4uyqd7yRq2c3qKJTHSEGJ/3BoeiATuGcdpNVmVu8zJToIk+dG5kLIEVbPXxZIsXl1DnqTMK46mCHSyV/1nHv1IaWKkZpaw6hmOM+l7kk6SiGslIMKbS923skpWPUC4YNqdk1yDwiL07iz75x9YCrZFfLgo02RSXK+EeRyWOgsZA1ICPF2la5GBGgePy4lbzS9b7J2mybZiBCVMtWwvElVhyCGk2/u+QPhyo821wifcF3k0hzctSfHmIw==
X-YMail-OSG: RxpTOHUVM1l6UrAaCLg6FTbh7xX3D2u1rQyx6sDqhc1HssSb0N373gH_9z5VOjp
 vn3avlq_olm8k.kvC3QPBzjn4fgY.MipCt65w8hLRf_d5co6jUshXAOd8kvcZqWKdLcnI_xopgdm
 Gt9XlnVIqWdeqNRYbFwWXAnCq2cSreKxqSyNsV4X81Y4QeP8yezgr80.YeL9jmeUvYKlvkmqmEEI
 CgchAN2cbEE5ydOvartSXyZKrNToIWMHay42ASDyeEowMLie1WvHWMypajVotqj6W2TNfLTffnwf
 I992uHbq5zpzEmQmpsHh4baHXe6Wr2gzmrqJAQymBlVn_uBVwnVxRs2ST83mhSoLRILgV11eZ797
 hzZCpmsH3br_tD66DEATlD_qIrb59K1Io6Ixko2xQJohIpUBVQFXnJ5.S.1ocDjs3rgEQmGGE9TL
 fHhUR79Lszow.SGGXsD6Co7ulHwSdGm06oLR5GppsPSYy2DdXNXm4JO__p0slmgGD.9lwC5vzGuW
 vvecQmbyOlYxho51VBoJSakq9gwoW.3.Hs025KBsY.jGRJkDGl_u1oMcSZ7jO0nn83yesIX.pWzJ
 GSN5mxXMVoO59ls29gzMAxKIniEwBVNGTtJsMm08hBot5TSxcdrxq7vsVn7._0Ib7X.9gddNkVmU
 ms4TeGUHubaVC0ZwGIHwQTj4vVdrUHscn52ZlghNtjOuicufGkC42kwovRLE9OVIjmnv.5D7X3wn
 sZHrrO_vzm5hWSijXnr7Yi0uG1QlSzoB6dDv3KpmBn2qBeOmrMww2oVbavtZ5aF8VMNyt33mXdg8
 nrT_I2P7SZzIzBe_whX3IJsvF2Mbd74v5TNokOu6TCokHwsaf5bYfAdzw_3goMQOjeCCx7.oCmcM
 y6b8gJ20eZugCqjZJznRyboXbTEezaBNvR4E55aTxC17yhdzkpZn4v1t53BsHedQkcYJ7.GWbHZi
 9.g6JxEIAUDpePmbj.971XADLnWwEDEH7LqtvGvjS31jq7kyfcF00MlaaFl2Vbz.6i4Qiw2pv42a
 s6pv5A1jHAxjN1M0Kxj__t1QfZfUfOUXrRirW2XJTjCkEtclMBWy_hJu1jyhk.1ZphaiTztwCuHe
 T6ivKZ50Lmm63SdA71nFehhsue1iultH0NvQa3mUue8BhtQIqcnICozlulkjjvjVzmPqDXq8lgSG
 Kb1kfPv6R3d6CNqU.IHYjzb7nkSSgxB3WUBzAkszozovlo_bsPIwq3w15KS7VzAd71vhVnUG56eZ
 pdKwlpo0bm06rsMkUI0aytaxMJKaPWEvPJAqn7v1I6eGRQYAj8EJOrqgYNM07hfaYPC.oJ78Wc2D
 6jCoMYmJ6L.Fis9dLoZgliMtDjMbj9DIETXIVOPIv8Rtmwadrfu0SsmLwFEBmU3V4yLCTGByJeX9
 ETSpwlcCZIrAUcnTUQ.nStTzT6k9RplToRna_LhPV0YRN6rGdCEjkweprdzv0D1rb53PYP7bZns0
 Qkp0MDQQms2n4nciTP1agLT9D0kBu77_biIXJLoVSCwy4gAGQtLBxLUg7Y02Tbl91rsHyl02PUf1
 iWe1pJKdTdLDuhjFpUFxudKH8nN8lQ8BKbpLQe8adQYa03MUAuFxSvGZb7GgIEEPeHDiimsZrcFw
 aiHH.1pPOv1bta2UkxPoiAqM3.Gw4NiIIaWs_1NzYieqQkQAqFiX.cFlDSDsfWuH_WFpL.NPTLYr
 kaw5UUHDLMGBzihMU0_zR7J3ODMeZwg9FeLpZUkIOgC03TsnKe2mdZVGKpXjndPkM2pofjt_Npps
 T0aWDMT8E77oNXT7gFYgEpSyfUPuAjBEXCUJ8GKzlxchWPJP2iTrz3n55v5rn_Dwcy8gq7MH49f0
 Sh3ewmXSasF_wzhVSvnkz.weJDK2NK9uUf3LhJYUOAyFlk_C2VtFjQWQQxs_Mnk.YszQUo_4nQGD
 8vZaPqJSNJ55F0E1S.8AESKwjbJ8L4jeEGnUT23AoH40cyu3pCDoLrpt4qfqdO8raOclim_H8Kbb
 O6hpUOONhgeDjtPq3I03zw2Pj.hIn6ZyYrLGxJPq4Kh8MZ28nlIgORhJu2Sy0y1J.dj5b.0zdk1o
 icjEGfT1ZENqvv7sVadH5dauVuedHTTSWB_jYkXkJghehEWKK8V.9Ri0Ir4PEpRZ8CByoq9swjB8
 HYmDD_HrTVVYw6UViuKAQ.k4a4RSbUATwFns8JsjNwkiyGa4vD0noRzKylKTRB_IBfiQWILC34jz
 C.9yy01UHU29Xwg--
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 2/2] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Mon, 31 Oct 2022 17:35:53 -0400
Message-Id: <f51e326fd82a31535730644a73e8bb41c496e4fc.1667242033.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1667242033.git.brchuckz@aol.com>
References: <cover.1667242033.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
guests, introduce the following new class, functions, types, and macros:

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

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 4 files changed, 48 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0b1a79c0fa..a0f04ad62e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -402,6 +402,9 @@ static void pc_xen_hvm_init(MachineState *machine)
     }
 
     pc_xen_hvm_init_pci(machine);
+    if (xen_igd_gfx_pt_enabled()) {
+        xen_igd_reserve_slot(pcms->bus);
+    }
     pci_create_simple(pcms->bus, -1, "xen-platform");
 }
 #endif
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..50a63fe12e 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -950,11 +950,35 @@ static void xen_pci_passthrough_instance_init(Object *obj)
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
+    PCIDevice *pci_dev = (PCIDevice *)qdev;
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
+    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
+        && (s->hostaddr.function == 0)) {
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
@@ -977,6 +1001,7 @@ static const TypeInfo xen_pci_passthrough_info = {
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
2.37.2


