Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBA4CA458
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 13:01:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282196.480811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPNeX-0003x8-25; Wed, 02 Mar 2022 12:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282196.480811; Wed, 02 Mar 2022 12:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPNeW-0003uf-VC; Wed, 02 Mar 2022 12:00:20 +0000
Received: by outflank-mailman (input) for mailman id 282196;
 Wed, 02 Mar 2022 12:00:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPNeV-0003uT-Lu
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 12:00:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPNeV-0004SV-HR; Wed, 02 Mar 2022 12:00:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.10.166]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPNeV-0000K5-7o; Wed, 02 Mar 2022 12:00:19 +0000
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
	bh=YAS5UOQ8z3rEa1UpoVW7pu31r+dIUJh8yplNI6smjvg=; b=FREl4boX0BKuoZcSfqt7S71fre
	kBRjOFt9FJQ53MGR+XSBUxFafLRDv8ZhMtDqFtVd1Wu9nbF8wrBI2R6FVcCvUXAmeLJXGDXo/Bu9I
	gGQvGtnaQx8MT7l2UYXmWVIOuGr9/AgDERrG7ApQ/Rcl6tKA5FDHuhoTY8IlnQ2qDQzA=;
Message-ID: <1f0bba54-158b-d171-6f99-0c29e0547f8a@xen.org>
Date: Wed, 2 Mar 2022 12:00:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 nd <nd@arm.com>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org>
 <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/03/2022 07:51, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年2月26日 4:55
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org; Stefano
>> Stabellini <sstabellini@kernel.org>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Penny Zheng
>> <Penny.Zheng@arm.com>; Henry Wang <Henry.Wang@arm.com>; nd <nd@arm.com>
>> Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
>>> ### 1.2. Xen Challenges with PMSA Virtualization
>>> Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to run
>>> with an MPU and host multiple guest OSes.
>>>
>>> - No MMU at EL2:
>>>       - No EL2 Stage 1 address translation
>>>           - Xen provides fixed ARM64 virtual memory layout as basis of
>> EL2
>>>             stage 1 address translation, which is not applicable on MPU
>> system,
>>>             where there is no virtual addressing. As a result, any
>> operation
>>>             involving transition from PA to VA, like ioremap, needs
>> modification
>>>             on MPU system.
>>>       - Xen's run-time addresses are the same as the link time addresses.
>>>           - Enable PIC (position-independent code) on a real-time target
>>>             processor probably very rare.
>>
>> Aside the assembly boot code and UEFI stub, Xen already runs at the same
>> address as it was linked.
>>
> 
> But the difference is that, base on MMU, we can use the same link address
> for all platforms. But on MPU system, we can't do it in the same way.

I agree that we currently use the same link address for all the 
platforms. But this is also a problem when using MMU because EL2 has a 
single TTBR.

At the moment we are switching page-tables with the MMU which is not 
safe. Instead we need to turn out the MMU off, switch page-tables and 
then turn on the MMU. This means we need to have an identity mapping of 
Xen in the page-tables. Assuming Xen is not relocated, the identity 
mapping may clash with Xen (or the rest of the virtual address map).

My initial idea was to enable PIC and update the relocation at boot 
time. But this is a bit cumbersome to do. So now I am looking to have a 
semi-dynamic virtual layout and find some place to relocate part of Xen 
to use for CPU bring-up.

Anyway, my point is we possibly could look at PIC if that could allow 
generic Xen image.

