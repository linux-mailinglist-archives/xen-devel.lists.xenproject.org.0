Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626DFC64A01
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164008.1491038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL07N-00027U-IK; Mon, 17 Nov 2025 14:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164008.1491038; Mon, 17 Nov 2025 14:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL07N-00025C-CN; Mon, 17 Nov 2025 14:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1164008;
 Mon, 17 Nov 2025 14:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL07M-0001x1-92
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:22:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb12de1a-c3c0-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 15:22:05 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b739b3fc2a0so164511966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:22:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809fasm1099542966b.45.2025.11.17.06.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:22:04 -0800 (PST)
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
X-Inumbo-ID: cb12de1a-c3c0-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763389325; x=1763994125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dAzuB1me9s8/yJONz+mr8IIsDzqIgJYav7GzRN8pW+E=;
        b=SnISq0gUIEOvCnpmskEcM7kSYtuEZYrdxAhweX+7Fw+f1N+BubNVfWXUbADRfH0HKw
         1ZYtCcwxW+Poe2wdu2qvsx7SriAAnDdLc2W/4lJ6cJ2wVFIV3OQi+dMz46xpyYc0Mz/N
         rBOz8HtquifOSneaFIe8e3ygLLj5rU9xF800k5kd0to+inFLW9wKzEtJZzLOs0Va6z7d
         vKh9eA9BoSwur2Nm69FvJQuje1WYl+b6mje77qvtlSO9VHHBN//vDbRPsDgmN0r/QHQe
         /+jSUgtskLA+RP5bcDoG1QpWIS/4IjBNKVOdCw+k9IEZbmAb+X65aZMpYpsE9+oqTCwt
         cHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763389325; x=1763994125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAzuB1me9s8/yJONz+mr8IIsDzqIgJYav7GzRN8pW+E=;
        b=lnruwgWWUPUFRxEB6jRUeVYVGIj/MUPRu6WTPgXXUsL0fFuApwRKmnkLdGTju+/qWS
         5A/6c7jds6JDhzF15G7TWaqMZoBvdTvThpSS9ol33jxTw0JTmZJiVQzN3LzuDmwFCgEN
         zeVk0lBMOfslCkEZ7EBnr/VM5sbMGR8aqNCrktKc9/3YZQdi+qyQ7AY0ySylDkYgOJ8V
         OJ0jUZsop3qfUq14FWZU93UBLgFh6IKe6Bmw9wfNRkK5NRRg87iQeGXN6gB+njHB+Wcd
         l9dd1P+qNQyD3liRxfEwH1kmCWKjFHASdNct7dSo5W4Hf8cem0DodMxCjEI3OvECJkvM
         eBSg==
X-Forwarded-Encrypted: i=1; AJvYcCUvqVihZWAMr5aCrp6nMiLHoXI5kM/GL4Ee2B1uv/BUdgDF6R2IQ7Eo8qUXG0Y7HpYoS9oMmzIScr0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx23y4f2RgU7/71VfF8Thmk5vjes2KqSJUIYwIqJvfbWlnWuTm1
	gnocobrdZdfCvGlMkCbLuY5PBsp2NCmTgkWgrfH77Z19YKf5RSEQE+S8oMCcmxtLLw==
X-Gm-Gg: ASbGncuCtqLrK/0u46dGu+9ZyDQiLYrruwpFbNtAtylJ/6TFUn3eILyyhymlkkiVymZ
	WBpAEBw76XN1V2Q7OiQ2h9OpfVQS+rfmevusTBOKxSbynrI+kXq6yDEJ7ZdR8PzO9xtHvagmNVW
	ss+SaSZorFJWR+GifmY3MmzOgrQ1qsJ4oBhUmX1E2GqqM1o6iUHKd1g3HJ3Xdo0pWyPzX5NIYJ0
	xBYTzEETmHlaADXLWWhJ2SGqkA83fn80RrR3HXrH+Wvz1Qk0GaT5Fyja544xJoBJSGbYCKl++3D
	cvzqFcvOOdii5ufx5nIT0hZusmVGe02p1/yfW4EGM8eblETIncClD883i4FsXiByoH1qWiL1J5j
	qQd4qBiL+SkoVFxRpm3aVYkuaz/4MN3QaX3qLJzgQ9mbhAHON0Y7naDZwSViv7hNuxUf+7sARtk
	mt/eoXC/P+NyztzOKvz1K5APOhNc1OckeSjHU/pBjRQj8DEOeDooHXM8CSQmR6UReK
