Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534FAF69FC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 08:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031726.1405480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXCzC-0000s1-QB; Thu, 03 Jul 2025 05:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031726.1405480; Thu, 03 Jul 2025 05:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXCzC-0000qC-NO; Thu, 03 Jul 2025 05:59:54 +0000
Received: by outflank-mailman (input) for mailman id 1031726;
 Thu, 03 Jul 2025 05:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXCzB-0000q6-LJ
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 05:59:53 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed58548d-57d2-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 07:59:48 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-453643020bdso66022635e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 22:59:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af540ae36sm16558808b3a.14.2025.07.02.22.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 22:59:47 -0700 (PDT)
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
X-Inumbo-ID: ed58548d-57d2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751522388; x=1752127188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iMLdHIm9GFvYaZLGrM5qxM4SG+ibcYeqPYcDKKW4pUg=;
        b=TM8dPM+nnqvIeBuJz99Y6zgguoYhkXg1+ZQIZjeAODVHqN495N2Q4PaWtMv0kJyswH
         gLJszepppecY+4GJEa9ET7zEHlogQgLUjd/zFAU3Ebv7DcUJzVIfFXoCIb33VEIBGAHO
         9aa6hJRliWVjaeGkt0c3YJE6pgSLCRk1X4fYQxwAL59duFe7ffz3zwl++KoL7PazjlmI
         dLMHJZwKTQXuCJ/JUutY8cgr4MYIetpipaXJxJaImm+Ftc9RE3C1Fn05aV2M6ZEuNLL4
         EC5bFvUGiuKtwd3R0Ds2qT3vLHPXAscS3vm9Ea9tSqXxW2AUmfTZRBDoG5x/2Lo1ozLD
         hmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751522388; x=1752127188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMLdHIm9GFvYaZLGrM5qxM4SG+ibcYeqPYcDKKW4pUg=;
        b=njjvsTGOU8SC+NgVs5NmUDxQyJg56sMvgcQHV5bXeJgAbhHQVtljKwxwZ9tKF8zF9M
         ++DlS5bUfvGv4WlVE01nm/188Ubg+59c7TWNt8Fjh5tgjRnHdMMZLW0dX5ptzi4a9LoU
         54NZNWyWkLEl8RDWtNQ3boA0ypy9Exysf5PxQCdFd075z4QY1MvnYRv3tdfxbRYPlMbh
         Ur/guA1bbUNqZGyo9Xnb9qka9tqdGv84QHZMYuCrJl8WulqUacKUp5yDIyieH3405GEk
         G8okKIVaYweTfgJppY8Ge196Th7tkj4h5cCCiwgFx9uKNvdS+Mj+yfrWe+cNpRRhRoB1
         xysg==
X-Forwarded-Encrypted: i=1; AJvYcCVDwOs+qwYh/VDB76ClFCWiSuGCvf83cXgm6CwZ8w1cmx46J7KAIA4uvrvIag8IJM1QQ8mvg93wtaQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yweo1HKZh5jwyvvyg/Zvyi3AcPpGsI9fY3/Ak45qQcon1am4nL8
	cPDaAYC5THMD7uB6/AzBIlEtZvENX7AoJ2NbpAVOJ+M6bas7gtRA2+hYx7oHsP3xPA==
X-Gm-Gg: ASbGncsJgNZKi+3lGJF3ZtEA6mIg+KLBRvX8hFmASBFzf1wtfKntGA6oDUXH7ltU+W7
	S1o+MCWYqkTUSlH5ieRaagkjubKjqFA3twXXuo/JNpRX8UuNK4J9N4eyoSZ1ddK9Gi3yC+yZZPx
	/NH861JEYuuuo/q4Q7bT5DHiKM8TaKvT7iA4MkZpxkNkZPH7k4kv6B3uUft5iY1WNt+mBY3yf2V
	J6jfGfzAIzfk4ierJ7PlXyGGY4zMbOK5/VEVa4BymUuSXforQ20qX4iSycPip1zuqsRI/EVHGEb
	9Sbr6moWLHCbmlaeXgb4yJpsjRK11XytHRjvB+/WR8nCMqk2dKQP0GIqfivJnEPT/MmvxHFvYoV
	TjYV7tASHnw0XTCaDTvLbVoDHnT3IrQDXtT3m0BZJkxyA5lg=
X-Google-Smtp-Source: AGHT+IGdhb2wNjV55e42fLd6d/yJzNsJOuo4IZKx6TSPaQKdbsZRFYpARAzYtPNG+uwMLvZjmaBX0A==
X-Received: by 2002:a05:6000:4b1a:b0:3a4:fa6a:9189 with SMTP id ffacd0b85a97d-3b1ff9f593fmr4146529f8f.31.1751522387899;
        Wed, 02 Jul 2025 22:59:47 -0700 (PDT)
Message-ID: <21127316-316e-4bd7-97eb-5b1cf644f9cd@suse.com>
Date: Thu, 3 Jul 2025 07:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] xen/riscv: introduce page_set_xenheap_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <186e4a778a6dfab205428dfb4d0c59584a162a9f.1749555949.git.oleksii.kurochko@gmail.com>
 <b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com>
 <be826050-889b-4e4a-a358-5bfa18575533@gmail.com>
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
In-Reply-To: <be826050-889b-4e4a-a358-5bfa18575533@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 17:59, Oleksii Kurochko wrote:
> 
> On 6/30/25 5:48 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> Introduce page_set_xenheap_gfn() helper to encode the GFN associated with
>>> a Xen heap page directly into the type_info field of struct page_info.
>>>
>>> Introduce a GFN field in the type_info of a Xen heap page by reserving 10
>>> bits (sufficient for both Sv32 and Sv39+ modes), and define PGT_gfn_mask
>>> and PGT_gfn_width accordingly.
>> This reads as if you wanted to encode the GFN in 10 bits.
> 
> I will reword it to:
>    Reserve 10 MSB bits to store the usage counter and frame type;
>    use all remaining bits to store the grant table frame GFN.
>    It will be enough as Sv32 uses 22-bit GFNs and Sv{39, 47, 58} uses 44-bit GFNs.
> 
>>
>> What would also help is if you said why you actually need this. x86, after
>> all, gets away without anything like this. (But I understand you're more
>> Arm-like here.)
> 
> I think with the rewording mentioned above it will be clear that it is needed for
> grant tables. But I also can add the following:

I agree it's fine with just the re-wording.

>>> @@ -283,6 +296,19 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>>   
>>>   #define PFN_ORDER(pg) ((pg)->v.free.order)
>>>   
>>> +static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>>> +{
>>> +    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
>>> +    unsigned long x, nx, y = p->u.inuse.type_info;
>>> +
>>> +    ASSERT(is_xen_heap_page(p));
>>> +
>>> +    do {
>>> +        x = y;
>>> +        nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
>>> +    } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>>> +}
>>> +
>>>   extern unsigned char cpu0_boot_stack[];
>>>   
>>>   void setup_initial_pagetables(void);
>> What about the "get" counterpart?
> 
> I haven't added it as it isn't used now and it will lead to compilation error as it will be static inline
> (in a similar way as Arm introduces it).

Why would a static inline (in a header) cause compilation errors?

> As an option this patch could be dropped and introduced with an introduction of grant tables.

That's up to you - you must have had a reason to include it here.

Jan

