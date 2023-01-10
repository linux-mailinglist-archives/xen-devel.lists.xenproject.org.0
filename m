Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF9663892
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 06:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474252.735319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF7BI-00056o-Me; Tue, 10 Jan 2023 05:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474252.735319; Tue, 10 Jan 2023 05:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF7BI-00053z-JQ; Tue, 10 Jan 2023 05:28:16 +0000
Received: by outflank-mailman (input) for mailman id 474252;
 Tue, 10 Jan 2023 05:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VHex=5H=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pF7BG-00053t-Py
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 05:28:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 928f8a23-90a7-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 06:28:12 +0100 (CET)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-jqTb_xDJMKy4wR-t5aJCAw-1; Tue, 10 Jan 2023 00:28:09 -0500
Received: by mail-qv1-f72.google.com with SMTP id
 pm24-20020ad446d8000000b0053233e46a00so1649774qvb.23
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 21:28:09 -0800 (PST)
Received: from redhat.com ([191.101.160.154]) by smtp.gmail.com with ESMTPSA id
 l13-20020ac84a8d000000b003a6947863e1sm5557653qtq.11.2023.01.09.21.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 21:28:06 -0800 (PST)
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
X-Inumbo-ID: 928f8a23-90a7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673328490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ansxmlLRWtTb0gFcB9ey2Q9eN1Orq6xeC0CbSQE8rs=;
	b=ip2tYMMYGm1CRwj7DEnMyMvs5GOWRh2MFy+TJYwxwRRpD3NjYwlE6NJwexL2oLdidG3WZ9
	H4c+DIVBGQnboiHwq5Db1lK8CsA9qFD5hGWEP0OZW8o0at+bgPToa0Ew5Sezpkm/jkVE3n
	evH00InwQ+qL6i3fMNb/yaSwijvD5Vw=
X-MC-Unique: jqTb_xDJMKy4wR-t5aJCAw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ansxmlLRWtTb0gFcB9ey2Q9eN1Orq6xeC0CbSQE8rs=;
        b=m9cMfh+3G901mMBbtyyYCXxbtP0XlukoDd/H5a+imf8Lq376nAXvt03GPwvyMfWGDB
         QjsjOsl7kq9fPHVaEMqmTN6n14FCpAGUp1ycUvcpGQ0cgpvWd7P3+YHTmiMqSvM7Uy2+
         AJOCDgVQPTuihj30/zLsGOPwwZSVIVes73AWTv6AQ3OqGWC4vnQzozsEf/OIZcgHgSnx
         nxPkphYFYcIymofT+Jl96vragO86bzftwZhjmXaUnqinaUSm9actFtQnxleekPtfV0FX
         bHthArgaqYRjaRNbMjjlHpRk5lNB3oX15nBEH0g2GfFTGMFCQdvLiB0TXxjdZNYiqN1O
         Qs5A==
X-Gm-Message-State: AFqh2kowhEQ4A8LZEDUXNiydosA4h52XxNj9imcj1avj/JxWWG1s8hTz
	QZtVMVneoSq3C9K3wgmxW8cXjHqZvgz7CyDc2HrfyEuxA5n3EKIhFiYjzVloXlf9DEJnwKV2mgu
	aQG+x/P9jGYTMFwzq4GqpK2bM0nU=
X-Received: by 2002:ac8:704b:0:b0:3a7:e110:81e5 with SMTP id y11-20020ac8704b000000b003a7e11081e5mr95042235qtm.53.1673328486968;
        Mon, 09 Jan 2023 21:28:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucbIbhjgPdiRynWq9rFbx7j1yJ4QMzUzRKinQH4QGXmaDZxzMzBDCzNEHfjSWPBWUViD+pJA==
X-Received: by 2002:ac8:704b:0:b0:3a7:e110:81e5 with SMTP id y11-20020ac8704b000000b003a7e11081e5mr95042217qtm.53.1673328486642;
        Mon, 09 Jan 2023 21:28:06 -0800 (PST)
