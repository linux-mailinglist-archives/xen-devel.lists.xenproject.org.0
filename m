Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6806A94FB83
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775876.1186075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgn3-0000rW-MV; Tue, 13 Aug 2024 01:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775876.1186075; Tue, 13 Aug 2024 01:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgn3-0000pX-JS; Tue, 13 Aug 2024 01:57:37 +0000
Received: by outflank-mailman (input) for mailman id 775876;
 Tue, 13 Aug 2024 01:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgei-0004Ab-6D
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:49:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34470c8a-5916-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 03:48:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A8E57CE1098;
 Tue, 13 Aug 2024 01:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D283BC4AF0D;
 Tue, 13 Aug 2024 01:48:53 +0000 (UTC)
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
X-Inumbo-ID: 34470c8a-5916-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513735;
	bh=w8vlPPtODSw90+pIoQfmtnrCRRyHr5wjswxQko6T8mI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rDoU1HSpXyr5PS2/vrk44E8rfd91Rkv9HimR5BfNA3XLSVeeml4JyeV4Fj3u2j9Ri
	 4RzsyGnIuwaP/3byeB5pshu7bj70M0sHdIHJGLWh7bVDuYr/9U5nk5R9WevIVaW7jW
	 OtJMnyPeZMbQID9OQcONtz/CTdmqfmp2vU8KGji9NIMxfIU1DSc+v/0f0lrgWjIOHs
	 I2694k81jPSwrjiRq/NnQtsqVdaWxlXlZcZQSMJKlYonOxjYHCDUra/UWphSJXa6iv
	 Xdu+EAYBa/CKj1CJOSwuU68/M5Ql+8p5Fxa7/Xx4hOgFteGGwfQgodZt3TII/MuiHq
	 VzitMcQMMTOvA==
