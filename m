Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11CDA76682
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932476.1334583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzEow-00087h-4s; Mon, 31 Mar 2025 13:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932476.1334583; Mon, 31 Mar 2025 13:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzEow-00085t-2J; Mon, 31 Mar 2025 13:04:54 +0000
Received: by outflank-mailman (input) for mailman id 932476;
 Mon, 31 Mar 2025 13:04:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tzEou-00085n-95
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:04:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzEot-002MO8-2o;
 Mon, 31 Mar 2025 13:04:51 +0000
Received: from [2a02:8012:3a1:0:4a4:ac1c:109c:a95]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzEot-00C2ts-1o;
 Mon, 31 Mar 2025 13:04:51 +0000
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
	bh=e94XQNPad4qw2lQR5ZxqwI8pumOeK1nXJBUFvafC3W8=; b=oWkUKr02DVB0lui76Ul9dsCc9/
	con4Gl26IKabOxH7N4dntnsYTEMz2z6sYvn/w/w2mK0MyYz/cDpfF6l5hij3deulnZjICESOB9k6V
	ZpQ36Ft3zN4w2ohmCkWsuHaxVeiJfh5OrixiStmqWIrSIfSQCD9agiwtHpwU8z+bMKYs=;
Message-ID: <ae0ced6a-614b-43f3-a6e4-39404c76b30b@xen.org>
Date: Mon, 31 Mar 2025 14:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
 <20250330180308.2551195-3-ayan.kumar.halder@amd.com>
 <4d57c061-ec16-4467-8bd1-08a40161ab0e@xen.org>
 <b67f5e7a-f151-4831-b42e-6db5831728db@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b67f5e7a-f151-4831-b42e-6db5831728db@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 31/03/2025 13:38, Ayan Kumar Halder wrote:
