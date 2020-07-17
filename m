Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E2223A18
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 13:17:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwOMM-0005qz-Fh; Fri, 17 Jul 2020 11:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jwOML-0005qu-PA
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 11:16:57 +0000
X-Inumbo-ID: 058ecbfe-c81f-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 058ecbfe-c81f-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 11:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594984615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j7tTR5dDUNpQegeKl/NFt3JZg8+0/ltBa+Hn+nPZJBE=;
 b=Irx9G451scm/ctoHjK+0mbfkai+5WNxziJTSNbprqYDbl5/novhnsV3g
 +nWFsGvLAE052Tjl0TDyUwjp0CCS9sgoKTLt+dyY39DIZYtB9j4b/XuFQ
 dOTwMCb9bYZVJE/0CDWTZ//fsrJ7D6xQtKUcb20o7YBTY9tOHpvF8zIjY o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Va+i6L8kROWtOhh4mWoadIoeKyG8xttKaoqRPaY2Htu/cIFEbZgw33quaniNnkGlTf9YEC3A1j
 Yx2kRpGRNbC1P5mhXceM5aEgNyqGVmLcUyttbXBeiDTVluT1ukS4RWUMUKz42JxpSPYY+lKAEV
 HLmbgVoufuidRoCXfL/PeWTi59AgLh5y0KN5EsM4B93g4GALVLxTD6qxht3PI6lMCZgU3xame4
 7AEykjrftVbwxJXN/EJWRtoJrXWLrzynevkZOFXK90dBW7BYVwKz0y7gXf0QtbJtVLQv2tVveC
 ZXk=
X-SBRS: 2.7
X-MesageID: 23458554
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="23458554"
Date: Fri, 17 Jul 2020 13:16:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Message-ID: <20200717111644.GS7191@Air-de-Roger>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I've wrapped the email to 80 columns in order to make it easier to
reply.

Thanks for doing this, I think the design is good, I have some
questions below so that I understand the full picture.

On Thu, Jul 16, 2020 at 05:10:05PM +0000, Rahul Singh wrote:
> Hello All,
> 
> Following up on discussion on PCI Passthrough support on ARM that we
> had at the XEN summit, we are submitting a Review For Comment and a
> design proposal for PCI passthrough support on ARM. Feel free to
> give your feedback.
> 
> The followings describe the high-level design proposal of the PCI
> passthrough support and how the different modules within the system
> interacts with each other to assign a particular PCI device to the
> guest.
> 
> # Title:
> 
> PCI devices passthrough on Arm design proposal
> 
> # Problem statement:
> 
> On ARM there in no support to assign a PCI device to a guest. PCI
> device passthrough capability allows guests to have full access to
> some PCI devices. PCI device passthrough allows PCI devices to
> appear and behave as if they were physically attached to the guest
> operating system and provide full isolation of the PCI devices.
> 
> Goal of this work is to also support Dom0Less configuration so the
> PCI backend/frontend drivers used on x86 shall not be used on Arm.
> It will use the existing VPCI concept from X86 and implement the
> virtual PCI bus through IO emulation such that only assigned devices
> are visible to the guest and guest can use the standard PCI
> driver.
> 
> Only Dom0 and Xen will have access to the real PCI bus, guest will
> have a direct access to the assigned device itself. IOMEM memory
> will be mapped to the guest and interrupt will be redirected to the
> guest. SMMU has to be configured correctly to have DMA
> transaction.
> 
> ## Current state: Draft version
> 
> # Proposer(s): Rahul Singh, Bertrand Marquis
> 
> # Proposal:
> 
> This section will describe the different subsystem to support the
> PCI device passthrough and how these subsystems interact with each
> other to assign a device to the guest.
> 
> # PCI Terminology:
> 
> Host Bridge: Host bridge allows the PCI devices to talk to the rest
> of the computer.  ECAM: ECAM (Enhanced Configuration Access
> Mechanism) is a mechanism developed to allow PCIe to access
> configuration space. The space available per function is 4KB.
> 
> # Discovering PCI Host Bridge in XEN:
> 
> In order to support the PCI passthrough XEN should be aware of all
> the PCI host bridges available on the system and should be able to
> access the PCI configuration space. ECAM configuration access is
> supported as of now. XEN during boot will read the PCI device tree
> node “reg” property and will map the ECAM space to the XEN memory
> using the “ioremap_nocache ()” function.

