Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A7260FD29
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 18:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431119.683693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5ov-0006du-2X; Thu, 27 Oct 2022 16:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431119.683693; Thu, 27 Oct 2022 16:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5ou-0006b4-Vj; Thu, 27 Oct 2022 16:33:28 +0000
Received: by outflank-mailman (input) for mailman id 431119;
 Thu, 27 Oct 2022 16:33:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oo5ot-0006ak-Hp
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 16:33:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo5ot-0007Fb-1W; Thu, 27 Oct 2022 16:33:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.29.62]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oo5os-0002aP-MM; Thu, 27 Oct 2022 16:33:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=BhvQCRl6DBL5657TGVv13HCXvgJ4eyODUMfIpHIaJ60=; b=IeaRjM1AV7wyqoXcOALdKhTOes
	PCni/teNZITvwZ6kyRFvICvDPxuU/lvxiL9aH/UgU6BFORb8NkaZseGcId3x24i7pkdOF+ASaYImx
	e/pFrzSL0UqyqNGRrKTXh5ZfJlURaTht614SIMjr+FVkRSE6q6qCzMyEBRkOqlIOKVYg=;
Message-ID: <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
Date: Thu, 27 Oct 2022 17:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/10/2022 17:08, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 26 Oct 2022, at 8:48 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 26/10/2022 15:33, Rahul Singh wrote:
>>> Hi Julien,
>>
>> Hi Rahul,
>>
>>>> On 26 Oct 2022, at 2:36 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 26/10/2022 14:17, Rahul Singh wrote:
>>>>> Hi All,
>>>>
>>>> Hi Rahul,
>>>>
>>>>> At Arm, we started to implement the POC to support 2 levels of page tables/nested translation in SMMUv3.
>>>>> To support nested translation for guest OS Xen needs to expose the virtual IOMMU. If we passthrough the
>>>>> device to the guest that is behind an IOMMU and virtual IOMMU is enabled for the guest there is a need to
>>>>> add IOMMU binding for the device in the passthrough node as per [1]. This email is to get an agreement on
>>>>> how to add the IOMMU binding for guest OS.
>>>>> Before I will explain how to add the IOMMU binding let me give a brief overview of how we will add support for virtual
>>>>> IOMMU on Arm. In order to implement virtual IOMMU Xen need SMMUv3 Nested translation support. SMMUv3 hardware
>>>>> supports two stages of translation. Each stage of translation can be independently enabled. An incoming address is logically
>>>>> translated from VA to IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to the output PA. Stage 1 is
>>>>> intended to be used by a software entity( Guest OS) to provide isolation or translation to buffers within the entity, for example,
>>>>> DMA isolation within an OS. Stage 2 is intended to be available in systems supporting the Virtualization Extensions and is
>>>>> intended to virtualize device DMA to guest VM address spaces. When both stage 1 and stage 2 are enabled, the translation
>>>>> configuration is called nesting.
>>>>> Stage 1 translation support is required to provide isolation between different devices within the guest OS. XEN already supports
>>>>> Stage 2 translation but there is no support for Stage 1 translation for guests. We will add support for guests to configure
>>>>> the Stage 1 transition via virtual IOMMU. XEN will emulate the SMMU hardware and exposes the virtual SMMU to the guest.
>>>>> Guest can use the native SMMU driver to configure the stage 1 translation. When the guest configures the SMMU for Stage 1,
>>>>> XEN will trap the access and configure the hardware accordingly.
>>>>> Now back to the question of how we can add the IOMMU binding between the virtual IOMMU and the master devices so that
>>>>> guests can configure the IOMMU correctly. The solution that I am suggesting is as below:
>>>>> For dom0, while handling the DT node(handle_node()) Xen will replace the phandle in the "iommus" property with the virtual
>>>>> IOMMU node phandle.
>>>> Below, you said that each IOMMUs may have a different ID space. So shouldn't we expose one vIOMMU per pIOMMU? If not, how do you expect the user to specify the mapping?
>>> Yes you are right we need to create one vIOMMU per pIOMMU for dom0. This also helps in the ACPI case
>>> where we don’t need to modify the tables to delete the pIOMMU entries and create one vIOMMU.
>>> In this case, no need to replace the phandle as Xen create the vIOMMU with the same pIOMMU
>>> phandle and same base address.
>>> For domU guests one vIOMMU per guest will be created.
>>
>> IIRC, the SMMUv3 is using a ring like the GICv3 ITS. I think we need to be open here because this may end up to be tricky to security support it (we have N guest ring that can write to M host ring).
> 
> If xl want to creates the one vIOMMU per pIOMMU for domU then xl needs to know the below information:
>   -  Find the number of holes in guest memory same as the number of vIOMMU that needs the creation to create the vIOMMU DT nodes. (Think about a big system that has 50+ IOMMUs)
>      Yes, we will create vIOMMU for only those devices that are assigned to guests but still we need to find the hole in guest memory.

