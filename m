Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02663ACE0EB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005640.1385054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpgg-0005sc-Cg; Wed, 04 Jun 2025 15:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005640.1385054; Wed, 04 Jun 2025 15:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpgg-0005qY-9V; Wed, 04 Jun 2025 15:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1005640;
 Wed, 04 Jun 2025 15:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMpgf-0005pm-BJ
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:05:53 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 683ed0ec-4155-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 17:05:52 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4508287895dso7429955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:05:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe963b3sm11268821b3a.34.2025.06.04.08.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 08:05:51 -0700 (PDT)
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
X-Inumbo-ID: 683ed0ec-4155-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749049552; x=1749654352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sqA7dL44psqc11Le0tudCJdv3a89frzD8q/8A8clZrU=;
        b=CzFDtsSjlsL3XoJnO0lVZR+BGwIcr4x2NLUohIpzdkoB3o8EazQUQkwpbOtMJ0c5vm
         2QGL6CI2tuayBpbcSf2DZJbwsX1+GvzC904mp+134TjWFw5YCCdORbkB6DAbZJNIVb+V
         NKsyYVhuMxPIfTIKKwhnwrtmUg3WxVccIPuSvGWYyh0Klo/Zw8A9n60bl3k9A17Ph4Od
         uNA7G0f5dab9KeY/mlUA8tWwQUfyUxxshZL9/rmAv7O1r2Ae7/iVe7A4a3rcmPHsDFOl
         owl5OKcrbPzfb6NTTKdNvDeqOltLOzOdvjQ7U5cGmah9X18q3jWFhku+Uw0YCPnP+qfH
         YGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049552; x=1749654352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqA7dL44psqc11Le0tudCJdv3a89frzD8q/8A8clZrU=;
        b=nWs/8AaMC0WT7Gpocj8xby4c136xm3vddbb0cVV4m5AwZJk8oojMVzShEgmzUXzljw
         UPrHaJuHxQfYmDIeN9+ahHDGqPbywgnH2odlt0zYpWGRLrhLXTFii2D8QP9L620QPoTk
         Z6/SEFKCn96EuEFq6BYaMQ19LhHN16xvYMcLGfmH3+69/MS+8SihT2TD6srJHsqMfLHS
         uQl3CSQ8IqVnJBvO5uk54YjoS2aLKLx0nK8scdUmXEkNuyl+4bsz3jQfOAtF8GGNFsdb
         aQ2hrxA/zuW6Ceo+6Q+KPYBPgwqGcGCiN2mwhbQqsgUKRMRCV4gFgE7VygEedXpb1L7q
         2M+g==
X-Forwarded-Encrypted: i=1; AJvYcCW2gc52DElizr5IToJXn2okOcVVXCr9CTfr7V8bq7Z806ljDKBQ7Y7bGruxyD0sgMcndhsJM4O1LSs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhXlACycw6OUHCsF+fNqHvbQvcYSlq/RBKhusNba/VbQaw8yNQ
	C8cPATjHx8fNqEZXZTk3p991SD4aL0fuPi6H+ebXaAgG5LJXU9DAEvfZ/gW5FUL1rw==
X-Gm-Gg: ASbGncv1b0s7CCSvYdG9vpPCn7fC8FKE3Ca6lkIbxlbNCtfizBo5Xpehf9ofwzjhOJ3
	0c5MWiR0KM5/sg8+1MWnc1aM64IyndY6OStgBhr8kNhTHipSREc9c0mP7ZQWJzotLedVFMhgnhy
	wKIpqNZvqRhcOR9ywqvSbivPJxTfbtgK9eKvT45dN4OEvZCsyOVBpp5GLgyT+2XvBngmRuqFA1a
	mhNHTelLO4grFqgxxHILC3qlMRS/AlRrjt6DDYi/zSDe5p6aVQs0drudB1Uc6EDsT6Z045jET+E
	CrZQP/+a4stes9wiT5t/KGUf/UrOn/KTS2zNgci4ny+H+SpcBxtkDKuD4vOhEExR3vnbqHBlAMx
	81SXhDeYiJbRn8o7nTP8V8Zhk2+giwUz5bVNaL+8zh1VPnZ8=
X-Google-Smtp-Source: AGHT+IEKRVUNPcdIjsD4lH54+md1/CJofdOdf9qOxBOrrx+usMrEpQYwlhyErmeZT2mR011yVXZGzg==
X-Received: by 2002:a05:6000:2903:b0:3a4:dc3b:5a3b with SMTP id ffacd0b85a97d-3a51417b09bmr5913737f8f.10.1749049551914;
        Wed, 04 Jun 2025 08:05:51 -0700 (PDT)
Message-ID: <85d6f812-784a-4959-a1e6-589ebac8887c@suse.com>
Date: Wed, 4 Jun 2025 17:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
 <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>
 <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>
 <84c9f65a-b278-4be4-b053-5bfa410f9a97@gmail.com>
 <9ab65452-497c-47b5-af18-92a7b2a86d9e@suse.com>
 <aa1e4b21-beae-4b60-8a24-b6227cb8027e@gmail.com>
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
In-Reply-To: <aa1e4b21-beae-4b60-8a24-b6227cb8027e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2025 15:42, Oleksii Kurochko wrote:
> 
> On 6/2/25 12:22 PM, Jan Beulich wrote:
>> On 27.05.2025 13:30, Oleksii Kurochko wrote:
>>> On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
>>>>>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>>>>>> +                               &imsic_cfg.guest_index_bits) )
>>>>>> +        imsic_cfg.guest_index_bits = 0;
>>>>>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>>>>>> +    if ( tmp < imsic_cfg.guest_index_bits )
>>>>>> +    {
>>>>>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>>>>>> +               dt_node_name(node));
>>>>>> +        rc = -ENOENT;
>>>>>> +        goto cleanup;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Find number of HART index bits */
>>>>>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>>>> +                               &imsic_cfg.hart_index_bits) )
>>>>>> +    {
>>>>>> +        /* Assume default value */
>>>>>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>>>>>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>>> +            imsic_cfg.hart_index_bits++;
>>>>> Since fls() returns a 1-based bit number, isn't it rather that in the
>>>>> exact-power-of-2 case you'd need to subtract 1?
>>>> Agree, in this case, -1 should be taken into account.
>>> Hmm, it seems like in case of fls() returns a 1-based bit number there
>>> is not need for the check:
>>>    (2) if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>
>>> We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
>>> checking *nr_parent_irqs is power-of-two or not, and then just leave the
>>> check (2).
>>> And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
>>> I amn't mistaken something. And if I'm not mistaken, then probably it make
>>> sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
>>> case is so special.
>>>
>>> Does it make sense?
>> Can't easily tell; I'd like to see the resulting code instead of the textual
>> description.
> 
> Here is the code:
>      /* Find number of HART index bits */
>      if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>                                 &imsic_cfg.hart_index_bits) )
>      {
>          /* Assume default value */
>          imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) +
>                                      (*nr_parent_irqs == 1);
>      }
> 
> It seems like it covers all the cases.

*nr_parent_irqs		imsic_cfg.hart_index_bits
	 1			1 (0 + 1)
	 2			1
	 3			2
	 4			2
	 5			3
	 6			3

IOW why the special casing of *nr_parent_irqs == 1?

Jan

