Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A467FD68
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jan 2023 08:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486269.753702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM2LN-0000WX-AE; Sun, 29 Jan 2023 07:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486269.753702; Sun, 29 Jan 2023 07:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM2LN-0000U8-7D; Sun, 29 Jan 2023 07:43:17 +0000
Received: by outflank-mailman (input) for mailman id 486269;
 Sun, 29 Jan 2023 07:43:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pM2LL-0000U2-92
 for xen-devel@lists.xenproject.org; Sun, 29 Jan 2023 07:43:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pM2LK-0000PX-Ss; Sun, 29 Jan 2023 07:43:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pM2LK-0001L8-NJ; Sun, 29 Jan 2023 07:43:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=rf8PdB3U2aMf3op0qNt9E1hxzGSWbvx9c2BmOpQAWaM=; b=EHKOzXdMHGZhYyEQqDv8/jXSJZ
	7TM5tzzOMFt0uXswFGTtq1F+PqMkcUgecLDlbbggFMMl5lWdDIyh6qv/hhQ3tgL49rOBX0hfpiUiM
	6fYinSvLeMWeyjMpJiYFKs00MlX5+KlxnxFmnSnklyEtctBBpS8fQN1suiciZwaCfRzs=;
Message-ID: <33bddc11-ae1e-b467-32d7-647748d1c627@xen.org>
Date: Sun, 29 Jan 2023 07:43:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-14-Penny.Zheng@arm.com>
 <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
 <AM0PR08MB4530B7AF6EA406882974D528F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
In-Reply-To: <AM0PR08MB4530B7AF6EA406882974D528F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 29/01/2023 06:17, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Wednesday, January 25, 2023 3:09 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>> setup_early_uart to map early UART
>>
>> Hi Peny,
> 
> Hi Julien,
> 
>>
>> On 13/01/2023 05:28, Penny Zheng wrote:
>>> In MMU system, we map the UART in the fixmap (when earlyprintk is used).
>>> However in MPU system, we map the UART with a transient MPU memory
>>> region.
>>>
>>> So we introduce a new unified function setup_early_uart to replace the
>>> previous setup_fixmap.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/arm/arm64/head.S               |  2 +-
>>>    xen/arch/arm/arm64/head_mmu.S           |  4 +-
>>>    xen/arch/arm/arm64/head_mpu.S           | 52
>> +++++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/early_printk.h |  1 +
>>>    4 files changed, 56 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 7f3f973468..a92883319d 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -272,7 +272,7 @@ primary_switched:
>>>             * afterwards.
>>>             */
>>>            bl    remove_identity_mapping
>>> -        bl    setup_fixmap
>>> +        bl    setup_early_uart
>>>    #ifdef CONFIG_EARLY_PRINTK
>>>            /* Use a virtual address to access the UART. */
>>>            ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
>>> diff --git a/xen/arch/arm/arm64/head_mmu.S
>>> b/xen/arch/arm/arm64/head_mmu.S index b59c40495f..a19b7c873d
>> 100644
>>> --- a/xen/arch/arm/arm64/head_mmu.S
>>> +++ b/xen/arch/arm/arm64/head_mmu.S
>>> @@ -312,7 +312,7 @@ ENDPROC(remove_identity_mapping)
>>>     *
>>>     * Clobbers x0 - x3
>>>     */
>>> -ENTRY(setup_fixmap)
>>> +ENTRY(setup_early_uart)
>>
>> This function is doing more than enable the early UART. It also setups the
>> fixmap even earlyprintk is not configured.
> 
> True, true.
> I've thoroughly read the MMU implementation of setup_fixmap, and I'll try to split
> it up.
> 
>>
>> I am not entirely sure what could be the name. Maybe this needs to be split
>> further.
>>
>>>    #ifdef CONFIG_EARLY_PRINTK
>>>            /* Add UART to the fixmap table */
>>>            ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
>>> @@ -325,7 +325,7 @@ ENTRY(setup_fixmap)
>>>            dsb   nshst
>>>
>>>            ret
>>> -ENDPROC(setup_fixmap)
>>> +ENDPROC(setup_early_uart)
>>>
>>>    /* Fail-stop */
>>>    fail:   PRINT("- Boot failed -\r\n")
>>> diff --git a/xen/arch/arm/arm64/head_mpu.S
>>> b/xen/arch/arm/arm64/head_mpu.S index e2ac69b0cc..72d1e0863d
>> 100644
>>> --- a/xen/arch/arm/arm64/head_mpu.S
>>> +++ b/xen/arch/arm/arm64/head_mpu.S
>>> @@ -18,8 +18,10 @@
>>>    #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>>    #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>>    #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>>>
>>>    #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>>>
>>>    /*
>>>     * Macro to round up the section address to be PAGE_SIZE aligned @@
>>> -334,6 +336,56 @@ ENTRY(enable_mm)
>>>        ret
>>>    ENDPROC(enable_mm)
>>>
>>> +/*
>>> + * Map the early UART with a new transient MPU memory region.
>>> + *
>>
>> Missing "Inputs: "
>>
>>> + * x27: region selector
>>> + * x28: prbar
>>> + * x29: prlar
>>> + *
>>> + * Clobbers x0 - x4
>>> + *
>>> + */
>>> +ENTRY(setup_early_uart)
>>> +#ifdef CONFIG_EARLY_PRINTK
>>> +    /* stack LR as write_pr will be called later like nested function */
>>> +    mov   x3, lr
>>> +
>>> +    /*
>>> +     * MPU region for early UART is a transient region, since it will be
>>> +     * replaced by specific device memory layout when FDT gets parsed.
>>
>> I would rather not mention "FDT" here because this code is independent to
>> the firmware table used.
>>
>> However, any reason to use a transient region rather than the one that will
>> be used for the UART driver?
>>
> 
> We don’t want to define a MPU region for each device driver. It will exhaust
> MPU regions very quickly.
What the usual size of an MPU?

However, even if you don't want to define one for every device, it still 
seem to be sensible to define a fixed temporary one for the early UART 
as this would simplify the assembly code.


> In commit " [PATCH v2 28/40] xen/mpu: map boot module section in MPU system",

Did you mean patch #27?

> A new FDT property `mpu,device-memory-section` will be introduced for users to statically
> configure the whole system device memory with the least number of memory regions in Device Tree.
> This section shall cover all devices that will be used in Xen, like `UART`, `GIC`, etc.
> For FVP_BaseR_AEMv8R, we have the following definition:
> ```
> mpu,device-memory-section = <0x0 0x80000000 0x0 0x7ffff000>;
> ```

I am a bit worry this will be a recipe for mistake. Do you have an 
example where the MPU will be exhausted if we reserve some entries for 
each device (or some)?

Cheers,

-- 
Julien Grall

