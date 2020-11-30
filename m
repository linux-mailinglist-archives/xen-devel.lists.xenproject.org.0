Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654902C8459
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 13:51:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41122.74235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjidm-0001XE-Dm; Mon, 30 Nov 2020 12:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41122.74235; Mon, 30 Nov 2020 12:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjidm-0001Wk-AC; Mon, 30 Nov 2020 12:50:50 +0000
Received: by outflank-mailman (input) for mailman id 41122;
 Mon, 30 Nov 2020 12:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjidl-0001Wf-4S
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 12:50:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52ac2cf8-4fae-4004-bdf7-88a38b749d1b;
 Mon, 30 Nov 2020 12:50:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E508AC75;
 Mon, 30 Nov 2020 12:50:46 +0000 (UTC)
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
X-Inumbo-ID: 52ac2cf8-4fae-4004-bdf7-88a38b749d1b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606740646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiVciFoQ8MAzUOLsUizOihN5Ldueegxfk4UdjO8hms0=;
	b=Q26+iVJTvAzlXRcy5VMaqN+bmsyZg+3+cxBiKs/t69n+4Y2Sym9WNIqApP99BM4gazllca
	EWsnzjZ1VfWQhLKlxLTGBLXbTRP9z0r+kiUu4ZDi4d41VE16gdhcr3Uqw0rD8eR3LVmv6S
	z6wdIX6Eb5b6rI+8e6iGwcTxEf/L3h0=
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
 <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
 <f25e278f-2d63-d806-4650-983df490556f@xen.org>
 <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
 <8bb9eb92-ede4-0fa4-d21f-c7976fe70acf@xen.org>
 <622a8319-a439-72f2-c045-15e7611a22e7@suse.com>
 <3db3081d-232a-cce1-cfce-c657be64a0dd@xen.org>
 <600d3ea4-f905-3aab-e110-da3bd0d4b38a@suse.com>
 <23cd67ea1b96ba3f8801a3cf13549298597cb331.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1dab4032-6ae1-bf77-c183-c62ca06f0ad8@suse.com>
