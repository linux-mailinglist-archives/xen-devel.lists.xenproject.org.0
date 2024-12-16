Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599759F3031
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:12:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857935.1270145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9x9-0000Hw-MY; Mon, 16 Dec 2024 12:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857935.1270145; Mon, 16 Dec 2024 12:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9x9-0000FD-Ip; Mon, 16 Dec 2024 12:11:59 +0000
Received: by outflank-mailman (input) for mailman id 857935;
 Mon, 16 Dec 2024 12:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN9x8-0000Dw-Ik
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:11:58 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f162d51f-bba6-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:11:56 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so3150169f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 04:11:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8012029sm7942524f8f.12.2024.12.16.04.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 04:11:55 -0800 (PST)
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
X-Inumbo-ID: f162d51f-bba6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734351115; x=1734955915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk1JxjITef4yyd7NZvmgldkO/CBQtbZWwymd3Qndhlc=;
        b=X2QNHOoL4bT9rXfaXtSXCFDu0FR5VU+jwKkb1kNTeEbc86sJ1JuteAup96umFf9zxh
         wjGQk+EfdbezGjexhxWiFutYA1fc5d8pYhwE1nbfSVU8ogkCwzIJEztdd++ivALgcmVe
         zsVtnLKok8XT0T4xvM2e01GvOh6MGWz+57qGHYN8uxWQ94LAJ/vpbYNnT5IF1o64BflW
         pvFj2t/ipqlsnnApcq/YH20JTR0OkQy+Lxb5aSvHjYafQAAvYSrTGxM0rHkUZ/c3FCE8
         Mz2XxJYfwK/St3yV/q5dDClCLQXwNZg1Mv3zgZLNeZ5nSDAjVewTprJQ11YMN1nab3Cg
         2mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734351116; x=1734955916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk1JxjITef4yyd7NZvmgldkO/CBQtbZWwymd3Qndhlc=;
        b=fxQvHcncThCUR3ELfSbXvnlrWwu3QoU4Mk1QzrQxjGdXy5QBzcFio23lHVmAhSyGjY
         1eLFoi8l7KHkopmNVYKtsXbXSLlphR5L3p3dfpJ8DkHuL0wFVjd7E2YhtcSve+F0NPi5
         eRGtAJnsGv7GQFx68rExd7zXm2ABw4NFWnqt/1tuwDokB2oKYa3+3a1ZxyX8o2EHD5cg
         lzJmtcLnYpBWFhb5rY+SWkExpRjb7mzqVDogp+WNHA52y8wh+5y1e9q6+Kjsp9gBxV7F
         7q+Pxf1vfsI03Bx+On7bHamSqKkMJHMVsO0kmt28PnP/WgVvSijfVUM1coSxmNaMYxPB
         qKJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKviMn+3cAKbeCKbpNAhAYoodtCYZf204rjB+nJoxmsEdN4mA+8z3ypKhjIrFDlJxyiSGNabqO8Kk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIuIDx3wYJwXqbZKkzq3Z3VXG+PBpZxayG57k+BC4KsTNhv2JX
	mTAtyFdWk0scXpzleRpny3kLT+hl/frxsm3eYYJvSGVpvgQTKM1fJeEVU5lnJvxYH4GuxKsLCv0
	=
X-Gm-Gg: ASbGnctuhZHhVRhl9WhT65BNrmbqbGl9HSEnKXfeOgJUpHOo1RysuL51rGAQoBrjWAJ
	hrUs9ObjNWoONCKJTpTxLseznG0M9t1lb9FDD/fJjyLiCkBkOB8HCI0mwSFLh4FIfbe/eZGaw4n
	Aub0JHRkQpNfV80kQT650ytXQxslw6OwhqMMdPGuRU0esXY4s91zxPukKbNnKOXgB9aP7bdnOtP
	+vqqZahlt8OR4NSSAxGHmNBuE5Nnq31VD5cQKTrvv20EA0EowmFRQW+CU7JY9sQ0qdz0kHmoWcA
	gklADJfJVhBE8wVzlxUjOsF8loDhC6l/LYfy3E6bYw==
