Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682998D1B55
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 14:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731115.1136450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBvy4-00083u-Gn; Tue, 28 May 2024 12:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731115.1136450; Tue, 28 May 2024 12:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBvy4-00081Y-Dm; Tue, 28 May 2024 12:30:16 +0000
Received: by outflank-mailman (input) for mailman id 731115;
 Tue, 28 May 2024 12:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sBvy3-00081R-VA
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 12:30:15 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 073657a7-1cee-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 14:30:13 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-794ab01e747so53484085a.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 05:30:13 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac070dc2aesm44245496d6.42.2024.05.28.05.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 05:30:10 -0700 (PDT)
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
X-Inumbo-ID: 073657a7-1cee-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716899411; x=1717504211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ShwQ8ihl8BeD0n9LIaKqMxNwbnSItoXELrXM9XhMk8c=;
        b=dJnn8PHyAyikkwZfFGGe0k1Ss1lsviAEOVQ8JpnsWQ+EwHbK+ZQUyuEd+fCrD8JDPk
         u9b9VqOz1qmgYoZsKtDfngPfkrzAu+QOrswMbLR2M57Q6BNRcWVK3DW7iD0pHKCAjyoi
         u0O8n6uTlz3JcZNrWK7/RkWnApB0yZyYpFDMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899411; x=1717504211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShwQ8ihl8BeD0n9LIaKqMxNwbnSItoXELrXM9XhMk8c=;
        b=uOrtufIMboZbUgzA+MWf9yWVVlukwWJTfmCVThL0J5dpyRg/jhXDil2ZxnM7iiRqu6
         WwMMqT+5qXtPLfrAcdfm7HUGrKoNJqC2CX7z3pfr93Zt9Tto/3fnjzVQeiUUABP1XQQA
         3OhFgojDqqXbQDmMQJC8jB2Ey0Kd5rb4dqeQyYUTj8of4GChqN+gpHXySZ3zY4sMnKRj
         WXs5G9YZVCN2alEzNGQOXoyGfXS2MZ+HvVAQvOpzJG7ZVJNvby0Uxcu9jTy8ECXo5sC/
         8/c280PxxFQoeSXQFsjGjiZUDWcrTH0m+gO5Soqr+gWNm4W6UTweb+2d37K57FzGlACF
         vafQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNa/baEebjmMldI2kJ3Nc6AxXMKdInpKWdoHoNnSQvyAE8wqnK51hRlf+1SeoEcaFhDK6qvDdFB0rqqxQIQPutebls7mRxy17dryAeoWw=
X-Gm-Message-State: AOJu0YyG2BBdzPOjpITYhgiU0dxZ0wF9Lons3p4ifkKUKfGn8wFsHWvA
	n6G+kUDdR0mJfw056VIUrSN7aHQwo0Dq+vkFfnpgMiZX/KqrkoyWhG40OtYjIHU=
X-Google-Smtp-Source: AGHT+IExbMiaLbkK3N1rrjO2XlfQlPFZnOp7wrZDUU930F2h2M7hqYJ8FQ/M408hFC/+RaRQUCcxYQ==
X-Received: by 2002:ad4:4eee:0:b0:6ad:8d50:5ced with SMTP id 6a1803df08f44-6ad8d505d22mr35472026d6.11.1716899411447;
        Tue, 28 May 2024 05:30:11 -0700 (PDT)
Message-ID: <b0838a62-1e6a-473a-a757-97091c84e164@citrix.com>
Date: Tue, 28 May 2024 13:30:08 +0100
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <57a47c76-c484-4309-8a87-a51f79dd48b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 2:37 pm, Jan Beulich wrote:
> On 27.05.2024 15:27, Jan Beulich wrote:
>> On 24.05.2024 22:03, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/bitops.h
>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>> @@ -432,12 +432,28 @@ static inline int ffsl(unsigned long x)
>>>  
>>>  static always_inline unsigned int arch_ffs(unsigned int x)
>>>  {
>>> -    int r;
>>> +    unsigned int r;
>>> +
>>> +    if ( __builtin_constant_p(x > 0) && x > 0 )
>>> +    {
>>> +        /* Safe, when the compiler knows that x is nonzero. */
>>> +        asm ( "bsf %[val], %[res]"
>>> +              : [res] "=r" (r)
>>> +              : [val] "rm" (x) );
>>> +    }
>> In patch 11 relevant things are all in a single patch, making it easier
>> to spot that this is dead code: The sole caller already has a
>> __builtin_constant_p(), hence I don't see how the one here could ever
>> return true. With that the respective part of the description is then
>> questionable, too, I'm afraid: Where did you observe any actual effect
>> from this? Or if you did - what am I missing?
> Hmm, thinking about it: I suppose that's why you have
> __builtin_constant_p(x > 0), not __builtin_constant_p(x). I have to admit
> I'm (positively) surprised that the former may return true when the latter
> doesn't.

So was I, but this recommendation came straight from the GCC mailing
list.  And it really does work, even back in obsolete versions of GCC.

__builtin_constant_p() operates on an expression not a value, and is
documented as such.


>  Nevertheless I'm inclined to think this deserves a brief comment.

There is a comment, and it's even visible in the snippet.

> As an aside, to better match the comment inside the if()'s body, how about
>
>     if ( __builtin_constant_p(!!x) && x )
>
> ? That also may make a little more clear that this isn't just a style
> choice, but actually needed for the intended purpose.

I am not changing the logic.

Apart from anything else, your suggestion is trivially buggy.  I care
about whether the RHS collapses to a constant, and the only way of doing
that correctly is asking the compiler about the *exact* expression. 
Asking about some other expression which you hope - but do not know -
that the compiler will treat equivalently is bogus.  It would be
strictly better to only take the else clause, than to have both halves
emitted.

This is the form I've tested extensively.  It's also the clearest form
IMO.  You can experiment with alternative forms when we're not staring
down code freeze of 4.19.

~Andrew