Date: Mon, 30 Nov 2020 13:50:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <23cd67ea1b96ba3f8801a3cf13549298597cb331.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 13:13, Hongyan Xia wrote:
> On Tue, 2020-08-18 at 18:16 +0200, Jan Beulich wrote:
>> On 18.08.2020 15:08, Julien Grall wrote:
>>> On 18/08/2020 12:30, Jan Beulich wrote:
>>>> On 18.08.2020 12:13, Julien Grall wrote:
>>>>> On 18/08/2020 09:49, Jan Beulich wrote:
>>>>>> On 13.08.2020 19:22, Julien Grall wrote:
>>>>>>> On 13/08/2020 17:08, Hongyan Xia wrote:
>>>>>>>> On Fri, 2020-08-07 at 16:05 +0200, Jan Beulich wrote:
>>>>>>>>> On 27.07.2020 16:21, Hongyan Xia wrote:
>>>>>>>>>> From: Wei Liu <wei.liu2@citrix.com>
>>>>>>>>>>
>>>>>>>>>> Rewrite those functions to use the new APIs. Modify
>>>>>>>>>> its callers to
>>>>>>>>>> unmap
>>>>>>>>>> the pointer returned. Since alloc_xen_pagetable_new()
>>>>>>>>>> is almost
>>>>>>>>>> never
>>>>>>>>>> useful unless accompanied by page clearing and a
>>>>>>>>>> mapping, introduce
>>>>>>>>>> a
>>>>>>>>>> helper alloc_map_clear_xen_pt() for this sequence.
>>>>>>>>>>
>>>>>>>>>> Note that the change of virt_to_xen_l1e() also
>>>>>>>>>> requires
>>>>>>>>>> vmap_to_mfn() to
>>>>>>>>>> unmap the page, which requires domain_page.h header
>>>>>>>>>> in vmap.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>>>>>>>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>>>>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>>
>>>>>>>>>> ---
>>>>>>>>>> Changed in v8:
>>>>>>>>>> - s/virtual address/linear address/.
>>>>>>>>>> - BUG_ON() on NULL return in vmap_to_mfn().
>>>>>>>>>
>>>>>>>>> The justification for this should be recorded in the
>>>>>>>>> description. In
>>>>>>>>
>>>>>>>> Will do.
>>>>>>>>
>>>>>>>>> reply to v7 I did even suggest how to easily address
>>>>>>>>> the issue you
>>>>>>>>> did notice with large pages, as well as alternative
>>>>>>>>> behavior for
>>>>>>>>> vmap_to_mfn().
>>>>>>>>
>>>>>>>> One thing about adding SMALL_PAGES is that vmap is common
>>>>>>>> code and I am
>>>>>>>> not sure if the Arm side is happy with it.
>>>>>>>
>>>>>>> At the moment, Arm is only using small mapping but I plan
>>>>>>> to change that soon because we have regions that can be
>>>>>>> fairly big.
>>>>>>>
>>>>>>> Regardless that, the issue with vmap_to_mfn() is rather x86
>>>>>>> specific. So I don't particularly like the idea to expose
>>>>>>> such trick in common code.
>>>>>>>
>>>>>>> Even on x86, I think this is not the right approach. Such
>>>>>>> band-aid will impact the performance as, assuming
>>>>>>> superpages are used, it will take longer to map and add
>>>>>>> pressure on the TLBs.
>>>>>>>
>>>>>>> I am aware that superpages will be useful for LiveUpdate,
>>>>>>> but is there any use cases in upstream?
>>>>>>
>>>>>> Superpage use by vmalloc() is purely occasional: You'd have
>>>>>> to vmalloc()
>>>>>> 2Mb or more _and_ the page-wise allocation ought to return
>>>>>> 512
>>>>>> consecutive pages in the right order. Getting 512 consecutive
>>>>>> pages is
>>>>>> possible in practice, but with the page allocator allocating
>>>>>> top-down it
>>>>>> is very unlikely for them to be returned in increasing-sorted 
>>>>>> order.
>>>>>
>>>>> So your assumption here is vmap_to_mfn() can only be called on
>>>>> vmalloc-ed() area. While this may be the case in Xen today, the
>>>>> name clearly suggest it can be called on all vmap-ed region.
>>>>
>>>> No, I don't make this assumption, and I did spell this out in an
>>>> earlier
>>>> reply to Hongyan: Parties using vmap() on a sufficiently large
>>>> address
>>>> range with consecutive MFNs simply have to be aware that they may
>>>> not
>>>> call vmap_to_mfn().
>>>
>>> You make it sounds easy to be aware, however there are two
>>> implementations of vmap_to_mfn() (one per arch). Even looking at
>>> the x86 version, it is not obvious there is a restriction.
>>
>> I didn't mean to make it sound like this - I agree it's not an
>> obvious
>> restriction.
>>
>>> So I am a bit concerned of the "misuse" of the function. This could
>>> possibly be documented. Although, I am not entirely happy to
>>> restrict the use because of x86.
>>
>> Unless the underlying issue gets fixed, we need _some_ form of bodge.
>> I'm not really happy with the BUG_ON() as proposed by Hongyan. You're
>> not really happy with my first proposed alternative, and you didn't
>> comment on the 2nd one (still kept in context below). Not sure what
>> to do: Throw dice?
> 
> Actually I did not propose the BUG_ON() fix. I was just in favor of it
> when Jan presented it as a choice in v7.
> 
> The reason I am in favor of it is that even without it, the existing
> x86 code already BUG_ON() when vmap has a superpage anyway, so it's not
> like other alternatives behave any differently for superpages. I am
> also not sure about returning INVALID_MFN because if virt_to_xen_l1e()
> really returns NULL, then we are calling vmap_to_mfn() on a non-vmap
> address (not even populated) which frankly deserves at least ASSERT().
> So, I don't think BUG_ON() is a bad idea for now before vmap_to_mfn()
> supports superpages.
> 
> Of course, we could use MAP_SMALL_PAGES to avoid the whole problem, but
> Arm may not be happy. After a quick chat with Julien, how about having
> ARCH_VMAP_FLAGS and only small pages for x86?

Possibly, albeit this will then make it look less like a bodge and
more like we would want to keep it this way. How difficult would it
be to actually make the thing work with superpages? Is it more than
simply
(pseudocode, potentially needed locking omitted):

vmap_to_mfn(va) {
    pl1e = virt_to_xen_l1e(va);
    if ( pl1e )
        return l1e_get_mfn(*pl1e);
    pl2e = virt_to_xen_l2e(va);
    if ( pl2e )
        return l2e_get_mfn(*pl2e) + suitable_bits(va);
    return l3e_get_mfn(*virt_to_xen_l3e(va)) + suitable_bits(va);
}

(assuming virt_to_xen_l<N>e() would be returning NULL in such a case)?
Not very efficient, but not needed anywhere anyway - the sole user of
the construct is domain_page_map_to_mfn(), which maps only individual
pages. (An even better option would be to avoid the recurring walk of
the higher levels by using only virt_to_xen_l3e() and then doing the
remaining steps "by hand". This would at once allow to avoid the here
unwanted / unneeded checking for whether page tables need allocating.)

Jan

