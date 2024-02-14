Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF018543AD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 08:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680218.1058161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raA7G-0001fY-0s; Wed, 14 Feb 2024 07:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680218.1058161; Wed, 14 Feb 2024 07:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raA7F-0001cT-Tn; Wed, 14 Feb 2024 07:55:37 +0000
Received: by outflank-mailman (input) for mailman id 680218;
 Wed, 14 Feb 2024 07:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raA7E-0001cN-Mv
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 07:55:36 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f576c08-cb0e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 08:55:35 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d10ae127ffso17361251fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 23:55:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 be15-20020a05600c1e8f00b004107219c664sm1128506wmb.32.2024.02.13.23.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 23:55:34 -0800 (PST)
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
X-Inumbo-ID: 6f576c08-cb0e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707897335; x=1708502135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSPml6Psa7uiTdppooK2P7rnh6GtisF82Sju1HjR1cM=;
        b=HjmIweBSidcHgyEfSIUje2Knop47gsuB3b/f6nBIZM6m47Do2ZStOys/+pUMJ6NdOh
         JmSBWfO7yEPcuVW4hzrXlDKFbL1gdoY1G6QwPhPG3f/8SWBp2eNWboMehme8bcwCxUTQ
         rELg1Pt2QqTL906FAk4Jioq/h4ktUpQXWqRhjlXiBgcL8N5sWkr/lmQkPYgs2sVEGxIl
         FyhhC0hhMBMI8wACXGXRCZ8CP2Ai/lMFdg/cJiPVlRUmLxSNvaqQTgKpPVGFeaAdY4MW
         KIE2g4gOqx5Bqs0mlFY7/Id5soiTfJaE28HUUc6LckxJ3okaA7hcgemZ31hj9gKVV5pN
         C6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707897335; x=1708502135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSPml6Psa7uiTdppooK2P7rnh6GtisF82Sju1HjR1cM=;
        b=IeTP9RARIsaBz1j3BVINm0Pq4vC04jmQkzgmt4PkxCnjKWKI78B28yWjooHD4qdItT
         Ja8xZokrJ/bOZ3tzVHNNzmB2qdVoSZ9dyNaSXWr6+1/cT7rOjkaO1bqRvAyVv33+Qpin
         AIMHw5S59+Wbp9GMEW83Fblc+8jkC8uR/5oUjh/Agd9C8+4O1gmNNJh1Vn3LIcrkz8xm
         +80EWWRkFwbyaiXHk1dlpemESGvf6L0xpx3p+bq7Wxz1l/ctI9vsbs5d7uZW5qe82K6N
         F+JrIhPeHebmVQPQc3efVzIQFCo9sbydA9zFxUsxgj22NfIgFI5AMkJ/hq6jVpPekAOh
         nBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWeQnX+nGyS7C3ZqeStmNkT1LNHVnKXeqD6uQIoXuxezMTSQ/W4iY+B5wIm8ACzqLltVw5HmcNfDtVF1t7+eqUctg3q5xBqnldKbZg/obQ=
X-Gm-Message-State: AOJu0YxnBDUHsAAHtKQqAjFTEps/MJEJ4J4F/ceI0LrAYTcgW2gTLc0b
	CUrSUpC9BmhQEJ9BPyIFcnvvjs7Bzzsx3ZjbZ0wNHoPOggQswCsiKQVRTj2JKQ==
X-Google-Smtp-Source: AGHT+IE1I7uvjPAQwHiFNLhx8rXHlBejPaJhEvtocVIB8P9EQt8HmO6zWYW2eV7GhpktNfvLE6PAvQ==
X-Received: by 2002:a05:651c:314:b0:2d0:b6c4:2180 with SMTP id a20-20020a05651c031400b002d0b6c42180mr1127696ljp.53.1707897334858;
        Tue, 13 Feb 2024 23:55:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA8IIhENIcDXpPiSFA6Oq7K4eycReCf2JC9q+q6h+yZ9EUMhORtHvR4OBt9yUxJDLMnecZ6NLfnFNOnKOUcryS8zEilioXVeFIEdMbAhUgbIf5HtMQ8TCu7s/RmAOBwjPmtjLHYm8kK1oU04RhEVxtwOup+QivyST6a4uDD4ugzDpwaBBFQrYX2qfe1UpcvZoi4aM1yBKyTWIMhCWNdwio2YCjWs2rvwKeF0ljBxJVygb7wMHxsj7e4TS40YKJk24e3l6NCAxPJHFD5MbEUQTuDVxf9TyVyMw/cCfC63LKhxjBYf0YV1oFLwrHQphJvrSLT0cD3VzeVW9L1bklCCAQyMGvfXscONDXBLfMGkgbi3mt6z3ptWOiapIcG58UIZkIOw==
