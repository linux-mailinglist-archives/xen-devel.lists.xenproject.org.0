Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22DBC8E80C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173848.1498844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcC7-0006zt-0q; Thu, 27 Nov 2025 13:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173848.1498844; Thu, 27 Nov 2025 13:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcC6-0006xe-UF; Thu, 27 Nov 2025 13:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1173848;
 Thu, 27 Nov 2025 13:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOcC5-0006xT-EU
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:37:57 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47187c04-cb96-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 14:37:54 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso3685575e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 05:37:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479040b329bsm69626655e9.2.2025.11.27.05.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 05:37:53 -0800 (PST)
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
X-Inumbo-ID: 47187c04-cb96-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764250674; x=1764855474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVxt0DpgRHAPvoVbG3fosShNTuZjx/TBusYXthGmS10=;
        b=NUr/iFaMCH9IQwTuZwZpMvePc1ypRZ9p6rajJU/Oa+VWXZugHK/sZSSBV6hbKJzYVa
         qEVLaC3xBjs8uxowlm3rCEcJg2zEKAJjmaTUcZzNikgD/5vpy3l9EfZULzD4ZsbYVOmc
         jWNP15yxOl+scRU+sClF16w3Nl2GyLlm1AWoETd44MyZQWGfmiPsr8bUMgTKSJIRBj59
         tdLGmhHx1zJnRnlIlaVZPML1J0XlzMrDHNO6SXqm/WVZBW7C8hxUVomX/ptQJiLbSZJF
         3jxlY1us0/WWvMp71j+D44drxPr7DIR6f2sr6t/QkXFyAMbLMG8z2+La5hYcsY9Q6BZV
         6f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764250674; x=1764855474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVxt0DpgRHAPvoVbG3fosShNTuZjx/TBusYXthGmS10=;
        b=hn8r7QhH+DF5NQqhm2vVLesB1CpyDpFa1vVjfmPntBFK5gvLUfffhhHJdwwYIZu6N5
         0r68B0Lvek8jaYzdI2ML4LEKZlgCAxVW2L9m7350F8Q1JfPevQNlr2ulunEZeKX4z7zJ
         hC8VfbIKq2e1KbOD23DCotjnrFLK8q72PlkS67cpEXwoKhv29BwQ2xpRlBjNPS1ihywl
         2byDjFVlAttlUsHq4YDPQPGuDb1uzJgVu+byMFwf6k3fIuIUG3nU1LMuBXRToZiCu5KI
         Z5j9WOqXCmGIdwvigeBKnHzklwo7Z5xDbqwdu5LhwgEV/it8X/Kfh8CVhQ1GkZOMyADE
         U2+A==
X-Forwarded-Encrypted: i=1; AJvYcCX3CTXdOxQmT2m8qVWXR6G23B5vWA/qeFLkF7q7mNvqS6gzkCe1UXpnqEsiNNFDa9y79AmcV/obgyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysjnnKvFF2KNvxEdMGq1MLpHCHCXl89cm50y5qYw1rpZwJ5BwS
	JdzgJqjD7lgeTq8ZmLPA/jJnIPgbvTDfX8weQIjqtYpYJpwCjdj1P/KZ7OaxoD97QQ==
X-Gm-Gg: ASbGncu8a2qh/sisvIm/LoUeRsjhsIudl7635U8sG6vOUpyr+R22Db6Vo18kN5BdkL+
	Yg3ir8gbA9DJKLLrTabbivPkD+fltpXIX6Il54aSKNlQVyF/A0MusTBawiwqXq5us3ZPb8FI/KS
	57tCN4+vcoVDAUPSxu0kb0fhJTKYdPygUOyOvrBc/JFPOjSLRvHYyoalPBVE48hI3o+NmDCOwRW
	8KjXIod+rhrgiuVWmgpi1w8Ht1ux3qfA8B0OM8YrPa0LrPBADettRU3DFNwE0UaswPtfUCOwppp
	gPvVsgKwKZsVdWHgFjjdf1zwmcA9uoTmfLVeM3/RAtXjuD4f81O7EYotJPWSmoPE2r0fIryuprk
	wQOar6n+va474YQLzaGmJ+SEDiyMTbmyeQNJu4IY4a2T4gM4W9Csk3JD8e2B2tgqGyl7644YdbF
	2hdPQeYHfg114dURfTfk/jU37nKSZu771WqrxLXR79zS2+CvViMqnFYM77LcQHBFGnTaF2MmB37
	30=
X-Google-Smtp-Source: AGHT+IGaY7gZPZBGBIxJtOAAhmuPstNtgmzRuBQ0EFuLchJyLPU98aMNFTG8OrGI3w0U3zCgcDqevg==
X-Received: by 2002:a05:600c:3b9c:b0:477:af07:dd22 with SMTP id 5b1f17b1804b1-47904b24243mr103839205e9.28.1764250674165;
        Thu, 27 Nov 2025 05:37:54 -0800 (PST)
