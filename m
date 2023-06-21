Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D99273918C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 23:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553167.863570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC5Qj-0002Eo-ML; Wed, 21 Jun 2023 21:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553167.863570; Wed, 21 Jun 2023 21:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC5Qj-0002CK-JI; Wed, 21 Jun 2023 21:31:57 +0000
Received: by outflank-mailman (input) for mailman id 553167;
 Wed, 21 Jun 2023 21:31:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bQGx=CJ=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qC5Qh-0002CC-LX
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 21:31:55 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a6dd2a3-107b-11ee-b237-6b7b168915f2;
 Wed, 21 Jun 2023 23:31:53 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f8fcaa31c7so70186295e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 14:31:53 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-108-061.77.183.pool.telefonica.de.
 [77.183.108.61]) by smtp.gmail.com with ESMTPSA id
 x23-20020a05600c21d700b003f427687ba7sm5881297wmj.41.2023.06.21.14.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 14:31:52 -0700 (PDT)
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
X-Inumbo-ID: 0a6dd2a3-107b-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687383113; x=1689975113;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KMCQ6sgn5StAgfvPFvdTiexcUMfX+Z2+ZVb5iGnBQ8=;
        b=B+pbVPow+bV7jtip1hNAs/b+BAtaVLUhspeNXupLz822AMZOs+1qUiHBOtGlnJOLQc
         9iuu+hOetABVFWcAC5bptXwp9CbWr5Yf06YYnJxN1daLvek0b0Qmt670tn0bGvhBFOax
         qAcRuHH5td0TowQV+AZkftzoda8hzM6qhtUkc9mlDLGoJkdlsOvlenNSSuoqo5F3DNHu
         QdYFyOk8KGYt0jfEg3zKzU9W88V7C2XcUy+8l0GBZW4Ciht2J3HaACGxllfdXWvS/e46
         GRVfKa+5rtAfAGobc96Wwgg1dSZtCgJhvx2srJNXEFreJNA98xaOmHXHoeRPdlRe0umD
         AL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687383113; x=1689975113;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KMCQ6sgn5StAgfvPFvdTiexcUMfX+Z2+ZVb5iGnBQ8=;
        b=eNUUvY+xHVxVVKJIzjccunQcCc7uJA6Wyw/I6z1WrI/xubYVvShEgu6YeZjEPSLD41
         nOYHSXj1u7tNrOf/WUeWs+XE7PG1aqbzzxAGqIv0Lg6hARg7gf4eAiNMHTEw8rTq+tfj
         m4KYUqY0MjsVm/9F+Qf1G4jl+DIbZeMfl8yt7otSqyqvBXb+3P69muESObtclny9SzrQ
         hylAs6quBO6scFDeJTnhpy6qI0jP5rC1/K8pn98XevsPE2ITIpCbufBjvc/3N5/6pGaA
         RgTg97D7D2Ob15R/NiZPFQI1CXKd1SVCPbn31yI2C2KZhhV18XW9kPc0aLUa06TPwxm8
         WAew==
X-Gm-Message-State: AC+VfDwicYhFk7ifxCQdH0MQOXNibEuzFPp01Orjn7MH/h745v0Iuisb
	3XdZZ/faRBRhcw1u5+FUpxQ=
X-Google-Smtp-Source: ACHHUZ416rar+TOxQLzIqPvAjnOk9F8R3Pd3AYYoZsu+B3rz+8rdOFmQN8MjyPf1NnCgZqHwl2HKlw==
X-Received: by 2002:a05:600c:2255:b0:3f9:a6f3:8a55 with SMTP id a21-20020a05600c225500b003f9a6f38a55mr11018623wmm.37.1687383112878;
        Wed, 21 Jun 2023 14:31:52 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:27:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Joel Upham <jupham125@gmail.com>, qemu-devel@nongnu.org
CC: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/1] Q35 Support
In-Reply-To: <272947b9494f00bb4ad3e27c050e99f8b61905b3.1687127946.git.jupham125@gmail.com>
References: <cover.1687127946.git.jupham125@gmail.com> <272947b9494f00bb4ad3e27c050e99f8b61905b3.1687127946.git.jupham125@gmail.com>
Message-ID: <04872971-A186-40E6-A604-B9B5297216CA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Hi Joel,

Nice! I've been working on making the PIIX south bridge Xen agnostic, part=
ly to show how Xen enablement in Q35 could look like=2E Not that I'd have a=
ny use case for it but great to see that you've actually done that!

I know you didn't intend to send this patch but I'll give you some early c=
omments anyway=2E

