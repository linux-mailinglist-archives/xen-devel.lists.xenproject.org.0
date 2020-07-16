Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63312222D40
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 22:52:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwArG-0003lw-4f; Thu, 16 Jul 2020 20:51:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CN1r=A3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jwArE-0003lr-Oj
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 20:51:56 +0000
X-Inumbo-ID: 2e1ea8ce-c7a6-11ea-9538-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e1ea8ce-c7a6-11ea-9538-12813bfff9fa;
 Thu, 16 Jul 2020 20:51:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E0A62082F;
 Thu, 16 Jul 2020 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594932713;
 bh=eeIGzqsuVCsDcDosxNRiQ62ktzasYvbSZ6mXibm2gSY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Yexu+DWFZs52gJA14L3YuU2HzfTibvri3F1uA16uDmkm9kHwAHCiFhoMiGQy80O0A
 YZrqO96MH4QMJP9tSMWhT5bXzTkl4qDminXzGBm6wFalSf7n7QKr5Ry8Pz9ZaJUbc5
 DVqcvdTFtDghn9GKW67CMlPb4W0SvCW9zpdqm7Ys=
Date: Thu, 16 Jul 2020 13:51:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
In-Reply-To: <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
Message-ID: <alpine.DEB.2.21.2007161258160.3886@sstabellini-ThinkPad-T480s>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1721092369-1594930123=:3886"
Content-ID: <alpine.DEB.2.21.2007161314040.3886@sstabellini-ThinkPad-T480s>
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
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1721092369-1594930123=:3886
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007161314041.3886@sstabellini-ThinkPad-T480s>

On Thu, 16 Jul 2020, Rahul Singh wrote:
> Hello All,
> 
> Following up on discussion on PCI Passthrough support on ARM that we had at the XEN summit, we are submitting a Review For Comment and a design proposal for PCI passthrough support on ARM. Feel free to give your feedback.
> 
> The followings describe the high-level design proposal of the PCI passthrough support and how the different modules within the system interacts with each other to assign a particular PCI device to the guest.

I think the proposal is good and I only have a couple of thoughts to
share below.


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
> Only Dom0 and Xen will have access to the real PCI bus,​ guest will have a direct access to the assigned device itself​. IOMEM memory will be mapped to the guest ​and interrupt will be redirected to the guest. SMMU has to be configured correctly to have DMA transaction.
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
> * Device tree binding is supported as of now, ACPI is not supported.
> * Need to port the PCI host bridge access code to XEN to access the configuration space (generic one works but lots of platforms will required  some specific code or quirks).
>
> # Discovering PCI devices:
> 
> PCI-PCIe enumeration is a process of detecting devices connected to its host. It is the responsibility of the hardware domain or boot firmware to do the PCI enumeration and configure the BAR, PCI capabilities, and MSI/MSI-X configuration.
> 
> PCI-PCIe enumeration in XEN is not feasible for the configuration part as it would require a lot of code inside Xen which would require a lot of maintenance. Added to this many platforms require some quirks in that part of the PCI code which would greatly improve Xen complexity. Once hardware domain enumerates the device then it will communicate to XEN via the below hypercall.
> 
> #define PHYSDEVOP_pci_device_add        25
> struct physdev_pci_device_add {
>     uint16_t seg;
>     uint8_t bus;
>     uint8_t devfn;
>     uint32_t flags;
>     struct {
>     	uint8_t bus;
>     	uint8_t devfn;
>     } physfn;
>     /*
>     * Optional parameters array.
>     * First element ([0]) is PXM domain associated with the device (if * XEN_PCI_DEV_PXM is set)
>     */
>     uint32_t optarr[XEN_FLEX_ARRAY_DIM];
>     };
> 
> As the hypercall argument has the PCI segment number, XEN will access the PCI config space based on this segment number and find the host-bridge corresponding to this segment number. At this stage host bridge is fully initialized so there will be no issue to access the config space.
> 
> XEN will add the PCI devices in the linked list maintain in XEN using the function pci_add_device(). XEN will be aware of all the PCI devices on the system and all the device will be added to the hardware domain.
> 
> Limitations:
> * When PCI devices are added to XEN, MSI capability is not initialized inside XEN and not supported as of now.
> * ACS capability is disable for ARM as of now as after enabling it devices are not accessible.
> * Dom0Less implementation will require to have the capacity inside Xen to discover the PCI devices (without depending on Dom0 to declare them to Xen).
 
