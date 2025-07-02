Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFFBAF5C56
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031358.1405174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWz7c-0002qf-Cw; Wed, 02 Jul 2025 15:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031358.1405174; Wed, 02 Jul 2025 15:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWz7c-0002p9-9J; Wed, 02 Jul 2025 15:11:40 +0000
Received: by outflank-mailman (input) for mailman id 1031358;
 Wed, 02 Jul 2025 15:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWz7a-0002nq-Dz
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:11:38 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a3ced4-5756-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 17:11:36 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so3337131f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 08:11:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc67367sm63963a91.18.2025.07.02.08.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 08:11:35 -0700 (PDT)
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
X-Inumbo-ID: d8a3ced4-5756-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751469096; x=1752073896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AcGHS5vUib4VhYzbb18TsbtLNzBZ84WXOudx0h+9aYA=;
        b=BjW8EgQiRvHWNnJpZKB6GjLuhjPQV3fX6kx4pCvGxsCaF7hzy1wDB91uFVBLI/KjGe
         gCHmJk8z5QwzUSARO8sn8RaZ6khYgWdq4xUDX5MIhqNqlQ477dDPuNti3eF8xvl2LVf9
         vJ27iFfK2aNH7wmpdbnoBFIha5y0WSbYQKd/xpclf1xGDYUoFGo4zZBDDS7hhT3yPJGV
         7a+7zsbokt1dyM+EZmc0LmxCVCdtN3lDRogNH5RrQMTlpgsiBQeZjfsBbuSNPTZKbnWb
         qIzOuh925GcDUNPIdRV2HN4ADmmtHE3QjJJGDTjDrAl7LUoQ8oS+Vhsfy4U3BYQggR56
         kRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751469096; x=1752073896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcGHS5vUib4VhYzbb18TsbtLNzBZ84WXOudx0h+9aYA=;
        b=HerlGWP/sAOy/XCzWNBlVf1mE27t3ZNJbIV8AaqZbTJm84xPMPSkad5a7xtvwDUNXQ
         OOSL9IKraiScMB+D9rwxQ7g/GYPLM6YMXCz/qgj3zFD76JKUPfWf7AS195848jr0XqtU
         RZ3rs7PJlobcAQL5u5TBrw9pO2gLvayBkABkHTCwW256mPPjiKNnXHYuF2a8XfPITufn
         mL1PZXqSprvE2sVIqsKfmU8iZhWMulYyyWdjcqy3U0zqNMRNYymm2eTq36nqd70gLlQh
         pUU1BQZ1NwtmrnMiHmseHGD103MCxORviTbt//B21WqKWCrVFzhgGbikD5FWAp4LZODu
         0T1g==
X-Forwarded-Encrypted: i=1; AJvYcCVG2BNLoFezL8kVbcft8ZP5IpxPw1hHcqB5m6lUeAiqpuYodzonPfPov9ihZ9DLqx/jvmY9OpOsjmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzV6dfl/34JYS5B13wMoScYuNMemDFjenFEehcFYGUO/ONkRaaJ
	Mj/1ojPo5vhxgGAds0+lixO8P+yHr7ll6BrVScgg3+mlmM3rc96bgS8LQqzAYKEP0A==
X-Gm-Gg: ASbGnctZYwLsVPEiK6RGWaHL/MGM90A8H7XmwOjcwmCdQjBcdG1xCEx7q6Qeqe/M/LI
	Oaqz66u8X31EoCPzOBEQMOCQSuelZn/tgRyhXjyNyKRvrxYPcy2pEdv7QTthk3rw1Rojtnta/H6
	XmfZzuqnUejf6Vt4uumn5l2dYnPguU6sr0TyULQnwpMooekwrg0ek4cJy7EVHcidV+hruQK7IAw
	Ugk3JrejA2luY/N05SCjf7w2TNqz3dpWGXKG7CF5/FEVWap9Mi5GywgixMnb0aMwOUqv4FVHNBx
	Mro2DvE/X/n9gxuwNiXvrJ7q7h4esdM3afSdJc5aD0jQHKM7etHXa7e0I99Gj/UJuu++KD6GgtC
	bZU0flCDpbmMtbgS/aQVhJQQY55xDCs1EI4iDoANRGu2UYIY=
X-Google-Smtp-Source: AGHT+IGMD7meG6XCLNav37wD0QlJVQe5TiawRlbnrpveb75j3MyaXWzFmWgEDZxqRYJyjJ/8hzHP1Q==
X-Received: by 2002:a05:6000:4914:b0:3a4:f975:30f7 with SMTP id ffacd0b85a97d-3b201d8df63mr2629667f8f.56.1751469095660;
        Wed, 02 Jul 2025 08:11:35 -0700 (PDT)
