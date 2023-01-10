Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D2663605
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 01:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474153.735140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF29D-00038o-Cs; Tue, 10 Jan 2023 00:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474153.735140; Tue, 10 Jan 2023 00:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF29D-000366-A7; Tue, 10 Jan 2023 00:05:47 +0000
Received: by outflank-mailman (input) for mailman id 474153;
 Tue, 10 Jan 2023 00:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF29B-000360-1W
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 00:05:45 +0000
Received: from sonic307-8.consmr.mail.gq1.yahoo.com
 (sonic307-8.consmr.mail.gq1.yahoo.com [98.137.64.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 851e7592-907a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 01:05:42 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 00:05:40 +0000
Received: by hermes--production-ne1-7b69748c4d-drrwg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7a6ec1fe15f013b8e5a1b92f9096e4a4; 
 Tue, 10 Jan 2023 00:05:38 +0000 (UTC)
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
X-Inumbo-ID: 851e7592-907a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673309140; bh=xiK5KiqCfiN1A6VOg2adTua1q58rEf/Dco968cQ11hc=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=kO1KzrtO+4XcKbOjzzAqScu+K3AwYFKsLzP+XLE3nHtCFuPT3cFewPvO/aJo1V/RI+aJfQx4wdGMhmrfOWtpQBPmfcjfuN0mpNsJaw06IUcLiV/B9mGWFQno/p+zB/kgAkN2tpLTZRHeVbyMRJHSLG5U3zHj70vV8NGc+vJiBnXTopqeK/526JZtq0TAEmeLswooyGc6NUNPs2FjfoR8WL7FO6PbDUZJSBfSSwPMOpY/MwuUZFHQ7YxoabLqfzlNWKolykBelvzFQl9NfTYDAzhWfBO5rR2KXhBh4pe356AwYQKa0Y2Q19X3n6yyqCRBYqP0C7WxfLvL1QnMSMdYJA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673309140; bh=PCF+XPvsmO4dujDdrFfKM6wN/EXN9jjbZLFIWTFrSaX=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ktlTFUsATzh6kYl4Bb4FXawzFtxRq7BS32w2DjlgBTeDOs3pevkR5GH3L2Lofy0amnx5/lwUO2835aBoGQWwFm5ZGP3uOWvYdpVfA80/dyH5Grq1zhbgnB8UU3qTqcZ/UZjsJ8ngN783W4Lq5rkEvIZzkREI23HU0ZDxJQ6KZ10Jt9LiEtS7YZu9GYoTcB3z9tEA3kS0mKDFDrsPotC4exFevW0phcVhlW5pRFHxTPnIOaXFHuw7tQOIDpDBGCaxvTbF1WF2niHzSEmjAfQWioTbzDGpbUM0XTqoNGeY3mk7+Q4ipfdZsUCEvXmC7kI4b9q4Vn7Gq6LySjFnTw5lLA==
X-YMail-OSG: qd69w.cVM1l2Y4YzytTaJ3hrOAhZ8NRYMKdfRqq8figUbSbVmltPRzcQNpSOcK4
 aaeHAGxLDxCqOI7aybhgkKqMxlQviYFTcZbDJs6TYaB__QlBATZ41IdXYO4tl9c7SdeUtpJ9cu_K
 E3NojDeMWoJSuoX4Bi5HO1OSiiKrs7rEXVTvCV_RXnPadagMgWhC7bjiXxO.AhzsoOb1gFNlWkUp
 Ae3yzxjpko3Hm_hIMFTJ8YQOQ4IYnnQZc8g7h.KeqnbCMB19jYExVZckySJNnrd2zNl3NovPMc2e
 bdLwFWENpcff80GX1iHBLN.9slrowBgu4dWc_7lMnluBQ6ENs5onXgpbLi7bGKMHCOXxe6wT089Q
 0zJaeVcGFf0VIfSgoHoczazwYlcy5CNCxtHhig3zkfAWC.LcQzP8qijHeviB8hFThVgzGfum99XP
 2gJfpmCc4j.RX_KlTb0peQtYCSdLvdGt_vBqATmD_TNoAfdZbkRbr3LM9YYs5WmOLnymMQ1RNaYZ
 bqNAnH9gWSslUtkMgbkIWMsdAGa20r18prttMh2NcDdmD14BAW5fdsc0ZVYsP5t1U4rOy8JpXb2N
 QJR99siH7YMFi7E6.hfWRB4Ce4AV.GyHjlw14rHnLC4w0RKko1scjrifqFpyxSafiHPcVjMOnnfF
 yBj0AQPlR4lRHka8TsWBh2ODT1ymyvJeTl3n3hK0Y7tqdwa6xzM.Y1SWNX3hHoU1RosaoLK6CAPo
 Z0bHDrNtoeZfQb6UJLj4.oFqhY495.cA.ep8kTT2K7.Y.DeVd2ZTBmCoJczpBJAWUBqMxwkb6FmV
 O5m5ZoOEUlANrahGyA4dmqZCbaRjrTLQnTCMPIeZ3qqPdrNQlpZZ._GzWn5P9U_DftwgXMjkneXz
 y_ZFc7yPwY9O25ga00Q8YDWPzGa_vvvJ5HX6oHKr021V9ca6jCOejSKXS0DLMfQ9yH09QRZ1IaUI
 2qrL.MJB6nAKfNZEdBKx8Zb_ANcYGeLvNGKodg1N.y96i.fzBs4M0DRyLRYrqDiXF0o93MLPvS42
 iJm3n5ijNnyAqdicw_yZhAjLI1Z41arMeh75Kz30nwPgh_bZrEGgODmdDfQd6GV6h44kk1Wck6TC
 52Ar9PQlMtoV7tK1kgfEmW8tfAI4wuaqxYYIO74nV9sqe5U8c4F8eO08YCseyu_KoZ68IllFu6Gb
 OTS4fHzL5fPBtcQg.i647S9.gpq5OtW0O1PLuYgquK1HiC50KE0qeQADuoDOHf_ClXXgDOLh6VnJ
 1w5CpZQ0PSZSiigg8mFwE8EOHJifXJAwjbuIhiZCyhrOeZcZiWtAVQF7NS7HLvkx5L3q28rsyo1r
 jhHp.fyw.slUg9dhIbQjdvHrCBNP4QYU8ZQFYFNaBXqmk.iLADV6zuaeqSorYKBDRF0RSmNOEGdN
 kVxRM0dA5gL03VOOw8ugqb_jvCIijz76G1hSIApQEhOThxAr2b3LPhPG_gDrLd_yEbekjqt34YRI
 weDd4Up2MU9SvqM9SEnA_GwnTmWi5lg_fic.Y7Sbj.a8ZTcHjwuI7xYnUuxURa9PJSLlALxPujC8
 hBvuLwPkoNIlB7Bz9ECJHo0HMnczSq1toZvWfOPBIiOOzmnBjTwB_Mn3FXSDm5Rp4ixOPNFWrbUT
 Aahg9bVlc_5ohi7R6yiRDYD4y1QT8qJcgcVSKj7wOE7FqNnvLyeOReAhLc0yetegPwL2FebIsP5x
 u040sy4CRjxEF7f4DqseSbGNM9wnOGUrM.Eky8ew_cNlX_mNnnxLZh9VsaFdn_TYJrqH.AuLVb_L
 SJEMvz7pXFo5OJNarazkn48kAn54143JMiK4c0_PF7R_vE9NWwnZmtXoOavIOn0NmMImoLP0II0i
 GUsCECLYmdDgRpUP4w_OlDrtU6lDMmdQyQbpUNro6ol_EBEGcf.chNPIWJFMBIuLwRc22kL0W74v
 aQUWljcVQ0wWY9oFbf7F9B.QhFtEEGchLNfVFShkPSf4PFHyB5K_01HuWLoPUHWGf0xjNyqFsvcn
 D6Feybu8eRcHNwngdUHqLdJyQ6xMQYAErbXb3z_nd_QzpQYvpK0bW0WAoWMAVHCuR5LHTwDGKF2N
 q_Y3NxGHlJHNU1x4T0l.tdqEmyWhgrG07inVckmQYte.Fltv.HCZo8dn0bWteJ.eM29tcfj0OsAr
 1UMILR8FNcXAKXPONB3Yhf0IbDlCyLsR8SY4t3sz0Gw9BAveR4zUKQVQGLf5bsdzp5WBPVPHR_Iw
 6I6QU3bhxnPE-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <aacffaa2-1e86-1392-8302-484248b893c4@aol.com>
Date: Mon, 9 Jan 2023 19:05:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
 <20230109183132-mutt-send-email-mst@kernel.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230109183132-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/9/23 6:33 PM, Michael S. Tsirkin wrote:
> On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
>> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>> as noted in docs/igd-assign.txt in the Qemu source code.
>> 
>> Currently, when the xl toolstack is used to configure a Xen HVM guest with
>> Intel IGD passthrough to the guest with the Qemu upstream device model,
>> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>> a different slot. This problem often prevents the guest from booting.
>> 
>> The only available workaround is not good: Configure Xen HVM guests to use
>> the old and no longer maintained Qemu traditional device model available
>> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>> 
>> To implement this feature in the Qemu upstream device model for Xen HVM
>> guests, introduce the following new functions, types, and macros:
>> 
>> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>> * typedef XenPTQdevRealize function pointer
>> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>> 
>> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>> the xl toolstack with the gfx_passthru option enabled, which sets the
>> igd-passthru=on option to Qemu for the Xen HVM machine type.
>> 
>> The new xen_igd_reserve_slot function also needs to be implemented in
>> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
>> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
>> in which case it does nothing.
>> 
>> The new xen_igd_clear_slot function overrides qdev->realize of the parent
>> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
>> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
>> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
>> 
>> Move the call to xen_host_pci_device_get, and the associated error
>> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
>> initialize the device class and vendor values which enables the checks for
>> the Intel IGD to succeed. The verification that the host device is an
>> Intel IGD to be passed through is done by checking the domain, bus, slot,
>> and function values as well as by checking that gfx_passthru is enabled,
>> the device class is VGA, and the device vendor in Intel.
>> 
>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> ---
>> Notes that might be helpful to reviewers of patched code in hw/xen:
>> 
>> The new functions and types are based on recommendations from Qemu docs:
>> https://qemu.readthedocs.io/en/latest/devel/qom.html
>> 
>> Notes that might be helpful to reviewers of patched code in hw/i386:
>> 
>> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
>> not affect builds that do not have CONFIG_XEN defined.
> 
> I'm not sure how you can claim that.

I mean the small patch to pc_piix.c in this patch sits
between an "#ifdef CONFIG_XEN" and the corresponding
"#endif" so the preprocessor will exclude it when CONFIG_XEN
is not defined. In other words, my patch is part of the
xen-specific code in pc_piix.c. Or am I missing something?


> 
> ...
> 
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index b48047f50c..34a9736b5e 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -32,6 +32,7 @@
>>  #include "hw/i386/pc.h"
>>  #include "hw/i386/apic.h"
>>  #include "hw/pci-host/i440fx.h"
>> +#include "hw/rtc/mc146818rtc.h"
>>  #include "hw/southbridge/piix.h"
>>  #include "hw/display/ramfb.h"
>>  #include "hw/firmware/smbios.h"
>> @@ -40,16 +41,16 @@
>>  #include "hw/usb.h"
>>  #include "net/net.h"
>>  #include "hw/ide/pci.h"
>> -#include "hw/ide/piix.h"
>>  #include "hw/irq.h"
>>  #include "sysemu/kvm.h"
>>  #include "hw/kvm/clock.h"
>>  #include "hw/sysbus.h"
>> +#include "hw/i2c/i2c.h"
>>  #include "hw/i2c/smbus_eeprom.h"
>>  #include "hw/xen/xen-x86.h"
>> +#include "hw/xen/xen.h"
>>  #include "exec/memory.h"
>>  #include "hw/acpi/acpi.h"
>> -#include "hw/acpi/piix4.h"
>>  #include "qapi/error.h"
>>  #include "qemu/error-report.h"
>>  #include "sysemu/xen.h"
>> @@ -66,6 +67,7 @@
>>  #include "kvm/kvm-cpu.h"
>>  
>>  #define MAX_IDE_BUS 2
>> +#define XEN_IOAPIC_NUM_PIRQS 128ULL
>>  
>>  #ifdef CONFIG_IDE_ISA
>>  static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
>> @@ -73,6 +75,32 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
>>  static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
>>  #endif
>>  
>> +/*
>> + * Return the global irq number corresponding to a given device irq
>> + * pin. We could also use the bus number to have a more precise mapping.
>> + */
>> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
>> +{
>> +    int slot_addend;
>> +    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
>> +    return (pci_intx + slot_addend) & 3;
>> +}
>> +
>> +static void piix_intx_routing_notifier_xen(PCIDevice *dev)
>> +{
>> +    int i;
>> +
>> +    /* Scan for updates to PCI link routes (0x60-0x63). */
>> +    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
>> +        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
>> +        if (v & 0x80) {
>> +            v = 0;
>> +        }
>> +        v &= 0xf;
>> +        xen_set_pci_link_route(i, v);
>> +    }
>> +}
>> +
>>  /* PC hardware initialisation */
>>  static void pc_init1(MachineState *machine,
>>                       const char *host_type, const char *pci_type)
>> @@ -84,7 +112,7 @@ static void pc_init1(MachineState *machine,
>>      MemoryRegion *system_io = get_system_io();
>>      PCIBus *pci_bus;
>>      ISABus *isa_bus;
>> -    int piix3_devfn = -1;
>> +    Object *piix4_pm;
>>      qemu_irq smi_irq;
>>      GSIState *gsi_state;
>>      BusState *idebus[MAX_IDE_BUS];
>> @@ -205,10 +233,9 @@ static void pc_init1(MachineState *machine,
>>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
>>  
>>      if (pcmc->pci_enabled) {
>> -        PIIX3State *piix3;
>> +        DeviceState *dev;
>>          PCIDevice *pci_dev;
>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>> -                                         : TYPE_PIIX3_DEVICE;
>> +        int i;
>>  
>>          pci_bus = i440fx_init(pci_type,
>>                                i440fx_host,
>> @@ -216,21 +243,65 @@ static void pc_init1(MachineState *machine,
>>                                x86ms->below_4g_mem_size,
>>                                x86ms->above_4g_mem_size,
>>                                pci_memory, ram_memory);
>> +        pci_bus_map_irqs(pci_bus,
>> +                         xen_enabled() ? xen_pci_slot_get_pirq
>> +                                       : pci_slot_get_pirq);
>>          pcms->bus = pci_bus;
>>  
>> -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
>> -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
>> -        piix3->pic = x86ms->gsi;
>> -        piix3_devfn = piix3->dev.devfn;
>> -        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>> +        object_property_set_bool(OBJECT(pci_dev), "has-usb",
>> +                                 machine_usb(machine), &error_abort);
>> +        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>> +                                 x86_machine_is_acpi_enabled(x86ms),
>> +                                 &error_abort);
>> +        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
>> +        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
>> +                                 x86_machine_is_smm_enabled(x86ms),
>> +                                 &error_abort);
>> +        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
>> +
>> +        if (xen_enabled()) {
>> +            pci_device_set_intx_routing_notifier(
>> +                        pci_dev, piix_intx_routing_notifier_xen);
>> +
>> +            /*
>> +             * Xen supports additional interrupt routes from the PCI devices to
>> +             * the IOAPIC: the four pins of each PCI device on the bus are also
>> +             * connected to the IOAPIC directly.
>> +             * These additional routes can be discovered through ACPI.
>> +             */
>> +            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
>> +                         XEN_IOAPIC_NUM_PIRQS);
>> +        }
>> +
>> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
>> +        for (i = 0; i < ISA_NUM_IRQS; i++) {
>> +            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
>> +        }
>> +        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
>> +        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
>> +                                                             "rtc"));
>> +        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
>> +        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
>> +        pci_ide_create_devs(PCI_DEVICE(dev));
>> +        idebus[0] = qdev_get_child_bus(dev, "ide.0");
>> +        idebus[1] = qdev_get_child_bus(dev, "ide.1");
>>      } else {
>>          pci_bus = NULL;
>> +        piix4_pm = NULL;
>>          isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
>>                                &error_abort);
>> +        isa_bus_irqs(isa_bus, x86ms->gsi);
>> +
>> +        rtc_state = isa_new(TYPE_MC146818_RTC);
>> +        qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
>> +        isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
>> +
>>          i8257_dma_init(isa_bus, 0);
>>          pcms->hpet_enabled = false;
>> +        idebus[0] = NULL;
>> +        idebus[1] = NULL;
>>      }
>> -    isa_bus_irqs(isa_bus, x86ms->gsi);
>>  
>>      if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
>>          pc_i8259_create(isa_bus, gsi_state->i8259_irq);
>> @@ -252,18 +323,12 @@ static void pc_init1(MachineState *machine,
>>      }
>>  
>>      /* init basic PC hardware */
>> -    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
>> +    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
>>                           0x4);
>>  
>>      pc_nic_init(pcmc, isa_bus, pci_bus);
>>  
>>      if (pcmc->pci_enabled) {
>> -        PCIDevice *dev;
>> -
>> -        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
>> -        pci_ide_create_devs(dev);
>> -        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
>> -        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
>>          pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
>>      }
>>  #ifdef CONFIG_IDE_ISA
>> @@ -289,21 +354,9 @@ static void pc_init1(MachineState *machine,
>>      }
>>  #endif
>>  
>> -    if (pcmc->pci_enabled && machine_usb(machine)) {
>> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
>> -    }
>> -
>> -    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
>> -        PCIDevice *piix4_pm;
>> -
>> +    if (piix4_pm) {
>>          smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
>> -        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
>> -        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
>> -        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
>> -                          x86_machine_is_smm_enabled(x86ms));
>> -        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
>>  
>> -        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
>>          qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
>>          pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
>>          /* TODO: Populate SPD eeprom data.  */
>> @@ -315,7 +368,7 @@ static void pc_init1(MachineState *machine,
>>                                   object_property_allow_set_link,
>>                                   OBJ_PROP_LINK_STRONG);
>>          object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
>> -                                 OBJECT(piix4_pm), &error_abort);
>> +                                 piix4_pm, &error_abort);
>>      }
>>  
>>      if (machine->nvdimms_state->is_enabled) {
>> @@ -405,6 +458,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>>      }
>>  
>>      pc_xen_hvm_init_pci(machine);
>> +    if (xen_igd_gfx_pt_enabled()) {
>> +        xen_igd_reserve_slot(pcms->bus);
>> +    }
>>      pci_create_simple(pcms->bus, -1, "xen-platform");
>>  }
>>  #endif
>> @@ -441,6 +497,11 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
>>      pc_i440fx_machine_options(m);
>>      m->alias = "pc";
>>      m->is_default = true;
>> +#ifdef CONFIG_MICROVM_DEFAULT
>> +    m->is_default = false;
>> +#else
>> +    m->is_default = true;
>> +#endif
>>  }
>>  
>>  DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
> 
> 
> Lots of changes here not guarded by CONFIG_XEN.
> 

What diff is this? How is my patch related to it?


