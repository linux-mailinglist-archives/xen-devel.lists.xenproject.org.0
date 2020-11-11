Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836B2AEAD7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:09:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24330.51503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclBW-0000U3-Fd; Wed, 11 Nov 2020 08:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24330.51503; Wed, 11 Nov 2020 08:08:54 +0000
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
	id 1kclBW-0000Te-CM; Wed, 11 Nov 2020 08:08:54 +0000
Received: by outflank-mailman (input) for mailman id 24330;
 Wed, 11 Nov 2020 08:08:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kclBU-0000TZ-W7
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:08:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0749748-52be-40a5-8971-338cf1005c26;
 Wed, 11 Nov 2020 08:08:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AB63AC82;
 Wed, 11 Nov 2020 08:08:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kclBU-0000TZ-W7
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:08:53 +0000
X-Inumbo-ID: f0749748-52be-40a5-8971-338cf1005c26
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f0749748-52be-40a5-8971-338cf1005c26;
	Wed, 11 Nov 2020 08:08:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605082129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmp8pwriy0PxUYkKMYXfKsdmcXzIzJkX96FtNs/m6+Q=;
	b=ihT04QN2Nk4f0MgBINwa04ctsgoBy0kMacSXYYQvtpGymwLnLrvIpx/DAXWWM41XaC1DC8
	OTmmWxxsXEcJpMpSw/yh+j+fa5/PWRiTFjosdzzJUOjzStf3bZ33kxFDLGmQOz1VcFPqsz
	cjVUhqJe10PeaekcJ5gHZnhUYMjfZJg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9AB63AC82;
	Wed, 11 Nov 2020 08:08:49 +0000 (UTC)
Subject: Re: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: Oleksandr <olekstysh@gmail.com>
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien.grall@arm.com>, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-18-git-send-email-olekstysh@gmail.com>
 <004e01d6a6cf$09cd9f40$1d68ddc0$@xen.org>
 <700a643e-641e-c243-cb2d-7ad8b5a9b8ad@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4088e1b-1a50-d2fd-29b0-0f8a2cf4e7d4@suse.com>