> 
> On 30/03/2025 22:06, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien/Michal,
> 
> Michal - I agree to use {READ/WRTIE}_SYSREG_ASM() instead of LOAD/STORE.
> 
> I need your thoughts on the following.
> 
>>
>> On 30/03/2025 19:03, Ayan Kumar Halder wrote:
>>> Added a new file prepare_xen_region.inc to hold the common earlyboot 
>>> MPU regions
>>> configurations across arm64 and arm32.
>>
>> While I understand the desire to consolidate the code, I am quite 
>> unconvinced this should be done for assembly code. A few examples 
>> below why.
>>
>> I would be interested to hear the view of the other Arm maintainers.
>>
>>>
>>> prepare_xen_region, enable_boot_cpu, fail_insufficient_regions() will 
>>> be used by
>>> both arm32 and arm64. Thus, they have been moved to 
>>> prepare_xen_region.inc.
>>>
>>> REGION_* are moved to arm64/sysregs.h. Introduced LOAD_SYSREG and 
>>> STORE_SYSREG
>>> to read/write to the system registers from the common asm file. One 
>>> could not
>>> reuse READ_SYSREG and WRITE_SYSREG as they have been defined to be 
>>> invoked from
>>> C files.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from
>>>
>>> v1 -
>>>
>>> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to 
>>> what is
>>> being done in enable_mmu(). All the mm related configurations happen 
>>> in this
>>> function.
>>>
>>> 2. Fixed some typos.
>>>
>>> v2 -
>>> 1. Extracted the arm64 head.S functions/macros in a common file.
>>>
>>>   xen/arch/arm/arm64/mpu/head.S                 | 132 +-----------------
>>>   xen/arch/arm/include/asm/arm64/sysregs.h      |  15 ++
>>>   .../include/asm/mpu/prepare_xen_region.inc    | 128 +++++++++++++++++
>>>   3 files changed, 148 insertions(+), 127 deletions(-)
>>>   create mode 100644 xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
>>>
>>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/ 
>>> head.S
>>> index 4d00de4869..90b4c8c18f 100644
>>> --- a/xen/arch/arm/arm64/mpu/head.S
>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>> @@ -3,83 +3,7 @@
>>>    * Start-of-day code for an Armv8-R MPU system.
>>>    */
>>>   -#include <asm/early_printk.h>
>>> -#include <asm/mpu.h>
>>> -
>>> -/* Backgroud region enable/disable */
>>> -#define SCTLR_ELx_BR    BIT(17, UL)
>>> -
>>> -#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>> -#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>> -#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>> -#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>>> -
>>> -#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>> -#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>>> -
>>> -/*
>>> - * Macro to prepare and set a EL2 MPU memory region.
>>> - * We will also create an according MPU memory region entry, which
>>> - * is a structure of pr_t,  in table \prmap.
>>> - *
>>> - * sel:         region selector
>>> - * base:        reg storing base address
>>> - * limit:       reg storing limit address
>>> - * prbar:       store computed PRBAR_EL2 value
>>> - * prlar:       store computed PRLAR_EL2 value
>>> - * maxcount:    maximum number of EL2 regions supported
>>> - * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> - *              REGION_DATA_PRBAR
>>> - * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> - *              REGION_NORMAL_PRLAR
>>> - *
>>> - * Preserves \maxcount
>>> - * Output:
>>> - *  \sel: Next available region selector index.
>>> - * Clobbers \base, \limit, \prbar, \prlar
>>> - *
>>> - * Note that all parameters using registers should be distinct.
>>> - */
>>> -.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>>> -    /* Check if the region is empty */
>>> -    cmp   \base, \limit
>>> -    beq   1f
>>> -
>>> -    /* Check if the number of regions exceeded the count specified 
>>> in MPUIR_EL2 */
>>> -    cmp   \sel, \maxcount
>>> -    bge   fail_insufficient_regions
>>> -
>>> -    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>>> -    and   \base, \base, #MPU_REGION_MASK
>>> -    mov   \prbar, #\attr_prbar
>>> -    orr   \prbar, \prbar, \base
>>> -
>>> -    /* Limit address should be inclusive */
>>> -    sub   \limit, \limit, #1
>>> -    and   \limit, \limit, #MPU_REGION_MASK
>>> -    mov   \prlar, #\attr_prlar
>>> -    orr   \prlar, \prlar, \limit
>>> -
>>> -    msr   PRSELR_EL2, \sel
>>> -    isb
>>> -    msr   PRBAR_EL2, \prbar
>>> -    msr   PRLAR_EL2, \prlar
>>> -    dsb   sy
>>> -    isb
>>> -
>>> -    add   \sel, \sel, #1
>>> -
>>> -1:
>>> -.endm
>>> -
>>> -/*
>>> - * Failure caused due to insufficient MPU regions.
>>> - */
>>> -FUNC_LOCAL(fail_insufficient_regions)
>>> -    PRINT("- Selected MPU region is above the implemented number in 
>>> MPUIR_EL2 -\r\n")
>>> -1:  wfe
>>> -    b   1b
>>> -END(fail_insufficient_regions)
>>> +#include <asm/mpu/prepare_xen_region.inc>
>>>     /*
>>>    * Enable EL2 MPU and data cache
>>> @@ -108,62 +32,16 @@ END(enable_mpu)
>>>    * Maps the various sections of Xen (described in xen.lds.S) as 
>>> different MPU
>>>    * regions.
>>>    *
>>> - * Clobbers x0 - x5
>>> + * Clobbers x0 - x6
>>>    *
>>>    */
>>>   FUNC(enable_boot_cpu_mm)
>>> -    /* Get the number of regions specified in MPUIR_EL2 */
>>> -    mrs   x5, MPUIR_EL2
>>> -    and   x5, x5, #NUM_MPU_REGIONS_MASK
>>> -
>>> -    /* x0: region sel */
>>> -    mov   x0, xzr
>>> -    /* Xen text section. */
>>> -    ldr   x1, =_stext
>>> -    ldr   x2, =_etext
>>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>>> attr_prbar=REGION_TEXT_PRBAR
>>> -
>>> -    /* Xen read-only data section. */
>>> -    ldr   x1, =_srodata
>>> -    ldr   x2, =_erodata
>>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>>> attr_prbar=REGION_RO_PRBAR
>>> -
>>> -    /* Xen read-only after init and data section. (RW data) */
>>> -    ldr   x1, =__ro_after_init_start
>>> -    ldr   x2, =__init_begin
>>> -    prepare_xen_region x0, x1, x2, x3, x4, x5
>>> -
>>> -    /* Xen code section. */
>>> -    ldr   x1, =__init_begin
>>> -    ldr   x2, =__init_data_begin
>>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>>> attr_prbar=REGION_TEXT_PRBAR
>>> -
>>> -    /* Xen data and BSS section. */
>>> -    ldr   x1, =__init_data_begin
>>> -    ldr   x2, =__bss_end
>>> -    prepare_xen_region x0, x1, x2, x3, x4, x5
>>> -
>>> -#ifdef CONFIG_EARLY_PRINTK
>>> -    /* Xen early UART section. */
>>> -    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
>>> -    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + 
>>> CONFIG_EARLY_UART_SIZE)
>>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>>> attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>>> -#endif
>>> -
>>> -    b    enable_mpu
>>> +    mov   x6, lr
>>
>> Aside what I wrote above, why do we need to save/restore lr?
> 
> In the case of arm32, there is no 'ret' instruction.

