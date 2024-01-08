Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02749827589
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663635.1033710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsgE-0001C2-LY; Mon, 08 Jan 2024 16:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663635.1033710; Mon, 08 Jan 2024 16:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsgE-00018q-Iq; Mon, 08 Jan 2024 16:40:50 +0000
Received: by outflank-mailman (input) for mailman id 663635;
 Mon, 08 Jan 2024 16:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMsgD-00018i-S5
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:40:49 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ace12d98-ae44-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 17:40:47 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cd053d5683so22874731fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 08:40:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z3-20020a02cea3000000b0046e13607c41sm54167jaq.1.2024.01.08.08.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 08:40:46 -0800 (PST)
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
X-Inumbo-ID: ace12d98-ae44-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704732047; x=1705336847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7t3BxQOYKY6nG92p/jCI9MkeTzAq5t66aeT7ru3qPk=;
        b=V8+hiX0ajSIGdRbGIaBJf+r2aM35QdfqFuSiKjzN4pdYzpyuxq53sZDeHNd99634Wp
         TgWgnTVluM3BfcBmBUDhHg5vh/M89lovF9uJlmxZLH+uWEFNJKh/9nf4A29gSxJOcstQ
         8QxIuHAU/X2X33mzYeEW/d/M6Wo/q7mKNSMImecegv06/Sy1pwOcbLeXbxnNYMwgZZhL
         e4hH5LaEyQYEYOUx5ZP4pN0sIYvoh9wNE2Xfm2Mqmg+k+qvHO2exFP/He/S3/aEovrmK
         NY4sIIcfb5r5CLrwtkJReb/3MBoqXbxCUO2s8hpDKGj24CQiFBYlyoqM+7JuAnbeELhF
         tz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704732047; x=1705336847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7t3BxQOYKY6nG92p/jCI9MkeTzAq5t66aeT7ru3qPk=;
        b=vjgJLepTEBz8ceFJnYdtsL4Tf25PoRriRo7TR5FWwGS15vC8cVDn8T1v2VK5iJQC8l
         hHMoWdBi0PPU4SRjAL5a+KUqpc8b0L3YwGPrZSb6T58REtGzxClHY5wpnYKt9i3zuZC2
         uAZOjhBFkksYOqRNroLRyMxLlUwmBUwcWY7+XnMP8DGx7BxZgEj3NgmresLfl58q/SHH
         WluAul2E2MC2aStaVE7PmBajwzajDQ20ci4hd0tPRMOSKpEm3JOeSHgNNZXUM+fvOk4z
         QHzLAZhEtQel6u/BiBq71W6Ps3wloBGrR2kbOaPvnjGMxgYU1WclMEoMV4NTYqwep5Je
         c7Vg==
X-Gm-Message-State: AOJu0Yyf/ucyWnvlGOki2vWHPrlpCXk5d0f3MWTlpiPkQgkKNka5TIqB
	G5vix449rAC5H/2GW+JU60+8EIm/afY6
X-Google-Smtp-Source: AGHT+IGksUYC2a1ufB8Ed0iHXTu7y/6n4D7GlqqCSt046O301fstg3oIplfAeG/MEFF0Rnks/GVJLQ==
X-Received: by 2002:a05:651c:1044:b0:2cd:2c8d:b48d with SMTP id x4-20020a05651c104400b002cd2c8db48dmr1729427ljm.63.1704732047232;
        Mon, 08 Jan 2024 08:40:47 -0800 (PST)
Message-ID: <08b7535e-da40-4578-b865-9b350ace379c@suse.com>
Date: Mon, 8 Jan 2024 17:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, Julien Grall <julien@xen.org>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech>
 <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org>
 <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
 <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org>
 <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
 <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org>
 <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com>
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
In-Reply-To: <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.01.2024 17:31, Carlo Nonato wrote:
> On Mon, Jan 8, 2024 at 4:32 PM Julien Grall <julien@xen.org> wrote:
>> On 08/01/2024 15:18, Carlo Nonato wrote:
>>>> No. I am saying that that we should not be able to allow changing the
>>>> colors after the memory has been allocated. To give an example, your
>>>> current code would allow:
>>>>
>>>>     1) Setup the P2M pools or allocate RAM
>>>>     2) Set the color
>>>>
>>>> This would render the coloring configuration moot.
>>>>
>>>> Whether we want to allow changing the coloring before hand is a
>>>> different question and as I wrote earlier on, I don't mind if you want
>>>> to forbid that.
>>>
>>> At the moment I'm relying on the toolstack in the sense that I know that it
>>> will set colors right after domain creation and before memory allocation.
>>> Calling alloc_domheap_pages() without a coloring configuration makes Xen
>>> crash, so it's mandatory to have the configuration done before any allocation.
>>> I know that we shouldn't rely on the toolstack this much, but I didn't
>>> find a better way. Given this assumption, looking for an already existing
>>> color configuration of a domain is sufficient to avoid what you are saying.
>>>
>>> Is it possible to enforce such a constraint with domctl? > I mean to be sure that this domctl will be called at a precise time.
>>
>> Yes. You can...
>>
>>>
>>> Thanks.
>>>
>>>>> I don't know what to check that.
>>>>
>>>> You can check the size of the P2M pool (d->arch.paging.p2m_total_pages)
>>>> is still 0. I think for RAM, you can check d->tot_pages == 0.
>>
>> ... reject the call if either of the two fields are not zero.
> 
> What I'm saying is that Xen would crash before even reaching this point if no
> colors were provided. Let's say that the toolstack or whatever hypercall user
> isn't calling this domctl at all (or not at the right time), then the domain
> colored allocator would always return null pages since there are no colors.
> We would have a crash and your if (or mine) would be useless.

Why is it that you can't simply allocated arbitrary memory if coloring
information wasn't set up front? Aiui that'll be required anyway, as
there shouldn't be a restriction that all domains have to use coloring.

Jan

