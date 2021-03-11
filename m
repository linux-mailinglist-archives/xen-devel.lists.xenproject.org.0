Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA62336D83
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 09:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96373.182234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGNq-0005Sw-EM; Thu, 11 Mar 2021 08:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96373.182234; Thu, 11 Mar 2021 08:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGNq-0005Sa-B7; Thu, 11 Mar 2021 08:09:26 +0000
Received: by outflank-mailman (input) for mailman id 96373;
 Thu, 11 Mar 2021 08:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKGNo-0005SV-Ul
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 08:09:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3008c709-832f-419a-bd57-421c529335e0;
 Thu, 11 Mar 2021 08:09:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A3B6AD72;
 Thu, 11 Mar 2021 08:09:23 +0000 (UTC)
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
X-Inumbo-ID: 3008c709-832f-419a-bd57-421c529335e0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615450163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJLMv/hsgUsGfwAxp18RwimpubSUpytd1cJU34yAdks=;
	b=AMIrmjh35d74JtP+zbLfGX4mPGiF3INgr+tUiSXzQUC9SJIGlcH8wu08MewbI/bBwr8Sv0
	pK6Ci6UFCKeXC4u79tJuI4dEL5OAuIypiJaXw0kAbaWBDjqn1DpCaKiYGsuyOT/U6tTnrz
	0R1OHVQyrOjdv0UL2tAyk1pAcpN4Ttk=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
 <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
 <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <952ca444-2091-b7f1-3559-c728a63af37f@suse.com>
Date: Thu, 11 Mar 2021 09:09:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.03.2021 18:52, Julien Grall wrote:
> On 10/03/2021 16:21, Jan Beulich wrote:
>> On 10.03.2021 15:58, Julien Grall wrote:
>>> On 10/03/2021 10:13, Jan Beulich wrote:
>>>> Sadly I was wrong to suggest dropping vaddrs' initializer during review
>>>> of v2 of the patch introducing this code. gcc 4.3 can't cope.
>>>
>>> What's the error?
>>
>> The one quoted in the title.
>>
>>> Are you sure this is not going to hiding a potential
>>> miscompilation of the function?
>>
>> Miscompilation? It may hide us screwing up, but addressing such a
>> compiler warning by adding an initializer has been quite common
>> in the past.
> 
> Well... When a compiler tells me a value may be unitialized, I read it 
> as some optimization may decide to use the variable in a way I wasn't 
> expected.

I don't think that's how warnings like this work in general. Optimization
may help spot a case where an uninitialized variable gets used (because
optimization may result in sufficient simplification of the internal
representation of the original source), and variable lifetime analysis
may also be a prereq to optimization, but in general I'd recommend
viewing the two as independent aspects.

>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>>>>        struct grant_table *gt = d->grant_table;
>>>>        unsigned int i, final_frame;
>>>>        mfn_t tmp;
>>>> -    void **vaddrs;
>>>> +    void **vaddrs = NULL;
>>> I am a bit nervous to inialize vaddrs to NULL for a few reasons:
>>>     1) It is not 100% obvious (e.g. it takes more than a second) that
>>> vaddrs will always be initialized.
>>
>> But convincing ourselves was necessary even more so prior to this
>> change. We must not ever rely on the compiler to tell us about
>> issues in our code. We can only leverage that in some cases it
>> does.
> 
> I didn't suggest that we should only rely on the compiler. I pointed out 
> that we are telling the compiler to not worry. This may hide a valid 
> concern from the compiler.

As we (have to) do elsewhere.

>> From this it (I think obviously) follows that without the
>> initializer we're at bigger risk than with it.
> 
> I thought deferencing a NULL pointer was still a concern for PV?

I could use ZERO_BLOCK_PTR or yet something else, if we decided we
want to work around this class of issues this way. Elsewhere we're
using NULL afaict (but see also below).

> For the other setup, I agree that it would only lead to a crash rather 
> than dereferencing anything. Yet I am not convinced this is that much 
> better...

When using an uninitialized variable, anything can happen. A crash
would still be on the better side of things, as a privilege
escalation then also is possible. Again - if you're worried about
us introducing an actual use of the thus initialized variable, you
should be even more worried about using it when it's uninitialized
(and the compiler _not_ being able to spot it).

>>>     2) A compiler will not be able to help us if we are adding code
>>> without initialized vaddrs.
>>>
>>> It also feels wrong to me to try to write Xen in a way that will make a
>>> 10 years compiler happy...
>>
>> As said above - we've worked around limitations quite a few times
>> in the past. This is just one more instance.
> 
> I find amusing you wrote that when you complained multiple time when 
> someone was re-using existing bad pattern. :)

Well, thing is - I don't view this as a bad pattern. The only question
really is whether NULL is a good initializer here. As per above a non-
canonical pointer may be better, but then we have quite a few places
elsewhere to fix. We could also deliberately leave the variable
uninitialized, by using past Linux'es uninitialized_var(), but they've
dropped that construct for what I think are very good reasons.

Jan

