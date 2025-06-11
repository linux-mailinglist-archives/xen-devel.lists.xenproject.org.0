Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1457AD4E75
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 10:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011360.1389735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGsV-0002yQ-0u; Wed, 11 Jun 2025 08:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011360.1389735; Wed, 11 Jun 2025 08:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGsU-0002vt-Ts; Wed, 11 Jun 2025 08:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1011360;
 Wed, 11 Jun 2025 08:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPGsT-0002vn-6j
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 08:32:09 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eb90bc8-469e-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 10:32:06 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so40803825e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 01:32:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fc7f4sm82694005ad.109.2025.06.11.01.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 01:32:04 -0700 (PDT)
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
X-Inumbo-ID: 8eb90bc8-469e-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749630726; x=1750235526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ht4BM9M3IWnU0USmV6YI+sH1g0X0CQNgkr2XSV0+iEU=;
        b=ZXWheuis9GThvJUqShBDGNYp6ZcsbF9MKl0Y88yuMLM8GkEj0kC07+QMfUeCG8tHfs
         egR9QTF62UKVf7L8iQ/zXzmuMjfRVr9bF1pjFwMVUjqLxlvZx5QJKV8sLI5zR0OUmGrW
         W0EKrZD1zHv1lJ2t/KbW6HZpBjDijnuoAwx3839xGbd8vUY1aeHM1+HeSH2sJWPNPqPE
         mO6nThldJQQUIvq8ykZJjrJ2kDhedIz0LnYggx/aUyurgQvOgEXy81BQ/5J+dzDb8YCo
         RlPiX6D0rhICjOz1wW0OaAtcZM5l3bgexVNjM0RLLbbb3BwSxOuH0PN7Z1sZpGpftqr8
         wgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630726; x=1750235526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht4BM9M3IWnU0USmV6YI+sH1g0X0CQNgkr2XSV0+iEU=;
        b=pj5cWOcTfRu+n9FjWrGdK7No7Oz5Ea/CqTViUROnLZSuerZeSYZmTvlkFOE0U9MDCL
         QYvYG+hBWGKrg2yy7Cit+5lGsZCLxjc2uNDeRb1Cohcn3uq2siQGu/+n+X33U3bczE4D
         S5nYNrAg2Yup4UlRsr9zT0ObN/H8Mvkn3KjI5ANMKcI90MRr+6J8slDgmNW2hJiTWo73
         hGjnJOuRinEMdAFxjoxDrC/OB6A4pKmXD/C800jjn4j1+aGgd2hJuHua8nrfdcA57dop
         LYguAWMtX+yZs71LzE78f3iNbSzlsJe5BMo+jT0yX/aWj4Ix93fDvcoORsxTrZoTPX0e
         bQBw==
X-Forwarded-Encrypted: i=1; AJvYcCULSUTt418ZC6OLwNSoGtSJhMzwrZQAjN+SWjAT+ZZezwD/ST8kbVNH97dQQnjXx2j+xM9j3lG40Sw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4iTz/AzNh6/pEqn2h/RvtdDSqzeW9Jw4ECNZlmnY/n8aaI/Kz
	ouKWDCu02i7TQuoep7+WBG3eVAHH8pB/3db8FhuZ6rsrbKA4dtRG6lMzo2hk4DS66g==
X-Gm-Gg: ASbGnctp/WYTGCgU7LYbxBpkubIF1bhUsjQOsmp9aTcNGE6hye3j4L5aXuExmfjrfqt
	NqGSgB7rvoN11vOS36huN6ue2cMrCTXugW3gpVvelappUNeKkAq91+tDtuUcqNwfsgSN+7fjz3+
	BB3pjkRAGDGj0/QCPCU80qWeNBNeFq81pju9p59XRjlRz9VDo2/ij9wGK0tjsKJbsq221FqWlXm
	VliCufUKhkg3Ux0s3gIj0R2hE+wobnYFNLFPHQ11OxYG/GiJVy5dyhKr1dRxIAJQJydOdboi/6H
	HTRsCqfgynnCRdAFyP9Ijjk4YKj797b4Vd+XTASCMx6laahbwQNmiLvMUvwvHSXXkOLGcLOGoid
	r4EV1aZWJr1M9DZkI0155TFqbTYBPIpTU/zYtwDUXwln1cOc=
X-Google-Smtp-Source: AGHT+IHjwyaMDCgOc5iDKXEb2k9bZCHDlAUNHmS5L6diwomhoTrdF4jWyO8zW5mot9sebdvoAVz+DA==
X-Received: by 2002:a05:6000:310d:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a558a325cdmr1483645f8f.29.1749630725616;
        Wed, 11 Jun 2025 01:32:05 -0700 (PDT)
