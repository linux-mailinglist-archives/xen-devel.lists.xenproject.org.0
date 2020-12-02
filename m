Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BE2CBDB6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 14:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42697.76816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRof-0001DX-Es; Wed, 02 Dec 2020 13:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42697.76816; Wed, 02 Dec 2020 13:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRof-0001D8-BG; Wed, 02 Dec 2020 13:05:05 +0000
Received: by outflank-mailman (input) for mailman id 42697;
 Wed, 02 Dec 2020 13:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkRod-0001D3-8n
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:05:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6390fc0-9699-44fb-a241-26756a7f4d40;
 Wed, 02 Dec 2020 13:05:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E69F5AB63;
 Wed,  2 Dec 2020 13:05:00 +0000 (UTC)
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
X-Inumbo-ID: d6390fc0-9699-44fb-a241-26756a7f4d40
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606914301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U40an+7nBL5IpBLWBvRUSgZjOGexcNmNVctfmAFKDsE=;
	b=kNSqeSAo1Eg+AFhzIAPDp0sEesaPo/Vx3gmC3dvpX+VOKEALIlxfzK8HdtOWcRH/zvr8wK
	3FIiwSnDE+YJG95S9s5iKj3frfds8FIklEFMOlmqKSC4VUARi2+2PKr3JfUF3RYzzSeuij
	DE/HHlaewHIHpXQ+aFU1IErIcPP8hgU=
Subject: Re: [PATCH] x86/vmap: handle superpages in vmap_to_mfn()
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <34de4c4326673c60d3e2cbd3bbcbcca481906524.1606755042.git.hongyxia@amazon.com>
 <ef127c6f-2d8a-1ddf-f8e7-7e747518c5a8@suse.com>
 <6409ea31aa21fa54ef2697b0ce959bbf7b5e2a23.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b6f7075-1c91-562f-cb24-878ac373001c@suse.com>
Date: Wed, 2 Dec 2020 14:05:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6409ea31aa21fa54ef2697b0ce959bbf7b5e2a23.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 13:17, Hongyan Xia wrote:
> On Wed, 2020-12-02 at 11:04 +0100, Jan Beulich wrote:
>> On 30.11.2020 17:50, Hongyan Xia wrote:
>>> +    l3page = virt_to_page(pl3e);
>>> +    L3T_LOCK(l3page);
>>> +
>>> +    ASSERT(l3e_get_flags(*pl3e) & _PAGE_PRESENT);
>>> +    if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
>>> +    {
>>> +        ret = mfn_add(l3e_get_mfn(*pl3e),
>>> +                      (l2_offset << PAGETABLE_ORDER) + l1_offset);
>>> +        L3T_UNLOCK(l3page);
>>> +        return ret;
>>
>> To keep the locked region as narrow as possible
>>
>>         mfn = l3e_get_mfn(*pl3e);
>>         L3T_UNLOCK(l3page);
>>         return mfn_add(mfn, (l2_offset << PAGETABLE_ORDER) +
>> l1_offset);
>>
>> ? However, in particular because of the recurring unlocks on
>> the exit paths I wonder whether it wouldn't be better to
>> restructure the whole function such that there'll be one unlock
>> and one return. Otoh I'm afraid what I'm asking for here is
>> going to yield a measurable set of goto-s ...
> 
> I can do that.
> 
> But what about the lock narrowing? Will be slightly more tricky when
> there is goto. Naturally:
> 
>     ret = full return mfn;
>     goto out;
> 
> out:
>     UNLOCK();
>     return ret;
> 
> but with narrowing, my first reaction is:
> 
>     ret = high bits of mfn;
>     l2_offset = 0;
>     l1_offset = 0;
>     goto out;
> 
> out:
>     UNLOCK();
>     return mfn + l2_offset << TABLE_ORDER + l1_offset;
> 
> To be honest, I doubt it is really worth it and I prefer the first one.

That's why I said "However ..." - I did realize both won't fit
together very well.

>>> +    }
>>> +
>>> +    pl2e = map_l2t_from_l3e(*pl3e) + l2_offset;
>>> +    ASSERT(l2e_get_flags(*pl2e) & _PAGE_PRESENT);
>>> +    if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
>>> +    {
>>> +        ret = mfn_add(l2e_get_mfn(*pl2e), l1_offset);
>>> +        L3T_UNLOCK(l3page);
>>> +        return ret;
>>> +    }
>>> +
>>> +    pl1e = map_l1t_from_l2e(*pl2e) + l1_offset;
>>> +    UNMAP_DOMAIN_PAGE(pl2e);
>>> +    ASSERT(l1e_get_flags(*pl1e) & _PAGE_PRESENT);
>>> +    ret = l1e_get_mfn(*pl1e);
>>> +    L3T_UNLOCK(l3page);
>>> +    UNMAP_DOMAIN_PAGE(pl1e);
>>> +
>>> +    return ret;
>>> +}
>>
>> Now for the name of the function: The only aspect tying it
>> somewhat to vmap() is that it assumes (asserts) it'll find a
>> valid mapping. I think it wants renaming, and vmap_to_mfn()
>> then would become a #define of it (perhaps even retaining
>> its property of getting unsigned long passed in), at which
>> point it also doesn't need moving out of page.h. As to the
>> actual name, xen_map_to_mfn() to somewhat match up with
>> map_pages_to_xen()?
> 
> I actually really like this idea. I will come up with something in the
> next rev. But if we want to make it generic, shouldn't we not ASSERT on
> pl*e and the PRESENT flag and just return INVALID_MFN? Then this
> function works on both mapped address (assumption of vmap_to_mfn()) and
> other use cases.

Depends - we can still document that this function is going to
require a valid mapping. I did consider the generalization, too,
but this to a certain degree also collides with virt_to_xen_l3e()
allocating an L3 table, which isn't what we would want for a
fully generic lookup function. IOW - I'm undecided and will take
it from wherever you move it (albeit with no promise to not ask
for further adjustment).

Jan

