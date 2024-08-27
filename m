Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8756B960A51
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783927.1193248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivLg-0000no-LW; Tue, 27 Aug 2024 12:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783927.1193248; Tue, 27 Aug 2024 12:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivLg-0000ls-Ib; Tue, 27 Aug 2024 12:31:00 +0000
Received: by outflank-mailman (input) for mailman id 783927;
 Tue, 27 Aug 2024 12:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sivLf-0000lm-2x
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:30:59 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3557de43-6470-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 14:30:56 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso881092566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 05:30:56 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549f5c1sm105214266b.68.2024.08.27.05.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:30:55 -0700 (PDT)
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
X-Inumbo-ID: 3557de43-6470-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724761856; x=1725366656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=veubWuAtvi5hYg3bt7Ig8UgkkZ7tk4qURJRtiqZyn34=;
        b=OHBUZJtLLDvndf7HMnyarqO9DgbJ+nbHoiZo6gUKvNVd1/TlcVfs+3sRQ7C7o/Ziur
         J+FFg1lweidR2zL73DpFgI2qu5WL16LOgxJtEcJ2Fpa+FDTKSv5tuTyhL1AJssSHTE/4
         DZsVvnSCCg88q5cjLiNrVrQiljVYIg0gL0ZR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761856; x=1725366656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veubWuAtvi5hYg3bt7Ig8UgkkZ7tk4qURJRtiqZyn34=;
        b=h1hhBJUVmByeXaCRii0xURiLCpp1G0pX1RazM+zIeZ4VKIrx264hKf/WCr5ny6VhzN
         uosAVEEXf5MU/jbP0pBkuxImVK4kQuqMsL180zqV9xBfw9G+lXbz4sM0WBK0VbQUgGnA
         szs1YNMyAcKTjdJM2rRIiXZeJhQKmgEoJqkesg3NQ80rUsA3fvlaOAKkc2ZTdSAfyBDN
         HGOc7fHMM2RqaJMrE7fs9dQs//xJz8NZSSDwBTV1ju7Nq7tynm18ZMinv9cUdvnXE6VQ
         lnw7z4Rt/0N9qZZJ++McW76i5ijskAt0bO5KnBAtGpqndgePB/WiGHJIJ8ywu4zzhFGV
         C43w==
X-Forwarded-Encrypted: i=1; AJvYcCUSdVW8tiE/70zRNanhsm3YP+jOEJ9rk9nQA9YAeVumaMbCdTIRJawPuruGBNTirmYPcigwFFqw71Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye2APAIlj5JmyL90aI86uNY+9Pj4wgwxraHpXXht0f1DyyGffT
	SWPNxZfOcipcTiZ5nKLPaMmmin10P9DSsioyXIjan9jEZzMTOJm4lvGdV3KNLdE=
X-Google-Smtp-Source: AGHT+IHyiW8mYK7JXKlacoBWPZf3JhjUXQh06R/EfuUqC/xz64T3zFyMjI4td/PM3C6f6Uo7Oxjd+w==
X-Received: by 2002:a17:907:2d8e:b0:a7a:c7f3:580d with SMTP id a640c23a62f3a-a86e29feb8bmr270352666b.25.1724761855759;
        Tue, 27 Aug 2024 05:30:55 -0700 (PDT)
Message-ID: <d51535cd-5149-4808-8643-68be3216a08b@citrix.com>
Date: Tue, 27 Aug 2024 13:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] xen/bitops: Introduce generic_hweightl() and
 hweightl()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-6-andrew.cooper3@citrix.com>
 <14c385ce-c61d-48e3-aa09-7b450af34b6c@suse.com>
 <f5bac01b-74d6-41c4-b3c5-ad595d6de378@citrix.com>
 <265ea113-5e9e-4829-9a22-24ed9e1cae69@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <265ea113-5e9e-4829-9a22-24ed9e1cae69@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2024 12:41 pm, Jan Beulich wrote:
