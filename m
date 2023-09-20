Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431967A7969
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605526.943124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuZI-0000RP-9h; Wed, 20 Sep 2023 10:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605526.943124; Wed, 20 Sep 2023 10:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuZI-0000On-6x; Wed, 20 Sep 2023 10:36:28 +0000
Received: by outflank-mailman (input) for mailman id 605526;
 Wed, 20 Sep 2023 10:36:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiuZH-0000Oh-9e
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:36:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiuZG-00026s-7U; Wed, 20 Sep 2023 10:36:26 +0000
Received: from [15.248.3.0] (helo=[10.24.67.40])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiuZG-0007dm-1Y; Wed, 20 Sep 2023 10:36:26 +0000
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
	bh=E1cElALzOSAynhrVwlD4bnBgBg2KQa/MNHgyIhyMOo0=; b=AwpIRNLnVk7Rm1hAh6KgjSQ+O7
	zDXUWkG5+meu8yPS+N/qjBtZ95xmE3bEwGP2RRX8O1j2uvxaoYmyLsBYfhFT7VqR+GuFKJ2cPNrib
	3pk/Idm5NMxPkjyaHh2JxdTS97RV+cNATvTgeEfMTTfNGB6PL5Vp12HQvd2C4CIklBMI=;
Message-ID: <6bfbf707-cfc8-4cf3-80d0-eeaba0e5865a@xen.org>
Date: Wed, 20 Sep 2023 11:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: arm64: Handling reserved memory nodes
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Leo Yan <leo.yan@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
 <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
 <20230916081541.GA3291774@leoy-huanghe.lan>
 <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>
 <20230920100344.GA71044@leoy-huanghe>
 <6c59477f-d133-4cab-4f4e-afd8e710453c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6c59477f-d133-4cab-4f4e-afd8e710453c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2023 11:31, Michal Orzel wrote:
> Hello,

Hi Michal,

