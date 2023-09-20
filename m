Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A37A7924
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605514.943105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuPP-00059y-4w; Wed, 20 Sep 2023 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605514.943105; Wed, 20 Sep 2023 10:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuPP-00057q-1J; Wed, 20 Sep 2023 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 605514;
 Wed, 20 Sep 2023 10:26:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiuPO-00057k-CC
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:26:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiuPN-0001qd-N4; Wed, 20 Sep 2023 10:26:13 +0000
Received: from [15.248.3.0] (helo=[10.24.67.40])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiuPN-00078F-Ge; Wed, 20 Sep 2023 10:26:13 +0000
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
	bh=QertMNZc4hn/X+C68xafxNcO77qxWSGmKHf7Wa59S2c=; b=goyQ5E4aNm1uBp5ALSSsMZFuYo
	FjNa8N4CDS2SHr7qnxh9B7DaE2+A1CB0q/5MDV+1Wzx5CQrqqrFCKa/g/cId0jIi5bteQrnjfLvBm
	4clVrl4K8OquxoEatJbD3qb62mOIdhk5VGZCgru2qAWH+GG8/b2UymJ9JI29CL2p8t2c=;
Message-ID: <d1b9a3a1-6e0e-4c1b-9f7a-5190d6535f24@xen.org>
Date: Wed, 20 Sep 2023 11:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: arm64: Handling reserved memory nodes
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
 <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
 <20230916081541.GA3291774@leoy-huanghe.lan>
 <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>
 <20230920100344.GA71044@leoy-huanghe>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230920100344.GA71044@leoy-huanghe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/09/2023 11:03, Leo Yan wrote:
> On Mon, Sep 18, 2023 at 08:26:21PM +0100, Julien Grall wrote:
> 
> [...]
> 
>> ... from my understanding reserved-memory are just normal memory that are
>> set aside for a specific purpose. So Xen has to create a 'memory' node *and*
>> a 'reserved-memory' region.
> 
> To be clear, Xen passes the 'reserved-memory' regions as normal memory
> nodes, see [1].

The memory nodes need to be explicitely written because they are 
excluded in handle_node(). If a node is not excluded, then it should be 
created in the dom0 Device-Tree.

AFAICT, the 'reserved-memory' node is not excluded and therefore should 
be copied to the dom0 DT.

[...]

>>> Here the problem is these reserved memory regions are passed as normal
>>> memory nodes to Dom0 kernel, then Dom0 kernel allocates pages from
>>> these reserved memory regions.  Apparently, this might lead to conflict,
>>> e.g. the reserved memory is used by Dom0 kernel, at the meantime the
>>> memory is used by another purpose (e.g. by MCU in the system).
>>
>> See above. I think this is correct to pass both 'memory' and
>> 'reserved-memory'. Now, it is possible that Xen may not create the
>> device-tree correctly.
> 
> Agreed that now Xen wrongly create DT binding for 'reserved-memory'
> node, more specific, the reserved memory nodes are wrongly passed as
> normal memory nodes (again, see [1]).

See above. You could dump the dom0 Device-Tree to confirm that 
'reserved-memory' is created.

> 
>> I would suggest to look how Linux is populating the memory and whether it
>> actually skipped the regions.
> 
> The Linux kernel reserves the corresponding pages for all reserved
> memory regions, which means the kernel page management (buddy
> alrogithm) doesn't allocate these pages at all.
> 
> With 'no-map' property, the memory range will not be mapped into the
> kernel identical address space.
> 
>>> Here I am a bit confused for "Xen doesn't have the capability to know
>>> the memory attribute".  I looked into the file arch/arm/guest_walk.c,
>>> IIUC, it walks through the stage 1's page tables for the virtual
>>> machine and get the permission for the mapping, we also can get to
>>> know the mapping attribute, right?
>>
>> Most of the time, Xen will use the HW to translate the guest virtual address
>> to an intermediation physical address. Looking at the specification, it
>> looks like that PAR_EL1 will contain the memory attribute which I didn't
>> know.
>>
>> We would then need to read MAIR_EL1 to find the attribute and also the
>> memory attribute in the stage-2 to figure out the final memory attribute.
> 
>> This is feasible but the Xen ABI mandates that region passed to Xen have a
>> specific memory attributes (see the comment at the top of
>> xen/include/public/arch-arm.h).
> 
> If you refer to the comment "All memory which is shared with other
> entities in the system ... which is mapped as Normal Inner Write-Back
> Outer Write-Back Inner-Shareable", I don't think it's relevant with
> current issue.  I will explain in details in below.

