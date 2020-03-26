Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33176193B85
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:12:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOVh-0004U9-Gx; Thu, 26 Mar 2020 09:09:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHOVg-0004U4-AY
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:09:08 +0000
X-Inumbo-ID: 724209c8-6f41-11ea-877b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 724209c8-6f41-11ea-877b-12813bfff9fa;
 Thu, 26 Mar 2020 09:09:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED1ABAF22;
 Thu, 26 Mar 2020 09:09:05 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-5-julien@xen.org>
 <ae87e95c-b897-4057-0400-944764734875@suse.com>
 <fe0e2e69-0e27-e4c9-a5c0-17dddcdee6e5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d48b93a3-c778-9f66-78ec-eb40d129a565@suse.com>
Date: Thu, 26 Mar 2020 10:09:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <fe0e2e69-0e27-e4c9-a5c0-17dddcdee6e5@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 04/17] xen: Convert virt_to_mfn() and
 mfn_to_virt() to use typesafe MFN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 19:21, Julien Grall wrote:
> On 25/03/2020 15:27, Jan Beulich wrote:
>> On 22.03.2020 17:14, julien@xen.org wrote:
>>> @@ -785,21 +781,21 @@ bool is_iomem_page(mfn_t mfn)
>>>       return (page_get_owner(page) == dom_io);
>>>   }
>>>   -static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
>>> +static int update_xen_mappings(mfn_t mfn, unsigned int cacheattr)
>>>   {
>>>       int err = 0;
>>> -    bool alias = mfn >= PFN_DOWN(xen_phys_start) &&
>>> -         mfn < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>>> +    bool alias = mfn_x(mfn) >= PFN_DOWN(xen_phys_start) &&
>>> +         mfn_x(mfn) < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>>>       unsigned long xen_va =
>>> -        XEN_VIRT_START + ((mfn - PFN_DOWN(xen_phys_start)) << PAGE_SHIFT);
>>> +        XEN_VIRT_START + mfn_to_maddr(mfn_add(mfn, -PFN_DOWN(xen_phys_start)));
>>
>> Depending on the types involved (e.g. in PFN_DOWN()) this may
>> or may not be safe, so I consider such a transformation at
>> least fragile. I think we either want to gain mfn_sub() or
>> keep this as a "real" subtraction.
> I want to avoid mfn_x() as much as possible when everything can
> be done using typesafe operation. But i am not sure how
> mfn_sub() would solve the problem. Do you mind providing more
> information?

Consider PFN_DOWN() potentially returning "unsigned int". The
negation of an unsigned int is still an unsigned int, and hence
e.g. -1U (which might result here) is really 0xFFFFFFFF rather
than -1L / -1UL as intended. Whereas with mfn_sub() the
conversion to unsigned long of the (positive) value to subtract
would occur as part of evaluating function arguments, and the
resulting subtraction would then be correct.

>>> @@ -584,21 +584,21 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>>>           needed = 0;
>>>       }
>>>       else if ( *use_tail && nr >= needed &&
>>> -              arch_mfn_in_directmap(mfn + nr) &&
>>> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, nr))) &&
>>>                 (!xenheap_bits ||
>>> -               !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>> +               !((mfn_x(mfn) + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>
>> May I suggest consistency here: This one uses +, while ...
>>
>>>       {
>>> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
>>> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
>>> +        _heap[node] = mfn_to_virt(mfn_add(mfn, nr - needed));
>>> +        avail[node] = mfn_to_virt(mfn_add(mfn, nr - 1)) +
>>>                         PAGE_SIZE - sizeof(**avail) * NR_ZONES;
>>>       }
>>>       else if ( nr >= needed &&
>>> -              arch_mfn_in_directmap(mfn + needed) &&
>>> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, needed))) &&
>>
>> ... this one uses mfn_add() despite the mfn_x() around it, and ...
> 
> So the reason I used mfn_x(mfn_add(mfn, needed)) here is I plan
> to convert arch_mfn_in_directmap() to use typesafe soon. In the
> two others cases...
> 
>>>                 (!xenheap_bits ||
>>> -               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>> +               !((mfn_x(mfn) + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>
>> ... here you use + again. My personal preference would be to avoid
>> constructs like mfn_x(mfn_add()).
> 
> ... I am still unsure how to avoid mfn_x(). Do you have any ideas?

I don't see how it can be avoided right now. But I also don't see
why - for consistency, as said - you couldn't use mfn_x() also in
the middle case. You could then still convert to mfn_add() with
that future change of yours.

>>> --- a/xen/include/asm-x86/mm.h
>>> +++ b/xen/include/asm-x86/mm.h
>>> @@ -667,7 +667,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>>>   {
>>>       unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>>>   -    return mfn <= (virt_to_mfn(eva - 1) + 1);
>>> +    return mfn <= mfn_x(mfn_add(virt_to_mfn(eva - 1),  1));
>>
>> Even if you wanted to stick to using mfn_add() here, there's one
>> blank too many after the comma.
> 
> I will remove the extra blank. Regarding the construction, I have
> been wondering for a couple of years now whether we should
> introduce mfn_{lt, gt}. What do you think?

I too have been wondering, and wouldn't mind their introduction
(plus mfn_le / mfn_ge perhaps). But it'll truly help you here
anyway only once the function parameter is also mfn_t.

Jan

