Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45CCCEB4D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 08:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190451.1510898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWUWC-0005xI-Lm; Fri, 19 Dec 2025 07:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190451.1510898; Fri, 19 Dec 2025 07:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWUWC-0005vc-J6; Fri, 19 Dec 2025 07:03:16 +0000
Received: by outflank-mailman (input) for mailman id 1190451;
 Fri, 19 Dec 2025 07:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWUWB-0005vW-FJ
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 07:03:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9410b97-dca8-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 08:03:14 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42e2e628f8aso563536f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 23:03:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea82fddsm3233965f8f.25.2025.12.18.23.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 23:03:12 -0800 (PST)
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
X-Inumbo-ID: c9410b97-dca8-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766127793; x=1766732593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=58ctbPzrKroSpZLUeCsfkwPHLo+VKD7C2xZ5LDa5gGk=;
        b=K4+OR0ojatqp2Wh8sA+IHU2n/6napRNCq/hbn6oxyEmE029sAFrOD0WeHEMhdWIll/
         gnfJ8WdGE3IyOhToj7QgNsQDBkvFgnSScI5ympMLoTByoH20f2B9g03daZuK8F9wj03U
         t42q22PH4/UkCWuOBXFvhahUakL8IZLhrUHW2vYIwiI9w938dRXY5YboRj9o0UccXBUR
         qXEZWI1CKlKYERvllzvjP/+BrWi2b3kEuCgZQOBMGtY/kJM7W/V/HNPB+5CGOHA1ngSG
         a0PcI576R0ocYhPRX5OwLTKBuIbCID0l31k9iRX3b5VD8tmyZT27ToosvMZwg1opBM0N
         5Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127793; x=1766732593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58ctbPzrKroSpZLUeCsfkwPHLo+VKD7C2xZ5LDa5gGk=;
        b=MS1oPWBrOkUBcHn06h2LPj4kNEivWWdjRzMp4uhx5gq0X9O5KjnAnbR9g954fc+7/z
         769ORUZQL7B8Z/pE1NSXs5n9T+NN2AVqJHtk1Yqp/GpAwaIkx3UAldP0nTi0pg8dkLyL
         xmXkV8ndb1nUQWboErPTDLadVTio6k26OW+v5fT9bEkC5WNCP0VNOy6HeM1fpAJcr4y6
         xU8LtS28jVJhRlAQKxleKUoQx0x5URAIVzUEWs+4zgY+WlpAOUglMWTGu12B5MKvNDlT
         MNlTN2t5J5BKnURUFmrnvyXzgeJyn/qktBKfpAwRaKCU/0OwPl4L5w/SVmeL0JS+1d9f
         uZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhGhYZkkILF3AVaWYXswgJTXXrRKKmaOqLm1G+aVJA0gSL9lFdTm+Jm16JZQA+vKgv7Hx8SovCit4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmH63e+c6IbHUW0iE+dR7iDlwCHm4Jkp+Ad/N9zeHFw5eGpp3d
	vmV5cdE29sasVGMhiqkhplqG3q8mZS6u+/6YpN1EzqptTCOyBOhxE8La6hzS7XoRWA==
X-Gm-Gg: AY/fxX7T/EaiGxBT6Op5lKbZmljkfaYZhxyA/piJFdhdheyGhUbvpAEO0sOJ3BDpsW3
	/7m0XwmL1LqhVbuTY2pvJj5MUaQ6xaJNEzXK2UbnhTBY1uyYJMiHTOcspjYMj9iIuxQkJ6D9tEC
	+avA3ur0S656bOu/vVKH7kQACkiqO3XUyZkB8zlIooN+x/NXSSM4PIamgU71IQ9I4W+0curN8xI
	2JWzsjz41Z2NFryaOi3iSonGWbzs0kxjMO/ZqXT2WOBQK7OnsW1raekIZQFxQm6ynysDjEUnll6
	BqOrKjKVdahxrIpW/1+rX6MVHgLGBnfZRcqz6EFMUFg5hUxb+HZ62z+2IxJt/Za25YfoAiB9lHT
	P+8W3lfsLadDI1KjTrq832PRN1y+K/i8D1PyK3Xahx5LWpTAWF/lp3ZdP4vbAnusRukYEO+/ht3
	/KwlghGbvuYBn9EVKxEPUDJdhk8oRp0GP+5n1IsEUI8jYyZJI3oPOyGAKPdNAayQ2j8qg5pVv0s
	k0=