I agree this is a problem with the one vIOMMU per pIOMMU.

>   -  Find the pIOMMU attached to the assigned device and create mapping b/w vIOMMU -> pIOMMU to register the MMIO handler.
>      Either we need to modify the current hyerpcall or need to implement a new hypercall to find this information.

Adding hypercalls are is not a big problem.

> 
> Because of the above reason I thought of creating one vIOMMU for domU. Yes you are right this may end up to be tricky to security support
> but as per my understanding one vIOMMU  per domU guest is easy to implement and simple to handle as compared to one vIOMMU per pIOMMU

I am not sure about this. My gut feeling is the code in Xen will end up 
to be tricky (there more that Xen doesn't support preemption). So I 
think we will trade-off complexity in Xen over simplicity in libxl.

That said, I haven't looked deeper in the code. So I may be wrong. I 
will need to see the code to confirm.

>>>>> For domU guests, when passthrough the device to the guest as per [2],  add the below property in the partial device tree
>>>>> node that is required to describe the generic device tree binding for IOMMUs and their master(s)
>>>>> "iommus = < &magic_phandle 0xvMasterID>
>>>>> 	• magic_phandle will be the phandle ( vIOMMU phandle in xl)  that will be documented so that the user can set that in partial DT node (0xfdea).
>>>>
>>>> Does this mean only one IOMMU will be supported in the guest?
>>> Yes.
>>>>
>>>>> 	• vMasterID will be the virtual master ID that the user will provide.
>>>>> The partial device tree will look like this:
>>>>> /dts-v1/;
>>>>>   / {
>>>>>      /* #*cells are here to keep DTC happy */
>>>>>      #address-cells = <2>;
>>>>>      #size-cells = <2>;
>>>>>        aliases {
>>>>>          net = &mac0;
>>>>>      };
>>>>>        passthrough {
>>>>>          compatible = "simple-bus";
>>>>>          ranges;
>>>>>          #address-cells = <2>;
>>>>>          #size-cells = <2>;
>>>>>          mac0: ethernet@10000000 {
>>>>>              compatible = "calxeda,hb-xgmac";
>>>>>              reg = <0 0x10000000 0 0x1000>;
>>>>>              interrupts = <0 80 4  0 81 4  0 82 4>;
>>>>>             iommus = <0xfdea 0x01>;
>>>>>          };
>>>>>      };
>>>>> };
>>>>>   In xl.cfg we need to define a new option to inform Xen about vMasterId to pMasterId mapping and to which IOMMU device this
>>>>> the master device is connected so that Xen can configure the right IOMMU. This is required if the system has devices that have
>>>>> the same master ID but behind a different IOMMU.
>>>>
>>>> In xl.cfg, we already pass the device-tree node path to passthrough. So Xen should already have all the information about the IOMMU and Master-ID. So it doesn't seem necessary for Device-Tree.
>>>>
>>>> For ACPI, I would have expected the information to be found in the IOREQ.
>>>>
>>>> So can you add more context why this is necessary for everyone?
>>> We have information for IOMMU and Master-ID but we don’t have information for linking vMaster-ID to pMaster-ID.
>>
>> I am confused. Below, you are making the virtual master ID optional. So shouldn't this be mandatory if you really need the mapping with the virtual ID?
> 
> vMasterID is optional if user knows pMasterID is unique on the system. But if pMasterId is not unique then user needs to provide the vMasterID.

So the expectation is the user will be able to know that the pMasterID 
is uniq. This may be easy with a couple of SMMUs, but if you have 50+ 
(as suggested above). This will become a pain on larger system.

IHMO, it would be much better if we can detect that in libxl (see below).

> 
>>
>>> The device tree node will be used to assign the device to the guest and configure the Stage-2 translation. Guest will use the
>>> vMaster-ID to configure the vIOMMU during boot. Xen needs information to link vMaster-ID to pMaster-ID to configure
>>> the corresponding pIOMMU. As I mention we need vMaster-ID in case a system could have 2 identical Master-ID but
>>> each one connected to a different SMMU and assigned to the guest.
>>
>> I am afraid I still don't understand why this is a requirement. Libxl could have enough knowledge (which will be necessarry for the PCI case) to know the IOMMU and pMasterID associated with a device.
>>
>> So libxl could allocate the vMasterID, tell Xen the corresponding mapping and update the device-tree.
>>
>> IOW, it doesn't seem to be necessary to involve the user in the process here.
> 
> Yes, libxl could allocate the vMasterID but there is no way we can find the link b/w vMasterID created to pMasterID from dtdev.
> 
> What I understand from the code is that there is no link between the passthrough node and dtdev config option. The passthrough
> node is directly copied to guest DT without any modification. Dtdev is used to add and assign the device to IOMMU.
> 
> Let's take an example if the user wants to assign two devices to the guest via passthrough node.
> 
> /dts-v1/;
> 
> / {
>     /* #*cells are here to keep DTC happy */
>     #address-cells = <2>;
>     #size-cells = <2>;
> 
>     aliases {
>         net = &mac0;
>     };
> 
>     passthrough {
>         compatible = "simple-bus";
>         ranges;
>         #address-cells = <2>;
>         #size-cells = <2>;
> 
>         mac0: ethernet@10000000 {
>             compatible = "calxeda,hb-xgmac";
>             reg = <0 0x10000000 0 0x1000>;
>             interrupts = <0 80 4  0 81 4  0 82 4>;
>         };
> 
>       mac1: ethernet@20000000 {
>             compatible = “r8169";
>             reg = <0 0x10000000 0 0x1000>;
>             interrupts = <0 80 4  0 81 4  0 82 4>;
>         };
> 
>     };
> };
> 
> dtdev = [ "/soc/ethernet@10000000”, “/soc/ethernet@f2000000” ]
> 
> There is no link which dtdev entry belongs to which node. Therefor there is no way to link the vMasterID created to pMasterID.

I agree there is no link today. But we could add a property in the 
partial device-tree to mention which physical device is associated.

With that, I think all, the complexity is moved to libxl and it will be 
easier for the user to use vIOMMU.

[...]

>>>>>   iommu_devid_map = [ “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS” , “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS”]
>>>>> 	• PMASTER_ID is the physical master ID of the device from the physical DT.
>>>>> 	• VMASTER_ID is the virtual master Id that the user will configure in the partial device tree.
>>>>> 	• IOMMU_BASE_ADDRESS is the base address of the physical IOMMU device to which this device is connected.
>>>>
>>>> Below you give an example for Platform device. How would that fit in the context of PCI passthrough?
>>> In PCI passthrough case, xl will create the "iommu-map" property in vpci host bridge node with phandle to vIOMMU node.
>>> vSMMUv3 node will be created in xl.
>>
>> This means that libxl will need to know the associated pMasterID to a PCI device. So, I don't understand why you can't do the same for platform devices.
> 
> For the PCI passthrough case, we don’t need to provide the MasterID to create "iommu-map” property as for
> PCI device MasterID is RID ( BDF ). For non-PCI devices, MasterID is required to create “iommus” property.

Are you talking about the physical MasterID or virtual one? If physical 
MasterID then I don't think this is always the RID (see [1]). But for 
the virtual Master ID we could make this association.

This still means that in some way the toolstack need to let Xen know (or 
the other way around) the mapping between the pMasterID and vMasterID.

[1] Documentation/devicetree/bindings/pci/pci-iommu.txt.

Cheers,

-- 
Julien Grall

