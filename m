Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8166984A24
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 19:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803249.1213751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st93c-0001hx-4w; Tue, 24 Sep 2024 17:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803249.1213751; Tue, 24 Sep 2024 17:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st93c-0001gI-1Y; Tue, 24 Sep 2024 17:10:36 +0000
Received: by outflank-mailman (input) for mailman id 803249;
 Tue, 24 Sep 2024 17:10:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1st93Z-0001em-Ta
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 17:10:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st93Z-0004zV-Ea; Tue, 24 Sep 2024 17:10:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st93Z-00073l-78; Tue, 24 Sep 2024 17:10:33 +0000
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
	bh=HqQmfMir3+0Ivs6AFDKA8yg5rNIlBbACwb9Cf9SUk5c=; b=a/l5w9G6/jdrIbWiUMG0EnlEAG
	f2nWVuF62uP+qgELguJ+zydwxc+UbWteA0dj5CjZmMIcp1jJo1/3h5BlekfmdDu0lzXr/T497NnW/
	Wr1JgfuduYRJrTFVy2jBRWq+4Ch+CoMD/+DAw6+20AUstDZMqQVfgazkvySq4GSWW9i8=;
Message-ID: <59432427-950d-4667-aed9-1caad33d7cf9@xen.org>
Date: Tue, 24 Sep 2024 18:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-4-ayan.kumar.halder@amd.com>
 <e515dfb1-efb6-41a5-85a4-65ec7e9c60a6@xen.org>
 <04bcb27f-8139-43ed-839c-1febe2eb5a13@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <04bcb27f-8139-43ed-839c-1febe2eb5a13@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 24/09/2024 12:32, Ayan Kumar Halder wrote:
> 
> On 19/09/2024 14:16, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien,
> 
> I need some clarifications.
> 
>>
>> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>>> Define enable_boot_cpu_mm() for the AArch64-V8R system.
>>>
>>> Like boot-time page table in MMU system, we need a boot-time MPU
>>> protection region configuration in MPU system so Xen can fetch code and
>>> data from normal memory.
>>>
>>> To do this, Xen maps the following sections of the binary as separate
>>> regions (with permissions) :-
>>> 1. Text (Read only at EL2, execution is permitted)
>>> 2. RO data (Read only at EL2)
>>> 3. RO after init data (Read/Write at EL2 as the data is RW during init)
>>> 4. RW data (Read/Write at EL2)
>>> 5. BSS (Read/Write at EL2)
>>> 6. Init Text (Read only at EL2, execution is permitted)
>>> 7. Init data (Read/Write at EL2)
>>>
>>> If the number of MPU regions created is greater than the count defined
>>> in  MPUIR_EL2, then the boot fails.
>>>
>>> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
>>> Registers", to get the definitions of PRBAR_EL2, PRLAR_EL2 and
>>> PRSELR_EL2 registers. Also, refer to G1.2 "Accessing MPU memory region
>>> registers", the following
>>>
>>> ```
>>> The MPU provides two register interfaces to program the MPU regions:
>>>   - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
>>> PRLAR<n>_ELx.
>>> ```
>>> We use the above mechanism to configure the MPU memory regions.
>>>
>>> MPU specific registers are defined in
>>> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from :-
>>>
>>> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single 
>>> MPU region,
>>> we have separate MPU regions for different parts of the Xen binary. 
>>> The reason
>>> being different regions will nned different permissions (as mentioned 
>>> in the
>>> linker script).
>>>
>>> 2. Introduced a label (__init_data_begin) to mark the beginning of 
>>> the init data
>>> section.
>>>
>>> 3. Moved MPU specific register definitions to mpu/sysregs.h.
>>>
>>> 4. Fixed coding style issues.
>>>
>>> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
>>> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
>>> (Outstanding comment not addressed).
>>>
>>>   xen/arch/arm/Makefile                        |   1 +
>>>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>>>   xen/arch/arm/arm64/mpu/head.S                | 176 +++++++++++++++++++
>>>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 +++
>>>   xen/arch/arm/include/asm/arm64/sysregs.h     |   3 +
>>>   xen/arch/arm/include/asm/mm.h                |   2 +
>>>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
>>>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>>>   xen/arch/arm/xen.lds.S                       |   1 +
>>>   9 files changed, 253 insertions(+)
>>>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>>>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>>>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>>>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>>
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index 7792bff597..aebccec63a 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -1,6 +1,7 @@
>>>   obj-$(CONFIG_ARM_32) += arm32/
>>>   obj-$(CONFIG_ARM_64) += arm64/
>>>   obj-$(CONFIG_MMU) += mmu/
>>> +obj-$(CONFIG_MPU) += mpu/
>>>   obj-$(CONFIG_ACPI) += acpi/
>>>   obj-$(CONFIG_HAS_PCI) += pci/
>>>   ifneq ($(CONFIG_NO_PLAT),y)
>>> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/ 
>>> mpu/Makefile
>>> new file mode 100644
>>> index 0000000000..3340058c08
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>>> @@ -0,0 +1 @@
>>> +obj-y += head.o
>>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/ 
>>> head.S
>>> new file mode 100644
>>> index 0000000000..ef55c8765c
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>> @@ -0,0 +1,176 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Start-of-day code for an Armv8-R MPU system.
>>> + */
>>> +
>>> +#include <asm/mm.h>
>>> +#include <asm/page.h>
>>> +
>>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>> +
>>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>> +
>>> +/*
>>> + * Macro to round up the section address to be PAGE_SIZE aligned
>>> + * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
>>> + * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
>>> + * or in the end
>>> + */
>>> +.macro roundup_section, xb
>>> +        add   \xb, \xb, #(PAGE_SIZE-1)
>>> +        and   \xb, \xb, #PAGE_MASK
>>> +.endm
>>
>> Can you explain why we need the region to be page-aligned? Would not 
>> 64-bytes alignment (IIRC this is the minimum by the MPU sufficient)
> We are aligning the limit address only (not the base address). However ...
>>
>> And more importantly, if those regions were effectively not aligned, 
>> would not this mean we would could configure the MPU with two clashing 
>> regions? IOW, this round up looks harmful to me.
> 
> you are correct that there is chance that limit address might overlap 
> between 2 regions. Also (thinking again), the limit address is 0x3f 
> extended when is programmed into PRLAR. So, we might not need alignment 
> at all for the limit address.