I think it is fine to assume that for dom0less the "firmware" has taken
care of setting up the BARs correctly. Starting with that assumption, it
looks like it should be "easy" to walk the PCI topology in Xen when/if
there is no dom0?


> # Enable the existing x86 virtual PCI support for ARM:
> 
> The existing VPCI support available for X86 is adapted for Arm. When the device is added to XEN via the hyper call “PHYSDEVOP_pci_device_add”, VPCI handler for the config space access is added to the PCI device to emulate the PCI devices.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN so that when guest is trying to access the PCI config space, XEN will trap the access and emulate read/write using the VPCI and not the real PCI hardware.
> 
> Limitation:
> * No handler is register for the MSI configuration.
> * Only legacy interrupt is supported and tested as of now, MSI is not implemented and tested.  
> 
> # Assign the device to the guest:
> 
> Assign the PCI device from the hardware domain to the guest is done using the below guest config option. When xl tool create the domain, PCI devices will be assigned to the guest VPCI bus.
> 	pci=[ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...]
> 
> Guest will be only able to access the assigned devices and see the bridges. Guest will not be able to access or see the devices that are no assigned to him.
> 
> Limitation:
> * As of now all the bridges in the PCI bus are seen by the guest on the VPCI bus.

We need to come up with something similar for dom0less too. It could be
exactly the same thing (a list of BDFs as strings as a device tree
property) or something else if we can come up with a better idea.


> # Emulated PCI device tree node in libxl:
> 
> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
> 
> A new area has been reserved in the arm guest physical map at which the VPCI bus is declared in the device tree (reg and ranges parameters of the node). A trap handler for the PCI ECAM access from guest has been registered at the defined address and redirects requests to the VPCI driver in Xen.
> 
> Limitation:
> * Only one PCI device tree node is supported as of now.

I think vpci="pci_ecam" should be optional: if pci=[ "PCI_SPEC_STRING",
...] is specififed, then vpci="pci_ecam" is implied.

vpci="pci_ecam" is only useful one day in the future when we want to be
able to emulate other non-ecam host bridges. For now we could even skip
it.


> BAR value and IOMEM mapping:
> 
> Linux guest will do the PCI enumeration based on the area reserved for ECAM and IOMEM ranges in the VPCI device tree node. Once PCI	device is assigned to the guest, XEN will map the guest PCI IOMEM region to the real physical IOMEM region only for the assigned devices.
> 
> As of now we have not modified the existing VPCI code to map the guest PCI IOMEM region to the real physical IOMEM region. We used the existing guest “iomem” config option to map the region.
> For example:
> 	Guest reserved IOMEM region:  0x04020000
>     	Real physical IOMEM region:0x50000000
>     	IOMEM size:128MB
>     	iomem config will be:   iomem = ["0x50000,0x8000@0x4020"]
> 
> There is no need to map the ECAM space as XEN already have access to the ECAM space and XEN will trap ECAM accesses from the guest and will perform read/write on the VPCI bus.
> 
> IOMEM access will not be trapped and the guest will directly access the IOMEM region of the assigned device via stage-2 translation.
> 
> In the same, we mapped the assigned devices IRQ to the guest using below config options.
> 	irqs= [ NUMBER, NUMBER, ...]
> 
> Limitation:
> * Need to avoid the “iomem” and “irq” guest config options and map the IOMEM region and IRQ at the same time when device is assigned to the guest using the “pci” guest config options when xl creates the domain.
> * Emulated BAR values on the VPCI bus should reflect the IOMEM mapped address.
> * X86 mapping code should be ported on Arm so that the stage-2 translation is adapted when the guest is doing a modification of the BAR registers values (to map the address requested by the guest for a specific IOMEM to the address actually contained in the real BAR register of the corresponding device).
> 
> # SMMU configuration for guest:
> 
> When assigning PCI devices to a guest, the SMMU configuration should be updated to remove access to the hardware domain memory and add
> configuration to have access to the guest memory with the proper address translation so that the device can do DMA operations from and to the guest memory only.
> 
> # MSI/MSI-X support:
> Not implement and tested as of now.
> 
> # ITS support:
> Not implement and tested as of now.
--8323329-1721092369-1594930123=:3886--

