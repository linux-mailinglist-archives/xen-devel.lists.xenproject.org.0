Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B3970A73
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 00:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792777.1202570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snQHt-0007mt-K0; Sun, 08 Sep 2024 22:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792777.1202570; Sun, 08 Sep 2024 22:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snQHt-0007kN-Gs; Sun, 08 Sep 2024 22:21:41 +0000
Received: by outflank-mailman (input) for mailman id 792777;
 Sun, 08 Sep 2024 22:21:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snQHs-0007kH-KJ
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2024 22:21:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snQHr-0002Py-WA; Sun, 08 Sep 2024 22:21:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snQHr-0001XR-OX; Sun, 08 Sep 2024 22:21:39 +0000
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
	bh=67+jtYyjnXTi0QOzLt7KRvOqgwPsVjrCuVgac4A0FpY=; b=AL6YVo3iaiottomH84yECX76qH
	g8IhieI5tLubvmayod3QA8azKLfeRE8IHUd6F2xDs4VMYxOvvazbuwmI3wQ6+IwCkGQ3MLb+hxCXc
	gINKrCQMU0NnQH/wy3RNfV4VAcXh7tBbGNPSTBc8hZHBjB0oY6NwHbFh+Whh+obKgXDw=;
Message-ID: <e1d1ed69-94e9-4625-ba49-9ebdb2b9581c@xen.org>
Date: Sun, 8 Sep 2024 23:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
 <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/09/2024 13:21, Ayan Kumar Halder wrote:
> 
> On 28/08/2024 16:01, Julien Grall wrote:
>>> On MPU systems, XEN_START_ADDRESS is also the
>>> + * address that Xen image should be loaded at. So for initial MPU
>>> + * regions setup, we use 2MB for Xen data memory to setup boot
>>> + * region, or the create boot regions code below will need adjustment.
>>> + */
>>> +#define XEN_START_MEM_SIZE      0x200000
>>
>> See above.
> Ack.
>>
>>> +
>>> +/*
>>> + * In boot stage, we will use 1 MPU region:
>>> + * Region#0: Normal memory for Xen text + data + bss (2MB)
>>> + */
>>> +#define BOOT_NORMAL_REGION_IDX  0x0
>>> +
>>> +/* MPU normal memory attributes. */
>>> +#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
>>> +#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
>>> +
>>> +.macro write_pr, sel, prbar, prlar
>>> +    msr   PRSELR_EL2, \sel
>>> +    dsb   sy
>>
>> I am not sure I understand why this is a dsb rather than isb. Can you 
>> clarify?
> 
> ISB is not needed here as the memory protection hasn't been activated 
> yet. The above instruction just selects the memory region and the below 
> two instructions sets the base address and limit for that memory region. 
> After the three instructions, we need an ISB so that the memory 
> protection takes into affect for further instruction fetches.

We discussed this on Matrix, I have also had a read of the Arm Arm again 
(D19.1.2 General behavior of accesses to the AArch64 System registers in 
ARM DDI 0487J.a). Writing down mainly for keeping track of the decision.

In general you need an a context synchronization event (e.g. isb) before 
the other system registers can start to rely on the change. There are 
some exceptions though, but AFAICT PRSELR_EL2 doesn't have any.

IIUC, the behavior of PRBAR_EL2 and PRLAR_EL2 will change depending on 
PRSELR_EL2.REGION. Therefore, we need to make sure the new value of 
PRSELR_EL2 is seen before we write to the two other registers.

> 
> However, a DSB is needed here as the below two instructions depend on 
> this. So, we definitely want this instruction to complete.
> 
> Further, refer to the note in ARM DDI 0600A.d ID120821, C1.7.1 
> "Protection region attributes"
> 
> 0.
> 
>     ```Writes to MPU registers are only guaranteed to be visible
>     following a Context synchronization event and DSB operation.```
> 
> Thus, I infer that DSB is necessary here

I read it differently. To me it was more the "dsb" is necessary before 
the MPU can start using the new region values. But here an 'isb' should 
be fine.

That said, from my experience, certain section of the Arm Arm can be 
interpreted differently whic means that someone could implement your 
way. This is also not a hot path, so best to use the most restrictive 
approach. Therefore I am ok with adding a 'dsb'.

