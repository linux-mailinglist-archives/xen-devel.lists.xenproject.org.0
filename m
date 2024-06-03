Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BC8D7B83
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 08:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734703.1140780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE17S-00070N-6C; Mon, 03 Jun 2024 06:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734703.1140780; Mon, 03 Jun 2024 06:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE17S-0006y0-36; Mon, 03 Jun 2024 06:24:34 +0000
Received: by outflank-mailman (input) for mailman id 734703;
 Mon, 03 Jun 2024 06:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29W0=NF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sE17Q-0006xu-Uv
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 06:24:32 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef6505c7-2171-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 08:24:30 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35dce6102f4so2647492f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 23:24:30 -0700 (PDT)
Received: from ?IPV6:2003:ca:b724:4976:f1a7:a03d:19f7:6554?
 (p200300cab7244976f1a7a03d19f76554.dip0.t-ipconnect.de.
 [2003:ca:b724:4976:f1a7:a03d:19f7:6554])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d9424sm7811871f8f.50.2024.06.02.23.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jun 2024 23:24:29 -0700 (PDT)
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
X-Inumbo-ID: ef6505c7-2171-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717395870; x=1718000670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UPCewO+Mv8mYfHHvjMIO9EcN+6/nh2RkPWUQC6NHmWM=;
        b=DUC4HSLS3tFtwqMsIqp/AiYWHDPSdd4M6XPhNI//fpCW5MUn4jPbfxAwP2h8VIXXRa
         EkLoTlzY8BYmQnyW8CGITE13VnoYsx507TjDiDS86EKmYEfJ96C78vrt4G1esss20itb
         0UoTxdyWSUs/L/0+GneluvKZwikugST/tMdInYZugbC2WzZu9CazG9O2/ab7EPo5U5kT
         erbZNfgH05iouyDMoD1SSZk9CUeALjBS3DnFlApmX4zMb6vV6SNmtQvTLd8nUskcQqXJ
         m1PCJVIrsgWJ/09mo9fgsmpcIzddftklPJm01BNzkogBuazZWo1xcrtkJAlAYIk+uK+5
         Ou8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717395870; x=1718000670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPCewO+Mv8mYfHHvjMIO9EcN+6/nh2RkPWUQC6NHmWM=;
        b=CeIhoaQEKrldCfUAhXq3LxpJ8W8rSOu0S95qhvPLtA2bU7poCZrTFja4VMXznZX05f
         GdYbb66/mGpHSYcYj5hJM8mD5zPwRcpTFP4NF91KL42uf9frd0sa6O+V+gB0EahEr07p
         46EWw8Pe0d6iBM9ap1tCMqEmxF2Lq3YWkIpwk2A83stsczamdRQlHFo/+RlWcGa7HXBb
         iMkamKTNR8iSpmw05jJnOWuUiCjHds7sOofgjrO1Qfs57YKrzyGqlxVl7k2M4WUya6E0
         dK0ehK4FC8i9hAWCOxi0IBxMBEqJ87om7fl2nwzbOm/1qrq0J80gPZLX07ocXxPutS46
         V3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBiVSrA88fYLkUvOlWK16feb5Ah+5IsrOQOnoPckX+lQKgRLQx+bMcJWc7FHd3JJjNSTsOcSlWomyUivrLN6Lat7SiGn4Z22qrYGIcaVw=
X-Gm-Message-State: AOJu0YxuHFrKEKY84TlYwa7MkiJ+yxGMFzTnpyd6cXn0L0x6WGm1eg5B
	yNrwyl/INUHxwfuSugXtVvmHizaFkc/u2tUDaOChbOkHBSd9TckRhST6M9aICA==
X-Google-Smtp-Source: AGHT+IGEENRs/QW8OHRKuenWcOHDRtRZ3tJ7N+35VKMMd3kBVejaA8dt6iGzF/eW9IO6NISsRRAPyA==
X-Received: by 2002:a5d:4905:0:b0:343:efb7:8748 with SMTP id ffacd0b85a97d-35e0f32f33fmr6438654f8f.66.1717395869798;
        Sun, 02 Jun 2024 23:24:29 -0700 (PDT)
Message-ID: <7face8c3-174b-4ba3-9e08-1622d2db98ba@suse.com>
Date: Mon, 3 Jun 2024 08:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] x86/bitops: Improve arch_ffs() in the general
 case
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
 <b5a24f69-855d-49e8-b13b-7c9b2ee199f4@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <b5a24f69-855d-49e8-b13b-7c9b2ee199f4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.06.2024 03:47, Andrew Cooper wrote:
