Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3E836D40E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 10:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119083.225400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfif-0004Ov-Kq; Wed, 28 Apr 2021 08:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119083.225400; Wed, 28 Apr 2021 08:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfif-0004OW-HT; Wed, 28 Apr 2021 08:38:53 +0000
Received: by outflank-mailman (input) for mailman id 119083;
 Wed, 28 Apr 2021 08:38:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbfie-0004OR-7G
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 08:38:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a53303be-6df7-44f2-991b-7de50071bdcb;
 Wed, 28 Apr 2021 08:38:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D589AFD0;
 Wed, 28 Apr 2021 08:38:50 +0000 (UTC)
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
X-Inumbo-ID: a53303be-6df7-44f2-991b-7de50071bdcb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619599130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXMQ2UMp5IapWeYwowL8EQKa47GsyR+L7IZoMOU2bh4=;
	b=BNtb4MFIL0nEZWZ3Al46LMcYnHMJ3Elvnswpo7AlgHwN715a/xHAG65hmNtNEJch0aMGxT
	waI060vyGmDpvz6j/CZq7o9so5/vrQJbiXTSy670CBnx2snw4OD0v2el8lJdhx/Yt77Tg9
	D41KkVLCBgnuFxN7YpKq3BLrDoNtJlc=
Subject: Re: [PATCH] x86/emul: Use existing X86_EXC_* constants
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426124535.23814-1-andrew.cooper3@citrix.com>
 <f11189be-7ce7-ed54-a078-541eb3513eba@suse.com>
 <8c23d63a-e93f-6d2d-aaff-c816503f73e2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7425e0e7-f4ea-9bf2-d063-ba142b61b388@suse.com>
Date: Wed, 28 Apr 2021 10:38:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8c23d63a-e93f-6d2d-aaff-c816503f73e2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 20:56, Andrew Cooper wrote:
> On 27/04/2021 08:09, Jan Beulich wrote:
>> On 26.04.2021 14:45, Andrew Cooper wrote:
>>> ... rather than having separate definitions locally.  EXC_HAS_EC in particular
>>> is missing #CP, #VC and #SX vs X86_EXC_HAVE_EC.
>>>
>>> Also switch a raw 14 for X86_EXC_PF in x86_emul_pagefault().
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>>  xen/arch/x86/x86_emulate/x86_emulate.c | 739 ++++++++++++++++-----------------
>>>  xen/arch/x86/x86_emulate/x86_emulate.h |   4 +-
>>>  2 files changed, 361 insertions(+), 382 deletions(-)
>> This is a lot of code churn (almost all some slight growth) for this
>> kind of a change.
> 
> Interestingly, no lines needed re-wrapping as a consequence.
> 
> [Answering out of order]
> 
>>  The other option,
>> not reducing churn but reducing rather than increasing code volume (and
>> hence imo helping readability), would be to have shorthands for at
>> least some frequently raised exceptions like #UD and #GP - e.g.
>> generate_ud_if(). Thougths?
> 
> #UD and #GP[0] are the overwhelming majority of cases.   If you want to
> reduce code volume further, I've always found the "generate" on the
> front rather gratuitous.  "raise" is a more common expression to use
> with exceptions.

Indeed I, too, have been wondering whether "raise" wouldn't be better
(but see also below). "generate_exception" predates my participation
in development, iirc.

>>  I'm not opposed, but I'd like to explore alternatives
>> first. I know you often dislike token concatenation in macros, which
>> would be my first suggestion to get churn down here.
> 
> Outside of a few specific cases, yes, but as you can see in XTF,
> exception handling is one area where IMO clarity can be improved with
> certain limited macro magic.
> 
> In the emulator, I could get behind a single #define RAISE() along the
> lines of:
> 
> #define RAISE(e, ...)
> do {
>     BUILD_BUG_ON(((X86_EXC_HAS_EC & (1u  << X86_EXC_##e)) !=
> __count_args(__VA_ARGS__));
>     x86_emul_hw_exception(X86_EXC_##e, __count_args(__VA_ARGS__) ?
> __VA_ARGS__ : X86_EVENT_NO_EC, ctxt);
>     rc = X86EMUL_EXCEPTION;
>     goto done;
> } while ( 0 )

Looks good to me at a first glance, except that I think the left
side of the != in the BUILD_BUG_ON() needs converting to bool
(either explicitly, or by shifting right X86_EXC_HAS_EC instead
of shifting left 1u).

> It's obviously playing behind your back, unlike generate_exception(),

Playing behind our backs? I don't think I see what you mean. 

> and does build-time checking that error codes are handled correctly
> (unlike mkec() which has a substantial quantity of code bloat to not
> actually handle it correctly at runtime).

Are you telling me that the compiler doesn't do enough constant
folding there? And I'm also not seeing what doesn't get handled
correctly there.

> I dislike _if() suffixed macros, again for obfuscation reasons.
> 
> if ( foo )
>     RAISE(UD);
> 
> is far more normal C than
> 
> RAISE_IF(UD, foo);
> or
> RAISE_IF(foo, UD);
> 
> neither if which is a natural reading order.  The reduction in line
> count does not equate to improved code clarity.

Not sure here. I wouldn't object the change you suggest, but I've
never had a problem with generate_exception_if(). I guess it's
less clear with RAISE_IF(), but that may be an entirely personal
perception. It was for that reason though that I suggested (now
adapting to the alternative naming) RAISE_UD_IF() as a possible
shorthand. As a good example where I think all the extra if()
would make the code harder to read, please see e.g. the pending
"x86emul: support tile multiplication insns".

>  Frankly, areas of
> x86_emulate() would benefit greatly from extra spacing per our normal
> coding style.

I wonder what you refer to by "normal" here: If I guess correctly
what you mean, I don't think ./CODING_STYLE mandates anything.
Not even blank lines between non-fall-through case label blocks.
In recent work I've been trying to separate logical chunks, but I
guess I may not have gone far enough for your taste ...

Really what I'm still hoping to have a good idea for is how to
split up the gigantic switch() statement in there, without having
to introduce dozens of functions with very long parameter lists,
and without sacrificing the centralized SIMD handling immediately
after that switch(). Ideally I'd want to even split up the
monolithic source file, as - especially with older gcc - its
compilation has been dominating build time particularly when
passing make a sufficiently high -j.

Jan