> On 20/09/2023 12:03, Leo Yan wrote:
>>
>>
>> Hi Julien,
>>
>> On Mon, Sep 18, 2023 at 08:26:21PM +0100, Julien Grall wrote:
>>
>> [...]
>>
>>> ... from my understanding reserved-memory are just normal memory that are
>>> set aside for a specific purpose. So Xen has to create a 'memory' node *and*
>>> a 'reserved-memory' region.
>>
>> To be clear, Xen passes the 'reserved-memory' regions as normal memory
>> nodes, see [1].
>>
>>> With that the kernel is supposed to exclude all the 'reserved-memory' from
>>> normal usage unless they have the node contains the property 'reusable'.
>>> This was more clear before the binding was converted to YAML in [1].
>>
>> Linux kernel reserves pages for memory ranges in the 'reserved-memory'
>> node, no matter the 'no-map' property for a range is set or not (see the
>> function memmap_init_reserved_pages() -> __SetPageReserved() in Linux
>> kernel).
>>
>> If a reserved memory range is set with 'no-map' property, the memory
>> region will be not mapped in the kernel's identical address space.  This
>> avoids the data corruption caused between the memory speculative fetch
>> with cachable mapping and the same memory region is used by devices
>> (e.g. for DMA transferring).
>>
>> [...]
>>
>>>> Here the problem is these reserved memory regions are passed as normal
>>>> memory nodes to Dom0 kernel, then Dom0 kernel allocates pages from
>>>> these reserved memory regions.  Apparently, this might lead to conflict,
>>>> e.g. the reserved memory is used by Dom0 kernel, at the meantime the
>>>> memory is used by another purpose (e.g. by MCU in the system).
>>>
>>> See above. I think this is correct to pass both 'memory' and
>>> 'reserved-memory'. Now, it is possible that Xen may not create the
>>> device-tree correctly.
>>
>> Agreed that now Xen wrongly create DT binding for 'reserved-memory'
>> node, more specific, the reserved memory nodes are wrongly passed as
>> normal memory nodes (again, see [1]).
>>
>>> I would suggest to look how Linux is populating the memory and whether it
>>> actually skipped the regions.
>>
>> The Linux kernel reserves the corresponding pages for all reserved
>> memory regions, which means the kernel page management (buddy
>> alrogithm) doesn't allocate these pages at all.
>>
>> With 'no-map' property, the memory range will not be mapped into the
>> kernel identical address space.
>>
>>>> Here I am a bit confused for "Xen doesn't have the capability to know
>>>> the memory attribute".  I looked into the file arch/arm/guest_walk.c,
>>>> IIUC, it walks through the stage 1's page tables for the virtual
>>>> machine and get the permission for the mapping, we also can get to
>>>> know the mapping attribute, right?
>>>
>>> Most of the time, Xen will use the HW to translate the guest virtual address
>>> to an intermediation physical address. Looking at the specification, it
>>> looks like that PAR_EL1 will contain the memory attribute which I didn't
>>> know.
>>>
>>> We would then need to read MAIR_EL1 to find the attribute and also the
>>> memory attribute in the stage-2 to figure out the final memory attribute.
>>
>>> This is feasible but the Xen ABI mandates that region passed to Xen have a
>>> specific memory attributes (see the comment at the top of
>>> xen/include/public/arch-arm.h).
>>
>> If you refer to the comment "All memory which is shared with other
>> entities in the system ... which is mapped as Normal Inner Write-Back
>> Outer Write-Back Inner-Shareable", I don't think it's relevant with
>> current issue.  I will explain in details in below.
>>
>>> Anyway, in your case, Linux is using the buffer is on the stack. So the
>>> region must have been mapped with the proper attribute.
>>
>> I think you may misunderstand the issue.  I would like to divide the
>> issue into two parts:
>>
>> - The first question is about how to pass reserved memory node from Xen
>>    hypervisor to Dom0 Linux kernel.  Currently, Xen hypervisor coverts
>>    the reserved memory ranges and add them into the normal memory node.
>>
>>    Xen hypervisor should keep the reserved memory node and pass it to
>>    Dom0 Linux kernel.  With this change, the Dom0 kernel will only
>>    allocate pages from normal memory node and the data in these pages
>>    can be shared by Xen hypervisor and Dom0 Linux kernel.
>>
>> - The second question is for memory attribute for the reserved memory
>>    node.  Note, the reserved memory ranges are not necessarily _shared_
>>    between the Xen hypervisor and Dom0 Linux kernel.  I think in most
>>    cases, the reserved memory will be ioremaped by drivers (for stage-1);
>>    and the Xen hypervisor should map P2M with the attribute
>>    p2m_mmio_direct_c, or we can explore a bit based on different
>>    properties, e.g. for 'no-map' memory range, we map P2M with
>>    p2m_mmio_direct_c; for 'reusable' memory range, we map with
>>    attribute 'p2m_ram_rw'.
>>
>> To simplify the discussion, I think we can firstly finalize the fixing
>> for the fist question and hold on the second question.  After we fix
>> the first one, we can come back to think about the second issue.
>>
>>>> Another question for the attribute for MMIO regions. For mapping MMIO
>>>> regions, prepare_dtb_hwdom() sets the attribute 'p2m_mmio_direct_c'
>>>> for the stage 2, but in the Linux kernel the MMIO's attribute can
>>>> be one of below variants:
>>>>
>>>> - ioremap(): device type with nGnRE;
>>>> - ioremap_np(): device type with nGnRnE (strong-ordered);
>>>> - ioremap_wc(): normal non-cachable.
>>>
>>> The stage-2 memory attribute is used to restrict the final memory attribute.
>>> In this case, p2m_mmio_direct_c allows the domain to set pretty much any
>>> memory attribute.
>>
>> Thanks for confirmation.  If so, I think the Xen hypervisor should
>> follow the same attribute to map the reserved regions with attribute
>> p2m_mmio_direct_c.
>>
>>>> If Xen hypervisor can handle these MMIO types in stage 2, then we should
>>>> can use the same way to map stage 2 tables for the reserved memory.  A
>>>> difference for the reserved memory is it can be mapped as normal memory
>>>> with cacheable.
>>>
>>> I am a bit confused. I read this as you think the region is not mapped in
>>> the P2M (aka stage-2 page-tables for Arm). But from the logs you provided,
>>> the regions are already mapped (you have an MFN in hand).
>>
>> You are right.  The reserved memory regions have been mapped in P2M.
>>
>>> So to me the error is most likely in how we create the Device-Tree.
>>
>> Yeah, let's firstly focus on the DT binding for reserved memory nodes.
>>
>>>> The DT binding is something like (I tweaked a bit for readable):
>>>
>>> Just to confirm this is the host device tree, right? If so...
>>
>> Yes.
>>
>>>>      memory@20000000 {
>>>>              #address-cells = <0x02>;
>>>>              #size-cells = <0x02>;
>>>>              device_type = "memory";
>>>>              reg = <0x00 0x20000000 0x00 0xa0000000>,
>>>>                         <0x01 0xa0000000 0x01 0x60000000>;
>>>>      };
>>>
>>> ... you can see the reserved-regions are described in the normal memory. In
>>> fact...
>>>
>>>>
>>>>
>>>>      reserved-memory {
>>>>              #address-cells = <0x02>;
>>>>              #size-cells = <0x02>;
>>>>              ranges;
>>>>
>>>>              reserved_mem1 {
>>>>                      reg = <0x00 0x20000000 0x00 0x00010000>;
>>>>                      no-map;
>>>>              };
>>>>
>>>>              reserved_mem2 {
>>>>                      reg = <0x00 0x40000000 0x00 0x20000000>;
>>>>                      no-map;
>>>>              };
>>>>
>>>>              reserved_mem3 {
>>>>                      reg = <0x01 0xa0000000 0x00 0x20000000>;
>>>>                      no-map;
>>>>              };
>>>
>>> ... no-map should tell the kernel to not use the memory at all. So I am a
>>> bit puzzled why it is trying to use it.
>>
>> No, 'no-map' doesn't mean the Linux kernel doesn't use it, I quote from
>> the kernel documentation
>> Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml:
>> 'no-map' means the kernel "must not create a virtual mapping of the
>> region". The reserved memory regions are still "under the control of the
>> device driver using the region".
>>
>>> I would suggest to check if somehow Linux doesn't understand the
>>> reserved-memory nodes we wrote.
>>
>> Could you confirm the Xen does write reserved memory nodes?  Or Xen
>> converts the reserved memory nodes to normal memory nodes as I
>> describe above :)
> 
> Xen passes the /reserved-memory node unchanged from host device tree to dom0 fdt.
> Apart from that it creates an additional memory node covering the reserved ranges.
> Take a look at this example run(based on qemu):