I am not sure I fully understand what you wrote. Can you point me to the 
code you are referring to?

> 
>>
>>> +
>>> +/*
>>> + * Macro to prepare and set a EL2 MPU memory region.
>>> + * We will also create an according MPU memory region entry, which
>>> + * is a structure of pr_t,  in table \prmap.
>>> + *
>>> + * Inputs:
>>> + * sel:         region selector
>>> + * base:        reg storing base address (should be page-aligned)
>>> + * limit:       reg storing limit address
>>> + * prbar:       store computed PRBAR_EL2 value
>>> + * prlar:       store computed PRLAR_EL2 value
>>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> + *              REGION_DATA_PRBAR
>>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> + *              REGION_NORMAL_PRLAR
>>> + *
>>> + * Clobber \tmp1, \tmp2
>>> + *
>>> + */
>>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, tmp1, 
>>> tmp2, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>>> +    and   \base, \base, #MPU_REGION_MASK
>>> +    mov   \prbar, #\attr_prbar
>>> +    orr   \prbar, \prbar, \base
>>> +
>>> +    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
>>> +    /* Round up limit address to be PAGE_SIZE aligned */
>>> +    roundup_section \limit
>>> +    /* Limit address should be inclusive */
>>> +    sub   \limit, \limit, #1
>>> +    and   \limit, \limit, #MPU_REGION_MASK
>>> +    mov   \prlar, #\attr_prlar
>>> +    orr   \prlar, \prlar, \limit
>>> +
>>> +    msr   PRSELR_EL2, \sel
>>> +    isb
>>> +    msr   PRBAR_EL2, \prbar
>>> +    msr   PRLAR_EL2, \prlar
>>> +    dsb
>>
>> Please use "dsb sy". This has the same meaning as "dsb" but more 
>> explicit for the reader.
> Ack
>>
>>> +    isb
>>> +.endm
>>> +
>>> +/* Load the physical address of a symbol into xb */
>>> +.macro load_paddr xb, sym
>>> +    ldr \xb, =\sym
>>> +    add \xb, \xb, x20       /* x20 - Phys offset */
>>> +.endm
>>> +
>>> +.section .text.header, "ax", %progbits
>>
>> Does the code below actually need to be in .text.header?
> 
> I can remove this altogether.  As I understand, the code should be 
> in .text section.
> 
>>
>>> +
>>> +/*
>>> + * Enable EL2 MPU and data cache
>>> + * If the Background region is enabled, then the MPU uses the 
>>> default memory
>>> + * map as the Background region for generating the memory
>>> + * attributes when MPU is disabled.
>>> + * Since the default memory map of the Armv8-R AArch64 architecture is
>>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background 
>>> region here.
>>
>> Based on this sentence, I was expecting an instruction to clear 
>> SCTRL_EL2.BR. What did I miss?
> 
> Sorry, based on https://developer.arm.com/documentation/102670/0300/ 
> AArch64-registers/AArch64-register-descriptions/AArch64-other-register- 
> description/SCTLR-EL2--System-Control-Register--EL2- , SCTLR_EL2.BR == 0 
> (reset value). Thus, the background region is disabled by default.
> 
> Should I still set SCTLR_EL2.BR = 0 ? Or do I update the description 
> with this info.

Both the Arm Arm and the TRM will tell us the state when the CPU boot. 
But I guess that there might be a firmware running before Xen. So we 
can't assume the values in the registers (unless this is documented in 
the boot protocol like Image).

So I think we need to set SCTLR_EL2.BR to 0.

> 
>>
>>> + *
>>> + * Clobbers x0
>>> + *
>>> + */
>>> +FUNC_LOCAL(enable_mpu)
>>> +    mrs   x0, SCTLR_EL2
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>> +    dsb   sy
>>
>> There is no memory access in enable_mpu. So what is this dsb for?
> 
> We need to ensure that the outstanding memory accesses are completed 
> before the MPU is enabled. I think the same rationale applies here as
> 
> enable_mmu()
> 
> {
> 
> ...
> 
> "dsb   sy                     /* Flush PTE writes and finish reads */"
> 
> ..
> 
> }
> 
> In the case of MPU, we need the reads to be completed.

