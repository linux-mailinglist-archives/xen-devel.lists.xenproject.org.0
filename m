Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DC92C62F8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 11:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39133.71923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiau5-00060w-6U; Fri, 27 Nov 2020 10:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39133.71923; Fri, 27 Nov 2020 10:23:01 +0000
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
	id 1kiau5-00060W-2o; Fri, 27 Nov 2020 10:23:01 +0000
Received: by outflank-mailman (input) for mailman id 39133;
 Fri, 27 Nov 2020 10:22:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kiau3-00060R-Nk
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 10:22:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d2630ba-47fd-4d95-a9dd-11a1eb657d8c;
 Fri, 27 Nov 2020 10:22:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C728DAC2F;
 Fri, 27 Nov 2020 10:22:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kiau3-00060R-Nk
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 10:22:59 +0000
X-Inumbo-ID: 0d2630ba-47fd-4d95-a9dd-11a1eb657d8c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0d2630ba-47fd-4d95-a9dd-11a1eb657d8c;
	Fri, 27 Nov 2020 10:22:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606472577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRWyPz7nptY60EVFk7sxsNcVyrTPLHy7zKH/6dyJ0rQ=;
	b=d/ZFS/W/0lZAu+tLiDjBIm02M1rICaaoXDLBNBVNj2ZMXOx0FjBj5zqx1o2bBGa1WLg0JH
	mlPk4LTf6WqACva8+5rdZt7IuWvhhGRE5VTf0LQ3nTmtrYyCBJA+od6JFzcnFmudZbBkM1
	yUto/Up/4vGpsKBmrhWjrrfNjBwB+Qs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C728DAC2F;
	Fri, 27 Nov 2020 10:22:57 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: Work around Clang code generation bug with asm
 parameters
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201111124512.2268-1-andrew.cooper3@citrix.com>
 <8282790a-a0bd-1d33-d992-9d194766254e@suse.com>
 <3ecb8469-8504-054a-078d-4bf32f8f82c4@citrix.com>
 <cfc7ad85-22b3-701f-f1d8-5009e5262b92@suse.com>
Message-ID: <539850cd-9e59-a07f-9c9f-ddf9fc28f203@suse.com>
Date: Fri, 27 Nov 2020 11:22:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cfc7ad85-22b3-701f-f1d8-5009e5262b92@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.11.2020 09:14, Jan Beulich wrote:
> On 11.11.2020 21:01, Andrew Cooper wrote:
>> On 11/11/2020 15:11, Jan Beulich wrote:
>>> On 11.11.2020 13:45, Andrew Cooper wrote:
>>>> Clang 9 and later don't handle the clobber of %r10 correctly in
>>>> _hypercall64_4().  See https://bugs.llvm.org/show_bug.cgi?id=48122
>>> Are you sure this is a bug?
>>
>> Yes.
>>
>>>  With ...
>>>
>>>>  #define _hypercall64_4(type, hcall, a1, a2, a3, a4)                     \
>>>>      ({                                                                  \
>>>> -        long res, tmp__;                                                \
>>>> -        register long _a4 asm ("r10") = ((long)(a4));                   \
>>>> +        long res, _a1 = (long)(a1), _a2 = (long)(a2),                   \
>>>> +            _a3 = (long)(a3);                                           \
>>>> +        register long _a4 asm ("r10") = (long)(a4);                     \
>>>>          asm volatile (                                                  \
>>>>              "call hypercall_page + %c[offset]"                          \
>>>> -            : "=a" (res), "=D" (tmp__), "=S" (tmp__), "=d" (tmp__),     \
>>>> -              "=&r" (tmp__) ASM_CALL_CONSTRAINT                         \
>>> ... this we've requested "any register", while with ...
>>>
>>>> -            : [offset] "i" (hcall * 32),                                \
>>>> -              "1" ((long)(a1)), "2" ((long)(a2)), "3" ((long)(a3)),     \
>>>> -              "4" (_a4)                                                 \
>>> ... this we've asked for that specific register to be initialized
>>> from r10 (and without telling the compiler that r10 is going to
>>> change).
>>
>> Consider applying that same reasoning to "1" instead of "4".  In that
>> case, a1 would no longer be bound to %rdi.
> 
> That's different: "=D" specifies the register, and "1" says "use
> the same register as input". Whereas, as said, "=&r" says "use
> any register" with "1" saying "use the same register" and (_a4)
> specifying where the value is to come from.
> 
>> The use of "4" explicitly binds the input and the output, which includes
>> requiring them to be the same register.
>>
>> Furthermore, LLVM tends to consider "not behaving in the same was as
>> GCC" a bug.
> 
> That's a fair statement, but then still the description wants
> re-wording. Plus of course future gcc is free to change their
> behavior to that currently observed with clang.
> 
> Consider the following example (on an arch where "f" is a
> floating point register and there are ways to copy directly
> between GPR and floating point registers:
> 
>    int i;
>    register float f asm("f7") = <input>;
>    asm("..." : "=r" (i) : "0" (f));
> 
> In this case obviously f7 can't be used for i (as it doesn't
> match "r"). It's merely that the initial value of i is to come
> from f7. In fact for Arm64 this
> 
> extern float flt;
> 
> int test(void) {
> 	int i;
> 	register float f asm("s7") = flt;
> 	asm("add %0,%0,5" : "=r" (i) : "0" (f));
> 	return i;
> }
> 
> behaves exactly as described:
> 
> test:
>         adrp    x0, flt
>         ldr     s7, [x0, @lo12(flt)]
>         fmov    w0, s7
>         add     x0, x0, #5
>         ret
> 
> (Whether fmov is a sensible choice here is a different question;
> I'd have expected some fcvt*.)

Meanwhile I've realized that I neither need to resort to Arm here,
nor to floating point, e.g.

int test2(int in) {
	int i;
	register int ri asm("ecx") = in;
	asm("nop %0" : "=r" (i) : "0" (ri));
	return i;
}

You'll find that the resulting code (at -O2; gcc 10.2.0) doesn't
use %ecx at all - %edi gets moved directly to %eax.

Jan