> On 27.08.2024 12:39, Andrew Cooper wrote:
>> On 26/08/2024 12:40 pm, Jan Beulich wrote:
>>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -35,6 +35,12 @@ extern void __bitop_bad_size(void);
>>>  unsigned int __pure generic_ffsl(unsigned long x);
>>>  unsigned int __pure generic_flsl(unsigned long x);
>>>  
>>>> +/*
>>>> + * Hamming Weight, also called Population Count.  Returns the number of set
>>>> + * bits in @x.
>>>> + */
>>>> +unsigned int __pure generic_hweightl(unsigned long x);
>>> Aren't this and ...
>>>
>>>> @@ -284,6 +290,18 @@ static always_inline __pure unsigned int fls64(uint64_t x)
>>>>          (_v & (_v - 1)) != 0;                   \
>>>>      })
>>>>  
>>>> +static always_inline __pure unsigned int hweightl(unsigned long x)
>>> ... this even __attribute_const__?
>> Hmm.  This is following fls(), but on further consideration, they should
>> be const too.
>>
>> I'll do a prep patch fixing that, although I'm going to rename it to
>> __attr_const for brevity.
>>
>> Much as I'd prefer __const, I expect that is going too far, making it
>> too close to regular const.
> I was actually going to suggest using that name, if we want to shorten
> __attribute_const__. Yes, gcc treats __const (and __const__) as
> keywords, but do we care (much)? All it requires is that we don't start
> using __const as a (real) keyword.

Well also we'll get into more MISRA fun for overriding keywords.

But yes - the fact that GCC treats __const to mean const is precisely
why we shouldn't give it an unrelated meaning.

>
> Of course __const is a good example of why really we shouldn't use
> double-underscore prefixed names anywhere. Any of them can be assigned
> a meaning by the compiler, and here that's clearly the case. Therefore,
> taking your planned rename, maybe better make it attr_const then? And
> eventually switch stuff like __packed, __pure, and __weak to attr_* as
> well? Or even introduce something like
>
> #define attr(attr...) __attribute__((attr))
>
> and use attr(const) here?

Hmm - that's an interesting approach, and for other attributes which we
can use unconditionally.  It will end up shorter than multiple separate
__-prefixed names.

As a tangent, I've got some work from playing with -fanalyzer which
sprinkles some attr malloc/alloc_{size,align}()/free around.  It does
improve code generation (abeit marginally), but the function declaration
size suffers.

It won't work for attributes which are conditionally nothing (e.g.
cf_check), or ones that contain multiple aspects (e.g. __constructer
conataining cf_check).

In practice this means we're always going to end up with a mix, so maybe
attr_const is better for consistency.

>
>>>> +{
>>>> +    if ( __builtin_constant_p(x) )
>>>> +        return __builtin_popcountl(x);
>>> How certain are you that compilers (even old ones) will reliably fold
>>> constant expressions here, and never emit a libgcc call instead? The
>>> conditions look to be more tight than just __builtin_constant_p(); a
>>> pretty absurd example:
>>>
>>> unsigned ltest(void) {
>>>     return __builtin_constant_p("") ? __builtin_popcountl((unsigned long)"") : ~0;
>>> }
>> How do you express that in terms of a call to hweightl()?
> hweightl((unsigned long)"");
>
> Yet as said - it's absurd. It merely serves to make the point that what
> __builtin_constant_p() returns true for doesn't necessarily constant-
> fold in expressions.

Yes, but as shown in the godbolt link, this form changes GCC's mind
about the __builtin_const-ness of the expression.

>
>> Again, this is following the layout started with fls() in order to avoid
>> each arch opencoding different versions of constant folding.
>>
>> https://godbolt.org/z/r544c49oY
>>
>> When it's forced through the hweightl() interface, even GCC 4.1 decides
>> that it's non-constant and falls back to generic_hweightl().
>>
>>
>> I did spend a *lot* of time with the fls() series checking that all
>> compilers we supported did what we wanted in this case, so I don't
>> expect it to be a problem.
> Right, and I guess I was pointlessly more concerned about popcount than
> I was for ffs() / fls(). The criteria upon which gcc decides whether to
> constant-fold the uses is exactly the same.
>
>>   But, if a library call is emitted, it will
>> be very obvious (link failure), and we can re-evaluate.
> Indeed, we certainly would notice, albeit the diagnostic may be cryptic
> to people.
>
> Bottom line - keep it as is.

Thanks.

~Andrew

