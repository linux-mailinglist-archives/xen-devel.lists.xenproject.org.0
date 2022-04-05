Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C864E4F2CCE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 13:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298754.509054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhQh-0002Nv-2t; Tue, 05 Apr 2022 11:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298754.509054; Tue, 05 Apr 2022 11:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhQg-0002Lv-Ux; Tue, 05 Apr 2022 11:32:58 +0000
Received: by outflank-mailman (input) for mailman id 298754;
 Tue, 05 Apr 2022 11:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDTv=UP=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1nbhQe-0002Lp-Dg
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 11:32:56 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2293f5f9-b4d4-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 13:32:54 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id b15so14532025edn.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 Apr 2022 04:32:54 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-166-174.77.13.pool.telefonica.de.
 [77.13.166.174]) by smtp.gmail.com with ESMTPSA id
 dt6-20020a170907728600b006dff778258csm5470681ejc.32.2022.04.05.04.32.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Apr 2022 04:32:53 -0700 (PDT)
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
X-Inumbo-ID: 2293f5f9-b4d4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=EUib3M/mRp3Es9YmQL1qt7y8EoMA5K4JNXNvjXy8PWc=;
        b=M2vsVrXm36JrzO4AhR9hY5zwBs3A9+42zx0D87iHjhMLER/NuzIArWjlRMDYwa8gWC
         7XXe6E4PmD5dzJ7/RMEk6fcMubKPRJ8+kr1vs6fzmYo2lx8/8XVyQJ3RhSmFjQtNT/Sf
         zQT/Du/jQJfTQDl8pysY6Bbu5/NkEsylmJRbLsTtFp3cYfJgw6rSJIsPszKZ3H0ADaUh
         7OxKNaX4LyzJfqHjVYoJyiDKPhMAX4Zk8pxm2l44PKaurHUje7cptcj8iHxMfh4fct6g
         b0cjEuNBYy4o+TPS/VIF0mtRIQU5xgG1e58BiNM9zLffm0Km/7lOc63CH3G195ThaiKf
         5e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=EUib3M/mRp3Es9YmQL1qt7y8EoMA5K4JNXNvjXy8PWc=;
        b=sXV6roZ7p4KGSt/0Bx5BPQ59x2vPcHXSaEI3HjMDhwcDBgrk6RYDXIJGebI7spqfAw
         EXqHE3Rt72CHHL+LFfRg3W6TfjlIrLTHkDTcB7C5n5Za4PSbYJuLY+8OfbKf69O+esxF
         zV7u1D5yNy/RT0zrX3MOU+nfPlM4NBXHsaDymdBRg2TTkP1CAu/HeqlCY0nZt5SglxzW
         dV+ll2FnZpOqp2b3nPy0QcgI7nhxTIrFMLIu/nMhuQpIPhIhbIheEguNkaqw1MjHoDZg
         wABjBGkNjDByu5Nrmk6Cjww4/+whHXaugkha0utfh2d3pCa1i22H8PLZYl9LIQmt8VqH
         HHkg==
X-Gm-Message-State: AOAM532n86rrEJKh6tOI/oQ/T2pdvV+lNNs5z2EVQ7fN9I9sQ/cAhIp7
	81KZkdySMvdQsNMy1jsnIoVVvJtlaQI=
X-Google-Smtp-Source: ABdhPJz8U6Yj/r+bbovO0fvvLscarAsCi7H1CfK1BVRHkXd7Vu82jFfShKphiF7CZxgMX0bxAnRGTg==
X-Received: by 2002:a05:6402:4391:b0:419:2f2d:a1da with SMTP id o17-20020a056402439100b004192f2da1damr3068857edc.298.1649158374328;
        Tue, 05 Apr 2022 04:32:54 -0700 (PDT)
