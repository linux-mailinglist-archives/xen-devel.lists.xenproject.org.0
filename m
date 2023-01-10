Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51B6640D0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 13:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474672.735960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFE23-0003Sa-02; Tue, 10 Jan 2023 12:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474672.735960; Tue, 10 Jan 2023 12:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFE22-0003Qq-Ss; Tue, 10 Jan 2023 12:47:10 +0000
Received: by outflank-mailman (input) for mailman id 474672;
 Tue, 10 Jan 2023 12:47:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFE21-0003Qg-HL
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 12:47:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFE21-0006Zp-6z; Tue, 10 Jan 2023 12:47:09 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.2.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFE21-00080n-1V; Tue, 10 Jan 2023 12:47:09 +0000
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
	bh=E7vvzdqWpXhtaNOOWAA3uWfbjk16x5NUFhROFipET3U=; b=F51I1WRIoYZ5jjV2lJfoZTQR/J
	H5yIaDVB41ItV6vKawADszOvw+tH94tqGcLBRCqLdb4EvcWvYsRSlszHAHv382d40M4K/tRuqvsoN
	Us4QgCXVNay/zDGKl9mw9VQM+gl7BHPNkkM59pDrDqEjEcZU2TZkvgD5/y4qD6FoJSYA=;
Message-ID: <23bcfd2b-7482-c181-8520-3d4945386b8d@xen.org>
Date: Tue, 10 Jan 2023 12:47:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
 <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
 <AM0PR08MB453041150588948050F718D4F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <6db41bd2-ab71-422a-4235-a9209e984915@xen.org>
 <AM0PR08MB4530048C87F24524BDE2DCF8F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <8ae9e898-55ba-7fba-6ccc-883bd8b3e7ee@xen.org>
 <AM0PR08MB4530F966B099071ED9428109F7FF9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530F966B099071ED9428109F7FF9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 10/01/2023 03:38, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, January 10, 2023 2:23 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to owner
>> when host address not provided
>>
>> Hi Penny,
> 
> Hi Julien,
> 
>>
>> On 09/01/2023 11:58, Penny Zheng wrote:
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: Monday, January 9, 2023 6:58 PM
>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>> devel@lists.xenproject.org
>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>> <Volodymyr_Babchuk@epam.com>
>>>> Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to owner
>>>> when host address not provided
>>>>
>>>>
>>>>
>>>> On 09/01/2023 07:49, Penny Zheng wrote:
>>>>> Hi Julien
>>>>
>>>> Hi Penny,
>>>>
>>>>> Happy new year~~~~
>>>>
>>>> Happy new year too!
>>>>
>>>>>> -----Original Message-----
>>>>>> From: Julien Grall <julien@xen.org>
>>>>>> Sent: Sunday, January 8, 2023 8:53 PM
>>>>>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-
>>>> devel@lists.xenproject.org
>>>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>>>>>> <sstabellini@kernel.org>; Bertrand Marquis
>>>>>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>>>> <Volodymyr_Babchuk@epam.com>
>>>>>> Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to
>>>>>> owner when host address not provided
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>
>>>>> A few concerns explained why I didn't choose "struct meminfo" over
>>>>> two pointers "struct membank*" and "struct meminfo*".
>>>>> 1) memory usage is the main reason.
>>>>> If we use "struct meminfo" over the current "struct membank*" and
>>>>> "struct meminfo*", "struct shm_meminfo" will become a array of 256
>>>>> "struct shm_membank", with "struct shm_membank" being also an 256-
>>>> item
>>>>> array, that is 256 * 256, too big for a structure and If I
>>>>> remembered clearly,
>>>> it will lead to "more than PAGE_SIZE" compiling error.
>>>>
>>>> I am not aware of any place where we would restrict the size of kinfo
>>>> in upstream. Can you give me a pointer?
>>>>
>>>
>>> If I remembered correctly, my first version of "struct shm_meminfo" is
>>> this
>>> "big"(256 * 256) structure, and it leads to the whole xen binary is
>>> . ;\
>>
>> Ah so the problem is because shm_mem is used in bootinfo. Then I think we
>> should create a distinct structure when dealing with domain information.
>>
> 
> Yes, If I use the latter "struct shm_info", keeping the shm memory info out of the bootinfo,
> I think we could avoid "bigger than 2MB" error.
> 
> Hmm, out of curiosity, The way to create "distinct" structure is like creating another section
> for these distinct structures in lds, just like the existing .dtb section?

No. I meant defining a new structure (i.e. struct {}) that would be used 
in kernel_info. So you don't grow the one used by bootinfo.

>   
>>>
>>>>> FWIT, either reworking meminfo or using a different structure, are
>>>>> both leading to sizing down the array, hmmm, I don't know which size
>>>>> is suitable. That's why I prefer pointer and dynamic allocation.
>>>>
>>>> I would expect that in most cases, you will need only one bank when
>>>> the host address is not provided. So I think this is a bit odd to me to
>> impose a "large"
>>>> allocation for them.
>>>>
>>>
>>> Only if user is not defining size as something like (2^a + 2^b + 2^c +
>>> ...). ;\ So maybe 8 or 16 is enough?
>>> struct new_meminfo {
>>
>> "new" is a bit strange. The name would want to be changed. Or maybe better
>> the structure been defined within the next structure and anonymized.
>>
>>>       unsigned int nr_banks;
>>>       struct membank bank[8];
>>> };
>>>
>>> Correct me if I'm wrong:
>>> The "struct shm_membank" you are suggesting is looking like this, right?
>>> struct shm_membank {
>>>       char shm_id[MAX_SHM_ID_LENGTH];
>>>       unsigned int nr_shm_borrowers;
>>>       struct new_meminfo shm_banks;
>>>       unsigned long total_size;
>>> };
>>
>> AFAIU, shm_membank would still be used to get the information from the
>> host device-tree. If so, then I am afraid this is not an option to me because it
>> would make the code to reserve memory more complex.
>>
>> Instead, we should create a separate structure that will only be used for
>> domain shared memory information.
>>
> 
> Ah, so you are suggesting we should extract the domain shared memory information only
> when dealing with the information from the host device-tree, something like this:
> struct shm_info {
>        char shm_id[MAX_SHM_ID_LENGTH];
>        unsigned int nr_shm_borrowers;
> }

I am not entirely sure what you are suggesting. So I will wait for the 
code to understand.

Cheers,

-- 
Julien Grall

