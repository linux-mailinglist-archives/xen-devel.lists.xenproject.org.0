Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB227F73D6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640635.999116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VKP-0006db-Ab; Fri, 24 Nov 2023 12:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640635.999116; Fri, 24 Nov 2023 12:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VKP-0006bX-7o; Fri, 24 Nov 2023 12:30:37 +0000
Received: by outflank-mailman (input) for mailman id 640635;
 Fri, 24 Nov 2023 12:30:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TtXz=HF=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1r6VKO-0006W5-1C
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:30:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4286d232-8ac5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 13:30:33 +0100 (CET)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-764UsHq8PWG6qsSSWXmzag-1; Fri, 24 Nov 2023 07:30:30 -0500
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9fd0a58549bso212631766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 04:30:30 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a170906074200b009d268e3b801sm2005640ejb.37.2023.11.24.04.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 04:30:28 -0800 (PST)
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
X-Inumbo-ID: 4286d232-8ac5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700829032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOnQZJiPoycuaOOjIvzYkhhazzVkk/CroKuGK8Q3kS4=;
	b=EMhi0IVHf+TTvqryj3L+HFy7U2v+qWUEQwuyN56/JFiaXlS0e5AKvQBwfK36zMlLM/KkCq
	d5DuZ4mpR15z8H7tGXCaUU9ZakfYywaSrO+JSrXLU6RpslDNOD7y0UFZFW+VWqvPQSuFb5
	0aoOVanSxstglhcCiwjGwX/ugws6XgY=
X-MC-Unique: 764UsHq8PWG6qsSSWXmzag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829030; x=1701433830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOnQZJiPoycuaOOjIvzYkhhazzVkk/CroKuGK8Q3kS4=;
        b=nA8UjZ+xECrWbW1sNa24HefX2cBdvasXVzFl7gfexWzAWwexX/ziwVf2DibTeiqTAk
         9oSteZB9eqUkUIG9uBOCNArS38b1YFkqpuNLvhqEW8ILzyYGFq+3DQo0dc8ui/SmTjSu
         pin9U1YzYkgTCpmb/OO73cgM7JoF/4K0umYIWP48LKepISeNrjsqQ2gIJoUtm8zlfdqg
         B7PkKfTjQ1W0QxKVEUSnyjaBiXfRdJ/dS5q+xd/1jF0hg+XxDCL3MhXCC4QVH5xgRXgP
         iPm33SbwnAxN9nK9Y7fTgTcgJPanoZhK4BSvyBztCg/mNXud6YcrZJx6GS27Q9j/iQ5A
         42zA==
X-Gm-Message-State: AOJu0Yxj4AyDWcGKsQNjsbWTHfiud2hTOySSq+l/GEcMSETBcIxuc5BC
	fmWCZNwmVfoUDhBf1QmafoN5qVdkAxVtuosK223K5tcFSZeyNXU7famNZMSsiybepnOgY+D9yiu
	aiU+U3KxruajFaQN3UV3zi48SNGc=
X-Received: by 2002:a17:906:5308:b0:a01:bd67:d2fb with SMTP id h8-20020a170906530800b00a01bd67d2fbmr5048526ejo.0.1700829029730;
        Fri, 24 Nov 2023 04:30:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5hhYCSBRFGjFVJaIpCtN6Ifeb8GN525CYnoyjVkMd+Ma3rQLs4ESjB+FNOmY5MZ/w2M2iWg==
X-Received: by 2002:a17:906:5308:b0:a01:bd67:d2fb with SMTP id h8-20020a170906530800b00a01bd67d2fbmr5048504ejo.0.1700829029358;
        Fri, 24 Nov 2023 04:30:29 -0800 (PST)