There is a macro "ret" in asm/arm42/macros.h that does the same job.

 > > When enable_boot_cpu_mm() ----(invokes)--> enable_mpu(), LR should be
> saved and restored. Otherwise, one cannot return to the caller of 
> enable_boot_cpu_mm()

Oh I didn't notice you were using "bl enable_mpu" rather than the 
existing "b enable_mpu". But then I am confused why we can't use "b"?

[...]

>> While those makes sense in sysreg.h because they are definition based 
>> on the Arm Arm. The definition for ...
>>
>>> +
>>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>>
>> for PRLAR are specific to Xen. So I think they should be moved under 
>> mpu/. I would also consider *_PRBAR ones.
>>
>> Also, are those values truely arm64 specific? Asking because you are 
>> using them in common code.
> 
> These definitions (like the _PRBAR) are based on Arm Arm as well.

 From my understanding, ATTR is an index in the MAIR and the content is 
Xen specific. Furthermore, the name of the define are based on the value 
in the MAIR. So I disagree this is solely based on the Arm Arm.

> I preferred to duplicate these values in both the header files so that 
> they stay together with _PRBAR. One needs to use both _PRBAR and _PRLAR 
> to set a MPU region. Thus, I don't prefer to split them in separate 
> header files.
> 
>>
>>> +
>>> +#define STORE_SYSREG(v, name) "msr " __stringify(name,) #v;
>>> +#define LOAD_SYSREG(v, name) "mrs " #v __stringify(,) #name;
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>>   /* Access to system registers */
>>>     #define WRITE_SYSREG64(v, name) do {                    \
>>> @@ -481,6 +494,8 @@
>>>   #define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
>>>   #define READ_SYSREG_LR(index) READ_SYSREG(ICH_LR_REG(index))
>>>   +#endif /* __ASSEMBLY__ */
>>> +
>>>   #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>>>     /*
>>> diff --git a/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc b/ 
>>> xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
>>> new file mode 100644
>>> index 0000000000..3402ed23da
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
>>> @@ -0,0 +1,128 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <asm/sysregs.h>
>>> +#include <asm/mpu.h>
>>> +
>>> +/* Backgroud region enable/disable */
>>> +#define SCTLR_ELx_BR    BIT(17, UL)
>>> +
>>> +/*
>>> + * Macro to prepare and set a EL2 MPU memory region.
>>> + * We will also create an according MPU memory region entry, which
>>> + * is a structure of pr_t,  in table \prmap.
>>> + *
>>> + * sel:         region selector
>>> + * base:        reg storing base address
>>> + * limit:       reg storing limit address
>>> + * prbar:       store computed PRBAR_EL2 value
>>> + * prlar:       store computed PRLAR_EL2 value
>>> + * maxcount:    maximum number of EL2 regions supported
>>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> + *              REGION_DATA_PRBAR
>>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> + *              REGION_NORMAL_PRLAR
>>> + *
>>> + * Preserves maxcount
>>> + * Output:
>>> + *  sel: Next available region selector index.
>>> + * Clobbers base, limit, prbar, prlar
>>> + *
>>> + * Note that all parameters using registers should be distinct.
>>> + */
>>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>>> +    /* Check if the region is empty */
>>> +    cmp   \base, \limit
>>> +    beq   1f
>>> +
>>> +    /* Check if the number of regions exceeded the count specified 
>>> in MPUIR_EL2 */
>>> +    cmp   \sel, \maxcount
>>> +    bge   fail_insufficient_regions
>>> +
>>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>>> +    and   \base, \base, #MPU_REGION_MASK
>>> +    mov   \prbar, #\attr_prbar
>>> +    orr   \prbar, \prbar, \base
>>> +
>>> +    /* Limit address should be inclusive */
>>> +    sub   \limit, \limit, #1
>>> +    and   \limit, \limit, #MPU_REGION_MASK
>>> +    mov   \prlar, #\attr_prlar
>>> +    orr   \prlar, \prlar, \limit
>>> +
>>> +    STORE_SYSREG(\sel, PRSELR_EL2)
>>> +    isb
>>> +    STORE_SYSREG(\prbar, PRBAR_EL2)
>>> +    STORE_SYSREG(\prlar, PRLAR_EL2)
>>> +    dsb   sy
>>> +    isb
>>> +
>>> +    add   \sel, \sel, #1
>>> +
>>> +1:
>>> +.endm
>>> +
>> > +.macro enable_boot_cpu, reg0, reg1, reg2, reg3, reg4, reg5
>>
>> If we go this approach, this will need some documentation on top 
>> (similar to the other macro in this file).
> Ack. will do.
>>
>>> +    /* Get the number of regions specified in MPUIR_EL2 */
>>> +    LOAD_SYSREG(\reg5, MPUIR_EL2)
>>> +    and   \reg5, \reg5, #NUM_MPU_REGIONS_MASK
>>> +
>>> +    /* reg0: region sel */
>>> +    mov   \reg0, #0
>>> +    /* Xen text section. */
>>> +    ldr   \reg1, =_stext
>>
>> For instance, on Arm32, this could be replaced with ``mov_w`` which is 
>> doesn't involve memory load.
> 
> Yes, this is a minor difference. Remember that this code is executed 
> only once during boot time.

