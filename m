Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D360E600
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 19:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430701.682673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjlp-0006Ie-Kz; Wed, 26 Oct 2022 17:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430701.682673; Wed, 26 Oct 2022 17:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjlp-0006DE-HD; Wed, 26 Oct 2022 17:00:49 +0000
Received: by outflank-mailman (input) for mailman id 430701;
 Wed, 26 Oct 2022 17:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onjlo-0006A5-Ce
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 17:00:48 +0000
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb0df635-554f-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 19:00:46 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 17:00:43 +0000
Received: by hermes--production-ne1-c47ffd5f5-8c2cz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 93f63f5da119448f595de422776c389f; 
 Wed, 26 Oct 2022 17:00:40 +0000 (UTC)
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
X-Inumbo-ID: bb0df635-554f-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666803643; bh=HXJgswFBRRtT9kaDj9qpnwme4wa3QKPBT14ZHv3IuAU=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=h2sC5ENKC6sY9lhvU1I21u4Jhkme4x/zyVVxVAanjFIqME+TnVLzTAqaHGlriTRjCPcN+AnOc/5W4PYDqUlbxygaYm+tVaD6kre+qdf5DZyjavwrQF7pe7yITcEifXt7mm4hwusT+gSuSFWSa9l8jfhcwaVROr9DQ9ImVaX0i1ke5yOQphSDubGAoeufSwU89k4/H0Ta/C54UD1de0XWcli6gM8u7I8H2snBhrs0/L8X9Lt/PvDPLg1OR+zAyAHD7lJt9kXqdfk/vZZVw030iFFwhYvrd+2ViWleZpw1/L2q4Jh/ccaRHy5wAAZQaVdjy18lLHPt7CeiWyiN5LTYzQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666803643; bh=hI/bVGYJ937dVcuMfGwaxi78BNd+35SdIf3yn2Pl+fy=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=HcJO0HuRj1berk1VgSley9XOCw0PmJRq1kjQw8BeJTGfuHEEcrDdv7GXdiQshQ7YzBcNDTib0XEcbSD//Vtq0tgWosdXhfJxO0BgMqZ2ByJztrvyWzPPoyx/5rTg3m0UsFW70R4zhf0/xtU1LefPA/EyBFxWOrvocNzI6yofKNDW0TGsi9vEdahePJMOhR824X3uJoVeyrWuTsNcGzIU4un1I91AN0Ihouv6DGNdwnhsMm3lTBVgLjWrCMd/oG7Qap/fyx+5h9c1H8F226wvRrjQcR26bNYhkGP9GnsIVwpDyqwWs6hkp3NF7YgHGyJV7zwN5azlM7SwjXsVhB3iUQ==
X-YMail-OSG: c29YqMkVM1leNLHSXhYnexgZfpg7xzousfaeplUPHAbmtTJF7_4Fs4b788dSVES
 .r1EZG7l8T4pU9uWTNartiXk4vpN2Zc.zmEqT9dLjcy8IVWHzCiu8hm2xjwAdv6z6c8DSpCvWd7H
 QeQQjOUQ_PodbEvgd_Oj9b46Voe5fgVpHHgadS955ctiFef2nMNLznf4BA2Alz0dBcxL9xS7TWub
 BwuiMNEpjOZmyheCH4T_sDyTFdgefoQbaTea1OyhKRXCLXCeUuYn5LNDOmmejsd_5R78jRRCrVsz
 S_Xc6B_F85FGCngo.Es_bZjsAitCF0bpLQj4neFDhDoVl4_j8lRyFpeaXUJ1r_b3KUhuavN2HRUT
 56TZcEaBka4UWPC7OqZDYnSK4EazrXEjXLOXYs5HzDYYmcBu7cXiSVnlGFrZjAfz_3Ciy3K5cS.s
 2XynfC7s9VDMpjKltNkaPge564AxdeIbVevLx52O88tc7tOPT18jXZG.rr8KL0HKdwaUFieMItMm
 lwvRk5WrfFz1EnTLxrxRzjlVFF.n.fiyci9HfYO4wESiEoqVSyIJ1FVl7hPpc1j4jRQnR29Pu2Pj
 h7.1gouPY9ZAJnSsSY3ga2v1IXWx_dFo9TlRFTIuWiN8v62NZ5IbW_u0skQxSKi7egVvmUaiWlOv
 IZT5I.IEg2tR0.Iq9P93ek8iu9sJAktJoAmGOh9fR9u6EK91M8FlR1uHu3bmczDzLIMf_ej2CG.z
 RhxVaO0ySxpuEp5.123sn9.h7yQ09dFNHcSoVhiIerdwaxL2rx8HF5FjmKI2ah79qOda5m7VbgQg
 NDd3e_84UnJtPHT_uMospkM0lEB4qwHUy9T5IXeniHIF0qZnFV.hXaxyhgK2oxGXF4iNIchpN3d_
 HgL5Y7Gh_xEm.9P8grDRntUzRwBCLyv4ub1QFsA1w9xc0d.tfSaw.kKR0SqsZSMwhqOauZluuvf1
 2ULAxAmu6xCcJBfrxWA1a4ii3cC46pz3KcTQ8MX5MeakYZoIQVpKv_m_KUIGbYwPTw_Nqxdzv97Q
 rhfRhnHqF9kCTBobeCP.vnvzIz2EHYfDq9Ag91JBFjTZ.EqHCs2O0iHdHnNTYxjIKJai70XdRlar
 yM7XL94jMuky0mOLt3CgvFN5gVJdMTzCTvXy0aBQ5CmaFS0aS3DpWt2ykZjLJaG62pKSr5JxoC5q
 NCn4YFLAY3s6sK1pEETFRfb_hS.WTQEazVYEAHwLTTje0A88KJfZna1VH8is_NUEslySU6tzvoMU
 gVtjwsbgGsg6WC0m2N1Y8q3_4SnhWWGT.24saLA9ArPJMtVdT_YrK2XyzCmlpQdpSDS1pgpl19xM
 t3wbfGTw9dVVB0XIsyH1pyEofV1xHY1QZC8nxOe5XTyaW9qyke83Uvce6_IlO98u1zYHLHJkeCTy
 VWy3M2jx41ax4hv7k.peSA27DGVSWANg1x3IwbBQjP58Bk_nR6gJO97Vn0h7hR.jyqh9nmO6ppd9
 RgA97WKK2Xlha0CF.3Z49mIGuH6nQEdC06MePFJWWsE8NWHii5ARsgaEa244xRzpONhrGQy0Vn3L
 s6HQm_wySZWaDosicXPlGGnSQNgPCJ8tHHgVMHscns9WvV4sAylKwQF7mavI3Jw4nEBEzlGfEYoP
 nvyI6Feq3rZ4TfeN0AIhrwltm8Q_6thdR4M1HsiqN3RbvHG8ophOlfBdIiBM0dmdqPdpp7MPX.Sp
 ACF03FS0Vbzd5GRxQ3KAqtNa0ZXHZu3u1gRC7x62UurAoE7DRMG_NhGpJW_t4e4HF2.eWPiT2otI
 BRTa7H5ILs8mMVrRa.SYNmQtiOhvI43EsSOWz6QPraVIv_HjKg680bxfqpDvvNaRjKxCLVzuS0H2
 Jtf8eAwqjx.53K0hKBF_RnvS8PHzMgNdovVQjJjsrlEbAxjtUwCWxsE6Wmhi1Z4mFONz9de5IQqA
 v9WlJG4f6L9t114nJhcjF1AnQl3gcIfRf4Op5PBtJCrATc.LhEiSV2NWkeXItazFTJ8C4StSDu_p
 ZX8pOqcSBoUEEhRjO3o5yWhpvCOzcqERB6pkaWm4.R6mDCtua98AnSRj91.3XjC9tmL7kq2lGeA9
 RMBOFQZPkDnyv2.TjBuE2cghITNxt9X17G3e3n8pHVTTSbWFV6e58fKxQgzkZHO_dgwICSPmsq.J
 PIvVV45tWGZK9rjUJpbuTaWzj9WtTJOdq4q9VbQCuGeJzGRU9vZrpKM5ZoBN8kwpO2v1qZ8P53GU
 XvaetrS2E55Dm
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
	xen-devel@lists.xenproject.org,
	Chuck Zmudzinski <brchuckz@netscape.net>
Subject: [PATCH v3 2/2] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Wed, 26 Oct 2022 13:00:27 -0400
Message-Id: <69ddfbd373a61dc3ec29b405191abf5eaa9a2650.1666802059.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1666802059.git.brchuckz@netscape.net>
References: <cover.1666802059.git.brchuckz@netscape.net>
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

Signed-off-by: Chuck Zmudzinski <brchuckz@netscape.net>
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

    Sorry for the extra noise.

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
index 0ec7e52183..c62f03dd9f 100644
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
+    XenPTDeviceClass *xptc = XEN_PT_DEVICE_GET_CLASS(s);
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
+        && (s->hostaddr.function == 0)) {
+        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
+    }
+    xptc->pci_qdev_realize(qdev, errp);
+}
+
 static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    XenPTDeviceClass *xptc = XEN_PT_DEVICE_CLASS(klass);
+    xptc->pci_qdev_realize = dc->realize;
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


