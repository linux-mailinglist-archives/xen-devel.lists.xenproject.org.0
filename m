Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E75AE1D0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 10:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399633.640857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTXG-0000EX-RY; Tue, 06 Sep 2022 08:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399633.640857; Tue, 06 Sep 2022 08:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTXG-0000Ba-OV; Tue, 06 Sep 2022 08:02:18 +0000
Received: by outflank-mailman (input) for mailman id 399633;
 Tue, 06 Sep 2022 08:02:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVTXE-0000BU-IM
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 08:02:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVTXE-0006S5-6j; Tue, 06 Sep 2022 08:02:16 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVTXD-00079p-Ui; Tue, 06 Sep 2022 08:02:16 +0000
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
	bh=El+QVsS2/X1R3UXn6/d7ocFaeEG3ltdXzscPuUJt/PU=; b=ygpsCcsb1lUKegigcplpQyEMQw
	o2k1000CVU8bRzcih+llMzDmps72Kt0E0k6Xc0TsTlkAj+Lftk4YM9Yo6Z9e4BBC42uLYzswz6fT8
	iS+FbBXADRUmybwJIwh+knwWfR5CJkITQrGYD2SVQcq8k5WETofb5D+E47ROv8pw6afM=;
Message-ID: <f5fe48b7-0ac2-783b-5219-91ddcbd769c1@xen.org>
Date: Tue, 6 Sep 2022 09:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
 <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
 <8325d0ce-1fd3-d754-9eaf-d73b19f8d53e@xen.org>
 <4030d661-7b25-4957-e2dc-069fb4030ea0@amd.com>
 <AS8PR08MB7991A12EAC371A6489C19F5F927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991A12EAC371A6489C19F5F927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry and Michal,

On 06/09/2022 07:41, Henry Wang wrote:
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>> Subject: Re: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
>>
>> Hi Julien,
>>
>> On 05/09/2022 19:24, Julien Grall wrote:
>>>
>>> Hi Michal,
>>>
>>> On 05/09/2022 13:04, Michal Orzel wrote:
>>>> On 05/09/2022 09:26, Henry Wang wrote:
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/setup.h
>> b/xen/arch/arm/include/asm/setup.h
>>>>> index 5815ccf8c5..d0cc556833 100644
>>>>> --- a/xen/arch/arm/include/asm/setup.h
>>>>> +++ b/xen/arch/arm/include/asm/setup.h
>>>>> @@ -22,11 +22,16 @@ typedef enum {
>>>>>        BOOTMOD_UNKNOWN
>>>>>    }  bootmodule_kind;
>>>>>
>>>>> +typedef enum {
>>>>> +    MEMBANK_MEMORY,
>>>>> +    MEMBANK_XEN_DOMAIN, /* whether the memory bank is bound to
>> a Xen domain. */
>>>>> +    MEMBANK_RSVD_HEAP, /* whether the memory bank is reserved as
>> heap. */
>>>>> +} membank_type;
>>>> Whereas the patch itself looks ok (it must be modified anyway given the
>> comments for patch #2),
>>>> MEMBANK_XEN_DOMAIN name is quite ambiguous to me, now when it is
>> part of membank_type enum.
>>>> Something like MEMBANK_STATIC or MEMBANK_STATICMEM would be
>> much cleaner in my opinion
>>>> as it would directly indicate what type of memory we are talking about.
>>>
>>> I am not sure. Technically the reserved heap is static memory that has
>>> been allocated for the heap. In fact, I think thn name "staticmem" is
>>> now becoming quite confusing because we are referring to a very specific
>>> use case (i.e. memory that has been reserved for domain use).
>>>
>>> So I would prefer if we keep "domain" in the name. Maybe
>>> MEMBANK_STATIC_DOMAIN or MEMBANK_RESERVED_DOMAIN.
>>>
>> Personally I would drop completely using the "reserved heap" naming in
>> favor
>> of "static heap" because "staticmem" is also something we reserve at boot
>> time for a domain use.
>> This would also directly correlate to the device tree property "static-heap"
>> and "static-mem".
>> Then such enum would be created as follows and for me this is the cleanest
>> solution:
>> MEMBANK_DEFAULT
>> MEMBANK_STATIC_DOMAIN
>> MEMBANK_STATIC_HEAP
>>
>> But I think we are already too late in this series to request such changes,

The naming was introduced in this version. So I would not view this as a 
late request.

> 
> I am ok with a pure renaming to static heap if Julien is ok with that. I think
> Julien has done most of the code review and we still have 2~3 days for it.
I am fine with the version proposed by Michal. I.e.:

MEMBANK_DEFAULT
MEMBANK_STATIC_DOMAIN
MEMBANK_STATIC_HEAP

Cheers,

-- 
Julien Grall

