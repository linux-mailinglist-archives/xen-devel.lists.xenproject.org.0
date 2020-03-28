Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBC6196519
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 11:36:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI8mx-0003YC-Bk; Sat, 28 Mar 2020 10:34:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eoyf=5N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jI8mv-0003Y7-Bd
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 10:34:01 +0000
X-Inumbo-ID: a250130e-70df-11ea-8b2b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a250130e-70df-11ea-8b2b-12813bfff9fa;
 Sat, 28 Mar 2020 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pT1nQqivj0up9gyWl0CfF5tqqDD1dzEKO4x1O3sJYZo=; b=fpw62yqr8Jas7JgBzctZgnEtla
 tHOy015Cu2XVfck31a0bMjnfNOr6aalRRCaUoqGL+nsTLnd/myWawT1ADG3O/SC0pzMgBT14Ea5l5
 5bkquThrHRHrYYTVmdE6yuErkRjQEqFgAo4bBvEhnluh/qOipqHLgqlXjLG5guC53i6E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI8mk-0007UM-H3; Sat, 28 Mar 2020 10:33:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI8mk-0005tO-3q; Sat, 28 Mar 2020 10:33:50 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-5-julien@xen.org>
 <ae87e95c-b897-4057-0400-944764734875@suse.com>
 <fe0e2e69-0e27-e4c9-a5c0-17dddcdee6e5@xen.org>
 <d48b93a3-c778-9f66-78ec-eb40d129a565@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5d554850-34eb-5ff7-6904-a304e444f4a6@xen.org>
Date: Sat, 28 Mar 2020 10:33:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d48b93a3-c778-9f66-78ec-eb40d129a565@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi,

On 26/03/2020 09:09, Jan Beulich wrote:
> On 25.03.2020 19:21, Julien Grall wrote:
>> On 25/03/2020 15:27, Jan Beulich wrote:
>>> On 22.03.2020 17:14, julien@xen.org wrote:
>>>> @@ -785,21 +781,21 @@ bool is_iomem_page(mfn_t mfn)
>>>>        return (page_get_owner(page) == dom_io);
>>>>    }
>>>>    -static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
>>>> +static int update_xen_mappings(mfn_t mfn, unsigned int cacheattr)
>>>>    {
>>>>        int err = 0;
>>>> -    bool alias = mfn >= PFN_DOWN(xen_phys_start) &&
>>>> -         mfn < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>>>> +    bool alias = mfn_x(mfn) >= PFN_DOWN(xen_phys_start) &&
>>>> +         mfn_x(mfn) < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>>>>        unsigned long xen_va =
>>>> -        XEN_VIRT_START + ((mfn - PFN_DOWN(xen_phys_start)) << PAGE_SHIFT);
>>>> +        XEN_VIRT_START + mfn_to_maddr(mfn_add(mfn, -PFN_DOWN(xen_phys_start)));
>>>
>>> Depending on the types involved (e.g. in PFN_DOWN()) this may
>>> or may not be safe, so I consider such a transformation at
>>> least fragile. I think we either want to gain mfn_sub() or
>>> keep this as a "real" subtraction.
>> I want to avoid mfn_x() as much as possible when everything can
>> be done using typesafe operation. But i am not sure how
>> mfn_sub() would solve the problem. Do you mind providing more
>> information?
> 
> Consider PFN_DOWN() potentially returning "unsigned int". The
> negation of an unsigned int is still an unsigned int, and hence
> e.g. -1U (which might result here) is really 0xFFFFFFFF rather
> than -1L / -1UL as intended. Whereas with mfn_sub() the
> conversion to unsigned long of the (positive) value to subtract
> would occur as part of evaluating function arguments, and the
> resulting subtraction would then be correct.

I will have a look to introduce mfn_sub().

> 
>>>> @@ -584,21 +584,21 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>>>>            needed = 0;
>>>>        }
>>>>        else if ( *use_tail && nr >= needed &&
>>>> -              arch_mfn_in_directmap(mfn + nr) &&
>>>> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, nr))) &&
>>>>                  (!xenheap_bits ||
>>>> -               !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>>> +               !((mfn_x(mfn) + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>>
>>> May I suggest consistency here: This one uses +, while ...
>>>
>>>>        {
>>>> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
>>>> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
>>>> +        _heap[node] = mfn_to_virt(mfn_add(mfn, nr - needed));
>>>> +        avail[node] = mfn_to_virt(mfn_add(mfn, nr - 1)) +
>>>>                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
>>>>        }
>>>>        else if ( nr >= needed &&
>>>> -              arch_mfn_in_directmap(mfn + needed) &&
>>>> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, needed))) &&
>>>
>>> ... this one uses mfn_add() despite the mfn_x() around it, and ...
>>
>> So the reason I used mfn_x(mfn_add(mfn, needed)) here is I plan
>> to convert arch_mfn_in_directmap() to use typesafe soon. In the
>> two others cases...
>>
>>>>                  (!xenheap_bits ||
>>>> -               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>>> +               !((mfn_x(mfn) + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>>>
>>> ... here you use + again. My personal preference would be to avoid
>>> constructs like mfn_x(mfn_add()).
>>
>> ... I am still unsure how to avoid mfn_x(). Do you have any ideas?
> 
> I don't see how it can be avoided right now. But I also don't see
> why - for consistency, as said - you couldn't use mfn_x() also in
> the middle case. You could then still convert to mfn_add() with
> that future change of yours.

I could have as I could also have converted arch_mfn_in_directmap() to 
use typesafe MFN. Anything around typesafe is a can of worms and this is 
the fine line I found.

Anyway, I could not be bother to bikeshed... So I going to switch the 
other one to mfn_x(...) + needed.

> 
>>>> --- a/xen/include/asm-x86/mm.h
>>>> +++ b/xen/include/asm-x86/mm.h
>>>> @@ -667,7 +667,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>>>>    {
>>>>        unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>>>>    -    return mfn <= (virt_to_mfn(eva - 1) + 1);
>>>> +    return mfn <= mfn_x(mfn_add(virt_to_mfn(eva - 1),  1));
>>>
>>> Even if you wanted to stick to using mfn_add() here, there's one
>>> blank too many after the comma.
>>
>> I will remove the extra blank. Regarding the construction, I have
>> been wondering for a couple of years now whether we should
>> introduce mfn_{lt, gt}. What do you think?
> 
> I too have been wondering, and wouldn't mind their introduction
> (plus mfn_le / mfn_ge perhaps). But it'll truly help you here
> anyway only once the function parameter is also mfn_t.

This is a longer term plan. So I am going to leave it like that for now 
until I manage to find time.

Cheers,

-- 
Julien Grall

