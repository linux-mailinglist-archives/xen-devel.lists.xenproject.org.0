Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B972F8B2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548608.856610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9MVR-0007kI-Qi; Wed, 14 Jun 2023 09:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548608.856610; Wed, 14 Jun 2023 09:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9MVR-0007hb-Nl; Wed, 14 Jun 2023 09:09:33 +0000
Received: by outflank-mailman (input) for mailman id 548608;
 Wed, 14 Jun 2023 09:09:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9MVQ-0007hV-Kv
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:09:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9MVP-0005Gg-OA; Wed, 14 Jun 2023 09:09:31 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.9.244]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9MVP-0001lr-HA; Wed, 14 Jun 2023 09:09:31 +0000
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
	bh=vchz7TNmo8hQBnaTuLczfPJK/vEPwVTQyrBY6n8zvl4=; b=Qavaj+JanEMDih9qX5GKr6tt4Y
	qHELKFZx04FXIeJpm+RhAHwTuMpTRH1VFc47RlNUPrW0/aRSil9BCGiiSTO82tqrfGvVF7fhdf7/z
	f76HODRG4nYIYGqxawq2zy1j3lmHl/X9c8BYzITvdTDMu+Sg9p7i4JNmXMx1gByVGKi8=;
Message-ID: <5b4c98fb-9f81-ab30-29b4-ad8b9587b96b@xen.org>
Date: Wed, 14 Jun 2023 10:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230614073018.21303-1-michal.orzel@amd.com>
 <261ab0b0-91ed-e6b7-730f-0ecb8a7b5635@citrix.com>
 <e9353bd5-a0c2-0451-0c7c-8778b3c285f5@amd.com>
 <4925a406-3b06-792f-008e-77503ca230f0@xen.org>
 <ce65ba3c-c3c6-dd89-534b-2caaf52ba256@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ce65ba3c-c3c6-dd89-534b-2caaf52ba256@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/06/2023 10:06, Michal Orzel wrote:
> 
> 
> On 14/06/2023 11:02, Julien Grall wrote:
>>
>>
>> On 14/06/2023 09:09, Michal Orzel wrote:
>>>
>>>
>>> On 14/06/2023 10:04, Andrew Cooper wrote:
>>>>
>>>>
>>>> On 14/06/2023 8:30 am, Michal Orzel wrote:
>>>>> Missing newline is inconsistent with the rest of the callers, since
>>>>> panic() expects it.
>>>>>
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> although...
>>>>
>>>>> ---
>>>>>    xen/arch/arm/bootfdt.c            | 2 +-
>>>>>    xen/arch/arm/domain_build.c       | 6 +++---
>>>>>    xen/arch/x86/cpu/microcode/core.c | 2 +-
>>>>>    3 files changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>>>> index b6f92a174f5f..2673ad17a1e1 100644
>>>>> --- a/xen/arch/arm/bootfdt.c
>>>>> +++ b/xen/arch/arm/bootfdt.c
>>>>> @@ -225,7 +225,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
>>>>>                                     size_cells, data);
>>>>>
>>>>>        if ( rc == -ENOSPC )
>>>>> -        panic("Max number of supported reserved-memory regions reached.");
>>>>> +        panic("Max number of supported reserved-memory regions reached.\n");
>>>>
>>>> Trailing punctuation like . or ! is useless.  Most messages don't have
>>>> them, and it just takes up space in .rodata, the console ring, and time
>>>> on the UART.
>>>>
>>>> I'd recommend dropping the ones you modify, and/or cleaning it up more
>>>> widely.
>>> I will keep in mind to do that in global scope in the next patch.
>>> We also have quite a lot of printk() with trailing punctuation.
>>
>> This is quite a bit of churn and I am unconvinced this is necessary.
>> Also, if the others want such style, then this should be agreed on in
>> the CODING_STYLE first. Otherwise, I am afraid this is not something I
>> will enforce because I see limited value.
>>
> I then suggest to take this patch as is if you are also happy with it like others.

The patch looks fine. I will commit it a bit later just to give a chance 
to Bertrand/Stefano to object.

Cheers,

-- 
Julien Grall

