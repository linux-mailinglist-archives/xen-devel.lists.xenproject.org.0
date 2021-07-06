Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C373BC875
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 11:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150950.279044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hHq-0005Ta-SL; Tue, 06 Jul 2021 09:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150950.279044; Tue, 06 Jul 2021 09:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hHq-0005Rf-OT; Tue, 06 Jul 2021 09:22:38 +0000
Received: by outflank-mailman (input) for mailman id 150950;
 Tue, 06 Jul 2021 09:22:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0hHp-0005RW-Hd
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 09:22:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0hHp-0005hG-8y; Tue, 06 Jul 2021 09:22:37 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0hHp-0007z6-2r; Tue, 06 Jul 2021 09:22:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=PVNqoE6fww70mSM52CJsWJtQAPYJj4A5gkeV0Zc3C6k=; b=6pVQK59y1p+THU6icnbgv/3IdH
	WprsG3bnmUddxrnvYokSPmmYt3vtl9OFpPEvUXk0V7iHGApOzJjKuX2o1Dj0hutDgr6sQfroYd5U0
	x0xFRFlgim9QJEFpewKRW8p249DYGN5MTnlN2Mh+WcM7bUP74RX+RnFcDyF8jlXpNnX8=;
Subject: Re: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
 domain construction
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-9-penny.zheng@arm.com>
 <f613372a-eac8-f79b-2941-b7cce3e1e0e7@xen.org>
 <VE1PR08MB52155D35A7B716DC7337311DF71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4df299a5-e13b-f235-f9e3-245b50e0313d@xen.org>
Date: Tue, 6 Jul 2021 10:22:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB52155D35A7B716DC7337311DF71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/07/2021 07:31, Penny Zheng wrote:
> Hi

Hi,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Saturday, July 3, 2021 9:26 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>
>> Subject: Re: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
>> domain construction
>>
>> Hi Penny,
>>
>> On 07/06/2021 03:43, Penny Zheng wrote:
>>> This commit checks `xen,static-mem` device tree property in /domUx
>>> node, to determine whether domain is on Static Allocation, when
>>> constructing domain during boot-up.
>>>
>>> Right now, the implementation of allocate_static_memory is missing,
>>> and will be introduced later. It just BUG() out at the moment.
>>>
>>> And if the `memory` property and `xen,static-mem` are both set, it
>>> shall be verified that if the memory size defined in both is consistent.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> changes v2:
>>> - remove parsing procedure here
>>> - check the consistency when `xen,static-mem` and `memory` are both
>>> defined
>>> ---
>>>    xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++---
>> ---
>>>    1 file changed, 31 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 282416e74d..4166d7993c 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2424,23 +2424,47 @@ static int __init construct_domU(struct domain
>> *d,
>>>    {
>>>        struct kernel_info kinfo = {};
>>>        int rc;
>>> -    u64 mem;
>>> +    u64 mem, static_mem_size = 0;
>>> +    const struct dt_property *prop;
>>> +    bool static_mem = false;
>>> +
>>> +    d->max_pages = ~0U;
>>> +    /*
>>> +     * Guest RAM could be of static memory from static allocation,
>>> +     * which will be specified through "xen,static-mem" phandle.
>>> +     */
>>> +    prop = dt_find_property(node, "xen,static-mem", NULL);
>>> +    if ( prop )
>>> +    {
>>> +        static_mem = true;
>>> +        /* static_mem_size = allocate_static_memory(...); */
>>> +        BUG();
>>> +    }
>>
>> I would prefer if the static memory is allocated close to
>> allocate_memory() below. AFAICT, the reason you allocate here is because you
>> want to have the property "memory" optional.
>>
>> However, I am not entirely convinced this is a good idea to make optional. It
>> would be easier for a reader to figure out from the device-tree how much
>> memory we give to the guest.
>>
> 
> Hmmm, now I think maybe I understand wrongly what you suggested in v1.
> "
> Could we allocate the memory as we parse?
> "
> I just simply think it means the code sequence, putting allocation immediately
> after parsing. ;/

I really meant "parse and allocate" in a iteration. My comment this time 
is the parsing/allocation for static memory should happen close to when 
the allocation for dynamic memory is done.

After all you are allocating memory for domain, so it makes more sense 
to have the two different way to allocate cloe to each other.

> 
> Re-investigating the docs on "memory":
> 
> "
> - memory
> 
>      A 64-bit integer specifying the amount of kilobytes of RAM to
>      allocate to the guest.
> "
> If you prefer "memory" mandate, then tbh, it will make the code
> here more easily-read, no ifs.
> But maybe I shall put more info on docs to clarify that even though user using
> "xen, static-mem" to refer to static memory allocation, they shall still use
> "memory" property to tell how much memory we give to the guest.

Hmm... I am not sure this is necessary, the property "memory" is not 
marked as optional even after your patch.

However, I would clarify that all the memory should either be allocated 
statically or dynamically...

Cheers,

-- 
Julien Grall