X-Google-Smtp-Source: AGHT+IGIgOLZ6uvymKJ+sbXwMINmce+vUdlMD1CUwtH00cPg/fX7r4dcW52FHunqmzqp3AinRcDd8A==
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr1944893f8f.41.1766127793263;
        Thu, 18 Dec 2025 23:03:13 -0800 (PST)
Message-ID: <3c94579a-f65e-40f8-a6e3-9fee9ddc56e3@suse.com>
Date: Fri, 19 Dec 2025 08:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/19] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <4cef2922ff0fa82eb70e50c737cb00ef27ef13a3.1765879052.git.oleksii.kurochko@gmail.com>
 <9d4d89f1-81c1-4532-8646-c736ac56e7f3@suse.com>
 <4eec691b-6c81-4c9e-a9c1-00c81e51c691@gmail.com>
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
In-Reply-To: <4eec691b-6c81-4c9e-a9c1-00c81e51c691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 18:25, Oleksii Kurochko wrote:
> On 12/18/25 1:55 PM, Jan Beulich wrote:
>> On 16.12.2025 17:55, Oleksii Kurochko wrote:
>>> +/*
>>> + * Get the details of a given gfn.
>>> + *
>>> + * If the entry is present, the associated MFN, the p2m type of the mapping,
>>> + * and the page order of the mapping in the page table (i.e., it could be a
>>> + * superpage) will be returned.
>>> + *
>>> + * If the entry is not present, INVALID_MFN will be returned, page_order will
>>> + * be set according to the order of the invalid range, and the type will be
>>> + * p2m_invalid.
>>> + */
>>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>>> +                           p2m_type_t *t,
>>> +                           unsigned int *page_order)
>>> +{
>>> +    unsigned int level = 0;
>>> +    pte_t entry, *table;
>>> +    int rc;
>>> +    mfn_t mfn = INVALID_MFN;
>>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>>> +
>>> +    ASSERT(p2m_is_locked(p2m));
>>> +
>>> +    *t = p2m_invalid;
>>> +
>>> +    if ( gfn_x(gfn) > (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1) )
>>> +        return mfn;
>> Since on all other error paths you set *page_order (as long as the pointer
>> is non-NULL), shouldn't you do so here as well (to the order corresponding
>> to the full [2nd-level] address space)?
> 
> It makes sense. I am thinking if something like would be fine:
>    @@ -1123,7 +1117,7 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>                                p2m_type_t *t,
>                                unsigned int *page_order)
>     {
>    -    unsigned int level = 0;
>    +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>         pte_t entry, *table;
>         int rc;
>         mfn_t mfn = INVALID_MFN;
>    @@ -1134,7 +1128,13 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>         *t = p2m_invalid;
>     
>         if ( gfn_x(gfn) > (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1) )
>    +    {
>    +        if ( page_order )
>    +            *page_order =
>    +                P2M_LEVEL_ORDER(level + 1) + P2M_ROOT_EXTRA_BITS(p2m, level);
>    +
>             return mfn;
>    +    }
>     
>         if ( check_outside_boundary(p2m, gfn, p2m->lowest_mapped_gfn, true,
>                                     &level) )
>    @@ -1152,7 +1152,6 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>         if ( !table )
>         {
>             ASSERT_UNREACHABLE();
>    -        level = P2M_ROOT_LEVEL(p2m);
>             goto out;
>         }
> 
> Or it isn't the best one option to define page_order using "non-existing" level?

Well, ...

>> Furthermore, is PADDR_BITS really the right basis? Don't things rather depend
>> on the number of levels the 2nd-level page tables have for the given guest?
> 
> I think you are right, it depends on the number of levels the 2nd-level page tables
> have for the given guest.

... the more suitable thing here is also going to be applicable to the order
that you pass back. I.e. whatever the bounds check is going to be based on
can also be used to produce the appropriate order.

Jan

