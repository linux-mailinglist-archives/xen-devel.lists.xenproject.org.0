Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C4ACAC5F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 12:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003132.1382591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Ia-0007i0-Gi; Mon, 02 Jun 2025 10:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003132.1382591; Mon, 02 Jun 2025 10:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Ia-0007fS-D8; Mon, 02 Jun 2025 10:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1003132;
 Mon, 02 Jun 2025 10:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM2IY-0007fM-FG
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 10:21:42 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a8ee439-3f9b-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 12:21:32 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso208194f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 03:21:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affadf7bsm7536163b3a.108.2025.06.02.03.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 03:21:31 -0700 (PDT)
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
X-Inumbo-ID: 5a8ee439-3f9b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748859691; x=1749464491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8qllOqqaeVhoUab7xw9pn8RJARRqQTvpElQ/c2lFnUI=;
        b=Sz6c25yPmQ3xrf1WKNeWG8ud+MzR3IlY6ALjCP+stEIlsoFR2FYobjzOU8ZyyQxEDa
         BcElZesHquw08astGbk0CqKjlRRgl1zrHwyZENjwQ4iTHlunGb7cc8fC35DetwyRcIVk
         rRWJsiDbTuu0a7uqEK8WeP98sLsm/+DM6Tmj7my3zbENlSGNN8CLfWujIKbt9LQDmoRV
         opHHFsUoMoSPPeplKZ8qh6znKDLJvj/pdCppDoVUM1D73JLFgs+RGxDq9xg0oMM2wbjm
         KnR2C/d0nVCfJ6xO1pZvMZYOxZbMcAfdOsmX+GgxXdSf/etX6jgGHiRKPz2OczudtYif
         JA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859691; x=1749464491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qllOqqaeVhoUab7xw9pn8RJARRqQTvpElQ/c2lFnUI=;
        b=mRy2NXREzNh+WCbEYaW9jBSSxB6aCDnPjCieLAmc3QvWbBoXPtlr6pDoJ+zMyKoe4G
         NjeE0lRuZFIHUTAxo6bpKA2vEEi2SjduCZIaw/I0EmS90jgTHjnzpPsSeIhx+e+rPVCh
         BAeN8t6LHsJLQU2bp7Rgt4lteTceMjlE5fHYcLGzSEs61wLsPTGDloO/LgJCO8rv62Tk
         BVuTgJDyRUBQExNVdYVp0BmthhwFn/t3acx9MIY5m/yHHor5VlOHPDF77INmk8w0Qt8s
         ZyCxehoNrM533L0PFU4hV61KJnpcbJ6E/+6q52zUBPDEmIYUZvA0SSgYb067R/386oSh
         X/qg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Gu5LWn2Wu+8CcuLP6Ybdf6xSkCVpKCctE3FG5WSYG6NdCbSj39OeclPRoTAcvUibTeh+QlM1lf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGQXkgj7VpKli8H62f6azSxxvlw0ogfYfOCvws3cNEBJTZaBOL
	gMNCQV6hkmOmYz6WBRibT/6CVBsKKIvHsq9fPSv0ty1GCxKXpjiYB5hqwoB4Mng2Gw==
X-Gm-Gg: ASbGnctGayZvi6wdQFa6AIo6DQbpi9dwBuP4pC0lBy/gYNrhqdu0VZxa0o6NklOKFAQ
	y72exzY/xF5vUheyvaJ0YCsgHu/KI6pqYRqVzfqmnAflxB7tsjs9HnrAIOuWO/xtOuyoWYVkffi
	4h8hrk5Ny7TZA+vV886bCz4NDpbxf/4KU1OkH51CCQZ3P8KakQWyLgX3pROttrBmgZwFIYoBsEj
	NYYng5gE5j2Jh8YB93CJjkTt/tSXTaEeF6d2ColpeMyQjkDYLTO2WdrPYIKwTqiwMHcVA/6Jc2m
	NBQKYPfgEKqUspTF/6nS6Q55d3I7xP8YS1hafDs6/qOWcFHINujImWTtBiEIeKhST/wR4JhkNC5
	6jx822i17v5VPOfkvxYRhMhB5ooZ1Uy0pI8rP