Thanks for providing an example! This is quite handy.

> 
> Host dt:
> memory@40000000 {
>      reg = <0x00 0x40000000 0x01 0x00>;
>      device_type = "memory";
> };
> 
> reserved-memory {
>      #size-cells = <0x02>;
>      #address-cells = <0x02>;
>      ranges;
> 
>      test@50000000 {
>          reg = <0x00 0x50000000 0x00 0x10000000>;
>          no-map;
>      };
> };
> 
> Xen:
> (XEN) MODULE[0]: 000000004ac00000 - 000000004ad65000 Xen
> (XEN) MODULE[1]: 000000004ae00000 - 000000004ae03000 Device Tree
> (XEN) MODULE[2]: 0000000042c00000 - 000000004aa8ea8b Ramdisk
> (XEN) MODULE[3]: 0000000040400000 - 0000000042b30000 Kernel
> (XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
> ...
> (XEN) BANK[0] 0x000000c0000000-0x00000100000000 (1024MB)
> 
> Linux dom0:
> [    0.000000] OF: reserved mem: 0x0000000050000000..0x000000005fffffff (262144 KiB) nomap non-reusable test@50000000

So Linux should tell whether a region has been reserved. @Leo, can you 
share with us the serial console? Can you confirm the version of Xen you 
are using?

Cheers,

-- 
Julien Grall