Am 20=2E Juni 2023 17:24:35 UTC schrieb Joel Upham <jupham125@gmail=2Ecom>=
:
>---
> hw/acpi/ich9=2Ec                |   22 +-
> hw/acpi/pcihp=2Ec               |    6 +-
> hw/core/machine=2Ec             |   19 +
> hw/i386/pc_piix=2Ec             |    3 +-
> hw/i386/pc_q35=2Ec              |   39 +-
> hw/i386/xen/xen-hvm=2Ec         |    7 +-
> hw/i386/xen/xen_platform=2Ec    |   19 +-
> hw/isa/lpc_ich9=2Ec             |   53 +-
> hw/isa/piix3=2Ec                |    2 +-
> hw/pci-host/q35=2Ec             |   28 +-
> hw/pci/pci=2Ec                  |   17 +
> hw/xen/xen-host-pci-device=2Ec  |  106 +++-
> hw/xen/xen-host-pci-device=2Eh  |    6 +-
> hw/xen/xen_pt=2Ec               |   49 +-
> hw/xen/xen_pt=2Eh               |   19 +-
> hw/xen/xen_pt_config_init=2Ec   | 1103 ++++++++++++++++++++++++++++++---
> include/hw/acpi/ich9=2Eh        |    1 +
> include/hw/acpi/pcihp=2Eh       |    2 +
> include/hw/boards=2Eh           |    1 +
> include/hw/i386/pc=2Eh          |    3 +
> include/hw/pci-host/q35=2Eh     |    4 +-
> include/hw/pci/pci=2Eh          |    3 +
> include/hw/southbridge/ich9=2Eh |    1 +
> include/hw/xen/xen=2Eh          |    4 +-
> qemu-options=2Ehx               |    1 +
> softmmu/datadir=2Ec             |    1 -
> softmmu/qdev-monitor=2Ec        |    3 +-
> stubs/xen-hw-stub=2Ec           |    4 +-
> 28 files changed, 1395 insertions(+), 131 deletions(-)
>
>diff --git a/hw/acpi/ich9=2Ec b/hw/acpi/ich9=2Ec
>index 25e2c7243e=2E=2E234706a191 100644
>--- a/hw/acpi/ich9=2Ec
>+++ b/hw/acpi/ich9=2Ec
>@@ -39,6 +39,8 @@
> #include "hw/southbridge/ich9=2Eh"
> #include "hw/mem/pc-dimm=2Eh"
> #include "hw/mem/nvdimm=2Eh"
>+#include "hw/xen/xen=2Eh"
>+#include "sysemu/xen=2Eh"
>=20
> //#define DEBUG
>=20
>@@ -67,6 +69,10 @@ static void ich9_gpe_writeb(void *opaque, hwaddr addr,=
 uint64_t val,
>     ICH9LPCPMRegs *pm =3D opaque;
>     acpi_gpe_ioport_writeb(&pm->acpi_regs, addr, val);
>     acpi_update_sci(&pm->acpi_regs, pm->irq);
>+
>+    if (xen_enabled()) {
>+        acpi_pcihp_reset(&pm->acpi_pci_hotplug);
>+    }
> }
>=20
> static const MemoryRegionOps ich9_gpe_ops =3D {
>@@ -137,7 +143,8 @@ static int ich9_pm_post_load(void *opaque, int versio=
n_id)
> {
>     ICH9LPCPMRegs *pm =3D opaque;
>     uint32_t pm_io_base =3D pm->pm_io_base;
>-    pm->pm_io_base =3D 0;
>+    if (!xen_enabled())
>+        pm->pm_io_base =3D 0;
>     ich9_pm_iospace_update(pm, pm_io_base);
>     return 0;
> }
>@@ -268,7 +275,10 @@ static void pm_reset(void *opaque)
>     acpi_pm1_evt_reset(&pm->acpi_regs);
>     acpi_pm1_cnt_reset(&pm->acpi_regs);
>     acpi_pm_tmr_reset(&pm->acpi_regs);
>-    acpi_gpe_reset(&pm->acpi_regs);
>+    /* Noticed guest freezing in xen when this was reset after S3=2E */
>+    if (!xen_enabled()) {
>+        acpi_gpe_reset(&pm->acpi_regs);
>+    }

I wonder why this seems to work with PIIX?

I'd rather try to keep the Xen impact on the device model as low as possib=
le, ideally as low as in the PIIX4 ACPI device model=2E

>=20
>     pm->smi_en =3D 0;
>     if (!pm->smm_enabled) {
>@@ -316,7 +326,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *=
pm, qemu_irq sci_irq)
>         acpi_pm_tco_init(&pm->tco_regs, &pm->io);
>     }
>=20
>-    if (pm->acpi_pci_hotplug=2Euse_acpi_hotplug_bridge) {
>+    if (pm->acpi_pci_hotplug=2Euse_acpi_hotplug_bridge || xen_enabled())=
 {
>         acpi_pcihp_init(OBJECT(lpc_pci),
>                         &pm->acpi_pci_hotplug,
>                         pci_get_bus(lpc_pci),
>@@ -332,10 +342,14 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs=
 *pm, qemu_irq sci_irq)
>     pm->powerdown_notifier=2Enotify =3D pm_powerdown_req;
>     qemu_register_powerdown_notifier(&pm->powerdown_notifier);
>=20
>+    if (xen_enabled()) {
>+            acpi_set_pci_info(true);
>+    }
>+
>     legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
>         OBJECT(lpc_pci), &pm->gpe_cpu, ICH9_CPU_HOTPLUG_IO_BASE);
>=20
>-    if (pm->acpi_memory_hotplug=2Eis_enabled) {
>+    if (pm->acpi_memory_hotplug=2Eis_enabled || xen_enabled()) {
>         acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(l=
pc_pci),
>                                  &pm->acpi_memory_hotplug,
>                                  ACPI_MEMORY_HOTPLUG_BASE);
>diff --git a/hw/acpi/pcihp=2Ec b/hw/acpi/pcihp=2Ec
>index cdd6f775a1=2E=2E5b065d670c 100644
>--- a/hw/acpi/pcihp=2Ec
>+++ b/hw/acpi/pcihp=2Ec
>@@ -40,6 +40,7 @@
> #include "qapi/error=2Eh"
> #include "qom/qom-qobject=2Eh"
> #include "trace=2Eh"
>+#include "sysemu/xen=2Eh"
>=20
> #define ACPI_PCIHP_SIZE 0x0018
> #define PCI_UP_BASE 0x0000
>@@ -84,7 +85,8 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>     bool is_bridge =3D IS_PCI_BRIDGE(br);
>=20
>     /* hotplugged bridges can't be described in ACPI ignore them */
>-    if (qbus_is_hotpluggable(BUS(bus))) {
>+    /* Xen requires hotplugging to the root device, even on the Q35 chip=
set */
>+    if (qbus_is_hotpluggable(BUS(bus)) || xen_enabled()) {
>         if (!is_bridge || (!br->hotplugged && info->has_bridge_hotplug))=
 {
>             bus_bsel =3D g_malloc(sizeof *bus_bsel);
>=20
>@@ -97,7 +99,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>     return info;
> }
>=20
>-static void acpi_set_pci_info(bool has_bridge_hotplug)
>+void acpi_set_pci_info(bool has_bridge_hotplug)
> {
>     static bool bsel_is_set;
>     Object *host =3D acpi_get_i386_pci_host();
>diff --git a/hw/core/machine=2Ec b/hw/core/machine=2Ec
>index 1000406211=2E=2E703138d2ec 100644
>--- a/hw/core/machine=2Ec
>+++ b/hw/core/machine=2Ec
>@@ -455,6 +455,20 @@ static void machine_set_graphics(Object *obj, bool v=
alue, Error **errp)
>     ms->enable_graphics =3D value;
> }
>=20
>+static bool machine_get_xen_platform_dev(Object *obj, Error **errp)
>+{
>+    MachineState *ms =3D MACHINE(obj);
>+
>+    return ms->xen_platform_dev;
>+}
>+
>+static void machine_set_xen_platform_dev(Object *obj, bool value, Error =
**errp)
>+{
>+    MachineState *ms =3D MACHINE(obj);
>+
>+    ms->xen_platform_dev =3D value;
>+}
>+
> static char *machine_get_firmware(Object *obj, Error **errp)
> {
>     MachineState *ms =3D MACHINE(obj);
>@@ -1004,6 +1018,11 @@ static void machine_class_init(ObjectClass *oc, vo=
id *data)
>     object_class_property_set_description(oc, "graphics",
>         "Set on/off to enable/disable graphics emulation");
>=20
>+    object_class_property_add_bool(oc, "xen-platform-dev",
>+        machine_get_xen_platform_dev, machine_set_xen_platform_dev);
>+    object_class_property_set_description(oc, "xen-platform-dev",
>+        "Set on/off to enable/disable Xen Platform device");
>+
>     object_class_property_add_str(oc, "firmware",
>         machine_get_firmware, machine_set_firmware);
>     object_class_property_set_description(oc, "firmware",
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index d5b0dcd1fe=2E=2E8c1b20f3bc 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -62,6 +62,7 @@
> #endif
> #include "hw/xen/xen-x86=2Eh"
> #include "hw/xen/xen=2Eh"
>+#include "sysemu/xen=2Eh"
> #include "migration/global_state=2Eh"
> #include "migration/misc=2Eh"
> #include "sysemu/numa=2Eh"
>@@ -233,7 +234,7 @@ static void pc_init1(MachineState *machine,
>                               x86ms->above_4g_mem_size,
>                               pci_memory, ram_memory);
>         pci_bus_map_irqs(pci_bus,
>-                         xen_enabled() ? xen_pci_slot_get_pirq
>+                         xen_enabled() ? xen_cmn_pci_slot_get_pirq
>                                        : pc_pci_slot_get_pirq);
>         pcms->bus =3D pci_bus;
>=20
>diff --git a/hw/i386/pc_q35=2Ec b/hw/i386/pc_q35=2Ec
>index 6155427e48=2E=2E81aa9e04f0 100644
>--- a/hw/i386/pc_q35=2Ec
>+++ b/hw/i386/pc_q35=2Ec
>@@ -57,10 +57,24 @@
> #include "hw/hyperv/vmbus-bridge=2Eh"
> #include "hw/mem/nvdimm=2Eh"
> #include "hw/i386/acpi-build=2Eh"
>+#include "hw/xen/xen-x86=2Eh"
>+#include "sysemu/xen=2Eh"
>=20
> /* ICH9 AHCI has 6 ports */
> #define MAX_SATA_PORTS     6
>=20
>+static void q35_xen_hvm_init(MachineState *machine)
>+{
>+    PCMachineState *pcms =3D PC_MACHINE(machine);
>+
>+    if (xen_enabled()) {
>+        /* check if Xen Platform device is enabled */
>+        if (machine->xen_platform_dev) {
>+            pci_create_simple(pcms->bus, -1, "xen-platform");
>+        }
>+    }
>+}
>+
> struct ehci_companions {
>     const char *name;
>     int func;
>@@ -131,6 +145,7 @@ static void pc_q35_init(MachineState *machine)
>     MemoryRegion *system_io =3D get_system_io();
>     MemoryRegion *pci_memory;
>     MemoryRegion *rom_memory;
>+    MemoryRegion *ram_memory;
>     GSIState *gsi_state;
>     ISABus *isa_bus;
>     int i;
>@@ -182,8 +197,12 @@ static void pc_q35_init(MachineState *machine)
>     }
>=20
>     pc_machine_init_sgx_epc(pcms);
>-    x86_cpus_init(x86ms, pcmc->default_cpu_version);
>=20
>+    x86_cpus_init(x86ms, pcmc->default_cpu_version);
>+    if (xen_enabled()) {
>+        xen_hvm_init_pc(pcms, &ram_memory);
>+	machine->ram =3D ram_memory;
>+    }
>     kvmclock_create(pcmc->kvmclock_create_always);
>=20
>     /* pci enabled */
>@@ -216,7 +235,15 @@ static void pc_q35_init(MachineState *machine)
>     }
>=20
>     /* allocate ram and load rom/bios */
>-    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
>+    if (!xen_enabled())=20
>+        pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size)=
;
>+     else {
>+        pc_system_flash_cleanup_unused(pcms);
>+        if (machine->kernel_filename !=3D NULL) {
>+            /* For xen HVM direct kernel boot, load linux here */
>+            xen_load_linux(pcms);
>+        }
>+    }
>=20
>     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
>     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>@@ -273,8 +300,12 @@ static void pc_q35_init(MachineState *machine)
>     for (i =3D 0; i < IOAPIC_NUM_PINS; i++) {
>         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gs=
i[i]);
>     }
>-    isa_bus =3D ISA_BUS(qdev_get_child_bus(lpc_dev, "isa=2E0"));

Why move? I'd only move if it makes code consistent with piix=2E

>=20
>+    if (xen_enabled()) {
>+        q35_xen_hvm_init(machine);
>+    }
>+
>+    isa_bus =3D ISA_BUS(qdev_get_child_bus(lpc_dev, "isa=2E0"));
>     if (x86ms->pic =3D=3D ON_OFF_AUTO_ON || x86ms->pic =3D=3D ON_OFF_AUT=
O_AUTO) {
>         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
>     }
>@@ -289,7 +320,7 @@ static void pc_q35_init(MachineState *machine)
>=20
>     assert(pcms->vmport !=3D ON_OFF_AUTO__MAX);
>     if (pcms->vmport =3D=3D ON_OFF_AUTO_AUTO) {
>-        pcms->vmport =3D ON_OFF_AUTO_ON;
>+        pcms->vmport =3D xen_enabled() ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_O=
N;
>     }
>=20
>     /* init basic PC hardware */
>diff --git a/hw/i386/xen/xen-hvm=2Ec b/hw/i386/xen/xen-hvm=2Ec
>index 56641a550e=2E=2E540ac46639 100644
>--- a/hw/i386/xen/xen-hvm=2Ec
>+++ b/hw/i386/xen/xen-hvm=2Ec
>@@ -15,6 +15,7 @@
> #include "hw/pci/pci=2Eh"
> #include "hw/pci/pci_host=2Eh"
> #include "hw/i386/pc=2Eh"
>+#include "hw/southbridge/ich9=2Eh"
> #include "hw/irq=2Eh"
> #include "hw/hw=2Eh"
> #include "hw/i386/apic-msidef=2Eh"
>@@ -136,14 +137,14 @@ typedef struct XenIOState {
>     Notifier wakeup;
> } XenIOState;
>=20
>-/* Xen specific function for piix pci */
>+/* Xen-specific functions for pci dev IRQ handling */
>=20
>-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
>+int xen_cmn_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
> {
>     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
> }
>=20
>-void xen_piix3_set_irq(void *opaque, int irq_num, int level)

I think this function should have a different name meanwhile=2E Which woul=
d make renaming possibly unneccessary=2E

>+void xen_cmn_set_irq(void *opaque, int irq_num, int level)
> {
>     xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
>                            irq_num & 3, level);
>diff --git a/hw/i386/xen/xen_platform=2Ec b/hw/i386/xen/xen_platform=2Ec
>index 57f1d742c1=2E=2E0375337222 100644
>--- a/hw/i386/xen/xen_platform=2Ec
>+++ b/hw/i386/xen/xen_platform=2Ec
>@@ -34,6 +34,7 @@
> #include "sysemu/block-backend=2Eh"
> #include "qemu/error-report=2Eh"
> #include "qemu/module=2Eh"
>+#include "include/hw/i386/pc=2Eh"
> #include "qom/object=2Eh"
>=20
> #ifdef CONFIG_XEN
>@@ -223,6 +224,12 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, vo=
id *opaque)
>         if (flags & UNPLUG_NVME_DISKS) {
>             object_unparent(OBJECT(d));
>         }
>+        break;
>+
>+    case PCI_CLASS_STORAGE_SATA:
>+	if (!aux) {
>+            object_unparent(OBJECT(d));
>+        }
>=20
>     default:
>         break;
>@@ -231,7 +238,17 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, vo=
id *opaque)
>=20
> static void pci_unplug_disks(PCIBus *bus, uint32_t flags)
> {
>-    pci_for_each_device(bus, 0, unplug_disks, &flags);
>+    PCIBus *q35 =3D find_q35();
>+    if (q35) {
>+        /* When q35 is detected, we will remove the ahci controller
>+	 * with the hard disks=2E  In the libxl config, cdrom devices
>+	 * are put on a seperate ahci controller=2E This allows for 6 cdrom
>+	 * devices to be added, and 6 qemu hard disks=2E
>+	 */
>+        pci_function_for_one_bus(bus, unplug_disks, &flags);
>+    } else {
>+        pci_for_each_device(bus, 0, unplug_disks, &flags);
>+    }
> }
>=20
> static void platform_fixed_ioport_writew(void *opaque, uint32_t addr, ui=
nt32_t val)
>diff --git a/hw/isa/lpc_ich9=2Ec b/hw/isa/lpc_ich9=2Ec
>index 9c47a2f6c7=2E=2Efbda6085d0 100644
>--- a/hw/isa/lpc_ich9=2Ec
>+++ b/hw/isa/lpc_ich9=2Ec
>@@ -51,6 +51,9 @@
> #include "hw/core/cpu=2Eh"
> #include "hw/nvram/fw_cfg=2Eh"
> #include "qemu/cutils=2Eh"
>+#include "hw/xen/xen=2Eh"
>+#include "sysemu/xen=2Eh"
>+#include "hw/southbridge/piix=2Eh"
> #include "hw/acpi/acpi_aml_interface=2Eh"
> #include "trace=2Eh"
>=20
>@@ -535,11 +538,49 @@ static int ich9_lpc_post_load(void *opaque, int ver=
sion_id)
>     return 0;
> }
>=20
>+static void ich9_lpc_config_write_xen(PCIDevice *d,
>+                                  uint32_t addr, uint32_t val, int len)
>+{  =20
>+    static bool pirqe_f_warned =3D false;
>+    if (ranges_overlap(addr, len, ICH9_LPC_PIRQA_ROUT, 4)) {
>+        /* handle PIRQA=2E=2EPIRQD routing */
>+        /* Scan for updates to PCI link routes (0x60-0x63)=2E */
>+        int i;=20
>+        for (i =3D 0; i < len; i++) {
>+            uint8_t v =3D (val >> (8 * i)) & 0xff;
>+            if (v & 0x80) {
>+                v =3D 0;
>+            }=20
>+            v &=3D 0xf;
>+            if (((addr + i) >=3D PIIX_PIRQCA) && ((addr + i) <=3D PIIX_P=
IRQCD)) {
>+                xen_set_pci_link_route(addr + i - PIIX_PIRQCA, v);
>+            }
>+        }
>+    } else if (ranges_overlap(addr, len, ICH9_LPC_PIRQE_ROUT, 4)) {
>+        while (len--) {
>+            if (range_covers_byte(ICH9_LPC_PIRQE_ROUT, 4, addr) &&
>+                (val & 0x80) =3D=3D 0) {
>+                /* print warning only once */
>+                if (!pirqe_f_warned) {
>+                    pirqe_f_warned =3D true;
>+                    fprintf(stderr, "WARNING: guest domain attempted to =
use PIRQ%c "
>+                            "routing which is not supported for Xen/Q35 =
currently\n",
>+                            (char)(addr - ICH9_LPC_PIRQE_ROUT + 'E'));
>+                    break;
>+                }
>+            }
>+            addr++, val >>=3D 8;
>+        }
>+    }
>+}
>+

