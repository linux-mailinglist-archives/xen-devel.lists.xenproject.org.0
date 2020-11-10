Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DDE2AD946
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 15:51:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23485.50270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcUyu-0003FD-EF; Tue, 10 Nov 2020 14:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23485.50270; Tue, 10 Nov 2020 14:50:48 +0000
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
	id 1kcUyu-0003Eo-Aw; Tue, 10 Nov 2020 14:50:48 +0000
Received: by outflank-mailman (input) for mailman id 23485;
 Tue, 10 Nov 2020 14:50:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcUys-0003Ej-Rt
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:50:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2411ae47-7c1c-42bd-942f-fa6fdc7e244e;
 Tue, 10 Nov 2020 14:50:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85BECACF5;
 Tue, 10 Nov 2020 14:50:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcUys-0003Ej-Rt
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:50:46 +0000
X-Inumbo-ID: 2411ae47-7c1c-42bd-942f-fa6fdc7e244e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2411ae47-7c1c-42bd-942f-fa6fdc7e244e;
	Tue, 10 Nov 2020 14:50:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605019844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mcM2MSsUdFJePUZru7Sp5fyBCMz/gtP77qxAlImoS2M=;
	b=rxm/Vr7UoCtc/hIBqRNSRbMvDmFFRNW7xbJDEg5Y+DDyXFm2iD/icK8IjHXY70gpHUwOrF
	iaD2U0hnb6rf2uw5fVHozFas+R85UWFQWfNKhHdqDaOvNNulYFpDdc/2VwMX4YRGGGon3U
	AzsN+Yu14xT33qRYxji9ov0qEq/Bmfo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 85BECACF5;
	Tue, 10 Nov 2020 14:50:44 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
 <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
Date: Tue, 10 Nov 2020 15:50:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 14:59, Roger Pau Monné wrote:
> On Wed, Oct 28, 2020 at 10:24:53AM +0100, Jan Beulich wrote:
>> Fair parts of the present handlers are identical; in fact
>> nestedp2m_write_p2m_entry() lacks a call to p2m_entry_modify(). Move
>> common parts right into write_p2m_entry(), splitting the hooks into a
>> "pre" one (needed just by shadow code) and a "post" one.
>>
>> For the common parts moved I think that the p2m_flush_nestedp2m() is,
>> at least from an abstract perspective, also applicable in the shadow
>> case. Hence it doesn't get a 3rd hook put in place.
>>
>> The initial comment that was in hap_write_p2m_entry() gets dropped: Its
>> placement was bogus, and looking back the the commit introducing it
>> (dd6de3ab9985 "Implement Nested-on-Nested") I can't see either what use
>> of a p2m it was meant to be associated with.
> 
> Is there any performance implication of moving from one hook to two
> hooks? Since this shouldn't be a hot path I assume it's fine.

Well, first of all just a couple of patches ago two indirect
calls were folded into one, so it's at least not getting worse
compared to where we started from. And then both HAP and nested
install just one of the two hooks.

As per the remark in an earlier patch, referred to ...

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: This is effectively the alternative to the suggestion in an earlier
>>      patch that we might do away with the hook altogether. Of course a
>>      hybrid approach would also be possible, by using direct calls here
>>      instead of splitting the hook into two.

... here, there is the option of doing away with the indirect
calls altogether, but - as said earlier - at the price of at
least coming close to a layering violation.

>> --- a/xen/arch/x86/mm/hap/nested_hap.c
>> +++ b/xen/arch/x86/mm/hap/nested_hap.c
>> @@ -71,24 +71,11 @@
>>  /*        NESTED VIRT P2M FUNCTIONS         */
>>  /********************************************/
>>  
>> -int
>> -nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
>> -    l1_pgentry_t *p, l1_pgentry_t new, unsigned int level)
>> +void
>> +nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
>>  {
>> -    struct domain *d = p2m->domain;
>> -    uint32_t old_flags;
>> -
>> -    paging_lock(d);
>> -
>> -    old_flags = l1e_get_flags(*p);
>> -    safe_write_pte(p, new);
>> -
>> -    if (old_flags & _PAGE_PRESENT)
>> -        guest_flush_tlb_mask(d, p2m->dirty_cpumask);
>> -
>> -    paging_unlock(d);
>> -
>> -    return 0;
>> +    if ( oflags & _PAGE_PRESENT )
>> +        guest_flush_tlb_mask(p2m->domain, p2m->dirty_cpumask);
>>  }
> 
> This is a verbatimi copy of hap_write_p2m_entry_post. I assume there's
> a reason why we need both, but I'm missing it.

Only almost, since HAP has

    if ( oflags & _PAGE_PRESENT )
        guest_flush_tlb_mask(d, d->dirty_cpumask);

instead (i.e. they differ in which dirty_cpumask gets used).

>> --- a/xen/arch/x86/mm/p2m-pt.c
>> +++ b/xen/arch/x86/mm/p2m-pt.c
>> @@ -122,17 +122,55 @@ static int write_p2m_entry(struct p2m_do
>>  {
>>      struct domain *d = p2m->domain;
>>      struct vcpu *v = current;
>> -    int rc = 0;
>>  
>>      if ( v->domain != d )
>>          v = d->vcpu ? d->vcpu[0] : NULL;
>>      if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
>>           p2m_is_nestedp2m(p2m) )
>> -        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
>> +    {
>> +        unsigned int oflags;
>> +        mfn_t omfn;
>> +        int rc;
>> +
>> +        paging_lock(d);
>> +
>> +        if ( p2m->write_p2m_entry_pre )
>> +            p2m->write_p2m_entry_pre(d, gfn, p, new, level);
>> +
>> +        oflags = l1e_get_flags(*p);
>> +        omfn = l1e_get_mfn(*p);
>> +
>> +        rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
>> +                              p2m_flags_to_type(oflags), l1e_get_mfn(new),
>> +                              omfn, level);
>> +        if ( rc )
>> +        {
>> +            paging_unlock(d);
>> +            return rc;
>> +        }
>> +
>> +        safe_write_pte(p, new);
>> +
>> +        if ( p2m->write_p2m_entry_post )
>> +            p2m->write_p2m_entry_post(p2m, oflags);
>> +
>> +        paging_unlock(d);
>> +
>> +        if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
>> +             (oflags & _PAGE_PRESENT) &&
>> +             !p2m_get_hostp2m(d)->defer_nested_flush &&
>> +             /*
>> +              * We are replacing a valid entry so we need to flush nested p2ms,
>> +              * unless the only change is an increase in access rights.
>> +              */
>> +             (!mfn_eq(omfn, l1e_get_mfn(new)) ||
>> +              !perms_strictly_increased(oflags, l1e_get_flags(new))) )
>> +            p2m_flush_nestedp2m(d);
> 
> It feel slightly weird to have a nested p2m hook post, and yet have
> nested specific code here.
> 
> Have you considered if the post hook could be moved outside of the
> locked region, so that we could put this chunk there in the nested p2m
> case?

Yes, I did, but I don't think the post hook can be moved out. The
only alternative therefore would be a 3rd hook. And this hook would
then need to be installed on the host p2m for nested guests, as
opposed to nestedp2m_write_p2m_entry_post, which gets installed in
the nested p2m-s. As said in the description, the main reason I
decided against a 3rd hook is that I suppose the code here isn't
HAP-specific (while prior to this patch it was).

Jan

