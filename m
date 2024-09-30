Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467F98A100
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807244.1218565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEng-0007mR-0P; Mon, 30 Sep 2024 11:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807244.1218565; Mon, 30 Sep 2024 11:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEnf-0007jy-UA; Mon, 30 Sep 2024 11:42:47 +0000
Received: by outflank-mailman (input) for mailman id 807244;
 Mon, 30 Sep 2024 11:42:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svEne-0007js-K4
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:42:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svEne-0002Zu-Bg; Mon, 30 Sep 2024 11:42:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svEne-0004xv-4v; Mon, 30 Sep 2024 11:42:46 +0000
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
	bh=U2cQu6pfwVpPB7BaRFBvRc8xB2W2fpU9tZkkL6oBs+Q=; b=K5slhJPXevMT3oU3RR73Hf0oed
	WkePUrIRS0xTiikyQidQJEg524JyaHtnyY/AJYOvYdo1ieEhNcua9HUGk9up/ikS/RdxKveNAmH3Q
	HLoiJZrrhJIdHqiWUh1ABzUUEusEdTin5oXqYz6CGqQgZaCqSD5igUbaXIlBD6YWeblI=;
Message-ID: <10824512-99b2-4a66-91b6-f2b03d35e9e2@xen.org>
Date: Mon, 30 Sep 2024 12:42:44 +0100
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
 <59432427-950d-4667-aed9-1caad33d7cf9@xen.org>
 <edb07929-32af-493b-91e9-debe06be4bc3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <edb07929-32af-493b-91e9-debe06be4bc3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/09/2024 14:22, Ayan Kumar Halder wrote:
> 
> On 24/09/2024 18:10, Julien Grall wrote:
>> On 24/09/2024 12:32, Ayan Kumar Halder wrote:
>>>
>>> On 19/09/2024 14:16, Julien Grall wrote:
>>>> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>>>>> Define enable_boot_cpu_mm() for the AArch64-V8R system.
>>>>>
>>>>> Like boot-time page table in MMU system, we need a boot-time MPU
>>>>> protection region configuration in MPU system so Xen can fetch code 
>>>>> and
>>>>> data from normal memory.
>>>>>
>>>>> To do this, Xen maps the following sections of the binary as separate
>>>>> regions (with permissions) :-
>>>>> 1. Text (Read only at EL2, execution is permitted)
>>>>> 2. RO data (Read only at EL2)
>>>>> 3. RO after init data (Read/Write at EL2 as the data is RW during 
>>>>> init)
>>>>> 4. RW data (Read/Write at EL2)
>>>>> 5. BSS (Read/Write at EL2)
>>>>> 6. Init Text (Read only at EL2, execution is permitted)
>>>>> 7. Init data (Read/Write at EL2)
>>>>>
>>>>> If the number of MPU regions created is greater than the count defined
>>>>> in  MPUIR_EL2, then the boot fails.
>>>>>
>>>>> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System 
>>>>> Control
>>>>> Registers", to get the definitions of PRBAR_EL2, PRLAR_EL2 and
>>>>> PRSELR_EL2 registers. Also, refer to G1.2 "Accessing MPU memory region
>>>>> registers", the following
>>>>>
>>>>> ```
>>>>> The MPU provides two register interfaces to program the MPU regions:
>>>>>   - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
>>>>> PRLAR<n>_ELx.
>>>>> ```
>>>>> We use the above mechanism to configure the MPU memory regions.
>>>>>
>>>>> MPU specific registers are defined in
>>>>> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>> Changes from :-
>>>>>
>>>>> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single 
>>>>> MPU region,
>>>>> we have separate MPU regions for different parts of the Xen binary. 
>>>>> The reason
>>>>> being different regions will nned different permissions (as 
>>>>> mentioned in the
>>>>> linker script).
>>>>>
>>>>> 2. Introduced a label (__init_data_begin) to mark the beginning of 
>>>>> the init data
>>>>> section.
>>>>>
>>>>> 3. Moved MPU specific register definitions to mpu/sysregs.h.
>>>>>
>>>>> 4. Fixed coding style issues.
>>>>>
>>>>> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
>>>>> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
>>>>> (Outstanding comment not addressed).
>>>>>
>>>>>   xen/arch/arm/Makefile                        |   1 +
>>>>>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>>>>>   xen/arch/arm/arm64/mpu/head.S                | 176 ++++++++++++++ 
>>>>> +++++
>>>>>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 +++
>>>>>   xen/arch/arm/include/asm/arm64/sysregs.h     |   3 +
>>>>>   xen/arch/arm/include/asm/mm.h                |   2 +
>>>>>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
>>>>>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>>>>>   xen/arch/arm/xen.lds.S                       |   1 +
>>>>>   9 files changed, 253 insertions(+)
>>>>>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>>>>>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>>>>>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>>>>>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>>>>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>>>>
>>>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>>>> index 7792bff597..aebccec63a 100644
>>>>> --- a/xen/arch/arm/Makefile
>>>>> +++ b/xen/arch/arm/Makefile
>>>>> @@ -1,6 +1,7 @@
>>>>>   obj-$(CONFIG_ARM_32) += arm32/
>>>>>   obj-$(CONFIG_ARM_64) += arm64/
>>>>>   obj-$(CONFIG_MMU) += mmu/
>>>>> +obj-$(CONFIG_MPU) += mpu/
>>>>>   obj-$(CONFIG_ACPI) += acpi/
>>>>>   obj-$(CONFIG_HAS_PCI) += pci/
>>>>>   ifneq ($(CONFIG_NO_PLAT),y)
>>>>> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/ 
>>>>> mpu/Makefile
>>>>> new file mode 100644
>>>>> index 0000000000..3340058c08
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>>>>> @@ -0,0 +1 @@
>>>>> +obj-y += head.o
>>>>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/ 
>>>>> mpu/ head.S
>>>>> new file mode 100644
>>>>> index 0000000000..ef55c8765c
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>>>> @@ -0,0 +1,176 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +/*
>>>>> + * Start-of-day code for an Armv8-R MPU system.
>>>>> + */
>>>>> +
>>>>> +#include <asm/mm.h>
>>>>> +#include <asm/page.h>
>>>>> +
>>>>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>>>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>>>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>>>> +
>>>>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>>>> +
>>>>> +/*
>>>>> + * Macro to round up the section address to be PAGE_SIZE aligned
>>>>> + * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
>>>>> + * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
>>>>> + * or in the end
>>>>> + */
>>>>> +.macro roundup_section, xb
>>>>> +        add   \xb, \xb, #(PAGE_SIZE-1)
>>>>> +        and   \xb, \xb, #PAGE_MASK
>>>>> +.endm
>>>>
>>>> Can you explain why we need the region to be page-aligned? Would not 
>>>> 64-bytes alignment (IIRC this is the minimum by the MPU sufficient)
>>> We are aligning the limit address only (not the base address). 
>>> However ...
>>>>
>>>> And more importantly, if those regions were effectively not aligned, 
>>>> would not this mean we would could configure the MPU with two 
>>>> clashing regions? IOW, this round up looks harmful to me.
>>>
>>> you are correct that there is chance that limit address might overlap 
>>> between 2 regions. Also (thinking again), the limit address is 0x3f 
>>> extended when is programmed into PRLAR. So, we might not need 
>>> alignment at all for the limit address.
>>
>> I am not sure I fully understand what you wrote. Can you point me to 
>> the code you are referring to?
> 
> Actually I was referring to the ArmV8-R AArch32 docs ( ARM DDI 0568A.c 
> ID110520) here.

The code you are writing is for 64-bit :). So please provide some 
reference using the ArmV8-R AArch64 docs.

> 
> In case of HPRBAR "Address[31:6] concatenated with zeroes to form 
> Address[31:0]" , so the base address need to be at least 64 byte aligned.