Date: Mon, 12 Aug 2024 18:48:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v1 09/10] hw/i386/xen: Add a Xen PVH x86 machine
In-Reply-To: <20240812130606.90410-10-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121840230.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-10-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> This adds a Xen PVH x86 machine based on the PVH Common
> module used by the ARM PVH machine.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/i386/xen/meson.build |   1 +
>  hw/i386/xen/xen-pvh.c   | 196 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 197 insertions(+)
>  create mode 100644 hw/i386/xen/xen-pvh.c
> 
> diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
> index 3f0df8bc07..c73c62b8e3 100644
> --- a/hw/i386/xen/meson.build
> +++ b/hw/i386/xen/meson.build
> @@ -4,6 +4,7 @@ i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>  ))
>  i386_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
>    'xen-hvm.c',
> +  'xen-pvh.c',
>  ))
>  
>  i386_ss.add(when: 'CONFIG_XEN_BUS', if_true: files(
> diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
> new file mode 100644
> index 0000000000..9c3d3fc58d
> --- /dev/null
> +++ b/hw/i386/xen/xen-pvh.c
> @@ -0,0 +1,196 @@
> +/*
> + * QEMU Xen PVH x86 Machine
> + *
> + * Copyright (c) 2024 Advanced Micro Devices, Inc.
> + * Written by Edgar E. Iglesias <edgar.iglesias@amd.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/error-report.h"
> +#include "hw/boards.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/xen/arch_hvm.h"
> +#include "hw/xen/xen.h"
> +#include "hw/xen/xen-pvh-common.h"
> +
> +#define TYPE_XEN_PVH_X86  MACHINE_TYPE_NAME("xenpvh")
> +OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)
> +
> +#define PVH_MAX_CPUS 128
> +
> +struct XenPVHx86State {
> +    /*< private >*/
> +    MachineState parent;
> +
> +    DeviceState *cpu[PVH_MAX_CPUS];
> +    XenPVHCommonState pvh;
> +
> +    /*
> +     * We provide these properties to allow Xen to move things to other
> +     * addresses for example when users need to accomodate the memory-map
> +     * for 1:1 mapped devices/memory.
> +     */
> +    struct {
> +        MemMapEntry ram_low, ram_high;
> +        MemMapEntry pci_ecam, pci_mmio, pci_mmio_high;

Can we use the same properties already present under XenPVHCommonState?



> +    } cfg;
> +};
> +
> +static void xenpvh_cpu_new(MachineState *ms,
> +                           XenPVHx86State *xp,
> +                           int cpu_idx,
> +                           int64_t apic_id)
> +{
> +    Object *cpu = object_new(ms->cpu_type);
> +
> +    object_property_add_child(OBJECT(ms), "cpu[*]", cpu);
> +    object_property_set_uint(cpu, "apic-id", apic_id, &error_fatal);
> +    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
> +    object_unref(cpu);
> +
> +    xp->cpu[cpu_idx] = DEVICE(cpu);


Why do we need to create CPU devices in QEMU given that we are only
doing device emulation? I guess it is because ....



> +}
> +
> +static void xenpvh_init(MachineState *ms)
> +{
> +    XenPVHx86State *xp = XEN_PVH_X86(ms);
> +    const struct {
> +        const char *name;
> +        MemMapEntry *map;
> +    } map[] = {
> +        { "ram-low", &xp->cfg.ram_low },
> +        { "ram-high", &xp->cfg.ram_high },
> +        { "pci-ecam", &xp->cfg.pci_ecam },
> +        { "pci-mmio", &xp->cfg.pci_mmio },
> +        { "pci-mmio-high", &xp->cfg.pci_mmio_high },
> +    };
> +    int i;
> +
> +    object_initialize_child(OBJECT(ms), "pvh", &xp->pvh, TYPE_XEN_PVH_COMMON);
> +    object_property_set_int(OBJECT(&xp->pvh), "max-cpus", ms->smp.max_cpus,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&xp->pvh), "ram-size", ms->ram_size,
> +                            &error_abort);
> +
> +    for (i = 0; i < ARRAY_SIZE(map); i++) {
> +        g_autofree char *base_name = g_strdup_printf("%s-base", map[i].name);
> +        g_autofree char *size_name = g_strdup_printf("%s-size", map[i].name);
> +
> +        object_property_set_int(OBJECT(&xp->pvh), base_name, map[i].map->base,
> +                                 &error_abort);
> +        object_property_set_int(OBJECT(&xp->pvh), size_name, map[i].map->size,
> +                                 &error_abort);
> +    }
> +
> +    /* GSI's 16 - 20 are used for legacy PCIe INTX IRQs.  */
> +    object_property_set_int(OBJECT(&xp->pvh), "pci-intx-irq-base", 16,
> +                            &error_abort);
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&xp->pvh), &error_abort);
> +
> +    /* Create dummy cores. This will indirectly create the APIC MSI window.  */

... of the APIC MSI window ?



