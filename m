Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1647293CF42
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 10:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765323.1175916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFxS-0004SU-Rn; Fri, 26 Jul 2024 08:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765323.1175916; Fri, 26 Jul 2024 08:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFxS-0004QS-OV; Fri, 26 Jul 2024 08:05:46 +0000
Received: by outflank-mailman (input) for mailman id 765323;
 Fri, 26 Jul 2024 08:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bo/X=O2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sXFxR-0004Q6-QT
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 08:05:45 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db33e2eb-4b25-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 10:05:43 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so1559189e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 01:05:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4debasm147255366b.60.2024.07.26.01.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 01:05:42 -0700 (PDT)
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
X-Inumbo-ID: db33e2eb-4b25-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721981143; x=1722585943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib6gE8OR8cqHpesv31TjJsDXyWkqWwzXKQl6l1Au1sk=;
        b=IR+oM0i1/L9PDlLIJEQ32rQR8l2CkEl55O1NRqP26U5ExUNf581cH0f9r0eaaOHlWw
         0iYxYCNdz1+Wfk0zAFhZp/ZUq+bn3e2VFm+Dydosq8+7I2Pb1gDiWwrwXvgkd+e2rNde
         ZGfdwCJ3U3dqMzemhe679gjFFqU1zijBjvvqojbi6b5ICxfZ+C9RtJRdpszKO2wvtely
         Fdqvr1SVZ5Xog3lfFbyezFit4wpM15dOSPuuOnRiZ7EsVhzneRbNFZ9AmJQV4EIRDW37
         8BHTFQHpxF6rLuUQ8OESPJNnSEoZAMM5q6Lj9mp+U5cMfZq9+HDZrMLELivvBmaBMRGB
         JCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721981143; x=1722585943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ib6gE8OR8cqHpesv31TjJsDXyWkqWwzXKQl6l1Au1sk=;
        b=K/Z14q3mCbTcjKqJoSjs17ywaZzov0YsCFF75e0Q4buOUjQC58XkNYEV5HlKtY10MC
         1LevXxoY5a83D5MCdPWopDZ8wUcQLckWPVzPeTp/IDmpXNlVCIUB26Oef2NIYv0RePDL
         hxngRv8Fh/7vv9a2qOMAzpVTIo6sSbr/Tk6Z+hcxr7lXhAOjl0jFO5HYjWSR+vlhBVjg
         w2jOnXd+7dH40yMyEIwVbV+cF8krFSACY3idRQ0AiEpquHEI6D43pW+zaphfkMg+qTgq
         aQUVRRSHXHBcpId0qCSMYvaxQas/IRGtLuv2pFLRAAayV0TFqdt4Yc9gwM794+0MiMQj
         2tbg==
X-Forwarded-Encrypted: i=1; AJvYcCUkvDR3xHbeqecbVFOb3b3BWVVeUFmX9yX87tPHVUmGOdzGwLXZtr8wEM25W9DBtSsXbpyh4UuDfEjaacpgL7Y/L92+JL1oc8QH5D3fdO4=
X-Gm-Message-State: AOJu0YwutMnAwTFEDN60UPKaVBx7Gdh634C6cP6NUTIKqZTHPRSttNgS
	X0z1SZpI3pCoUNx0sNkB4CP/DUu/mHCvpHTAkcOENqgiosz+qY6JoigkHNjWKw==
X-Google-Smtp-Source: AGHT+IGDR9KVrGhkNCgDkReUtTYzH4fastcmwpxiWKE8nUl5nLgCtMOF4jI1eUaaExQcUncO/V/weQ==
X-Received: by 2002:a05:6512:54f:b0:52c:dd25:9ac6 with SMTP id 2adb3069b0e04-52fd6038916mr3579363e87.29.1721981142945;
        Fri, 26 Jul 2024 01:05:42 -0700 (PDT)
Message-ID: <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>
Date: Fri, 26 Jul 2024 10:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com> <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com> <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com> <ZqNVs97wexqd5trA@macbook>
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
In-Reply-To: <ZqNVs97wexqd5trA@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 09:52, Roger Pau Monné wrote:
> On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
>> On 26.07.2024 09:31, Roger Pau Monné wrote:
>>> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
>>>> On 25.07.2024 16:54, Roger Pau Monné wrote:
>>>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
>>>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
>>>>>>> --- a/xen/arch/x86/include/asm/alternative.h
>>>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
>>>>>>>   * https://github.com/llvm/llvm-project/issues/82598
>>>>>>>   */
>>>>>>>  #define ALT_CALL_ARG(arg, n)                                            \
>>>>>>> -    register union {                                                    \
>>>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
>>>>>>> -        unsigned long r;                                                \
>>>>>>> +    register struct {                                                   \
>>>>>>> +        typeof(arg) e;                                                  \
>>>>>>> +        char pad[sizeof(void *) - sizeof(arg)];                         \
>>>>>>
>>>>>> One thing that occurred to me only after our discussion, and I then forgot
>>>>>> to mention this before you would send a patch: What if sizeof(void *) ==
>>>>>> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
>>>>>> get rid of.
>>>>>
>>>>> I wondered about this, but I though it was only [] that we were trying
>>>>> to get rid of, not [0].
>>>>
>>>> Sadly (here) it's actually the other way around, aiui.
>>>
>>> The only other option I have in mind is using an oversized array on
>>> the union, like:
>>>
>>> #define ALT_CALL_ARG(arg, n)                                            \
>>>     union {                                                             \
>>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
>>>         unsigned long r;                                                \
>>>     } a ## n ## __  = {                                                 \
>>>         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
>>>     };                                                                  \
>>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
>>>         a ## n ## __.r
>>
>> Yet that's likely awful code-gen wise?
> 
> Seems OK: https://godbolt.org/z/nsdo5Gs8W

In which case why not go this route. If the compiler is doing fine with
that, maybe the array dimension expression could be further simplified,
accepting yet more over-sizing? Like "sizeof(void *) / sizeof (arg) + 1"
or even simply "sizeof(void *)"? Suitably commented of course ...

>> For the time being, can we perhaps
>> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested?
> 
> My main concern with tightening the BUILD_BUG_ON() is that then I
> would also like to do so for the GCC one, so that build fails
> uniformly.

If we were to take that route, then yes, probably should constrain both
(with a suitable comment on the gcc one).

Jan