Message-ID: <a3853a8e-02f1-48d1-ab50-d1b51ebd0dc8@suse.com>
Date: Wed, 11 Jun 2025 10:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] xen/riscv: dt_processor_hartid() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <751343d295c0fa6a9a7d8f2265ece3faecd44b64.1749121437.git.oleksii.kurochko@gmail.com>
 <6fe24545-1f76-4f3f-84bb-b0f8e225ac7b@suse.com>
 <e1b7b5ef-e20e-430e-a4d1-6da912c31f6f@gmail.com>
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
In-Reply-To: <e1b7b5ef-e20e-430e-a4d1-6da912c31f6f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2025 10:26, Oleksii Kurochko wrote:
> 
> On 6/10/25 4:08 PM, Jan Beulich wrote:
>> On 05.06.2025 17:58, Oleksii Kurochko wrote:
>>> @@ -14,3 +17,77 @@ void __init smp_prepare_boot_cpu(void)
>>>       cpumask_set_cpu(0, &cpu_possible_map);
>>>       cpumask_set_cpu(0, &cpu_online_map);
>>>   }
>>> +
>>> +/**
>>> + * dt_get_hartid - Get the hartid from a CPU device node
>>> + *
>>> + * @cpun: CPU number(logical index) for which device node is required
>>> + *
>>> + * Return: The hartid for the CPU node or ~0UL if not found.
>>> + */
>>> +static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
>>> +{
>>> +    const __be32 *cell;
>>> +    unsigned int ac;
>>> +    uint32_t len;
>>> +    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
>>> +
>>> +    ac = dt_n_addr_cells(cpun);
>>> +    cell = dt_get_property(cpun, "reg", &len);
>>> +
>>> +    if (ac > max_cells) {
>> Besides the (double) style issue, why's this needed? Can't you simply ...
>>
>>> +        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
>>> +               max_cells);
>>> +        return ~0UL;
>>> +    }
>>> +
>>> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
>> ... write the last part here in a way that there can't be overflow?
>> ac > len / sizeof(*cell) that is? (Remaining question then is what to
>> do when len isn't evenly divisible by sizeof(*cell).)
> 
> reg property should be always evenly divisible by sizeof(*cell) according to device
> tree binding:
>    The reg property describes the address of the device’s resources within 
> the address space defined by its parent bus. Most commonly this means 
> the offsets and lengths of memory-mapped IO register blocks, but may 
> have a different meaning on some bus types. Addresses in the address 
> space defined by the root node are CPU real addresses.
>    
>    The value is a <prop-encoded-array>, composed of an arbitrary number of 
> pairs of address and length, <address length>. The number of <u32> cells 
> required to specify the address and length are bus-specific and are 
> specified by the #address-cells and #size-cells properties in the parent 
> of the device node. If the parent node specifies a value of 0 for 
> #size-cells, the length field in the value of reg shall be omitted. So 
> it is guaranteed by DTC compiler and it would be enough to check 
> overflow in suggested by you way: ac > len / sizeof(*cell)
> But considering what you noticed below ...
> 
>>
>>> +        return ~0UL;
>>> +
>>> +    return dt_read_number(cell, ac);
>> What meaning does this have for ac > 2? (As per your checking above
>> it can be up to UINT32_MAX / 4.)
> 
> ... It will be an issue for dt_read_number() which could deal only with uint64_t what means
> we can't have ac > 2. (UINT32_MAX / 4 it is a theoretical maximum IIUC)
> 
> Thereby we could do in the following way:
> @@ -30,19 +30,18 @@ static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
>       const __be32 *cell;
>       unsigned int ac;
>       uint32_t len;
> -    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
>   
>       ac = dt_n_addr_cells(cpun);
>       cell = dt_get_property(cpun, "reg", &len);
>   
> -    if (ac > max_cells) {
> -        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
> -               max_cells);
> +    if ( !cell || !ac || (ac > len / sizeof(*cell)) )
>           return ~0UL;
> -    }
>   
> -    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
> -        return ~0UL;
> +    /*
> +     * If ac > 2, the result may be truncated or meaningless unless
> +     * dt_read_number() supports wider integers.
> +     */
> +    BUG_ON(ac > 2);
>   
>       return dt_read_number(cell, ac);
>   }
> 
> I am not sure that BUG_ON() should be in dt_get_hartid(). Probably it would be better move it
> to dt_read_number() as if one day support for RV128 will be needed I assume that it will be
> needed to change a prototype of dt_read_number() to work with address-cells = 3.
> What do you think? Could I go with the suggested above changes or it would be better to move
> BUG_ON() to dt_read_number()?

Don't know; the DT maintainers would have to judge. I don't, however, think it should
be BUG_ON() - as said several times before, that's a check suitable to cover for
possible mistakes in Xen code. Here however you're trying to cover for a flaw in DT.

Jan

