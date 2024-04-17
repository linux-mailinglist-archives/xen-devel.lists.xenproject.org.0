Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B118A845F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 15:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707515.1105505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5H3-0004jF-1N; Wed, 17 Apr 2024 13:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707515.1105505; Wed, 17 Apr 2024 13:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5H2-0004hQ-Up; Wed, 17 Apr 2024 13:24:28 +0000
Received: by outflank-mailman (input) for mailman id 707515;
 Wed, 17 Apr 2024 13:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx5H1-0004fj-EX
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 13:24:27 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf6e754c-fcbd-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 15:24:25 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-415515178ceso35040495e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 06:24:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b00418a386c17bsm2825211wmq.12.2024.04.17.06.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 06:24:24 -0700 (PDT)
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
X-Inumbo-ID: cf6e754c-fcbd-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713360265; x=1713965065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCGtXgJBAgs27J5U13OzW6bg1iBmsa5nq+r6YUcrYdQ=;
        b=Wb7CgwSd16ec1FoJhqzCHAyk9gwsrbn4EmwDe+Lc2rAZ3/Ldl+v+8pPtq8UEuAGjNL
         v+CTGvUBa5Eve2/XDIqXaz8l20dWthCJz3nDrBT4N6JIYX75xwePOOenAYOS10LmWb5k
         JIlu9niqC7KHbDWottGHba9LxHwRaKzrJoUNjWKI4j4mnnaZIIuoa4L2BqqJthihpPg3
         5cvpjLQdpIjN5k3VJuoy0vFNwMsnCN+N3BQxhnrsUU1VO3TQfsnjPkIfym78nF3IqvFc
         UNogFN2BaeaikpZ88RXMuMfqLksksoOQolfHSiCDFDhybhMx3OgoQMy7Bch8WBYQpUHn
         M4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713360265; x=1713965065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCGtXgJBAgs27J5U13OzW6bg1iBmsa5nq+r6YUcrYdQ=;
        b=pMKa9u7zwlwo7R7xIDpCTgqDj+tj8cXqYkEc6EQQq2eNalK6RzavAb40Fs1E0XegO2
         1zSekoWK/NbEdF2OpnisdokaDSEAvJa1Xxu9b+AaG+tz90HM/+njC6QzqvKlftsGBG33
         SpX29UqFWGpszdM+n0QO7GjzeT+RDbaqcEoIJeEdo62XQ4iyEBznxg2JFz/83fSmqL0i
         3EGYvZZZMhZhMhNyitUW9sB69QqisMcrEtyWMlPEWvr/tb06XmbaWyVLvZHXKpgRmbc1
         j8/NWjKbke4Luz0xPc8NG0FuTkgEzURjV574hZCHTn3I98CoBAtHmrQtx3RQbyGuFCmd
         ytDg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFai9MSC8h+iF++x9vr9MfXywJ+PwjK6NQbB5imuSfbBxrMYOIHa5KQWxDa6IGP3hgLbR2WmNS+liZSfoHWhe976x9y0ZhoSviZq71iQ=
X-Gm-Message-State: AOJu0YzDPTSm1NpKkWkMwcVN879Ber6B3AwJehJgThw8DrSxcooOykuP
	FFWcQ9Nh8M0WXSAel0BsZH2dZuvn7beM824zWJNCxWz0pXY+k7VtOikSlvjwsHEMayhO3SK9gCg
	=
X-Google-Smtp-Source: AGHT+IHWQuHl+6FrUX2WKbTl9h9T4BW5CGUo/BE2nymXG89aNKH2v7EC6a//ogNypVLGsGqdHRmRSQ==
X-Received: by 2002:a05:600c:4f0c:b0:418:17e9:c23f with SMTP id l12-20020a05600c4f0c00b0041817e9c23fmr9861066wmq.31.1713360264842;
        Wed, 17 Apr 2024 06:24:24 -0700 (PDT)
Message-ID: <f4864450-0cba-4ff8-9a39-aad792aab026@suse.com>
Date: Wed, 17 Apr 2024 15:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240404212519.16401-1-jason.andryuk@amd.com>
 <20240404212519.16401-3-jason.andryuk@amd.com>
 <70ab0f9d-a451-44a5-8927-4200dbb96a08@suse.com>
 <13d1943e-6341-46de-a356-dc6b92945f3b@amd.com>
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
In-Reply-To: <13d1943e-6341-46de-a356-dc6b92945f3b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2024 18:56, Jason Andryuk wrote:
> On 2024-04-08 03:00, Jan Beulich wrote:
>> On 04.04.2024 23:25, Jason Andryuk wrote:
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -537,6 +537,111 @@ static paddr_t __init find_memory(
>>>       return INVALID_PADDR;
>>>   }
>>>   
>>> +static bool __init check_load_address(
>>> +    const struct domain *d, const struct elf_binary *elf)
>>> +{
>>> +    paddr_t kernel_start = (uintptr_t)elf->dest_base;
>>> +    paddr_t kernel_end = kernel_start + elf->dest_size;
>>> +    unsigned int i;
>>
>> While properly typed here, ...
>>
>>> +static paddr_t __init find_kernel_memory(
>>> +    const struct domain *d, struct elf_binary *elf,
>>> +    const struct elf_dom_parms *parms)
>>> +{
>>> +    paddr_t kernel_size = elf->dest_size;
>>> +    unsigned int align;
>>> +    int i;
>>
>> ... I must have missed when this was changed to plain int. It should have
>> been unsigned int here, too, ...
>>
>>> +    if ( parms->phys_align != UNSET_ADDR32 )
>>> +        align = parms->phys_align;
>>> +    else if ( elf->palign >= PAGE_SIZE )
>>> +        align = elf->palign;
>>> +    else
>>> +        align = MB(2);
>>> +
>>> +    /* Search backwards to find the highest address. */
>>> +    for ( i = d->arch.nr_e820 - 1; i >= 0 ; i-- )
>>
>> ... with this suitably adjusted. However, I'm not going to change this while
>> committing, to avoid screwing up.
> 
> I intentionally changed this.  Looping downwards, a signed int allows 
> writing the check naturally with i >= 0.  I think it's clearer when 
> written this way.

Just to clarify: Is

    for ( i = d->arch.nr_e820; i--; )

any less clear? (While replying I also notice there's a stray blank
in the for() you have, ahead of the 2nd semicolon.)

Jan