Message-ID: <1ea5b7d2-6d73-4133-bf32-085559f6df41@suse.com>
Date: Thu, 27 Nov 2025 14:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before using
 it
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
 <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
 <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
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
In-Reply-To: <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 14:15, Alejandro Vallejo wrote:
> On Thu Nov 27, 2025 at 11:46 AM CET, Jan Beulich wrote:
>> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>>> + * A runtime check at the time of CPUID probing guarantees we never run on
>>> + * wrong hardware and another check when loading CPU policies guarantees we
>>> + * never run policies for a vendor in another vendor's silicon.
>>> + *
>>> + * By the same token, the same folding can happen when no vendor is compiled
>>> + * in and the fallback path is present.
>>> + */
>>> +static always_inline bool x86_vendor_is(uint8_t candidate, uint8_t vendor)
>>
>> I fear the comment, no matter that it's pretty large already, doesn't make
>> clear how this function is to be used, i.e. how for this being an "is"
>> predicate the two arguments should be chosen. My typical expectation would be
>> for "is" predicates to apply to a single property, with other parameters (if
>> any) only being auxiliary ones. Maybe it would already help if the first
>> parameter wasn't named "candidate" but e.g. "actual" (from looking at just
>> the next patch). Or maybe (depending on the number of possible different
>> inputs for the first parameter) there want to be a few wrappers, so the
>> "single property" aspect would be achieved at use sites.
>>
>> Then I see no reason for the parameters to be other than unsigned int. (Same
>> for the local variable then, obviously.)
> 
> I could also call it x86_vendor_in(), to mean it's a set membership check,
> leaving its prototype as:
> 
> bool x86_vendor_in(unsigned int actual, unsigned int bitmap);
> 
> bitmap is a special kind because literal 0 has a special meaning (unknown). So
> 
> I'd expect x86_vendor_in(X86_VENDOR_UNKNOWN, X86_VENDOR_UNKNOWN) to return true
> when UNKNOWN_CPU=y. One way to alleviate complexity would be to promote the
> unknown case to a first-class bit. It's not like it's zero for any good reason.
> 
> As for the what goes in the first parameter, it's invariably the x86_vendor
> field of cpuinfo_x86 (for boot_cpu_data), or of any cpu_policy.
> 
> This is meant to replace checks on vendors, so a natural (and universally used)
> pattern across the codebase is to have a runtime variable checked against a
> constant. Here's a longer list of patterns and expected transformations.
> 
>   from: cp->x86_vendor == X86_VENDOR_AMD
>     to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)
> 
>   from: cp->x86_vendor != X86_VENDOR_AMD
>     to: !x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)
> 
>   from: cp->x86_vendor & X86_VENDOR_AMD
>     to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)
> 
>   from: cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)
>     to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)

There's a mix of c and cp up from here, but I hope the distinction isn't
relevant in this context. What is relevant though is that you shouldn't
be using struct cpuinfo_x86's x86_vendor field anymore. See the struct
definition.

>   from: !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))
>     to: !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)
> 
>   from: cp->x86_vendor == X86_VENDOR_UNKNOWN
>     to: x86_vendor_is(cp->x86_vendor, X86_VENDOR_UNKNOWN)

For it to be clear what the "is" applies to, all of the above would imo
better be x86_vendor_is(c, X86_VENDOR_...) or
x86_vendor_is(cp, X86_VENDOR_...) at the call sites. The c / cp are what
I called "auxiliary data" elsewhere, and the property checked clearly is
the 2nd argument. To achieve this you could introduce a wrapper macro,
which would do the de-ref of the ->vendor field. (As a prereq, struct
cpu_policy would then also need to gain a "vendor" alias of the present
"x86_vendor" field.)

> And switch statements converted to if-elseif chains.

I've voiced concern towards this elsewhere.

>> First: Would one ever pass X86_VENDOR_UNKNOWN for "vendor"? The next patch,
>> for example, specifically doesn't.
> 
> I don't think so. There's definitely not any existing case atm. Still, I think
> it's better to preserve the invariant that the follwing transformation:
> 
>   from: cp->x86_vendor == X86_VENDOR_X
>     to: x86_vendor_is(cp->x86_vendor, X86_VENDOR_X)
> 
> holds for every vendor variant in the "everything compiled-in" case.

Otoh the code could be simplified if you simply rejected the passing of
X86_VENDOR_UNKNOWN.

>>> +    /* single-vendor optimisation */
>>> +    if ( !IS_ENABLED(CONFIG_UNKNOWN_CPU) &&
>>> +         (ISOLATE_LSB(X86_ENABLED_VENDORS) == X86_ENABLED_VENDORS) )
>>> +        return filtered_vendor == X86_ENABLED_VENDORS;
>>> +
>>> +    /* compiled-out-vendor-elimination optimisation */
>>> +    if ( !filtered_vendor )
>>> +        return false;
>>> +
>>> +    /*
>>> +     * When checking against a single vendor, perform an equality check, as
>>> +     * it yields (marginally) better codegen
>>> +     */
>>> +    if ( ISOLATE_LSB(filtered_vendor) == filtered_vendor )
>>
>> So one may pass a combination of multiple vendors for "vendor"? Is so, why
>> is the parameter name singular?
> 
> Yes, it's a bitmap. Parameter could be in fact "bitmap", except the 0 case is
> a special.

We have empty bitmaps elsewhere, as a more or less special case, so this doesn't
look overly concerning.

Jan