Can we do the same trick here we're doing in piix -- by subscribing to PCI=
 IRQ routing change events? The goal would be to leave LPC Xen-agnostic=2E

> static void ich9_lpc_config_write(PCIDevice *d,
>                                   uint32_t addr, uint32_t val, int len)
> {
>     ICH9LPCState *lpc =3D ICH9_LPC_DEVICE(d);
>     uint32_t rcba_old =3D pci_get_long(d->config + ICH9_LPC_RC
>+    if (xen_enabled())
>+        ich9_lpc_config_write_xen(d, addr, val, len);

You could emit a PCI routing change event here unconditionally and subscri=
be to it in pc_q35=2E

>=20
>     pci_default_write_config(d, addr, val, len);
>     if (ranges_overlap(addr, len, ICH9_LPC_PMBASE, 4) ||
>@@ -731,10 +772,14 @@ static void ich9_lpc_realize(PCIDevice *d, Error **=
errp)
>         return;
>     }
>=20
>-    pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
>-    pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
>-    pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
>-
>+    if (xen_enabled()) {
>+        pci_bus_irqs(pci_bus, xen_cmn_set_irq, d, ICH9_XEN_NUM_IRQ_SOURC=
ES);
>+        pci_bus_map_irqs(pci_bus, xen_cmn_pci_slot_get_pirq);
>+    } else {
>+        pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
>+        pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
>+        pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
>+    }

This could probably be wired up Xen-agnostic as well=2E See pc_piix for in=
spiration=2E

>     ich9_lpc_pm_init(lpc);
> }
>=20
>diff --git a/hw/isa/piix3=2Ec b/hw/isa/piix3=2Ec
>index f9103ea45a=2E=2E3d0545eb0e 100644
>--- a/hw/isa/piix3=2Ec
>+++ b/hw/isa/piix3=2Ec
>@@ -420,7 +420,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error *=
*errp)
>      * connected to the IOAPIC directly=2E
>      * These additional routes can be discovered through ACPI=2E
>      */
>-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
>+    pci_bus_irqs(pci_bus, xen_cmn_set_irq, piix3, XEN_PIIX_NUM_PIRQS);

