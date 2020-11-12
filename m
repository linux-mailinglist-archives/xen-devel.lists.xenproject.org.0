Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483F2B00FD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25522.53328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd7ku-00067g-6F; Thu, 12 Nov 2020 08:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25522.53328; Thu, 12 Nov 2020 08:14:56 +0000
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
	id 1kd7ku-00067H-1x; Thu, 12 Nov 2020 08:14:56 +0000
Received: by outflank-mailman (input) for mailman id 25522;
 Thu, 12 Nov 2020 08:14:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd7ks-00067C-Hx
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:14:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d513f8-27e5-4e09-87ff-0ca5ae1e1e6c;
 Thu, 12 Nov 2020 08:14:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0D8AAC48;
 Thu, 12 Nov 2020 08:14:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd7ks-00067C-Hx
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:14:54 +0000
X-Inumbo-ID: f5d513f8-27e5-4e09-87ff-0ca5ae1e1e6c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f5d513f8-27e5-4e09-87ff-0ca5ae1e1e6c;
	Thu, 12 Nov 2020 08:14:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605168892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Lrw4MaCanCjK64q0hqvuM3XkTxYJuV94P34RGjf6/I=;
	b=mOw4tHw3T9PyIBN7qdPZEQXzwaZtmSnMZ4fy9i8D3aqqlQ+8Wpph/HRkMTUCdp6wPizcIW
	fz0Ypg0bh4gyvjjaa0DTfgciaGYS2wiSTl3+VKuW+UJLwobFCH7vK2rqJmbXIv2qXg4xJP
	aTfOlb+vzQcD7fKrI3TH0pe+pCDOjXk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A0D8AAC48;
	Thu, 12 Nov 2020 08:14:52 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: Work around Clang code generation bug with asm
 parameters
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201111124512.2268-1-andrew.cooper3@citrix.com>
 <8282790a-a0bd-1d33-d992-9d194766254e@suse.com>
 <3ecb8469-8504-054a-078d-4bf32f8f82c4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfc7ad85-22b3-701f-f1d8-5009e5262b92@suse.com>
Date: Thu, 12 Nov 2020 09:14:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <3ecb8469-8504-054a-078d-4bf32f8f82c4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.11.2020 21:01, Andrew Cooper wrote:
> On 11/11/2020 15:11, Jan Beulich wrote:
>> On 11.11.2020 13:45, Andrew Cooper wrote:
>>> Clang 9 and later don't handle the clobber of %r10 correctly in
>>> _hypercall64_4().  See https://bugs.llvm.org/show_bug.cgi?id=48122
>> Are you sure this is a bug?
> 
> Yes.
> 
>>  With ...
>>
>>>  #define _hypercall64_4(type, hcall, a1, a2, a3, a4)                     \
>>>      ({                                                                  \
>>> -        long res, tmp__;                                                \
>>> -        register long _a4 asm ("r10") = ((long)(a4));                   \
>>> +        long res, _a1 = (long)(a1), _a2 = (long)(a2),                   \
>>> +            _a3 = (long)(a3);                                           \
>>> +        register long _a4 asm ("r10") = (long)(a4);                     \
>>>          asm volatile (                                                  \
>>>              "call hypercall_page + %c[offset]"                          \
>>> -            : "=a" (res), "=D" (tmp__), "=S" (tmp__), "=d" (tmp__),     \
>>> -              "=&r" (tmp__) ASM_CALL_CONSTRAINT                         \
>> ... this we've requested "any register", while with ...
>>
>>> -            : [offset] "i" (hcall * 32),                                \
>>> -              "1" ((long)(a1)), "2" ((long)(a2)), "3" ((long)(a3)),     \
>>> -              "4" (_a4)                                                 \
>> ... this we've asked for that specific register to be initialized
>> from r10 (and without telling the compiler that r10 is going to
>> change).
> 
> Consider applying that same reasoning to "1" instead of "4".  In that
> case, a1 would no longer be bound to %rdi.

That's different: "=D" specifies the register, and "1" says "use
the same register as input". Whereas, as said, "=&r" says "use
any register" with "1" saying "use the same register" and (_a4)
specifying where the value is to come from.

> The use of "4" explicitly binds the input and the output, which includes
> requiring them to be the same register.
> 
> Furthermore, LLVM tends to consider "not behaving in the same was as
> GCC" a bug.

That's a fair statement, but then still the description wants
re-wording. Plus of course future gcc is free to change their
behavior to that currently observed with clang.

Consider the following example (on an arch where "f" is a
floating point register and there are ways to copy directly
between GPR and floating point registers:

   int i;
   register float f asm("f7") = <input>;
   asm("..." : "=r" (i) : "0" (f));

In this case obviously f7 can't be used for i (as it doesn't
match "r"). It's merely that the initial value of i is to come
from f7. In fact for Arm64 this

extern float flt;

int test(void) {
	int i;
	register float f asm("s7") = flt;
	asm("add %0,%0,5" : "=r" (i) : "0" (f));
	return i;
}

behaves exactly as described:

test:
        adrp    x0, flt
        ldr     s7, [x0, @lo12(flt)]
        fmov    w0, s7
        add     x0, x0, #5
        ret

(Whether fmov is a sensible choice here is a different question;
I'd have expected some fcvt*.)

Similarly a constant initial value would demonstrate this (or
one necessarily coming from memory), albeit in a less obvious
way: It doesn't say "this constant lives in the register", but
"this constant is to be loaded into the register".

>> Also, by what I would have hoped is convention meanwhile, the new
>> macro local variables' names shouldn't start with an underscore,
>> but instead perhaps end in one. But to be honest, despite knowing
>> of the latent (albeit highly hypothetical) issue, each time I
>> find myself making such a comment I'm one tiny step closer to
>> giving up.
> 
> Convention is not created by you getting irritated at others getting
> irritated at you for requesting bizarre and unusual changes in submitted
> code, or by continuing to point things out, knowing that others
> specifically disagree with your reasoning in this case.
> 
> Convention is created when there is general agreement over the technical
> merits of writing code in one particular way vs the alternatives, *and*
> its written down somewhere, so this argument does not continue any further.
> 
> There is no restrictions or guidance in the coding style to prefer one
> form over another, therefore anything is acceptable.

Our coding style document imo ought to describe things not already
specified by the standard. What scopes certain identifiers are to
be considered reserved in is, however, written down there already.

Jan

