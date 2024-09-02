Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57F96815F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787582.1196979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl25U-00079d-K0; Mon, 02 Sep 2024 08:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787582.1196979; Mon, 02 Sep 2024 08:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl25U-00077f-Gi; Mon, 02 Sep 2024 08:07:00 +0000
Received: by outflank-mailman (input) for mailman id 787582;
 Mon, 02 Sep 2024 08:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl25T-00077Z-3k
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:06:59 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5343f677-6902-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 10:06:58 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5343d2af735so3780664e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:06:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988fefc12sm522286966b.9.2024.09.02.01.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:06:56 -0700 (PDT)
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
X-Inumbo-ID: 5343f677-6902-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725264417; x=1725869217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pW8n8dG1nmqjU3Mf5/iRNzcj7GbS5huOeHeDS4FR4Jc=;
        b=WkjP322yIXjjeHGE1W6Hz1FrKMUHeIsII0eF42XQDtnH/LjwnEMxGIFwtYO8JjpKk0
         MYe2AiLuUmyDOUnsTRd8ElK1RFJC+mJZcK0vE1Tqxp21Wu2cyLQI7cojZ1jrEQF8Pti+
         3aN/wgh3JBoL340CSznRcSMqbrP8RaX+jq3FxjVLCFkSY2cd/fE9d+2o1g00U4uB4Die
         NqcwH7NbjYO7Se8TgppN0J1DtWY/InpcDaWqEPXXd1WwWoCcEEN0sWPE29GrtBOB0IC/
         qAKKpui3WZKrtlP3gqpxd7eN6ocx3g2QIcWQMiYzZrfmYHNYj0CnYsTsShSQ+8TVyMB5
         UtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264417; x=1725869217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW8n8dG1nmqjU3Mf5/iRNzcj7GbS5huOeHeDS4FR4Jc=;
        b=pIVAjcylGuTJvMPbzwB4+Byru3zwn37YgNtCb9nP3TqOcwWHGObsYKeozynKz9+Boc
         Njytvn6CATXr0HtKgxjlQVtchNyx36gZfOzGaFb9S4lOtW+IjctpeWw2lmVsLhX5T9dh
         qSTCnEVosSsOxC4QAdiFk2e92jjZIOX2RghGsiUUH6Fj2V3lRJ6w/uJFSMXw8ks303F9
         acabrCioNBI5fNH4eUVEvCUcA+7Bzh7Tew79f8LtBs+7F3L1dxMxLrRlfCmKOd3n25Ex
         VbZhr5J4eacRlRHh29vaY0zDHeJvtA79gpv6dC8XzxUEcvHIjWnzTlGDXbRs4VcM8iWC
         6Zkg==
X-Forwarded-Encrypted: i=1; AJvYcCWmipBZ/WaOKXG7+w4ij/3LY337PITa2KmdRxWJHroL08NHhSQRYRFVhUHtFPkfT9G7s9coWFhXJoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWKx3UtqecGlYoFYGw13yMsNlCUW8SWmKYWGP+e6DSVHr6aBaA
	beGBrn810Wgpcf2+4N/LRAMvvNOJL6GvPLsdZnid5e4Y1jJXUsMCNUjh8atkvHoJ+k/1jtxgxJo
	=
X-Google-Smtp-Source: AGHT+IFqmdsEsEvzYB/Q4FRRMNNKUf3IwWWGkfHnCsnOMk3/2MetxdJ5/yEBfdLDb7/hrl/6Nmd/jw==
X-Received: by 2002:ac2:4e0d:0:b0:52f:d69e:bb38 with SMTP id 2adb3069b0e04-53546afd7c6mr6709418e87.2.1725264417196;
        Mon, 02 Sep 2024 01:06:57 -0700 (PDT)
Message-ID: <1cab3807-706b-44fc-a074-d44dfd9fd446@suse.com>
Date: Mon, 2 Sep 2024 10:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] x86/bitops: Use the POPCNT instruction when
 available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-12-andrew.cooper3@citrix.com>
 <48377e77-2458-439c-b594-21bde610ffbb@suse.com>
 <f661dca1-0583-4a83-89db-662473749df8@citrix.com>
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
In-Reply-To: <f661dca1-0583-4a83-89db-662473749df8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.08.2024 22:03, Andrew Cooper wrote:
> On 29/08/2024 3:36 pm, Jan Beulich wrote:
>> On 29.08.2024 00:03, Andrew Cooper wrote:
>>> It has existed in x86 CPUs since 2008, so we're only 16 years late adding
>>> support.  With all the other scafolding in place, implement arch_hweightl()
>>> for x86.
>>>
>>> The only complication is that the call to arch_generic_hweightl() is behind
>>> the compilers back.  Address this by writing it in ASM and ensure that it
>>> preserves all registers.
>>>
>>> Copy the code generation from generic_hweightl().  It's not a complicated
>>> algorithm, and is easy to regenerate if needs be, but cover it with the same
>>> unit tests as test_generic_hweightl() just for piece of mind.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> v2:
>>>  * Fix MISRA 8.2 (parameter name) and 8.5 (single declaration) regressions.
>>>  * Rename {arch->x86}-generic-hweightl.{S->c}
>>>  * Adjust ASM formating
>>>
>>> The __constructor trick to cause any reference to $foo() to pull in
>>> test_$foo() only works when both are in the same TU.  i.e. what I did in
>>> v1 (putting test_arch_generic_hweightl() in the regular generic-hweightl.c)
>>> didn't work.
>> I'm afraid I don't understand this. What exactly didn't work, breaking in which
>> way? Presumably as much as you, I don't really like the global asm() in a C
>> file, when ideally the same could be written with less clutter in an assembly
>> one.
> 
> We have lib-y because we wish to not include arch_generic_hweightl() if
> it isn't referenced.
> 
> But, test_arch_generic_hweightl() unconditionally references
> arch_generic_hweightl() (in CONFIG_SELF_TESTS builds).

Which I assumed was intentional: Always have the tests, to make sure the code
doesn't go stale (or even break).

Looking at the v2 code again I notice that while now you're running the tests
only when the to-be-tested function is referenced from elsewhere, the testing
has become independent of CONFIG_SELF_TESTS. I don't think that was intended?

> Both {test_,}arch_generic_hweightl() do need to be in the same TU for
> this to work (nicely), and I'm very uninterested in writing
> test_arch_generic_hweightl() in asm.

Well - surely absolutely no question about this last aspect.

>>> This in turn means that arch_generic_hweightl() needs writing in a global asm
>>> block, and also that we can't use FUNC()/END().  While we could adjust it to
>>> work for GCC/binutils, we can't have CPP macros in Clang-IAS strings.
>> What does Clang different from gcc there? I was hoping that at least their pre-
>> processors would work in (sufficiently) similar ways.
> 
> It's inside a string, not outside, so CPP on the C file does nothing.
> 
> Passing CPP over the intermediate .S would work, but we don't have an
> intermediate .S with Clang-IAS.

There's never an intermediate .S; it's always .s (not subject to C pre-
processing). Therefore I continue to struggle with how CPP macros would
come into (inconsistent) play here, unless they were used in construction
of the string literal (and then work similarly for gcc and Clang).

But as you say, we want to avoid playing with the intermediate file in
any event.

Jan

