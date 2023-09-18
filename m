Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA87A5317
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 21:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604200.941426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiJt3-0001Zi-9J; Mon, 18 Sep 2023 19:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604200.941426; Mon, 18 Sep 2023 19:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiJt3-0001Xp-60; Mon, 18 Sep 2023 19:26:25 +0000
Received: by outflank-mailman (input) for mailman id 604200;
 Mon, 18 Sep 2023 19:26:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiJt2-0001Xj-Lz
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 19:26:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiJt1-00029P-Vf; Mon, 18 Sep 2023 19:26:23 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.8.227]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiJt1-0007Qy-Nh; Mon, 18 Sep 2023 19:26:23 +0000
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
	bh=fdZIBfz6j9lyIDWp9GZj18DP09PMiRNEjqgzevfqqr0=; b=d/lh/uXI8wtTYiWISVq5s+MN0d
	fv4JG5fQAn0bA/QPm+m5cjz0fvLGFMxQu9dGwVvvWFiaQxOpue1wFURTqSa66nL8D1TUabB3m9xV+
	jhH3X9FzkC4ubh+cdQSKnng+SK7piY7vXNr1EThhyUV1noWsIRdrgcxKYoW7NsNlfeYc=;
Message-ID: <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>
Date: Mon, 18 Sep 2023 20:26:21 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230916081541.GA3291774@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/09/2023 09:16, Leo Yan wrote:
> Hi Julien,

Hi Leo,

> On Thu, Sep 14, 2023 at 10:37:05AM +0100, Julien Grall wrote:
> My understanding is the local variable 'xatp' is located in the stack
> and the stack is located in the intermediate physical address
> 0x1_a017_1000. Thus, when copies the structure 'xatp' from Dom0 to the
> Xen hypervisor, the hypervisor detects the IPA is not managed by its
> frame table.

Thanks for the log and the analysis (see below).

> 
> This is because the memory range [00000001a0000000 - 00000001bfffffff]
> is the reserved region so Xen hypervisor doesn't populate this region
> and the frame table doesn't initialize for it.

I agree with this statement however...

> On the other hand,
> this memory range is passed to Dom0 Kernel as _normal_ memory region
> and the kernel allocates pages from this memory region, same with
> other memory regions.

... from my understanding reserved-memory are just normal memory that 
are set aside for a specific purpose. So Xen has to create a 'memory' 
node *and* a 'reserved-memory' region.

With that the kernel is supposed to exclude all the 'reserved-memory' 
from normal usage unless they have the node contains the property 
'reusable'. This was more clear before the binding was converted to YAML 
in [1].

> 
> [...]
> 
>>> ## Fixes
>>>
>>> I think it's wrong to add the reserved memory regions into the DT
>>> binding as normal memory nodes for Dom0 kernel.  On the other hand, we
>>> cannot simply remove these reserved memory regions and don't pass to
>>> Dom0 kernel - we might reserve memory for specific purpose, for example,
>>> ramoops [1] for kernel debugging.
>>>
>>> The right thing to do is to keep these reserved memory nodes to Dom0
>>> kernel.  So one task is to record properties for these reserved memory
>>> node name and properties and pass to Dom0 kernel.
>>>
>>> The difficulty is how we can avoid allocate these reserved memory
>>> regions in Xen hypervisor.  We cannot register the reserved memory
>>> into the boot pages, otherwise, the reserved memory might be allocated
>>> in the early phase.  But we need to register these pages into the
>>> frame management framework and reserve them in the first place, so
>>> that we can allow Dom0 kernel to use them.  (I checked a bit the static
>>> memory mechanism, seems to me we cannot use it to resolve this issue).
>>
>>  From my understanding reserved region are normal RAM which have been carved
>> out for specific purpose. They may expect different caching policy (e.g.
>> non-cachable).
> 
> Yes, I agree, but we cannot assume the mapping attribution is always
> non-cachable. It can be mapped as normal type, or device type (with and
> different variants, like strong ordered, write-combined, etc).

For clarification, I didn't suggest it would always be cachable. It can 
be anything and I only provided an example (hence the 'e.g.').

