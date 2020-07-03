Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF360213947
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 13:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrJmV-00012O-JG; Fri, 03 Jul 2020 11:22:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jrJmU-00012H-J6
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 11:22:58 +0000
X-Inumbo-ID: 8b5735c4-bd1f-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b5735c4-bd1f-11ea-bca7-bc764e2007e4;
 Fri, 03 Jul 2020 11:22:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B748AE65;
 Fri,  3 Jul 2020 11:22:56 +0000 (UTC)
Subject: Re: [PATCH v4 06/10] memory: batch processing in acquire_resource()
To: Julien Grall <julien@xen.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
 <5be6cb58-82d0-0a78-a9b2-5c078b5d3587@xen.org>
 <004901d65128$16a6f330$43f4d990$@xen.org>
 <481e8ee7-561a-10d6-4358-7b07a8911ce8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d45edef1-5b15-fdd4-b030-1ffe5c77057d@suse.com>
Date: Fri, 3 Jul 2020 13:22:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <481e8ee7-561a-10d6-4358-7b07a8911ce8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.07.2020 13:17, Julien Grall wrote:
> Hi,
> 
> On 03/07/2020 11:52, Paul Durrant wrote:
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Sent: 03 July 2020 11:36
>>> To: Michał Leszczyński <michal.leszczynski@cert.pl>; xen-devel@lists.xenproject.org
>>> Cc: luwei.kang@intel.com; tamas.lengyel@intel.com; Andrew Cooper <andrew.cooper3@citrix.com>; George
>>> Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich
>>> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; paul@xen.org
>>> Subject: Re: [PATCH v4 06/10] memory: batch processing in acquire_resource()
>>>
>>> (+ Paul as the author XENMEM_acquire_resource)
>>>
>>> Hi,
>>>
>>> On 30/06/2020 13:33, Michał Leszczyński wrote:
>>>> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>>>>
>>>> Allow to acquire large resources by allowing acquire_resource()
>>>> to process items in batches, using hypercall continuation.
>>>>
>>>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
>>>> ---
>>>>    xen/common/memory.c | 32 +++++++++++++++++++++++++++++---
>>>>    1 file changed, 29 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>>> index 714077c1e5..3ab06581a2 100644
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
>>>>    }
>>>>
>>>>    static int acquire_resource(
>>>> -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
>>>> +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
>>>> +    unsigned long *start_extent)
>>>>    {
>>>>        struct domain *d, *currd = current->domain;
>>>>        xen_mem_acquire_resource_t xmar;
>>>> +    uint32_t total_frames;
>>>>        /*
>>>>         * The mfn_list and gfn_list (below) arrays are ok on stack for the
>>>>         * moment since they are small, but if they need to grow in future
>>>> @@ -1077,8 +1079,17 @@ static int acquire_resource(
>>>>            return 0;
>>>>        }
>>>>
>>>> +    total_frames = xmar.nr_frames;
>>>
>>> On 32-bit, the start_extent would be 26-bits wide which is not enough to
>>> cover all the xmar.nr_frames. Therefore, you want that check that it is
>>> possible to encode a continuation. Something like:
>>>
>>> /* Is the size too large for us to encode a continuation? */
>>> if ( unlikely(xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT)) )
>>>
>>>> +
>>>> +    if ( *start_extent ) > +    {
>>>> +        xmar.frame += *start_extent;
>>>> +        xmar.nr_frames -= *start_extent;
>>>
>>> As start_extent is exposed to the guest, you want to check if it is not
>>> bigger than xmar.nr_frames.
>>>
>>>> +        guest_handle_add_offset(xmar.frame_list, *start_extent);
>>>> +    }
>>>> +
>>>>        if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
>>>> -        return -E2BIG;
>>>> +        xmar.nr_frames = ARRAY_SIZE(mfn_list);
>>>
>>> The documentation of the hypercall suggests that if you pass NULL, then
>>> it will return the maximum number value for nr_frames supported by the
>>> implementation. So technically a domain cannot use more than
>>> ARRAY_SIZE(mfn_list).
>>>
>>> However, you new addition conflict with the documentation. Can you
>>> clarify how a domain will know that it can use more than
>>> ARRAY_SIZE(mfn_list)?
>>
>> The domain should not need to know. It should be told the maximum number of frames of the type it wants. If we have to carve that up into batches inside Xen then the caller should not need to care, right?
> 
> In the current implementation, we tell the guest how many frames it can 
> request in a batch. This number may be much smaller that the maximum 
> number of frames of the type.
> 
> Furthermore this value is not tie to the xmar.type. Therefore, it is 
> valid for a guest to call this hypercall only once at boot to figure out 
> the maximum batch.
> 
> So while the change you suggest looks a good idea, I don't think it is 
> possible to do that with the current hypercall.

Doesn't the limit simply change to UINT_MAX >> MEMOP_EXTENT_SHIFT,
which then is what should be reported?

>>>> @@ -1135,6 +1146,14 @@ static int acquire_resource(
>>>>            }
>>>>        }
>>>>
>>>> +    if ( !rc )
>>>> +    {
>>>> +        *start_extent += xmar.nr_frames;
>>>> +
>>>> +        if ( *start_extent != total_frames )
>>>> +            rc = -ERESTART;
>>>> +    }
>>>> +
>>>>     out:
>>>>        rcu_unlock_domain(d);
>>>>
>>>> @@ -1600,7 +1619,14 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>
>>>>        case XENMEM_acquire_resource:
>>>>            rc = acquire_resource(
>>>> -            guest_handle_cast(arg, xen_mem_acquire_resource_t));
>>>> +            guest_handle_cast(arg, xen_mem_acquire_resource_t),
>>>> +            &start_extent);
>>>
>>> Hmmm... it looks like we forgot to check that start_extent is always 0
>>> when the hypercall was added.
>>>
>>> As this is exposed to the guest, it technically means that there no
>>> guarantee that start_extent will always be 0.
>>>
>>
>> I don't follow. A start extent != 0 means you are in a continuation. How can you check for 0 without breaking continuations?
> 
> I think you misundertood my point. My point is we never checked that 
> start_extent was 0. So a guest could validly pass a non-zero value to 
> start_extent and not break on older Xen release.
> 
> When this patch will be merged, such guest would behave differently. Or 
> did I miss any check/documentation for the start_extent value?

I think we may have done the same in the past already when enabling
sub-ops for use of continuations. A guest specifying a non-zero
start_extent itself is effectively a request for an undefined sub-op.
With, as a result, undefined behavior.

Jan

