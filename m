Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4A60DCC3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 10:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430376.681997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onbR0-0002z8-De; Wed, 26 Oct 2022 08:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430376.681997; Wed, 26 Oct 2022 08:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onbR0-0002w7-6j; Wed, 26 Oct 2022 08:06:46 +0000
Received: by outflank-mailman (input) for mailman id 430376;
 Wed, 26 Oct 2022 08:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onbQy-0002gT-4m
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 08:06:44 +0000
Received: from sonic306-19.consmr.mail.gq1.yahoo.com
 (sonic306-19.consmr.mail.gq1.yahoo.com [98.137.68.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f47aead-5505-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 10:06:42 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 08:06:39 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 23da40615be2c6ee6a989747ca28211e; 
 Wed, 26 Oct 2022 08:06:37 +0000 (UTC)
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
X-Inumbo-ID: 1f47aead-5505-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666771599; bh=+Oks/M8Oo0mqEqotDONcsMEHG5zWEVL77nZHBMvFWNw=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=ckLkhzYstS0fKG7BSw3t0lJKTyP9Od3mbLiK7l+I+TZ7MtqVLnu/WhVFI5xAzJ2LR2rd8j3zvvlu8aLuxc6rC67NT0DfrR//DjkFzJssxvxFsLbTVnPDpOoxuqnGHNbAd1qjZcpmsbPFCwJb1LxKgOfqe2/3fBi/vW4QnHf/n1/sySxN4R0xruoAU//bV7fGW0LNh4jyHcMdqsSBBw/W41bPhIyzdSK3rLnU/Y+BWHyOqTPLojlrXPP2Vgx9iRIAvWO/ObpQHTAVMDf+OQ0lBhYJqhfAXwOiMsvHqq7n9v+jn84TcwhidsawBuExQRajhzFNo2w5XADMwkQomTVYAg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666771599; bh=Mq4uo71v5aH3IPer/qatJgs+91Gr9mbGGM+r2ov2Q6A=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=CisKuaUGp+nZmxORxidKxmas0DqsmxMABtRXh8jhMVFe+eLWYBUkhGkgVuDBRtszeV5ZSZDbXKeLKdXogzLutT0ha3uq7bnPbpgGM4YMxt/GZvNlpODNJTF8RdiwO4BD4jcLQzBZQVhlCuUssdvRpiGb4XHK4xP5nnQ6jyJ4fkmDkYNmOy1jMH9v9GyBjSERnpa2TpnOb8zyn/W2gk7sR8BUvlxD9oeA49zRUPSL2QZBmxPBDAJak83h3LaQMblPhCun3QThS/HCpwArfgFro/B+7DvRb9cb49FoJ4P+S90ojYvH4oMvpkk8qbRHq9NE4EU9Py7PdIowC4XsIoqa0A==
X-YMail-OSG: k.OGyGAVM1nZCL3v0mnAnkIo50MDaWRp5IlEpFW3VUd7xxXHEZvh6Yax5tWsXp0
 9BQEIO3N9y2nQslrSh.2YPT_dOtO8hpDowRR6O74sk5VtA0HdBIJOO5mj8kusXg.GiBZa4a7bJJl
 tTSIxTKVbPn9r6hPR.FUXJ7zk4INcDOCXNBcy3KHMN9VQC.vvuhjwTLEMJqBs_0eV6iwvB_h2Agc
 f6HbGp7ONl5yHHC7oyMkFVTCRRur7__ug_g4p8AdsLZf1g6cZz2vz_Xpvw2lRak.l0YeyzpZ7qj1
 jv84Ql9TxF8Q.UqB4UYZF2oeAl25QW2ahpHvVGCkjxPuWCTOA6BKl.SvZ23jd1Iu78HvYs6aTvrb
 rBQtBzsMOxQVwOtmcSbeytibnVspftAk_15SE50dx8rRvl_c8cIvwLgTwfm3W6rPUNGuLwiAZHQd
 Vgi2pMXDmvN.BIaE2NNQzT4LlmiL2zDK_gdotrcF35MRo14Z1U3ejExy50EMMoC2rc0fi9UarAM9
 JZdxKbYHD24sKqWETXqIZMFmeF5vHBBB92ir1IleBYI3Hpx.L076gVReAIF4IIWI_JgUfkAPQ6Xy
 rDEZMMEs3ESPWQ2PAFqC.N_5B203arjRIkU41DJkM49F98b.qTfdHjWjQDMOJI_6o8WWNaT8YWnj
 OVssQjb5z327kdKpf2ITfkoFI3Spq5Ql_7sJyVLpCrTgoL6evYe_bPGyTQv59IR1A_tD8OcW3py3
 aEgLA8I_5fQQftk11b6eAaO5snE.Dh0NoUs7xSaOQjr9CDcOIAUQFL34GUPRiyH4TVqVI.vIinpP
 j.DtU6E4Agvp7YE5RtqUS4lsYhjf1_sRU8c_gvxZtrY9xKwv68M3WxR7xL7Av4NCj0MdA8_UwyYR
 kAaBDZQhKHKi5JV14YjXffNLoFFnpHzJykmC3FBJDJ5mVk9OvOy9cwxzo0zzDjqBAfbAyXTn90_5
 WKY7qrGqKOLPFU.0tePw2GW1sCtPYt0UWGmsytPILsw3BF3aUatewWxGr2GLIuBsbGF6qnqz3K8L
 mwvRF8a19dWiwaOdqUtqLudVMULO2BwLClEMOSyuTUsEct2LMDbt2j5Yf17hp_6vx3baui8BZrF_
 G0OpTvSQEYOanhWNiq8mMD6JaYEW6wYLeoxqzu4xjKOOz8SylnaUHiJwqBbUE0W3cmCKgN.8jcET
 mOXKbCRBU2W6GqBfxv0mWiZxUmJyHWGsLY8hdPOYt47qQeq8Oo1PIi5S35CHN9Rluem.5k5.e.We
 tTROkikWim57MJ7vQU8fH08YCpdk._rGVWZWd8tzzR2dgJfTLsmDVsedIyHjF38c9Y0eRSfYPzYZ
 QERiY_7nJ_rlTKpWjSMdOXmMDL5Dh6ihMXksXONNkFpQ77JQ.ui1pDapB09rS3z_5ptxatqq8NVX
 Qo1caUpDxSCXDliJ..nWRaQWiGXWqf1rQqBeFCVKfEtuOtkLftsFI4eEA6KcRdzpD2.FjQc8z_fk
 AUqkG4xlV_yRs2W5tvI2.NpaR3GVJBO3rk4hzW9Gyjbrfk56ZbQg2hlFIUa.f_SlExv7QRZrO9DQ
 KuoIXx.NFKTvXzqMQ9koMCh.yPYLwOwO9g.wb9OcBp_ZRxW4Zo0zTbidhi5M5tnLRa6.WXRCfHcz
 luhOjUm8AcyGMAC1Q6iN4Ran5jApt9hjjc4wlalaiEW1j8WBAKdd7fCtuW3xRq0jvtfueyS9szGI
 3oUorgngNmLhW_z4lw2zKKF91i30RWNRgKaeTXqFIFQtLGRdvE53Xbrc3QKtF5mgxb9PxmOmlK5a
 Biw7SzomC2PFE.ZgH9NjqwwJkD1exjKMjWWdaJW5FTMbCa2GHNqbhUiGntIalD5sggRJvfzyTl82
 YKsjHVHlEfnsCHAb3W.VYjSqspOdzBBJA01oXQKgT4.ErngNWqgQvs5gjJtq6w9z1nqdHyddgZY2
 rpEp5fS0n.wNrLMlVlPcHF4fS0OgC2z0_d1cHjlOfiMz3c5x5YmVEgekvOyvb8pOq8SeOPHkut6K
 qvBEWfhQ462Ze174P3pwkq992vf.dm81GiKng5aGy1etHKZDGRpMYq9wNCCUSmeOYt2z9X9edawZ
 R6Go6DZz17EozPWlT9bomls31UpsBDqYFvUalgchXsb1lXls6y7luNTtYnOePMpIgTdhUo.A8wfL
 ck5X6_8NJP3O65LRYPN4U9pV4G28uoDpoJHNM.wN25kgMtHM1FUNlFc769Z3.Ieixc1gS9Q5Mzpn
 izoL0k_9L2h2p
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
Subject: [PATCH v2 2/2] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Wed, 26 Oct 2022 04:06:06 -0400
Message-Id: <1b98334dd30af4a467170237c8a31c1824ee9c37.1666770888.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1666770887.git.brchuckz@netscape.net>
References: <cover.1666770887.git.brchuckz@netscape.net>
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
index 0ec7e52183..ec42f47fac 100644
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
+    if (is_igd_vga_passthrough(&s->real_device) &&
+        (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
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