What about ACPI? I think you should also mention the MMCFG table,
which should contain the information about the ECAM region(s) (or at
least that's how it works on x86). Just realized that you don't
support ACPI ATM, so you can ignore this comment.

> 
> If there are more than one segment on the system, XEN will read the
> “linux, pci-domain” property from the device tree node and configure
> the host bridge segment number accordingly. All the PCI device tree
> nodes should have the “linux,pci-domain” property so that there will
> be no conflicts. During hardware domain boot Linux will also use the
> same “linux,pci-domain” property and assign the domain number to the
> host bridge.

So it's my understanding that the PCI domain (or segment) is just an
abstract concept to differentiate all the Root Complex present on
the system, but the host bridge itself it's not aware of the segment
assigned to it in any way.

I'm not sure Xen and the hardware domain having matching segments is a
requirement, if you use vPCI you can match the segment (from Xen's
PoV) by just checking from which ECAM region the access has been
performed.

The only reason to require matching segment values between Xen and the
hardware domain is to allow using hypercalls against the PCI devices,
ie: to be able to use hypercalls to assign a device to a domain from
the hardware domain.

I have 0 understanding of DT or it's spec, but why does this have a
'linux,' prefix? The segment number is part of the PCI spec, and not
something specific to Linux IMO.

> 
> When Dom0 tries to access the PCI config space of the device, XEN
> will find the corresponding host bridge based on segment number and
> access the corresponding config space assigned to that bridge.
> 
> Limitation:
> * Only PCI ECAM configuration space access is supported.
> * Device tree binding is supported as of now, ACPI is not supported.
> * Need to port the PCI host bridge access code to XEN to access the
>   configuration space (generic one works but lots of platforms will
>   required  some specific code or quirks).
> 
> # Discovering PCI devices:
> 
> PCI-PCIe enumeration is a process of detecting devices connected to
> its host. It is the responsibility of the hardware domain or boot
> firmware to do the PCI enumeration and configure the BAR, PCI
> capabilities, and MSI/MSI-X configuration.
> 
> PCI-PCIe enumeration in XEN is not feasible for the configuration
> part as it would require a lot of code inside Xen which would
> require a lot of maintenance. Added to this many platforms require
> some quirks in that part of the PCI code which would greatly improve
> Xen complexity. Once hardware domain enumerates the device then it
> will communicate to XEN via the below hypercall.
> 
> #define PHYSDEVOP_pci_device_add        25 struct
> physdev_pci_device_add {
>     uint16_t seg;
>     uint8_t bus;
>     uint8_t devfn;
>     uint32_t flags;
>     struct {
>         uint8_t bus;
>         uint8_t devfn;
>     } physfn;
>     /*
>      * Optional parameters array.
>      * First element ([0]) is PXM domain associated with the device (if
>      * XEN_PCI_DEV_PXM is set)
>      */
>     uint32_t optarr[XEN_FLEX_ARRAY_DIM];
> };
> 
> As the hypercall argument has the PCI segment number, XEN will
> access the PCI config space based on this segment number and find
> the host-bridge corresponding to this segment number. At this stage
> host bridge is fully initialized so there will be no issue to access
> the config space.
> 
> XEN will add the PCI devices in the linked list maintain in XEN
> using the function pci_add_device(). XEN will be aware of all the
> PCI devices on the system and all the device will be added to the
> hardware domain.
> 
> Limitations:
> * When PCI devices are added to XEN, MSI capability is
>   not initialized inside XEN and not supported as of now.

I assume you will mask such capability and will prevent the guest (or
hardware domain) from interacting with it?

> * ACS capability is disable for ARM as of now as after enabling it
>   devices are not accessible.
> * Dom0Less implementation will require to have the capacity inside Xen
>   to discover the PCI devices (without depending on Dom0 to declare them
>   to Xen).

I assume the firmware will properly initialize the host bridge and
configure the resources for each device, so that Xen just has to walk
the PCI space and find the devices.

TBH that would be my preferred method, because then you can get rid of
the hypercall.

Is there anyway for Xen to know whether the host bridge is properly
setup and thus the PCI bus can be scanned?

That way Arm could do something similar to x86, where Xen will scan
the bus and discover devices, but you could still provide the
hypercall in case the bus cannot be scanned by Xen (because it hasn't
been setup).

> 
> # Enable the existing x86 virtual PCI support for ARM:
> 
> The existing VPCI support available for X86 is adapted for Arm. When
> the device is added to XEN via the hyper call
> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space access
> is added to the PCI device to emulate the PCI devices.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN so
> that when guest is trying to access the PCI config space, XEN will
> trap the access and emulate read/write using the VPCI and not the
> real PCI hardware.
> 
> Limitation:
> * No handler is register for the MSI configuration.

But you need to mask MSI/MSI-X capabilities in the config space in
order to prevent access from domains? (and by mask I mean remove from
the list of capabilities and prevent reads/writes to that
configuration space).

Note this is already implemented for x86, and I've tried to add arch_
hooks for arch specific stuff so that it could be reused by Arm. But
maybe this would require a different design document?

> * Only legacy interrupt is supported and tested as of now, MSI is not
>   implemented and tested.
> 
> # Assign the device to the guest:
> 
> Assign the PCI device from the hardware domain to the guest is done
> using the below guest config option. When xl tool create the domain,
> PCI devices will be assigned to the guest VPCI bus.
>
> pci=[ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...]
> 
> Guest will be only able to access the assigned devices and see the
> bridges. Guest will not be able to access or see the devices that
> are no assigned to him.
> 
> Limitation:
> * As of now all the bridges in the PCI bus are seen by
>   the guest on the VPCI bus.

I don't think you need all of them, just the ones that are higher up
on the hierarchy of the device you are trying to passthrough?

Which kind of access do guest have to PCI bridges config space?

This should be limited to read-only accesses in order to be safe.

Emulating a PCI bridge in Xen using vPCI shouldn't be that
complicated, so you could likely replace the real bridges with
emulated ones. Or even provide a fake topology to the guest using an
emulated bridge.

> 
> # Emulated PCI device tree node in libxl:
> 
> Libxl is creating a virtual PCI device tree node in the device tree
> to enable the guest OS to discover the virtual PCI during guest
> boot. We introduced the new config option [vpci="pci_ecam"] for
> guests. When this config option is enabled in a guest configuration,
> a PCI device tree node will be created in the guest device tree.
> 
> A new area has been reserved in the arm guest physical map at which
> the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node). A trap handler for the PCI ECAM access from
> guest has been registered at the defined address and redirects
> requests to the VPCI driver in Xen.

