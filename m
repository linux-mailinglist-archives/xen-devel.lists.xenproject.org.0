Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC33E2D3E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 17:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164751.301100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC1Sm-0003Rw-7Q; Fri, 06 Aug 2021 15:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164751.301100; Fri, 06 Aug 2021 15:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC1Sm-0003PN-4M; Fri, 06 Aug 2021 15:08:44 +0000
Received: by outflank-mailman (input) for mailman id 164751;
 Fri, 06 Aug 2021 15:08:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TtcZ=M5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mC1Sk-0003Oy-83
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 15:08:42 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e9816e4-f6c8-11eb-9d04-12813bfff9fa;
 Fri, 06 Aug 2021 15:08:40 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628262510048646.121546899831;
 Fri, 6 Aug 2021 08:08:30 -0700 (PDT)
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
X-Inumbo-ID: 2e9816e4-f6c8-11eb-9d04-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1628262516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Sxn1I5Rg3jMzvxcBO6AL0G2f47QBJm4XYn4k8ufP87pXkXzhkgtgon5AjGLn/uuZtDb6lVjPDrq5vzkGtyXaOOfhymF3xNxXPLM8c942freU53vT5R48nELLpeFsWLf6r7WulYPvG1keCIAKWuzx64JBRXTAKFrkPqJcshbT3L4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628262516; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JNQdgjjXZtd6Hh5ENxxy4PjJzPyiYI7kYCeYRjYJsZU=; 
	b=LDJWoTDI6f6Ve4mOzyhnceQPLvjYG1PTA8lDrv6TgXPpDEztMfOa8FrW6ORmwIM057aCuwt0cbFQP80/E2vSATDyqKXGbTEjmvHC0W28gGraLS0F6F5sdXJd1lbeOraZf2+rkS8sow9prgUYytnDuGvvZWYjEYx2xalZa6Np/Zg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628262516;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JNQdgjjXZtd6Hh5ENxxy4PjJzPyiYI7kYCeYRjYJsZU=;
	b=LI2NYEnN4SH3qxnUCzoE9B4fxC62T9JPT6fe1g9quqH+pSRKHfvpssciQ+mPtq6R
	qyufRgKmQ9WfbsrRn4hGxHFZT+Pj0+cPGXNy5qPU9R4X5OrmgcOMqh77rc9LM2ZZyUq
	/Ib1Zc0DjlTRbxEb4wmSYoHrTAzG42l9V8xoBVnk=
To: Jan Beulich <jbeulich@suse.com>, Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <6e573489-ceb7-03f4-3511-e6c166b318a6@apertussolutions.com>
 <ee685f11-4f34-614d-e0ba-7cafeda08344@gmail.com>
 <ca936d82-cc31-a127-488c-e4e33ceb6fbb@apertussolutions.com>
 <4765c96e-49dc-ecb4-5c4f-2a6be5fb99c9@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Message-ID: <60959b27-a59b-85c5-f04e-0c000f636f7b@apertussolutions.com>
Date: Fri, 6 Aug 2021 11:08:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4765c96e-49dc-ecb4-5c4f-2a6be5fb99c9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/6/21 2:09 AM, Jan Beulich wrote:
> On 05.08.2021 18:37, Daniel P. Smith wrote:
>> On 8/5/21 11:59 AM, Oleksandr wrote:
>>> On 05.08.21 18:03, Daniel P. Smith wrote:
>>>> On 7/28/21 12:18 PM, Oleksandr Tyshchenko wrote:
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd,
>>>>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>               start_extent);
>>>>>           break;
>>>>>   +    case XENMEM_get_unallocated_space:
>>>>> +    {
>>>>> +        struct xen_get_unallocated_space xgus;
>>>>> +        struct xen_unallocated_region *regions;
>>>>> +
>>>>> +        if ( unlikely(start_extent) )
>>>>> +            return -EINVAL;
>>>>> +
>>>>> +        if ( copy_from_guest(&xgus, arg, 1) ||
>>>>> +             !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
>>>>> +            return -EFAULT;
>>>>> +
>>>>> +        d = rcu_lock_domain_by_any_id(xgus.domid);
>>>>> +        if ( d == NULL )
>>>>> +            return -ESRCH;
>>>>> +
>>>>> +        rc = xsm_get_unallocated_space(XSM_HOOK, d);
>>>> Not sure if you are aware but XSM_HOOK is a no-op check, meaning that
>>>> you are allowing any domain to do this operation on any other domain. In
>>>> most cases there is an XSM check at the beginning of the hypercall
>>>> processing to do an initial clamp down but I am pretty sure there is no
>>>> prior XSM check on this path. Based on my understanding of how this is
>>>> intended, which may be incorrect, but I think you would actually want
>>>> XSM_TARGET.the
>>> Thank you for pointing this out.
>>> I am aware what the XSM_HOOK is, but I was thinking what the default
>>> action would be better suited for that hypercall, and failed to think of
>>> a better alternative.
>>> I was going to choose XSM_TARGET, but the description "/* Can perform on
>>> self or your target domain */" confused me a bit, as there was no target
>>> domain involved as I thought, XSM_PRIV
>>> sounded too strictly to me, etc. So, I decided to leave a "hook" for the
>>> RFC version. But, now I see that XSM_TARGET might be indeed better
>>> choice across all possible variants.
>>
>> If you unravel the craftiness that is xsm_default_action, there is
>> actually a bit of hierarchy there. If you set the default_action to
>> XSM_TARGET, it will first check if calling domain(src) is the target,
>> then falls into the XSM_DM_PRIV check which is if src->target == target,
>> and then finally checks if is_control_domain(src). That will constrict
>> the operation so that a domain can call it on itself, a device model
>> domain (stubdom) can call it on the domain it is backing, and the
>> control domain can make the call. I am not a 100% sure on this but I do
>> not believe a hardware domain would be able to make the call with it set
>> to XSM_TARGET and not employing Flask.
> 
> Afaict (perhaps leaving aside late-hwdom, which I have little knowledge
> of) right now we have is_control_domain(d) == is_hardware_domain(d).

That is my fault for not being more explicit. When I refer to a
"hardware domain" I am referring to what you call "late-hwdom". When a
hardware domain that is not dom0 is constructed, it does not get the
`is_privileged` flag set to true which will result in
is_control_domain(d) to return false. Additionally there is currently no
`enum xsm_default` for hardware domain access/privilege and thus there
is no rule/access check defined in `default_action()` that allows any
of the XSM hooks to be restricted to the hardware domain. Which is what
I was referring to regarding the use of the hardware domain, aka
late-hwdom, without Flask. With Flask it becomes possible for the
hardware domain to be granted access to calls that are reserved to the
control domain under the dummy/default access policy,thus allowing it to
function fully.

dps