X-Google-Smtp-Source: AGHT+IE1iJo0yZ38IM2z/ZK7O5XSdSEcvkAJW9rtUZ0bnNLgdrqcZDBLpsT2iH9Z+V6OE3VIB7986g==
X-Received: by 2002:a05:6000:3109:b0:3a4:dcfb:3118 with SMTP id ffacd0b85a97d-3a4f7a3d5eemr10151434f8f.10.1748859691515;
        Mon, 02 Jun 2025 03:21:31 -0700 (PDT)
Message-ID: <8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com>
Date: Mon, 2 Jun 2025 12:21:34 +0200
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
In-Reply-To: <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.05.2025 20:44, Oleksii Kurochko wrote:
> On 5/22/25 4:46 PM, Jan Beulich wrote:
>> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>>> +    /* Allocate MMIO resource array */
>>> +    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
>> How large can this and ...
>>
>>> +    if ( !imsic_cfg.mmios )
>>> +    {
>>> +        rc = -ENOMEM;
>>> +        goto imsic_init_err;
>>> +    }
>>> +
>>> +    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
>> ... this array grow (in principle)?
> 
> Roughly speaking, this is the number of processors. The highests amount of processors
> on the market I saw it was 32. But it was over a year ago when I last checked this.

Unless there's an architectural limit, I don't think it's a good idea to
take as reference what's available at present. But yes, ...

>>   I think you're aware that in principle
>> new code is expected to use xvmalloc() and friends unless there are specific
>> reasons speaking against that.
> 
> Oh, missed 'v'...

... adding the missing 'v' will take care of my concern. Provided of
course this isn't running to early for vmalloc() to be usable just yet.

>>> +    if ( !imsic_cfg.msi )
>>> +    {
>>> +        rc = -ENOMEM;
>>> +        goto imsic_init_err;
>>> +    }
>>> +
>>> +    /* Check MMIO register sets */
>>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>>> +    {
>>> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
>>> +        {
>>> +            rc = -ENOMEM;
>>> +            goto imsic_init_err;
>>> +        }
>>> +
>>> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
>>> +                                   &imsic_cfg.mmios[i].size);
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>>> +                   node->name, i);
>>> +            goto imsic_init_err;
>>> +        }
>>> +
>>> +        base_addr = imsic_cfg.mmios[i].base_addr;
>>> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>>> +                           imsic_cfg.hart_index_bits +
>>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>>> +                       imsic_cfg.group_index_shift);
>>> +        if ( base_addr != imsic_cfg.base_addr )
>>> +        {
>>> +            rc = -EINVAL;
>>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>>> +                   node->name, i);
>>> +            goto imsic_init_err;
>>> +        }
>> Maybe just for my own understanding: There's no similar check for the
>> sizes to match / be consistent wanted / needed?
> 
> If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
> provide, IMO.
> So I don't what is possible range for imsic_cfg.mmios[i].size.

Well, all I can say is that's it feels odd that you sanity check base_addr
but permit effectively any size.

>>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>>       return pcpu_info[cpuid].hart_id;
>>>   }
>>>   
>>> +static inline unsigned long hartid_to_cpuid(unsigned long hartid)
>>> +{
>>> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
>>> +    {
>>> +        if ( hartid == cpuid_to_hartid(cpuid) )
>>> +            return cpuid;
>>> +    }
>>> +
>>> +    /* hartid isn't valid for some reason */
>>> +    return NR_CPUS;
>>> +}
>> Considering the values being returned, why's the function's return type
>> "unsigned long"?
> 
> mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
> Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
> and MXLEN is 64 for RV64.

Yet the return value here is always constrained by NR_CPUS, isn't it?

Jan

