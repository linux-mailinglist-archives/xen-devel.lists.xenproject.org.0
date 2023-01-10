Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893DE6638A2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 06:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474258.735330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF7Gt-0006Xh-B3; Tue, 10 Jan 2023 05:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474258.735330; Tue, 10 Jan 2023 05:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF7Gt-0006VV-7o; Tue, 10 Jan 2023 05:34:03 +0000
Received: by outflank-mailman (input) for mailman id 474258;
 Tue, 10 Jan 2023 05:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VHex=5H=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pF7Gr-0006VP-4w
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 05:34:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61a98727-90a8-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 06:33:59 +0100 (CET)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-LseaCMcvMbiLxusax2YNaQ-1; Tue, 10 Jan 2023 00:33:56 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 o20-20020a0ccb14000000b005321d865fbbso6199771qvk.17
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 21:33:56 -0800 (PST)
Received: from redhat.com ([191.101.160.154]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05620a034b00b006fa31bf2f3dsm6536546qkm.47.2023.01.09.21.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 21:33:54 -0800 (PST)
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
X-Inumbo-ID: 61a98727-90a8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673328838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2rrvtY6YACF2A594KZFjWGGgNjo+s7enLD/esRvyA4=;
	b=Ml1Iv8hI4ycHX46CjmJ+l638N1UNmAH94YJdVRuHl7tWdlS7y5n25k+uoG3g6u/rlgJeyN
	pnUisQeNaScKIHuzJ0n6FjZFIVJIS+LiBCrITubpurkEzlEq7JS+hdvSF1YWIt7V4PdOqU
	vxx8yJ5zjhIHlHxNGClObVJSaC3h/3E=
X-MC-Unique: LseaCMcvMbiLxusax2YNaQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2rrvtY6YACF2A594KZFjWGGgNjo+s7enLD/esRvyA4=;
        b=hxJJXI1GZ/yer0ybGKgDfHwL7idQhLFlre6k3OX31hzA3obyrZjhpKcMpVjExlhAIY
         +6QXKnSzyzMX4XbQgyZ0wXjWMrgE5/7gVt8wBM0CkNIgZUkRoqJ58ThUTD0zuP1faY4c
         Caa1i54bTzELAwpeLQi9idC0XdYq79so6WeKHiFAt2QUA4KiZDGMd82yfG69aMkNNlJI
         hnc7ft5W0Zh4s86Nv/JZso3gq1slsivrEhDR41TRiRSV//X1uW8+QSEjWISYa6qhtQSr
         9WekMaEPBa3iG0qDD0ll9OjGx8aOi8LgZlq3WBMa17B+7ZIhRyJAVyLFHtgeu8dJFuXk
         IcnQ==
X-Gm-Message-State: AFqh2kpD2CHTOMnhlEqGxRBb/tTbZThjPgn+vUE3Dz4KF4K6wgPNsBHk
	fOrx+ZXzXaQnjfLnSgFZ31HvKhfirIsTEcwa2TxLSLXij6GBig1VKvOP0V98NeiaouT/uzODmmt
	2qTrB5PA7HEIN/JZb/PU/Doegfuc=
X-Received: by 2002:a0c:e989:0:b0:532:25bf:1e5b with SMTP id z9-20020a0ce989000000b0053225bf1e5bmr14527069qvn.13.1673328835969;
        Mon, 09 Jan 2023 21:33:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXutkVsyyurgzYuTtqQs1bSdqx8vpXhBqsggh24leTy+BR7awDoq2WW1vhRn+V38P68mLmdiAg==
X-Received: by 2002:a0c:e989:0:b0:532:25bf:1e5b with SMTP id z9-20020a0ce989000000b0053225bf1e5bmr14527054qvn.13.1673328835619;
        Mon, 09 Jan 2023 21:33:55 -0800 (PST)
Date: Tue, 10 Jan 2023 00:33:48 -0500
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
Message-ID: <20230110002809-mutt-send-email-mst@kernel.org>
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
 <20230109183132-mutt-send-email-mst@kernel.org>
 <aacffaa2-1e86-1392-8302-484248b893c4@aol.com>
 <1542de4a-3b42-0ca4-777a-ce01f75b5532@aol.com>
MIME-Version: 1.0
In-Reply-To: <1542de4a-3b42-0ca4-777a-ce01f75b5532@aol.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 09, 2023 at 09:11:22PM -0500, Chuck Zmudzinski wrote:
> On 1/9/2023 7:05 PM, Chuck Zmudzinski wrote:
> > On 1/9/23 6:33 PM, Michael S. Tsirkin wrote:
> > > On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
> > >> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > >> as noted in docs/igd-assign.txt in the Qemu source code.
> > >> 
> > >> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> > >> Intel IGD passthrough to the guest with the Qemu upstream device model,
> > >> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> > >> a different slot. This problem often prevents the guest from booting.
> > >> 
> > >> The only available workaround is not good: Configure Xen HVM guests to use
> > >> the old and no longer maintained Qemu traditional device model available
> > >> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> > >> 
> > >> To implement this feature in the Qemu upstream device model for Xen HVM
> > >> guests, introduce the following new functions, types, and macros:
> > >> 
> > >> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> > >> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> > >> * typedef XenPTQdevRealize function pointer
> > >> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> > >> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> > >> 
> > >> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> > >> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> > >> the xl toolstack with the gfx_passthru option enabled, which sets the
> > >> igd-passthru=on option to Qemu for the Xen HVM machine type.
> > >> 
> > >> The new xen_igd_reserve_slot function also needs to be implemented in
> > >> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> > >> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> > >> in which case it does nothing.
> > >> 
> > >> The new xen_igd_clear_slot function overrides qdev->realize of the parent
> > >> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> > >> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> > >> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> > >> 
> > >> Move the call to xen_host_pci_device_get, and the associated error
> > >> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> > >> initialize the device class and vendor values which enables the checks for
> > >> the Intel IGD to succeed. The verification that the host device is an
> > >> Intel IGD to be passed through is done by checking the domain, bus, slot,
> > >> and function values as well as by checking that gfx_passthru is enabled,
> > >> the device class is VGA, and the device vendor in Intel.
> > >> 
> > >> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > >> ---
> > >> Notes that might be helpful to reviewers of patched code in hw/xen:
> > >> 
> > >> The new functions and types are based on recommendations from Qemu docs:
> > >> https://qemu.readthedocs.io/en/latest/devel/qom.html
> > >> 
> > >> Notes that might be helpful to reviewers of patched code in hw/i386:
> > >> 
> > >> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
> > >> not affect builds that do not have CONFIG_XEN defined.
> > > 
> > > I'm not sure how you can claim that.
> >
> > I mean the small patch to pc_piix.c in this patch sits
> > between an "#ifdef CONFIG_XEN" and the corresponding
> > "#endif" so the preprocessor will exclude it when CONFIG_XEN
> > is not defined. In other words, my patch is part of the
> > xen-specific code in pc_piix.c. Or am I missing something?
> >
> >
> > > 
> > > ...
> > > 
> > >> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > >> index b48047f50c..34a9736b5e 100644
> > >> --- a/hw/i386/pc_piix.c
> > >> +++ b/hw/i386/pc_piix.c
> > >> @@ -32,6 +32,7 @@
> > >>  #include "hw/i386/pc.h"
> > >>  #include "hw/i386/apic.h"
> > >>  #include "hw/pci-host/i440fx.h"
> > >> +#include "hw/rtc/mc146818rtc.h"
> > >>  #include "hw/southbridge/piix.h"
> > >>  #include "hw/display/ramfb.h"
> > >>  #include "hw/firmware/smbios.h"
> > >> @@ -40,16 +41,16 @@
> > >>  #include "hw/usb.h"
> > >>  #include "net/net.h"
> > >>  #include "hw/ide/pci.h"
> > >> -#include "hw/ide/piix.h"
> > >>  #include "hw/irq.h"
> > >>  #include "sysemu/kvm.h"
> > >>  #include "hw/kvm/clock.h"
> > >>  #include "hw/sysbus.h"
> > >> +#include "hw/i2c/i2c.h"
> > >>  #include "hw/i2c/smbus_eeprom.h"
> > >>  #include "hw/xen/xen-x86.h"
> > >> +#include "hw/xen/xen.h"
> > >>  #include "exec/memory.h"
> > >>  #include "hw/acpi/acpi.h"
> > >> -#include "hw/acpi/piix4.h"
> > >>  #include "qapi/error.h"
> > >>  #include "qemu/error-report.h"
> > >>  #include "sysemu/xen.h"
> > >> @@ -66,6 +67,7 @@
> > >>  #include "kvm/kvm-cpu.h"
> > >>  
> > >>  #define MAX_IDE_BUS 2
> > >> +#define XEN_IOAPIC_NUM_PIRQS 128ULL
> > >>  
> > >>  #ifdef CONFIG_IDE_ISA
> > >>  static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
> > >> @@ -73,6 +75,32 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
> > >>  static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
> > >>  #endif
> > >>  
> > >> +/*
> > >> + * Return the global irq number corresponding to a given device irq
> > >> + * pin. We could also use the bus number to have a more precise mapping.
> > >> + */
> > >> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
> > >> +{
> > >> +    int slot_addend;
> > >> +    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
> > >> +    return (pci_intx + slot_addend) & 3;
> > >> +}
> > >> +
> > >> +static void piix_intx_routing_notifier_xen(PCIDevice *dev)
> > >> +{
> > >> +    int i;
> > >> +
> > >> +    /* Scan for updates to PCI link routes (0x60-0x63). */
> > >> +    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
> > >> +        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
> > >> +        if (v & 0x80) {
> > >> +            v = 0;
> > >> +        }
> > >> +        v &= 0xf;
> > >> +        xen_set_pci_link_route(i, v);
> > >> +    }
> > >> +}
> > >> +
> > >>  /* PC hardware initialisation */
> > >>  static void pc_init1(MachineState *machine,
> > >>                       const char *host_type, const char *pci_type)
> > >> @@ -84,7 +112,7 @@ static void pc_init1(MachineState *machine,
> > >>      MemoryRegion *system_io = get_system_io();
> > >>      PCIBus *pci_bus;
> > >>      ISABus *isa_bus;
> > >> -    int piix3_devfn = -1;
> > >> +    Object *piix4_pm;
> > >>      qemu_irq smi_irq;
> > >>      GSIState *gsi_state;
> > >>      BusState *idebus[MAX_IDE_BUS];
> > >> @@ -205,10 +233,9 @@ static void pc_init1(MachineState *machine,
> > >>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> > >>  
> > >>      if (pcmc->pci_enabled) {
> > >> -        PIIX3State *piix3;
> > >> +        DeviceState *dev;
> > >>          PCIDevice *pci_dev;
> > >> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> > >> -                                         : TYPE_PIIX3_DEVICE;
> > >> +        int i;
> > >>  
> > >>          pci_bus = i440fx_init(pci_type,
> > >>                                i440fx_host,
> > >> @@ -216,21 +243,65 @@ static void pc_init1(MachineState *machine,
> > >>                                x86ms->below_4g_mem_size,
> > >>                                x86ms->above_4g_mem_size,
> > >>                                pci_memory, ram_memory);
> > >> +        pci_bus_map_irqs(pci_bus,
> > >> +                         xen_enabled() ? xen_pci_slot_get_pirq
> > >> +                                       : pci_slot_get_pirq);
> > >>          pcms->bus = pci_bus;
> > >>  
> > >> -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> > >> -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> > >> -        piix3->pic = x86ms->gsi;
> > >> -        piix3_devfn = piix3->dev.devfn;
> > >> -        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> > >> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
> > >> +        object_property_set_bool(OBJECT(pci_dev), "has-usb",
> > >> +                                 machine_usb(machine), &error_abort);
> > >> +        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> > >> +                                 x86_machine_is_acpi_enabled(x86ms),
> > >> +                                 &error_abort);
> > >> +        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
> > >> +        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
> > >> +                                 x86_machine_is_smm_enabled(x86ms),
> > >> +                                 &error_abort);
> > >> +        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
> > >> +
> > >> +        if (xen_enabled()) {
> > >> +            pci_device_set_intx_routing_notifier(
> > >> +                        pci_dev, piix_intx_routing_notifier_xen);
> > >> +
> > >> +            /*
> > >> +             * Xen supports additional interrupt routes from the PCI devices to
> > >> +             * the IOAPIC: the four pins of each PCI device on the bus are also
> > >> +             * connected to the IOAPIC directly.
> > >> +             * These additional routes can be discovered through ACPI.
> > >> +             */
> > >> +            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
> > >> +                         XEN_IOAPIC_NUM_PIRQS);
> > >> +        }
> > >> +
> > >> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
> > >> +        for (i = 0; i < ISA_NUM_IRQS; i++) {
> > >> +            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
> > >> +        }
> > >> +        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
> > >> +        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
> > >> +                                                             "rtc"));
> > >> +        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
> > >> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
> > >> +        pci_ide_create_devs(PCI_DEVICE(dev));
> > >> +        idebus[0] = qdev_get_child_bus(dev, "ide.0");
> > >> +        idebus[1] = qdev_get_child_bus(dev, "ide.1");
> > >>      } else {
> > >>          pci_bus = NULL;
> > >> +        piix4_pm = NULL;
> > >>          isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
> > >>                                &error_abort);
> > >> +        isa_bus_irqs(isa_bus, x86ms->gsi);
> > >> +
> > >> +        rtc_state = isa_new(TYPE_MC146818_RTC);
> > >> +        qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
> > >> +        isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
> > >> +
> > >>          i8257_dma_init(isa_bus, 0);
> > >>          pcms->hpet_enabled = false;
> > >> +        idebus[0] = NULL;
> > >> +        idebus[1] = NULL;
> > >>      }
> > >> -    isa_bus_irqs(isa_bus, x86ms->gsi);
> > >>  
> > >>      if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
> > >>          pc_i8259_create(isa_bus, gsi_state->i8259_irq);
> > >> @@ -252,18 +323,12 @@ static void pc_init1(MachineState *machine,
> > >>      }
> > >>  
> > >>      /* init basic PC hardware */
> > >> -    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
> > >> +    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
> > >>                           0x4);
> > >>  
> > >>      pc_nic_init(pcmc, isa_bus, pci_bus);
> > >>  
> > >>      if (pcmc->pci_enabled) {
> > >> -        PCIDevice *dev;
> > >> -
> > >> -        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
> > >> -        pci_ide_create_devs(dev);
> > >> -        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
> > >> -        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
> > >>          pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
> > >>      }
> > >>  #ifdef CONFIG_IDE_ISA
> > >> @@ -289,21 +354,9 @@ static void pc_init1(MachineState *machine,
> > >>      }
> > >>  #endif
> > >>  
> > >> -    if (pcmc->pci_enabled && machine_usb(machine)) {
> > >> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
> > >> -    }
> > >> -
> > >> -    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
> > >> -        PCIDevice *piix4_pm;
> > >> -
> > >> +    if (piix4_pm) {
> > >>          smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
> > >> -        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
> > >> -        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
> > >> -        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
> > >> -                          x86_machine_is_smm_enabled(x86ms));
> > >> -        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
> > >>  
> > >> -        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
> > >>          qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
> > >>          pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
> > >>          /* TODO: Populate SPD eeprom data.  */
> > >> @@ -315,7 +368,7 @@ static void pc_init1(MachineState *machine,
> > >>                                   object_property_allow_set_link,
> > >>                                   OBJ_PROP_LINK_STRONG);
> > >>          object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
> > >> -                                 OBJECT(piix4_pm), &error_abort);
> > >> +                                 piix4_pm, &error_abort);
> > >>      }
> > >>  
> > >>      if (machine->nvdimms_state->is_enabled) {
> > >> @@ -405,6 +458,9 @@ static void pc_xen_hvm_init(MachineState *machine)
> > >>      }
> > >>  
> > >>      pc_xen_hvm_init_pci(machine);
> > >> +    if (xen_igd_gfx_pt_enabled()) {
> > >> +        xen_igd_reserve_slot(pcms->bus);
> > >> +    }
> 
> These are the three lines from my patch that are added to
> pc_piix.c. IIUC, this diff is showing the differences in pc_piix.c
> without and with CONFIG_XEN defined.