It is relevant if you intend to allocate hypercall buffer in a 
non-reusable reserved-region.

> 
>> Anyway, in your case, Linux is using the buffer is on the stack. So the
>> region must have been mapped with the proper attribute.
> 
> I think you may misunderstand the issue.  I would like to divide the
> issue into two parts:
> 
> - The first question is about how to pass reserved memory node from Xen
>    hypervisor to Dom0 Linux kernel.  Currently, Xen hypervisor coverts
>    the reserved memory ranges and add them into the normal memory node.
> 
>    Xen hypervisor should keep the reserved memory node and pass it to
>    Dom0 Linux kernel.  With this change, the Dom0 kernel will only
>    allocate pages from normal memory node and the data in these pages
>    can be shared by Xen hypervisor and Dom0 Linux kernel.

This should be the case. See above.

[...]

>>> Another question for the attribute for MMIO regions. For mapping MMIO
>>> regions, prepare_dtb_hwdom() sets the attribute 'p2m_mmio_direct_c'
>>> for the stage 2, but in the Linux kernel the MMIO's attribute can
>>> be one of below variants:
>>>
>>> - ioremap(): device type with nGnRE;
>>> - ioremap_np(): device type with nGnRnE (strong-ordered);
>>> - ioremap_wc(): normal non-cachable.
>>
>> The stage-2 memory attribute is used to restrict the final memory attribute.
>> In this case, p2m_mmio_direct_c allows the domain to set pretty much any
>> memory attribute.
> 
> Thanks for confirmation.  If so, I think the Xen hypervisor should
> follow the same attribute to map the reserved regions with attribute
> p2m_mmio_direct_c.
> 
>>> If Xen hypervisor can handle these MMIO types in stage 2, then we should
>>> can use the same way to map stage 2 tables for the reserved memory.  A
>>> difference for the reserved memory is it can be mapped as normal memory
>>> with cacheable.
>>
>> I am a bit confused. I read this as you think the region is not mapped in
>> the P2M (aka stage-2 page-tables for Arm). But from the logs you provided,
>> the regions are already mapped (you have an MFN in hand).
> 
> You are right.  The reserved memory regions have been mapped in P2M.
> 
>> So to me the error is most likely in how we create the Device-Tree.
> 
> Yeah, let's firstly focus on the DT binding for reserved memory nodes.
> 
>>> The DT binding is something like (I tweaked a bit for readable):
>>
>> Just to confirm this is the host device tree, right? If so...
> 
> Yes.
> 
>>> 	memory@20000000 {
>>> 		#address-cells = <0x02>;
>>> 		#size-cells = <0x02>;
>>> 		device_type = "memory";
>>> 		reg = <0x00 0x20000000 0x00 0xa0000000>,
>>>                         <0x01 0xa0000000 0x01 0x60000000>;
>>> 	};
>>
>> ... you can see the reserved-regions are described in the normal memory. In
>> fact...
>>
>>>
>>>
>>> 	reserved-memory {
>>> 		#address-cells = <0x02>;
>>> 		#size-cells = <0x02>;
>>> 		ranges;
>>>
>>> 		reserved_mem1 {
>>> 			reg = <0x00 0x20000000 0x00 0x00010000>;
>>> 			no-map;
>>> 		};
>>>
>>> 		reserved_mem2 {
>>> 			reg = <0x00 0x40000000 0x00 0x20000000>;
>>> 			no-map;
>>> 		};
>>>
>>> 		reserved_mem3 {
>>> 			reg = <0x01 0xa0000000 0x00 0x20000000>;
>>> 			no-map;
>>> 		};
>>
>> ... no-map should tell the kernel to not use the memory at all. So I am a
>> bit puzzled why it is trying to use it.
> 
> No, 'no-map' doesn't mean the Linux kernel doesn't use it, I quote from
> the kernel documentation
I am under the impression that we have a different meaning for 'using' 
here. I am referring to the fact that when 'no-map' is specificed, then 
the kernel cannot use the region for other purpose (e.g. stack).

So the fact that the stack seemsm to resides in a reserved-region 
implies that Linux didn't detect the 'no-map'.

Cheers,

-- 
Julien Grall

