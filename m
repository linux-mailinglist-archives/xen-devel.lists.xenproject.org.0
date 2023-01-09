Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C86633FF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 23:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474072.734986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF0i1-0004p0-HJ; Mon, 09 Jan 2023 22:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474072.734986; Mon, 09 Jan 2023 22:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF0i1-0004mf-EJ; Mon, 09 Jan 2023 22:33:37 +0000
Received: by outflank-mailman (input) for mailman id 474072;
 Mon, 09 Jan 2023 22:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QidW=5G=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pF0hz-0004mZ-Or
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 22:33:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5a7225e-906d-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 23:33:33 +0100 (CET)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-R8Lh8twDPVOy9RSSsUdPwQ-1; Mon, 09 Jan 2023 17:33:31 -0500
Received: by mail-qv1-f70.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso5946286qvr.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 14:33:30 -0800 (PST)
Received: from redhat.com ([185.199.102.79]) by smtp.gmail.com with ESMTPSA id
 k14-20020ac8478e000000b003a820f9fb70sm5183013qtq.36.2023.01.09.14.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:33:29 -0800 (PST)
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
X-Inumbo-ID: a5a7225e-906d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673303612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RsiJAtB/qcJ8ifOYLs4heG+cPPY9pzvbSF2Y9UT+p6c=;
	b=LY0irCJlRCLrpsFuoUoUmJJktUyCrJxICmbd4H+mV6nfNAGl0xGCvaK4bva7nQUoUTZ5Ct
	eX2XDCPJyUQpD7areMvSSSjmov8NSaeUqaALPFYhEmugIamp+pQ0Tw8aPdlBx518eBytqY
	B+TE9F3voyt0EH5LDlkiTTeA4yAs3JM=
X-MC-Unique: R8Lh8twDPVOy9RSSsUdPwQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsiJAtB/qcJ8ifOYLs4heG+cPPY9pzvbSF2Y9UT+p6c=;
        b=1lh6DfJ6yhVJLofPcI7tdGTw0Eo+OwMiuBg1gEMHyiQPx4g2+i5SpfQdFoAbQoSqdi
         AAoTjPyTmH7mxuiqjjS7lddnWEDUgbuOKy1D/0UgqGDQRlqAI7ZryK/n3vSQTnWtEI5B
         G1c/8ipxj8SR6SSwDnxJtIf8h07iBEH4hDdQO7DO3IjXvGWS8BuSol79Lhu89WOOQSwP
         zZzujVg5KICyP2Q6dBp6Ly3jyGGHROcNcia3BF0EmZPRMFHGVfqDVX9WdfAvVw8phdM4
         ER05QOC6wbAjL4RtVuqAFVT6LnZSnXb8sAC4ev8UmD6ajfCNvwvL4gHZm6T6YiGn7MFD
         EvAA==
X-Gm-Message-State: AFqh2kqmcSE2YQgtpjGv0k5yYEdLd0IdwycuJwqQ7vJ2gQI/ENTFgt5O
	RLjN1BkTW54n+9j2mj3/4nF47N5KQC5pgGFStF5Tb2ehI9TQVolmXI5Ah4LkVRiNto0EhPMPHAw
	fFt6iB5iNQi9PJnNhKxfFAMajrpA=
X-Received: by 2002:ac8:7ef7:0:b0:3a7:e2a1:331f with SMTP id r23-20020ac87ef7000000b003a7e2a1331fmr93987532qtc.7.1673303610312;
        Mon, 09 Jan 2023 14:33:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtaob7RqRhF9iLiwcSc/zFn5EOlap6OIsPq92ia5ApkVxX2ABZ01lPSYcmGbVjA+riWVsTScA==
X-Received: by 2002:ac8:7ef7:0:b0:3a7:e2a1:331f with SMTP id r23-20020ac87ef7000000b003a7e2a1331fmr93987489qtc.7.1673303609817;
        Mon, 09 Jan 2023 14:33:29 -0800 (PST)