AFAICT, the 64-bit equivalent is PRBAR<n>_EL2. But indeed, we need the 
address to be 64-byte. That said, I would simply mask the bits rather 
than rounding up because all the address should be properly aligned (as 
we do for the MMU).

> 
> However for HPRLAR, "Address[31:6] concatenated with the value 0x3F to 
> form Address[31:0],". So even if we align the limit address to 4 KB or 
> 64 byte or anything, the actual limit address will  always be unaligned.

That's just the limit is inclusive. So it will always be 64-byte aligned 
- 1. Anyway...

> So, I am thinking that aligning limit address might not make sense.

... same as I above. I don't think we need to align anything. We can 
just mask it.

[...]

>>> Followed by a text region from __init_begin to _einittext. However 
>>> _eteemediator is same as __init_begin, so should we be inserting a 
>>> dummy page in between ?
>>
>> I don't understand what you mean. _init_begin should be suitably 
>> aligned to 4KB. So why would we need a page in between?
> 
> Sorry I didn't explain clearly. In my xen-syms.map
> 
> 0x202000 D __ro_after_init_start
> 
> 0x202000 D _eteemediator
> 
> 0x202000 T __init_begin
> 
> 
> So since __ro_after_init_start == _eteemediator, so the RW data region 
> is empty. There is nothing to map here.
> 
> However if  _eteemediator  and __init_begin were 0x203000 , so I should 
> create a RW data region from 0x202000 - 0x202FFF (ie __init_begin - 1).
> 
> And then there will be Text region from __init_begin to _einittext - 1.
> 
> Is my understanding correct ?

Ah I understand your problem now. Technically all the regions can be 
empty. I don't think add a page between is nice because we would end up 
to waste some space in memory. Instead, we should check if a region is 
empty, if it is then skip it.

> 
>>
>>>
>>> A RW data region from __init_data_begin to __bss_end. Can we combine 
>>> the BSS section and init data section into one region ?
>>
>> If they have the same attribute then yes.
> 
> ok, so my sections look like this (from readelf -DS)
> 
>    [ 0]                   NULL             0000000000000000 00000000
>         0000000000000000  0000000000000000           0     0     0
>    [ 1] .text             PROGBITS         0000000000200000 00000100
>         0000000000000832  0000000000000000 WAX       0     0     32
>    [ 2] .rodata           PROGBITS         0000000000201000 00001100
>         0000000000000d78  0000000000000000   A       0     0 256
>    [ 3] .note.gnu.bu[...] NOTE             0000000000201d78 00001e78
>         0000000000000024  0000000000000000   A       0     0     4
>    [ 4] .data.ro_aft[...] PROGBITS         0000000000202000 00003170
>         0000000000000000  0000000000000000  WA       0     0     1
>    [ 5] .data             PROGBITS         0000000000202000 00002100
>         0000000000000000  0000000000000000  WA       0     0     1
>    [ 6] .init.text        PROGBITS         0000000000202000 00002100
>         0000000000000048  0000000000000000  AX       0     0     4
>    [ 7] .init.data        PROGBITS         0000000000203000 00003100
>         0000000000000070  0000000000000000   A       0     0     1
>    [ 8] .bss              NOBITS           0000000000208000 00003170
>         0000000000000000  0000000000000000  WA       0     0     1
> 
> IIUC, [2] and [3] will be combined.
> 
> [4] and [5] will be combined.
> 
> So we will be creating 6 MPU regions in total. Is this correct ?

I think you could combine [7] and [8] as well. So it would look like:
   1. [1] .text
   2. [2] .rodata [3] .note.gnu.bu[...]
   3. [4] .data.ro_aft[...] [3] .data
   4. [6] .init.text
   4. [7] .init.data [8] .bss

After boot, you would have:

   1. [1] .text
   2. [2] .rodata [3] .note.gnu.bu[...] [4] .data.ro_aft[...]
   3. [3] .data
   4. [8] .bss

Cheers,

-- 
Julien Grall


