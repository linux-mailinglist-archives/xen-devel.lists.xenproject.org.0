Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4F7323F4F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 15:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89380.168294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEvaj-0002iv-Ds; Wed, 24 Feb 2021 14:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89380.168294; Wed, 24 Feb 2021 14:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEvaj-0002iW-A1; Wed, 24 Feb 2021 14:56:41 +0000
Received: by outflank-mailman (input) for mailman id 89380;
 Wed, 24 Feb 2021 14:56:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEvai-0002iP-8U
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 14:56:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f80b112f-878c-45aa-860e-f50b9af381de;
 Wed, 24 Feb 2021 14:56:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B5B6AE6E;
 Wed, 24 Feb 2021 14:56:38 +0000 (UTC)
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
X-Inumbo-ID: f80b112f-878c-45aa-860e-f50b9af381de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614178598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uPqCEpP5t4ePNbFKNrDI7L2s3PL0fx65MATHmLjIN4=;
	b=XGzMkdYIWHL7UJ8rni00dziTSBNgQq6L3PyymioNTzl1KRO22UWQr8z6nI+4OtrbQsPJte
	OpFD5rVZNvc9Ry3hWsvYOjfbaL/LrUwlAdPgo8P4FluP6Hddwk8AK5nQ2wmbj5vGAepmsJ
	cYyHX5uki5530KFdqhz6q83BNiBVito=
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
 <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
 <24630.13192.874503.894268@mariner.uk.xensource.com>
 <1b251bb0-fecf-e5ed-c6e5-a2cb7c612cf1@citrix.com>
 <9e64f1b3-fbb3-6561-cf7b-498ed3839020@suse.com>
 <24630.25512.617137.512212@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07a0c050-85c6-ab42-2d28-0bd25a06986f@suse.com>
Date: Wed, 24 Feb 2021 15:56:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24630.25512.617137.512212@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.02.2021 15:33, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH 2/2] hvmloader: do not include system headers for type declarations"):
>> At what point do we just declare Alpine broken?  These are all
>> freestanding headers, an explicitly available for use, in the way we use
>> them.
> 
> There is IMO nothing wrong with Alpine here.  Alpine amd64 simply does
> not support compilation of 32-bit x86 userland binaries.
> 
> But that's OK for us.  Xen doe not require the execution of any 32-bit
> userland binaries.  hvmloader is not a userland binary.
> 
> As Roger said on irc
> 
> 13:35 <royger> but requiring a compiler that supports generating
>                i386 code doens't imply that we also have a libc for it?
>                
>> There are substantial portability costs for making changes like this,
>> which takes us from standards compliant C to GCC-isms-only.
> 
> Since we are defining our out standalone environment for hvmloader, we
> are in the position of the C *implementor*.  Compilers have features
> (like __builtin_va*) that are helpful for implementing standard C
> features like stdarg.h and indeed stdint.h.
> 
> Or to put it another way, GCC does not, by itself, provide (in
> Standard C terms) a "freestanding implementation".  Arguably GCC ought
> to provide stdint.h et al but in practice it doing so causes more
> trouble as it gets in the way of the implentors of hosted
> implementations.

But gcc _does_ provide a stdint.h.

> Jan Beulich writes ("Re: [PATCH 2/2] hvmloader: do not include system headers for type declarations"):
>> On 24.02.2021 12:07, Ian Jackson wrote:
>>> This code is only ever going to be for 32-bit x86, so I think the way
>>> Roger did it is fine.
>>
>> It is technically correct at this point in time, from all we can
>> tell. I can't see any reason though why a compiler might not
>> support wider int or, in particular, long long.
> 
> Our requirement for hvmloader is that we have an ILP32 LL64 compiler
> which generates 32-bit x86 machine code.  That is what "gcc -m32"
> means.

I'm not sure about the last statement; I'm pretty sure we don't
check that we have such a compiler (in tools/configure).

>  Whether future compiler(s) might exist which can provide ILP32
> LLP64 (and what type uint64_t is on such a compiler) is not relevant.
> 
>>> Doing it the other way, to cope with this file being used with
>>> compiler settings where the above set of types is wrong, would also
>>> imply more complex definitions of INT32_MIN et al.
>>
>> Well, that's only as far as the use of number suffixes goes. The
>> values used won't change, as these constants describe fixed width
>> types.
> 
> So the definitions would need to contain casts.

Which they can't, as that would make them unusable in preprocessor
directives.

>>>> Like the hypervisor, we should prefer using __SIZE_TYPE__
>>>> when available.
>>>
>>> I disagree.
>>
>> May I ask why? There is a reason providing of these types did get
>> added to (at least) gcc.
> 
> __SIZE_TYPE__ is provided by the compiler to the libc implementor.  It
> is one of those facilities like __builtin_va*.  The bulk of the code
> in hvmloader should not use this kind of thing.  It should use plain
> size_t.
> 
> As for the new header in hvmloader, it does not matter whether it uses
> __SIZE_TYPE__ or some other type which is known to be 32-bit, since
> this code is definitely only ever for 32-bit x86.

From a compiler perspective, "32-bit" and "x86" needs further pairing
with an OS, as it's the OS which defines the ABI. This is why further
up I did say "It is technically correct at this point in time, from
all we can tell" - we imply that all OSes we want to be able to build
on provide a suitable ABI, so we can use their compilers.

>> One argument against this would be above mentioned independence
>> on any ABI the compiler would be built for, but I'd buy that only
>> if above we indeed used __attribute__((__mode__())), as that's
>> the only way to achieve such independence.
> 
> We don't want or need to support building hvmloader with a differnet
> ABI.
> 
>>>> Nit: Perhaps better omit the unnecessary inner parentheses?
>>>
>>> We should definitely keep the inner parentheses.  I don't want to
>>> start carefully reasoning about precisely which inner parentheses are
>>> necesary for macro argument parsing correctness.
>>
>> Can you give me an example of when the inner parentheses would be
>> needed? I don't think they're needed no matter whether (taking the
>> example here) __builtin_va_...() were functions or macros. They
>> would of course be needed if the identifiers were part of
>> expressions beyond the mere function invocation.
> 
> You mention the situation where the parentheses would be needed
> yourself.

Okay, if that would have been your example, then since there are
no further expressions involved here you agree parentheses aren't
needed here?

JAn