> 
>> AFAIK, Xen doesn't have the capability to know the memory
>> attribute (the DT binding only tell whether the region should not mapped.
>> See the property "no-map"), hence why they were excluded from the memory
>> management.
> 
> I think it's right to exclude the reserved memory regions from the
> normal memory management.
> 
> Here the problem is these reserved memory regions are passed as normal
> memory nodes to Dom0 kernel, then Dom0 kernel allocates pages from
> these reserved memory regions.  Apparently, this might lead to conflict,
> e.g. the reserved memory is used by Dom0 kernel, at the meantime the
> memory is used by another purpose (e.g. by MCU in the system).

See above. I think this is correct to pass both 'memory' and 
'reserved-memory'. Now, it is possible that Xen may not create the 
device-tree correctly.

I would suggest to look how Linux is populating the memory and whether 
it actually skipped the regions.

> 
> Here I am a bit confused for "Xen doesn't have the capability to know
> the memory attribute".  I looked into the file arch/arm/guest_walk.c,
> IIUC, it walks through the stage 1's page tables for the virtual
> machine and get the permission for the mapping, we also can get to
> know the mapping attribute, right?

Most of the time, Xen will use the HW to translate the guest virtual 
address to an intermediation physical address. Looking at the 
specification, it looks like that PAR_EL1 will contain the memory 
attribute which I didn't know.

We would then need to read MAIR_EL1 to find the attribute and also the 
memory attribute in the stage-2 to figure out the final memory 
attribute. This is feasible but the Xen ABI mandates that region passed 
to Xen have a specific memory attributes (see the comment at the top of 
xen/include/public/arch-arm.h).

Anyway, in your case, Linux is using the buffer is on the stack. So the 
region must have been mapped with the proper attribute.

> 
> Another question for the attribute for MMIO regions. For mapping MMIO
> regions, prepare_dtb_hwdom() sets the attribute 'p2m_mmio_direct_c'
> for the stage 2, but in the Linux kernel the MMIO's attribute can
> be one of below variants:
> 
> - ioremap(): device type with nGnRE;
> - ioremap_np(): device type with nGnRnE (strong-ordered);
> - ioremap_wc(): normal non-cachable.

The stage-2 memory attribute is used to restrict the final memory 
attribute. In this case, p2m_mmio_direct_c allows the domain to set 
pretty much any memory attribute.

> 
> If Xen hypervisor can handle these MMIO types in stage 2, then we should
> can use the same way to map stage 2 tables for the reserved memory.  A
> difference for the reserved memory is it can be mapped as normal memory
> with cacheable.

I am a bit confused. I read this as you think the region is not mapped 
in the P2M (aka stage-2 page-tables for Arm). But from the logs you 
provided, the regions are already mapped (you have an MFN in hand). So 
to me the error is most likely in how we create the Device-Tree.

> 
>> It would be good to understand why Xen may try to get a reference on the
>> page.
> 
> I think the above log can answer this question.
> 
>> Also, can you find the associated reserved-region and content of the
>> Device-Tree?
> 
> The DT binding is something like (I tweaked a bit for readable):

Just to confirm this is the host device tree, right? If so...

> 
> 	memory@20000000 {
> 		#address-cells = <0x02>;
> 		#size-cells = <0x02>;
> 		device_type = "memory";
> 		reg = <0x00 0x20000000 0x00 0xa0000000>,
>                        <0x01 0xa0000000 0x01 0x60000000>;
> 	};

... you can see the reserved-regions are described in the normal memory. 
In fact...

> 
> 
> 	reserved-memory {
> 		#address-cells = <0x02>;
> 		#size-cells = <0x02>;
> 		ranges;
> 
> 		reserved_mem1 {
> 			reg = <0x00 0x20000000 0x00 0x00010000>;
> 			no-map;
> 		};
> 
> 		reserved_mem2 {
> 			reg = <0x00 0x40000000 0x00 0x20000000>;
> 			no-map;
> 		};
> 
> 		reserved_mem3 {
> 			reg = <0x01 0xa0000000 0x00 0x20000000>;
> 			no-map;
> 		};

... no-map should tell the kernel to not use the memory at all. So I am 
a bit puzzled why it is trying to use it.

I would suggest to check if somehow Linux doesn't understand the 
reserved-memory nodes we wrote.

Cheers,

[1] https://lore.kernel.org/all/20210901091852.479202-6-maxime@cerno.tech/

-- 
Julien Grall

