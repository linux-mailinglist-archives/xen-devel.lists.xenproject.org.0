Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB0680A45
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 11:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486759.754200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQxM-0006b2-GR; Mon, 30 Jan 2023 10:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486759.754200; Mon, 30 Jan 2023 10:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQxM-0006Xb-D3; Mon, 30 Jan 2023 10:00:08 +0000
Received: by outflank-mailman (input) for mailman id 486759;
 Mon, 30 Jan 2023 10:00:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMQxL-0006XV-Hn
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 10:00:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQxL-00053B-5b; Mon, 30 Jan 2023 10:00:07 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQxK-0001nq-WA; Mon, 30 Jan 2023 10:00:07 +0000
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
	bh=Wr8K3C+IpcFRpTEyVuYXytd1rKbGbJmHB5zBno5xuPY=; b=n+GI0gJUKFZd8wI1oW8R/DIv5i
	xQnWmKOPubGkADjNdR8gah6Ht68/aVsHryiplz0qgS2q1nqR0EXJMxYNGVVkIyfFeEJQpXMQE6Pbx
	QBpeeZCXI8Jg+19zAplBwkuPEvRz0JyqG0IfNtp7A6yBqBml0hVwHehdQrWnHmbPNwJE=;
Message-ID: <49329992-3203-78a7-fc61-d6494e37705c@xen.org>
Date: Mon, 30 Jan 2023 10:00:05 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB453026B268BA9FBEEE970090F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/01/2023 06:24, Penny Zheng wrote:
> Hi, Julien

