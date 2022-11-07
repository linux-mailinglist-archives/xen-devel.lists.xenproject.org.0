Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A461EF11
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 10:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439168.693168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryUE-0002On-IZ; Mon, 07 Nov 2022 09:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439168.693168; Mon, 07 Nov 2022 09:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryUE-0002N1-FV; Mon, 07 Nov 2022 09:32:10 +0000
Received: by outflank-mailman (input) for mailman id 439168;
 Mon, 07 Nov 2022 09:32:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oryUC-0002Mv-Rd
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 09:32:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oryUC-0001vo-J6; Mon, 07 Nov 2022 09:32:08 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oryUC-0002TU-Cy; Mon, 07 Nov 2022 09:32:08 +0000
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
	bh=I9hH1fLXPPrBsQbGhk75XTpGpv5QLz9MKr1927Qf1rA=; b=tPvsNviP7t/51DRRHlgJ8N2fOL
	1FfkazmavVEGHGHRD4eDDaJtSiRtW+lXnW5UjJOZCdNh2XiXlJfTlZHVHeCfjQnc2h2+xaOztnaAs
	YtpehE0L0hlFWhNlGR5fT2Bn9vTP+m5U3rG7E77/80hOPbxZ8j4yLvcLoNkjtsXTkufI=;
Message-ID: <19148b2c-7154-b482-ebeb-71692cb6a1f7@xen.org>
Date: Mon, 7 Nov 2022 09:32:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 11/11] xen/arm64: add setup_fixmap and
 remove_identity_mapping for MPU
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-12-wei.chen@arm.com>
 <84e476a5-9365-bb80-a8e2-86dcf09681f0@xen.org>
 <AM0PR08MB45308B2EEB1F956FE30C3289F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB45308B2EEB1F956FE30C3289F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/11/2022 08:13, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Monday, November 7, 2022 5:02 AM
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
>> Cc: nd <nd@arm.com>; Penny Zheng <Penny.Zheng@arm.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v6 11/11] xen/arm64: add setup_fixmap and
>> remove_identity_mapping for MPU
>>
>> Hi,
>>
>> On 04/11/2022 10:07, Wei Chen wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> setup_fixmap and remove_identity_mapping are two functions that are
>>> used in Xen boot-time code flow. We implement these two functions for
>>> MPU system, in this case, the code flow in head.S doesn't need to use
>>> #ifdef to gate MPU/MMU code.
>>>
>>> In MMU system, setup_fixmap is used for Xen to map some essentail data
>>> or devices in boot-time. For MPU system, we still have this
>>> requirement, we map the early UART to MPU protection region when
>>> earlyprintk is enabled. This also means PRINT can't be used after
>>> turning on MPU but before setup_fixmap. This restriction is the same
>>> as MMU system.
>>>
>>> For remove_identity_mapping, we just need an empty function to make
>>> head.S code flow happy.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/arm64/head_mpu.S                 | 49 +++++++++++++++++++
>>>    .../arm/include/asm/platforms/fvp_baser.h     |  4 ++
>>>    2 files changed, 53 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/arm64/head_mpu.S
>>> b/xen/arch/arm/arm64/head_mpu.S index 5a1b03e293..336c0a630f
>> 100644
>>> --- a/xen/arch/arm/arm64/head_mpu.S
>>> +++ b/xen/arch/arm/arm64/head_mpu.S
>>> @@ -20,13 +20,20 @@
>>>    /*
>>>     * In boot stage, we will use 1 MPU region:
>>>     * Region#0: Normal memory for Xen text + data + bss (2MB)
>>> + * Region#1: Device memory for EARLY UART, size is defined
>>> + *           by platform's EARLY_UART_SIZE
>>>     */
>>>    #define BOOT_NORMAL_REGION_IDX  0x0
>>> +#define BOOT_DEVICE_REGION_IDX  0x1
>>>
>>>    /* MPU normal memory attributes. */
>>>    #define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
>>>    #define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
>>>
>>> +/* MPU device memory attributes. */
>>> +#define PRBAR_DEVICE_MEM        0x20    /* SH=10 AP=00 XN=00 */
>>> +#define PRLAR_DEVICE_MEM        0x09    /* NS=0 ATTR=100 EN=1 */
>>> +
>>>    .macro write_pr, sel, prbar, prlar
>>>        msr   PRSELR_EL2, \sel
>>>        dsb   sy
>>> @@ -69,6 +76,48 @@ ENTRY(prepare_early_mappings)
>>>        ret
>>>    ENDPROC(prepare_early_mappings)
>>>
>>> +/*
>>> + * In MMU system, setup_fixmap is used for Xen to map some essential
>>> +data
>>> + * or devices in boot-time. In order to be consistent with MMU
>>> +system, we
>>> + * inherit the function name for MPU system.
>>> + * setup_fixmap of MPU system will:
>>> + * - Map the early UART to MPU protection region when earlyprintk is
>>> + *   enabled (The PRINT can't be used after turning on MPU but before
>>> + *   setup_fixmap).
>>
>> For the MMU, we have this restriction because the fixmap could clash with
>> the identity mapping. I don't think there are such restrictions for the MPU
>> and therefore it seems strange to pertain the same behavior.
>>
> 
> Yes, both removing identity mapping and using fixmap virtual memory layout are
> not applied to the MPU system.
> 
> And in MMU system, the setup_fixmap function has a behavior to map the UART
> for early printk. And we are only trying to pertain this behavior on MPU system.
> 
>> In fact, I have plan to get rid of this restriction even for the MMU. So better
>> this restriction is not spread if we can.
> 
> Hmm, I'm a bit confused here. Which restriction you are trying to remove? 

The fact that the fixmap entry is not created in create_page_tables() 
(now prepare_early_mappings()).

Cheers,

-- 
Julien Grall