X-Google-Smtp-Source: AGHT+IGeH+hvvbVpv4eY6v5SSK2s7B5YjL5gpjsd7qz2+SAokLHPA+uriLTxJQv8GK2ciqO2r4rQAg==
X-Received: by 2002:a17:907:a4c:b0:b72:d001:7653 with SMTP id a640c23a62f3a-b736780c141mr1344803566b.19.1763389325135;
        Mon, 17 Nov 2025 06:22:05 -0800 (PST)
Message-ID: <3ca275a1-0006-4378-bf1a-2ff5541c4036@suse.com>
Date: Mon, 17 Nov 2025 15:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 11/18] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <24928a25f63f81ee72b78830306881b2c4c5a1e4.1760974017.git.oleksii.kurochko@gmail.com>
 <acf32e9d-4c07-45dd-baac-29e6d93cff56@suse.com>
 <6eb7b19e-df55-4706-9da2-67158640aa08@gmail.com>
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
In-Reply-To: <6eb7b19e-df55-4706-9da2-67158640aa08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 12:36, Oleksii Kurochko wrote:
> On 11/10/25 4:29 PM, Jan Beulich wrote:
>> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -17,6 +17,8 @@
>>>   #include <asm/riscv_encoding.h>
>>>   #include <asm/vmid.h>
>>>   
>>> +#define P2M_SUPPORTED_LEVEL_MAPPING 2
>> I fear without a comment it's left unclear what this is / represents.
> 
> Probably just renaming it to|P2M_MAX_SUPPORTED_LEVEL_MAPPING| would make it clearer,
> wouldn’t it?
> Otherwise, I can add the following comment:
> /*
>   * At the moment, only 4K, 2M, and 1G mappings are supported for G-stage
>   * translation. Therefore, the maximum supported page-table level is 2,
>   * which corresponds to 1G mappings.
>   */

Both the name change and the comment, if you ask me.

>>> @@ -403,11 +415,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>>       return P2M_TABLE_MAP_NONE;
>>>   }
>>>   
>>> +static void p2m_put_foreign_page(struct page_info *pg)
>>> +{
>>> +    /*
>>> +     * It’s safe to call put_page() here because arch_flush_tlb_mask()
>>> +     * will be invoked if the page is reallocated, which will trigger a
>>> +     * flush of the guest TLBs.
>>> +     */
>>> +    put_page(pg);
>>> +}
>>> +
>>> +/* Put any references on the single 4K page referenced by mfn. */
>> To me this and ...
>>
>>> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
>>> +{
>>> +    /* TODO: Handle other p2m types */
>>> +
>>> +    if ( p2m_is_foreign(type) )
>>> +    {
>>> +        ASSERT(mfn_valid(mfn));
>>> +        p2m_put_foreign_page(mfn_to_page(mfn));
>>> +    }
>>> +}
>>> +
>>> +/* Put any references on the superpage referenced by mfn. */
>> ... to a lesser degree this comment are potentially misleading. Down here at
>> least there is something plural-ish (the 4k pages that the 2M one consists
>> of), but especially for the single page case above "any" could easily mean
>> "anything that's still outstanding, anywhere". I'm also not quite sure "on"
>> is really what you mean (I'm not a native speaker, so my gut feeling may be
>> wrong here).
> 
> Then I could suggest the following instead:
>    /* Put the reference associated with the 4K page identified by mfn. */
> and
>   /* Put the references associated with the superpage identified by mfn. */
> 
> I think the comments could be omitted, since the function names already make
> this clear.

Okay with me.

Jan