changing configure flags does not modify pc_piix.c IIUC.  configure
changes compiler flags and some generated files (mostly headers).
AFAIK pc_piix.c is not one of them.

> If so, then the fact that
> the lines in my patch are added when CONFIG_XEN is defined
> means they are not included as part of the build when CONFIG_XEN
> is not defined. That is how I can claim that my small patch to
> pc_piix.c does not affect builds without CONFIG_XEN defined.
>

Doesn't make sense to me, sorry.

> I also think the rest of the files touched by my patch are only included
> by the meson build system with the --enable-xen an option to configure.
> So the entire patch is xen-specific and can easily be eliminated from
> any build with the --disable-xen configure option.
> 
> Kind regards,
> 
> Chuck
> 
> > >>      pci_create_simple(pcms->bus, -1, "xen-platform");
> > >>  }
> > >>  #endif
> > >> @@ -441,6 +497,11 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
> > >>      pc_i440fx_machine_options(m);
> > >>      m->alias = "pc";
> > >>      m->is_default = true;
> > >> +#ifdef CONFIG_MICROVM_DEFAULT
> > >> +    m->is_default = false;
> > >> +#else
> > >> +    m->is_default = true;
> > >> +#endif
> > >>  }
> > >>  
> > >>  DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
> > > 
> > > 
> > > Lots of changes here not guarded by CONFIG_XEN.
> > > 
> >
> > What diff is this? How is my patch related to it?
> >


