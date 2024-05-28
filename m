Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35498D1C3E
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 15:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731142.1136491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwcm-0006bg-6Q; Tue, 28 May 2024 13:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731142.1136491; Tue, 28 May 2024 13:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwcm-0006a9-34; Tue, 28 May 2024 13:12:20 +0000
Received: by outflank-mailman (input) for mailman id 731142;
 Tue, 28 May 2024 13:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tjWx=M7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBwck-0006a3-Um
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 13:12:18 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e842f300-1cf3-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 15:12:17 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6303e13ffeso96305966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 06:12:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c81771fsm611413966b.27.2024.05.28.06.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 06:12:16 -0700 (PDT)
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
X-Inumbo-ID: e842f300-1cf3-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716901937; x=1717506737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NOQgVVjwD2+/MccmulpZwJ6lvktvbBRRFLuQltr8H6E=;
        b=TyHuIVaNpUNyo4/if+USbGvd8EZuhTApff1HifVE6Z8vSGseSMhRKMCWuATaRLZ7Wk
         +IpC9UCOLMYkbOyZPh7LS2751ee3JrN8dCqpHzME4HZkXIcg+VB/f9iXEuNsyp+6NbEz
         DIBog5SU5P53bEyO62JCcuHDzMmtUr9djts2Va1hApUlDQhkBLtPhDUf7/kugEdujOlk
         Bpe8+1lZfFWsto56MuHFFfJRzY3aDnv8tuWwRJteamPMExjfvI9QmIlshUMSkHpQN6on
         g+5Tqaoa2X3R1cWWvoZUb9pzvma/ova0C+SybkenamKiDKQCo57q9dDQGYVp56dYvZ1A
         Lt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901937; x=1717506737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOQgVVjwD2+/MccmulpZwJ6lvktvbBRRFLuQltr8H6E=;
        b=sn70nTdu5id++AEjpsSPBRncZyhD9YZ21vMl1OUY/DS0XrF5To5AJEoJa/hzGY05zt
         zqItW7Hm50faLwxnkGxRg1/qm0k4S+ShW1Wqru3nopqM98X4kQkiMclnOai4xugzpLrJ
         GAGGuOkyZsAWhCI3N4ge7MmeDoPKLfdBjYN/90NBo2TYBDa+tcJBQq4IWFx2+WYJAtIM
         IteAh6yTIwiEdenZjADd2q0FXFuzmos6mXS3J8uoXyKveH/1c5nF9abI81BwAdzaSXIE
         lnKBvwbUnx4f+FRzqjMBIILGewXYSg2vMsQNPeeLkadD3lUiB563/wNQMruUd9Qv0gUd
         ZXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxiCmV1b2LPzGLBzm9sJTEXbPyte4MdDvITS5i5DNwvcK2q1fT3qHoapasmEThhTSOcLLDVma/qRQYuA1dngHriDzuumDVdbgcxdcBE7I=
X-Gm-Message-State: AOJu0Yz3qHlxF5bmHHz85ZQ2d7tNj4EOLeg8a7nfgAqGz4fVQzVnKugY
	RdO1N8JnSU6Cy34+LBs6EAUn0+7NEBzJvbbtrVX6+M450CJgboR8+IP8Iz8nog==
X-Google-Smtp-Source: AGHT+IGmVOZOQQ073oqP2Bir1Scy4J9sq3uOmV8Y1rrYfOvotmzOIbYXQHOeiM1b1yjYrlyP2mTeZw==
X-Received: by 2002:a17:907:1391:b0:a59:bd5b:a0f3 with SMTP id a640c23a62f3a-a62646cd962mr620247566b.38.1716901936473;
        Tue, 28 May 2024 06:12:16 -0700 (PDT)