Date: Tue, 05 Apr 2022 11:32:51 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_hw/xen/xen=5Fpt=3A_Confi?= =?US-ASCII?Q?ne_igd-passthrough-isa-bridge_to_XEN?=
In-Reply-To: <20220326165825.30794-2-shentey@gmail.com>
References: <20220326165825.30794-1-shentey@gmail.com> <20220326165825.30794-2-shentey@gmail.com>
Message-ID: <2E37BFBA-3EA7-4A3F-B58C-860088275DAA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 26=2E M=C3=A4rz 2022 16:58:23 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>igd-passthrough-isa-bridge is only requested in xen_pt but was
>implemented in pc_piix=2Ec=2E This caused xen_pt to dependend on i386/pc
>which is hereby resolved=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> hw/i386/pc_piix=2Ec        | 118 --------------------------------------
> hw/xen/xen_pt=2Ec          |   1 -
> hw/xen/xen_pt=2Eh          |   1 +
> hw/xen/xen_pt_graphics=2Ec | 119 +++++++++++++++++++++++++++++++++++++++
> include/hw/i386/pc=2Eh     |   1 -
> 5 files changed, 120 insertions(+), 120 deletions(-)
>
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index b72c03d0a6=2E=2E6ad5c02f07 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -801,124 +801,6 @@ static void pc_i440fx_1_4_machine_options(MachineCl=
ass *m)
> DEFINE_I440FX_MACHINE(v1_4, "pc-i440fx-1=2E4", pc_compat_1_4_fn,
>                       pc_i440fx_1_4_machine_options);
>=20
>-typedef struct {
>-    uint16_t gpu_device_id;
>-    uint16_t pch_device_id;
>-    uint8_t pch_revision_id;
>-} IGDDeviceIDInfo;
>-
>-/* In real world different GPU should have different PCH=2E But actually
>- * the different PCH DIDs likely map to different PCH SKUs=2E We do the
>- * same thing for the GPU=2E For PCH, the different SKUs are going to be
>- * all the same silicon design and implementation, just different
>- * features turn on and off with fuses=2E The SW interfaces should be
>- * consistent across all SKUs in a given family (eg LPT)=2E But just sam=
e
>- * features may not be supported=2E
>- *
>- * Most of these different PCH features probably don't matter to the
>- * Gfx driver, but obviously any difference in display port connections
>- * will so it should be fine with any PCH in case of passthrough=2E
>- *
>- * So currently use one PCH version, 0x8c4e, to cover all HSW(Haswell)
>- * scenarios, 0x9cc3 for BDW(Broadwell)=2E
>- */
>-static const IGDDeviceIDInfo igd_combo_id_infos[] =3D {
>-    /* HSW Classic */
>-    {0x0402, 0x8c4e, 0x04}, /* HSWGT1D, HSWD_w7 */
>-    {0x0406, 0x8c4e, 0x04}, /* HSWGT1M, HSWM_w7 */
>-    {0x0412, 0x8c4e, 0x04}, /* HSWGT2D, HSWD_w7 */
>-    {0x0416, 0x8c4e, 0x04}, /* HSWGT2M, HSWM_w7 */
>-    {0x041E, 0x8c4e, 0x04}, /* HSWGT15D, HSWD_w7 */
>-    /* HSW ULT */
>-    {0x0A06, 0x8c4e, 0x04}, /* HSWGT1UT, HSWM_w7 */
>-    {0x0A16, 0x8c4e, 0x04}, /* HSWGT2UT, HSWM_w7 */
>-    {0x0A26, 0x8c4e, 0x06}, /* HSWGT3UT, HSWM_w7 */
>-    {0x0A2E, 0x8c4e, 0x04}, /* HSWGT3UT28W, HSWM_w7 */
>-    {0x0A1E, 0x8c4e, 0x04}, /* HSWGT2UX, HSWM_w7 */
>-    {0x0A0E, 0x8c4e, 0x04}, /* HSWGT1ULX, HSWM_w7 */
>-    /* HSW CRW */
>-    {0x0D26, 0x8c4e, 0x04}, /* HSWGT3CW, HSWM_w7 */
>-    {0x0D22, 0x8c4e, 0x04}, /* HSWGT3CWDT, HSWD_w7 */
>-    /* HSW Server */
>-    {0x041A, 0x8c4e, 0x04}, /* HSWSVGT2, HSWD_w7 */
>-    /* HSW SRVR */
>-    {0x040A, 0x8c4e, 0x04}, /* HSWSVGT1, HSWD_w7 */
>-    /* BSW */
>-    {0x1606, 0x9cc3, 0x03}, /* BDWULTGT1, BDWM_w7 */
>-    {0x1616, 0x9cc3, 0x03}, /* BDWULTGT2, BDWM_w7 */
>-    {0x1626, 0x9cc3, 0x03}, /* BDWULTGT3, BDWM_w7 */
>-    {0x160E, 0x9cc3, 0x03}, /* BDWULXGT1, BDWM_w7 */
>-    {0x161E, 0x9cc3, 0x03}, /* BDWULXGT2, BDWM_w7 */
>-    {0x1602, 0x9cc3, 0x03}, /* BDWHALOGT1, BDWM_w7 */
>-    {0x1612, 0x9cc3, 0x03}, /* BDWHALOGT2, BDWM_w7 */
>-    {0x1622, 0x9cc3, 0x03}, /* BDWHALOGT3, BDWM_w7 */
>-    {0x162B, 0x9cc3, 0x03}, /* BDWHALO28W, BDWM_w7 */
>-    {0x162A, 0x9cc3, 0x03}, /* BDWGT3WRKS, BDWM_w7 */
>-    {0x162D, 0x9cc3, 0x03}, /* BDWGT3SRVR, BDWM_w7 */
>-};
>-
>-static void isa_bridge_class_init(ObjectClass *klass, void *data)
>-{
>-    DeviceClass *dc =3D DEVICE_CLASS(klass);
>-    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>-
>-    dc->desc        =3D "ISA bridge faked to support IGD PT";
>-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>-    k->vendor_id    =3D PCI_VENDOR_ID_INTEL;
>-    k->class_id     =3D PCI_CLASS_BRIDGE_ISA;
>-};
>-
>-static const TypeInfo isa_bridge_info =3D {
>-    =2Ename          =3D "igd-passthrough-isa-bridge",
>-    =2Eparent        =3D TYPE_PCI_DEVICE,
>-    =2Einstance_size =3D sizeof(PCIDevice),
>-    =2Eclass_init =3D isa_bridge_class_init,
>-    =2Einterfaces =3D (InterfaceInfo[]) {
>-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>-        { },
>-    },
>-};
>-
>-static void pt_graphics_register_types(void)
>-{
>-    type_register_static(&isa_bridge_info);
>-}
>-type_init(pt_graphics_register_types)
>-
>-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
>-{
>-    struct PCIDevice *bridge_dev;
>-    int i, num;
>-    uint16_t pch_dev_id =3D 0xffff;
>-    uint8_t pch_rev_id =3D 0;
>-
>-    num =3D ARRAY_SIZE(igd_combo_id_infos);
>-    for (i =3D 0; i < num; i++) {
>-        if (gpu_dev_id =3D=3D igd_combo_id_infos[i]=2Egpu_device_id) {
>-            pch_dev_id =3D igd_combo_id_infos[i]=2Epch_device_id;
>-            pch_rev_id =3D igd_combo_id_infos[i]=2Epch_revision_id;
>-        }
>-    }
>-
>-    if (pch_dev_id =3D=3D 0xffff) {
>-        return;
>-    }
>-
>-    /* Currently IGD drivers always need to access PCH by 1f=2E0=2E */
>-    bridge_dev =3D pci_create_simple(bus, PCI_DEVFN(0x1f, 0),
>-                                   "igd-passthrough-isa-bridge");
>-
>-    /*
>-     * Note that vendor id is always PCI_VENDOR_ID_INTEL=2E
>-     */
>-    if (!bridge_dev) {
>-        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
>-        return;
>-    }
>-    pci_config_set_device_id(bridge_dev->config, pch_dev_id);
>-    pci_config_set_revision(bridge_dev->config, pch_rev_id);
>-}
>-
> #ifdef CONFIG_ISAPC
> static void isapc_machine_options(MachineClass *m)
> {
>diff --git a/hw/xen/xen_pt=2Ec b/hw/xen/xen_pt=2Ec
>index 027190fa44=2E=2E829ea9985f 100644
>--- a/hw/xen/xen_pt=2Ec
>+++ b/hw/xen/xen_pt=2Ec
>@@ -60,7 +60,6 @@
> #include "hw/qdev-properties=2Eh"
> #include "hw/qdev-properties-system=2Eh"
> #include "hw/xen/xen=2Eh"
>-#include "hw/i386/pc=2Eh"
> #include "hw/xen/xen-legacy-backend=2Eh"
> #include "xen_pt=2Eh"
> #include "qemu/range=2Eh"
>diff --git a/hw/xen/xen_pt=2Eh b/hw/xen/xen_pt=2Eh
>index 6b8e13cdee=2E=2E806d832c94 100644
>--- a/hw/xen/xen_pt=2Eh
>+++ b/hw/xen/xen_pt=2Eh
>@@ -43,6 +43,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_=
PT_DEVICE)
>=20
> uint32_t igd_read_opregion(XenPCIPassthroughState *s);
> void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>+void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)=
;
>=20
> /* function type for config reg */
> typedef int (*xen_pt_conf_reg_init)
>diff --git a/hw/xen/xen_pt_graphics=2Ec b/hw/xen/xen_pt_graphics=2Ec
>index a3bc7e3921=2E=2Ef1fbb98912 100644
>--- a/hw/xen/xen_pt_graphics=2Ec
>+++ b/hw/xen/xen_pt_graphics=2Ec
>@@ -289,3 +289,122 @@ void igd_write_opregion(XenPCIPassthroughState *s, =
uint32_t val)
>                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
>                     (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT)=
);
> }
>+
>+typedef struct {
>+    uint16_t gpu_device_id;
>+    uint16_t pch_device_id;
>+    uint8_t pch_revision_id;
>+} IGDDeviceIDInfo;
>+
>+/*
>+ * In real world different GPU should have different PCH=2E But actually
>+ * the different PCH DIDs likely map to different PCH SKUs=2E We do the
>+ * same thing for the GPU=2E For PCH, the different SKUs are going to be
>+ * all the same silicon design and implementation, just different
>+ * features turn on and off with fuses=2E The SW interfaces should be
>+ * consistent across all SKUs in a given family (eg LPT)=2E But just sam=
e
>+ * features may not be supported=2E
>+ *
>+ * Most of these different PCH features probably don't matter to the
>+ * Gfx driver, but obviously any difference in display port connections
>+ * will so it should be fine with any PCH in case of passthrough=2E
>+ *
>+ * So currently use one PCH version, 0x8c4e, to cover all HSW(Haswell)
>+ * scenarios, 0x9cc3 for BDW(Broadwell)=2E
>+ */
>+static const IGDDeviceIDInfo igd_combo_id_infos[] =3D {
>+    /* HSW Classic */
>+    {0x0402, 0x8c4e, 0x04}, /* HSWGT1D, HSWD_w7 */
>+    {0x0406, 0x8c4e, 0x04}, /* HSWGT1M, HSWM_w7 */
>+    {0x0412, 0x8c4e, 0x04}, /* HSWGT2D, HSWD_w7 */
>+    {0x0416, 0x8c4e, 0x04}, /* HSWGT2M, HSWM_w7 */
>+    {0x041E, 0x8c4e, 0x04}, /* HSWGT15D, HSWD_w7 */
>+    /* HSW ULT */
>+    {0x0A06, 0x8c4e, 0x04}, /* HSWGT1UT, HSWM_w7 */
>+    {0x0A16, 0x8c4e, 0x04}, /* HSWGT2UT, HSWM_w7 */
>+    {0x0A26, 0x8c4e, 0x06}, /* HSWGT3UT, HSWM_w7 */
>+    {0x0A2E, 0x8c4e, 0x04}, /* HSWGT3UT28W, HSWM_w7 */
>+    {0x0A1E, 0x8c4e, 0x04}, /* HSWGT2UX, HSWM_w7 */
>+    {0x0A0E, 0x8c4e, 0x04}, /* HSWGT1ULX, HSWM_w7 */
>+    /* HSW CRW */
>+    {0x0D26, 0x8c4e, 0x04}, /* HSWGT3CW, HSWM_w7 */
>+    {0x0D22, 0x8c4e, 0x04}, /* HSWGT3CWDT, HSWD_w7 */
>+    /* HSW Server */
>+    {0x041A, 0x8c4e, 0x04}, /* HSWSVGT2, HSWD_w7 */
>+    /* HSW SRVR */
>+    {0x040A, 0x8c4e, 0x04}, /* HSWSVGT1, HSWD_w7 */
>+    /* BSW */
>+    {0x1606, 0x9cc3, 0x03}, /* BDWULTGT1, BDWM_w7 */
>+    {0x1616, 0x9cc3, 0x03}, /* BDWULTGT2, BDWM_w7 */
>+    {0x1626, 0x9cc3, 0x03}, /* BDWULTGT3, BDWM_w7 */
>+    {0x160E, 0x9cc3, 0x03}, /* BDWULXGT1, BDWM_w7 */
>+    {0x161E, 0x9cc3, 0x03}, /* BDWULXGT2, BDWM_w7 */
>+    {0x1602, 0x9cc3, 0x03}, /* BDWHALOGT1, BDWM_w7 */
>+    {0x1612, 0x9cc3, 0x03}, /* BDWHALOGT2, BDWM_w7 */
>+    {0x1622, 0x9cc3, 0x03}, /* BDWHALOGT3, BDWM_w7 */
>+    {0x162B, 0x9cc3, 0x03}, /* BDWHALO28W, BDWM_w7 */
>+    {0x162A, 0x9cc3, 0x03}, /* BDWGT3WRKS, BDWM_w7 */
>+    {0x162D, 0x9cc3, 0x03}, /* BDWGT3SRVR, BDWM_w7 */
>+};
>+
>+static void isa_bridge_class_init(ObjectClass *klass, void *data)
>+{
>+    DeviceClass *dc =3D DEVICE_CLASS(klass);
>+    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>+
>+    dc->desc        =3D "ISA bridge faked to support IGD PT";
>+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>+    k->vendor_id    =3D PCI_VENDOR_ID_INTEL;
>+    k->class_id     =3D PCI_CLASS_BRIDGE_ISA;
>+};
>+
>+static const TypeInfo isa_bridge_info =3D {
>+    =2Ename          =3D "igd-passthrough-isa-bridge",
>+    =2Eparent        =3D TYPE_PCI_DEVICE,
>+    =2Einstance_size =3D sizeof(PCIDevice),
>+    =2Eclass_init =3D isa_bridge_class_init,
>+    =2Einterfaces =3D (InterfaceInfo[]) {
>+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>+        { },
>+    },
>+};
>+
>+static void pt_graphics_register_types(void)
>+{
>+    type_register_static(&isa_bridge_info);
>+}
>+type_init(pt_graphics_register_types)
>+
>+void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
>+{
>+    struct PCIDevice *bridge_dev;
>+    int i, num;
>+    uint16_t pch_dev_id =3D 0xffff;
>+    uint8_t pch_rev_id =3D 0;
>+
>+    num =3D ARRAY_SIZE(igd_combo_id_infos);
>+    for (i =3D 0; i < num; i++) {
>+        if (gpu_dev_id =3D=3D igd_combo_id_infos[i]=2Egpu_device_id) {
>+            pch_dev_id =3D igd_combo_id_infos[i]=2Epch_device_id;
>+            pch_rev_id =3D igd_combo_id_infos[i]=2Epch_revision_id;
>+        }
>+    }
>+
>+    if (pch_dev_id =3D=3D 0xffff) {
>+        return;
>+    }
>+
>+    /* Currently IGD drivers always need to access PCH by 1f=2E0=2E */
>+    bridge_dev =3D pci_create_simple(bus, PCI_DEVFN(0x1f, 0),
>+                                   "igd-passthrough-isa-bridge");
>+
>+    /*
>+     * Note that vendor id is always PCI_VENDOR_ID_INTEL=2E
>+     */
>+    if (!bridge_dev) {
>+        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
>+        return;
>+    }
>+    pci_config_set_device_id(bridge_dev->config, pch_dev_id);
>+    pci_config_set_revision(bridge_dev->config, pch_rev_id);
>+}
>diff --git a/include/hw/i386/pc=2Eh b/include/hw/i386/pc=2Eh
>index 1a27de9c8b=2E=2E926a507a0c 100644
>--- a/include/hw/i386/pc=2Eh
>+++ b/include/hw/i386/pc=2Eh
>@@ -312,5 +312,4 @@ extern const size_t pc_compat_1_4_len;
>     } \
>     type_init(pc_machine_init_##suffix)
>=20
>-extern void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_=
dev_id);
> #endif

Ping

