Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D419763C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 10:13:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIpVW-0006Kw-78; Mon, 30 Mar 2020 08:10:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIpVU-0006Kr-JN
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 08:10:52 +0000
X-Inumbo-ID: f86fe654-725d-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f86fe654-725d-11ea-bec1-bc764e2007e4;
 Mon, 30 Mar 2020 08:10:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B4CF7AF95;
 Mon, 30 Mar 2020 08:10:50 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-17-julien@xen.org>
 <a3d120d0-d67f-bed2-4920-0d3a1c3090ea@suse.com>
 <c640eb5b-224f-e99a-daa2-6def00780e54@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de2c3932-9d8e-4f34-d966-4f0aaf372453@suse.com>
Date: Mon, 30 Mar 2020 10:10:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c640eb5b-224f-e99a-daa2-6def00780e54@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 16/17] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.03.2020 12:14, Julien Grall wrote:
> On 27/03/2020 13:15, Jan Beulich wrote:
>> On 22.03.2020 17:14, julien@xen.org wrote:
>>> @@ -983,19 +984,20 @@ long p2m_pt_audit_p2m(struct p2m_domain *p2m)
>>>                   /* check for 1GB super page */
>>>                   if ( l3e_get_flags(l3e[i3]) & _PAGE_PSE )
>>>                   {
>>> -                    mfn = l3e_get_pfn(l3e[i3]);
>>> -                    ASSERT(mfn_valid(_mfn(mfn)));
>>> +                    mfn = l3e_get_mfn(l3e[i3]);
>>> +                    ASSERT(mfn_valid(mfn));
>>>                       /* we have to cover 512x512 4K pages */
>>>                       for ( i2 = 0;
>>>                             i2 < (L2_PAGETABLE_ENTRIES * L1_PAGETABLE_ENTRIES);
>>>                             i2++)
>>>                       {
>>> -                        m2pfn = get_gpfn_from_mfn(mfn+i2);
>>> +                        m2pfn = get_pfn_from_mfn(mfn_add(mfn, i2));
>>>                           if ( m2pfn != (gfn + i2) )
>>>                           {
>>>                               pmbad++;
>>> -                            P2M_PRINTK("mismatch: gfn %#lx -> mfn %#lx -> gfn %#lx\n",
>>> -                                       gfn + i2, mfn + i2, m2pfn);
>>> +                            P2M_PRINTK("mismatch: gfn %#lx -> mfn %"PRI_mfn" gfn %#lx\n",
>>> +                                       gfn + i2, mfn_x(mfn_add(mfn, i2)),
>>
>> As in the earlier patch, "mfn_x(mfn) + i2" would be shorter and
>> hence imo preferable, especially in printk() and alike invocations.
> 
> The goal of using typesafe is to make the code safer not try to
> open-code everything because it might be shorter to write.

I'm not talking about "everything". As soon as you use mfn_x()
_anywhere_, type-safety is gone. Since in printk() and alike you
unavoidably have to use it (at least for now), there's no win
from using e.g. mfn_add() as you do here, imo. And hence the
readability aspect gets even higher significance.

>> I would also prefer if you left %#lx alone, with the 2nd best
>> option being to also use PRI_gfn alongside PRI_mfn. Primarily
>> I'd like to avoid having a mixture.
> The two options would be wrong:
>     * gfn is an unsigned long and not gfn_t, so using PRI_gfn would be incorrect
>     * mfn is now an mfn_t so using %lx would be incorrect
> 
> So the format string used in the patch is correct based on the types used.

Hmm, xen/mm.h suggests a partial connection between e.g. mfn_t
and PRI_mfn, yes, but I think this is unhelpful as long as
mfn_x() needs to be explicitly used when specifying the printk()
arguments. Instead I view PRI_mfn and alike as a more general
format usable also for MFNs stored in unsigned long rather than
mfn_t.

I agree though that views here may differ. Hence wider agreement
on what the intentions are (also mid/long term), and hence how
well formed code ought to look like, would seem necessary here.

> This...
> 
>>
>> Same (for both) at least one more time further down.
> 
> ... would likely be applicable for all the other uses.

Agreed.

>>> --- a/xen/include/asm-x86/mm.h
>>> +++ b/xen/include/asm-x86/mm.h
>>> @@ -500,9 +500,10 @@ extern paddr_t mem_hotplug;
>>>    */
>>>   extern bool machine_to_phys_mapping_valid;
>>>   -static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
>>> +static inline void set_pfn_from_mfn(mfn_t mfn_, unsigned long pfn)
>>>   {
>>> -    const struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn)));
>>> +    const unsigned long mfn = mfn_x(mfn_);
>>
>> I think it would be better overall if the parameter was named
>> "mfn" and there was no local variable altogether. This would
>> bring things in line with ...
> 
> You asked for this approach on the previous version [1]:
> 
> "Btw, the cheaper (in terms of code churn) change here would seem to
> be to name the function parameter mfn_, and the local variable mfn.
> That'll also reduce the number of uses of the unfortunate trailing-
> underscore-name."
> 
> So can you pick a side and stick with it?

Well, things like this happen when you see the final result, sorry.
And indeed I recalled commenting on this before, but upon searching
I didn't manage to find the earlier reply, to better justify what I
also suspected might have been a change of mind.

Jan