> +    for (i = 0; i < ms->smp.cpus; i++) {
> +        xenpvh_cpu_new(ms, xp, i, i);
> +    }
> +}
> +
> +#define XENPVH_PROP_MEMMAP_SETTER(n, f)                                    \
> +static void xenpvh_set_ ## n ## _ ## f(Object *obj, Visitor *v,            \
> +                                       const char *name, void *opaque,     \
> +                                       Error **errp)                       \
> +{                                                                          \
> +    XenPVHx86State *xp = XEN_PVH_X86(obj);                                 \
> +    uint64_t value;                                                        \
> +                                                                           \
> +    if (!visit_type_size(v, name, &value, errp)) {                         \
> +        return;                                                            \
> +    }                                                                      \
> +    xp->cfg.n.f = value;                                                   \
> +}
> +
> +#define XENPVH_PROP_MEMMAP_GETTER(n, f)                                    \
> +static void xenpvh_get_ ## n ## _ ## f(Object *obj, Visitor *v,            \
> +                                       const char *name, void *opaque,     \
> +                                       Error **errp)                       \
> +{                                                                          \
> +    XenPVHx86State *xp = XEN_PVH_X86(obj);                                 \
> +    uint64_t value = xp->cfg.n.f;                                          \
> +                                                                           \
> +    visit_type_uint64(v, name, &value, errp);                              \
> +}
> +
> +#define XENPVH_PROP_MEMMAP(n)              \
> +    XENPVH_PROP_MEMMAP_SETTER(n, base)     \
> +    XENPVH_PROP_MEMMAP_SETTER(n, size)     \
> +    XENPVH_PROP_MEMMAP_GETTER(n, base)     \
> +    XENPVH_PROP_MEMMAP_GETTER(n, size)
> +
> +
> +XENPVH_PROP_MEMMAP(ram_low)
> +XENPVH_PROP_MEMMAP(ram_high)
> +XENPVH_PROP_MEMMAP(pci_ecam)
> +XENPVH_PROP_MEMMAP(pci_mmio)
> +XENPVH_PROP_MEMMAP(pci_mmio_high)

I would make all of these common with ARM. It wouldn't hurt to make them
configurable on ARM too, in fact we might need it for 1:1 mapped guests



> +static void xenpvh_instance_init(Object *obj)
> +{
> +    XenPVHx86State *xp = XEN_PVH_X86(obj);
> +
> +    /* Default memmap.  */
> +    xp->cfg.ram_low.base = 0x0;
> +    xp->cfg.ram_low.size = 0x80000000U;
> +    xp->cfg.ram_high.base = 0xC000000000ULL;
> +    xp->cfg.ram_high.size = 0x4000000000ULL;
> +}
> +
> +static void xenpvh_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "Xen PVH x86 machine";
> +    mc->init = xenpvh_init;
> +    mc->max_cpus = PVH_MAX_CPUS;
> +    mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
> +    mc->default_machine_opts = "accel=xen";
> +    /* Set explicitly here to make sure that real ram_size is passed */
> +    mc->default_ram_size = 0;
> +
> +#define OC_MEMMAP_PROP(c, prop_name, name)                               \
> +do {                                                                     \
> +    object_class_property_add(c, prop_name "-base", "uint64_t",          \
> +                              xenpvh_get_ ## name ## _base,              \
> +                              xenpvh_set_ ## name ## _base, NULL, NULL); \
> +    object_class_property_set_description(oc, prop_name "-base",         \
> +                              prop_name " base address");                \
> +    object_class_property_add(c, prop_name "-size", "uint64_t",          \
> +                              xenpvh_get_ ## name ## _size,              \
> +                              xenpvh_set_ ## name ## _size, NULL, NULL); \
> +    object_class_property_set_description(oc, prop_name "-size",         \
> +                              prop_name " size of memory region");       \
> +} while (0)
> +
> +    OC_MEMMAP_PROP(oc, "ram-low", ram_low);
> +    OC_MEMMAP_PROP(oc, "ram-high", ram_high);
> +    OC_MEMMAP_PROP(oc, "pci-ecam", pci_ecam);
> +    OC_MEMMAP_PROP(oc, "pci-mmio", pci_mmio);
> +    OC_MEMMAP_PROP(oc, "pci-mmio-high", pci_mmio_high);
> +}
> +
> +static const TypeInfo xenpvh_machine_type = {
> +    .name = TYPE_XEN_PVH_X86,
> +    .parent = TYPE_MACHINE,
> +    .class_init = xenpvh_machine_class_init,
> +    .instance_init = xenpvh_instance_init,
> +    .instance_size = sizeof(XenPVHx86State),
> +};
> +
> +static void xenpvh_machine_register_types(void)
> +{
> +    type_register_static(&xenpvh_machine_type);
> +}
> +
> +type_init(xenpvh_machine_register_types)
> -- 
> 2.43.0
> 

