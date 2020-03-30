Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB3197607
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 09:54:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIpDP-0004An-7C; Mon, 30 Mar 2020 07:52:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIpDN-0004Af-FK
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 07:52:09 +0000
X-Inumbo-ID: 5aaa6721-725b-11ea-8e8d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5aaa6721-725b-11ea-8e8d-12813bfff9fa;
 Mon, 30 Mar 2020 07:52:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 12FBDAC94;
 Mon, 30 Mar 2020 07:52:08 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-6-julien@xen.org>
 <b0d29ded-f0e8-013b-de43-22788cd8f599@suse.com>
 <2be87441-05a6-6b58-23e3-da467230ffe7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf983d3e-125a-621a-f81d-2f9955ec86eb@suse.com>
Date: Mon, 30 Mar 2020 09:52:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2be87441-05a6-6b58-23e3-da467230ffe7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 05/17] xen/x86: Remove the non-typesafe
 version of pagetable_* helpers
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.03.2020 11:52, Julien Grall wrote:
> On 26/03/2020 15:39, Jan Beulich wrote:
>> On 22.03.2020 17:14, julien@xen.org wrote:
>>> @@ -3116,24 +3116,24 @@ int vcpu_destroy_pagetables(struct vcpu *v)
>>>         /* Free that page if non-zero */
>>>       do {
>>> -        if ( mfn )
>>> +        if ( !mfn_eq(mfn, _mfn(0)) )
>>
>> I admit I'm not fully certain either, but at the first glance
>>
>>          if ( mfn_x(mfn) )
>>
>> would seem more in line with the original code to me (and then
>> also elsewhere).
> 
> It is doing *exactly* the same things. The whole point of typesafe
> is to use typesafe helper not open-coding test everywhere.
> 
> It is also easier to spot any use of MFN 0 within the code as you
> know could grep "_mfn(0)".
> 
> Therefore I will insist to the code as-is.

What I insit on is that readability of the result of such changes be
also kept in mind. The mfn_eq() construct is (I think) clearly less
easy to read and recognize than the simpler alternative suggested.
If you want to avoid mfn_x(), how about introducing (if possible
limited to x86, assuming that MFN 0 has no special meaning on Arm)
mfn_zero()?

>>> @@ -3560,19 +3561,18 @@ long do_mmuext_op(
>>>               if ( unlikely(rc) )
>>>                   break;
>>>   -            old_mfn = pagetable_get_pfn(curr->arch.guest_table_user);
>>> +            old_mfn = pagetable_get_mfn(curr->arch.guest_table_user);
>>>               /*
>>>                * This is particularly important when getting restarted after the
>>>                * previous attempt got preempted in the put-old-MFN phase.
>>>                */
>>> -            if ( old_mfn == op.arg1.mfn )
>>> +            if ( mfn_eq(old_mfn, new_mfn) )
>>>                   break;
>>>   -            if ( op.arg1.mfn != 0 )
>>> +            if ( !mfn_eq(new_mfn, _mfn(0)) )
>>
>> At least here I would clearly prefer the old code to be kept.
> 
> See above.

I don't agree - here you're evaluating an aspect of the public
interface. MFN 0 internally having a special meaning is, while
connected to this aspect, still an implementation detail.

>>> @@ -3580,19 +3580,19 @@ long do_mmuext_op(
>>>                       else if ( rc != -ERESTART )
>>>                           gdprintk(XENLOG_WARNING,
>>>                                    "Error %d installing new mfn %" PRI_mfn "\n",
>>> -                                 rc, op.arg1.mfn);
>>> +                                 rc, mfn_x(new_mfn));
>>
>> Here I'm also not sure I see the point of the conversion.
> 
> op.arg1.mfn and mfn are technically not the same type. The
> former is a xen_pfn_t, whilst the latter is mfn_t.
> 
> In practice they are both unsigned long on x86, so it should
> be fine to use PRI_mfn. However, I think this is an abuse
> and we should aim to use the proper PRI_* for a type.

I'd be fine with switching to PRI_xen_pfn here, yes. But
especially with the "not the same type" argument what should
be logged is imo what was specified, not what we converted it
to.

>>> @@ -213,17 +214,17 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>>>   #ifndef __ASSEMBLY__
>>>     /* Page-table type. */
>>> -typedef struct { u64 pfn; } pagetable_t;
>>> -#define pagetable_get_paddr(x)  ((paddr_t)(x).pfn << PAGE_SHIFT)
>>> +typedef struct { mfn_t mfn; } pagetable_t;
>>> +#define PAGETABLE_NULL_MFN      _mfn(0)
>>
>> I'd prefer to get away without this constant.
> I would rather keep the constant as it makes easier to
> understand what _mfn(0) means in the context of the pagetable.

If this was used outside of the accessor definitions, I'd
probably agree. But the accessor definitions exist specifically
to abstract away such things from use sites. Hence, bike-
shedding or not, if Andrew was clearly agreeing with your view,
I'd accept it. If he's indifferent, I'd prefer the #define to
be dropped.

Jan