Date: Mon, 9 Jan 2023 17:33:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230109172738-mutt-send-email-mst@kernel.org>
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
MIME-Version: 1.0
In-Reply-To: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> as noted in docs/igd-assign.txt in the Qemu source code.
> 
> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> Intel IGD passthrough to the guest with the Qemu upstream device model,
> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> a different slot. This problem often prevents the guest from booting.
> 
> The only available workaround is not good: Configure Xen HVM guests to use
> the old and no longer maintained Qemu traditional device model available
> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> 
> To implement this feature in the Qemu upstream device model for Xen HVM
> guests, introduce the following new functions, types, and macros:
> 
> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> * typedef XenPTQdevRealize function pointer
> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> 
> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> the xl toolstack with the gfx_passthru option enabled, which sets the
> igd-passthru=on option to Qemu for the Xen HVM machine type.

I don't like how slot_reserved_mask is set initially then cleared on
device realize.
To me this looks like a fragile hack. I suggest one of the following
1. adding a new mask
"slot-manual-mask" or some such blocking auto-allocation of a given
slot without blocking its use if address is specified on command line.
2. adding a special property that overrides slot_reserved_mask
for a given device.

both need changes in pci core but look like something generally
useful.


> 
> The new xen_igd_reserve_slot function also needs to be implemented in
> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> in which case it does nothing.
> 
> The new xen_igd_clear_slot function overrides qdev->realize of the parent
> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> 
> Move the call to xen_host_pci_device_get, and the associated error
> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> initialize the device class and vendor values which enables the checks for
> the Intel IGD to succeed. The verification that the host device is an
> Intel IGD to be passed through is done by checking the domain, bus, slot,
> and function values as well as by checking that gfx_passthru is enabled,
> the device class is VGA, and the device vendor in Intel.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> Notes that might be helpful to reviewers of patched code in hw/xen:
> 
> The new functions and types are based on recommendations from Qemu docs:
> https://qemu.readthedocs.io/en/latest/devel/qom.html
> 
> Notes that might be helpful to reviewers of patched code in hw/i386:
> 
> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
> not affect builds that do not have CONFIG_XEN defined.
> 
> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
> existing function that is only true when Qemu is built with
> xen-pci-passthrough enabled and the administrator has configured the Xen
> HVM guest with Qemu's igd-passthru=on option.
> 
> v2: Remove From: <email address> tag at top of commit message
> 
> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
> 
>     if (is_igd_vga_passthrough(&s->real_device) &&
>         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
> 
>     is changed to
> 
>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>         && (s->hostaddr.function == 0)) {
> 
>     I hoped that I could use the test in v2, since it matches the
>     other tests for the Intel IGD in Qemu and Xen, but those tests
>     do not work because the necessary data structures are not set with
>     their values yet. So instead use the test that the administrator
>     has enabled gfx_passthru and the device address on the host is
>     02.0. This test does detect the Intel IGD correctly.
> 
> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>     email address to match the address used by the same author in commits
>     be9c61da and c0e86b76
>     
>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
> 
> v5: The patch of xen_pt.c was re-worked to allow a more consistent test
>     for the Intel IGD that uses the same criteria as in other places.
>     This involved moving the call to xen_host_pci_device_get from
>     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
>     Intel IGD in xen_igd_clear_slot:
>     
>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>         && (s->hostaddr.function == 0)) {
> 
>     is changed to
> 
>     if (is_igd_vga_passthrough(&s->real_device) &&
>         s->real_device.domain == 0 && s->real_device.bus == 0 &&
>         s->real_device.dev == 2 && s->real_device.func == 0 &&
>         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> 
>     Added an explanation for the move of xen_host_pci_device_get from
>     xen_pt_realize to xen_igd_clear_slot to the commit message.
> 
>     Rebase.
> 
> v6: Fix logging by removing these lines from the move from xen_pt_realize
>     to xen_igd_clear_slot that was done in v5:
> 
>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
>                " to devfn 0x%x\n",
>                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>                s->dev.devfn);
> 
>     This log needs to be in xen_pt_realize because s->dev.devfn is not
>     set yet in xen_igd_clear_slot.
> 
> v7: Inhibit out of context log message and needless processing by
>     adding 2 lines at the top of the new xen_igd_clear_slot function:
> 
>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>         return;
> 
>     Rebase. This removed an unnecessary header file from xen_pt.h 
> 
>  hw/i386/pc_piix.c    | 127 ++++++++++++++++++++++++++++++++-----------
>  hw/xen/xen_pt.c      |  49 ++++++++++++++---
>  hw/xen/xen_pt.h      |  16 ++++++
>  hw/xen/xen_pt_stub.c |   4 ++
>  4 files changed, 154 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b48047f50c..34a9736b5e 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -32,6 +32,7 @@
>  #include "hw/i386/pc.h"
>  #include "hw/i386/apic.h"
>  #include "hw/pci-host/i440fx.h"
> +#include "hw/rtc/mc146818rtc.h"
>  #include "hw/southbridge/piix.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/firmware/smbios.h"
> @@ -40,16 +41,16 @@
>  #include "hw/usb.h"
>  #include "net/net.h"
>  #include "hw/ide/pci.h"
> -#include "hw/ide/piix.h"
>  #include "hw/irq.h"
>  #include "sysemu/kvm.h"
>  #include "hw/kvm/clock.h"
>  #include "hw/sysbus.h"
> +#include "hw/i2c/i2c.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/xen/xen-x86.h"
> +#include "hw/xen/xen.h"
>  #include "exec/memory.h"
>  #include "hw/acpi/acpi.h"
> -#include "hw/acpi/piix4.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/xen.h"
> @@ -66,6 +67,7 @@
>  #include "kvm/kvm-cpu.h"
>  
>  #define MAX_IDE_BUS 2
> +#define XEN_IOAPIC_NUM_PIRQS 128ULL
>  
>  #ifdef CONFIG_IDE_ISA
>  static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
> @@ -73,6 +75,32 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
>  static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
>  #endif
>  
> +/*
> + * Return the global irq number corresponding to a given device irq
> + * pin. We could also use the bus number to have a more precise mapping.
> + */
> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
> +{
> +    int slot_addend;
> +    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
> +    return (pci_intx + slot_addend) & 3;
> +}
> +
> +static void piix_intx_routing_notifier_xen(PCIDevice *dev)
> +{
> +    int i;
> +
> +    /* Scan for updates to PCI link routes (0x60-0x63). */
> +    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
> +        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
> +        if (v & 0x80) {
> +            v = 0;
> +        }
> +        v &= 0xf;
> +        xen_set_pci_link_route(i, v);
> +    }
> +}
> +
>  /* PC hardware initialisation */
>  static void pc_init1(MachineState *machine,
>                       const char *host_type, const char *pci_type)
> @@ -84,7 +112,7 @@ static void pc_init1(MachineState *machine,
>      MemoryRegion *system_io = get_system_io();
>      PCIBus *pci_bus;
>      ISABus *isa_bus;
> -    int piix3_devfn = -1;
> +    Object *piix4_pm;
>      qemu_irq smi_irq;
>      GSIState *gsi_state;
>      BusState *idebus[MAX_IDE_BUS];
> @@ -205,10 +233,9 @@ static void pc_init1(MachineState *machine,
>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
>  
>      if (pcmc->pci_enabled) {
> -        PIIX3State *piix3;
> +        DeviceState *dev;
>          PCIDevice *pci_dev;
> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> -                                         : TYPE_PIIX3_DEVICE;
> +        int i;
>  
>          pci_bus = i440fx_init(pci_type,
>                                i440fx_host,
> @@ -216,21 +243,65 @@ static void pc_init1(MachineState *machine,
>                                x86ms->below_4g_mem_size,
>                                x86ms->above_4g_mem_size,
>                                pci_memory, ram_memory);
> +        pci_bus_map_irqs(pci_bus,
> +                         xen_enabled() ? xen_pci_slot_get_pirq
> +                                       : pci_slot_get_pirq);
>          pcms->bus = pci_bus;
>  
> -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> -        piix3->pic = x86ms->gsi;
> -        piix3_devfn = piix3->dev.devfn;
> -        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
> +        object_property_set_bool(OBJECT(pci_dev), "has-usb",
> +                                 machine_usb(machine), &error_abort);
> +        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> +                                 x86_machine_is_acpi_enabled(x86ms),
> +                                 &error_abort);
> +        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
> +        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
> +                                 x86_machine_is_smm_enabled(x86ms),
> +                                 &error_abort);
> +        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
> +
> +        if (xen_enabled()) {
> +            pci_device_set_intx_routing_notifier(
> +                        pci_dev, piix_intx_routing_notifier_xen);
> +
> +            /*
> +             * Xen supports additional interrupt routes from the PCI devices to
> +             * the IOAPIC: the four pins of each PCI device on the bus are also
> +             * connected to the IOAPIC directly.
> +             * These additional routes can be discovered through ACPI.
> +             */
> +            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
> +                         XEN_IOAPIC_NUM_PIRQS);
> +        }
> +
> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
> +        for (i = 0; i < ISA_NUM_IRQS; i++) {
> +            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
> +        }
> +        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
> +        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
> +                                                             "rtc"));
> +        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
> +        pci_ide_create_devs(PCI_DEVICE(dev));
> +        idebus[0] = qdev_get_child_bus(dev, "ide.0");
> +        idebus[1] = qdev_get_child_bus(dev, "ide.1");
>      } else {
>          pci_bus = NULL;
> +        piix4_pm = NULL;
>          isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
>                                &error_abort);
> +        isa_bus_irqs(isa_bus, x86ms->gsi);
> +
> +        rtc_state = isa_new(TYPE_MC146818_RTC);
> +        qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
> +        isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
> +
>          i8257_dma_init(isa_bus, 0);
>          pcms->hpet_enabled = false;
> +        idebus[0] = NULL;
> +        idebus[1] = NULL;
>      }
> -    isa_bus_irqs(isa_bus, x86ms->gsi);
>  
>      if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
>          pc_i8259_create(isa_bus, gsi_state->i8259_irq);
> @@ -252,18 +323,12 @@ static void pc_init1(MachineState *machine,
>      }
>  
>      /* init basic PC hardware */
> -    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
> +    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
>                           0x4);
>  
>      pc_nic_init(pcmc, isa_bus, pci_bus);
>  
>      if (pcmc->pci_enabled) {
> -        PCIDevice *dev;
> -
> -        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
> -        pci_ide_create_devs(dev);
> -        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
> -        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
>          pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
>      }
>  #ifdef CONFIG_IDE_ISA
> @@ -289,21 +354,9 @@ static void pc_init1(MachineState *machine,
>      }
>  #endif
>  
> -    if (pcmc->pci_enabled && machine_usb(machine)) {
> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
> -    }
> -
> -    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
> -        PCIDevice *piix4_pm;
> -
> +    if (piix4_pm) {
>          smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
> -        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
> -        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
> -        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
> -                          x86_machine_is_smm_enabled(x86ms));
> -        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
>  
> -        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
>          qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
>          pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
>          /* TODO: Populate SPD eeprom data.  */
> @@ -315,7 +368,7 @@ static void pc_init1(MachineState *machine,
>                                   object_property_allow_set_link,
>                                   OBJ_PROP_LINK_STRONG);
>          object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
> -                                 OBJECT(piix4_pm), &error_abort);
> +                                 piix4_pm, &error_abort);
>      }
>  
>      if (machine->nvdimms_state->is_enabled) {
> @@ -405,6 +458,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>      }
>  
>      pc_xen_hvm_init_pci(machine);
> +    if (xen_igd_gfx_pt_enabled()) {
> +        xen_igd_reserve_slot(pcms->bus);
> +    }
>      pci_create_simple(pcms->bus, -1, "xen-platform");
>  }
>  #endif
> @@ -441,6 +497,11 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
>      pc_i440fx_machine_options(m);
>      m->alias = "pc";
>      m->is_default = true;
> +#ifdef CONFIG_MICROVM_DEFAULT
> +    m->is_default = false;
> +#else
> +    m->is_default = true;
> +#endif
>  }
>  
>  DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 0ec7e52183..eff38155ef 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>                 s->dev.devfn);
>  
> -    xen_host_pci_device_get(&s->real_device,
> -                            s->hostaddr.domain, s->hostaddr.bus,
> -                            s->hostaddr.slot, s->hostaddr.function,
> -                            errp);
> -    if (*errp) {
> -        error_append_hint(errp, "Failed to \"open\" the real pci device");
> -        return;
> -    }
> -
>      s->is_virtfn = s->real_device.is_virtfn;
>      if (s->is_virtfn) {
>          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
> @@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Object *obj)
>      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
>  }
>  
> +void xen_igd_reserve_slot(PCIBus *pci_bus)
> +{
> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
> +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
> +}
> +
> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PCIDevice *pci_dev = (PCIDevice *)qdev;
> +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
> +    PCIBus *pci_bus = pci_get_bus(pci_dev);
> +
> +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
> +        return;
> +
> +    xen_host_pci_device_get(&s->real_device,
> +                            s->hostaddr.domain, s->hostaddr.bus,
> +                            s->hostaddr.slot, s->hostaddr.function,
> +                            errp);
> +    if (*errp) {
> +        error_append_hint(errp, "Failed to \"open\" the real pci device");
> +        return;
> +    }
> +
> +    if (is_igd_vga_passthrough(&s->real_device) &&
> +        s->real_device.domain == 0 && s->real_device.bus == 0 &&
> +        s->real_device.dev == 2 && s->real_device.func == 0 &&
> +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
> +    }
> +    xpdc->pci_qdev_realize(qdev, errp);
> +}
> +
>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>  
> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
> +    xpdc->pci_qdev_realize = dc->realize;
> +    dc->realize = xen_igd_clear_slot;
>      k->realize = xen_pt_realize;
>      k->exit = xen_pt_unregister_device;
>      k->config_read = xen_pt_pci_read_config;
> @@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info = {
>      .instance_size = sizeof(XenPCIPassthroughState),
>      .instance_finalize = xen_pci_passthrough_finalize,
>      .class_init = xen_pci_passthrough_class_init,
> +    .class_size = sizeof(XenPTDeviceClass),
>      .instance_init = xen_pci_passthrough_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index cf10fc7bbf..8c25932b4b 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -2,6 +2,7 @@
>  #define XEN_PT_H
>  
>  #include "hw/xen/xen_common.h"
> +#include "hw/pci/pci_bus.h"
>  #include "xen-host-pci-device.h"
>  #include "qom/object.h"
>  
> @@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>  
> +#define XEN_PT_DEVICE_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
> +
> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
> +
> +typedef struct XenPTDeviceClass {
> +    PCIDeviceClass parent_class;
> +    XenPTQdevRealize pci_qdev_realize;
> +} XenPTDeviceClass;
> +
>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>                                             XenHostPCIDevice *dev);
> @@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
>  
>  #define XEN_PCI_INTEL_OPREGION 0xfc
>  
> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
> +
>  typedef enum {
>      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
> diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
> index 2d8cac8d54..5c108446a8 100644
> --- a/hw/xen/xen_pt_stub.c
> +++ b/hw/xen/xen_pt_stub.c
> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>          error_setg(errp, "Xen PCI passthrough support not built in");
>      }
>  }
> +
> +void xen_igd_reserve_slot(PCIBus *pci_bus)
> +{
> +}
> -- 
> 2.39.0


