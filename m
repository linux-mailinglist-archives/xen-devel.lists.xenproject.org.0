Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D6B28017
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 14:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083391.1443010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtir-0004Pg-2r; Fri, 15 Aug 2025 12:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083391.1443010; Fri, 15 Aug 2025 12:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtiq-0004NZ-Vd; Fri, 15 Aug 2025 12:39:52 +0000
Received: by outflank-mailman (input) for mailman id 1083391;
 Fri, 15 Aug 2025 12:39:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umtip-0004NT-U1
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 12:39:51 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eee798a1-79d4-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 14:39:49 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so292158766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 05:39:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd018b27sm134629866b.105.2025.08.15.05.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 05:39:48 -0700 (PDT)
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
X-Inumbo-ID: eee798a1-79d4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755261589; x=1755866389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pnAfClgNK1Mn6D+FEimGWKDwENiMRkm6cug9/RR5598=;
        b=Qi61sXK920AHofsjjimRhLWA1223tgtvWyi7Io53lQMsIzrrtomCd3yt1Qzt5ZU/4j
         0zjXg3OO56N3/8Q21iTVkcjmm2T4sCUdFn2fSr7hri997ndnqDoDeW1wBxWmIZ0HI84T
         gT7oyU3cQX9U/03iL/szhARBjcFC552qGeVZyNGByzxas9mN48WbdbF9G6W4ohvBv7fF
         RjIHtbihJu9W10Zj0fpSlDk284Entgn2d9UTJOoxw50lyKazB8XvEcLuLONtgR5M+qK0
         mOvKvTQ7abNs16MamIsP8mmdPuVkIkgIHKz3o2UI+te05FHdeYD+vMzibm0cnCrVz/qL
         vESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755261589; x=1755866389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnAfClgNK1Mn6D+FEimGWKDwENiMRkm6cug9/RR5598=;
        b=nZ6RhywVa7kjlF02N4eTGYM4SUV1+dolNslNziOLGjbD8f57xCgI5zif1HSZ8p2NxY
         0Qm06k8NCthygxm1WcAgRp127eSzAnnbqmbB2iZjVYSW4Fc6UbRmd+aApPjxCy0litBe
         w+BCUIF+d1kMAajBzocSHJuYKCTqWWRvif4gnOIOUKHeHMePBTV/zDi0O7aBBPGljPQ4
         Cbj59dsyfhnaS41HaHWWehJKcF9F9mTSmLvffgoGuALn1iGrPNYuvLHZatWE9ocj8Jcg
         ltm6+IZJD/zt0mbGY5UJs2ds5MYxQniG4vsrBU+ApUK/R5wo00jifu3nztSxKk0RXio/
         WGbA==
X-Forwarded-Encrypted: i=1; AJvYcCU2c5oDNERwFg5s4WBPPGMgEId/xkMpc3tF6DJ52NbL+Y4S51Ns3JEmHuKgtXpd+xg97gNy+cgzTiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/uRVj8qMV6RiDjb4WXRNIl4ZhGEEeurp0EmOIj3Zve/eeV4zK
	2thpPU1IWEg87r9EvROyIufLHvFVYE4NWiOtAyyxEjsCvG31H5QzaBkd+IKuYTmMOg==
X-Gm-Gg: ASbGncu2LTCagO+Sv2dbaXU2UDPR4B7XwgPtMdYx3XeORpBlCJsoiublVQiRkdrd1W/
	HhF7kvLugHHRBMST2uwIkl3GBoujXHXaWeqtrVVJqLIiKjZSWqqJl6E8qGDHEJ2eX2W7QyYutCA
	lNE7mzYT7DI2QfUPiq1JfaflsePqTpBd9tDCD4teaYR2OZB1Aht4kJ4p83rxidnlRDiTO4vqzxr
	QYjYDFas0/0IxmUHOz/bFc5NXgRq4pV09SqWJJBRihpEAGRrkKtgt9MiMZzz7dkHmlSfhZR5Hh4
	mQOpkb8ASad+UjbjpY44dQb+JbTutzxul/5wdl/xxF6gZJducl7BwXC7pnNInotsopJFcTMkYJa
	JB36evpSxXJ39Btd2NB9xlzvar3f/0dwbYXFK3mY6Afp1q1HxsHCnOiNpWG9Il69tKlizw92sGv
	prO0SFFXip9PkwoMsCmw==