I know the code is only executed at boot time (assuming we don't plan 
support suspend/resume...). But I dislike "ldr x, =..." because this is 
introducing a constant pool at the end of the section. Although, I agree 
this is a matter of taste. However...


> While there is a performance penalty with 
> ldr, should we really use mov_w (and as a consequence have a different 
> implementation for arm32) where 99% code is the same and we have lesser 
> code to mantain.

... I disagree with this point. To me, this is not as simple as "Less 
code so more maintainenable. My concern is when reading/updating/... 
this code we have to read the code with both arm32 and arm64 in mind. It 
is much easier if I only know the assembly code applies for one 
architecture.

So I still disagree with trying to make this code common.

[...]

>>
>>> +    ldr   \reg2, =_etext
>>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>>> attr_prbar=REGION_TEXT_PRBAR
>>> +
>>> +    /* Xen read-only data section. */
>>> +    ldr   \reg1, =_srodata
>>> +    ldr   \reg2, =_erodata
>>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>>> attr_prbar=REGION_RO_PRBAR
>>> +
>>> +    /* Xen read-only after init and data section. (RW data) */
>>> +    ldr   \reg1, =__ro_after_init_start
>>> +    ldr   \reg2, =__init_begin
>>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
>>> +
>>> +    /* Xen code section. */
>>> +    ldr   \reg1, =__init_begin
>>> +    ldr   \reg2, =__init_data_begin
>>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>>> attr_prbar=REGION_TEXT_PRBAR
>>> +
>>> +    /* Xen data and BSS section. */
>>> +    ldr   \reg1, =__init_data_begin
>>> +    ldr   \reg2, =__bss_end
>>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
>>> +
>>> +#ifdef CONFIG_EARLY_PRINTK
>>> +    /* Xen early UART section. */
>>> +    ldr   \reg1, =CONFIG_EARLY_UART_BASE_ADDRESS
>>> +    ldr   \reg2, =(CONFIG_EARLY_UART_BASE_ADDRESS + 
>>> CONFIG_EARLY_UART_SIZE)
>>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>>> attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>>> +#endif
>>> +
>>> +    bl    enable_mpu
>>> +.endm
>>> +
>>> +/* Failure caused due to insufficient MPU regions. */
>>> +FUNC_LOCAL(fail_insufficient_regions)
>>> +    PRINT("- Selected MPU region is above the implemented number in 
>>> MPUIR_EL2 -\r\n")
>>> +1:  wfe
>>> +    b   1b
>>> +END(fail_insufficient_regions)
>>> +
>>> +/*
>>> + * We don't yet support secondary CPUs bring-up. Implement a dummy 
>>> helper to
>>> + * please the common code.
>>> + */
>>> +ENTRY(enable_secondary_cpu_mm)
>>
>> I really doubt we will be able to keep this function common in the 
>> future.
> 
> Are you ok if we keep it here for now ?
> 
> 
> Looking a bit further ahead, the MPU registers are not core specific 
> (unlike MMU).
> Thus, there is no MPU specific configuration that we 
> should be doing for the secondary cores. We can investigate more on this 
> when we enable SMP support.

Are you sure? Are you saying you don't need to update SCTLR_EL2 nor 
setting up PRLAR_* & co?

Cheers,

-- 
Julien Grall


