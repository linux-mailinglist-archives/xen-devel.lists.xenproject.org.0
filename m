Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48568682933
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487489.755134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMn9Q-0002Jj-Ti; Tue, 31 Jan 2023 09:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487489.755134; Tue, 31 Jan 2023 09:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMn9Q-0002Gq-Qc; Tue, 31 Jan 2023 09:42:04 +0000
Received: by outflank-mailman (input) for mailman id 487489;
 Tue, 31 Jan 2023 09:42:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMn9P-0002Gk-2z
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:42:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMn9O-0005yZ-OF; Tue, 31 Jan 2023 09:42:02 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.14.74]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMn9N-0003LQ-N3; Tue, 31 Jan 2023 09:42:02 +0000
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
	bh=eApX0SiPJqBG8PjynyliWGtRgSgyc8CP81OtRv2OCSo=; b=JgbFBTR27UpQj3kY4mBHLKz3pz
	pYA6eiJUU3asEEq6ZEDScyPseYC312fh0b9mDg/szPz1cdy+VQhMw2I9eMgZnZRNWbYIm/5G0nGXg
	UnGr3VPCzU7FlFbk8ilsrOT5ylSMiQxgN42PtC2xkHSgvajtocNm5i7wZTjk558sRVAc=;
Message-ID: <14f9c89a-6eea-204e-cd1b-6bc1cca99716@xen.org>
Date: Tue, 31 Jan 2023 09:41:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-14-Penny.Zheng@arm.com>
 <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
 <AM0PR08MB4530B7AF6EA406882974D528F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <33bddc11-ae1e-b467-32d7-647748d1c627@xen.org>
 <AM0PR08MB453026B268BA9FBEEE970090F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <49329992-3203-78a7-fc61-d6494e37705c@xen.org>
 <AM0PR08MB45305D27CA8353162445AE1EF7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB45305D27CA8353162445AE1EF7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 31/01/2023 05:38, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Monday, January 30, 2023 6:00 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>> setup_early_uart to map early UART
