Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95010ACEA72
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006292.1385491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4Qa-0004rs-QY; Thu, 05 Jun 2025 06:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006292.1385491; Thu, 05 Jun 2025 06:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4Qa-0004p8-NE; Thu, 05 Jun 2025 06:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1006292;
 Thu, 05 Jun 2025 06:50:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN4QZ-0004oz-N5
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:50:15 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5568dbd6-41d9-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 08:50:14 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451e24dfe1aso4568195e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 23:50:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affd41edsm12583028b3a.146.2025.06.04.23.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 23:50:13 -0700 (PDT)
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
X-Inumbo-ID: 5568dbd6-41d9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749106214; x=1749711014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mZlcEnevP85+N4jveoMj+WxfN38GGi7vHzAT4VJJ5g8=;
        b=CdngmDyv0pPk6OZBu0VpbNyxKceqjSYN45M2jFo2gwRsYRGRMNAXLMeMCtfHbzUi8L
         /LUWsFlog+Y3pOnh7vBFgWbxOdnB7rgEMAfjVELu+6osTiFDk+gTsKCQNpGYv01wSOBO
         Owj0oAtVIjHM+7BdmqrMhiwA2LJJeMkGn4RctNQRpx3TmmyhOz4sdrqAuVH9DrLWqJ7f
         dbir7X859TB8+1d1OMbBBu/awdhcZ6ubqVDYy5/dC2Ym2rB9dMdIuJPjHFYTiZ3h2PjQ
         Wvfxm/C1SLgYs4YuUYcPeervZlWbogbJcCSg7Tn4vNCpwiQFDRmO5tr/jlZQUUQwUtNO
         GFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749106214; x=1749711014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZlcEnevP85+N4jveoMj+WxfN38GGi7vHzAT4VJJ5g8=;
        b=DLi+cSKh1fieBG5yQPtv89CFcPqtFtW7VwjYQz+XvcCVqRGbCDyof5lJH3vuZGplF7
         qNWc97FShT3zfsYBVsmHwaxY9Rrh6JGjZDlFAF1wqljPV7XYZgMRAEcEDGXE9Aqzt8YV
         D90x4pEDeO9rWq7m3Y2H2/N/ib/grwc05Vw4KoxHQNeCcHVBZQAOhyzFLM2/hR332Hmf
         StUGXKQeHbTAHQA/vFNH5RPUtkfw2xCgyHE199vvnBaFbHwc2XysVOY5ENyXXxivhlRH
         rQO53wshNK4YnUWSe2BwUXztAbyq3ymcAG6IBwzkntivLSpVriaG1/7ORjjg+Tdxd9tE
         02Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUJeLyZBY8J/Gi8j8qL3Imf3lg4SxOoOGz0C2QtNibMqdBQj3lUi80TpYFpWUL2pfFdSL8qITiNjpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoIqZK9jaT5+/MHjUtgtbFkYsXMC2tuyJIxijsEBNzLpmkaa6w
	kjtv1fxLSXJzTXUgpvgpZAPJ2nBvqwNpjf53fN/SPltowzCRg9Yw6U6xabaaQ3VzRQ==
X-Gm-Gg: ASbGncukAjb1ol8KhiZ+ceT8YfDXq/pCZhZh6jrxnGJqEsQC9Vmg/BypT7PqcGXknRO
	r8tI5IYo48xL5UDwSqyGW5CVQqJJ92hYdv+gVip/UF+zVVmG0zG/Pf/gJ0ICsjifo7ZJKv6lLhj
	ujbpNe979OKqsq9vctYOkERpNSvDbdDUwo1S03QJR+VWPVetpwxY7fneOL9e+wfhGOK6ZKOnh8a
	6btmGF+2vTWH7zIUa2R/hkZ6hUsk7NKCBSYK20mzEhMBMf75IKK9xhecboSqzcW7tHLYNj7b4zL
	ZEzQ9KD9PWhiuooImnkNStVeZ3p0yHh0VA989x2omWh2EiiN93Y178mE+BpV9vYsuiKQ+uZGCd+
	rCeTx6Xl5VNRFlqcgqpX+HTwNl+DPHOAth8ZO
X-Google-Smtp-Source: AGHT+IGk7krn6O+QUL452+xgEbntSP7jZQonfSyg67U5irJluwlk5hor3sskPweURQGJf8fQQHMyag==
X-Received: by 2002:a05:6000:288f:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3a51dbcc79fmr4730499f8f.13.1749106213999;
        Wed, 04 Jun 2025 23:50:13 -0700 (PDT)