Hi Penny,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Sunday, January 29, 2023 3:43 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>> setup_early_uart to map early UART
>>
>> Hi Penny,
>>
>> On 29/01/2023 06:17, Penny Zheng wrote:
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: Wednesday, January 25, 2023 3:09 AM
>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>> devel@lists.xenproject.org
>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>> <Volodymyr_Babchuk@epam.com>
>>>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>>>> setup_early_uart to map early UART
>>>>
>>>> Hi Peny,
>>>
>>> Hi Julien,
>>>
>>>>
>>>> On 13/01/2023 05:28, Penny Zheng wrote:
>>>>> In MMU system, we map the UART in the fixmap (when earlyprintk is
>> used).
>>>>> However in MPU system, we map the UART with a transient MPU
>> memory
>>>>> region.
>>>>>
>>>>> So we introduce a new unified function setup_early_uart to replace
>>>>> the previous setup_fixmap.
>>>>>
>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>> ---
>>>>>     xen/arch/arm/arm64/head.S               |  2 +-
>>>>>     xen/arch/arm/arm64/head_mmu.S           |  4 +-
>>>>>     xen/arch/arm/arm64/head_mpu.S           | 52
>>>> +++++++++++++++++++++++++
>>>>>     xen/arch/arm/include/asm/early_printk.h |  1 +
>>>>>     4 files changed, 56 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>>>> index 7f3f973468..a92883319d 100644
>>>>> --- a/xen/arch/arm/arm64/head.S
>>>>> +++ b/xen/arch/arm/arm64/head.S
>>>>> @@ -272,7 +272,7 @@ primary_switched:
>>>>>              * afterwards.
>>>>>              */
>>>>>             bl    remove_identity_mapping
>>>>> -        bl    setup_fixmap
>>>>> +        bl    setup_early_uart
>>>>>     #ifdef CONFIG_EARLY_PRINTK
>>>>>             /* Use a virtual address to access the UART. */
>>>>>             ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
>>>>> diff --git a/xen/arch/arm/arm64/head_mmu.S
>>>>> b/xen/arch/arm/arm64/head_mmu.S index b59c40495f..a19b7c873d
>>>> 100644
>>>>> --- a/xen/arch/arm/arm64/head_mmu.S
>>>>> +++ b/xen/arch/arm/arm64/head_mmu.S
>>>>> @@ -312,7 +312,7 @@ ENDPROC(remove_identity_mapping)
>>>>>      *
>>>>>      * Clobbers x0 - x3
>>>>>      */
>>>>> -ENTRY(setup_fixmap)
>>>>> +ENTRY(setup_early_uart)
>>>>
>>>> This function is doing more than enable the early UART. It also
>>>> setups the fixmap even earlyprintk is not configured.
>>>
>>> True, true.
>>> I've thoroughly read the MMU implementation of setup_fixmap, and I'll
>>> try to split it up.
>>>
>>>>
>>>> I am not entirely sure what could be the name. Maybe this needs to be
>>>> split further.
>>>>
>>>>>     #ifdef CONFIG_EARLY_PRINTK
>>>>>             /* Add UART to the fixmap table */
>>>>>             ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
>>>>> @@ -325,7 +325,7 @@ ENTRY(setup_fixmap)
>>>>>             dsb   nshst
>>>>>
>>>>>             ret
>>>>> -ENDPROC(setup_fixmap)
>>>>> +ENDPROC(setup_early_uart)
>>>>>
>>>>>     /* Fail-stop */
>>>>>     fail:   PRINT("- Boot failed -\r\n")
>>>>> diff --git a/xen/arch/arm/arm64/head_mpu.S
>>>>> b/xen/arch/arm/arm64/head_mpu.S index e2ac69b0cc..72d1e0863d
>>>> 100644
>>>>> --- a/xen/arch/arm/arm64/head_mpu.S
>>>>> +++ b/xen/arch/arm/arm64/head_mpu.S
>>>>> @@ -18,8 +18,10 @@
>>>>>     #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>>>>     #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>>>>     #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>>>> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>>>>>
>>>>>     #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>>>> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>>>>>
>>>>>     /*
>>>>>      * Macro to round up the section address to be PAGE_SIZE aligned
>>>>> @@
>>>>> -334,6 +336,56 @@ ENTRY(enable_mm)
>>>>>         ret
>>>>>     ENDPROC(enable_mm)
>>>>>
>>>>> +/*
>>>>> + * Map the early UART with a new transient MPU memory region.
>>>>> + *
>>>>
>>>> Missing "Inputs: "
>>>>
>>>>> + * x27: region selector
>>>>> + * x28: prbar
>>>>> + * x29: prlar
>>>>> + *
>>>>> + * Clobbers x0 - x4
>>>>> + *
>>>>> + */
>>>>> +ENTRY(setup_early_uart)
>>>>> +#ifdef CONFIG_EARLY_PRINTK
>>>>> +    /* stack LR as write_pr will be called later like nested function */
>>>>> +    mov   x3, lr
>>>>> +
>>>>> +    /*
>>>>> +     * MPU region for early UART is a transient region, since it will be
>>>>> +     * replaced by specific device memory layout when FDT gets parsed.
>>>>
>>>> I would rather not mention "FDT" here because this code is
>>>> independent to the firmware table used.
>>>>
>>>> However, any reason to use a transient region rather than the one
>>>> that will be used for the UART driver?
>>>>
>>>
>>> We don’t want to define a MPU region for each device driver. It will
>>> exhaust MPU regions very quickly.
>> What the usual size of an MPU?
>>
>> However, even if you don't want to define one for every device, it still seem
>> to be sensible to define a fixed temporary one for the early UART as this
>> would simplify the assembly code.
>>
> 
> We will add fixed MPU regions for Xen static heap in function setup_mm.
> If we put early uart region in front(fixed region place), it will leave holes
> later after removing it.

Why? The entry could be re-used to map the devices entry.

> 
>>
>>> In commit " [PATCH v2 28/40] xen/mpu: map boot module section in MPU
>>> system",
>>
>> Did you mean patch #27?
>>
>>> A new FDT property `mpu,device-memory-section` will be introduced for
>>> users to statically configure the whole system device memory with the
>> least number of memory regions in Device Tree.
>>> This section shall cover all devices that will be used in Xen, like `UART`,
>> `GIC`, etc.
>>> For FVP_BaseR_AEMv8R, we have the following definition:
>>> ```
>>> mpu,device-memory-section = <0x0 0x80000000 0x0 0x7ffff000>; ```
>>
>> I am a bit worry this will be a recipe for mistake. Do you have an example
>> where the MPU will be exhausted if we reserve some entries for each device
>> (or some)?
>>
> 
> Yes, we have internal platform where MPU regions are only 16.

Internal is in silicon (e.g. real) or virtual platform?

>  It will almost eat up
> all MPU regions based on current implementation, when launching two guests in platform.
> 
> Let's calculate the most simple scenario:
> The following is MPU-related static configuration in device tree:
> ```
>          mpu,boot-module-section = <0x0 0x10000000 0x0 0x10000000>;
>          mpu,guest-memory-section = <0x0 0x20000000 0x0 0x40000000>;
>          mpu,device-memory-section = <0x0 0x80000000 0x0 0x7ffff000>;
>          mpu,shared-memory-section = <0x0 0x7a000000 0x0 0x02000000>;
> 
>          xen,static-heap = <0x0 0x60000000 0x0 0x1a000000>;
> ```
> At the end of the boot, before reshuffling, the MPU region usage will be as follows:
> 7 (defined in assembly) + FDT(early_fdt_map) + 5 (at least one region for each "mpu,xxx-memory-section").

Can you list the 7 sections? Is it including the init section?

> 
> That will be already at least 13 MPU regions ;\.

The section I am the most concern of is mpu,device-memory-section 
because it would likely mean that all the devices will be mapped in Xen. 
Is there any risk that the guest may use different memory attribute?

On the platform you are describing, what are the devices you are 
expected to be used by Xen?

Cheers,

-- 
Julien Grall