This code has changed recently=2E PIIX3 doesn't know about Xen any more=2E=
 Take some inspiration from there to keep LPC Xen-agnostic=2E

That's it for now from my side=2E

Best regards,
Bernhard

> }
>=20
> static void piix3_xen_class_init(ObjectClass *klass, void *data)
>diff --git a/hw/pci-host/q35=2Ec b/hw/pci-host/q35=2Ec
>index fd18920e7f=2E=2E3bb6325fb3 100644
>--- a/hw/pci-host/q35=2Ec
>+++ b/hw/pci-host/q35=2Ec
>@@ -37,6 +37,7 @@
> #include "qapi/error=2Eh"
> #include "qapi/visitor=2Eh"
> #include "qemu/module=2Eh"
>+#include "sysemu/xen=2Eh"
>=20
> /***********************************************************************=
*****
>  * Q35 host
>@@ -259,6 +260,15 @@ static void q35_host_initfn(Object *obj)
>                              qdev_prop_allow_set_link_before_realize, 0)=
;
> }
>=20
>+PCIBus *find_q35(void)
>+{
>+    PCIHostState *s =3D OBJECT_CHECK(PCIHostState,
>+                                   object_resolve_path("/machine/q35", N=
ULL),
>+                                   TYPE_PCI_HOST_BRIDGE);
>+    return s ? s->bus : NULL;
>+}
>+
>+
> static const TypeInfo q35_host_info =3D {
>     =2Ename       =3D TYPE_Q35_HOST_DEVICE,
>     =2Eparent     =3D TYPE_PCIE_HOST_BRIDGE,
>@@ -315,12 +325,21 @@ static void mch_update_pciexbar(MCHPCIState *mch)
>         break;
>     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M:
>         length =3D 128 * 1024 * 1024;
>-        addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK |
>-            MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>+	if (!xen_enabled()) {
>+            addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK |
>+                MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>+	} else {
>+            addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;
>+        }
>         break;
>     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_64M:
>         length =3D 64 * 1024 * 1024;
>-        addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>+	if (!xen_enabled()) {
>+            addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>+	} else {
>+            addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK |
>+                MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;=09
>+        }
>         break;
>     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
>         qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n"=
);
>@@ -561,7 +580,8 @@ static void mch_reset(DeviceState *qdev)
>     d->config[MCH_HOST_BRIDGE_F_SMBASE] =3D 0;
>     d->wmask[MCH_HOST_BRIDGE_F_SMBASE] =3D 0xff;
>=20
>-    mch_update(mch);
>+    if (!xen_enabled())
>+        mch_update(mch);
> }
>=20
> static void mch_realize(PCIDevice *d, Error **errp)
>diff --git a/hw/pci/pci=2Ec b/hw/pci/pci=2Ec
>index 1cc7c89036=2E=2E8eac3d751a 100644
>--- a/hw/pci/pci=2Ec
>+++ b/hw/pci/pci=2Ec
>@@ -1815,6 +1815,23 @@ void pci_for_each_device_reverse(PCIBus *bus, int =
bus_num,
>     }
> }
>=20
>+void pci_function_for_one_bus(PCIBus *bus,
>+                          void (*fn)(PCIBus *b, PCIDevice *d, void *opaq=
ue),
>+                          void *opaque)
>+{
>+    bus =3D pci_find_bus_nr(bus, 0);
>+
>+    if (bus) {
>+        PCIDevice *d;
>+
>+        d =3D bus->devices[PCI_DEVFN(4,0)];
>+        if (d) {
>+            fn(bus, d, opaque);
>+            return;
>+        }
>+    }
>+}
>+
> void pci_for_each_device_under_bus(PCIBus *bus,
>                                    pci_bus_dev_fn fn, void *opaque)
> {
>diff --git a/hw/xen/xen-host-pci-device=2Ec b/hw/xen/xen-host-pci-device=
=2Ec
>index 8c6e9a1716=2E=2E63481a859e 100644
>--- a/hw/xen/xen-host-pci-device=2Ec
>+++ b/hw/xen/xen-host-pci-device=2Ec
>@@ -32,6 +32,7 @@
>=20
> #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
> #define IORESOURCE_MEM_64       0x00100000
>+#define XEN_HOST_PCI_CAP_MAX    48
>=20
> static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
>                                     const char *name, char *buf, ssize_t=
 size)
>@@ -198,6 +199,19 @@ static bool xen_host_pci_dev_is_virtfn(XenHostPCIDev=
ice *d)
>     return !stat(path, &buf);
> }
>=20
>+static bool xen_host_pci_dev_has_pcie_ext_caps(XenHostPCIDevice *d)
>+{
>+    uint32_t header;
>+
>+    if (xen_host_pci_get_long(d, PCI_CONFIG_SPACE_SIZE, &header))
>+        return false;
>+
>+    if (header =3D=3D 0 || header =3D=3D ~0U)
>+        return false;
>+
>+    return true;
>+}
>+
> static void xen_host_pci_config_open(XenHostPCIDevice *d, Error **errp)
> {
>     char path[PATH_MAX];
>@@ -296,37 +310,93 @@ int xen_host_pci_set_block(XenHostPCIDevice *d, int=
 pos, uint8_t *buf, int len)
>     return xen_host_pci_config_write(d, pos, buf, len);
> }
>=20
>-int xen_host_pci_find_ext_cap_offset(XenHostPCIDevice *d, uint32_t cap)
>+int xen_host_pci_find_next_ext_cap(XenHostPCIDevice *d, int pos, uint32_=
t cap)
> {
>     uint32_t header =3D 0;
>     int max_cap =3D XEN_HOST_PCI_MAX_EXT_CAP;
>-    int pos =3D PCI_CONFIG_SPACE_SIZE;
>+
>+    if (!d->has_pcie_ext_caps)
>+        return 0;
>+
>+    if (!pos) {
>+        pos =3D PCI_CONFIG_SPACE_SIZE;
>+    } else {
>+        if (xen_host_pci_get_long(d, pos, &header))
>+            return 0;
>+
>+        pos =3D PCI_EXT_CAP_NEXT(header);
>+    }
>=20
>     do {
>+        if (!pos || pos < PCI_CONFIG_SPACE_SIZE) {
>+            break;
>+        }
>+
>         if (xen_host_pci_get_long(d, pos, &header)) {
>             break;
>         }
>         /*
>          * If we have no capabilities, this is indicated by cap ID,
>          * cap version and next pointer all being 0=2E
>+	 * Also check for all F's returned (which means PCIe ext conf space
>+	 * is unreadable for some reason)
>          */
>-        if (header =3D=3D 0) {
>+	if (header =3D=3D 0 || header =3D=3D ~0U) {
>             break;
>         }
>=20
>-        if (PCI_EXT_CAP_ID(header) =3D=3D cap) {
>+        if (cap =3D=3D CAP_ID_ANY) {
>+            return pos;
>+        } else if (PCI_EXT_CAP_ID(header) =3D=3D cap) {
>             return pos;
>         }
>=20
>         pos =3D PCI_EXT_CAP_NEXT(header);
>-        if (pos < PCI_CONFIG_SPACE_SIZE) {
>+    } while (--max_cap);
>+
>+    return 0;
>+}
>+
>+int xen_host_pci_find_next_cap(XenHostPCIDevice *d, int pos, uint32_t ca=
p)
>+{
>+    uint8_t id;
>+    unsigned max_cap =3D XEN_HOST_PCI_CAP_MAX;
>+    uint8_t status =3D 0;
>+    uint8_t curpos;
>+
>+    if (xen_host_pci_get_byte(d, PCI_STATUS, &status))
>+        return 0;
>+
>+    if ((status & PCI_STATUS_CAP_LIST) =3D=3D 0)
>+        return 0;
>+
>+    if (pos < PCI_CAPABILITY_LIST) {
>+        curpos =3D PCI_CAPABILITY_LIST;
>+    } else {
>+        curpos =3D (uint8_t) pos;
>+    }
>+
>+    while (max_cap--) {
>+        if (xen_host_pci_get_byte(d, curpos, &curpos))
>+             break;
>+        if (!curpos)
>+             break;
>+
>+        if (cap =3D=3D CAP_ID_ANY)
>+            return curpos;
>+
>+        if (xen_host_pci_get_byte(d, curpos + PCI_CAP_LIST_ID, &id))
>             break;
>-        }
>=20
>-        max_cap--;
>-    } while (max_cap > 0);
>+        if (id =3D=3D 0xff)
>+            break;
>+        else if (id =3D=3D cap)
>+            return curpos;
>+
>+        curpos +=3D PCI_CAP_LIST_NEXT;
>+    }
>=20
>-    return -1;
>+    return 0;
> }
>=20
> void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
>@@ -335,6 +405,7 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uin=
t16_t domain,
> {
>     ERRP_GUARD();
>     unsigned int v;
>+    int pcie_cap_pos;
>=20
>     d->config_fd =3D -1;
>     d->domain =3D domain;
>@@ -376,7 +447,22 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, ui=
nt16_t domain,
>     }
>     d->class_code =3D v;
>=20
>-    d->is_virtfn =3D xen_host_pci_dev_is_virtfn(d);
>+    d->is_virtfn         =3D xen_host_pci_dev_is_virtfn(d);
>+    d->has_pcie_ext_caps =3D xen_host_pci_dev_has_pcie_ext_caps(d);
>+
>+    /* read and store PCIe Capabilities field for later use */
>+    pcie_cap_pos =3D xen_host_pci_find_next_cap(d, 0, PCI_CAP_ID_EXP);
>+
>+    if (pcie_cap_pos) {
>+        if (xen_host_pci_get_word(d, pcie_cap_pos + PCI_EXP_FLAGS,
>+                                  &d->pcie_flags)) {
>+            error_setg(errp, "Unable to read from PCI Express capability=
 "
>+                       "structure at 0x%x", pcie_cap_pos);
>+            goto error;
>+        }
>+    } else {
>+        d->pcie_flags =3D 0xFFFF;
>+    }
>=20
>     return;
>=20
>diff --git a/hw/xen/xen-host-pci-device=2Eh b/hw/xen/xen-host-pci-device=
=2Eh
>index 4d8d34ecb0=2E=2E2884c4b4b9 100644
>--- a/hw/xen/xen-host-pci-device=2Eh
>+++ b/hw/xen/xen-host-pci-device=2Eh
>@@ -27,11 +27,13 @@ typedef struct XenHostPCIDevice {
>     uint16_t device_id;
>     uint32_t class_code;
>     int irq;
>+    uint16_t pcie_flags;
>=20
>     XenHostPCIIORegion io_regions[PCI_NUM_REGIONS - 1];
>     XenHostPCIIORegion rom;
>=20
>     bool is_virtfn;
>+    bool has_pcie_ext_caps;
>=20
>     int config_fd;
> } XenHostPCIDevice;
>@@ -53,6 +55,8 @@ int xen_host_pci_set_long(XenHostPCIDevice *d, int pos,=
 uint32_t data);
