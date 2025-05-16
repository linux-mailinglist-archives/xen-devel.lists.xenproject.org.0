Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E2ABA4BD
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 22:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987517.1372722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG1mO-0004p5-NZ; Fri, 16 May 2025 20:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987517.1372722; Fri, 16 May 2025 20:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG1mO-0004mH-Jq; Fri, 16 May 2025 20:35:40 +0000
Received: by outflank-mailman (input) for mailman id 987517;
 Fri, 16 May 2025 20:35:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uG1mN-0004mB-3e
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 20:35:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uG1mM-00Cck7-1e;
 Fri, 16 May 2025 20:35:38 +0000
Received: from [2a02:8012:3a1:0:68b3:5dd7:abfd:37e0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uG1mL-002aHf-1w;
 Fri, 16 May 2025 20:35:37 +0000
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
	bh=wia0T3l6wurn0pR+m2+jo1AHUTO8duc9QYz8LHR5xNM=; b=FPIJbqf9lf8Ryb1cyoiYIlF3C8
	WdbDmqoRFhatnpOqBCTTgslZXnJVgyT1vU9gqQVMCSdQpbd0P5+ub3vD9pSGBfy3f7cPlaoR1XIjZ
	5oY3HGdUXlVUp8LtnEk3EkGu6ujCT1LhjFrp4MjxuagIfxpeFv+OtWif9TGSDxyN9YUc=;
Message-ID: <2e5afdf1-3913-4b6f-86ea-21b3ccd0833c@xen.org>
Date: Fri, 16 May 2025 21:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] xen/domain: unify domain ID allocation
Content-Language: en-GB
To: dmkhn@proton.me, Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250516020434.1145337-1-dmukhin@ford.com>
 <20250516020434.1145337-2-dmukhin@ford.com>
 <3c9f60b3-cedb-4689-a3b4-15ebddcf9f67@vates.tech> <aCd+vEOrQcbCYFgY@kraken>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aCd+vEOrQcbCYFgY@kraken>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis and Teddy,

I haven't looked at the rest of the series. Just answering
to the discussion between both of you.