Date: Wed, 11 Nov 2020 09:08:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <700a643e-641e-c243-cb2d-7ad8b5a9b8ad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 21:53, Oleksandr wrote:
> 
> On 20.10.20 13:51, Paul Durrant wrote:
> 
> Hi Paul.
> 
> Sorry for the late response.
> 
>>
>>> -----Original Message-----
>>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>>> Sent: 15 October 2020 17:44
>>> To: xen-devel@lists.xenproject.org
>>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano Stabellini <sstabellini@kernel.org>;
>>> Julien Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>>> <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Paul Durrant
>>> <paul@xen.org>; Julien Grall <julien.grall@arm.com>
>>> Subject: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
>>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch introduces a helper the main purpose of which is to check
>>> if a domain is using IOREQ server(s).
>>>
>>> On Arm the current benefit is to avoid calling handle_io_completion()
>>> (which implies iterating over all possible IOREQ servers anyway)
>>> on every return in leave_hypervisor_to_guest() if there is no active
>>> servers for the particular domain.
>>> Also this helper will be used by one of the subsequent patches on Arm.
>>>
>>> This involves adding an extra per-domain variable to store the count
>>> of servers in use.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> CC: Julien Grall <julien.grall@arm.com>
>>>
>>> ---
>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>> "Add support for Guest IO forwarding to a device emulator"
>>>
>>> Changes RFC -> V1:
>>>     - new patch
>>>
>>> Changes V1 -> V2:
>>>     - update patch description
>>>     - guard helper with CONFIG_IOREQ_SERVER
>>>     - remove "hvm" prefix
>>>     - modify helper to just return d->arch.hvm.ioreq_server.nr_servers
>>>     - put suitable ASSERT()s
>>>     - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in set_ioreq_server()
>>>     - remove d->ioreq_server.nr_servers = 0 from hvm_ioreq_init()
>>> ---
>>>   xen/arch/arm/traps.c    | 15 +++++++++------
>>>   xen/common/ioreq.c      |  7 ++++++-
>>>   xen/include/xen/ioreq.h | 14 ++++++++++++++
>>>   xen/include/xen/sched.h |  1 +
>>>   4 files changed, 30 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index 507c095..a8f5fdf 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -2261,14 +2261,17 @@ static bool check_for_vcpu_work(void)
>>>       struct vcpu *v = current;
>>>
>>>   #ifdef CONFIG_IOREQ_SERVER
>>> -    bool handled;
>>> +    if ( domain_has_ioreq_server(v->domain) )
>>> +    {
>>> +        bool handled;
>>>
>>> -    local_irq_enable();
>>> -    handled = handle_io_completion(v);
>>> -    local_irq_disable();
>>> +        local_irq_enable();
>>> +        handled = handle_io_completion(v);
>>> +        local_irq_disable();
>>>
>>> -    if ( !handled )
>>> -        return true;
>>> +        if ( !handled )
>>> +            return true;
>>> +    }
>>>   #endif
>>>
>>>       if ( likely(!v->arch.need_flush_to_ram) )
>>> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
>>> index bcd4961..a72bc0e 100644
>>> --- a/xen/common/ioreq.c
>>> +++ b/xen/common/ioreq.c
>>> @@ -39,9 +39,14 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
>>>                                struct ioreq_server *s)
>>>   {
>>>       ASSERT(id < MAX_NR_IOREQ_SERVERS);
>>> -    ASSERT(!s || !d->ioreq_server.server[id]);
>>> +    ASSERT(d->ioreq_server.server[id] ? !s : !!s);
>> That looks odd. How about ASSERT(!s ^ !d->ioreq_server.server[id])?
> 
> ok, looks like it will work.
> 
> 
>>    Paul
>>
>>>       d->ioreq_server.server[id] = s;
>>> +
>>> +    if ( s )
>>> +        d->ioreq_server.nr_servers++;
>>> +    else
>>> +        d->ioreq_server.nr_servers--;
>>>   }
>>>
>>>   #define GET_IOREQ_SERVER(d, id) \
>>> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
>>> index 7b03ab5..0679fef 100644
>>> --- a/xen/include/xen/ioreq.h
>>> +++ b/xen/include/xen/ioreq.h
>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>       uint8_t                bufioreq_handling;
>>>   };
>>>
>>> +#ifdef CONFIG_IOREQ_SERVER
>>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>>> +{
>>> +    ASSERT((current->domain == d) || atomic_read(&d->pause_count));
>>> +
>> This seems like an odd place to put such an assertion.
> 
> I might miss something or interpreted incorrectly but these asserts are 
> the result of how I understood the review comment on previous version [1].
> 
> I will copy a comment here for the convenience:
> "This is safe only when d == current->domain and it's not paused,
> or when they're distinct and d is paused. Otherwise the result is
> stale before the caller can inspect it. This wants documenting by
> at least a comment, but perhaps better by suitable ASSERT()s."

The way his reply was worded, I think Paul was wondering about the
place where you put the assertion, not what you actually assert. 

>>> +    return d->ioreq_server.nr_servers;
>>> +}
>>> +#else
>>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>>> +{
>>> +    return false;
>>> +}
>>> +#endif
>>> +
>> Can this be any more compact? E.g.
>>
>> return IS_ENABLED(CONFIG_IOREQ_SERVER) && d->ioreq_server.nr_servers;
>>
>> ?
> I have got a compilation error this way (if CONFIG_IOREQ_SERVER is 
> disabled):
> 
> ...xen/4.14.0+gitAUTOINC+ee22110219-r0/git/xen/include/xen/ioreq.h:62:48: 
> error: ‘const struct domain’ has no member named ‘ioreq_server’
>       return IS_ENABLED(CONFIG_IOREQ_SERVER) && d->ioreq_server.nr_servers;
>                                                  ^
> as domain's ioreq_server struct is guarded by CONFIG_IOREQ_SERVER as well.

The #ifdef is unavoidable here, I agree, but it should be inside
the function's body. There's no need to duplicate the rest of it.

Jan