X-Google-Smtp-Source: AGHT+IHeT7hfX3oNn6A/0E/MJdBfHMGiRpxDaClbEWL+1VpoOeJVimzPTmXgXobuTgK4O2/zXtRO1g==
X-Received: by 2002:a17:907:9628:b0:afc:a18d:f14d with SMTP id a640c23a62f3a-afcdc047b3emr178651166b.7.1755261589122;
        Fri, 15 Aug 2025 05:39:49 -0700 (PDT)
Message-ID: <e920d859-e5e3-459b-b0bb-9b32ed1b0cbc@suse.com>
Date: Fri, 15 Aug 2025 14:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Use auto as per C23
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
 <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
 <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
 <7fc93aeef27153f1d6caa786bd44420f@bugseng.com>
 <caf19e2b-046e-495f-b425-9cb3a0053006@suse.com>
 <bd3f9c28-aaf4-479d-b56e-48838442f7a3@citrix.com>
 <5ff1e337-9ec5-466b-b21f-cf29274b007b@suse.com>
 <aad0db65-06cd-4631-a6e8-de36fa6af85d@citrix.com>
 <8efa3103-fad9-4921-a5ef-04e7a7c80715@suse.com>
 <CACHz=Zi5gdfg42W5oTc8e0t3Y1+oVT_kV+nTKoXQEBCnVJSw2Q@mail.gmail.com>
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
In-Reply-To: <CACHz=Zi5gdfg42W5oTc8e0t3Y1+oVT_kV+nTKoXQEBCnVJSw2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 14:35, Frediano Ziglio wrote:
> On Fri, Aug 15, 2025 at 1:28 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.08.2025 12:53, Andrew Cooper wrote:
>>> On 15/08/2025 11:25 am, Jan Beulich wrote:
>>>> On 15.08.2025 11:51, Andrew Cooper wrote:
>>>>> On 15/08/2025 10:36 am, Jan Beulich wrote:
>>>>>> On 15.08.2025 10:33, Nicola Vetrini wrote:
>>>>>>> On 2025-08-15 10:17, Andrew Cooper wrote:
>>>>>>>> On 15/08/2025 8:20 am, Nicola Vetrini wrote:
>>>>>>>>> On 2025-08-15 00:25, Andrew Cooper wrote:
>>>>>>>>>> In macros it is common to declare local variables using typeof(param)
>>>>>>>>>> in order
>>>>>>>>>> to ensure that side effects are only evaluated once.  A consequence
>>>>>>>>>> of this is
>>>>>>>>>> double textural expansion of the parameter, which can get out of hand
>>>>>>>>>> very
>>>>>>>>>> quickly with nested macros.
>>>>>>>>>>
>>>>>>>>>> In C23, the auto keyword has been repurposed to perform type
>>>>>>>>>> inference.
>>>>>>>>>>
>>>>>>>>>> A GCC extension, __auto_type, is now avaialble in the new toolchain
>>>>>>>>>> baseline
>>>>>>>>>> and avoids the double textural expansion.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>>> Thankyou.
>>>>>>>>
>>>>>>>>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>>>>>>>>>> index 88bf26bc5109..38ef5d82ad95 100644
>>>>>>>>>> --- a/xen/include/xen/compiler.h
>>>>>>>>>> +++ b/xen/include/xen/compiler.h
>>>>>>>>>> @@ -64,6 +64,20 @@
>>>>>>>>>>  # define asm_inline asm
>>>>>>>>>>  #endif
>>>>>>>>>>
>>>>>>>>>> +/*
>>>>>>>>>> + * In C23, the auto keyword has been repurposed to perform type
>>>>>>>>>> inference.
>>>>>>>>>> + *
>>>>>>>>>> + * This behaviour is available via the __auto_type extension in
>>>>>>>>>> supported
>>>>>>>>>> + * toolchains.
>>>>>>>>>> + *
>>>>>>>>>> + *
>>>>>>>>>> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
>>>>>>>>>> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
>>>>>>>>>> + */
>>>>>>>>>> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
>>>>>>>>>> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23
>>>>>>>>>> meaning. */
>>>>>>>>>> +#define auto __auto_type
>>>>>>>>>> +#endif
>>>>>>>>>> +
>>>>>>>>> A more detailed explanation should live in deviations.rst under this
>>>>>>>>> bullet point
>>>>>>>>>
>>>>>>>>>    * - R20.4
>>>>>>>>>      - The override of the keyword \"inline\" in xen/compiler.h is
>>>>>>>>> present so
>>>>>>>>>        that section contents checks pass when the compiler chooses not
>>>>>>>>> to
>>>>>>>>>        inline a particular function.
>>>>>>>>>      - Comment-based deviation.
>>>>>>>>>
>>>>>>>>> as described in the SAF entry:
>>>>>>>>>
>>>>>>>>>         {
>>>>>>>>>             "id": "SAF-3-safe",
>>>>>>>>>             "analyser": {
>>>>>>>>>                 "eclair": "MC3A2.R20.4"
>>>>>>>>>             },
>>>>>>>>>             "name": "MC3A2.R20.4: allow the definition of a macro with
>>>>>>>>> the same name as a keyword in some special cases",
>>>>>>>>>             "text": "The definition of a macro with the same name as a
>>>>>>>>> keyword can be useful in certain configurations to improve the
>>>>>>>>> guarantees that can be provided by Xen. See docs/misra/deviations.rst
>>>>>>>>> for a precise rationale for all such cases."
>>>>>>>>>         },
>>>>>>>> Ah right.  What about this:
>>>>>>>>
>>>>>>>> "Xen does not use the \"auto\" keyword as a storage qualifier.  The
>>>>>>>> override of the keyword \"auto\" in xen/compiler.h is to give it it's
>>>>>>>> C23 behaviour of type inference."
>>>>>>>>
>>>>>>>> ?
>>>>>>> Seems good to me. Maybe this should be spelled out in ./CODING_STYLE as
>>>>>>> well, so that newcomers don't trip over this?
>>>>>> I'm not sure newcomers would look there, but in the absence of any better
>>>>>> place that's perhaps indeed where to mention this.
>>>>> How about this:
>>>>>
>>>>> diff --git a/CODING_STYLE b/CODING_STYLE
>>>>> index 7bf3848444ad..e33b9d1170cf 100644
>>>>> --- a/CODING_STYLE
>>>>> +++ b/CODING_STYLE
>>>>> @@ -129,6 +129,10 @@ Fixed width types should only be used when a fixed width quantity is
>>>>>  meant (which for example may be a value read from or to be written to a
>>>>>  register).
>>>>>
>>>>> +Macros which otherwise would use "typeof(arg) newarg =" to avoid double
>>>>> +evaluation of side effects should use "auto newarg =" per it's C23 behaviour,
>>>>> +to also avoid double textural expansion.
>>>>> +
>>>>>  Especially with pointer types, whenever the pointed to object is not
>>>>>  (supposed to be) modified, qualify the pointed to type with "const".
>>>> That doesn't focus on the pitfall though, in that people shouldn't be using
>>>> the "auto" keyword (except in said cases).
>>>
>>> /sigh, this is why noone does patches to CODING_STYLE.
>>>
>>> If you don't like the wording, propose some wording that you do like.
>>>
>>> Or I will commit the patch without this hunk, because I'm not going to
>>> get drawn into the cycle of blind guessing that every change to
>>> CODING_STYLE seems to get caught in.
>>
>> I don't care about the wording; what I do care about is to get the caveat
>> across. Maybe:
>>
>> '"auto" isn't used in its traditional sense, but rather with its C23 meaning.
>>  Such uses are intended to be limited to macro-local variables.'
> 
> Why limiting to macros?

Because, if I understood Andrew correctly, the specific goal is to help limit
what macros expand to.

Jan

