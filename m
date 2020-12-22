Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE52E095D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 12:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57762.101201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfZn-0006AF-2V; Tue, 22 Dec 2020 11:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57762.101201; Tue, 22 Dec 2020 11:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfZm-00069s-VH; Tue, 22 Dec 2020 11:11:34 +0000
Received: by outflank-mailman (input) for mailman id 57762;
 Tue, 22 Dec 2020 11:11:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krfZl-00069n-3N
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 11:11:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4efe9e6-9f6c-4049-9abd-0acafbfabc3c;
 Tue, 22 Dec 2020 11:11:32 +0000 (UTC)
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
X-Inumbo-ID: e4efe9e6-9f6c-4049-9abd-0acafbfabc3c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608635491;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=RhnixBKziMiL5VIohcadd1Ri8y4M8sTx3hOwKYigZN4=;
  b=f44zwu06i4vWCr0mnP8pJj1ckkru40dvfiFxxKDfendQOxGNBOlkoy5W
   Y7uc2Dx4e5K3KIfTY21zf0uGk8jfpmc33vEu+0QT6lASd2OJ0sQ56amuN
   n3teBhO8EP8YIsYUBPGZ9guqm2D/chv4ru+zPU2PhZPE02sT0LH3ISp/T
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3jfqed5Wn4bgMXyaCk54SIdEIY65rWJUyP0KYB/2Xc/Knf6c77ycX2QzLyHnjIhCqnNZklu/EJ
 Q+wHKoFvVmE/nIkcK/Iv6eGWWX7hFN7nILibuh2iPSPGe0YgBs84Q/e9DqCZsCcBecAUSg3lkb
 iiJqOdNibL843AvGUQIUKQChz+u8oXQu+2SM5F9h+KfqRGC3BTaLITs3p+EhgebG+0J2sl6v74
 cs7oQn/px2MgXYsHMD1LfnjVej0s2K58DoVhAGNm2iMfPMjY7Fq397rJWcCd/uKcI7SRGgYYb9
 OdE=
X-SBRS: 5.2
X-MesageID: 33733941
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="33733941"
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
 <7edf2139-b63e-00c9-7172-524566f942ae@citrix.com>
 <09fd7598-9899-9b4c-68ba-f90b3bc47d6f@suse.com>
 <35b24879-e075-8066-603a-518fbb82f656@xen.org>
 <892cb753-594b-15df-2342-9d10d5787f46@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3bf7c6f4-d945-8a70-47eb-eab99099fe25@citrix.com>
Date: Tue, 22 Dec 2020 11:11:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <892cb753-594b-15df-2342-9d10d5787f46@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 10:53, Jan Beulich wrote:
> On 22.12.2020 11:25, Julien Grall wrote:
>> On 22/12/2020 07:50, Jan Beulich wrote:
>>> On 21.12.2020 19:45, Andrew Cooper wrote:
>>>> On 21/12/2020 18:36, Julien Grall wrote:
>>>>>> @@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
>>>>>>        if ( init_status & INIT_watchdog )
>>>>>>            watchdog_domain_destroy(d);
>>>>>>    +    /* Must not hit a continuation in this context. */
>>>>>> +    ASSERT(domain_teardown(d) == 0);
>>>>> The ASSERT() will become a NOP in production build, so
>>>>> domain_teardown_down() will not be called.
>>>> Urgh - its not really a nop, but it's evaluation isn't symmetric between
>>>> debug and release builds.  I'll need an extra local variable.
>>> Or use ASSERT_UNREACHABLE(). (I admit I don't really like the
>>> resulting constructs, and would like to propose an alternative,
>>> even if I fear it'll be controversial.)
>>>
>>>>> However, I think it would be better if we pass an extra argument to
>>>>> indicated wheter the code is allowed to preempt. This would make the
>>>>> preemption check more obvious in evtchn_destroy() compare to the
>>>>> current d->is_dying != DOMDYING_dead.
>>>> We can have a predicate if you'd prefer, but plumbing an extra parameter
>>>> is wasteful, and can only cause confusion if it is out of sync with
>>>> d->is_dying.
>>> I agree here - it wasn't so long ago that event_channel.c gained
>>> a DOMDYING_dead check, and I don't see why we shouldn't extend
>>> this approach to here and elsewhere.
>> I think the d->is_dying != DOMYING_dead is difficult to understand even 
>> with the comment on top. This was ok in one place, but now it will 
>> spread everywhere. So at least, I would suggest to introduce a wrapper 
>> that is better named.
>>
>> There is also a futureproof concern. At the moment, we are considering 
>> the preemption will not be needed in domain_create(). I am ready to bet 
>> that the assumption is going to be broken sooner or later.
> This is a fair consideration, yet I'm having trouble seeing what it
> might be that would cause domain_create() to require preemption.
> The function is supposed to only produce an empty container. But yes,
> if e.g. vCPU creation was to move here, the situation would indeed
> change.

As discussed, I no longer think that is a good plan, especially if we
want a sane mechanism for not allocating AMX memory for domains not
configured to use AMX.

domain_create() (and vcpu_create() to a lesser extent) are the functions
which can't become preemptible, because they are the allocation and
setup of the objects which would be used to store continuation
information for other hypercalls.

The only option if these get too complicated is to split the complexity
out into other hypercalls.

~Andrew