On 16/05/2025 19:06, dmkhn@proton.me wrote:
> On Fri, May 16, 2025 at 08:43:35AM +0000, Teddy Astie wrote:
>>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>>> index 2c56f13771..9236dbae11 100644
>>> --- a/xen/common/device-tree/dom0less-build.c
>>> +++ b/xen/common/device-tree/dom0less-build.c
>>> @@ -850,15 +850,13 @@ void __init create_domUs(void)
>>>            struct xen_domctl_createdomain d_cfg = {0};
>>>            unsigned int flags = 0U;
>>>            bool has_dtb = false;
>>> +        domid_t domid;
>>>            uint32_t val;
>>>            int rc;
>>>
>>>            if ( !dt_device_is_compatible(node, "xen,domain") )
>>>                continue;
>>>
>>> -        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>> -            panic("No more domain IDs available\n");
>>> -
>>>            d_cfg.max_evtchn_port = 1023;
>>>            d_cfg.max_grant_frames = -1;
>>>            d_cfg.max_maptrack_frames = -1;
>>> @@ -981,7 +979,11 @@ void __init create_domUs(void)
>>>             * very important to use the pre-increment operator to call
>>>             * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
>>>             */
>>> -        d = domain_create(++max_init_domid, &d_cfg, flags);
>>> +        domid = domid_alloc(++max_init_domid);
>>> +        if ( domid == DOMID_INVALID )
>>> +            panic("Error allocating ID for domain %s\n", dt_node_name(node));
>>> +
>>> +        d = domain_create(domid, &d_cfg, flags);
>>>            if ( IS_ERR(d) )
>>>                panic("Error creating domain %s (rc = %ld)\n",
>>>                      dt_node_name(node), PTR_ERR(d));
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index abf1969e60..0ba3cdc47d 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -66,6 +66,74 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>>>    static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>>>    struct domain *domain_list;
>>>
>>> +/* Non-system domain ID allocator. */
>>> +static DEFINE_SPINLOCK(domid_lock);
>>> +static struct rangeset *domid_rangeset;
>>> +static unsigned int domid_last;
>>> +
>>> +void __init domid_init(void)
>>> +{
>>> +    domid_rangeset = rangeset_new(NULL, "domid", RANGESETF_prettyprint_hex);
>>> +    if ( !domid_rangeset )
>>> +        panic("cannot allocate domain ID rangeset\n");
>>> +
>>> +    rangeset_limit(domid_rangeset, DOMID_FIRST_RESERVED);
>>> +}
>>> +
>>> +/*
>>> + * Allocate new non-system domain ID based on the hint.
>>> + *
>>> + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of IDs,
>>> + * perform an exhaustive search starting from the end of the used domain ID
>>> + * range.
>>> + */
>>> +domid_t domid_alloc(domid_t domid)
>>> +{
>>> +    spin_lock(&domid_lock);
>>> +
>>> +    if ( domid < DOMID_FIRST_RESERVED )
>>> +    {
>>> +        if ( rangeset_contains_singleton(domid_rangeset, domid) )
>>> +            domid = DOMID_INVALID;
>>> +    }
>>> +    else
>>> +    {
>>> +        for ( domid = domid_last + 1; domid != domid_last; domid++ )
>>> +        {
>>> +            if ( domid == DOMID_FIRST_RESERVED )
>>> +                domid = 0;
>>> +
>>> +            if ( !rangeset_contains_singleton(domid_rangeset, domid) )
>>> +                break;
>>> +        }
>>> +
>>> +        if ( domid == domid_last )
>>> +            domid = DOMID_INVALID;
>>> +    }
>>> +
>>> +    if ( domid != DOMID_INVALID )
>>> +    {
>>> +        ASSERT(!rangeset_add_singleton(domid_rangeset, domid));
>>> +
>>> +        if ( domid != domid_last )
>>> +            domid_last = domid;
>>> +    }
>>> +
>>> +    spin_unlock(&domid_lock);
>>> +
>>> +    return domid;
>>> +}
>>
>> It's mostly a matter of implementation choice, but I am not really fan
>> of relying on rangesets, which to me are meant for address ranges or
>> something similar but at least large.
>>
>> I would rather rely on a bitmap using find_first_zero_bit+set_bit which
>> avoids doing a per-domid test, and may be simpler overall. The bitmap
>> size for 0x3FF0 domains is almost 4KB, which looks acceptable.

I guess you meant 0x7FF0?

>>
>> I don't know what other thinks.
> 
> Thanks for taking a look!
> 
> TBH, I was initially considering using a bitmap. But then I chose use rangesets
> because statically defined bitmap will increase the binary size, which may be
> indesirable; and for dynamic allocation, rangeset has all convenience APIs
> implemented...

The bitmap helpers have been optimized for fast lookup and insertion. 
They could also potentially be used lockless.

On the other hand, the rangeset is a linear search from start. So for 
instance, AFAIU, "rangeset_contains_singleton()" will start looking up 
from the first range until it found the highest range lower or 
containing the singleton. It also contains an internal read-write lock. 
So we are taking two locks now.

This means the loop:

 > for ( domid = domid_last + 1; domid != domid_last; domid++ )
 >    [...]
 >    if ( !rangeset_contains_singleton(...) )

is going to be fairly ineffient. I haven't check whether we can do 
better with the rangeset.

Also, the overhead of a range is actually quite high if the domain IDs 
are not contiguous (for Arm 64-bit, it is 16-byte per range and 72-byte 
for the the rangeset structure).

Lastly, as you pointed out this is requiring dynamic allocation. Which 
means domid_alloc() could now fail because Xen is out of memory. This 
feels a little be odd to have domid_alloc() returning -ENOMEM.

BTW, I noticed in your code you are using:

ASSERT(!rangeset_add_singleton(...))

In production build, ASSERTs() behaves like a NOP:

#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)

So rangeset_add_singleton() would not be called at all. This is also not 
the right way to handle failure that can happen at runtime. Instead, the 
error should be propagated.

Overall, I think a bitmap is more suitable to keep track of the domids 
allocated.

To make clear, I think increase the binary by 4KB is fine in this case. 
If someone is really concern of the increase, they would most likely not 
try to run 4KB domains, so we could potentially introduce 
CONFIG_MAX_DOMAIN to reduce the bitmap size and the number of domains 
(it is not a ask for this series).

Cheers,

-- 
Julien Grall


