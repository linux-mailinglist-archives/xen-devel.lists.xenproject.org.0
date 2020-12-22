Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7342E08B9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57721.101087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krere-000105-Vl; Tue, 22 Dec 2020 10:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57721.101087; Tue, 22 Dec 2020 10:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krere-0000zf-SG; Tue, 22 Dec 2020 10:25:58 +0000
Received: by outflank-mailman (input) for mailman id 57721;
 Tue, 22 Dec 2020 10:25:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krerd-0000zZ-Cl
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:25:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krerd-00027r-3A; Tue, 22 Dec 2020 10:25:57 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krerc-0005b5-S2; Tue, 22 Dec 2020 10:25:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=OISANKA+Em+nyojPb2IZuqCZ10Eby1rTAbOa/6ZrpnE=; b=nmad/TldN59BS4d+27J1vna20l
	VMul28fqzwKPU0y0o+qvSk9cc6FzJvwfLfsDjkoqJEl3sy1qnul/DaBie9khBX0DN86lIDdqeipMc
	oG33tMel9AmzEBXVLAr1gPx/8Nyyop/CN3/PsvOz1xnCXc92/u5OIFzeOR7uAr7ruJP8=;
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
 <7edf2139-b63e-00c9-7172-524566f942ae@citrix.com>
 <09fd7598-9899-9b4c-68ba-f90b3bc47d6f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <35b24879-e075-8066-603a-518fbb82f656@xen.org>
Date: Tue, 22 Dec 2020 10:25:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <09fd7598-9899-9b4c-68ba-f90b3bc47d6f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 22/12/2020 07:50, Jan Beulich wrote:
> On 21.12.2020 19:45, Andrew Cooper wrote:
>> On 21/12/2020 18:36, Julien Grall wrote:
>>>> @@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
>>>>        if ( init_status & INIT_watchdog )
>>>>            watchdog_domain_destroy(d);
>>>>    +    /* Must not hit a continuation in this context. */
>>>> +    ASSERT(domain_teardown(d) == 0);
>>> The ASSERT() will become a NOP in production build, so
>>> domain_teardown_down() will not be called.
>>
>> Urgh - its not really a nop, but it's evaluation isn't symmetric between
>> debug and release builds.  I'll need an extra local variable.
> 
> Or use ASSERT_UNREACHABLE(). (I admit I don't really like the
> resulting constructs, and would like to propose an alternative,
> even if I fear it'll be controversial.)
> 
>>> However, I think it would be better if we pass an extra argument to
>>> indicated wheter the code is allowed to preempt. This would make the
>>> preemption check more obvious in evtchn_destroy() compare to the
>>> current d->is_dying != DOMDYING_dead.
>>
>> We can have a predicate if you'd prefer, but plumbing an extra parameter
>> is wasteful, and can only cause confusion if it is out of sync with
>> d->is_dying.
> 
> I agree here - it wasn't so long ago that event_channel.c gained
> a DOMDYING_dead check, and I don't see why we shouldn't extend
> this approach to here and elsewhere.

I think the d->is_dying != DOMYING_dead is difficult to understand even 
with the comment on top. This was ok in one place, but now it will 
spread everywhere. So at least, I would suggest to introduce a wrapper 
that is better named.

There is also a futureproof concern. At the moment, we are considering 
the preemption will not be needed in domain_create(). I am ready to bet 
that the assumption is going to be broken sooner or later.

As we don't have an extra parameter, we would need to investigate all 
the callers in helpers to see where we need to drop the d->is_dying != 
DOMYING_dead. I am sure you will agree that there is a risk to screw up.

With an extra parameter, it is easier to re-enable preemption when needed.

Anyway, both of you seem to agree on the approach here. If that's what 
you want, then so it be, but that's not something I will feel confident 
to Ack. Although, I will not Nack it.

Cheers,

-- 
Julien Grall