Date: Fri, 24 Nov 2023 13:30:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, David Woodhouse
 <dwmw@amazon.co.uk>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Oleksandr Tyshchenko
 <Oleksandr_Tyshchenko@epam.com>, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Message-ID: <20231124133028.72ba1d6e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231121221023.419901-7-volodymyr_babchuk@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
	<20231121221023.419901-7-volodymyr_babchuk@epam.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Nov 2023 22:10:28 +0000
Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The bridge is needed for virtio-pci support, as QEMU can emulate the
> whole bridge with any virtio-pci devices connected to it.
> 
> This patch provides a flexible way to configure PCIe brige resources
> with xenstore. We made this for several reasons:
> 
> - We don't want to clash with vPCI devices, so we need information
>   from Xen toolstack on which PCI bus to use.
> - The guest memory layout that describes these resources is not stable
>   and may vary between guests, so we cannot rely on static resources
>   to be always the same for both ends.
> - Also the device-models which run in different domains and serve
>   virtio-pci devices for the same guest should use different host
>   bridge resources for Xen to distinguish. The rule for the guest
>   device-tree generation is one PCI host bridge per backend domain.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes from v1:
> 
>  - Renamed virtio_pci_host to pcie_host entries in XenStore, because
>  there is nothing specific to virtio-pci: any PCI device can be
>  emulated via this newly created bridge.
> ---
>  hw/arm/xen_arm.c            | 186 ++++++++++++++++++++++++++++++++++++
>  hw/xen/xen-hvm-common.c     |   9 +-
>  include/hw/xen/xen_native.h |   8 +-
>  3 files changed, 200 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index b9c3ae14b6..d506d55d0f 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -22,6 +22,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/visitor.h"
> @@ -34,6 +35,9 @@
>  #include "hw/xen/xen-hvm-common.h"
>  #include "sysemu/tpm.h"
>  #include "hw/xen/arch_hvm.h"
> +#include "exec/address-spaces.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/virtio/virtio-pci.h"
>  
>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>  OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> @@ -58,6 +62,11 @@ struct XenArmState {
>      struct {
>          uint64_t tpm_base_addr;
>      } cfg;
> +
> +    MemMapEntry pcie_mmio;
> +    MemMapEntry pcie_ecam;
> +    MemMapEntry pcie_mmio_high;
> +    int         pcie_irq;
>  };
>  
>  static MemoryRegion ram_lo, ram_hi;
> @@ -73,6 +82,7 @@ static MemoryRegion ram_lo, ram_hi;
>  #define NR_VIRTIO_MMIO_DEVICES   \
>     (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
>  
> +/* TODO It should be xendevicemodel_set_pci_intx_level() for PCI interrupts. */
>  static void xen_set_irq(void *opaque, int irq, int level)
>  {
>      if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> @@ -129,6 +139,176 @@ static void xen_init_ram(MachineState *machine)
>      }
>  }
>  
> +static void xen_create_pcie(XenArmState *xam)
> +{
> +    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
> +    MemoryRegion *ecam_alias, *ecam_reg;
> +    DeviceState *dev;
> +    int i;
> +
> +    dev = qdev_new(TYPE_GPEX_HOST);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    /* Map ECAM space */
> +    ecam_alias = g_new0(MemoryRegion, 1);
> +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
> +                             ecam_reg, 0, xam->pcie_ecam.size);
> +    memory_region_add_subregion(get_system_memory(), xam->pcie_ecam.base,
> +                                ecam_alias);
> +
> +    /* Map the MMIO space */
> +    mmio_alias = g_new0(MemoryRegion, 1);
> +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> +    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
> +                             mmio_reg,
> +                             xam->pcie_mmio.base,
> +                             xam->pcie_mmio.size);
> +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio.base,
> +                                mmio_alias);
> +
> +    /* Map the MMIO_HIGH space */
> +    mmio_alias_high = g_new0(MemoryRegion, 1);
> +    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high",
> +                             mmio_reg,
> +                             xam->pcie_mmio_high.base,
> +                             xam->pcie_mmio_high.size);
> +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio_high.base,
> +                                mmio_alias_high);
> +
> +    /* Legacy PCI interrupts (#INTA - #INTD) */
> +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> +        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
> +                                         xam->pcie_irq + i);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> +        gpex_set_irq_num(GPEX_HOST(dev), i, xam->pcie_irq + i);
> +    }
> +

> +    DPRINTF("Created PCIe host bridge\n");
replace DPRINTFs with trace_foo(), see 885f380f7be for example

> +}
> +
> +static bool xen_read_pcie_prop(XenArmState *xam, unsigned int xen_domid,
> +                               const char *prop_name, unsigned long *data)
> +{
> +    char path[128], *value = NULL;
> +    unsigned int len;
> +    bool ret = true;
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/%s",
> +             xen_domid, prop_name);

try to avoid usage of snprintf() in series
see d2fe2264679 as an example

> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
maybe use g_autofree

> +
> +    if (qemu_strtou64(value, NULL, 16, data)) {
> +        error_report("xenpv: Failed to get 'pcie_host/%s' prop",
> +                     prop_name);

if it's error, then better would be to use error_fatal so qemu would exit
on the 1st encounter.

> +        ret = false;
> +    }
> +
> +    free(value);
> +
> +    return ret;
> +}
> +
> +static int xen_get_pcie_params(XenArmState *xam)
> +{
> +    char path[128], *value = NULL, **entries = NULL;
> +    unsigned int len, tmp;
> +    int rc = -1;
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host",
> +             xen_domid);
> +    entries = xs_directory(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (entries == NULL) {
> +        error_report("xenpv: 'pcie_host' dir is not present");
> +        return -1;
> +    }
> +    free(entries);

maybe use g_autofree for strings in this function

> +    if (len != 9) {
> +        error_report("xenpv: Unexpected number of entries in 'pcie_host' dir");
> +        goto out;
> +    }
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/id",
> +             xen_domid);
> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (qemu_strtoui(value, NULL, 10, &tmp)) {
> +        error_report("xenpv: Failed to get 'pcie_host/id' prop");
> +        goto out;
> +    }
> +    free(value);

> +    value = NULL;
and then get rid of pointless assignment 