> 
>>
>> If a "dsb" is necessary, "sy" seems to be quite strict.
> 
> I can use "st" here as I am only interested in stores (ie MSR) to complete.
> 
> Now the whether we want to restrict it to inner shareable/outer 
> shareable/POU/full system is a difficult decision to make.
> 
> May be here we can use ishst (stores to complete to inner shareable 
> region). However ....
> 
>>
>>> +    msr   PRBAR_EL2, \prbar
>>> +    msr   PRLAR_EL2, \prlar
>>> +    dsb   sy
> 
> This should be visible to outer shareable domain atleast. The reason 
> being one can use the SH[1:0] bits in PRBAR_EL2 to set the region to 
> outer shareable.
> 
> Thus, the writes to these registers should be visible to outer shareable 
> domain as well.

I am a bit confused. SH[1:0] is about how the region will be accessed 
not up to where should registers are visible. I was expecting that the 
MPU registers only need to be visible to the MPU itself.

For instance, when using the MMU, the translation unit is in the 
non-shareable domain. So a 'nsh' is sufficient regardless of the 
shareability of the page/block.

This is explicitely written in the Arm Arm (see D5-4929 in ARM DDI 
0487H.a) but I can't find a similar section for the MPU yet. Although, I 
would be a bit surprised if the MPU is not in the non-shareable 
domain... Maybe this could be clarified with Arm?

Anyway, for now, I am open to use 'dsb sy' with a TODO to revisit it.

> 
>>> +    isb

Re-quoting the spec from you previous answer:

```
Writes to MPU registers are only guaranteed to be visible
following a Context synchronization event and DSB operation.
```

So this suggests that it should be first an 'isb' and then a 'dsb'. Any 
reason you wrote it the other way around?

>>> +.endm
>>> +
>>> +.section .text.header, "ax", %progbits
>>> +
>>> +/*
>>> + * Static start-of-day EL2 MPU memory layout.
>>> + *
>>> + * It has a very simple structure, including:
>>> + *  - 2MB normal memory mappings of xen at XEN_START_ADDRESS, which
>>> + * is the address where Xen was loaded by the bootloader.
>>> + */
>>
>> Please document a bit more the code and how the registers are used. 
>> For an example see the mmu/head.S code.
> Ack
>>
>>> +ENTRY(enable_boot_cpu_mm)
>>> +    /* Map Xen start memory to a normal memory region. */
>>> +    mov x0, #BOOT_NORMAL_REGION_IDX
>>> +    ldr x1, =XEN_START_ADDRESS
>>> +    and x1, x1, #MPU_REGION_MASK
>>> +    mov x3, #PRBAR_NORMAL_MEM
>>> +    orr x1, x1, x3
>>> +
>>> +    ldr x2, =XEN_START_ADDRESS
>>> +    mov x3, #(XEN_START_MEM_SIZE - 1)
>>> +    add x2, x2, x3
>>> +    and x2, x2, #MPU_REGION_MASK
>>> +    mov x3, #PRLAR_NORMAL_MEM
>>> +    orr x2, x2, x3
>>> +
>>> +    /*
>>> +     * Write to MPU protection region:
>>> +     * x0 for pr_sel, x1 for prbar x2 for prlar
>>> +     */
>>> +    write_pr x0, x1, x2
>>> +
>>> +    ret
>>> +ENDPROC(enable_boot_cpu_mm)
>>
>> Missing emacs magic.
> 
> You mean it should be
> 
> END(enable_boot_cpu_mm) .
> 
> /*
>   * Local variables:
>   * mode: ASM
>   * indent-tabs-mode: nil
>   * End:
>   */

Correct.

>>
>>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h 
>>> b/xen/arch/arm/include/asm/mpu/mm.h
>>> new file mode 100644
>>> index 0000000000..f5ebca8261
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>>
>> Do we need this file?
> 
> In xen/arch/arm/arm64/mpu/head.S, we have
> 
> #include <asm/mm.h>
> 
> So, it should pick up this file.

OOI, why can't you include asm/arm64/mm.h?

Cheers,

-- 
Julien Grall

