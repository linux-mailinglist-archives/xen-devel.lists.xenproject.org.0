Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B482BA9EB64
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 11:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970337.1359052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KPS-00016B-Dh; Mon, 28 Apr 2025 09:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970337.1359052; Mon, 28 Apr 2025 09:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KPS-00013e-A2; Mon, 28 Apr 2025 09:04:18 +0000
Received: by outflank-mailman (input) for mailman id 970337;
 Mon, 28 Apr 2025 09:04:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9KPQ-00013X-Vh
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 09:04:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2b2d6db-240f-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 11:04:16 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so40954645e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 02:04:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2d8479sm154342235e9.29.2025.04.28.02.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 02:04:15 -0700 (PDT)
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
X-Inumbo-ID: c2b2d6db-240f-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745831055; x=1746435855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shifrSgTksc5mBL9UdLz927Li754XErdqiBhtpb4NM0=;
        b=UKGmr/DjUOVyzo9PgM02EJ9aROFmC9ikrRHC0Wttr3UwUCwdM0ict//yiu9RvVmP1O
         bVpPL1vnFi6zHGAoFt8R4xSBdTg7fMRvfItb+j2252l4ybBiU8+u0Z4D0HVyep2mAkvm
         Z58GI1CWiqJq3WRIAPuyEsD/3XIo6TDR7SlLkZPKxcshM7QWc4Nr5tffWkU5HtULTJYu
         X/j29mRry61pKEw5xFxYxjVtrMrh/qMsNxpmdkICplIk5YSa0LhdR9Hax85HyyJLXAIL
         WBpQsQjGodyrvr7G90bSDSUU0jzCdsWRDNu4RfTJEkrv4E6it00P2oKgl9HI8ZlMuULF
         mQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745831055; x=1746435855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shifrSgTksc5mBL9UdLz927Li754XErdqiBhtpb4NM0=;
        b=VWfeI5nxfK362V9p09azs9ggEtdMkSRGPlz/AKfypZHLH9n9XNUri9Q0bH0KVaco4r
         tx685/ffNR3FDMZ6Ua/yJABrWoUDalupU9HHI4SUvxyf1nOScdUBfPV8+9dtwRugY3Ji
         YmSpQCDkEGDX5zU6jA7QhDY23XjuXka/EP20vbjYWCgE+i0MK4UsOarFTbroCcuK1DAE
         kNxHgAwv6HPySLH+vIypOyHb7n5TYiAu0RoqYqN2x26DVJfQgglcrW+LdrIoDN4nO3Lp
         cyIWMyKvxzyE43AAj/ZfGRBFrrvT/pO/ZkI9KfQHnDBdurqIPOArsqEimxh9s/eBJGcC
         ELmA==
X-Forwarded-Encrypted: i=1; AJvYcCWNFrwT5c/w6mueGKowDJ12MVPIji8OOg/gSXbhkOmomldg2bkyhPEU3f3OKXnk8Ksu9XYnO8unr3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw66KfH57VnlF3Zvkuic0iNjqYSWPdtVU4L0+szXLyIfOGf3O8y
	y5tPXxl//p4zo/57XDME4Z9M4ZJV6GuQUiMfNsA+J/YMOyt05+eNBOVU4j/RnQ==
X-Gm-Gg: ASbGnctd8I3l8MzZ3LC3guGCjE8EuLHI9lJQtE1x5JHiOsvhyV9UW9sy9ioBR/QpIlI
	el0MaMSzhixL7GWgzZofK3YEJlp+qzeYGVBzqC28JUX7DwxMX/T0gwqKFhhUrpzvfI7Ud7mFd+T
	RJ1w05SiEBy9QGoXXlZFxLLPDsZKnS+ERul9kl+DpT7Bm9a7nAPxlY9pKGBYRqlfi5mkNdQHWx6
	gn5TDKqx7Eemb1CIVbiiKz9xPqPXNmB5z0IaKlCiAvoPlDWIYL1lgT4MswzdJviFDQ83HL7NZvD
	u8irsMRxsaYLu68pkpHfR3bqqZ7JCEKIbtqgX2TmO+IIUNvfAM4h7w4rL1qE0WeDZC+gTg7F0Fq
	k/Zd8uIbNAwOY+pFhyCkhYUi7XJNPZXnKPdCb
X-Google-Smtp-Source: AGHT+IF/FWLZ+TDmpSrZxjci23lLi4o8C2DBUQNWIWLGCEpb4mbKeapqxYEuSUCW3yeZz5BJ3ri+ug==
X-Received: by 2002:a05:600c:3491:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-440a66b6fb1mr94580895e9.29.1745831055345;
        Mon, 28 Apr 2025 02:04:15 -0700 (PDT)
