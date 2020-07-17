Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01D223BBE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 14:56:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwPu2-00069V-8w; Fri, 17 Jul 2020 12:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwPu0-00069K-TA
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 12:55:48 +0000
X-Inumbo-ID: d4e27358-c82c-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4e27358-c82c-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 12:55:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 728EAAD17;
 Fri, 17 Jul 2020 12:55:50 +0000 (UTC)
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Rahul Singh <Rahul.Singh@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <alpine.DEB.2.21.2007161258160.3886@sstabellini-ThinkPad-T480s>
 <BB4645DF-A040-4912-AC35-C98105917FD5@arm.com>
 <f69f86dc-7a8c-4c25-c059-0e391de51d7f@epam.com>
 <E4755A88-798C-42FF-8DAD-DC4FD3C7B571@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0047a1f0-0a0f-f11d-ddba-3fdb877c3eb4@suse.com>
Date: Fri, 17 Jul 2020 14:55:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <E4755A88-798C-42FF-8DAD-DC4FD3C7B571@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.07.2020 14:46, Rahul Singh wrote:
> Sorry for previous mail formatting issue. Replying again so that any comment history should not missed.

I'm sorry, but from a plain text view I cannot determine what parts
your replies were (in fact all nesting of prior replies is lost).
Please can you arrange for suitable reply quoting in your mail
client, using plain text mails? (Leaving all prior text in place
below, for you to see what it is that at least some people got to
see.)

Jan

