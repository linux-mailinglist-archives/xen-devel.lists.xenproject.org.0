Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C92265AC88
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 00:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470181.729628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC87u-00051l-IA; Sun, 01 Jan 2023 23:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470181.729628; Sun, 01 Jan 2023 23:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC87u-0004zH-FG; Sun, 01 Jan 2023 23:52:26 +0000
Received: by outflank-mailman (input) for mailman id 470181;
 Sun, 01 Jan 2023 23:52:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fqzy=46=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pC87s-0004zB-9r
 for xen-devel@lists.xenproject.org; Sun, 01 Jan 2023 23:52:24 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539a5eb8-8a2f-11ed-8fd4-01056ac49cbb;
 Mon, 02 Jan 2023 00:52:20 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Sun, 1 Jan 2023 23:52:18 +0000
Received: by hermes--production-bf1-5458f64d4-46wzk (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 0bf49e87fc25c8372e7b6d686a48fa29; 
 Sun, 01 Jan 2023 23:52:15 +0000 (UTC)
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
X-Inumbo-ID: 539a5eb8-8a2f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672617138; bh=skwhbHUkGjznop/QWhj7GG069Cfw1vyGWz5DAdkodwY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=IEJMj5MNCJUJhzkSMnO2XnVNisG1L6mJlpp0C5gDVnxeviRF0kqvnRwxfJmLj+hC0QFBlbTcbeKhkqEkIp226t/XKrDoSsN3wDu5VrIXb2cUvH5a2Vcwyj8SgX05o06G9WgTnCGWI0B3TzLuSxxZwk5tlLxj2MD8skG8zP1PDa8RCqZpkemmac+B+Wu9oRwhBsYgBuhau0Vw0ts8RUB30xaVWBpukpOAHkMH7iXfYHs9kjWtitKFueQ/8ky0r1vX3pPMPTpu/lVuNMi4J9tT9ePilvZ0qBWVgrn6omTTOXDvowMCx2KPRenG/K1y8Lf/G56IZ06fgbJ16W2s9SgJgw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672617138; bh=Gm5Qal8G0/XjlI2GzUDH3lY8DeAqXwfGdjCP6FAlAGr=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MLkLtG3fDe+9QkP7XrKUzDF3W5oo2DKdXEroHJibxjdodo3SkQwi9xe91r3zpalxKtTnTLCsR+r65qUkbkr98KJ8X7z/Ihs3hS4QMmqQgG+QAn6LIQPfJLm0CztXzNlBqnbbyr5A0IPaLjuN/vgxzM5ZZc5oV1ESWBf9bQB3I5j2AcAy7HKX/2yeBZjTE8xJtQNuWk4Moc5uleMlu0icTC6mTuG4L1bQxquvoitgpY3kZb06+ebAmMIInFu6wCY0qK0FU/+NatbUhzO52O5uIdDmHSdc6GhJx+a3Q9arQjH7zgdrMFhrrbg0RHcToW7bso8tZlF6vSAM41le0Ju2tw==
X-YMail-OSG: XFe56mIVM1mvJtN9hySqOXDspxB_hs1PSyXIqthm1uK3iEFtNgI8dO.eX7Sh1E.
 BJ1_4tOtjK7lE71x5m91dWrNder9ITw6LQQNWL1ZRh04Rkz6C9T5ZqdVzBRxGBUO8c9Bq5OBVHaG
 v1nSCCYiBvXZen7Tv4KLZnEkZQfTBQ56Sk6eauPerh5Qh3wFR8eIJy4VHTPQjKljBFJ1S3.HIvC0
 b6s4BfbDPWb5lQOLQ0veeAFWE6MCM9Jd8OTyofW4JOrT4E8yOAOoqwNfGm2sq_29hUFkBE9DYiuy
 lepBR2MhcdMxJnXb4lJT6.GksxAcUKXabYXr8bzIGIIon6iWsmO9iKcB4pYR_9D_O1Gvkj4ZJRcy
 cDxMQpvv657LI3SbOKsg3JkWEqkEjqxZvUDH8ZiGK0dXagy4DMkS3vdjlilpNp_nLUiolcyuTKjR
 Y.MixgwpfhXp_AAumgfU_Wt5_LdAQuY6dz1jmDqz7XFt4y1XAhI39LsesNVCeVjhDT7hAAso5DrZ
 jThaK6f8.d9wUCLgv91C37kWGpliHOrOhgEDf7NQoC8hpdmTMWxuuQ4YkDTVbHDojewOHVZ6Tidt
 nUuANYHH1_OODqyUi5XlPs3BWwgt9f50ROmoarNuiVMUTqPhPeBL21V4bNFbNh2Br_bMNezBPGfo
 iJ.mb7harPCtknUJmAZVDADeOVLSmEhJ7P_cjMha5vUTRID7Z9eNaTY6WYDVG_8mLAC7EM31Betd
 KBTnqzCuvyBBviOTMg0Ieq3Na_mST1fyuSMFsWOufN2D38tWNjPB8EUZ4Je8JsFfwZ8gMHIcKNFv
 kJwQFHUd80S7N5SIN3HQ739GVfL1PcYJhkH23wWlQiS6zYglydDMBMNzXkA4aY7KB0oz2mMZok9x
 xiEnT66vM84_PW8FEFb9mG5eE.ZIYZXSDjG8lktttqJU_cZGuCGracGLXxPAfd6rwvkEh9fQMTDU
 Q0T2XlpvVv749C1piJ2RvV1uoLbXh5rWDdM8xln.BSf_hl88FPrx8Ro5WYTfU5MNVcT5vJ33dkh3
 ARL1pbX12SKD5bCvTfpUqTEEpBP2XF0w34jJ.9__K.7LYyVUv66eh3n3Tqtr3xemxj0CB4bGYNJe
 LpPmOAvJ3HESwAQxkmjlI0F2VtJIH3vl8vWAhpLvKFJvHUzp9jciS7SZ6HdaMejHVhyEVseJ_A8B
 ppi9ZzQ5dEgSHrpzptAWizANlnRW8sFB_lNZfKtYIDoWGtqA0d0YFCFtmhQlYmLtdvj1VoWoROeX
 2EWeSOGJMCW8HssHVG10qjOo6aVTmbdk6pfrjMJAzDPxDMwyhIev5OwnUpqlttBLrPi5oeDQ_HTA
 xARzA5.jBSaMan00X944tSUVHqLS_h_Qi0SnVfpTEAfnXTWH6.gRT2DUJVSXWNEo_MRnipuHUzIi
 PFze2H6K7kSxQIhFbynzFyZqFFHPbl5lWk3Dw703uq9c5z1kMBEAJuPFNDCFw.JiEjBQSdN0pwxH
 OQNJLL85254cqjFaWLNEzFkbCy1UGOXCsVX3fancVFLTjtR5yjetxo6kEaECVnec4TVSR80ZUMHG
 JY_t3GYE45lNfss1WXhoGd2etO9YphpQH01cWD4_XyNvFDu0hsyLtSGt._P1XizvV29ldZggSh5d
 O7hR4CUw3k4mUbXjf8_yEu8ijJfc1cp7UZZNO.3ya4msXawCH3DBAKxlHTkJh.WLSginWznIhOcI
 UAOnPePzjkVSUjsydCp3iKI51t54.BnU16MbcaR6dPlwIF4KJ91nOD8H4oKqDBDNX5fq8.rDWfzR
 2Wxq7NqKa8Mg5i32Kpy_ICSx0qC0w0WJkkQDx59YmEiF7Zv0KsSjCJCUTn55VDmvV2Bk7dhhwuLE
 _AB6CseM_XTMQc65VW213Z8kD_6FD7ehL_00xRmHyWG6ejN.AqbKiucoRuprKE4fqbcGk0EWskfQ
 DYa8EqRUdEu1r9aXvjauffxqzHIp.OH9VzYQeFP8Ub7I_qKK_69Z74XKm_8HYjacNW8l8aSSKXaG
 P9TyD90AxMZkzfkRRbhyS7uyxQXuj_44oeTnkt7feAv_CopWlh8TzDqe05DUl4dD5G2An16DHqE0
 M_tVkAgDQ4MdWGLGjsbRNWCGUI46gXip2VrPMSirQpEU9Ggrkk8k2OZQGSCGd7b4342UFBG3R.xk
 DnEkFEFc1s3sfbz1tc20FUwoa6AMmpMV3REHRpT6towzQjbYC_E8w0KE4fEcz.W2cTrtHROSK.db
 VoKP19swTfj0-
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
Subject: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Sun,  1 Jan 2023 18:52:03 -0500
Message-Id: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>

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

    Sorry for the extra noise.

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/xen_pt.c      | 46 +++++++++++++++++++++++++++++++++++---------
 hw/xen/xen_pt.h      | 16 +++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 4 files changed, 60 insertions(+), 9 deletions(-)

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
index 0ec7e52183..7fae1e7a6f 100644
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
@@ -950,11 +941,47 @@ static void xen_pci_passthrough_instance_init(Object *obj)
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


