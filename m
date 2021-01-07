Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DABB2ECF93
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 13:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62866.111492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxUMa-0000Ss-Nl; Thu, 07 Jan 2021 12:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62866.111492; Thu, 07 Jan 2021 12:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxUMa-0000SW-KX; Thu, 07 Jan 2021 12:26:00 +0000
Received: by outflank-mailman (input) for mailman id 62866;
 Thu, 07 Jan 2021 12:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3gRj=GK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxUMZ-0000SR-9c
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 12:25:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e09dd16-9fc1-4728-9b3e-9b36aed72bed;
 Thu, 07 Jan 2021 12:25:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D99DBAD24;
 Thu,  7 Jan 2021 12:25:56 +0000 (UTC)
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
X-Inumbo-ID: 7e09dd16-9fc1-4728-9b3e-9b36aed72bed
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610022357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQUf/czZQglwcUlpPhqoJ/Tuib8qN5SbEOqYf7QYs2A=;
	b=ZnJuxzrb8R/GfKYWYXYZJlZGFy0n2PxDMCn6s+iX7UmwXp+3xChUZ/8hWN2T4zGzxsWXFc
	rsgY9zDG9pQHbcLoD8sN20gAaEsd18WYLFpFlSQkzgKNrPet0MSAKMyDcDyWH/X4XrVlwt
	V03MQHqnX5NWt8SXDfcJkpgMtPeXroI=
Subject: Re: [PATCH 2/2] x86/hap: Resolve mm-lock order violations when
 forking VMs with nested p2m
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
 <19aab6220bf191a31902488ed38c51d239572269.1609781242.git.tamas.lengyel@intel.com>
 <158cf7ca-17cf-c886-20e8-b53519bec1b5@suse.com>
 <CABfawhn3OBbpHW9e1Dd9n4UCOe_KaymBS0QwnJC2tLr-oAnBmg@mail.gmail.com>
 <a3f12f54-926e-9810-f78f-534f057449de@suse.com>
 <CABfawh=+nd+Lm59Ofy31yDVvcQ9fYXNbm_NBNvu8xsnxti+8sQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba51a8bf-a2cb-0572-8f8d-4c4246580b59@suse.com>
Date: Thu, 7 Jan 2021 13:25:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=+nd+Lm59Ofy31yDVvcQ9fYXNbm_NBNvu8xsnxti+8sQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.01.2021 17:26, Tamas K Lengyel wrote:
> On Wed, Jan 6, 2021 at 11:11 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.01.2021 16:29, Tamas K Lengyel wrote:
>>> On Wed, Jan 6, 2021 at 7:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 04.01.2021 18:41, Tamas K Lengyel wrote:
>>>>> +        for ( i = 0; i < MAX_NESTEDP2M; i++ )
>>>>> +            p2m_lock(d->arch.nested_p2m[i]);
>>>>
>>>> From a brief scan, this is the first instance of acquiring all
>>>> nested p2m locks in one go. Ordering these by index is perhaps
>>>> fine, but I think this wants spelling out in e.g. mm-locks.h. Of
>>>> course the question is if you really need to go this far, i.e.
>>>> whether really all of the locks need holding. This is even more
>>>> so with p2m_flush_table_locked() not really looking to be a
>>>> quick operation, when there have many pages accumulated for it.
>>>> I.e. the overall lock holding time may turn out even more
>>>> excessive this way than it apparently already is.
>>>
>>> I agree this is not ideal but it gets things working without Xen
>>> crashing. I would prefer if we could get rid of the mm lock ordering
>>> altogether in this context.
>>
>> How would this do any good? You'd then be at risk of ac"ually
>> hitting a lock order violation. These are often quite hard to
>> debug.
> 
> The whole lock ordering is just a pain and it gets us into situations
> like this where we are forced to take a bunch of locks to just change
> one thing. I don't have a better solution but I'm also not 100%
> convinced that this lock ordering setup is even sane. Sometimes it
> really ought to be enough to just take one "mm master lock" without
> having to chase down all of them individually.

The concept of a "master lock" would imply all parties wanting to
make _any_ change anywhere (or even just not being certain whether
a change will need making) would need to hold it for writing. This
is clearly against the overall goal of reducing lock contention on
in particular the p2m lock. 

>>>>> --- a/xen/arch/x86/mm/p2m.c
>>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>>> @@ -1598,8 +1598,17 @@ void
>>>>>  p2m_flush_nestedp2m(struct domain *d)
>>>>>  {
>>>>>      int i;
>>>>> +    struct p2m_domain *p2m;
>>>>> +
>>>>>      for ( i = 0; i < MAX_NESTEDP2M; i++ )
>>>>> -        p2m_flush_table(d->arch.nested_p2m[i]);
>>>>> +    {
>>>>> +        p2m = d->arch.nested_p2m[i];
>>>>
>>>> Please move the declaration here, making this the variable's
>>>> initializer (unless line length constraints make the latter
>>>> undesirable).
>>>
>>> I really don't get what difference this would make.
>>
>> Both choice of (generally) inappropriate types (further up)
>> and placement of declarations (here) (and of course also
>> other style violations) can set bad precedents even if in a
>> specific case it may not matter much. So yes, it may be
>> good enough here, but it would violate our desire to
>> - use unsigned types when a variable will hold only non-
>>   negative values (which in the general case may improve
>>   generated code in particular on x86-64),
>> - limit the scopes of variables as much as possible, to
>>   more easily spot inappropriate uses (like bypassing
>>   initialization).
>>
>> This code here actually demonstrates such a bad precedent,
>> using plain int for the loop induction variable. While I
>> can't be any way near sure, there's a certain chance you
>> actually took it and copied it to
>> __mem_sharing_unshare_page(). The chance of such happening
>> is what we'd like to reduce over time.
> 
> Yes, I copied it from p2m.c. All I meant was that such minor changes
> are generally speaking not worth a round-trip of sending new patches.
> I obviously don't care whether this is signed or unsigned. Minor stuff
> like that could be changed on commit and is not even worth having a
> discussion about.

I'm sorry, but no. Committing ought to be a purely mechanical
thing. It is a _courtesy_ of the committer if they offer to
make adjustments. If us offering this regularly gets taken as
"expected behavior", I'm afraid I personally would stop making
such an offer, and instead insist on further round trips.

Jan

