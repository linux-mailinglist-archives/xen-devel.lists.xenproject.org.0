Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB52B0739
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 15:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25904.53973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdDDg-0003Ny-8h; Thu, 12 Nov 2020 14:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25904.53973; Thu, 12 Nov 2020 14:05:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdDDg-0003NZ-5G; Thu, 12 Nov 2020 14:05:00 +0000
Received: by outflank-mailman (input) for mailman id 25904;
 Thu, 12 Nov 2020 14:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdDDe-0003NU-Sn
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 14:04:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b5cb250-830d-440b-8756-2374231517c5;
 Thu, 12 Nov 2020 14:04:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6E14AB95;
 Thu, 12 Nov 2020 14:04:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdDDe-0003NU-Sn
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 14:04:58 +0000
X-Inumbo-ID: 1b5cb250-830d-440b-8756-2374231517c5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1b5cb250-830d-440b-8756-2374231517c5;
	Thu, 12 Nov 2020 14:04:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605189895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EoIcCy8PnJAA8P2tB2IZGX8XNkRFEmH/mGghqvTDQ6s=;
	b=roFNOIGmRazYQ6DQucbtNcHIAoW3a41HfeXpS1QSIY6mDf9fPbYzcTVJQes/+3z7X6C0En
	uFFd0Fhap7nZYTFvNXYBuRXOsO/EsAfPsdveddF8XSqWpRZcjnFlAzO64Pq9w94cj5MbT/
	ZAJzGnOuSilpuMcYLtQoPm88FAjFU9w=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6E14AB95;
	Thu, 12 Nov 2020 14:04:55 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
 <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
 <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
 <20201111121730.pblsf6inot5gixfc@Air-de-Roger>
 <7f916527-9a9c-8afe-5e5c-781554d1bd73@suse.com>
 <20201112130709.r3acpkrkyck6arul@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51e646d4-3e1b-3698-c649-a39840275ec9@suse.com>
