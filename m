Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7692DF9F0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 09:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57319.100280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGaY-00072a-QE; Mon, 21 Dec 2020 08:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57319.100280; Mon, 21 Dec 2020 08:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGaY-00072B-Mj; Mon, 21 Dec 2020 08:30:42 +0000
Received: by outflank-mailman (input) for mailman id 57319;
 Mon, 21 Dec 2020 08:30:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krGaX-000726-Lr
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 08:30:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f315c31-13dc-4c57-bbbf-afa96beb07a7;
 Mon, 21 Dec 2020 08:30:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD951ACC4;
 Mon, 21 Dec 2020 08:30:39 +0000 (UTC)
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
X-Inumbo-ID: 8f315c31-13dc-4c57-bbbf-afa96beb07a7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608539440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/cKh/D7mlPJ8p5jVTAb/X7PKFm2Alm16NCrQWwImh0=;
	b=pE0g9vk2yT/NovCusbKukYp3cv3BneEhOFJjSJRZD6oPm+58MAYg4qDycIh5t2ipQ7WYd2
	+0aKVu8jE5HpHNPhOxQQbQ6J0FvISfHkdArA9FwaHD8+UkxxCM7IzYce6hTFdW9Hs//yTf
	h6jLQkD4VCe0QEDK1u+uES6+Paor3HA=
Subject: Re: [PATCH] xen/x86: Fix memory leak in vcpu_create() error path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>
References: <20200928154741.2366-1-andrew.cooper3@citrix.com>
 <33331c3a-1fd5-1ef6-16a3-21d2a6672e90@suse.com>
 <9556aeb3-2a7c-7aea-4386-6e561dd9ef6e@citrix.com>
 <9e652863-5ada-0327-5817-cdb2e652e066@suse.com>
 <e26f0cc3-1893-6cd9-71b3-4e0c011318b3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <baaa6ce0-5434-5b65-da12-bdf9487ebf74@suse.com>
Date: Mon, 21 Dec 2020 09:30:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e26f0cc3-1893-6cd9-71b3-4e0c011318b3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.12.2020 14:58, Andrew Cooper wrote:
> On 18/12/2020 08:27, Jan Beulich wrote:
>> On 17.12.2020 22:46, Andrew Cooper wrote:
>>> On 29/09/2020 07:18, Jan Beulich wrote:
>>>> On 28.09.2020 17:47, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/mm/hap/hap.c
>>>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>>>> @@ -563,30 +563,37 @@ void hap_final_teardown(struct domain *d)
>>>>>      paging_unlock(d);
>>>>>  }
>>>>>  
>>>>> +void hap_vcpu_teardown(struct vcpu *v)
>>>>> +{
>>>>> +    struct domain *d = v->domain;
>>>>> +    mfn_t mfn;
>>>>> +
>>>>> +    paging_lock(d);
>>>>> +
>>>>> +    if ( !paging_mode_hap(d) || !v->arch.paging.mode )
>>>>> +        goto out;
>>>> Any particular reason you don't use paging_get_hostmode() (as the
>>>> original code did) here? Any particular reason for the seemingly
>>>> redundant (and hence somewhat in conflict with the description's
>>>> "with the minimum number of safety checks possible")
>>>> paging_mode_hap()?
>>> Yes to both.  As you spotted, I converted the shadow side first, and
>>> made the two consistent.
>>>
>>> The paging_mode_{shadow,hap})() is necessary for idempotency.  These
>>> functions really might get called before paging is set up, for an early
>>> failure in domain_create().
>> In which case how would v->arch.paging.mode be non-NULL already?
>> They get set in {hap,shadow}_vcpu_init() only.
> 
> Right, but we also might end up here with an error early in
> vcpu_create(), where d->arch.paging is set up, but v->arch.paging isn't.
> 
> This logic needs to be safe to use at any point of partial initialisation.
> 
> (And to be clear, I found I needed both of these based on some
> artificial error injection testing.)
> 
>>> The paging mode has nothing really to do with hostmode/guestmode/etc. 
>>> It is the only way of expressing the logic where it is clear that the
>>> lower pointer dereferences are trivially safe.
>> Well, yes and no - the other uses of course should then also use
>> paging_get_hostmode(), like various of the wrappers in paging.h
>> do. Or else I question why we have paging_get_hostmode() in the
>> first place.
> 
> I'm not convinced it is an appropriate abstraction to have, and I don't
> expect it to survive the nested virt work.
> 
>> There are more examples in shadow code where this
>> gets open-coded when it probably shouldn't be. There haven't been
>> any such cases in HAP code so far ...
> 
> Doesn't matter.  Its use here would obfuscate the code (this is one part
> of why I think it is a bad abstraction to begin with), and if the
> implementation ever changed, the function would lose its safety.
> 
>> Additionally (noticing only now) in the shadow case you may now
>> loop over all vCPU-s in shadow_teardown() just for
>> shadow_vcpu_teardown() to bail right away. Wouldn't it make sense
>> to retain the "if ( shadow_mode_enabled(d) )" there around the
>> loop?
> 
> I'm not entirely convinced that was necessarily safe.  Irrespective, see
> the TODO.  The foreach_vcpu() is only a stopgap until some cleanup
> structure changes come along (which I had queued behind this patch anyway).

Well, fair enough (for all of the points). You have my R-b already,
and all you need to do (if you haven't already) is re-base the
change, as the conflicting one of mine (which was triggered by
reviewing yours) has gone in already.

Jan