>>>       - Xen will need to use the EL2 MPU memory region descriptors to
>> manage
>>>         access permissions and attributes for accesses made by VMs at
>> EL1/0.
>>>           - Xen currently relies on MMU EL1 stage 2 table to manage these
>>>             accesses.
>>> - No MMU Stage 2 translation at EL1:
>>>       - A guest doesn't have an independent guest physical address space
>>>       - A guest can not reuse the current Intermediate Physical Address
>>>         memory layout
>>>       - A guest uses physical addresses to access memory and devices
>>>       - The MPU at EL2 manages EL1 stage 2 access permissions and
>> attributes
>>> - There are a limited number of MPU protection regions at both EL2 and
>> EL1:
>>>       - Architecturally, the maximum number of protection regions is 256,
>>>         typical implementations have 32.
>>>       - By contrast, Xen does not need to consider the number of page
>> table
>>>         entries in theory when using MMU.
>>> - The MPU protection regions at EL2 need to be shared between the
>> hypervisor
>>>     and the guest stage 2.
>>>       - Requires careful consideration - may impact feature 'fullness' of
>> both
>>>         the hypervisor and the guest
>>>       - By contrast, when using MMU, Xen has standalone P2M table for
>> guest
>>>         stage 2 accesses.
>>
>> [...]
>>
>>> - ***Define new system registers for compilers***:
>>>     Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
>>>     specific system registers. As Armv8-R64 only have secure state, so
>>>     at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And the
>>>     first GCC version that supports Armv8.4 is GCC 8.1. In addition to
>>>     these, PMSA of Armv8-R64 introduced lots of MPU related system
>> registers:
>>>     `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx` and
>>>     `MPUIR_ELx`. But the first GCC version to support these system
>> registers
>>>     is GCC 11. So we have two ways to make compilers to work properly
>> with
>>>     these system registers.
>>>     1. Bump GCC version to GCC 11.
>>>        The pros of this method is that, we don't need to encode these
>>>        system registers in macros by ourselves. But the cons are that,
>>>        we have to update Makefiles to support GCC 11 for Armv8-R64.
>>>        1.1. Check the GCC version 11 for Armv8-R64.
>>>        1.2. Add march=armv8r to CFLAGS for Armv8-R64.
>>>        1.3. Solve the confliction of march=armv8r and mcpu=generic
>>>       These changes will affect common Makefiles, not only Arm Makefiles.
>>>       And GCC 11 is new, lots of toolchains and Distro haven't supported
>> it.
>>
>> I agree that forcing to use GCC11 is not a good idea. But I am not sure
>> to understand the problem with the -march=.... Ultimately, shouldn't we
>> aim to build Xen ARMv8-R with -march=armv8r?
>>
> 
> Actually, we had done, but we reverted it from RFC patch series. The reason
> has been listed above. But that is not the major reason. The main reason
> is that:
> Armv8-R AArch64 supports the A64 ISA instruction set with some modifications:
> Redefines DMB, DSB, and adds an DFB. But actually, the encodings of DMB and
> DSB are still the same with A64. And DFB is a alias of DSB #12.
> 
> In this case, we don't think we need a new arch flag to generate new
> instructions for Armv8-R. And we have discussed with Arm kernel guys, they
> will not update the build system to build Linux that will be running on
> Armv8-R64 EL1 either.

Good to know that the kernel folks plan to do the same. Thanks for the 
explanation!

> 
> 
>> [...]
>>
>>> ### **2.2. Changes of the initialization process**
>>> In general, we still expect Armv8-R64 and Armv8-A64 to have a consistent
>>> initialization process. In addition to some architecture differences,
>> there
>>> is no more than reusable code that we will distinguish through
>> CONFIG_ARM_MPU
>>> or CONFIG_ARM64_V8R. We want most of the initialization code to be
>> reusable
>>> between Armv8-R64 and Armv8-A64.
>>>
>>> - We will reuse the original head.s and setup.c of Arm. But replace the
>>>     MMU and page table operations in these files with configuration
>> operations
>>>     for MPU and MPU regions.
>>>
>>> - We provide a boot-time MPU configuration. This MPU configuration will
>>>     support Xen to finish its initialization. And this boot-time MPU
>>>     configuration will record the memory regions that will be parsed from
>>>     device tree.
>>>
>>>     In the end of Xen initialization, we will use a runtime MPU
>> configuration
>>>     to replace boot-time MPU configuration. The runtime MPU configuration
>> will
>>>     merge and reorder memory regions to save more MPU regions for guests.
>>>     ![img](https://drive.google.com/uc?export=view&id=1wTFyK2XfU3lTlH1PqR
>> DoacQVTwUtWIGU)
>>>
>>> - Defer system unpausing domain.
>>>     When Xen initialization is about to end, Xen unpause guests created
>>>     during initialization. But this will cause some issues. The unpause
>>>     action occurs before free_init_memory, however the runtime MPU
>> configuration
>>>     is built after free_init_memory.
>>
>> I was half expecting that free_init_memory() would not be called for Xen
>> Armv8R.
>>
> 
> We had called free_init_memory for Xen Armv8R, but it doesn't really mean
> much. As we have static heap, so we don't reclaim init memory to heap. And
> this reclaimed memory could not be used by Xen data and bss either. But
> from the security perspective, free_init_memory will drop the Xen init
> code & data, this will reduce the code an attacker can exploit.
IIUC, zero-ing the region (or something) similar will be sufficient 
here. IOW, you don't necessarily need to remove the mappings.

>>>
>>>     So if the unpaused guests start executing the context switch at this
>>>     point, then its MPU context will base on the boot-time MPU
>> configuration.
>>
>> Can you explain why you want to switch the MPU configuration that late?
>>
> 
> In the boot stage, Xen is the only user of MPU. It may add some memory
> nodes or device memory to MPU regions for temporary usage. After free
> init memory, we want to reclaim these MPU regions to give more MPU regions
> can be used for guests. Also we will do some merge and reorder work. This
> work can make MPU regions to be easier managed in guest context switch.

