Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D98689CD
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 08:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685875.1067293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rernt-0006VX-Bp; Tue, 27 Feb 2024 07:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685875.1067293; Tue, 27 Feb 2024 07:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rernt-0006U0-7b; Tue, 27 Feb 2024 07:23:05 +0000
Received: by outflank-mailman (input) for mailman id 685875;
 Tue, 27 Feb 2024 07:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rerns-0006Tu-48
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 07:23:04 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aac285b-d541-11ee-8a58-1f161083a0e0;
 Tue, 27 Feb 2024 08:23:02 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a3d01a9a9a2so395706166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 23:23:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h16-20020a170906261000b00a3ca56e9bcfsm469823ejc.187.2024.02.26.23.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 23:23:01 -0800 (PST)
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
X-Inumbo-ID: 0aac285b-d541-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709018582; x=1709623382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rH9419YQ4l6iuXA5GaUW0ySnSMzOnuMS2xgFJL6omw=;
        b=ST9PmWmxsp1IBWWBd3kEzesAbI/k0iPQlKE7aDfuYNHA1aJz2Angb9pdOJDZ/9YyeQ
         BrhHUuaRPaAWXPj9OmKZscSve3J0MXcOJdlbMLmKclj1d+gmj1mKbOVv5MNWOhxQ3cu/
         GUfts7EM1d6HeQgqJAsK+ikTX4puAuxMtCwm+xoEn7mxRqa+cVzCVIb5BJqu1Ow4k92e
         Ta/rVdZASuqpFF9cGlmSCt+NL27bjJ+F9CcN2sdX4L/eLro2ONehHPRZgD908y3dArrv
         gm266BUKjk20J23YJBQpCRcrVmQ/5w2ifXNgHv+kxaB/wKgyGmolNwBTbzP6RaUNTkcM
         hNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709018582; x=1709623382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rH9419YQ4l6iuXA5GaUW0ySnSMzOnuMS2xgFJL6omw=;
        b=eZWerYZ/lqx1asl5Pgy6EcPitYp+7eQ84/ZrFH+6qc4yWhMU//dbkzsInxtJuZGPb6
         VqibmgQXG/3Ztg2VchKGYFBqYg8NjpGvBwFfI398ExzUb3uruKuv8xAo75ymG7ogbY34
         Z9QwoY1vB9cmkobazq/ycG2gwzME9fuShWVdH2vJXfz4Js7KUXKYKOTJB8vzmarI55si
         nlSRtfFcbmQqCbny9y7y3P3baHoveVvGSzyxGtW5ZBEukxRlq4JW7B+4+zoCjyDGK8ES
         CrMXwhkYK064dS4GzzuO7tLuIHzmYMTs7QjhFwDXTuJe99DzINgtQlc0SoTMiNx+XgKB
         1JpA==
X-Forwarded-Encrypted: i=1; AJvYcCWY20avm+Mb+Fq+1mRNX2bBMSjRoatu8veGGQDW3qC4iOapCY6sDCgLhQRNq5nNSsDVJH++8rTcAxeR+zBDGhFJLJz3k43ZIYcL9/JfKZs=
X-Gm-Message-State: AOJu0Ywixs6HMOJnjTjJNHAa6dpmEH6tcZc1N92fwuD+LAxaYIP9ON/S
	MxfXoj4c52bExBjmbG1lz8n/akfEYQIBmxOku0xoDbhSC1syutbeM2Dfrf6Obw==
X-Google-Smtp-Source: AGHT+IHbxk67kUb80kjH6zAOo1nrkS1CiZXg7lgtWJ3NJqRqhvXTOM+3Zk/KB9RlNLtaFf+cQlJW5A==
X-Received: by 2002:a17:906:150b:b0:a3f:20b9:2b68 with SMTP id b11-20020a170906150b00b00a3f20b92b68mr5717193ejd.10.1709018581919;
        Mon, 26 Feb 2024 23:23:01 -0800 (PST)
Message-ID: <4e3e949d-5714-4c3b-8514-50a3674c94d8@suse.com>
Date: Tue, 27 Feb 2024 08:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com>
 <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com>
 <0032186f-80c7-4dba-b46e-10d4a8e2a8cb@bugseng.com>
 <e8bf9817-fd54-9bf4-4302-dcee682f9172@suse.com>
 <alpine.DEB.2.22.394.2310231417260.3516@ubuntu-linux-20-04-desktop>
 <8f8141e2-c55c-2e58-a078-d5d8764a02df@suse.com>
 <alpine.DEB.2.22.394.2402221730270.754277@ubuntu-linux-20-04-desktop>
 <6eb4dc7c-c6a5-496a-a37f-125b00e9aaa3@suse.com>
 <alpine.DEB.2.22.394.2402231432090.754277@ubuntu-linux-20-04-desktop>
 <cb463469-51e1-4639-bf56-36fe9051d1b3@suse.com>
 <alpine.DEB.2.22.394.2402261511010.247676@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402261511010.247676@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.02.2024 00:48, Stefano Stabellini wrote:
> On Mon, 26 Feb 2024, Jan Beulich wrote:
>> On 23.02.2024 23:36, Stefano Stabellini wrote:
>>> On Fri, 23 Feb 2024, Jan Beulich wrote:
>>>> On 23.02.2024 02:32, Stefano Stabellini wrote:
>>>>> On Tue, 24 Oct 2023, Jan Beulich wrote:
>>>>>> On 24.10.2023 00:05, Stefano Stabellini wrote:
>>>>>>> On Mon, 23 Oct 2023, Jan Beulich wrote:
>>>>>>>> On 23.10.2023 17:23, Simone Ballarin wrote:
>>>>>>>>> On 23/10/23 15:34, Jan Beulich wrote:
>>>>>>>>>> On 18.10.2023 16:18, Simone Ballarin wrote:
>>>>>>>>>>> --- a/xen/include/xen/pdx.h
>>>>>>>>>>> +++ b/xen/include/xen/pdx.h
>>>>>>>>>>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
>>>>>>>>>>>    * @param pdx Page index
>>>>>>>>>>>    * @return Obtained pfn after decompressing the pdx
>>>>>>>>>>>    */
>>>>>>>>>>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
>>>>>>>>>>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
>>>>>>>>>>>   {
>>>>>>>>>>>       return (pdx & pfn_pdx_bottom_mask) |
>>>>>>>>>>>              ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
>>>>>>>>>>
>>>>>>>>>> Taking this as an example for what I've said above: The compiler can't
>>>>>>>>>> know that the globals used by the functions won't change value. Even
>>>>>>>>>> within Xen it is only by convention that these variables are assigned
>>>>>>>>>> their values during boot, and then aren't changed anymore. Which makes
>>>>>>>>>> me wonder: Did you check carefully that around the time the variables
>>>>>>>>>> have their values established, no calls to the functions exist (which
>>>>>>>>>> might then be subject to folding)?
>>>>>>>>>
>>>>>>>>> There is no need to check that, the GCC documentation explicitly says:
>>>>>>>>>
>>>>>>>>> However, functions declared with the pure attribute *can safely read any 
>>>>>>>>> non-volatile objects*, and modify the value of objects in a way that 
>>>>>>>>> does not affect their return value or the observable state of the program.
>>>>>>>>
>>>>>>>> I did quote this same text in response to what Andrew has said, but I also
>>>>>>>> did note there that this needs to be taken with a grain of salt: The
>>>>>>>> compiler generally assumes a single-threaded environment, i.e. no changes
>>>>>>>> to globals behind the back of the code it is processing.
>>>>>>>
>>>>>>> Let's start from the beginning. The reason for Simone to add
>>>>>>> __attribute_pure__ to pdx_to_pfn and other functions is for
>>>>>>> documentation purposes. It is OK if it doesn't serve any purpose other
>>>>>>> than documentation.
>>>>>>>
>>>>>>> Andrew, for sure we do not want to lie to the compiler and introduce
>>>>>>> undefined behavior. If we think there is a risk of it, we should not do
>>>>>>> it.
>>>>>>>
>>>>>>> So, what do we want to document? We want to document that the function
>>>>>>> does not have side effects according to MISRA's definition of it, which
>>>>>>> might subtly differ from GCC's definition.
>>>>>>>
>>>>>>> Looking at GCC's definition of __attribute_pure__, with the
>>>>>>> clarification statement copy/pasted above by both Simone and Jan, it
>>>>>>> seems that __attribute_pure__ matches MISRA's definition of a function
>>>>>>> without side effects. It also seems that pdx_to_pfn abides to that
>>>>>>> definition.
>>>>>>>
>>>>>>> Jan has a point that GCC might be making other assumptions
>>>>>>> (single-thread execution) that might not hold true in our case. Given
>>>>>>> the way the GCC statement is written I think this is low risk. But maybe
>>>>>>> not all GCC versions we want to support in the project might have the
>>>>>>> same definition of __attribute_pure__. So we could end up using
>>>>>>> __attribute_pure__ correctly for the GCC version used for safety (GCC
>>>>>>> 12.1, see docs/misra/C-language-toolchain.rst) but it might actually
>>>>>>> break an older GCC version.
>>>>>>>
>>>>>>>
>>>>>>> So Option#1 is to use __attribute_pure__ taking the risk that a GCC or
>>>>>>> Clang version might interpret __attribute_pure__ differently and
>>>>>>> potentially misbehave.
>>>>>>>
>>>>>>> Option#2 is to avoid this risk, by not using __attribute_pure__.
>>>>>>> Instead, we can use SAF-xx-safe or deviations.rst to document that
>>>>>>> pdx_to_pfn and other functions like it are without side effects
>>>>>>> according to MISRA's definition.
>>>>>>>
>>>>>>>
>>>>>>> Both options have pros and cons. To me the most important factor is how
>>>>>>> many GCC versions come with the statement "pure attribute can safely
>>>>>>> read any non-volatile objects, and modify the value of objects in a way
>>>>>>> that does not affect their return value or the observable state of the
>>>>>>> program".
>>>>>>>
>>>>>>> I checked and these are the results:
>>>>>>> - gcc 4.0.2: no statement
>>>>>>> - gcc 5.1.0: no statement
>>>>>>> - gcc 6.1.0: no statement
>>>>>>> - gcc 7.1.0: no statement
>>>>>>> - gcc 8.1.0: alternative statement "The pure attribute imposes similar
>>>>>>>   but looser restrictions on a function’s definition than the const
>>>>>>>   attribute: it allows the function to read global variables."
>>>>>>> - gcc 9.1.0: yes statement
>>>>>>>
>>>>>>>
>>>>>>> So based on the above, __attribute_pure__ comes with its current
>>>>>>> definition only from gcc 9 onward. I don't know if as a Xen community we
>>>>>>> clearly declare a range of supported compilers, but I would imagine we
>>>>>>> would still want to support gcc versions older than 9? (Not to mention
>>>>>>> clang, which I haven't checked.)
>>>>>>>
>>>>>>> It doesn't seem to me that __attribute_pure__ could be correctly used on
>>>>>>> pdx_to_pfn with GCC 7.1.0 for example.
>>>>>>
>>>>>> The absence of documentation doesn't mean the attribute had different
>>>>>> (or even undefined) meaning in earlier versions. Instead it means one
>>>>>> would need to consult other places (source code?) to figure out whether
>>>>>> there was any behavioral difference (I don't think there was).
>>>>>>
>>>>>> That said, ...
>>>>>>
>>>>>>> So in conclusion, I think it is better to avoid __attribute_pure__ and
>>>>>>> use SAF-xx-safe or an alternative approach instead.
>>>>>>
>>>>>> ... I agree here. We just don't want to take chances.
>>>>>
>>>>> Let me resurrect this thread.
>>>>>
>>>>> Could we use something like "pure" that we #define as we want?
>>>>>
>>>>> Depending on the compiler version or other options we could #define pure
>>>>> to __attribute_pure__ or to nothing.
>>>>
>>>> While we can do about anything, I don't think it's a good idea to overload
>>>> a well known term with something having somewhat different meaning. If a
>>>> differently named custom attribute helps, that might be a possible option.
>>>
>>> It doesn't have a different meaning. If it had a different meaning I'd
>>> agree with you.
>>
>> Then we need to sort this aspect first: If there was no difference in
>> meaning, we ought to be using the real attribute, not a pseudo
>> surrogate. Yet the earlier discussion, according to my understanding,
>> has led to the understanding that for the given example the real
>> attribute cannot be applied entirely legitimately. Hence why the
>> thinking of alternatives actually started. What am I missing?
> 
> There are two different questions:
> 1) using __attribute_pure__ in general when appropriate
> 2) using __attribute_pure__ in pdx_to_pfn as this patch does
> 
> 
> I was talking about 1): as a general approach it looks like a good idea
> to use __attribute_pure__ when possible and appropriate.
> 
> Now let's talk about 2). The latest definition of __attribute_pure__ is:
> 
> """
> The pure attribute prohibits a function from modifying the state of the program that is observable by means other than inspecting the function’s return value. However, functions declared with the pure attribute can safely read any non-volatile objects, and modify the value of objects in a way that does not affect their return value or the observable state of the program.
> """
> 
> So there are two interesting issues:
> 
> a) While this documentation explicitly allows for reading global vars,
> older versions of the docs are less clear. What do we do about them?
> 
> b) Jan wrote that he interprets the statements above to be only valid in
> a single-threaded environment
> 
> 
> To be honest, I am not convinced by b). Jan, is there a statement in the
> GCC docs that says that all the attributes (pure being one of them) only
> apply to a single-thread environment?