X-Google-Smtp-Source: AGHT+IHdmYiEr5wNj/uhmm2ZeWD3ydlCKITwq2Na+NlaXalUh61C04XRUhyguZP/3TUy/BYGIu9NQQ==
X-Received: by 2002:a05:6000:2a5:b0:385:f840:e630 with SMTP id ffacd0b85a97d-3888e0b9bc0mr7748078f8f.37.1734351115653;
        Mon, 16 Dec 2024 04:11:55 -0800 (PST)
Message-ID: <4360dd9d-049d-462f-9c15-16a73a4027a1@suse.com>
Date: Mon, 16 Dec 2024 13:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Michal Orzel <michal.orzel@amd.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-4-carlo.nonato@minervasys.tech>
 <adfdc378-e1cd-4500-a21c-6c5660ebfd1b@amd.com>
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
In-Reply-To: <adfdc378-e1cd-4500-a21c-6c5660ebfd1b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 13:08, Michal Orzel wrote:
> On 13/12/2024 17:28, Carlo Nonato wrote:
>> @@ -977,6 +1022,108 @@ out:
>>      return res;
>>  }
>>
>> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>> +{
>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>> +    struct membanks *hwdom_free_mem = NULL;
>> +
>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>> +
>> +    mem->nr_banks = 0;
>> +    /*
>> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>> +     * is enabled.
>> +     */
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
>> +        /*
>> +         * Exclude the following regions:
>> +         * 1) Remove reserved memory
>> +         * 2) Grant table assigned to Dom0
> Can we not mention 'Dom0'? In the future hwdom may not necessarily be dom0. Especially that
> in other places you mention hwdom.
> 
>> +         */
>> +        const struct membanks *mem_banks[] = {
>> +            bootinfo_get_reserved_mem(),
>> +            gnttab,
>> +        };
>> +
>> +        ASSERT(llc_coloring_enabled);
> Remove this assert. There's nothing LLC special here and this could be re-used in the future
> to provide non 1:1 hwdom.
> 
>> +
>> +        if ( !gnttab )
>> +            goto fail;
>> +
>> +        gnttab->nr_banks = 1;
>> +        gnttab->bank[0].start = kinfo->gnttab_start;
>> +        gnttab->bank[0].size = kinfo->gnttab_start + kinfo->gnttab_size;
> Incorrect. You assign to 'end' to'size'. It should simply be:
> gnttab->bank[0].size = kinfo->gnttab_size.
> 
>> +
>> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>> +                                             NR_MEM_BANKS);
>> +        if ( !hwdom_free_mem )
>> +            goto fail;
>> +
>> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>> +
>> +        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>> +                                     add_hwdom_free_regions, hwdom_free_mem) )
>> +            goto fail;
>> +
>> +        nr_banks = hwdom_free_mem->nr_banks;
>> +        xfree(gnttab);
>> +    }
>> +
>> +    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
>> +    {
>> +        paddr_t bank_start, bank_size;
>> +
>> +        if ( is_hardware_domain(d) )
>> +        {
>> +            bank_start = hwdom_free_mem->bank[i].start;
>> +            bank_size = hwdom_free_mem->bank[i].size;
>> +        }
>> +        else
>> +        {
>> +            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>> +            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>> +
>> +            if ( i >= GUEST_RAM_BANKS )
>> +                goto fail;
>> +
>> +            bank_start = bankbase[i];
>> +            bank_size = banksize[i];
>> +        }
>> +
>> +        bank_size = MIN(bank_size, kinfo->unassigned_mem);
>> +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
>> +            goto fail;
>> +    }
>> +
>> +    if ( kinfo->unassigned_mem )
>> +        goto fail;
>> +
>> +    for( i = 0; i < mem->nr_banks; i++ )
>> +    {
>> +        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>> +               d,
>> +               i,
>> +               mem->bank[i].start,
>> +               mem->bank[i].start + mem->bank[i].size,
>> +               /* Don't want format this as PRIpaddr (16 digit hex) */
>> +               (unsigned long)(mem->bank[i].size >> 20));
>> +    }
>> +
>> +    xfree(hwdom_free_mem);
>> +    return;
>> +
>> +fail:

Nit: Style (missing indentation).

Jan