Do you have any example of such regions?
> 
>>>     Probably it will be inconsistent with runtime MPU configuration, this
>>>     will cause unexpected problems (This may not happen in a single core
>>>     system, but on SMP systems, this problem is foreseeable, so we hope
>> to
>>>     solve it at the beginning).
>>
>> [...]
>>
>>> ### **2.4. Changes of memory management**
>>> Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we have to
>>> decouple Xen from VMSA. And give Xen the ability to manage memory in
>> PMSA.
>>>
>>> 1. ***Use buddy allocator to manage physical pages for PMSA***
>>>      From the view of physical page, PMSA and VMSA don't have any
>> difference.
>>>      So we can reuse buddy allocator on Armv8-R64 to manage physical
>> pages.
>>>      The difference is that, in VMSA, Xen will map allocated pages to
>> virtual
>>>      addresses. But in PMSA, Xen just convert the pages to physical
>> address.
>>>
>>> 2. ***Can not use virtual address for memory management***
>>>      As Armv8-R64 only has PMSA in EL2, Xen loses the ability of using
>> virtual
>>>      address to manage memory. This brings some problems, some virtual
>> address
>>>      based features could not work well on Armv8-R64, like `FIXMAP`,
>> `vmap/vumap`,
>>>      `ioremap` and `alternative`.
>>>
>>>      But the functions or macros of these features are used in lots of
>> common
>>>      code. So it's not good to use `#ifdef CONFIG_ARM_MPU` to gate relate
>> code
>>>      everywhere. In this case, we propose to use stub helpers to make the
>> changes
>>>      transparently to common code.
>>>      1. For `FIXMAP`, we will use `0` in `FIXMAP_ADDR` for all fixmap
>> operations.
>>>         This will return physical address directly of fixmapped item.
>>>      2. For `vmap/vumap`, we will use some empty inline stub helpers:
>>>           ```
>>>           static inline void vm_init_type(...) {}
>>>           static inline void *__vmap(...)
>>>           {
>>>               return NULL;
>>>           }
>>>           static inline void vunmap(const void *va) {}
>>>           static inline void *vmalloc(size_t size)
>>>           {
>>>               return NULL;
>>>           }
>>>           static inline void *vmalloc_xen(size_t size)
>>>           {
>>>               return NULL;
>>>           }
>>>           static inline void vfree(void *va) {}
>>>           ```
>>>
>>>      3. For `ioremap`, it depends on `vmap`. As we have make `vmap` to
>> always
>>>         return `NULL`, they could not work well on Armv8-R64 without
>> changes.
>>>         `ioremap` will return input address directly.
>>>           ```
>>>           static inline void *ioremap_attr(...)
>>>           {
>>>               /* We don't have the ability to change input PA cache
>> attributes */
>> OOI, who will set them?
> 
> Some callers that want to change a memory's attribute will set them. Something like
> ioremap_nocache. I am not sure is this what you had asked : )

I am a bit confused. If ioremap_nocache() can change the attribute, then 
why would ioremap_attr() not be able to do it?

> 
>>
>>>               if ( CACHE_ATTR_need_change )
>>>                   return NULL;
>>>               return (void *)pa;
>>>           }
>>>           static inline void __iomem *ioremap_nocache(...)
>>>           {
>>>               return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>>>           }
>>>           static inline void __iomem *ioremap_cache(...)
>>>           {
>>>               return ioremap_attr(start, len, PAGE_HYPERVISOR);
>>>           }
>>>           static inline void __iomem *ioremap_wc(...)
>>>           {
>>>               return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>>>           }
>>>           void *ioremap(...)
>>>           {
>>>               return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>>           }
>>>
>>>           ```
>>>       4. For `alternative`, it depends on `vmap` too.
>>
>> The only reason we depend on vmap() is because the map the sections
>> *text read-only and we enforce WnX. For VMSA, it would be possible to
>> avoid vmap() with some rework. I don't know for PMSA.
>>
> 
> For PMSA, we still enforce WnX. For your use case, I assume it's alternative.
> It still may have some possibility to avoid vmap(). But there may be some
> security issues. We had thought to disable MPU -> update xen text -> enable
> MPU to copy VMSA alternative's behavior. The problem with this, however,
> is that at some point, all memory is RWX. There maybe some security risk. > But because it's in init stage, it probably doesn't matter as much as 
I thought.

For boot code, we need to ensure the code is compliant to the Arm Arm. 
Other than that, it is OK to have the memory RWX for a short period of time.

In fact, when we originally boot Xen, we don't enforce WnX. We will 
start to enforce when initializing the memory. But there are no blocker 
to delay it (other than writing the code :)).

Cheers,

-- 
Julien Grall