It would need to be the other way around, I'm afraid: C99 defines its
abstract machine in a way not even considering possible parallel
execution (except for other external agents, e.g. when "volatile" is
necessary for memory accesses when that memory may also be modified
by such an external agent, e.g. a device on the bus). Hence we'd need
to find an explicit statement in gcc docs which relaxes that globally
or for certain aspects.

> That would be extremely limiting
> for something like __attribute_pure__. I think we should take the
> documentation of attribute pure at face value. To me, it clearly applies
> to pdx_to_pfn. Roberto and the team at Bugseng came to the same
> conclusion.
> 
> On the other end, I think a) is important. Older version of GCC don't
> clarify the behavior toward global variables. From the documentation, I
> would use __attribute_pure__ only with GCC 9 or later. Which is why we
> need the #define.

Right, this is a position we can take. As said, I think we'd then limit
ourselves more than necessary. Otoh the number of people using gcc8 or
older to build up-to-date Xen should be constantly decreasing ...

Jan

>>> The goal is for the #define to have exactly the same meaning as the gcc
>>> definition from gcc 9 onward. However, other versions of gcc or other
>>> compilers could have different semantics. Also we might not want to
>>> allow gcc to perform the optimizations that it might want to do if the
>>> attribute is passed.
>>>
>>> So the definition would be clear and 100% aligned with the modern gcc
>>> definition. However we would be able to control the behavior better.
>>
>> If we feared older gcc didn't implement "pure" suitably, we should
>> simply make __attribute_pure__ expand to nothing there. (Still use of
>> the attribute then would need limiting to cases where it can validly
>> be applied.)
> 
> That's fine by me


