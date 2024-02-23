Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DE860B60
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 08:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684649.1064645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdQ6l-0003l9-6I; Fri, 23 Feb 2024 07:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684649.1064645; Fri, 23 Feb 2024 07:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdQ6l-0003iT-3G; Fri, 23 Feb 2024 07:36:35 +0000
Received: by outflank-mailman (input) for mailman id 684649;
 Fri, 23 Feb 2024 07:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rdQ6j-0003iN-O8
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 07:36:33 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42e9baac-d21e-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 08:36:31 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so585040a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 23:36:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020aa7c78a000000b005643e2ea283sm5396721eds.39.2024.02.22.23.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 23:36:30 -0800 (PST)
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
X-Inumbo-ID: 42e9baac-d21e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708673790; x=1709278590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmkbwePMKm9EByqKANYIYNp4pxpH8D4joyd4XABIw00=;
        b=KP7ZLwl44ePsLgCnhhgjQM5TZglmweNT5sXG/ZwtwktjK0B1P68sf1SFOd9692AJgu
         bJf0WsctMLoOY6+iBxTceM9KKSfMugYqnErvTNkPb5b3EKATKg/57OqS+PCy9TMt1TAy
         IdCCKYJx8LXFFqn6bNFSPeMFTWYKnOfZLOdcxLiLt75hf2ipfg0Q5bb3CRSXtLpYmRR7
         BuM/1wI1q0j15uuNzZXxUhO+5Uo+kse3OT+jWaVSEZqyytuPSLBHThg8RnCtAYVQTOXS
         7b1kx+Xs8sT6aSl2XTLPaPio0/pIRZvZ7vSE0d/NqV0GjgPMrYgHZt8ChBRh5d/r2VF7
         8umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708673790; x=1709278590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmkbwePMKm9EByqKANYIYNp4pxpH8D4joyd4XABIw00=;
        b=kpQ9aocZMOM9qK1m3lrkvBjovZEXnHsmOAAJkqOyqqqcMVO9cAtMyM0cwQiA/+FTuC
         E3BN/QCHpsmX4Owr9auB/SIFsTd+h0xcEUCfXEgpNtD99Yzm6P/D5jobET7GzmM748Nd
         uspUIZgHB3qTxRWq7qF/FeeAe9+odcC4kZLDpzRqpF5cuN44gOneJxkv8fPztEXmmSOi
         XPPRzPHx85ZJX/K+ospctYmrLub4z1KjJ8G15qjC593aV+ONXMM3M7Wyjgf+m/9GnQ6Q
         aB2V+WZY33hd4CoPLAugKP0wNAtEClYm62yO1RFYdKTyUiK4wmbkmx3XaX0kkluTQiAG
         O/fw==
X-Forwarded-Encrypted: i=1; AJvYcCWTsLCWlXCJ6v9IpVkphIqzwasH6yTKqW2+g+oFo6akhgerjTX7y+KP+bNiRksQYGe7clOxjCdv8fv0k8CB80DWYtLjbY5jI7AoeLQItlA=
X-Gm-Message-State: AOJu0YzgCumCOq0jM+Y/euHkrH+aiQ/QzoINo5D62temWnBsTTr8ejBh
	FXX8Sq8wKTbm7DaNmvkX6eepbL3XwyzoRafnrsvf9SZSKbICKajO0d9I4VVweA==
X-Google-Smtp-Source: AGHT+IHUGsvWsDinspQmhmNmSwelLqeba8knyJ3g1Crk+PnEId2SGU43NU/AwviPHaTD7REiYQLoNQ==
X-Received: by 2002:aa7:c515:0:b0:565:7eff:58d5 with SMTP id o21-20020aa7c515000000b005657eff58d5mr118625edq.41.1708673790442;
        Thu, 22 Feb 2024 23:36:30 -0800 (PST)
