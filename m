Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B983E671823
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480307.744626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55B-0000wd-By; Wed, 18 Jan 2023 09:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480307.744626; Wed, 18 Jan 2023 09:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI55B-0000uQ-8t; Wed, 18 Jan 2023 09:50:13 +0000
Received: by outflank-mailman (input) for mailman id 480307;
 Wed, 18 Jan 2023 09:50:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI55A-0000uK-02
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:50:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI559-0004bj-KT; Wed, 18 Jan 2023 09:50:11 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI559-000571-Ef; Wed, 18 Jan 2023 09:50:11 +0000
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
	bh=zAiykU+TtfSsKJ9F9GCiG9v0SHaPn3kOU6nFLCYsF+c=; b=dJHHF7ZslBzm9WOFp8SwCCCmQQ
	KK0s8cfPWoB4IA0Y/Y2o9L9UySDDSifIy3MO19SZHNJGj+abzxyFmNGL/B533JScqN1NMhWWKHqS0
	Rr/yFC7ygaSgq2qJwOFGnAs2ctw+sn2NyWPCxPgcdhl9YOpaIcH/WtEP5sFiktGc5TRw=;
Message-ID: <4e6d4deb-d38b-9845-2f58-e94f28196bf6@xen.org>
Date: Wed, 18 Jan 2023 09:50:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related code
 from head.S
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-6-Penny.Zheng@arm.com>
 <f78755d8-0b43-ebe4-4b2c-c88875347796@xen.org>
 <PAXPR08MB742006643CF50E239EBC12139EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB742006643CF50E239EBC12139EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/01/2023 03:09, Wei Chen wrote:
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2023年1月18日 7:37
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related
>> code from head.S
>>
>> Hi Penny,
>>
>> On 13/01/2023 05:28, Penny Zheng wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> We want to reuse head.S for MPU systems, but there are some
>>> code implemented for MMU systems only. We will move such
>>> code to another MMU specific file. But before that, we will
>>> do some preparations in this patch to make them easier
>>> for reviewing:
>>
>> Well, I agree that...
>>
>>> 1. Fix the indentations of code comments.
>>
>> ... changing the indentation is better here. But...
>>
>>> 2. Export some symbols that will be accessed out of file
>>>      scope.
>>
>> ... I have no idea which functions are going to be used in a separate
>> file. So I think they should belong to the patch moving the code.
>>
> 
> Ok, I will move these changes to the moving code patches.
> 
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>
>> Your signed-off-by is missing.
>>
>>> ---
>>> v1 -> v2:
>>> 1. New patch.
>>> ---
>>>    xen/arch/arm/arm64/head.S | 40 +++++++++++++++++++--------------------
>>>    1 file changed, 20 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index 93f9b0b9d5..b2214bc5e3 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -136,22 +136,22 @@
>>>            add \xb, \xb, x20
>>>    .endm
>>>
>>> -        .section .text.header, "ax", %progbits
>>> -        /*.aarch64*/
>>> +.section .text.header, "ax", %progbits
>>> +/*.aarch64*/
>>
>> This change is not mentioned.
>>
> 
> I will add the description in commit message.
> 
>>>
>>> -        /*
>>> -         * Kernel startup entry point.
>>> -         * ---------------------------
>>> -         *
>>> -         * The requirements are:
>>> -         *   MMU = off, D-cache = off, I-cache = on or off,
>>> -         *   x0 = physical address to the FDT blob.
>>> -         *
>>> -         * This must be the very first address in the loaded image.
>>> -         * It should be linked at XEN_VIRT_START, and loaded at any
>>> -         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
>>> -         * or the initial pagetable code below will need adjustment.
>>> -         */
>>> +/*
>>> + * Kernel startup entry point.
>>> + * ---------------------------
>>> + *
>>> + * The requirements are:
>>> + *   MMU = off, D-cache = off, I-cache = on or off,
>>> + *   x0 = physical address to the FDT blob.
>>> + *
>>> + * This must be the very first address in the loaded image.
>>> + * It should be linked at XEN_VIRT_START, and loaded at any
>>> + * 4K-aligned address.  All of text+data+bss must fit in 2MB,
>>> + * or the initial pagetable code below will need adjustment.
>>> + */
>>>
>>>    GLOBAL(start)
>>>            /*
>>> @@ -586,7 +586,7 @@ ENDPROC(cpu_init)
>>>     *
>>>     * Clobbers x0 - x4
>>>     */
>>> -create_page_tables:
>>> +ENTRY(create_page_tables)
>>
>> I am not sure about keeping this name. Now we have create_page_tables()
>> and arch_setup_page_tables().
>>
>> I would conside to name it create_boot_page_tables().
>>
> 
> Do you need me to rename it in this patch?

So looking at the rest of the series, I see you are already renaming the 
helper in patch #11. I think it would be better if the naming is done 
earlier.

That said, I am not convinced that create_page_tables() should actually 
be called externally.

In fact, you have something like:

    bl create_page_tables
    bl enable_mmu

Both will need a MMU/MPU specific implementation. So it would be better 
if we provide a wrapper to limit the number of external functions.

Cheers,

-- 
Julien Grall