Message-ID: <f0166994-be40-4210-b110-554d46535c85@suse.com>
Date: Thu, 5 Jun 2025 08:50:02 +0200
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
 <8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com>
 <d3dd9f90-4bef-4f75-b36c-0a5834a5a0ae@gmail.com>
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
In-Reply-To: <d3dd9f90-4bef-4f75-b36c-0a5834a5a0ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.06.2025 17:36, Oleksii Kurochko wrote:
> On 6/2/25 12:21 PM, Jan Beulich wrote:
>> On 26.05.2025 20:44, Oleksii Kurochko wrote:
>>> On 5/22/25 4:46 PM, Jan Beulich wrote:
>>>> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>>>>> +    /* Check MMIO register sets */
>>>>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>>>>> +    {
>>>>> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
>>>>> +        {
>>>>> +            rc = -ENOMEM;
>>>>> +            goto imsic_init_err;
>>>>> +        }
>>>>> +
>>>>> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
>>>>> +                                   &imsic_cfg.mmios[i].size);
>>>>> +        if ( rc )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>>>>> +                   node->name, i);
>>>>> +            goto imsic_init_err;
>>>>> +        }
>>>>> +
>>>>> +        base_addr = imsic_cfg.mmios[i].base_addr;
>>>>> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>>>>> +                           imsic_cfg.hart_index_bits +
>>>>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>>>>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>>>>> +                       imsic_cfg.group_index_shift);
>>>>> +        if ( base_addr != imsic_cfg.base_addr )
>>>>> +        {
>>>>> +            rc = -EINVAL;
>>>>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>>>>> +                   node->name, i);
>>>>> +            goto imsic_init_err;
>>>>> +        }
>>>> Maybe just for my own understanding: There's no similar check for the
>>>> sizes to match / be consistent wanted / needed?
>>> If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
>>> provide, IMO.
>>> So I don't what is possible range for imsic_cfg.mmios[i].size.
>> Well, all I can say is that's it feels odd that you sanity check base_addr
>> but permit effectively any size.
> 
> Okay, I think I have two ideas how to check the size:
> 1. Based on guest bits from IMSIC's DT node. QEMU calculates a size as:
>      for (socket = 0; socket < socket_count; socket++) {
>          imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>          imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
>                       s->soc[socket].num_harts;
>      ...
>     where:
>       #define IMSIC_MMIO_PAGE_SHIFT          12
>       #define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
>       
>       #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
>               (1U << (__guest_bits))
>       #define IMSIC_HART_SIZE(__guest_bits)                 \
>               (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
> 
> 2. Just take a theoretical maximum for S-mode IMSIC's node:
>      16,384 * 64 1(S-mode interrupt file) + 63(max guest interrupt files)) * 4 KiB
>     Where,
>       16,384 - maximum possible amount of harts according to AIA spec
>       64 - a maximum amount of possible interrupt file for S-mode IMSIC node:
>            1 - S interupt file + 63 guest interrupt files.
>       4 Kib - a maximum size of one interrupt file.
> 
> Which option is preferred?

I would have said 2, if your outline used "actual" rather than "maximum" values.

> The specification doesn’t seem to mention (or I couldn’t find) that all platforms
> must calculate the MMIO size in the same way QEMU does. Therefore, it’s probably
> better to use the approach described in option 2.
> 
> On the other hand, I don't think a platform should be considered correct if it
> provides slightly more than needed but still less than the theoretical maximum.
> 
>>
>>>>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>>>>        return pcpu_info[cpuid].hart_id;
>>>>>    }
>>>>>    
>>>>> +static inline unsigned long hartid_to_cpuid(unsigned long hartid)
>>>>> +{
>>>>> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
>>>>> +    {
>>>>> +        if ( hartid == cpuid_to_hartid(cpuid) )
>>>>> +            return cpuid;
>>>>> +    }
>>>>> +
>>>>> +    /* hartid isn't valid for some reason */
>>>>> +    return NR_CPUS;
>>>>> +}
>>>> Considering the values being returned, why's the function's return type
>>>> "unsigned long"?
>>> mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
>>> Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
>>> and MXLEN is 64 for RV64.
>> Yet the return value here is always constrained by NR_CPUS, isn't it?
> 
> I am not 100% sure that I get your point,

NR_CPUS is guaranteed to fit in a unsigned int. Furthermore variables / parameters
holding Xen-internal CPU numbers also are unsigned int everywhere else.

> but I put NR_CPUS here because of:
>    /*
>     * tp points to one of these per cpu.
>     *
>     * hart_id would be valid (no matter which value) if its
>     * processor_id field is valid (less than NR_CPUS).
>     */
>    struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>        .processor_id = NR_CPUS,
>    }};
> 
> As an option we could use ULONG_MAX. Would it be better?

No. NR_CPUS is the appropriate value to use here, imo.

Jan

