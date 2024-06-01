Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A78D6D68
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 03:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733929.1140193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDDql-0004xl-Cp; Sat, 01 Jun 2024 01:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733929.1140193; Sat, 01 Jun 2024 01:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDDql-0004vD-AE; Sat, 01 Jun 2024 01:48:03 +0000
Received: by outflank-mailman (input) for mailman id 733929;
 Sat, 01 Jun 2024 01:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKEA=ND=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sDDqk-0004v7-HY
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 01:48:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faa58236-1fb8-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 03:48:01 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-420180b5838so17618195e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 18:48:01 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213411b25dsm16047185e9.40.2024.05.31.18.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 18:48:00 -0700 (PDT)
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
X-Inumbo-ID: faa58236-1fb8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717206480; x=1717811280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gRVJdamzZHnCkHLExHkOawpaAPsoz9HUdRwUAkbcyzQ=;
        b=Q8TWH9tnssvdRhF9pyrR2VzqAGzU8ysAIQg1QfuftyJc2quB16sN6XAe0fLZNQb/Y3
         TQTGoL2SwSsghj/fm1HNbkiimSRvbc8jMVY+9Flt34Nbt0Aoxl6CkipA4+0OhCA3iUyl
         yakPk/LuxgTjKrN9Id9eU99OeHe80d92CUqtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717206480; x=1717811280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRVJdamzZHnCkHLExHkOawpaAPsoz9HUdRwUAkbcyzQ=;
        b=G77XnWzuPOhQf5F99vQLnn9DIt7JNEVhZvuLZ0xjOMal1DsAQObmYLtO05o1CNfxqm
         f1rS8j/yoQuDdx83iF58wHIQg1k3vrVJz67+gdjQK3Ya56ySGKrnUFbPpquZLr6v946h
         Cyp/hX3/mm9sfgOrub1Bel6McEEJXEEQRnyyWfUzSfUS7I/zjO8ceEfxLOSXguM9+dFs
         TOCXWRMsIMvc1ji4Q/HkuP00U+3c47jFqT7JsOsUNpZAK49crgxAM4qoqcns3uQX9luq
         jsgNbkAbkMjsXqA08XYIda7pf2in9XoSrtMox5vHmKQSWN/XhbfKOCyG8jzz8d7CSKYv
         rb2w==
X-Forwarded-Encrypted: i=1; AJvYcCUCdlqmJ5Ss0Fqj7UFqcb+E2qbeKME6jvrCd1SVV21hUGJbRtfJcsrrFp8aPZ6c7sDyXZEJa7tqIIOeKcAhK/bHti1T+plRmSUWilKlzl8=
X-Gm-Message-State: AOJu0YyP3FWyCYr2ckQVv5FOLpux09glwSN4Fp/fEtm5b/nB6XhOGv2Q
	pwNsS/26lFrWranmZAitmxjFjqRXoO7g6bfZILZslbeixO3EfSPzax2CKI2VqcU=
X-Google-Smtp-Source: AGHT+IHewf+TznFq+XhfNN1WsUvfeGqqeZUkOWjM7HLUVLd06daAQHeq6RUe1RBorj6puLkRT8l2mA==
X-Received: by 2002:a05:600c:34d2:b0:421:b39:9ea0 with SMTP id 5b1f17b1804b1-4212e05e489mr29077445e9.16.1717206480551;
        Fri, 31 May 2024 18:48:00 -0700 (PDT)
Message-ID: <b5a24f69-855d-49e8-b13b-7c9b2ee199f4@citrix.com>
Date: Sat, 1 Jun 2024 02:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] x86/bitops: Improve arch_ffs() in the general
 case
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-8-andrew.cooper3@citrix.com>
 <1660a2a7-cea4-4e6f-9286-0c134c34b6fb@suse.com>
 <57a47c76-c484-4309-8a87-a51f79dd48b6@suse.com>
 <b0838a62-1e6a-473a-a757-97091c84e164@citrix.com>
 <df7bb467-c778-43fb-bd04-f81f6e3dfd01@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <df7bb467-c778-43fb-bd04-f81f6e3dfd01@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2024 2:12 pm, Jan Beulich wrote:
> On 28.05.2024 14:30, Andrew Cooper wrote:
>> On 27/05/2024 2:37 pm, Jan Beulich wrote:
>>> On 27.05.2024 15:27, Jan Beulich wrote:
>>>> On 24.05.2024 22:03, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/include/asm/bitops.h
>>>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>>>> @@ -432,12 +432,28 @@ static inline int ffsl(unsigned long x)
>>>>>  
>>>>>  static always_inline unsigned int arch_ffs(unsigned int x)
>>>>>  {
>>>>> -    int r;
>>>>> +    unsigned int r;
>>>>> +
>>>>> +    if ( __builtin_constant_p(x > 0) && x > 0 )
>>>>> +    {
>>>>> +        /* Safe, when the compiler knows that x is nonzero. */
>>>>> +        asm ( "bsf %[val], %[res]"
>>>>> +              : [res] "=r" (r)
>>>>> +              : [val] "rm" (x) );
>>>>> +    }
>>>> In patch 11 relevant things are all in a single patch, making it easier
>>>> to spot that this is dead code: The sole caller already has a
>>>> __builtin_constant_p(), hence I don't see how the one here could ever
>>>> return true. With that the respective part of the description is then
>>>> questionable, too, I'm afraid: Where did you observe any actual effect
>>>> from this? Or if you did - what am I missing?
>>> Hmm, thinking about it: I suppose that's why you have
>>> __builtin_constant_p(x > 0), not __builtin_constant_p(x). I have to admit
>>> I'm (positively) surprised that the former may return true when the latter
>>> doesn't.
>> So was I, but this recommendation came straight from the GCC mailing
>> list.  And it really does work, even back in obsolete versions of GCC.
>>
>> __builtin_constant_p() operates on an expression not a value, and is
>> documented as such.
> Of course.
>
>>>  Nevertheless I'm inclined to think this deserves a brief comment.
>> There is a comment, and it's even visible in the snippet.
> The comment is about the asm(); it is neither placed to clearly relate
> to __builtin_constant_p(), nor is it saying anything about this specific
> property of it. You said you were equally surprised; don't you think
> that when both of us are surprised, a specific (even if brief) comment
> is warranted?

Spell it out for me like I'm an idiot.

Because I'm looking at the patch I submitted, and at your request for "a
brief comment", and I still have no idea what you think is wrong at the
moment.

I'm also not included to write a comment saying "go and read the GCC
manual more carefully".

>
>>> As an aside, to better match the comment inside the if()'s body, how about
>>>
>>>     if ( __builtin_constant_p(!!x) && x )
>>>
>>> ? That also may make a little more clear that this isn't just a style
>>> choice, but actually needed for the intended purpose.
>> I am not changing the logic.
>>
>> Apart from anything else, your suggestion is trivially buggy.  I care
>> about whether the RHS collapses to a constant, and the only way of doing
>> that correctly is asking the compiler about the *exact* expression. 
>> Asking about some other expression which you hope - but do not know -
>> that the compiler will treat equivalently is bogus.  It would be
>> strictly better to only take the else clause, than to have both halves
>> emitted.
>>
>> This is the form I've tested extensively.  It's also the clearest form
>> IMO.  You can experiment with alternative forms when we're not staring
>> down code freeze of 4.19.
> "Clearest form" is almost always a matter of taste. To me, comparing
> unsigned values with > or < against 0 is generally at least suspicious.
> Using != is typically better (again: imo), and simply omitting the != 0
> then is shorter with no difference in effect. Except in peculiar cases
> like this one, where indeed it took me some time to figure why the
> comparison operator may not be omitted.
>
> All that said: I'm not going to insist on any change; the R-b previously
> offered still stands. I would highly appreciate though if the (further)
> comment asked for could be added.
>
> What I definitely dislike here is you - not for the first time - turning
> down remarks because a change of yours is late.

Actually it's not to do with the release.  I'd reject it at any point
because it's an unreasonable request to make; to me, or to anyone else.

It would be a matter of taste (which again you have a singular view on),
if it wasn't for the fact that what you actually said was:

"I don't like it, and you should discard all the careful analysis you
did because here's a form I prefer, that I haven't tested concerning a
behaviour I didn't even realise until this email."

and even if it wasn't a buggy suggestion to begin with, it's still toxic
maintainer feedback.


Frankly, I'd have more time to review other peoples patches if I wasn't
wasting all of my time on premium grade manure like this, while trying
to help Oleksii who's had it far worse this release trying to clean up
droppings of maintainers-past.

~Andrew