> On 28/05/2024 2:12 pm, Jan Beulich wrote:
>> On 28.05.2024 14:30, Andrew Cooper wrote:
>>> On 27/05/2024 2:37 pm, Jan Beulich wrote:
>>>> On 27.05.2024 15:27, Jan Beulich wrote:
>>>>> On 24.05.2024 22:03, Andrew Cooper wrote:
>>>>>> --- a/xen/arch/x86/include/asm/bitops.h
>>>>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>>>>> @@ -432,12 +432,28 @@ static inline int ffsl(unsigned long x)
>>>>>>  
>>>>>>  static always_inline unsigned int arch_ffs(unsigned int x)
>>>>>>  {
>>>>>> -    int r;
>>>>>> +    unsigned int r;
>>>>>> +
>>>>>> +    if ( __builtin_constant_p(x > 0) && x > 0 )
>>>>>> +    {
>>>>>> +        /* Safe, when the compiler knows that x is nonzero. */
>>>>>> +        asm ( "bsf %[val], %[res]"
>>>>>> +              : [res] "=r" (r)
>>>>>> +              : [val] "rm" (x) );
>>>>>> +    }
>>>>> In patch 11 relevant things are all in a single patch, making it easier
>>>>> to spot that this is dead code: The sole caller already has a
>>>>> __builtin_constant_p(), hence I don't see how the one here could ever
>>>>> return true. With that the respective part of the description is then
>>>>> questionable, too, I'm afraid: Where did you observe any actual effect
>>>>> from this? Or if you did - what am I missing?
>>>> Hmm, thinking about it: I suppose that's why you have
>>>> __builtin_constant_p(x > 0), not __builtin_constant_p(x). I have to admit
>>>> I'm (positively) surprised that the former may return true when the latter
>>>> doesn't.
>>> So was I, but this recommendation came straight from the GCC mailing
>>> list.  And it really does work, even back in obsolete versions of GCC.
>>>
>>> __builtin_constant_p() operates on an expression not a value, and is
>>> documented as such.
>> Of course.
>>
>>>>  Nevertheless I'm inclined to think this deserves a brief comment.
>>> There is a comment, and it's even visible in the snippet.
>> The comment is about the asm(); it is neither placed to clearly relate
>> to __builtin_constant_p(), nor is it saying anything about this specific
>> property of it. You said you were equally surprised; don't you think
>> that when both of us are surprised, a specific (even if brief) comment
>> is warranted?
> 
> Spell it out for me like I'm an idiot.
> 
> Because I'm looking at the patch I submitted, and at your request for "a
> brief comment", and I still have no idea what you think is wrong at the
> moment.
> 
> I'm also not included to write a comment saying "go and read the GCC
> manual more carefully".
> 
>>
>>>> As an aside, to better match the comment inside the if()'s body, how about
>>>>
>>>>     if ( __builtin_constant_p(!!x) && x )
>>>>
>>>> ? That also may make a little more clear that this isn't just a style
>>>> choice, but actually needed for the intended purpose.
>>> I am not changing the logic.
>>>
>>> Apart from anything else, your suggestion is trivially buggy.  I care
>>> about whether the RHS collapses to a constant, and the only way of doing
>>> that correctly is asking the compiler about the *exact* expression. 
>>> Asking about some other expression which you hope - but do not know -
>>> that the compiler will treat equivalently is bogus.  It would be
>>> strictly better to only take the else clause, than to have both halves
>>> emitted.
>>>
>>> This is the form I've tested extensively.  It's also the clearest form
>>> IMO.  You can experiment with alternative forms when we're not staring
>>> down code freeze of 4.19.
>> "Clearest form" is almost always a matter of taste. To me, comparing
>> unsigned values with > or < against 0 is generally at least suspicious.
>> Using != is typically better (again: imo), and simply omitting the != 0
>> then is shorter with no difference in effect. Except in peculiar cases
>> like this one, where indeed it took me some time to figure why the
>> comparison operator may not be omitted.
>>
>> All that said: I'm not going to insist on any change; the R-b previously
>> offered still stands. I would highly appreciate though if the (further)
>> comment asked for could be added.
>>
>> What I definitely dislike here is you - not for the first time - turning
>> down remarks because a change of yours is late.
> 
> Actually it's not to do with the release.  I'd reject it at any point
> because it's an unreasonable request to make; to me, or to anyone else.
> 
> It would be a matter of taste (which again you have a singular view on),
> if it wasn't for the fact that what you actually said was:
> 
> "I don't like it, and you should discard all the careful analysis you
> did because here's a form I prefer, that I haven't tested concerning a
> behaviour I didn't even realise until this email."

Just to clarify: Long before this reply of yours I understood and admitted
my mistake. A more clear / well placed comment (see further up) might have
avoided that. Still - thanks for extending the comment in what you have
committed.

> and even if it wasn't a buggy suggestion to begin with, it's still toxic
> maintainer feedback.

What's toxic about making a mistake? What's toxic about disliking "x > 0"
for unsigned quantities? As you say, it's a matter of taste to a fair
degree. Yet there are ample cases where taste as in "make it as clear as
possible to every reader" is used to ask me or others to change style. I
don't see why I shouldn't be permitted to at least make a similar remark,
even if then it's turned down (for good or bad reasons).

Jan