> int xen_host_pci_set_block(XenHostPCIDevice *d, int pos, uint8_t *buf,
>                            int len);
>=20
>-int xen_host_pci_find_ext_cap_offset(XenHostPCIDevice *s, uint32_t cap);
>+#define CAP_ID_ANY  (~0U)
>+int xen_host_pci_find_next_cap(XenHostPCIDevice *s, int pos, uint32_t ca=
p);
>+int xen_host_pci_find_next_ext_cap(XenHostPCIDevice *d, int pos, uint32_=
t cap);
>=20
> #endif /* XEN_HOST_PCI_DEVICE_H */
>diff --git a/hw/xen/xen_pt=2Ec b/hw/xen/xen_pt=2Ec
>index a540149639=2E=2E2399fabb2b 100644
>--- a/hw/xen/xen_pt=2Ec
>+++ b/hw/xen/xen_pt=2Ec
>@@ -96,8 +96,16 @@ void xen_pt_log(const PCIDevice *d, const char *f, =2E=
=2E=2E)
>=20
> static int xen_pt_pci_config_access_check(PCIDevice *d, uint32_t addr, i=
nt len)
> {
>+    XenPCIPassthroughState *s =3D XEN_PT_DEVICE(d);
>     /* check offset range */
>-    if (addr > 0xFF) {
>+    if (s->pcie_enabled_dev) {
>+        if (addr >=3D PCIE_CONFIG_SPACE_SIZE) {
>+            XEN_PT_ERR(d, "Failed to access register with offset "
>+                          "exceeding 0xFFF=2E (addr: 0x%02x, len: %d)\n"=
,
>+                          addr, len);
>+            return -1;
>+        }
>+    } else if (addr >=3D PCI_CONFIG_SPACE_SIZE) {
>         XEN_PT_ERR(d, "Failed to access register with offset exceeding 0=
xFF=2E "
>                    "(addr: 0x%02x, len: %d)\n", addr, len);
>         return -1;
>@@ -156,7 +164,16 @@ static uint32_t xen_pt_pci_read_config(PCIDevice *d,=
 uint32_t addr, int len)
>     reg_grp_entry =3D xen_pt_find_reg_grp(s, addr);
>     if (reg_grp_entry) {
>         /* check 0-Hardwired register group */
>-        if (reg_grp_entry->reg_grp->grp_type =3D=3D XEN_PT_GRP_TYPE_HARD=
WIRED) {
>+        if (reg_grp_entry->reg_grp->grp_type =3D=3D XEN_PT_GRP_TYPE_HARD=
WIRED &&
>+            /*
>+             * For PCIe Extended Capabilities we need to emulate
>+             * CapabilityID and NextCapability/Version registers for a
>+             * hardwired reg group located at the offset 0x100 in PCIe
>+             * config space=2E This allows us to hide the first extended
>+             * capability as well=2E
>+             */
>+            !(reg_grp_entry->base_offset =3D=3D PCI_CONFIG_SPACE_SIZE &&
>+            ranges_overlap(addr, len, 0x100, 4))) {
>             /* no need to emulate, just return 0 */
>             val =3D 0;
>             goto exit;
>@@ -701,6 +718,21 @@ static const MemoryListener xen_pt_io_listener =3D {
>     =2Epriority =3D 10,
> };
>=20
>+static inline bool xen_pt_dev_is_pcie_mode(PCIDevice *d)
>+{
>+    XenPCIPassthroughState *s =3D XEN_PT_DEVICE(d);
>+    PCIBus *bus =3D pci_get_bus(d);
>+
>+    if (bus !=3D NULL) {
>+        if (pci_is_express(d) && pci_bus_is_express(bus) &&
>+            xen_host_pci_find_next_cap(&s->real_device, 0, PCI_CAP_ID_EX=
P)) {
>+            return true;
>+        }
>+    }
>+
>+    return false;
>+}
>+
> /* destroy=2E */
> static void xen_pt_destroy(PCIDevice *d) {
>=20
>@@ -787,8 +819,17 @@ static void xen_pt_realize(PCIDevice *d, Error **err=
p)
>                    s->real_device=2Edev, s->real_device=2Efunc);
>     }
>=20
>-    /* Initialize virtualized PCI configuration (Extended 256 Bytes) */
>-    memset(d->config, 0, PCI_CONFIG_SPACE_SIZE);
>+    s->pcie_enabled_dev =3D xen_pt_dev_is_pcie_mode(d);
>+    if (s->pcie_enabled_dev) {
>+        XEN_PT_LOG(d, "Host device %04x:%02x:%02x=2E%d passed thru "
>+                   "in PCIe mode\n", s->real_device=2Edomain,
>+                    s->real_device=2Ebus, s->real_device=2Edev,
>+                    s->real_device=2Efunc);
>+    }
>+
>+    /* Initialize virtualized PCI configuration space (256/4K bytes) */
>+    memset(d->config, 0, pci_is_express(d) ? PCIE_CONFIG_SPACE_SIZE
>+                                           : PCI_CONFIG_SPACE_SIZE);
>=20
>     s->memory_listener =3D xen_pt_memory_listener;
>     s->io_listener =3D xen_pt_io_listener;
>diff --git a/hw/xen/xen_pt=2Eh b/hw/xen/xen_pt=2Eh
>index b20744f7c7=2E=2E0ed6e77e76 100644
>--- a/hw/xen/xen_pt=2Eh
>+++ b/hw/xen/xen_pt=2Eh
>@@ -33,6 +33,11 @@ void xen_pt_log(const PCIDevice *d, const char *f, =2E=
=2E=2E) G_GNUC_PRINTF(2, 3);
> /* Helper */
> #define XEN_PFN(x) ((x) >> XC_PAGE_SHIFT)
>=20
>+/* Macro's for PCIe Extended Capabilities */
>+#define PCIE_EXT_CAP_ID(cap_id)     ((cap_id) | (1U << 16))
>+#define IS_PCIE_EXT_CAP_ID(grp_id)  ((grp_id) & (1U << 16))
>+#define GET_PCIE_EXT_CAP_ID(grp_id) ((grp_id) & 0xFFFF)
>+
> typedef const struct XenPTRegInfo XenPTRegInfo;
> typedef struct XenPTReg XenPTReg;
>=20
>@@ -88,6 +93,11 @@ typedef int (*xen_pt_conf_byte_read)
>=20
> #define XEN_PCI_INTEL_OPREGION 0xfc
>=20
>+#define XEN_PCIE_CAP_ID 0
>+#define XEN_PCIE_CAP_LIST_NEXT 2
>+#define XEN_PCIE_FAKE_CAP_ID_BASE 0xFE00
>+
>+
> #define XEN_PCI_IGD_DOMAIN 0
> #define XEN_PCI_IGD_BUS 0
> #define XEN_PCI_IGD_DEV 2
>@@ -174,13 +184,13 @@ typedef const struct XenPTRegGroupInfo XenPTRegGrou=
pInfo;
> /* emul reg group size initialize method */
> typedef int (*xen_pt_reg_size_init_fn)
>     (XenPCIPassthroughState *, XenPTRegGroupInfo *,
>-     uint32_t base_offset, uint8_t *size);
>+     uint32_t base_offset, uint32_t *size);
>=20
> /* emulated register group information */
> struct XenPTRegGroupInfo {
>-    uint8_t grp_id;
>+    uint32_t grp_id;
>     XenPTRegisterGroupType grp_type;
>-    uint8_t grp_size;
>+    uint32_t grp_size;
>     xen_pt_reg_size_init_fn size_init;
>     XenPTRegInfo *emu_regs;
> };
>@@ -190,7 +200,7 @@ typedef struct XenPTRegGroup {
>     QLIST_ENTRY(XenPTRegGroup) entries;
>     XenPTRegGroupInfo *reg_grp;
>     uint32_t base_offset;
>-    uint8_t size;
>+    uint32_t size;
>     QLIST_HEAD(, XenPTReg) reg_tbl_list;
> } XenPTRegGroup;
>=20
>@@ -234,6 +244,7 @@ struct XenPCIPassthroughState {
>=20
>     PCIHostDeviceAddress hostaddr;
>     bool is_virtfn;
>+    bool pcie_enabled_dev;
>     bool permissive;
>     bool permissive_warned;
>     XenHostPCIDevice real_device;
>diff --git a/hw/xen/xen_pt_config_init=2Ec b/hw/xen/xen_pt_config_init=2E=
c
>index 2b8680b112=2E=2Ecc583f9cc1 100644
>--- a/hw/xen/xen_pt_config_init=2Ec
>+++ b/hw/xen/xen_pt_config_init=2Ec
>@@ -16,6 +16,7 @@
> #include "qapi/error=2Eh"
> #include "qemu/timer=2Eh"
> #include "xen_pt=2Eh"
>+#include "xen-host-pci-device=2Eh"
> #include "hw/xen/xen-legacy-backend=2Eh"
>=20
> #define XEN_PT_MERGE_VALUE(value, data, val_mask) \
>@@ -27,33 +28,52 @@
>=20
> static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *=
reg,
>                                uint32_t real_offset, uint32_t *data);
>-
>+static int xen_pt_ext_cap_ptr_reg_init(XenPCIPassthroughState *s,
>+                                       XenPTRegInfo *reg,
>+                                       uint32_t real_offset,
>+                                       uint32_t *data);
>+static int xen_pt_ext_cap_capid_reg_init(XenPCIPassthroughState *s,
>+                                         XenPTRegInfo *reg,
>+                                         uint32_t real_offset,
>+                                         uint32_t *data);
>=20
> /* helper */
>=20
> /* A return value of 1 means the capability should NOT be exposed to gue=
st=2E */
>-static int xen_pt_hide_dev_cap(const XenHostPCIDevice *d, uint8_t grp_id=
)
>-{
>-    switch (grp_id) {
>-    case PCI_CAP_ID_EXP:
>-        /* The PCI Express Capability Structure of the VF of Intel 82599=
 10GbE
>-         * Controller looks trivial, e=2Eg=2E, the PCI Express Capabilit=
ies
>-         * Register is 0=2E We should not try to expose it to guest=2E
>-         *
>-         * The datasheet is available at
>-         * http://download=2Eintel=2Ecom/design/network/datashts/82599_d=
atasheet=2Epdf
>-         *
>-         * See 'Table 9=2E7=2E VF PCIe Configuration Space' of the datas=
heet, the
>-         * PCI Express Capability Structure of the VF of Intel 82599 10G=
bE
>-         * Controller looks trivial, e=2Eg=2E, the PCI Express Capabilit=
ies
>-         * Register is 0, so the Capability Version is 0 and
>-         * xen_pt_pcie_size_init() would fail=2E
>-         */
>-        if (d->vendor_id =3D=3D PCI_VENDOR_ID_INTEL &&
>-            d->device_id =3D=3D PCI_DEVICE_ID_INTEL_82599_SFP_VF) {
>-            return 1;
>+static int xen_pt_hide_dev_cap(const XenHostPCIDevice *d, uint32_t grp_i=
d)