Message-ID: <0feb6a90-2c3e-489f-90de-b4b2979997dd@suse.com>
Date: Wed, 14 Feb 2024 08:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] xen/arm: add cache coloring support for Xen
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-15-carlo.nonato@minervasys.tech>
 <a66e3131-1de1-49cb-9b26-5fb1fd77bc20@suse.com>
 <CAG+AhRWv5MazB-txmPkcb3CAuWFQvM97HH3D-_bn6r3kdB360A@mail.gmail.com>
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
In-Reply-To: <CAG+AhRWv5MazB-txmPkcb3CAuWFQvM97HH3D-_bn6r3kdB360A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2024 18:29, Carlo Nonato wrote:
> On Tue, Feb 13, 2024 at 4:25 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> @@ -218,9 +230,44 @@ static void xen_pt_enforce_wnx(void)
>>> --- a/xen/common/llc-coloring.c
>>> +++ b/xen/common/llc-coloring.c
>>> @@ -29,6 +29,8 @@ static unsigned int __ro_after_init xen_num_colors;
>>>
>>>  #define mfn_color_mask              (max_nr_colors - 1)
>>>  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
>>> +#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_mask) | \
>>> +                                     (color)))
>>
>> Nit: The wrapped line wants further indenting, such that it becomes
>> immediately clear what parentheses are still open. Alternatively:
>>
>> #define mfn_set_color(mfn, color) \
>>     (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
>>
>> This is certainly an "interesting" construct: I, for one, wouldn't expect
>> that setting the color actually changes the MFN.
> 
> Would something like mfn_with_color() be a better name? I need something that
> expresses clearly that something will be returned. Maybe colored_mfn() is even
> better?

The latter reads as if it was a predicate, not a transformation. The former
or get_mfn_with_color() _may_ be okay. Without the get_ it's still a little
predicate-like, while the get_ itself somewhat collides with other uses of
that prefix, specifically e.g. get_page{,_type}(). So I'm still not overly
happy, yet e.g. mfn_from_mfn_and_color() feels clumsy to me.

>>> --- a/xen/include/xen/llc-coloring.h
>>> +++ b/xen/include/xen/llc-coloring.h
>>> @@ -24,6 +24,17 @@ static inline void domain_llc_coloring_free(struct domain *d) {}
>>>  static inline void domain_dump_llc_colors(const struct domain *d) {}
>>>  #endif
>>>
>>> +/**
>>> + * Iterate over each Xen mfn in the colored space.
>>> + * @mfn:    the current mfn. The first non colored mfn must be provided as the
>>> + *          starting point.
>>> + * @i:      loop index.
>>> + */
>>> +#define for_each_xen_colored_mfn(mfn, i)        \
>>> +    for ( i = 0, mfn = xen_colored_mfn(mfn);    \
>>> +          i < (_end - _start) >> PAGE_SHIFT;    \
>>> +          i++, mfn = xen_colored_mfn(mfn_add(mfn, 1)) )
>>
>> While the comment mentions it, I still consider it problematic that
>> - unlike other for_each_* constructs we have - this requires one of
>> the iteration variables to be set up front. Question is why it needs
>> to be that way: Isn't it the MFN underlying _start which you mean to
>> start from?
> 
> As said above, this is used also when page tables setup isn't complete
> so I can't easily find the first MFN.

Did you consider making the initial value a macro parameter then?

Jan