Message-ID: <d18fd33e-da42-4f05-a6f1-c03e5f2f34de@suse.com>
Date: Wed, 2 Jul 2025 17:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] x86/slaunch: restore boot MTRRs after Intel TXT
 DRTM
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> @@ -442,6 +444,9 @@ static uint64_t __init mtrr_top_of_ram(void)
>      ASSERT(paddr_bits);
>      addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
>  
> +    if ( slaunch_active )
> +        txt_restore_mtrrs(e820_verbose);

How did you pick this call site? Besides it being unrelated to the purpose of
the function, we may not even make it here (e.g. when "e820-mtrr-clip=no" on
the command line). Imo this wants to go in the caller of this function,
machine_specific_memory_setup(). Or you want to reason about this placement in
the description.

> --- a/xen/arch/x86/include/asm/intel-txt.h
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -426,6 +426,9 @@ void txt_map_mem_regions(void);
>  /* Marks TXT-specific memory as used to avoid its corruption. */
>  void txt_reserve_mem_regions(void);
>  
> +/* Restores original MTRR values saved by a bootloader before starting DRTM. */
> +void txt_restore_mtrrs(bool e820_verbose);

This parameter name is, when the header is used from e820.c, going to shadow the
static variable of the same name there. Misra objects to such. But the parameter
doesn't really have a need for having the e820_ prefix, does it?

> @@ -111,3 +113,76 @@ void __init txt_reserve_mem_regions(void)
>                       E820_UNUSABLE);
>      BUG_ON(rc == 0);
>  }
> +
> +void __init txt_restore_mtrrs(bool e820_verbose)
> +{
> +    struct slr_entry_intel_info *intel_info;
> +    uint64_t mtrr_cap, mtrr_def, base, mask;
> +    unsigned int i;
> +    uint64_t def_type;
> +    struct mtrr_pausing_state pausing_state;
> +
> +    rdmsrl(MSR_MTRRcap, mtrr_cap);
> +    rdmsrl(MSR_MTRRdefType, mtrr_def);
> +
> +    if ( e820_verbose )
> +    {
> +        printk("MTRRs set previously for SINIT ACM:\n");
> +        printk(" MTRR cap: %"PRIx64" type: %"PRIx64"\n", mtrr_cap, mtrr_def);
> +
> +        for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
> +        {
> +            rdmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
> +            rdmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
> +
> +            printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
> +                   i, base, mask);
> +        }
> +    }
> +
> +    intel_info = (struct slr_entry_intel_info *)
> +        slr_next_entry_by_tag(slaunch_get_slrt(), NULL, SLR_ENTRY_INTEL_INFO);
> +
> +    if ( (mtrr_cap & 0xFF) != intel_info->saved_bsp_mtrrs.mtrr_vcnt )

Seeing this and ...

> +    {
> +        printk("Bootloader saved %ld MTRR values, but there should be %ld\n",
> +               intel_info->saved_bsp_mtrrs.mtrr_vcnt, mtrr_cap & 0xFF);
> +        /* Choose the smaller one to be on the safe side. */
> +        mtrr_cap = (mtrr_cap & 0xFF) > intel_info->saved_bsp_mtrrs.mtrr_vcnt ?

... this vs ...

> +                   intel_info->saved_bsp_mtrrs.mtrr_vcnt : mtrr_cap;
> +    }
> +
> +    def_type = intel_info->saved_bsp_mtrrs.default_mem_type;
> +    pausing_state = mtrr_pause_caching();
> +
> +    for ( i = 0; i < (uint8_t)mtrr_cap; i++ )

... this (and others): Please be consistent in how you access the same piece
of data.

> +    {
> +        base = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physbase;
> +        mask = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physmask;
> +        wrmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
> +        wrmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
> +    }
> +
> +    pausing_state.def_type = def_type;
> +    mtrr_resume_caching(pausing_state);
> +
> +    if ( e820_verbose )
> +    {
> +        printk("Restored MTRRs:\n"); /* Printed by caller, mtrr_top_of_ram(). */

What's the comment supposed to be telling the reader? Perhaps this is related to ...

> +        /* If MTRRs are not enabled or WB is not a default type, MTRRs won't be printed */

... what this comment says, but then the earlier comment is still confusing (to me
at least). This latter comment says all that's needed, I would say.

Jan