Message-ID: <35ac0856-7a96-4f91-a76d-989bcebfb911@suse.com>
Date: Mon, 28 Apr 2025 11:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
 <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
 <8d65ee65-ec6f-49a3-8954-d303b08dc2df@suse.com>
 <a9db045cff906a4b7db8730ad1095e4b@bugseng.com>
 <b7f7ab2b-baaa-416f-b390-5ed2229d34cb@suse.com>
 <4d21245edbd4949a0aec6ecdadea437c@bugseng.com>
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
In-Reply-To: <4d21245edbd4949a0aec6ecdadea437c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.04.2025 10:09, Nicola Vetrini wrote:
> On 2025-04-28 08:15, Jan Beulich wrote:
>> On 25.04.2025 17:53, Nicola Vetrini wrote:
>>> On 2025-04-25 10:07, Jan Beulich wrote:
>>>> On 24.04.2025 23:45, Stefano Stabellini wrote:
>>>>> On Thu, 24 Apr 2025, Jan Beulich wrote:
>>>>>> On 23.04.2025 19:54, victorm.lira@amd.com wrote:
>>>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>>
>>>>>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>>>>>> reserved identifier or reserved macro name") and R21.2 ("A 
>>>>>>> reserved
>>>>>>> identifier or reserved macro name shall not be declared") 
>>>>>>> violations
>>>>>>> are not problematic for Xen, as it does not use the C or POSIX
>>>>>>> libraries.
>>>>>>>
>>>>>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are
>>>>>>> still
>>>>>>> __builtin_* functions from the compiler that are available so
>>>>>>> a deviation is formulated for all identifiers not starting with
>>>>>>> "__builtin_".
>>>>>>>
>>>>>>> The missing text of a deviation for Rule 21.2 is added to
>>>>>>> docs/misra/deviations.rst.
>>>>>>>
>>>>>>> To avoid regressions, tag both rules as clean and add them to the
>>>>>>> monitored set.
>>>>>>>
>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>>>>>
>>>>>> While the rule is in the library section, ...
>>>>>>
>>>>>>> --- a/docs/misra/deviations.rst
>>>>>>> +++ b/docs/misra/deviations.rst
>>>>>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>>>         construct is deviated only in Translation Units that 
>>>>>>> present
>>>>>>> a violation
>>>>>>>         of the Rule due to uses of this macro.
>>>>>>>       - Tagged as `deliberate` for ECLAIR.
>>>>>>> -
>>>>>>> +
>>>>>>> +   * - R21.1
>>>>>>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX
>>>>>>> standard
>>>>>>> +       libraries. Xen does not use such libraries and all
>>>>>>> translation units
>>>>>>> +       are compiled with option '-nostdinc', therefore there is 
>>>>>>> no
>>>>>>> reason to
>>>>>>> +       avoid to use `#define` or `#undef` on such identifiers
>>>>>>> except for those
>>>>>>> +       beginning with `__builtin_` for which compilers may 
>>>>>>> perform
>>>>>>> (wrong)
>>>>>>> +       optimizations.
>>>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>>>
>>>>>> ... I'd like to ask that it be explicitly clarified here that it's
>>>>>> solely
>>>>>> the library (and not e.g. the compiler itself) that are of concern
>>>>>> here.
>>>>>
>>>>> The language can be clarified:
>>>>>
>>>>> - Rule 21.1 reports identifiers reserved for the C and POSIX 
>>>>> standard
>>>>>   libraries. Xen does not use such libraries and all translation 
>>>>> units
>>>>>   are compiled with option '-nostdinc', therefore there is no reason
>>>>> to
>>>>>   avoid to use `#define` or `#undef` on C and POSIX standard 
>>>>> libraries
>>>>>   identifiers except for those beginning with `__builtin_` for which
>>>>>   compilers may perform (wrong) optimizations.
>>>>
>>>> Which makes it more apparent that there is a gap: What about e.g.
>>>> __x86_64__?
>>>> That falls within what the rules cover, is not a C or POSIX standard
>>>> library
>>>> identifier, yet very clearly must not be fiddled with. Whereas the 
>>>> text
>>>> above deviates it.
>>>
>>> that is true, even if unlikely: one approach could be to avoid 
>>> deviating
>>> predefined macros for all CUs as -nostdinc and -fno-builtins should 
>>> take
>>> care of the rest; this kind of deviation is not currently possible in
>>> ECLAIR, but it might be in the future.
>>
>> Is this perhaps because by "all pre-defined macros" you really mean 
>> _just_
>> those, and not the entire reserved (for that purpose) sub-namespace? 
>> Imo
>> we should not go by what a particular compiler may pre-define (we may 
>> even
>> overlook something if we did it this way).
>>
>> Jan
>>
> 
> I think there is a slight misalignment here: maybe I'm interpreting your 
> answer incorrectly. Let me try to restate the proposal: the following 
> identifiers are not allowed to be #define'd or #undef'd:
> - __builtin_*
> - for each CU, all macro identifiers already defined upon preprocessing 
> that CU by the compiler invocation for that CU. This set of identifiers 
> is always a subset of all the reserved identifiers, but is also 
> dependent on the compiler invocation that is used for that CU, (e.g. 
> __x86_64__ for an Arm target is usually safe to define, as it's 
> typically not a predefined macro introduced by the compiler for that 
> invocation,

No, it's not - elsewhere in the tree we may use this to distinguish
architectures. Plus isn't Misra heavily about avoiding developer
confusion? Defining __x86_64__ on Arm code is, imo, a pretty confusing
thing to do.

> while (re)defining __STDC_VERSION__ or __SIZEOF_INT__ will 
> be a violation in any command line I can think of). Note that this is 
> not a static set, but is based on what is determined to be predefined at 
> the moment of the analysis, so it is not tied to what a particular 
> compiler pre-defines.

Right. Yet what I'm trying to get to is that we disallow _all_ such
reserved identifiers, not just a subset.

Jan