>>
>>
>>
>> On 30/01/2023 06:24, Penny Zheng wrote:
>>> Hi, Julien
>>
>> Hi Penny,
>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: Sunday, January 29, 2023 3:43 PM
>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>> devel@lists.xenproject.org
>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>> <Volodymyr_Babchuk@epam.com>
>>>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>>>> setup_early_uart to map early UART
>>>>
>>>> Hi Penny,
>>>>
>>>> On 29/01/2023 06:17, Penny Zheng wrote:
>>>>>> -----Original Message-----
>>>>>> From: Julien Grall <julien@xen.org>
>>>>>> Sent: Wednesday, January 25, 2023 3:09 AM
>>>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>>>> devel@lists.xenproject.org
>>>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>>>> <Volodymyr_Babchuk@epam.com>
>>>>>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>>>>>> setup_early_uart to map early UART
>>>>>>
>>>>>> Hi Peny,
>>>>>
>>>>> Hi Julien,
>>>>>
>>>>>>
>>>>>> On 13/01/2023 05:28, Penny Zheng wrote:
>>>>>>> In MMU system, we map the UART in the fixmap (when earlyprintk is
>>>> used).
>>>>>>> However in MPU system, we map the UART with a transient MPU
>>>> memory
>>>>>>> region.
>>>>>>>
>>>>>>> So we introduce a new unified function setup_early_uart to replace
>>>>>>> the previous setup_fixmap.
>>>>>>>
>>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>>>> ---
>>>>>>>      xen/arch/arm/arm64/head.S               |  2 +-
>>>>>>>      xen/arch/arm/arm64/head_mmu.S           |  4 +-
>>>>>>>      xen/arch/arm/arm64/head_mpu.S           | 52
>>>>>> +++++++++++++++++++++++++
>>>>>>>      xen/arch/arm/include/asm/early_printk.h |  1 +
>>>>>>>      4 files changed, 56 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/arm64/head.S
>> b/xen/arch/arm/arm64/head.S
>>>>>>> index 7f3f973468..a92883319d 100644
>>>>>>> --- a/xen/arch/arm/arm64/head.S
>>>>>>> +++ b/xen/arch/arm/arm64/head.S
>>>>>>> @@ -272,7 +272,7 @@ primary_switched:
>>>>>>>               * afterwards.
>>>>>>>               */
>>>>>>>              bl    remove_identity_mapping
>>>>>>> -        bl    setup_fixmap
>>>>>>> +        bl    setup_early_uart
>>>>>>>      #ifdef CONFIG_EARLY_PRINTK
>>>>>>>              /* Use a virtual address to access the UART. */
>>>>>>>              ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
>>>>>>> diff --git a/xen/arch/arm/arm64/head_mmu.S
>>>>>>> b/xen/arch/arm/arm64/head_mmu.S index b59c40495f..a19b7c873d
>>>>>> 100644
>>>>>>> --- a/xen/arch/arm/arm64/head_mmu.S
>>>>>>> +++ b/xen/arch/arm/arm64/head_mmu.S
>>>>>>> @@ -312,7 +312,7 @@ ENDPROC(remove_identity_mapping)
>>>>>>>       *
>>>>>>>       * Clobbers x0 - x3
>>>>>>>       */
>>>>>>> -ENTRY(setup_fixmap)
>>>>>>> +ENTRY(setup_early_uart)
>>>>>>
>>>>>> This function is doing more than enable the early UART. It also
>>>>>> setups the fixmap even earlyprintk is not configured.
>>>>>
>>>>> True, true.
>>>>> I've thoroughly read the MMU implementation of setup_fixmap, and
>>>>> I'll try to split it up.
>>>>>
>>>>>>
>>>>>> I am not entirely sure what could be the name. Maybe this needs to
>>>>>> be split further.
>>>>>>
>>>>>>>      #ifdef CONFIG_EARLY_PRINTK
>>>>>>>              /* Add UART to the fixmap table */
>>>>>>>              ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
>>>>>>> @@ -325,7 +325,7 @@ ENTRY(setup_fixmap)
>>>>>>>              dsb   nshst
>>>>>>>
>>>>>>>              ret
>>>>>>> -ENDPROC(setup_fixmap)
>>>>>>> +ENDPROC(setup_early_uart)
>>>>>>>
>>>>>>>      /* Fail-stop */
>>>>>>>      fail:   PRINT("- Boot failed -\r\n")
>>>>>>> diff --git a/xen/arch/arm/arm64/head_mpu.S
>>>>>>> b/xen/arch/arm/arm64/head_mpu.S index e2ac69b0cc..72d1e0863d
>>>>>> 100644
>>>>>>> --- a/xen/arch/arm/arm64/head_mpu.S
>>>>>>> +++ b/xen/arch/arm/arm64/head_mpu.S
>>>>>>> @@ -18,8 +18,10 @@
>>>>>>>      #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>>>>>>      #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>>>>>>      #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>>>>>> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>>>>>>>
>>>>>>>      #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1
>> */
>>>>>>> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>>>>>>>
>>>>>>>      /*
>>>>>>>       * Macro to round up the section address to be PAGE_SIZE
>>>>>>> aligned @@
>>>>>>> -334,6 +336,56 @@ ENTRY(enable_mm)
>>>>>>>          ret
>>>>>>>      ENDPROC(enable_mm)
>>>>>>>
>>>>>>> +/*
>>>>>>> + * Map the early UART with a new transient MPU memory region.
>>>>>>> + *
>>>>>>
>>>>>> Missing "Inputs: "
>>>>>>
>>>>>>> + * x27: region selector
>>>>>>> + * x28: prbar
>>>>>>> + * x29: prlar
>>>>>>> + *
>>>>>>> + * Clobbers x0 - x4
>>>>>>> + *
>>>>>>> + */
>>>>>>> +ENTRY(setup_early_uart)
>>>>>>> +#ifdef CONFIG_EARLY_PRINTK
>>>>>>> +    /* stack LR as write_pr will be called later like nested function */
>>>>>>> +    mov   x3, lr
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * MPU region for early UART is a transient region, since it will be
>>>>>>> +     * replaced by specific device memory layout when FDT gets
>> parsed.
>>>>>>
>>>>>> I would rather not mention "FDT" here because this code is
>>>>>> independent to the firmware table used.
>>>>>>
>>>>>> However, any reason to use a transient region rather than the one
>>>>>> that will be used for the UART driver?
>>>>>>
>>>>>
>>>>> We don’t want to define a MPU region for each device driver. It will
>>>>> exhaust MPU regions very quickly.
>>>> What the usual size of an MPU?
>>>>
>>>> However, even if you don't want to define one for every device, it
>>>> still seem to be sensible to define a fixed temporary one for the
>>>> early UART as this would simplify the assembly code.
>>>>
>>>
>>> We will add fixed MPU regions for Xen static heap in function setup_mm.
>>> If we put early uart region in front(fixed region place), it will
>>> leave holes later after removing it.
>>
>> Why? The entry could be re-used to map the devices entry.
>>
>>>
>>>>
>>>>> In commit " [PATCH v2 28/40] xen/mpu: map boot module section in
>> MPU
>>>>> system",
>>>>
>>>> Did you mean patch #27?
>>>>
>>>>> A new FDT property `mpu,device-memory-section` will be introduced
>>>>> for users to statically configure the whole system device memory
>>>>> with the
>>>> least number of memory regions in Device Tree.
>>>>> This section shall cover all devices that will be used in Xen, like
>>>>> `UART`,
>>>> `GIC`, etc.
>>>>> For FVP_BaseR_AEMv8R, we have the following definition:
>>>>> ```
>>>>> mpu,device-memory-section = <0x0 0x80000000 0x0 0x7ffff000>; ```
>>>>
>>>> I am a bit worry this will be a recipe for mistake. Do you have an
>>>> example where the MPU will be exhausted if we reserve some entries
>>>> for each device (or some)?
>>>>
>>>
>>> Yes, we have internal platform where MPU regions are only 16.
>>
>> Internal is in silicon (e.g. real) or virtual platform?
>>
> 
> Sorry, we met this kind of type platform is all I'm allowed to say.
> Due to NDA, I couldn’t tell more.
> 
>>>   It will almost eat up
>>> all MPU regions based on current implementation, when launching two
>> guests in platform.
>>>
>>> Let's calculate the most simple scenario:
>>> The following is MPU-related static configuration in device tree:
>>> ```
>>>           mpu,boot-module-section = <0x0 0x10000000 0x0 0x10000000>;
>>>           mpu,guest-memory-section = <0x0 0x20000000 0x0 0x40000000>;
>>>           mpu,device-memory-section = <0x0 0x80000000 0x0 0x7ffff000>;
>>>           mpu,shared-memory-section = <0x0 0x7a000000 0x0 0x02000000>;
>>>
>>>           xen,static-heap = <0x0 0x60000000 0x0 0x1a000000>; ``` At the
>>> end of the boot, before reshuffling, the MPU region usage will be as
>> follows:
>>> 7 (defined in assembly) + FDT(early_fdt_map) + 5 (at least one region for
>> each "mpu,xxx-memory-section").
>>
>> Can you list the 7 sections? Is it including the init section?
>>
> 
> Yes, I'll draw the layout for you:

Thanks!

> '''
>   Xen MPU Map before reorg:
> 
> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data
> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> xen_mpumap[5] : Xen static heap
> ......
> xen_mpumap[max_xen_mpumap - 7]: Static shared memory section
> xen_mpumap[max_xen_mpumap - 6]: Boot Module memory section(kernel, initramfs, etc)
> xen_mpumap[max_xen_mpumap - 5]: Device memory section
> xen_mpumap[max_xen_mpumap - 4]: Guest memory section
> xen_mpumap[max_xen_mpumap - 3]: Early FDT
> xen_mpumap[max_xen_mpumap - 2]: Xen init data
> xen_mpumap[max_xen_mpumap - 1]: Xen init text
> 
> In the end of boot, function init_done will do the reorg and boot-only region clean-up:
> 
> Xen MPU Map after reorg(idle vcpu):
> 
> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data

In theory 1 and 2 could be merged after boot. But I guess it might be 
complicated?

> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> xen_mpumap[5] : Xen static heap
> xen_mpumap[6] : Guest memory section

Why do you need to map the "Guest memory section" for the idle vCPU?

> xen_mpumap[7] : Device memory section

I might be missing some context here. But why this section is not also 
mapped in the context of the guest vCPU?

For instance, how would you write to the serial console when the context 
is the guest vCPU?

> xen_mpumap[6] : Static shared memory section
> 
> Xen MPU Map on runtime(guest vcpu):
> 
> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data
> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> xen_mpumap[5] : Xen static heap
> xen_mpumap[6] : Guest memory
> xen_mpumap[7] : vGIC map
> xen_mpumap[8] : vPL011 map

I was expected the PL011 to be fully emulated. So why is this necessary?

> xen_mpumap[9] : Passthrough device map(UART, etc)
> xen_mpumap[10] : Static shared memory section
> 
>>>
>>> That will be already at least 13 MPU regions ;\.
>>
>> The section I am the most concern of is mpu,device-memory-section
>> because it would likely mean that all the devices will be mapped in Xen.
>> Is there any risk that the guest may use different memory attribute?
>>
> 
> Yes, on current implementation, per-domain vgic, vpl011, and passthrough device map
> will be individually added into per-domain P2M mapping, then when switching into guest
> vcpu from xen idle vcpu, device memory section will be replaced by vgic, vpl011, passthrough
> device map.

Per above, I am not entirely sure how you could remove the device memory 
section when using the guest vCPU.

Now about the layout between init and runtime. From previous discussion, 
you said you didn't want to have init section to be fixed because of the 
section "Xen static heap".

Furthermore, you also mention that you didn't want a bitmap. So how 
about the following for the assembly part:

xen_mpumap[0] : Xen text
xen_mpumap[1] : Xen read-only data
xen_mpumap[2] : Xen read-only after init data
xen_mpumap[3] : Xen read-write data
xen_mpumap[4] : Xen BSS
xen_mpumap[5]: Early FDT
xen_mpumap[6]: Xen init data
xen_mpumap[7]: Xen init text
xen_mpumap[8]: Early UART (optional)

Then when you switch to C, you could have:

xen_mpumap[0] : Xen text
xen_mpumap[1] : Xen read-only data
xen_mpumap[2] : Xen read-only after init data
xen_mpumap[3] : Xen read-write data
xen_mpumap[4] : Xen BSS
xen_mpumap[5]: Early FDT
xen_mpumap[6]: Xen init data
xen_mpumap[7]: Xen init text

xen_mpumap[max_xen_mpumap - 4]: Device memory section
xen_mpumap[max_xen_mpumap - 3]: Guest memory section
xen_mpumap[max_xen_mpumap - 2]: Static shared memory section
xen_mpumap[max_xen_mpumap - 1] : Xen static heap

And at runtime, you would keep the "Xen static heap" right at the end of 
the MPU and keep the middle entries as the switchable one.

There would be not bitmap with this solution and all the entries for the 
assembly code would be fixed.

Cheers,

-- 
Julien Grall