Can't you deduce the requirement of such DT node based on the presence
of a 'pci=' option in the same config file?

Also I wouldn't discard that in the future you might want to use
different emulators for different devices, so it might be helpful to
introduce something like:

pci = [ '08:00.0,backend=vpci', '09:00.0,backend=xenpt', '0a:00.0,backend=qemu', ... ]

For the time being Arm will require backend=vpci for all the passed
through devices, but I wouldn't rule out this changing in the future.

> Limitation:
> * Only one PCI device tree node is supported as of now.
> 
> BAR value and IOMEM mapping:
> 
> Linux guest will do the PCI enumeration based on the area reserved
> for ECAM and IOMEM ranges in the VPCI device tree node. Once PCI
> device is assigned to the guest, XEN will map the guest PCI IOMEM
> region to the real physical IOMEM region only for the assigned
> devices.

PCI IOMEM == BARs? Or are you referring to the ECAM access window?

> As of now we have not modified the existing VPCI code to map the
> guest PCI IOMEM region to the real physical IOMEM region. We used
> the existing guest “iomem” config option to map the region.  For
> example: Guest reserved IOMEM region:  0x04020000 Real physical
> IOMEM region:0x50000000 IOMEM size:128MB iomem config will be:
> iomem = ["0x50000,0x8000@0x4020"]
> 
> There is no need to map the ECAM space as XEN already have access to
> the ECAM space and XEN will trap ECAM accesses from the guest and
> will perform read/write on the VPCI bus.
> 
> IOMEM access will not be trapped and the guest will directly access
> the IOMEM region of the assigned device via stage-2 translation.
> 
> In the same, we mapped the assigned devices IRQ to the guest using
> below config options.  irqs= [ NUMBER, NUMBER, ...]

Are you providing this for the hardware domain also? Or are irqs
fetched from the DT in that case?

> Limitation:
> * Need to avoid the “iomem” and “irq” guest config
>   options and map the IOMEM region and IRQ at the same time when
>   device is assigned to the guest using the “pci” guest config options
>   when xl creates the domain.
> * Emulated BAR values on the VPCI bus should reflect the IOMEM mapped
>   address.

It was my understanding that you would identity map the BAR into the
domU stage-2 translation, and that changes by the guest won't be
allowed.

> * X86 mapping code should be ported on Arm so that the stage-2
>   translation is adapted when the guest is doing a modification of the
>   BAR registers values (to map the address requested by the guest for
>   a specific IOMEM to the address actually contained in the real BAR
>   register of the corresponding device).

I think the above means that you want to allow the guest to change the
position of the BAR in the stage-2 translation _without_ allowing it
to change the position of the BAR in the physical memory map, is that
correct?

Thanks, Roger.