Message-ID: <6eb4dc7c-c6a5-496a-a37f-125b00e9aaa3@suse.com>
Date: Fri, 23 Feb 2024 08:36:28 +0100
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
In-Reply-To: <alpine.DEB.2.22.394.2402221730270.754277@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2024 02:32, Stefano Stabellini wrote:
> On Tue, 24 Oct 2023, Jan Beulich wrote:
>> On 24.10.2023 00:05, Stefano Stabellini wrote:
>>> On Mon, 23 Oct 2023, Jan Beulich wrote:
>>>> On 23.10.2023 17:23, Simone Ballarin wrote:
>>>>> On 23/10/23 15:34, Jan Beulich wrote:
>>>>>> On 18.10.2023 16:18, Simone Ballarin wrote:
>>>>>>> --- a/xen/include/xen/pdx.h
>>>>>>> +++ b/xen/include/xen/pdx.h
>>>>>>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
>>>>>>>    * @param pdx Page index
>>>>>>>    * @return Obtained pfn after decompressing the pdx
>>>>>>>    */
>>>>>>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
>>>>>>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
>>>>>>>   {
>>>>>>>       return (pdx & pfn_pdx_bottom_mask) |
>>>>>>>              ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
>>>>>>
>>>>>> Taking this as an example for what I've said above: The compiler can't
>>>>>> know that the globals used by the functions won't change value. Even
>>>>>> within Xen it is only by convention that these variables are assigned
>>>>>> their values during boot, and then aren't changed anymore. Which makes
>>>>>> me wonder: Did you check carefully that around the time the variables
>>>>>> have their values established, no calls to the functions exist (which
>>>>>> might then be subject to folding)?
>>>>>
>>>>> There is no need to check that, the GCC documentation explicitly says:
>>>>>
>>>>> However, functions declared with the pure attribute *can safely read any 
>>>>> non-volatile objects*, and modify the value of objects in a way that 
>>>>> does not affect their return value or the observable state of the program.
>>>>
>>>> I did quote this same text in response to what Andrew has said, but I also
>>>> did note there that this needs to be taken with a grain of salt: The
>>>> compiler generally assumes a single-threaded environment, i.e. no changes
>>>> to globals behind the back of the code it is processing.
>>>
>>> Let's start from the beginning. The reason for Simone to add
>>> __attribute_pure__ to pdx_to_pfn and other functions is for
>>> documentation purposes. It is OK if it doesn't serve any purpose other
>>> than documentation.
>>>
>>> Andrew, for sure we do not want to lie to the compiler and introduce
>>> undefined behavior. If we think there is a risk of it, we should not do
>>> it.
>>>
>>> So, what do we want to document? We want to document that the function
>>> does not have side effects according to MISRA's definition of it, which
>>> might subtly differ from GCC's definition.
>>>
>>> Looking at GCC's definition of __attribute_pure__, with the
>>> clarification statement copy/pasted above by both Simone and Jan, it
>>> seems that __attribute_pure__ matches MISRA's definition of a function
>>> without side effects. It also seems that pdx_to_pfn abides to that
>>> definition.
>>>
>>> Jan has a point that GCC might be making other assumptions
>>> (single-thread execution) that might not hold true in our case. Given
>>> the way the GCC statement is written I think this is low risk. But maybe
>>> not all GCC versions we want to support in the project might have the
>>> same definition of __attribute_pure__. So we could end up using
>>> __attribute_pure__ correctly for the GCC version used for safety (GCC
>>> 12.1, see docs/misra/C-language-toolchain.rst) but it might actually
>>> break an older GCC version.
>>>
>>>
>>> So Option#1 is to use __attribute_pure__ taking the risk that a GCC or
>>> Clang version might interpret __attribute_pure__ differently and
>>> potentially misbehave.
>>>
>>> Option#2 is to avoid this risk, by not using __attribute_pure__.
>>> Instead, we can use SAF-xx-safe or deviations.rst to document that
>>> pdx_to_pfn and other functions like it are without side effects
>>> according to MISRA's definition.
>>>
>>>
>>> Both options have pros and cons. To me the most important factor is how
>>> many GCC versions come with the statement "pure attribute can safely
>>> read any non-volatile objects, and modify the value of objects in a way
>>> that does not affect their return value or the observable state of the
>>> program".
>>>
>>> I checked and these are the results:
>>> - gcc 4.0.2: no statement
>>> - gcc 5.1.0: no statement
>>> - gcc 6.1.0: no statement
>>> - gcc 7.1.0: no statement
>>> - gcc 8.1.0: alternative statement "The pure attribute imposes similar
>>>   but looser restrictions on a function’s definition than the const
>>>   attribute: it allows the function to read global variables."
>>> - gcc 9.1.0: yes statement
>>>
>>>
>>> So based on the above, __attribute_pure__ comes with its current
>>> definition only from gcc 9 onward. I don't know if as a Xen community we
>>> clearly declare a range of supported compilers, but I would imagine we
>>> would still want to support gcc versions older than 9? (Not to mention
>>> clang, which I haven't checked.)
>>>
>>> It doesn't seem to me that __attribute_pure__ could be correctly used on
>>> pdx_to_pfn with GCC 7.1.0 for example.
>>
>> The absence of documentation doesn't mean the attribute had different
>> (or even undefined) meaning in earlier versions. Instead it means one
>> would need to consult other places (source code?) to figure out whether
>> there was any behavioral difference (I don't think there was).
>>
>> That said, ...
>>
>>> So in conclusion, I think it is better to avoid __attribute_pure__ and
>>> use SAF-xx-safe or an alternative approach instead.
>>
>> ... I agree here. We just don't want to take chances.
> 
> Let me resurrect this thread.
> 
> Could we use something like "pure" that we #define as we want?
> 
> Depending on the compiler version or other options we could #define pure
> to __attribute_pure__ or to nothing.

While we can do about anything, I don't think it's a good idea to overload
a well known term with something having somewhat different meaning. If a
differently named custom attribute helps, that might be a possible option.

Jan

