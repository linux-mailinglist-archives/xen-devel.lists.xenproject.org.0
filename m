Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00526450665
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 15:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225944.390309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmchg-0000gy-3P; Mon, 15 Nov 2021 14:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225944.390309; Mon, 15 Nov 2021 14:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmchf-0000e4-Vq; Mon, 15 Nov 2021 14:11:23 +0000
Received: by outflank-mailman (input) for mailman id 225944;
 Mon, 15 Nov 2021 14:11:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mmche-0000dy-9j
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 14:11:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmchc-0001O1-1V; Mon, 15 Nov 2021 14:11:20 +0000
Received: from [54.239.6.189] (helo=[192.168.10.237])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmchb-0004pw-R2; Mon, 15 Nov 2021 14:11:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=9Za1DzF3PkhnitzHrI17zIhpxZnD83lWppINSNqqwTo=; b=c9c7dbIlLWiLInmjnmiwQYXvMU
	0FfjeZMYd1F5aHGGxbmUKOweHtDWjAGgDS5CogWuHkQsgpzmxFG3UO8xSpGHkoifb33XtsnUcO1jb
	vdTfOVO1mGkPvi3Z0n70qjvG00x77rpuTh2ZZxXdrNY+65Lh2M4Izr6VCp8EfoF9/tRg=;
Message-ID: <06f83d83-382e-7ae7-551e-3f05a1cc3293@xen.org>
Date: Mon, 15 Nov 2021 14:11:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
 <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
 <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
 <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
 <02EF96BF-D2A6-4415-A6E9-B9511C18C895@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <02EF96BF-D2A6-4415-A6E9-B9511C18C895@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 15/11/2021 11:23, Bertrand Marquis wrote:
>> On 15 Nov 2021, at 10:55, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.11.2021 11:23, Bertrand Marquis wrote:
>>> Hi Jan,
>>>
>>>> On 15 Nov 2021, at 10:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 15.11.2021 11:13, Bertrand Marquis wrote:
>>>>>> On 11 Nov 2021, at 17:57, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>>> --- a/xen/common/domain.c
>>>>>> +++ b/xen/common/domain.c
>>>>>> @@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
>>>>>>    return 0;
>>>>>> }
>>>>>>
>>>>>> -static void do_domain_pause(struct domain *d,
>>>>>> -                            void (*sleep_fn)(struct vcpu *v))
>>>>>> +static void _domain_pause(struct domain *d, bool sync /* or nosync */)
>>>>>
>>>>> Here you use comments inside the function definition.
>>>>> I think this is something that should be avoided and in this specific case a
>>>>> boolean sync is clear enough not to need to explain that false is nosing.
>>>>
>>>> While I agree the comment here isn't overly useful, I think ...
>>>>
>>>>>> @@ -1250,12 +1253,12 @@ static void do_domain_pause(struct domain *d,
>>>>>> void domain_pause(struct domain *d)
>>>>>> {
>>>>>>    ASSERT(d != current->domain);
>>>>>> -    do_domain_pause(d, vcpu_sleep_sync);
>>>>>> +    _domain_pause(d, true /* sync */);
>>>>> Same here.
>>>>
>>>> ... comments like this one are pretty useful to disambiguate the plain
>>>> "true" or "false" (without the reader needing to go look at the function
>>>> declaration or definition).
>>>
>>> I agree with that but the comment here is useful, it could be added before
>>> the call instead of inside it.
>>
>> Except the form Andrew has used is the one we've been using elsewhere
>> for some time.
> 
> I know I found some other examples and that why I say “should” and not must.
> If other consider that this is the right way to go and should not be changed this
> is ok with me

Adding the comment after the parameter is a lot easier to read.

What is Misra/FuSA trying to solve by preventing to comment just after 
the parameters?

> but I wanted to make the comment as this could ease the work
> with FuSa and Misra compliance in the future.

This will need to be part of a larger discussion on how the community 
want to integrate FuSa/Misra rules. I do expect a few of the rules may 
be quite controversial to adopt (like the one above) and therefore we 
would need to discuss the pros/cons of them.

Cheers,

-- 
Julien Grall

