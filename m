Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48078223D4E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQlR-0003a3-OH; Fri, 17 Jul 2020 13:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwQlQ-0003Zx-Ve
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:51:01 +0000
X-Inumbo-ID: 8ba8d292-c834-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ba8d292-c834-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sFZrVzBeNdUKd7NJErLX1N+nGCzoAYi9P6utJIfvTME=; b=mPMZdRBdfLGR9xxo68Vv0N2weM
 T/gNah/P8E2WzlWqxH9yoDCk32r9H1HzN6OulxXCH9OJ8wp6rFFo5O01NmQTQqOmLt7cVKsUIyQgU
 28Z7JiBBoy9zYvdrm5curf74fvjSglOqmKfX8jEDmTPBKidI5VnDWf4h00Bv/fYyco1o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwQlO-000716-7n; Fri, 17 Jul 2020 13:50:58 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwQlN-0007gG-QT; Fri, 17 Jul 2020 13:50:58 +0000
Subject: Re: PCI devices passthrough on Arm design proposal
From: Julien Grall <julien@xen.org>
To: Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
Message-ID: <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
Date: Fri, 17 Jul 2020 14:50:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(Resending to the correct ML)

On 17/07/2020 14:23, Julien Grall wrote:
> 
> 
> On 16/07/2020 18:02, Rahul Singh wrote:
>> Hello All,
> 
> Hi,
> 
>> Following up on discussion on PCI Passthrough support on ARM that we 
>> had at the XEN summit, we are submitting a Review For Comment and a 
>> design proposal for PCI passthrough support on ARM. Feel free to give 
>> your feedback.
>>
>> The followings describe the high-level design proposal of the PCI 
>> passthrough support and how the different modules within the system 
>> interacts with each other to assign a particular PCI device to the guest.
> 
> There was an attempt a few years ago to get a design document for PCI 
> passthrough (see [1]). I would suggest to have a look at the thread as I 
> think it would help to have an overview of all the components (e.g MSI 
> controllers...) even if they will not be implemented at the beginning.
> 
>>
>> # Title:
>>
>> PCI devices passthrough on Arm design proposal
>>
>> # Problem statement:
>>
>> On ARM there in no support to assign a PCI device to a guest. PCI 
>> device passthrough capability allows guests to have full access to 
>> some PCI devices. PCI device passthrough allows PCI devices to appear 
>> and behave as if they were physically attached to the guest operating 
>> system and provide full isolation of the PCI devices.
>>
>> Goal of this work is to also support Dom0Less configuration so the PCI 
>> backend/frontend drivers used on x86 shall not be used on Arm. It will 
>> use the existing VPCI concept from X86 and implement the virtual PCI 
>> bus through IO emulation​ such that only assigned devices are visible​ 
>> to the guest and guest can use the standard PCI driver.
>>
>> Only Dom0 and Xen will have access to the real PCI bus,​ guest will 
>> have a direct access to the assigned device itself​. IOMEM memory will 
>> be mapped to the guest ​and interrupt will be redirected to the guest. 
>> SMMU has to be configured correctly to have DMA transaction.
>>
>> ## Current state: Draft version
>>
>> # Proposer(s): Rahul Singh, Bertrand Marquis
>>
>> # Proposal:
>>
>> This section will describe the different subsystem to support the PCI 
>> device passthrough and how these subsystems interact with each other 
>> to assign a device to the guest.
>>
>> # PCI Terminology:
>>
>> Host Bridge: Host bridge allows the PCI devices to talk to the rest of 
>> the computer.
>> ECAM: ECAM (Enhanced Configuration Access Mechanism) is a mechanism 
>> developed to allow PCIe to access configuration space. The space 
>> available per function is 4KB.
>>
>> # Discovering PCI Host Bridge in XEN:
>>
>> In order to support the PCI passthrough XEN should be aware of all the 
>> PCI host bridges available on the system and should be able to access 
>> the PCI configuration space. ECAM configuration access is supported as 
>> of now. XEN during boot will read the PCI device tree node “reg” 
>> property and will map the ECAM space to the XEN memory using the 
>> “ioremap_nocache ()” function.
>>
>> If there are more than one segment on the system, XEN will read the 
>> “linux, pci-domain” property from the device tree node and configure  
>> the host bridge segment number accordingly. All the PCI device tree 
>> nodes should have the “linux,pci-domain” property so that there will 
>> be no conflicts. During hardware domain boot Linux will also use the 
>> same “linux,pci-domain” property and assign the domain number to the 
>> host bridge.
> 
> AFAICT, "linux,pci-domain" is not a mandatory option and mostly tie to 
> Linux. What would happen with other OS?
> 
> But I would rather avoid trying to mandate a user to modifying his/her 
> device-tree in order to support PCI passthrough. It would be better to 
> consider Xen to assign the number if it is not present.
> 
>>
>> When Dom0 tries to access the PCI config space of the device, XEN will 
>> find the corresponding host bridge based on segment number and access 
>> the corresponding config space assigned to that bridge.
>>
>> Limitation:
>> * Only PCI ECAM configuration space access is supported.
>> * Device tree binding is supported as of now, ACPI is not supported.
> 
> We want to differentiate the high-level design from the actual 
> implementation. While you may not yet implement ACPI, we still need to 
> keep it in mind to avoid incompatibilities in long term.
> 
>> * Need to port the PCI host bridge access code to XEN to access the 
>> configuration space (generic one works but lots of platforms will 
>> required  some specific code or quirks).
>>
>> # Discovering PCI devices:
>>
>> PCI-PCIe enumeration is a process of detecting devices connected to 
>> its host. It is the responsibility of the hardware domain or boot 
>> firmware to do the PCI enumeration and configure the BAR, PCI 
>> capabilities, and MSI/MSI-X configuration.
>>
>> PCI-PCIe enumeration in XEN is not feasible for the configuration part 
>> as it would require a lot of code inside Xen which would require a lot 
>> of maintenance. Added to this many platforms require some quirks in 
>> that part of the PCI code which would greatly improve Xen complexity. 
>> Once hardware domain enumerates the device then it will communicate to 
>> XEN via the below hypercall.
>>
>> #define PHYSDEVOP_pci_device_add        25
>> struct physdev_pci_device_add {
>>      uint16_t seg;
>>      uint8_t bus;
>>      uint8_t devfn;
>>      uint32_t flags;
>>      struct {
>>          uint8_t bus;
>>          uint8_t devfn;
>>      } physfn;
>>      /*
>>      * Optional parameters array.
>>      * First element ([0]) is PXM domain associated with the device 
>> (if * XEN_PCI_DEV_PXM is set)
>>      */
>>      uint32_t optarr[XEN_FLEX_ARRAY_DIM];
>>      };
>>
>> As the hypercall argument has the PCI segment number, XEN will access 
>> the PCI config space based on this segment number and find the 
>> host-bridge corresponding to this segment number. At this stage host 
>> bridge is fully initialized so there will be no issue to access the 
>> config space.
>>
>> XEN will add the PCI devices in the linked list maintain in XEN using 
>> the function pci_add_device(). XEN will be aware of all the PCI 
>> devices on the system and all the device will be added to the hardware 
>> domain.
> I understand this what x86 does. However, may I ask why we would want it 
> for Arm?
> 
>>
>> Limitations:
>> * When PCI devices are added to XEN, MSI capability is not initialized 
>> inside XEN and not supported as of now.
>> * ACS capability is disable for ARM as of now as after enabling it 
>> devices are not accessible.
> 
> I am not sure to understand this. Can you expand?
> 
>> * Dom0Less implementation will require to have the capacity inside Xen 
>> to discover the PCI devices (without depending on Dom0 to declare them 
>> to Xen).
>>
>> # Enable the existing x86 virtual PCI support for ARM:
>>
>> The existing VPCI support available for X86 is adapted for Arm. When 
>> the device is added to XEN via the hyper call 
>> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space access 
>> is added to the PCI device to emulate the PCI devices.
>>
>> A MMIO trap handler for the PCI ECAM space is registered in XEN so 
>> that when guest is trying to access the PCI config space, XEN will 
>> trap the access and emulate read/write using the VPCI and not the real 
>> PCI hardware.
>>
>> Limitation:
>> * No handler is register for the MSI configuration.
>> * Only legacy interrupt is supported and tested as of now, MSI is not 
>> implemented and tested.
> 
> IIRC, legacy interrupt may be shared between two PCI devices. How do you 
> plan to handle this on Arm?
> 
>>
>> # Assign the device to the guest:
>>
>> Assign the PCI device from the hardware domain to the guest is done 
>> using the below guest config option. When xl tool create the domain, 
>> PCI devices will be assigned to the guest VPCI bus.
> 
> Above, you suggest that device will be assigned to the hardware domain 
> at boot. I am assuming this also means that all the interrupts/MMIOs 
> will be routed/mapped, is that correct?
> 
> If so, can you provide a rough sketch how assign/deassign will work?
> 
>>     pci=[ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...]
>>
>> Guest will be only able to access the assigned devices and see the 
>> bridges. Guest will not be able to access or see the devices that are 
>> no assigned to him.
>>
>> Limitation:
>> * As of now all the bridges in the PCI bus are seen by the guest on 
>> the VPCI bus.
> 
> Why do you want to expose all the bridges to a guest? Does this mean 
> that the BDF should always match between the host and the guest?
> 
>>
>> # Emulated PCI device tree node in libxl:
>>
>> Libxl is creating a virtual PCI device tree node in the device tree to 
>> enable the guest OS to discover the virtual PCI during guest boot. We 
>> introduced the new config option [vpci="pci_ecam"] for guests. When 
>> this config option is enabled in a guest configuration, a PCI device 
>> tree node will be created in the guest device tree.
>>
>> A new area has been reserved in the arm guest physical map at which 
>> the VPCI bus is declared in the device tree (reg and ranges parameters 
>> of the node). A trap handler for the PCI ECAM access from guest has 
>> been registered at the defined address and redirects requests to the 
>> VPCI driver in Xen.
>>
>> Limitation:
>> * Only one PCI device tree node is supported as of now.
>>
>> BAR value and IOMEM mapping:
>>
>> Linux guest will do the PCI enumeration based on the area reserved for 
>> ECAM and IOMEM ranges in the VPCI device tree node. Once PCI    device 
>> is assigned to the guest, XEN will map the guest PCI IOMEM region to 
>> the real physical IOMEM region only for the assigned devices.
>>
>> As of now we have not modified the existing VPCI code to map the guest 
>> PCI IOMEM region to the real physical IOMEM region. We used the 
>> existing guest “iomem” config option to map the region.
>> For example:
>>     Guest reserved IOMEM region:  0x04020000
>>          Real physical IOMEM region:0x50000000
>>          IOMEM size:128MB
>>          iomem config will be:   iomem = ["0x50000,0x8000@0x4020"]
>>
>> There is no need to map the ECAM space as XEN already have access to 
>> the ECAM space and XEN will trap ECAM accesses from the guest and will 
>> perform read/write on the VPCI bus.
>>
>> IOMEM access will not be trapped and the guest will directly access 
>> the IOMEM region of the assigned device via stage-2 translation.
>>
>> In the same, we mapped the assigned devices IRQ to the guest using 
>> below config options.
>>     irqs= [ NUMBER, NUMBER, ...]
>>
>> Limitation:
>> * Need to avoid the “iomem” and “irq” guest config options and map the 
>> IOMEM region and IRQ at the same time when device is assigned to the 
>> guest using the “pci” guest config options when xl creates the domain.
>> * Emulated BAR values on the VPCI bus should reflect the IOMEM mapped 
>> address.
>> * X86 mapping code should be ported on Arm so that the stage-2 
>> translation is adapted when the guest is doing a modification of the 
>> BAR registers values (to map the address requested by the guest for a 
>> specific IOMEM to the address actually contained in the real BAR 
>> register of the corresponding device).
>>
>> # SMMU configuration for guest:
>>
>> When assigning PCI devices to a guest, the SMMU configuration should 
>> be updated to remove access to the hardware domain memory and add
>> configuration to have access to the guest memory with the proper 
>> address translation so that the device can do DMA operations from and 
>> to the guest memory only.
> 
> There are a few more questions to answer here:
>     - When a guest is destroyed, who will be the owner of the PCI 
> devices? Depending on the answer, how do you make sure the device is 
> quiescent?
>     - Is there any memory access that can bypassed the IOMMU (e.g 
> doorbell)?
> 
> Cheers,
> 
> [1] 
> https://lists.xenproject.org/archives/html/xen-devel/2017-05/msg02520.html
> 

-- 
Julien Grall