Message-ID: <df7bb467-c778-43fb-bd04-f81f6e3dfd01@suse.com>
Date: Tue, 28 May 2024 15:12:15 +0200
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
In-Reply-To: <b0838a62-1e6a-473a-a757-97091c84e164@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.05.2024 14:30, Andrew Cooper wrote:
> On 27/05/2024 2:37 pm, Jan Beulich wrote:
>> On 27.05.2024 15:27, Jan Beulich wrote:
>>> On 24.05.2024 22:03, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/include/asm/bitops.h
>>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>>> @@ -432,12 +432,28 @@ static inline int ffsl(unsigned long x)
>>>>  
>>>>  static always_inline unsigned int arch_ffs(unsigned int x)
>>>>  {
>>>> -    int r;
>>>> +    unsigned int r;
>>>> +
>>>> +    if ( __builtin_constant_p(x > 0) && x > 0 )
>>>> +    {
>>>> +        /* Safe, when the compiler knows that x is nonzero. */
>>>> +        asm ( "bsf %[val], %[res]"
>>>> +              : [res] "=r" (r)
>>>> +              : [val] "rm" (x) );
>>>> +    }
>>> In patch 11 relevant things are all in a single patch, making it easier
>>> to spot that this is dead code: The sole caller already has a
>>> __builtin_constant_p(), hence I don't see how the one here could ever
>>> return true. With that the respective part of the description is then
>>> questionable, too, I'm afraid: Where did you observe any actual effect
>>> from this? Or if you did - what am I missing?
>> Hmm, thinking about it: I suppose that's why you have
>> __builtin_constant_p(x > 0), not __builtin_constant_p(x). I have to admit
>> I'm (positively) surprised that the former may return true when the latter
>> doesn't.
> 
> So was I, but this recommendation came straight from the GCC mailing
> list.  And it really does work, even back in obsolete versions of GCC.
> 
> __builtin_constant_p() operates on an expression not a value, and is
> documented as such.

Of course.

>>  Nevertheless I'm inclined to think this deserves a brief comment.
> 
> There is a comment, and it's even visible in the snippet.

The comment is about the asm(); it is neither placed to clearly relate
to __builtin_constant_p(), nor is it saying anything about this specific
property of it. You said you were equally surprised; don't you think
that when both of us are surprised, a specific (even if brief) comment
is warranted?

>> As an aside, to better match the comment inside the if()'s body, how about
>>
>>     if ( __builtin_constant_p(!!x) && x )
>>
>> ? That also may make a little more clear that this isn't just a style
>> choice, but actually needed for the intended purpose.
> 
> I am not changing the logic.
> 
> Apart from anything else, your suggestion is trivially buggy.  I care
> about whether the RHS collapses to a constant, and the only way of doing
> that correctly is asking the compiler about the *exact* expression. 
> Asking about some other expression which you hope - but do not know -
> that the compiler will treat equivalently is bogus.  It would be
> strictly better to only take the else clause, than to have both halves
> emitted.
> 
> This is the form I've tested extensively.  It's also the clearest form
> IMO.  You can experiment with alternative forms when we're not staring
> down code freeze of 4.19.

"Clearest form" is almost always a matter of taste. To me, comparing
unsigned values with > or < against 0 is generally at least suspicious.
Using != is typically better (again: imo), and simply omitting the != 0
then is shorter with no difference in effect. Except in peculiar cases
like this one, where indeed it took me some time to figure why the
comparison operator may not be omitted.

All that said: I'm not going to insist on any change; the R-b previously
offered still stands. I would highly appreciate though if the (further)
comment asked for could be added.

What I definitely dislike here is you - not for the first time - turning
down remarks because a change of yours is late. This feels even more so
bad when considering that I'm typically replying to your patches with
pretty little turnaround. Whereas various of mine, pending in part for
years, do not seem to deserve any review comments at all. Unlike before,
where it was "only" improvements or feature additions, meanwhile even
bug fixes are left sit like that. If I may be blunt: This may not work
this way for much longer. At some point I will need to artificially
delay reviews, making them dependent on my own work also being allowed
to make progress. I question though whether that would be in everyone's
interest.

Jan