> On 17 Jul 2020, at 8:41 am, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com<mailto:Oleksandr_Andrushchenko@epam.com>> wrote:
> 
> 
> On 7/17/20 9:53 AM, Bertrand Marquis wrote:
> 
> On 16 Jul 2020, at 22:51, Stefano Stabellini <sstabellini@kernel.org<mailto:sstabellini@kernel.org>> wrote:
> 
> On Thu, 16 Jul 2020, Rahul Singh wrote:
> Hello All,
> 
> Following up on discussion on PCI Passthrough support on ARM that we had at the XEN summit, we are submitting a Review For Comment and a design proposal for PCI passthrough support on ARM. Feel free to give your feedback.
> 
> The followings describe the high-level design proposal of the PCI passthrough support and how the different modules within the system interacts with each other to assign a particular PCI device to the guest.
> I think the proposal is good and I only have a couple of thoughts to
> share below.
> 
> 
> # Title:
> 
> PCI devices passthrough on Arm design proposal
> 
> # Problem statement:
> 
> On ARM there in no support to assign a PCI device to a guest. PCI device passthrough capability allows guests to have full access to some PCI devices. PCI device passthrough allows PCI devices to appear and behave as if they were physically attached to the guest operating system and provide full isolation of the PCI devices.
> 
> Goal of this work is to also support Dom0Less configuration so the PCI backend/frontend drivers used on x86 shall not be used on Arm. It will use the existing VPCI concept from X86 and implement the virtual PCI bus through IO emulation​ such that only assigned devices are visible​ to the guest and guest can use the standard PCI driver.
> 
> Only Dom0 and Xen will have access to the real PCI bus,
> 
> So, in this case how is the access serialization going to work?
> 
> I mean that if both Xen and Dom0 are about to access the bus at the same time?
> 
> There was a discussion on the same before [1] and IMO it was not decided on
> 
> how to deal with that.
> 
> DOM0 also access the real PCI hardware via MMIO config space trap in XEN. We will take care of access the config space lock in XEN.
> 
> ​ guest will have a direct access to the assigned device itself​. IOMEM memory will be mapped to the guest ​and interrupt will be redirected to the guest. SMMU has to be configured correctly to have DMA transaction.
> 
> ## Current state: Draft version
> 
> # Proposer(s): Rahul Singh, Bertrand Marquis
> 
> # Proposal:
> 
> This section will describe the different subsystem to support the PCI device passthrough and how these subsystems interact with each other to assign a device to the guest.
> 
> # PCI Terminology:
> 
> Host Bridge: Host bridge allows the PCI devices to talk to the rest of the computer.
> ECAM: ECAM (Enhanced Configuration Access Mechanism) is a mechanism developed to allow PCIe to access configuration space. The space available per function is 4KB.
> 
> # Discovering PCI Host Bridge in XEN:
> 
> In order to support the PCI passthrough XEN should be aware of all the PCI host bridges available on the system and should be able to access the PCI configuration space. ECAM configuration access is supported as of now. XEN during boot will read the PCI device tree node “reg” property and will map the ECAM space to the XEN memory using the “ioremap_nocache ()” function.
> 
> If there are more than one segment on the system, XEN will read the “linux, pci-domain” property from the device tree node and configure  the host bridge segment number accordingly. All the PCI device tree nodes should have the “linux,pci-domain” property so that there will be no conflicts. During hardware domain boot Linux will also use the same “linux,pci-domain” property and assign the domain number to the host bridge.
> 
> When Dom0 tries to access the PCI config space of the device, XEN will find the corresponding host bridge based on segment number and access the corresponding config space assigned to that bridge.
> 
> Limitation:
> * Only PCI ECAM configuration space access is supported.
> 
> This is really the limitation which we have to think of now as there are lots of
> 
> HW w/o ECAM support and not providing a way to use PCI(e) on those boards
> 
> would render them useless wrt PCI. I don't suggest to have some real code for
> 
> that, but I would suggest we design some interfaces from day 0.
> 
> At the same time I do understand that supporting non-ECAM bridges is a pain
> 
> Adding any type of host bridge is supported, we did put the ECAM specific code in an identifed source file so that other types can be implemented. As of now we have implemented the ECAM support and we are implementing right now support for N1SDP which requires specific quirks which will be done in a separate source file.
> 
> 
> * Device tree binding is supported as of now, ACPI is not supported.
> * Need to port the PCI host bridge access code to XEN to access the configuration space (generic one works but lots of platforms will required some specific code or quirks).
> 
> # Discovering PCI devices:
> 
> PCI-PCIe enumeration is a process of detecting devices connected to its host. It is the responsibility of the hardware domain or boot firmware to do the PCI enumeration and configure
> Great, so we assume here that the bootloader can do the enumeration and configuration...
>  the BAR, PCI capabilities, and MSI/MSI-X configuration.
> 
> PCI-PCIe enumeration in XEN is not feasible for the configuration part as it would require a lot of code inside Xen which would require a lot of maintenance. Added to this many platforms require some quirks in that part of the PCI code which would greatly improve Xen complexity. Once hardware domain enumerates the device then it will communicate to XEN via the below hypercall.
> 
> #define PHYSDEVOP_pci_device_add        25
> struct physdev_pci_device_add {
>    uint16_t seg;
>    uint8_t bus;
>    uint8_t devfn;
>    uint32_t flags;
>    struct {
>     uint8_t bus;
>     uint8_t devfn;
>    } physfn;
>    /*
>    * Optional parameters array.
>    * First element ([0]) is PXM domain associated with the device (if * XEN_PCI_DEV_PXM is set)
>    */
>    uint32_t optarr[XEN_FLEX_ARRAY_DIM];
>    };
> 
> As the hypercall argument has the PCI segment number, XEN will access the PCI config space based on this segment number and find the host-bridge corresponding to this segment number. At this stage host bridge is fully initialized so there will be no issue to access the config space.
> 
> XEN will add the PCI devices in the linked list maintain in XEN using the function pci_add_device(). XEN will be aware of all the PCI devices on the system and all the device will be added to the hardware domain.
> 
> Limitations:
> * When PCI devices are added to XEN, MSI capability is not initialized inside XEN and not supported as of now.
> * ACS capability is disable for ARM as of now as after enabling it devices are not accessible.
> * Dom0Less implementation will require to have the capacity inside Xen to discover the PCI devices (without depending on Dom0 to declare them to Xen).
> I think it is fine to assume that for dom0less the "firmware" has taken
> care of setting up the BARs correctly. Starting with that assumption, it
> looks like it should be "easy" to walk the PCI topology in Xen when/if
> there is no dom0?
> Yes as we discussed during the design session, we currently think that it is the way to go.
> We are for now relying on Dom0 to get the list of PCI devices but this is definitely the strategy we would like to use to have Dom0 support.
> If this is working well, I even think we could get rid of the hypercall all together.
> ...and this is the same way of configuring if enumeration happens in the bootloader?
> 
> I do support the idea we go away from PHYSDEVOP_pci_device_add, but driver domain
> 
> just signals Xen that the enumeration is done and Xen can traverse the bus by that time.
> 
> Please also note, that there are actually 3 cases possible wrt where the enumeration and
> 
> configuration happens: boot firmware, Dom0, Xen. So, it seems we
> 
> are going to have different approaches for the first two (see my comment above on
> 
> the hypercall use in Dom0). So, walking the bus ourselves in Xen seems to be good for all
> 
> the use-cases above
> 
> 
> In that case we may have to implement a new hypercall to inform XEN that enumeration is complete and now scan the devices. We could tell Xen to delay its enumeration until this hypercall is called using a xen command line parameter. This way when this is not required because the firmware did the enumeration, we can properly support Dom0Less.
> 
> 
> 
> 
> # Enable the existing x86 virtual PCI support for ARM:
> 
> The existing VPCI support available for X86 is adapted for Arm. When the device is added to XEN via the hyper call “PHYSDEVOP_pci_device_add”, VPCI handler for the config space access is added to the PCI device to emulate the PCI devices.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN so that when guest is trying to access the PCI config space, XEN will trap the access and emulate read/write using the VPCI and not the real PCI hardware.
> Just to make it clear: Dom0 still access the bus directly w/o emulation, right?
> 
> No.Once Xen has done his PCI enumeration (either on boot or after an hypercall from the hardware domain), only Xen will access the physical PCI bus, everybody else will go through VPCI.
> 
> 
> Limitation:
> * No handler is register for the MSI configuration.
> * Only legacy interrupt is supported and tested as of now, MSI is not implemented and tested.
> 
> # Assign the device to the guest:
> 
> Assign the PCI device from the hardware domain to the guest is done using the below guest config option. When xl tool create the domain, PCI devices will be assigned to the guest VPCI bus.
> pci=[ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...]
> 
> Guest will be only able to access the assigned devices and see the bridges. Guest will not be able to access or see the devices that are no assigned to him.
> Does this mean that we do not need to configure the bridges as those are exposed to the guest implicitly?
> 
> Limitation:
> * As of now all the bridges in the PCI bus are seen by the guest on the VPCI bus.
> 
> So, what happens if a guest tries to access the bridge that doesn't have the assigned
> 
> PCI device? E.g. we pass PCIe_dev0 which is behind Bridge0 and the guest also sees
> 
> Bridge1 and tries to access devices behind it during the enumeration.
> 
> Could you please clarify?
> 
> The bridges are only accessible in read-only and cannot be modified. Even though a guest would see the bridge, the VPCI will only show the assigned devices behind it. If there is no device behind that bridge assigned to the guest, the guest will see an empty bus behind that bridge.
> 
> 
> We need to come up with something similar for dom0less too. It could be
> exactly the same thing (a list of BDFs as strings as a device tree
> property) or something else if we can come up with a better idea.
> Fully agree.
> Maybe a tree topology could allow more possibilities (like giving BAR values) in the future.
> 
> # Emulated PCI device tree node in libxl:
> 
> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
> 
> A new area has been reserved in the arm guest physical map at which the VPCI bus is declared in the device tree (reg and ranges parameters of the node). A trap handler for the PCI ECAM access from guest has been registered at the defined address and redirects requests to the VPCI driver in Xen.
> 
> Limitation:
> * Only one PCI device tree node is supported as of now.
> I think vpci="pci_ecam" should be optional: if pci=[ "PCI_SPEC_STRING",
> ...] is specififed, then vpci="pci_ecam" is implied.
> 
> vpci="pci_ecam" is only useful one day in the future when we want to be
> able to emulate other non-ecam host bridges. For now we could even skip
> it.
> This would create a problem if xl is used to add a PCI device as we need the PCI node to be in the DTB when the guest is created.
> I agree this is not needed but removing it might create more complexity in the code.
> 
> I would suggest we have it from day 0 as there are plenty of HW available which is not ECAM.
> 
> Having vpci allows other bridges to be supported
> 
> Yes we agree.
> 
> 
> 
> Bertrand
> 
> 
> BAR value and IOMEM mapping:
> 
> Linux guest will do the PCI enumeration based on the area reserved for ECAM and IOMEM ranges in the VPCI device tree node. Once PCI device is assigned to the guest, XEN will map the guest PCI IOMEM region to the real physical IOMEM region only for the assigned devices.
> 
> As of now we have not modified the existing VPCI code to map the guest PCI IOMEM region to the real physical IOMEM region. We used the existing guest “iomem” config option to map the region.
> For example:
> Guest reserved IOMEM region:  0x04020000
>     Real physical IOMEM region:0x50000000
>     IOMEM size:128MB
>     iomem config will be:   iomem = ["0x50000,0x8000@0x4020"]
> 
> There is no need to map the ECAM space as XEN already have access to the ECAM space and XEN will trap ECAM accesses from the guest and will perform read/write on the VPCI bus.
> 
> IOMEM access will not be trapped and the guest will directly access the IOMEM region of the assigned device via stage-2 translation.
> 
> In the same, we mapped the assigned devices IRQ to the guest using below config options.
> irqs= [ NUMBER, NUMBER, ...]
> 
> Limitation:
> * Need to avoid the “iomem” and “irq” guest config options and map the IOMEM region and IRQ at the same time when device is assigned to the guest using the “pci” guest config options when xl creates the domain.
> * Emulated BAR values on the VPCI bus should reflect the IOMEM mapped address.
> * X86 mapping code should be ported on Arm so that the stage-2 translation is adapted when the guest is doing a modification of the BAR registers values (to map the address requested by the guest for a specific IOMEM to the address actually contained in the real BAR register of the corresponding device).
> 
> # SMMU configuration for guest:
> 
> When assigning PCI devices to a guest, the SMMU configuration should be updated to remove access to the hardware domain memory
> 
> So, as the hardware domain still has access to the PCI configuration space, we
> 
> can potentially have a condition when Dom0 accesses the device. AFAIU, if we have
> 
> pci front/back then before assigning the device to the guest we unbind it from the
> 
> real driver and bind to the back. Are we going to do something similar here?
> 
> Yes we have to unbind the driver from the hardware domain before assigning the device to the guest. Also as soon as Xen has done his PCI enumeration (either on boot or after an hypercall from the hardware domain), only Xen will access the physical PCI bus, everybody else will go through VPCI.
> 
> - Rahul
> 
> 
> 
> Thank you,
> 
> Oleksandr
> 
>  and add
> configuration to have access to the guest memory with the proper address translation so that the device can do DMA operations from and to the guest memory only.
> 
> # MSI/MSI-X support:
> Not implement and tested as of now.
> 
> # ITS support:
> Not implement and tested as of now.
> [1] https://lists.xen.org/archives/html/xen-devel/2017-05/msg02674.html
> 


