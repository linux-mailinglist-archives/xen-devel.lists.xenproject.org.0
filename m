Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4180CFFE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652327.1018107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiTK-0007x3-48; Mon, 11 Dec 2023 15:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652327.1018107; Mon, 11 Dec 2023 15:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiTK-0007u5-0i; Mon, 11 Dec 2023 15:45:30 +0000
Received: by outflank-mailman (input) for mailman id 652327;
 Mon, 11 Dec 2023 15:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCiTI-0007tz-Eq
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:45:28 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dee307b-983c-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 16:45:26 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso48393225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 07:45:26 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b0040b4b66110csm13379594wms.22.2023.12.11.07.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:45:25 -0800 (PST)
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
X-Inumbo-ID: 4dee307b-983c-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702309526; x=1702914326; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dzsvg2JRhp2WBCViewjz9B5ntQdfpn6OWyFZlX5XA+0=;
        b=OJCA53Scr16UdapmgFvN/sJlImU2QQBe7wqthnK9+FE8na8ch+t0OWoPBRYAIRlHC0
         wajTtTKBuOPyf4lA99vPmvY4P9FSv9Ll34vlkH8L16DuC3p0/ZUGch3PnCtIlg0cQf4h
         O4nyPkBraKYTzlbT+KoETlU2aEwyHdo2NXu6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309526; x=1702914326;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzsvg2JRhp2WBCViewjz9B5ntQdfpn6OWyFZlX5XA+0=;
        b=euPAfs0mJG2YmLBYB6fdbgPoEOo+ByiMKsCR2G0+EWPfmGR0smpTf3/ZB2OsaV1k6z
         C2LaqGZYrcviUfbgYO+XNoN+5cYoJt7WEW8QhLOYMLSDeTKsuXLdGM46gvhQRJDyrBH+
         who5GHu1H1T6pX8496Z/3PQcXuCsjECD2IpMsbTdKCOERES4/KuNuhDrFplQaeIb/I18
         vo/EtNCHKV4tonj1/lU5I/gnoz0oB59y5/bN+/C4PMBqxn1ltHwCeOX22Y2wJ4uI+HjE
         MblTTB1P9VE6zvHAhVDo+iFaJPODhWzeDoKixiFEoNtfzl1IPiHDNC8bILepMNmUmryZ
         hN6g==
X-Gm-Message-State: AOJu0YyV9LyDogdBC7rcR3PrBz4m9bgDVz4tIbdAdGa4K+6YBa7y/GqS
	csFWBoeg4dB4OXECdt/6JQAAKQ==
X-Google-Smtp-Source: AGHT+IFOoz6gzBFRlNCmm85TMu3iYATT7VeIaUXZXZII0A7jooZZJmYbocvfHglY0hU190etWOKWUQ==
X-Received: by 2002:a05:600c:331b:b0:40c:1bff:f707 with SMTP id q27-20020a05600c331b00b0040c1bfff707mr2291731wmp.156.1702309526222;
        Mon, 11 Dec 2023 07:45:26 -0800 (PST)
Date: Mon, 11 Dec 2023 16:45:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Message-ID: <ZXculMdLgwGaRC7i@macbook>
References: <alpine.DEB.2.22.394.2311291950350.3533093@ubuntu-linux-20-04-desktop>
 <ZWiyBP4Lzz5lXraP@macbook>
 <alpine.DEB.2.22.394.2311301912350.110490@ubuntu-linux-20-04-desktop>
 <ZWmgJNidFsfkDp7q@macbook>
 <alpine.DEB.2.22.394.2312011857260.110490@ubuntu-linux-20-04-desktop>
 <ZW2ptexPQXrWBiOS@macbook>
 <alpine.DEB.2.22.394.2312041413000.110490@ubuntu-linux-20-04-desktop>
 <ZW7rDjjC0gxEI1cq@macbook>
 <15275706-5c31-4e29-aa29-9f5e90526219@suse.com>
 <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Dec 06, 2023 at 06:07:26AM +0000, Chen, Jiqian wrote:
> On 2023/12/5 18:32, Jan Beulich wrote:
> > On 05.12.2023 10:19, Roger Pau Monné wrote:
> >> On Mon, Dec 04, 2023 at 02:19:33PM -0800, Stefano Stabellini wrote:
> >>> On Mon, 4 Dec 2023, Roger Pau Monné wrote:
> >>>> On Fri, Dec 01, 2023 at 07:37:55PM -0800, Stefano Stabellini wrote:
> >>>>> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
> >>>>>> On Thu, Nov 30, 2023 at 07:15:17PM -0800, Stefano Stabellini wrote:
> >>>>>>> On Thu, 30 Nov 2023, Roger Pau Monné wrote:
> >>>>>>>> On Wed, Nov 29, 2023 at 07:53:59PM -0800, Stefano Stabellini wrote:
> >>>>>>>>> On Fri, 24 Nov 2023, Jiqian Chen wrote:
> >>>>>>>>>> This patch is to solve two problems we encountered when we try to
> >>>>>>>>>> passthrough a device to hvm domU base on Xen PVH dom0.
> >>>>>>>>>>
> >>>>>>>>>> First, hvm guest will alloc a pirq and irq for a passthrough device
> >>>>>>>>>> by using gsi, before that, the gsi must first has a mapping in dom0,
> >>>>>>>>>> see Xen code pci_add_dm_done->xc_domain_irq_permission, it will call
> >>>>>>>>>> into Xen and check whether dom0 has the mapping. See
> >>>>>>>>>> XEN_DOMCTL_irq_permission->pirq_access_permitted, "current" is PVH
> >>>>>>>>>> dom0 and it return irq is 0, and then return -EPERM.
> >>>>>>>>>> This is because the passthrough device doesn't do PHYSDEVOP_map_pirq
> >>>>>>>>>> when thay are enabled.
> >>>>>>>>>>
> >>>>>>>>>> Second, in PVH dom0, the gsi of a passthrough device doesn't get
> >>>>>>>>>> registered, but gsi must be configured for it to be able to be
> >>>>>>>>>> mapped into a domU.
> >>>>>>>>>>
> >>>>>>>>>> After searching codes, we can find map_pirq and register_gsi will be
> >>>>>>>>>> done in function vioapic_write_redirent->vioapic_hwdom_map_gsi when
> >>>>>>>>>> the gsi(aka ioapic's pin) is unmasked in PVH dom0. So the problems
> >>>>>>>>>> can be conclude to that the gsi of a passthrough device doesn't be
> >>>>>>>>>> unmasked.
> >>>>>>>>>>
> >>>>>>>>>> To solve the unmaske problem, this patch call the unmask_irq when we
> >>>>>>>>>> assign a device to be passthrough. So that the gsi can get registered
> >>>>>>>>>> and mapped in PVH dom0.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Roger, this seems to be more of a Xen issue than a Linux issue. Why do
> >>>>>>>>> we need the unmask check in Xen? Couldn't we just do:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> >>>>>>>>> index 4e40d3609a..df262a4a18 100644
> >>>>>>>>> --- a/xen/arch/x86/hvm/vioapic.c
> >>>>>>>>> +++ b/xen/arch/x86/hvm/vioapic.c
> >>>>>>>>> @@ -287,7 +287,7 @@ static void vioapic_write_redirent(
> >>>>>>>>>              hvm_dpci_eoi(d, gsi);
> >>>>>>>>>      }
> >>>>>>>>>  
> >>>>>>>>> -    if ( is_hardware_domain(d) && unmasked )
> >>>>>>>>> +    if ( is_hardware_domain(d) )
> >>>>>>>>>      {
> >>>>>>>>>          /*
> >>>>>>>>>           * NB: don't call vioapic_hwdom_map_gsi while holding hvm.irq_lock
> >>>>>>>>
> >>>>>>>> There are some issues with this approach.
> >>>>>>>>
> >>>>>>>> mp_register_gsi() will only setup the trigger and polarity of the
> >>>>>>>> IO-APIC pin once, so we do so once the guest unmask the pin in order
> >>>>>>>> to assert that the configuration is the intended one.  A guest is
> >>>>>>>> allowed to write all kind of nonsense stuff to the IO-APIC RTE, but
> >>>>>>>> that doesn't take effect unless the pin is unmasked.
> >>>>>>>>
> >>>>>>>> Overall the question would be whether we have any guarantees that
> >>>>>>>> the hardware domain has properly configured the pin, even if it's not
> >>>>>>>> using it itself (as it hasn't been unmasked).
> >>>>>>>>
> >>>>>>>> IIRC PCI legacy interrupts are level triggered and low polarity, so we
> >>>>>>>> could configure any pins that are not setup at bind time?
> >>>>>>>
> >>>>>>> That could work.
> >>>>>>>
> >>>>>>> Another idea is to move only the call to allocate_and_map_gsi_pirq at
> >>>>>>> bind time? That might be enough to pass a pirq_access_permitted check.
> >>>>>>
> >>>>>> Maybe, albeit that would change the behavior of XEN_DOMCTL_bind_pt_irq
> >>>>>> just for PT_IRQ_TYPE_PCI and only when called from a PVH dom0 (as the
> >>>>>> parameter would be a GSI instead of a previously mapped IRQ).  Such
> >>>>>> difference just for PT_IRQ_TYPE_PCI is slightly weird - if we go that
> >>>>>> route I would recommend that we instead introduce a new dmop that has
> >>>>>> this syntax regardless of the domain type it's called from.
> >>>>>
> >>>>> Looking at the code it is certainly a bit confusing. My point was that
> >>>>> we don't need to wait until polarity and trigger are set appropriately
> >>>>> to allow Dom0 to pass successfully a pirq_access_permitted() check. Xen
> >>>>> should be able to figure out that Dom0 is permitted pirq access.
> >>>>
> >>>> The logic is certainly not straightforward, and it could benefit from
> >>>> some comments.
> >>>>
> >>>> The irq permissions are a bit special, in that they get setup when the
> >>>> IRQ is mapped.
> >>>>
> >>>> The problem however is not so much with IRQ permissions, that we can
> >>>> indeed sort out internally in Xen.  Such check in dom0 has the side
> >>>> effect of preventing the IRQ from being assigned to a domU without the
> >>>> hardware source being properly configured AFAICT.
> >>>
> >>> Now I understand why you made a comment previously about Xen having to
> >>> configure trigger and polarity for these interrupts on its own.
> >>>
> >>>
> >>>>> So the idea was to move the call to allocate_and_map_gsi_pirq() earlier
> >>>>> somewhere because allocate_and_map_gsi_pirq doesn't require trigger or
> >>>>> polarity to be configured to work. But the suggestion of doing it a
> >>>>> "bind time" (meaning: XEN_DOMCTL_bind_pt_irq) was a bad idea.
> >>>>>
> >>>>> But maybe we can find another location, maybe within
> >>>>> xen/arch/x86/hvm/vioapic.c, to call allocate_and_map_gsi_pirq() before
> >>>>> trigger and polarity are set and before the interrupt is unmasked.
> >>>>>
> >>>>> Then we change the implementation of vioapic_hwdom_map_gsi to skip the
> >>>>> call to allocate_and_map_gsi_pirq, because by the time
> >>>>> vioapic_hwdom_map_gsi we assume that allocate_and_map_gsi_pirq had
> >>>>> already been done.
> >>>>
> >>>> But then we would end up in a situation where the
> >>>> pirq_access_permitted() check will pass, but the IO-APIC pin won't be
> >>>> configured, which I think it's not what we want.
> >>>>
> >>>> One option would be to allow mp_register_gsi() to be called multiple
> >>>> times, and update the IO-APIC pin configuration as long as the pin is
> >>>> not unmasked.  That would propagate each dom0 RTE update to the
> >>>> underlying IO-APIC.  However such approach relies on dom0 configuring
> >>>> all possible IO-APIC pins, even if no device on dom0 is using them, I
> >>>> think it's not a very reliable option.
> >>>>
> >>>> Another option would be to modify the toolstack to setup the GSI
> >>>> itself using the PHYSDEVOP_setup_gsi hypercall.  As said in a previous
> >>>> email, since we only care about PCI device passthrough the legacy INTx
> >>>> should always be level triggered and low polarity.
> >>>>
> >>>>> I am not familiar with vioapic.c but to give you an idea of what I was
> >>>>> thinking:
> >>>>>
> >>>>>
> >>>>> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> >>>>> index 4e40d3609a..16d56fe851 100644
> >>>>> --- a/xen/arch/x86/hvm/vioapic.c
> >>>>> +++ b/xen/arch/x86/hvm/vioapic.c
> >>>>> @@ -189,14 +189,6 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
> >>>>>          return ret;
> >>>>>      }
> >>>>>  
> >>>>> -    ret = allocate_and_map_gsi_pirq(currd, pirq, &pirq);
> >>>>> -    if ( ret )
> >>>>> -    {
> >>>>> -        gprintk(XENLOG_WARNING, "vioapic: error mapping GSI %u: %d\n",
> >>>>> -                 gsi, ret);
> >>>>> -        return ret;
> >>>>> -    }
> >>>>> -
> >>>>>      pcidevs_lock();
> >>>>>      ret = pt_irq_create_bind(currd, &pt_irq_bind);
> >>>>>      if ( ret )
> >>>>> @@ -287,6 +279,17 @@ static void vioapic_write_redirent(
> >>>>>              hvm_dpci_eoi(d, gsi);
> >>>>>      }
> >>>>>  
> >>>>> +    if ( is_hardware_domain(d) ) 
> >>>>> +    {
> >>>>> +        int pirq = gsi, ret;
> >>>>> +        ret = allocate_and_map_gsi_pirq(currd, pirq, &pirq);
> >>>>> +        if ( ret )
> >>>>> +        {
> >>>>> +            gprintk(XENLOG_WARNING, "vioapic: error mapping GSI %u: %d\n",
> >>>>> +                    gsi, ret);
> >>>>> +            return ret;
> >>>>> +        }
> >>>>> +    }
> >>>>>      if ( is_hardware_domain(d) && unmasked )
> >>>>>      {
> >>>>>          /*
> >>>>
> >>>> As said above, such approach relies on dom0 writing to the IO-APIC RTE
> >>>> of likely each IO-APIC pin, which is IMO not quite reliable.  In there
> >>>> are two different issues here that need to be fixed for PVH dom0:
> >>>>
> >>>>  - Fix the XEN_DOMCTL_irq_permission pirq_access_permitted() call to
> >>>>    succeed for a PVH dom0, even if dom0 is not using the GSI itself.
> >>>
> >>> Yes makes sense
> >>>
> >>>
> >>>>  - Configure IO-APIC pins for PCI interrupts even if dom0 is not using
> >>>>    the IO-APIC pin itself.
> >>>>
> >>>> First one needs to be fixed internally in Xen, second one will require
> >>>> the toolstack to issue an extra hypercall in order to ensure the
> >>>> IO-APIC pin is properly configured.
> >>>  
> >>> On ARM, Xen doesn't need to wait for dom0 to configure interrupts
> >>> correctly. Xen configures them all on its own at boot based on Device
> >>> Tree information. I guess it is not possible to do the same on x86?
> >>
> >> No, not exactly.  There's some interrupt information in the ACPI MADT,
> >> but that's just for very specific sources (Interrupt Source Override
> >> Structures)
> >>
> >> Then on AML devices can have resource descriptors that contain
> >> information about how interrupts are setup.  However Xen is not able
> >> to read any of this information on AML.
> >>
> >> Legacy PCI interrupts are (always?) level triggered and low polarity,
> >> because it's assumed that an interrupt source can be shared between
> >> multiple devices.
> > 
> > Except that as per what you said just in the earlier paragraph ACPI can
> > tell us otherwise.
> > 
> >> I'm however not able to find any reference to this in the PCI spec,
> >> hence I'm reluctant to take this for granted in Xen, and default all
> >> GSIs >= 16 to such mode.
> >>
> >> OTOH legacy PCI interrupts are not that used anymore, as almost all
> >> devices will support MSI(-X) (because PCIe mandates it) and OSes
> >> should prefer the latter.  SR-IOV VF don't even support legacy PCI
> >> interrupts anymore.
> >>
> >>> If
> >>> not, then I can see why we would need 1 extra toolstack hypercall for
> >>> that (or to bundle the operation of configuring IO-APIC pins together
> >>> with an existing toolstack hypercall).
> >>
> >> One suitable compromise would be to default unconfigured GSIs >= 16 to
> >> level-triggered and low-polarity, as I would expect that to work in
> >> almost all cases.  We can always introduce the usage of
> >> PHYSDEVOP_setup_gsi later if required.
> >>
> >> Maybe Jan has more input here, would you agree to defaulting non-ISA
> >> GSIs to level-triggered, low-polarity in the absence of a specific
> >> setup provided by dom0?
> > 
> > Well, such defaulting is an option, but in case it's wrong we might
> > end up with hard to diagnose issues. Personally I'd prefer if we
> > didn't take shortcuts here, i.e. if we followed what Dom0 is able
> > to read from ACPI.
> 
> When PVH dom0 enable a device, it will get trigger and polarity from ACPI (see acpi_pci_irq_enable)
> I have a version of patch which tried that way, see below:
> 
> diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
> index ada3868c02c2..43e1bda9f946 100644
> --- a/arch/x86/xen/enlighten_pvh.c
> +++ b/arch/x86/xen/enlighten_pvh.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/acpi.h>
>  #include <linux/export.h>
> +#include <linux/pci.h>
> 
>  #include <xen/hvc-console.h>
> 
> @@ -25,6 +26,127 @@
>  bool __ro_after_init xen_pvh;
>  EXPORT_SYMBOL_GPL(xen_pvh);
> 
> +typedef struct gsi_info {
> +       int gsi;
> +       int trigger;
> +       int polarity;
> +       int pirq;
> +} gsi_info_t;
> +
> +struct acpi_prt_entry {
> +       struct acpi_pci_id      id;
> +       u8                      pin;
> +       acpi_handle             link;
> +       u32                     index;          /* GSI, or link _CRS index */
> +};
> +
> +static int xen_pvh_get_gsi_info(struct pci_dev *dev,
> +                                                               gsi_info_t *gsi_info)
> +{
> +       int gsi;
> +       u8 pin = 0;
> +       struct acpi_prt_entry *entry;
> +       int trigger = ACPI_LEVEL_SENSITIVE;
> +       int polarity = acpi_irq_model == ACPI_IRQ_MODEL_GIC ?
> +                                     ACPI_ACTIVE_HIGH : ACPI_ACTIVE_LOW;
> +
> +       if (dev)
> +               pin = dev->pin;
> +       if (!pin) {
> +               xen_raw_printk("No interrupt pin configured\n");
> +               return -EINVAL;
> +       }
> +
> +       entry = acpi_pci_irq_lookup(dev, pin);
> +       if (entry) {
> +               if (entry->link)
> +                       gsi = acpi_pci_link_allocate_irq(entry->link,
> +                                                        entry->index,
> +                                                        &trigger, &polarity,
> +                                                        NULL);
> +               else
> +                       gsi = entry->index;
> +       } else
> +               return -EINVAL;
> +
> +       gsi_info->gsi = gsi;
> +       gsi_info->trigger = trigger;
> +       gsi_info->polarity = polarity;
> +
> +       return 0;
> +}
> +
> +static int xen_pvh_map_pirq(gsi_info_t *gsi_info)
> +{
> +       struct physdev_map_pirq map_irq;
> +       int ret;
> +
> +       map_irq.domid = DOMID_SELF;
> +       map_irq.type = MAP_PIRQ_TYPE_GSI;
> +       map_irq.index = gsi_info->gsi;
> +       map_irq.pirq = gsi_info->gsi;
> +
> +       ret = HYPERVISOR_physdev_op(PHYSDEVOP_map_pirq, &map_irq);
> +       gsi_info->pirq = map_irq.pirq;
> +
> +       return ret;
> +}
> +
> +static int xen_pvh_unmap_pirq(gsi_info_t *gsi_info)
> +{
> +       struct physdev_unmap_pirq unmap_irq;
> +
> +       unmap_irq.domid = DOMID_SELF;
> +       unmap_irq.pirq = gsi_info->pirq;
> +
> +       return HYPERVISOR_physdev_op(PHYSDEVOP_unmap_pirq, &unmap_irq);
> +}
> +
> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
> +{
> +       struct physdev_setup_gsi setup_gsi;
> +
> +       setup_gsi.gsi = gsi_info->gsi;
> +       setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
> +       setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
> +
> +       return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
> +}

Hm, why not simply call pcibios_enable_device() from pciback?  What
you are doing here using the hypercalls is a backdoor into what's done
automatically by Xen on IO-APIC accesses by a PVH dom0.

It will be much more natural for the PVH dom0 model to simply use the
native way to configure and unmask the IO-APIC pin, and that would
correctly setup the triggering/polarity and bind it to dom0 without
requiring the usage of any hypercalls.

Is that an issue since in that case the gsi will get mapped and bound
to dom0?

Otherwise I would prefer if the gsi is just configured from pciback
(PHYSDEVOP_setup_gsi) but not mapped, as allowing a PVH dom0 to map
interrupts using PHYSDEVOP_{,un}map_pirq to itself introduces a new
interface to manage interrupts that clashes with the native way that a
PVH dom0 uses.

Thanks, Roger.