I can't remember why a dsb was added there. But I don't see why we would 
need with the MPU as:
   1/ we have a 1:1 mapping
   2/ everytime we touch the MPU sections, we ensure the change will be 
visible

> 
>>
>>> +    msr   SCTLR_EL2, x0
>>> +    isb
>>> +
>>> +    ret
>>> +END(enable_mpu)
>>> +
>>> +/*
>>> + * Maps the various sections of Xen (described in xen.lds.S) as 
>>> different MPU
>>> + * regions. Some of these regions will be marked read only while the 
>>> others will
>>> + * be read write or execute.
>>
>> And some in the future may need to be memory region (e.g. to use the 
>> UART early) :). So how about just dropping it?
> Yes.
>>
>> > + *> + * Inputs:
>>> + *   lr : Address to return to.
>>> + *
>>> + * Clobbers x0 - x7
>>> + *
>>> + */
>>> +FUNC(enable_boot_cpu_mm)
>> > +    mov   x7, lr> +
>>> +    /* x0: region sel */
>>> +    mov   x0, xzr
>>> +    /* Xen text section. */
>>> +    load_paddr x1, _stext
>>> +    load_paddr x2, _etext
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>> attr_prbar=REGION_TEXT_PRBAR
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen read-only data section. */
>>> +    load_paddr x1, _srodata
>>> +    load_paddr x2, _erodata
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>> attr_prbar=REGION_RO_PRBAR
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen read-only after init data section. */
>>> +    load_paddr x1, __ro_after_init_start
>>> +    load_paddr x2, __ro_after_init_end
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>
>> Is it necessary to have a section for the ro-after-init? IOW, could we 
>> just fold into...
>>
>>> +
>>> +    add   x0, x0, #1
>>> +    /* Xen read-write data section. */
>>> +    load_paddr x1, __ro_after_init_end
>>> +    load_paddr x2, __init_begin
>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>
>> ... this one during boot 
> 
> This makes sense. So what you are saying is that there should be a 
> single RW data region from __ro_after_init_start to _eteemediator  (not 
 > __init_begin as it would overlap with the next).

_eteemediator may not be properly aligned. You will likely need another 
variable.

As a side note, I don't understand why the TEE mediator are part of RW. 
It is a separate problem though.

> 
> Followed by a text region from __init_begin to _einittext. However 
> _eteemediator is same as __init_begin, so should we be inserting a dummy 
> page in between ?

I don't understand what you mean. _init_begin should be suitably aligned 
to 4KB. So why would we need a page in between?

> 
> A RW data region from __init_data_begin to __bss_end. Can we combine the 
> BSS section and init data section into one region ?

If they have the same attribute then yes.

> 
>> and then fold the ro-after-init to the read-only region? 
> 
> This I did not understand.

I mean that the MPU regions would be updated so that after boot, one 
region would cover .rodata + .ro_after_init. The other region would 
cover .data up to .init (not included).

Cheers,

-- 
Julien Grall