Date: Tue, 10 Jan 2023 00:27:59 -0500
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
Message-ID: <20230110002712-mutt-send-email-mst@kernel.org>
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
 <20230109183132-mutt-send-email-mst@kernel.org>
 <aacffaa2-1e86-1392-8302-484248b893c4@aol.com>
MIME-Version: 1.0
In-Reply-To: <aacffaa2-1e86-1392-8302-484248b893c4@aol.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 09, 2023 at 07:05:35PM -0500, Chuck Zmudzinski wrote:
> On 1/9/23 6:33 PM, Michael S. Tsirkin wrote:
> > On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
> >> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> >> as noted in docs/igd-assign.txt in the Qemu source code.
> >> 
> >> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> >> Intel IGD passthrough to the guest with the Qemu upstream device model,
> >> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> >> a different slot. This problem often prevents the guest from booting.
> >> 
> >> The only available workaround is not good: Configure Xen HVM guests to use
> >> the old and no longer maintained Qemu traditional device model available
> >> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> >> 
> >> To implement this feature in the Qemu upstream device model for Xen HVM
> >> guests, introduce the following new functions, types, and macros:
> >> 
> >> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> >> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> >> * typedef XenPTQdevRealize function pointer
> >> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> >> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> >> 
> >> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> >> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> >> the xl toolstack with the gfx_passthru option enabled, which sets the
> >> igd-passthru=on option to Qemu for the Xen HVM machine type.
> >> 
> >> The new xen_igd_reserve_slot function also needs to be implemented in
> >> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> >> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> >> in which case it does nothing.
> >> 
> >> The new xen_igd_clear_slot function overrides qdev->realize of the parent
> >> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> >> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> >> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> >> 
> >> Move the call to xen_host_pci_device_get, and the associated error
> >> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> >> initialize the device class and vendor values which enables the checks for
> >> the Intel IGD to succeed. The verification that the host device is an
> >> Intel IGD to be passed through is done by checking the domain, bus, slot,
> >> and function values as well as by checking that gfx_passthru is enabled,
> >> the device class is VGA, and the device vendor in Intel.
> >> 
> >> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >> ---
> >> Notes that might be helpful to reviewers of patched code in hw/xen:
> >> 
> >> The new functions and types are based on recommendations from Qemu docs:
> >> https://qemu.readthedocs.io/en/latest/devel/qom.html
> >> 
> >> Notes that might be helpful to reviewers of patched code in hw/i386:
> >> 
> >> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
> >> not affect builds that do not have CONFIG_XEN defined.
> > 
> > I'm not sure how you can claim that.
> 
> I mean the small patch to pc_piix.c in this patch sits
> between an "#ifdef CONFIG_XEN" and the corresponding
> "#endif" so the preprocessor will exclude it when CONFIG_XEN
> is not defined. In other words, my patch is part of the
> xen-specific code in pc_piix.c. Or am I missing something?
> 
> 
> > 
> > ...
> > 
> >> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> index b48047f50c..34a9736b5e 100644
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -32,6 +32,7 @@
> >>  #include "hw/i386/pc.h"
> >>  #include "hw/i386/apic.h"
> >>  #include "hw/pci-host/i440fx.h"
> >> +#include "hw/rtc/mc146818rtc.h"
> >>  #include "hw/southbridge/piix.h"
> >>  #include "hw/display/ramfb.h"
> >>  #include "hw/firmware/smbios.h"
> >> @@ -40,16 +41,16 @@
> >>  #include "hw/usb.h"
> >>  #include "net/net.h"
> >>  #include "hw/ide/pci.h"
> >> -#include "hw/ide/piix.h"
> >>  #include "hw/irq.h"
> >>  #include "sysemu/kvm.h"
> >>  #include "hw/kvm/clock.h"
> >>  #include "hw/sysbus.h"
> >> +#include "hw/i2c/i2c.h"
> >>  #include "hw/i2c/smbus_eeprom.h"
> >>  #include "hw/xen/xen-x86.h"
> >> +#include "hw/xen/xen.h"
> >>  #include "exec/memory.h"
> >>  #include "hw/acpi/acpi.h"
> >> -#include "hw/acpi/piix4.h"
> >>  #include "qapi/error.h"
> >>  #include "qemu/error-report.h"
> >>  #include "sysemu/xen.h"
> >> @@ -66,6 +67,7 @@
> >>  #include "kvm/kvm-cpu.h"
> >>  
> >>  #define MAX_IDE_BUS 2
> >> +#define XEN_IOAPIC_NUM_PIRQS 128ULL
> >>  
> >>  #ifdef CONFIG_IDE_ISA
> >>  static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
> >> @@ -73,6 +75,32 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
> >>  static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
> >>  #endif
> >>  
> >> +/*
> >> + * Return the global irq number corresponding to a given device irq
> >> + * pin. We could also use the bus number to have a more precise mapping.
> >> + */
> >> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
> >> +{
> >> +    int slot_addend;
> >> +    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
> >> +    return (pci_intx + slot_addend) & 3;
> >> +}
> >> +
> >> +static void piix_intx_routing_notifier_xen(PCIDevice *dev)
> >> +{
> >> +    int i;
> >> +
> >> +    /* Scan for updates to PCI link routes (0x60-0x63). */
> >> +    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
> >> +        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
> >> +        if (v & 0x80) {
> >> +            v = 0;
> >> +        }
> >> +        v &= 0xf;
> >> +        xen_set_pci_link_route(i, v);
> >> +    }
> >> +}
> >> +
> >>  /* PC hardware initialisation */
> >>  static void pc_init1(MachineState *machine,
> >>                       const char *host_type, const char *pci_type)
> >> @@ -84,7 +112,7 @@ static void pc_init1(MachineState *machine,
> >>      MemoryRegion *system_io = get_system_io();
> >>      PCIBus *pci_bus;
> >>      ISABus *isa_bus;
> >> -    int piix3_devfn = -1;
> >> +    Object *piix4_pm;
> >>      qemu_irq smi_irq;
> >>      GSIState *gsi_state;
> >>      BusState *idebus[MAX_IDE_BUS];
> >> @@ -205,10 +233,9 @@ static void pc_init1(MachineState *machine,
> >>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> >>  
> >>      if (pcmc->pci_enabled) {
> >> -        PIIX3State *piix3;
> >> +        DeviceState *dev;
> >>          PCIDevice *pci_dev;
> >> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> >> -                                         : TYPE_PIIX3_DEVICE;
> >> +        int i;
> >>  
> >>          pci_bus = i440fx_init(pci_type,
> >>                                i440fx_host,
> >> @@ -216,21 +243,65 @@ static void pc_init1(MachineState *machine,
> >>                                x86ms->below_4g_mem_size,
> >>                                x86ms->above_4g_mem_size,
> >>                                pci_memory, ram_memory);
> >> +        pci_bus_map_irqs(pci_bus,
> >> +                         xen_enabled() ? xen_pci_slot_get_pirq
> >> +                                       : pci_slot_get_pirq);
> >>          pcms->bus = pci_bus;
> >>  
> >> -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> >> -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> >> -        piix3->pic = x86ms->gsi;
> >> -        piix3_devfn = piix3->dev.devfn;
> >> -        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> >> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
> >> +        object_property_set_bool(OBJECT(pci_dev), "has-usb",
> >> +                                 machine_usb(machine), &error_abort);
> >> +        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> >> +                                 x86_machine_is_acpi_enabled(x86ms),
> >> +                                 &error_abort);
> >> +        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
> >> +        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
> >> +                                 x86_machine_is_smm_enabled(x86ms),
> >> +                                 &error_abort);
> >> +        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
> >> +
> >> +        if (xen_enabled()) {
> >> +            pci_device_set_intx_routing_notifier(
> >> +                        pci_dev, piix_intx_routing_notifier_xen);
> >> +
> >> +            /*
> >> +             * Xen supports additional interrupt routes from the PCI devices to
> >> +             * the IOAPIC: the four pins of each PCI device on the bus are also
> >> +             * connected to the IOAPIC directly.
> >> +             * These additional routes can be discovered through ACPI.
> >> +             */
> >> +            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
> >> +                         XEN_IOAPIC_NUM_PIRQS);
> >> +        }
> >> +
> >> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
> >> +        for (i = 0; i < ISA_NUM_IRQS; i++) {
> >> +            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
> >> +        }
> >> +        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
> >> +        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
> >> +                                                             "rtc"));
> >> +        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
> >> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
> >> +        pci_ide_create_devs(PCI_DEVICE(dev));
> >> +        idebus[0] = qdev_get_child_bus(dev, "ide.0");
> >> +        idebus[1] = qdev_get_child_bus(dev, "ide.1");
> >>      } else {
> >>          pci_bus = NULL;
> >> +        piix4_pm = NULL;
> >>          isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
> >>                                &error_abort);
> >> +        isa_bus_irqs(isa_bus, x86ms->gsi);
> >> +
> >> +        rtc_state = isa_new(TYPE_MC146818_RTC);
> >> +        qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
> >> +        isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
> >> +
> >>          i8257_dma_init(isa_bus, 0);
> >>          pcms->hpet_enabled = false;
> >> +        idebus[0] = NULL;
> >> +        idebus[1] = NULL;
> >>      }
> >> -    isa_bus_irqs(isa_bus, x86ms->gsi);
> >>  
> >>      if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
> >>          pc_i8259_create(isa_bus, gsi_state->i8259_irq);
> >> @@ -252,18 +323,12 @@ static void pc_init1(MachineState *machine,
> >>      }
> >>  
> >>      /* init basic PC hardware */
> >> -    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
> >> +    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
> >>                           0x4);
> >>  
> >>      pc_nic_init(pcmc, isa_bus, pci_bus);
> >>  
> >>      if (pcmc->pci_enabled) {
> >> -        PCIDevice *dev;
> >> -
> >> -        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
> >> -        pci_ide_create_devs(dev);
> >> -        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
> >> -        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
> >>          pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
> >>      }
> >>  #ifdef CONFIG_IDE_ISA
> >> @@ -289,21 +354,9 @@ static void pc_init1(MachineState *machine,
> >>      }
> >>  #endif
> >>  
> >> -    if (pcmc->pci_enabled && machine_usb(machine)) {
> >> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
> >> -    }
> >> -
> >> -    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
> >> -        PCIDevice *piix4_pm;
> >> -
> >> +    if (piix4_pm) {
> >>          smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
> >> -        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
> >> -        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
> >> -        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
> >> -                          x86_machine_is_smm_enabled(x86ms));
> >> -        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
> >>  
> >> -        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
> >>          qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
> >>          pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
> >>          /* TODO: Populate SPD eeprom data.  */
> >> @@ -315,7 +368,7 @@ static void pc_init1(MachineState *machine,
> >>                                   object_property_allow_set_link,
> >>                                   OBJ_PROP_LINK_STRONG);
> >>          object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
> >> -                                 OBJECT(piix4_pm), &error_abort);
> >> +                                 piix4_pm, &error_abort);
> >>      }
> >>  
> >>      if (machine->nvdimms_state->is_enabled) {
> >> @@ -405,6 +458,9 @@ static void pc_xen_hvm_init(MachineState *machine)
> >>      }
> >>  
> >>      pc_xen_hvm_init_pci(machine);
> >> +    if (xen_igd_gfx_pt_enabled()) {
> >> +        xen_igd_reserve_slot(pcms->bus);
> >> +    }
> >>      pci_create_simple(pcms->bus, -1, "xen-platform");
> >>  }
> >>  #endif
> >> @@ -441,6 +497,11 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
> >>      pc_i440fx_machine_options(m);
> >>      m->alias = "pc";
> >>      m->is_default = true;
> >> +#ifdef CONFIG_MICROVM_DEFAULT
> >> +    m->is_default = false;
> >> +#else
> >> +    m->is_default = true;
> >> +#endif
> >>  }
> >>  
> >>  DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
> > 
> > 
> > Lots of changes here not guarded by CONFIG_XEN.
> > 
> 
> What diff is this? How is my patch related to it?


This is what you posted, take a look:
https://lore.kernel.org/all/8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com/


-- 
MST


