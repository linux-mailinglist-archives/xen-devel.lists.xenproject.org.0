Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F682E0902
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57752.101173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfIp-0004Gv-11; Tue, 22 Dec 2020 10:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57752.101173; Tue, 22 Dec 2020 10:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfIo-0004Ga-Tz; Tue, 22 Dec 2020 10:54:02 +0000
Received: by outflank-mailman (input) for mailman id 57752;
 Tue, 22 Dec 2020 10:54:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krfIo-0004GU-4Y
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:54:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9029e9db-51db-41c6-8837-fa7c6d32bd73;
 Tue, 22 Dec 2020 10:54:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34AE8ACF5;
 Tue, 22 Dec 2020 10:54:00 +0000 (UTC)
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
X-Inumbo-ID: 9029e9db-51db-41c6-8837-fa7c6d32bd73
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608634440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/x0HeMS+yuMcvDgCc+Ak4+11Gt2CGzVMRzeAxBnKLng=;
	b=Dd7A3AlyLCXMJsufFF+A9SKfLlubum0ndNWbU9jlB4xV2uPR6M3peozN7TiQdQvxx7T4FL
	TzQJ3aUNn5EEeCHd8O0UZ6NMfyNLsN8g02v9JU8n4cGNAmj5iflj0K0c+Rt08vWRHy66Jt
	vTE+bPXYJCGf6fLyrdiWfjhVkEQ6yDw=
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
 <7edf2139-b63e-00c9-7172-524566f942ae@citrix.com>
 <09fd7598-9899-9b4c-68ba-f90b3bc47d6f@suse.com>
 <35b24879-e075-8066-603a-518fbb82f656@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <892cb753-594b-15df-2342-9d10d5787f46@suse.com>
Date: Tue, 22 Dec 2020 11:53:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <35b24879-e075-8066-603a-518fbb82f656@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.12.2020 11:25, Julien Grall wrote:
> On 22/12/2020 07:50, Jan Beulich wrote:
>> On 21.12.2020 19:45, Andrew Cooper wrote:
>>> On 21/12/2020 18:36, Julien Grall wrote:
>>>>> @@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
>>>>>        if ( init_status & INIT_watchdog )
>>>>>            watchdog_domain_destroy(d);
>>>>>    +    /* Must not hit a continuation in this context. */
>>>>> +    ASSERT(domain_teardown(d) == 0);
>>>> The ASSERT() will become a NOP in production build, so
>>>> domain_teardown_down() will not be called.
>>>
>>> Urgh - its not really a nop, but it's evaluation isn't symmetric between
>>> debug and release builds.  I'll need an extra local variable.
>>
>> Or use ASSERT_UNREACHABLE(). (I admit I don't really like the
>> resulting constructs, and would like to propose an alternative,
>> even if I fear it'll be controversial.)
>>
>>>> However, I think it would be better if we pass an extra argument to
>>>> indicated wheter the code is allowed to preempt. This would make the
>>>> preemption check more obvious in evtchn_destroy() compare to the
>>>> current d->is_dying != DOMDYING_dead.
>>>
>>> We can have a predicate if you'd prefer, but plumbing an extra parameter
>>> is wasteful, and can only cause confusion if it is out of sync with
>>> d->is_dying.
>>
>> I agree here - it wasn't so long ago that event_channel.c gained
>> a DOMDYING_dead check, and I don't see why we shouldn't extend
>> this approach to here and elsewhere.
> 
> I think the d->is_dying != DOMYING_dead is difficult to understand even 
> with the comment on top. This was ok in one place, but now it will 
> spread everywhere. So at least, I would suggest to introduce a wrapper 
> that is better named.
> 
> There is also a futureproof concern. At the moment, we are considering 
> the preemption will not be needed in domain_create(). I am ready to bet 
> that the assumption is going to be broken sooner or later.

This is a fair consideration, yet I'm having trouble seeing what it
might be that would cause domain_create() to require preemption.
The function is supposed to only produce an empty container. But yes,
if e.g. vCPU creation was to move here, the situation would indeed
change.

Jan

