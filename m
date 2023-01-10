Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027116638F9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 07:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474274.735362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF7fv-0001U5-Uz; Tue, 10 Jan 2023 05:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474274.735362; Tue, 10 Jan 2023 05:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF7fv-0001SA-RU; Tue, 10 Jan 2023 05:59:55 +0000
Received: by outflank-mailman (input) for mailman id 474274;
 Tue, 10 Jan 2023 05:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF7fu-0001AS-7W
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 05:59:54 +0000
Received: from sonic317-22.consmr.mail.gq1.yahoo.com
 (sonic317-22.consmr.mail.gq1.yahoo.com [98.137.66.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe31a185-90ab-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 06:59:51 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 05:59:48 +0000
Received: by hermes--production-ne1-7b69748c4d-bgkrh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a8406ef0cbcbedb2d3599d546f1be4ba; 
 Tue, 10 Jan 2023 05:59:46 +0000 (UTC)
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
X-Inumbo-ID: fe31a185-90ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673330388; bh=IQswRJ3mNTU2rW5CB8ekxkuMTpc6VFiPyScNDj65O6E=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=uDAO4jcip6hhG13sRDD1TCwo0Uy/ZDmUpsQI5dm6JQeRwMERoUDWoefNyRxPifmxaggFFP7k+Klch+9QGaefYYZjP8wGtpPRBm8LkkUH9JJHOvmgGWjvWSKRq0ArOnuJrReNrYwkQ5Ym9C6/Z8zr3J70MfvrFS+tKTPx3Ry3JCwvCuqIMMDkSPI4d3H2xAThT0XlCvna6iRc+wO9gNbDsdQ9avTo8OPMPSBa4LKKtOehMEltjciFzvl6RqBFKS4t2ntuw8vAoEJ/yLLnLoXltaq7WUm1lpArzqU3tKsWCCajiSnfBjxikpYcSMF67SaOgH2q8erCgSXhTY+MjlxbbQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673330388; bh=LZqtAdaC54vL/ejVGshCmWeWyIi/se6my3VUn5Dvwku=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=riia0ZVjp6RfB8x36IDIyJla5JSgDYpM0brW+qZKNvGQduPP+3hW6fTptr9Fe7wLst4DmdyMTRnfEoZd15fNojl/Igcu97YD5WsxFloHZt9cpOVxxhIzhhb8R6o0BRJzypgEFGhHU4SFrQS7QRKpYit0635OhZ3fC7rNn3Nwy994hNUYBiKXCH1bRjbi+4aYJJztwVW6i/AZXNrLDOrZ2IUGpa9KSQoMZbR7OQdSC8YJCSCP8mjYiQtD8ezAqUrjFyNq1Rdm4LffKIsG7bGs1TWF31DU/x7Xb9UyV3KlSDQJucbD914Tz1PiToTyGbuuLN9jbiqCyFXbzZ+ik6T9+A==
X-YMail-OSG: L4UlU_MVM1leDEms_BcRLMUJc.6udPFe1VgzSYs9.g3zFCK3S7ZEr18nxUJJtnY
 ciVYSmIVPGDtams3XtAwHf_5Q6ILQOZ6zcYHq_fDFTVYAWlQw_cz_79xklgKkisEhs8PLATiILFk
 zLPiUqdQ3WF2Kbde9ZLavisvZkcmb_EEq2JXMTGqX47_mbuGqqsXVAwWCC7F6FQ0YBM3qEx_cr8A
 dgIhYpGvipfbYcew6KQFDt13QfdTMb0X92chYEX7F_Qq40JSYXhcyF2I2yEfhHnJLiXOHCFU4qCd
 Ani6DWHP9.sRfmmmvb0BGKSlGg7she7RQRZRc9fByontYFDIVOVE58jlv8hUG8IvyK8dPGTtu8E3
 MBx_tKSaAUg928xVgxYsEE_lF9Wsx6h7ZdJxa5SM1ycc75GkXtjEWUAiIu1UEtypcrZbrklXsWZT
 KebkKCKtklzLYJbEWDSgqtZe1zHu6yZ1UE6jrQjcAl.EkGC6T48gJVy_q60Qz7A0GXtZjFEuUvoA
 lF.yk0YgTxRMxsxhhkd.1Ra4366vn_hEbvtswegcdSLYp5jTzni_Qz4eWhh4JnpzpPA0EMDMwmSP
 Rgb9YsWyhQHCGx4O6SLIxBI.LK8.2PN0rMIWwojeMHF4lheGmO2FD3wT606w770xIeEgRdE07W2C
 BHrLKQ_vYR3pAilt.l_Ds66Aar47ZgGhcYvL.ArirvAsD94OotjqNLxMWso_iG16xOaan0RzJ4Aq
 aOT1h3QiMehNdF4_P3roQJnRkCpzaEiPtcMW_z.ZBCq.kYaWM4bIqo9V78ugAKYYWSe.tS3QOMgt
 BKUgw1dKYse7cBe7hnrCEqhkjW0yXvFOrsUlCoEO2l.njf71KoAwFmvit6XYL02MTqomPqBCXNpH
 mCBzaF_8E6gzQebzU0yX3FRBW3k4MrfylZTji1pN69uOl_9mdcH10mGdiBPIio7v7MtZup3JPr2n
 fAhet_x77uZq9CSoLwIhxEVcZChfkCADN7vMEabiLVuZNtKPXrHdsYNeXSLoOld1wR.Sufddxs.A
 DtfeXcEUqvbBgBc4970Y7UTWNCd2N72hHOTgClYNUOW0zPi10SRL0UTYjw8ZrzUDrHnAPqikvcnx
 XSow69zQJqdcFSajakkka_cBVWTf9AO1kL2pfZuF1DOZPbMdIMRLXerym0lR2DhapuGriv5n8LhI
 .KBr9EDrLeTj9HRwBnOgzi3BKX9sgSEoDrlmxP5A7SV2crk1TbPwXFmWkIeO15Wey37E0ADYmLEO
 rIOLwF_qq3Lwj5JCOSHX30uFdax64CCdHAlZmBi5mXANvGGi6R8GY8ley7mbcT0K6CK5s_y3qGGN
 oGD.QPsapvby01QGSdJdZLKClSJRtkxVYQ54_Fuc15LVuwAatxQWbsBY3HZ5JFd8CMFaNE0NT9MV
 j6aGCl9UYQaF27OwcWFoaIGXevW3htJXIQLbBirn5Ked75fWyiwJBHSPawVNTgLPtNgkH4lOt51S
 KaXCn8rPmX.DqsyhCAXOA0csJEY_HIZpQUbkMrqSGDp_7ivRmda65e90cgbwOLfxXhqVrRctpT.T
 D4mxvFwthNKrE0vXJ6w4HcmINGhe2LI.lBdZcPgUg0ik24xbURgymsCHYi17gE23r9f3N0JK65dc
 DO735PWN5eJLQ_pLWO7BFkiP8E_EjBqPXT6EC_6NXKueHEkm5ay_Y12DN2dZZ0Hv_7zMFZAlZQLC
 upAERu.3Salf5p3hvF_JWl82VllHqNO2XaZNMYQzPrtxcuBGzLKSUEe06cOMs1Orkbo1yQ.JfR1I
 rjVbnY6eCU3N3Jk0KhtnVsvO_wisdhBRGU.iq4DvYNHNfGcuzZr5op69jZ9vi.UdL8oCfkUb8JjI
 i0jva1QxsasNWFRtmzwySoyFdW6Y2xexRJztBR2I_U1qAfHaWY194dxSh07lbTEPB_WCF3CoA42o
 O6e5ZiVQETuEp4iJZxjf53z0QcxbgEu1EmydIfZwwUQq.sb4EB8QGygdZ4QGIPmHwxwpduXmDnnb
 SHPd_nDD3FoGCybQ6RUF6Q5mCr9BFRouIicx_F_3IBZqhZA2smKMZNSd9PCCGSj5g9RFJbm.uqO3
 .BORoGiJ8GR7Rveyl_fIbeTMSqVIMTlKZ0781olKwxCz5_qNiZlT_pKzvbc2wyuoC_9dkBf3eGxC
 NQnqnYR1CDuOt_ZQTZrfbA73JBiw0uWzSlWzOLkx7MOPj.jDzbKBZHp_sxGrqQthnbJb5jAlNzKM
 dJzKAOfDMkHUg
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <5d8b4bfd-92b3-e63a-58fa-b2dc953a7ee5@aol.com>
Date: Tue, 10 Jan 2023 00:59:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
 <aacffaa2-1e86-1392-8302-484248b893c4@aol.com>
 <20230110002712-mutt-send-email-mst@kernel.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230110002712-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/10/2023 12:27 AM, Michael S. Tsirkin wrote:
> On Mon, Jan 09, 2023 at 07:05:35PM -0500, Chuck Zmudzinski wrote:
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
>
>
> This is what you posted, take a look:
> https://lore.kernel.org/all/8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com/
>
>

Oops, I think I sent the wrong patch here. I must have used the wrong git
branch. Sorry.

I wouldn't blame you if you ignore future messages from me.

I will get it right next time if there is a next time with v8. Linus
named git a stupid content tracker. And in this case, it was
too stupid to warn me that the patch it sent on my behalf is
not what I expected it to be. Or maybe I am the stupid one, LOL.

I hope no one is stupid enough to consider v7 of my patch any
further! And the fact that this stupidity of mine is preserved for
all future generations is so sweet - one of the benefits of trying
to help out in FLOSS projects, LOL.

Kind regards,

Chuck