> +    if (tmp > 0xffff) {
> +        error_report("xenpv: Wrong 'pcie_host/id' value %u", tmp);
> +        goto out;
> +    }
> +    xen_pci_segment = tmp;
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_base",
> +                            &xam->pcie_ecam.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "ecam_size",
> +                            &xam->pcie_ecam.size)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "mem_base",
> +                            &xam->pcie_mmio.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "mem_size",
> +                            &xam->pcie_mmio.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_base",
> +                            &xam->pcie_mmio_high.base)) {
> +        goto out;
> +    }
> +
> +    if (!xen_read_pcie_prop(xam, xen_domid, "prefetch_mem_size",
> +                            &xam->pcie_mmio_high.size)) {
> +        goto out;
> +    }
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/irq_first",
> +             xen_domid);
> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (qemu_strtoi(value, NULL, 10, &xam->pcie_irq)) {
> +        error_report("xenpv: Failed to get 'pcie_host/irq_first' prop");
> +        goto out;
> +    }
> +    free(value);
> +    value = NULL;
> +    DPRINTF("PCIe host bridge: irq_first %u\n", xam->pcie_irq);
> +
> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/num_irqs",
> +             xen_domid);
> +    value = xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> +    if (qemu_strtoui(value, NULL, 10, &tmp)) {
> +        error_report("xenpv: Failed to get 'pcie_host/num_irqs' prop");
> +        goto out;
> +    }
> +    free(value);
> +    value = NULL;
> +    if (tmp != GPEX_NUM_IRQS) {
> +        error_report("xenpv: Wrong 'pcie_host/num_irqs' value %u", tmp);
> +        goto out;
> +    }
> +    DPRINTF("PCIe host bridge: num_irqs %u\n", tmp);
> +
> +    rc = 0;
> +out:
> +    if (value) {
> +        free(value);
> +    }
> +
> +    return rc;
> +}
> +
>  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>  {
>      hw_error("Invalid ioreq type 0x%x\n", req->type);
> @@ -189,6 +369,12 @@ static void xen_arm_init(MachineState *machine)
>      xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
>  
>      xen_create_virtio_mmio_devices(xam);
> +    if (!xen_get_pcie_params(xam)) {
> +        xen_create_pcie(xam);
> +    } else {
> +        DPRINTF("PCIe host bridge is not available,"
> +                "only virtio-mmio can be used\n");

so if something went wrong, it will be just ignored.
Is it really expected behavior?

> +    }
>  
>  #ifdef CONFIG_TPM
>      if (xam->cfg.tpm_base_addr) {
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 565dc39c8f..0f78f15057 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -47,6 +47,8 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>      g_free(pfn_list);
>  }
>  
> +uint16_t xen_pci_segment;
> +
>  static void xen_set_memory(struct MemoryListener *listener,
>                             MemoryRegionSection *section,
>                             bool add)
> @@ -382,7 +384,12 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
>      }
>  
>      QLIST_FOREACH(xendev, &state->dev_list, entry) {
> -        if (xendev->sbdf != sbdf) {
> +        /*
> +         * As we append xen_pci_segment just before forming dm_op in
> +         * xen_map_pcidev() we need to check with appended xen_pci_segment
> +         * here as well.
> +         */
> +        if ((xendev->sbdf | (xen_pci_segment << 16)) != sbdf) {
>              continue;
>          }
>  
> diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> index 6f09c48823..2b1debaff4 100644
> --- a/include/hw/xen/xen_native.h
> +++ b/include/hw/xen/xen_native.h
> @@ -431,6 +431,8 @@ static inline void xen_unmap_io_section(domid_t dom,
>                                                      0, start_addr, end_addr);
>  }
>  
> +extern uint16_t xen_pci_segment;
> +
>  static inline void xen_map_pcidev(domid_t dom,
>                                    ioservid_t ioservid,
>                                    PCIDevice *pci_dev)
> @@ -441,7 +443,8 @@ static inline void xen_map_pcidev(domid_t dom,
>  
>      trace_xen_map_pcidev(ioservid, pci_dev_bus_num(pci_dev),
>                           PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> -    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid, 0,
> +    xendevicemodel_map_pcidev_to_ioreq_server(xen_dmod, dom, ioservid,
> +                                              xen_pci_segment,
>                                                pci_dev_bus_num(pci_dev),
>                                                PCI_SLOT(pci_dev->devfn),
>                                                PCI_FUNC(pci_dev->devfn));
> @@ -457,7 +460,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>  
>      trace_xen_unmap_pcidev(ioservid, pci_dev_bus_num(pci_dev),
>                             PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> -    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid, 0,
> +    xendevicemodel_unmap_pcidev_from_ioreq_server(xen_dmod, dom, ioservid,
> +                                                  xen_pci_segment,
>                                                    pci_dev_bus_num(pci_dev),
>                                                    PCI_SLOT(pci_dev->devfn),
>                                                    PCI_FUNC(pci_dev->devfn));


