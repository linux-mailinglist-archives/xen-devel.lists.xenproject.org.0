Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560716692C3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476929.739379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGBh-0005Nb-FX; Fri, 13 Jan 2023 09:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476929.739379; Fri, 13 Jan 2023 09:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGBh-0005Kv-C7; Fri, 13 Jan 2023 09:17:25 +0000
Received: by outflank-mailman (input) for mailman id 476929;
 Fri, 13 Jan 2023 09:17:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGGBg-0005Kf-6J
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:17:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGBe-0005Gz-L1; Fri, 13 Jan 2023 09:17:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGBe-0002v5-Ea; Fri, 13 Jan 2023 09:17:22 +0000
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
	bh=wgdQi0ayQyWcdd8JT7eyCXgDG7VV2ZJGqmkz8o6Fxb4=; b=PL6Iu2N/o8wWMB+b+i+ifYyeqw
	vorf4vhns6+Q94F5tmkmAXiIALuyp444GSdHOhjKaRP3vD5hCRwauphtEhUhcV4vXAOjNYvd1M9E2
	tkjqzCV6K2gAEA9nevejoxQWXhHyghakYQHaVj/JJ9XZ0iWnXKxMfKjpe58IlzyFDis8=;
Message-ID: <85d1bc6b-dda6-c65e-a13b-78ea4baa943f@xen.org>
Date: Fri, 13 Jan 2023 09:17:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-6-julien@xen.org>
 <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
 <965e3faa-472d-9a79-83ca-fef57cda81c5@xen.org>
 <ade9f97d-aa28-bd7e-552c-35bd707bab29@suse.com>
 <a607223f-1cd5-5b32-4d9b-500496745786@xen.org>
 <386a58bc-6d16-475e-ffd5-a3340adbe4b3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <386a58bc-6d16-475e-ffd5-a3340adbe4b3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2023 09:16, Jan Beulich wrote:
> On 13.01.2023 00:15, Julien Grall wrote:
>> Hi,
>>
>> On 04/01/2023 10:23, Jan Beulich wrote:
>>> On 23.12.2022 12:31, Julien Grall wrote:
>>>> On 20/12/2022 15:30, Jan Beulich wrote:
>>>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>>>>
>>>>>> This avoids the assumption that boot pages are in the direct map.
>>>>>>
>>>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> However, ...
>>>>>
>>>>>> --- a/xen/arch/x86/srat.c
>>>>>> +++ b/xen/arch/x86/srat.c
>>>>>> @@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
>>>>>>     		return;
>>>>>>     	}
>>>>>>     	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
>>>>>> -	acpi_slit = mfn_to_virt(mfn_x(mfn));
>>>>>> +	acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));
>>>>>
>>>>> ... with the increased use of vmap space the VA range used will need
>>>>> growing. And that's perhaps better done ahead of time than late.
>>>>
>>>> I will have a look to increase the vmap().
>>>>
>>>>>
>>>>>> +	BUG_ON(!acpi_slit);
>>>>>
>>>>> Similarly relevant for the earlier patch: It would be nice if boot
>>>>> failure for optional things like NUMA data could be avoided.
>>>>
>>>> If you can't map (or allocate the memory), then you are probably in a
>>>> very bad situation because both should really not fail at boot.
>>>>
>>>> So I think this is correct to crash early because the admin will be able
>>>> to look what went wrong. Otherwise, it may be missed in the noise.
>>>
>>> Well, I certainly can see one taking this view. However, at least in
>>> principle allocation (or mapping) may fail _because_ of NUMA issues.
>>
>> Right. I read this as the user will likely want to add "numa=off" on the
>> command line.
>>
>>> At which point it would be better to boot with NUMA support turned off
>> I have to disagree with "better" here. This may work for a user with a
>> handful of hosts. But for large scale setup, you will really want a
>> failure early rather than having a host booting with an expected feature
>> disabled (the NUMA issues may be a broken HW).
>>
>> It is better to fail and then ask the user to specify "numa=off". At
>> least the person made a conscientious decision to turn off the feature.
> 
> Yet how would the observing admin make the connection from the BUG_ON()
> that triggered and the need to add "numa=off" to the command line,
> without knowing Xen internals?

I am happy to switch to a panic() that suggests to turn off NUMA.

> 
>> I am curious to hear the opinion from the others.
> 
> So am I.
> 
> Jan

-- 
Julien Grall