Date: Thu, 12 Nov 2020 15:04:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201112130709.r3acpkrkyck6arul@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.11.2020 14:07, Roger Pau Monné wrote:
> On Thu, Nov 12, 2020 at 01:29:33PM +0100, Jan Beulich wrote:
>> On 11.11.2020 13:17, Roger Pau Monné wrote:
>>> On Tue, Nov 10, 2020 at 03:50:44PM +0100, Jan Beulich wrote:
>>>> On 10.11.2020 14:59, Roger Pau Monné wrote:
>>>>> On Wed, Oct 28, 2020 at 10:24:53AM +0100, Jan Beulich wrote:
>>>>>> --- a/xen/arch/x86/mm/p2m-pt.c
>>>>>> +++ b/xen/arch/x86/mm/p2m-pt.c
>>>>>> @@ -122,17 +122,55 @@ static int write_p2m_entry(struct p2m_do
>>>>>>  {
>>>>>>      struct domain *d = p2m->domain;
>>>>>>      struct vcpu *v = current;
>>>>>> -    int rc = 0;
>>>>>>  
>>>>>>      if ( v->domain != d )
>>>>>>          v = d->vcpu ? d->vcpu[0] : NULL;
>>>>>>      if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
>>>>>>           p2m_is_nestedp2m(p2m) )
>>>>>> -        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
>>>>>> +    {
>>>>>> +        unsigned int oflags;
>>>>>> +        mfn_t omfn;
>>>>>> +        int rc;
>>>>>> +
>>>>>> +        paging_lock(d);
>>>>>> +
>>>>>> +        if ( p2m->write_p2m_entry_pre )
>>>>>> +            p2m->write_p2m_entry_pre(d, gfn, p, new, level);
>>>>>> +
>>>>>> +        oflags = l1e_get_flags(*p);
>>>>>> +        omfn = l1e_get_mfn(*p);
>>>>>> +
>>>>>> +        rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
>>>>>> +                              p2m_flags_to_type(oflags), l1e_get_mfn(new),
>>>>>> +                              omfn, level);
>>>>>> +        if ( rc )
>>>>>> +        {
>>>>>> +            paging_unlock(d);
>>>>>> +            return rc;
>>>>>> +        }
>>>>>> +
>>>>>> +        safe_write_pte(p, new);
>>>>>> +
>>>>>> +        if ( p2m->write_p2m_entry_post )
>>>>>> +            p2m->write_p2m_entry_post(p2m, oflags);
>>>>>> +
>>>>>> +        paging_unlock(d);
>>>>>> +
>>>>>> +        if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
>>>>>> +             (oflags & _PAGE_PRESENT) &&
>>>>>> +             !p2m_get_hostp2m(d)->defer_nested_flush &&
>>>>>> +             /*
>>>>>> +              * We are replacing a valid entry so we need to flush nested p2ms,
>>>>>> +              * unless the only change is an increase in access rights.
>>>>>> +              */
>>>>>> +             (!mfn_eq(omfn, l1e_get_mfn(new)) ||
>>>>>> +              !perms_strictly_increased(oflags, l1e_get_flags(new))) )
>>>>>> +            p2m_flush_nestedp2m(d);
>>>>>
>>>>> It feel slightly weird to have a nested p2m hook post, and yet have
>>>>> nested specific code here.
>>>>>
>>>>> Have you considered if the post hook could be moved outside of the
>>>>> locked region, so that we could put this chunk there in the nested p2m
>>>>> case?
>>>>
>>>> Yes, I did, but I don't think the post hook can be moved out. The
>>>> only alternative therefore would be a 3rd hook. And this hook would
>>>> then need to be installed on the host p2m for nested guests, as
>>>> opposed to nestedp2m_write_p2m_entry_post, which gets installed in
>>>> the nested p2m-s. As said in the description, the main reason I
>>>> decided against a 3rd hook is that I suppose the code here isn't
>>>> HAP-specific (while prior to this patch it was).
>>>
>>> I'm not convinced the guest TLB flush needs to be performed while
>>> holding the paging lock. The point of such flush is to invalidate any
>>> intermediate guest visible translations that might now be invalid as a
>>> result of the p2m change, but the paging lock doesn't affect the guest
>>> in any way.
>>>
>>> It's true that the dirty_cpumask might change, but I think we only
>>> care that when returning from the function there are no stale cache
>>> entries that contain the now invalid translation, and this can be
>>> achieved equally by doing the flush outside of the locked region.
>>
>> I agree with all this. If only it was merely about TLB flushes. In
>> the shadow case, shadow_blow_all_tables() gets invoked, and that
>> one - looking at the other call sites - wants the paging lock held.
> 
> You got me confused here, I think you meant shadow_blow_tables?

Oh, yes, sorry - copy-and-paste from the wrong source.

> The post hook for shadow could pick the lock again, as I don't think
> the removal of the tables needs to be strictly done inside of the same
> locked region?

I think it does, or else a use of the now stale tables may occur
before they got blown away. Tim?

> Something to consider from a performance PoV.
> 
>> Additionally moving the stuff out of the locked region wouldn't
>> allow us to achieve the goal of moving the nested flush into the
>> hook, unless we introduced further hook handlers to be installed
>> on the host p2m-s of nested guests.
> 
> Right, or else we would also need to add that chunk in the
> non-nestedp2m hook also?

I'm a little confused by the question: If we wanted to move this
into the hook functions, it would need to be both hap's and
shadow's, i.e. _only_ the non-nested ones. IOW it could then
stay in hap's and be duplicated into shadow's. Avoiding the
duplication _and_ keeping it outside the locked region is why I
moved it into the common logic (provided, of course, I'm right
with my understanding of it also being needed in the shadow
case; else it could stay in the hap function alone), of which
the 2nd aspect would go away if the hook invocation itself lived
outside the locked region. But the duplication of this would
still concern me ...

> Maybe you could join both the nested and non-nested hooks and use a
> different dirty bitmap for the flush?

What would this gain us? Extra conditionals in a hook, when the
hook is (indirectly) to avoid having endless conditionals in the
common logic?

Jan

