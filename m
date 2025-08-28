Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B2B39C22
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098559.1452575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbMg-000624-J3; Thu, 28 Aug 2025 12:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098559.1452575; Thu, 28 Aug 2025 12:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbMg-00060Z-F4; Thu, 28 Aug 2025 12:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1098559;
 Thu, 28 Aug 2025 12:04:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbMf-000601-Du
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:04:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 222d5b05-8407-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 14:04:22 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afeceee8bb1so118881666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:04:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afea7ad4f27sm602354366b.11.2025.08.28.05.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:04:20 -0700 (PDT)
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
X-Inumbo-ID: 222d5b05-8407-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756382662; x=1756987462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ieW4Xwt/28K3xF2jXxv0qf9BsQsT1sKflS39wdwBuP0=;
        b=doWg0tsDcE4Zmjaq2JMAGslbeJgeXnpg+tX3qnbalj2OMmG/pGTOwyl4n/JipvyWAA
         KM1qeODvSwNncoyZBbP67QVrgUlcbCmF5OWdx/jCLejlPJR9yX6wTdb5USC1GQhOQATV
         7CqH9KJIt7rGjkQVl3stwWk0gwG2m7uuTym7CC+WL5OPgHVErNhH7aE40Y6LLJsc3kgX
         Q74GrnaT27NgTwLDYw7KBw/IvcWOOooVwEa9s/ZfIJSrYHQEAqZiVDU2NE5AIjVKocp/
         lZcsE3cA2Dbtls2g8jhk4dbC8HqNCDG+3HL/9WTDTve6S1FXHQpemeXvBuHw+2i4X72S
         d8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756382662; x=1756987462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieW4Xwt/28K3xF2jXxv0qf9BsQsT1sKflS39wdwBuP0=;
        b=HCu2uNDIKuts2C1lSnIMC699qVOUwmOw5uZyQCDWP3MVZYC7hpiIe7qWno7ihgGyNg
         SRk20MLpHBZedl5sr6AgO4baBEzDlaRrQi66htoGILhPg4TP4LYooV3j73wCKNfPsEce
         P4aDyIGMchHVp6H5FTcQDI/60TFlWVmSDpnmuRbu82Q4JFrENyKx2AgPY7+CMYTyRBF7
         m+8lyCDkpRXnBjyu1q94xDYHMbcjddBYxj77eycGNyJgYa5YqZqnbsYOk84pq5PYjs1l
         jsLU86Gu3UyA+PiA8ikfGDKEPuvgb4oXtcWS4Jpv8XQl7X4+NbcA2m6JIk5EPAt9mY98
         +y5g==
X-Forwarded-Encrypted: i=1; AJvYcCUOK2h/z9r++TyXwyDQRB3dzHLaHnRc1zBqKEWu8uVYMnB/CdvMPrVhdmVEDsQ+YklBMT2spG1Ho/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT3jNsue+BvhjcQjEKKX2RLbXeS7d6PQeA4loo+LStHYqxZDr0
	qWB0M9R/CVNwABnyQGzZzra/1WRPBucRUCIzLsp6qnAGeYcA2P9XSL1uQz0B7WoqZA==
X-Gm-Gg: ASbGncueXQMQmNwc1p8jIzP4dtpVvaMoqUaGSM7pvHbP4+cErMmuUBQqd3YsgW7xKpj
	aGrL5VHyK8T9oVqPx5Mex6X6x02+lwIts08MMZVfj+oK4on9jYd3WidnxaIVFTWQ3KnOvXX6CZ/
	pl/BlSzbpbQkylv59zJo3vgJ24F+wH+LbXYqCja4m4ZQuXS0olK4G8VLsGTsp9Hp/MKxOMvlgoi
	Pb/KvaNLzT0G1I1AvFwrsOK6Eni2ohBpHz/Nq2hRyDICn6P2h0+uUd08jg1F0bC1nrXFTfsggbc
	DDwnl/13NjwwXofybZ7r2zx+4z51I/xwEXtM4+CFLWCtERqX9NHT3OiseGzngiL+HV3oIarsVE3
	bZWLlEsFNLR9FsjGtSGpPST7QTNXJ5AdZhtvbz+e5km0jlpbxjbFBWvBqIHKEs3Su4z5LkEWSCm
	7ehG9mi2ZWabEiUGKGyg==
X-Google-Smtp-Source: AGHT+IFon2Alfa6rdJsd3d2O8b8ToEhpMe1EPU78alTWDCytGpdMrEuLzsqUAAFDy9A/NILaWeedGw==
X-Received: by 2002:a17:907:60ca:b0:af9:35f0:7a0f with SMTP id a640c23a62f3a-afe28ffb668mr2077432666b.28.1756382661430;
        Thu, 28 Aug 2025 05:04:21 -0700 (PDT)
Message-ID: <3a3675a3-68fc-4917-ad7a-9b31e7e56937@suse.com>
Date: Thu, 28 Aug 2025 14:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 05/10] pmu.h: introduce a stacktrace area
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andriy.sultanov@vates.tech,
 boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <49cbbacdc5f4fec624ae164a01eaa574aa771854.1753372928.git.edwin.torok@cloud.com>
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
In-Reply-To: <49cbbacdc5f4fec624ae164a01eaa574aa771854.1753372928.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.07.2025 17:06, Edwin Török wrote:
> The guest always allocates a full page that is mapped for 'struct
> xen_pmu_data' (there is no smaller mapping granularity).
> 
> The existing struct contains a flexible array member that is used to
> store architectural performance counters on Intel (their number is
> dynamically determined from CPUID).
> 
> AFAICT their number is currently limited to 32 due to the bitmap in the
> CPUID only having 32 bits defined for this, although the cpuid has 8
> bits reserved to specify the number of these counters, so this may grow.
> 
> For backwards compatibility and to leave as much room for future growth
> in these counters as possible: the newly introduced hypervisor
> stacktrace area will be stored at the end of the page.
> 
> Conceptually this would've been:
> ```
> struct xen_pmu_data_v2 {
>     union {
>         struct xen_pmu_data v1;
>         uint8_t pad[PAGE_SIZE - sizeof(struct xen_pmu_hv_stacktrace)];
>     };
>     struct xen_pmu_hv_stacktrace pmu_stack;
> };
> ```
> 
> But that is not valid C due to the flexible array member in v1.

And I fear it's not a good interface anyway. What's wrong with the caller
dedicating another page to holding the stack trace related data?

> There is code duplication in 'struct xen_pmu_arch_guest',
> but xlat.h checker fails if I try to reuse that in the definition of
> xen_pmu_arch_t.

What exactly is this referring to?

> --- a/xen/include/public/arch-x86/pmu.h
> +++ b/xen/include/public/arch-x86/pmu.h
> @@ -74,6 +74,23 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_regs_t);
>  #define PMU_SAMPLE_REAL    (1<<2) /* Sample is from realmode */
>  #define PMU_SAMPLE_PV      (1<<3) /* Sample from a PV guest */
>  
> +/*
> + * Architecture-specific information describing the state of the guest at
> + * the time of a PMU interrupt.
> + */
> +struct xen_pmu_arch_guest {
> +    union {
> +        /*
> +         * Processor's registers at the time of interrupt.
> +         * WO for hypervisor, RO for guests.
> +         */
> +        xen_pmu_regs_t regs;

How's this related to stack traces?

> @@ -129,67 +146,86 @@ struct xen_pmu_arch {
>  typedef struct xen_pmu_arch xen_pmu_arch_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
>  
> +

Stray double blank lines.

>  /* Memory layout:
> -*                ╭─────────────────────╮
> -*                │ struct xen_pmu_data │
> -* ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁╮
> -* │ vcpu_id                                                    │  │
> -* ├────────────────────────────────────────────────────────────┤  │
> -* │ pcpu_id                                                    │  │
> -* ├────────────────────────────────────────────────────────────┤  │
> -* │ domain_id                                                  │  │
> -* ├────────────────────────────────────────────────────────────┤  │
> -* │██pad███████████████████████████████████████████████████████│  │
> -* ╞════╤═╤═══╤══════════════════╤══════════════════════════════╡  │
> -* │ pmu│ │ r │ regs             │██pad█████████████████████████│  │
> -* ├────╯ ├───╯ (xen or guest)   │██████████████████████████████│  │
> -* │      ╞══════════════════════╧══════════════════════════════╡  │
> -* │      │ pmu_flags                                           │  │
> -* │      ╞═══╤════════════════════╤════════════════════════════╡  │
> -* │      │ l │ lapic_lvtpc        │████████████████████████████│  │
> -* │      ├───╯ ███████████████████│██pad███████████████████████│  │
> -* │      │     ███████████████████│████████████████████████████│  │
> -* │      ╞═══╤═╤═══════╤═════╤════╪════╤═══════╤═══════════════╡  │
> -* │      │ c │ │       │ amd │    │    │ intel │         │█████│  │
> -* │      ├───┘ │       ╰─────╯    │    ╰───────╯         │█████│  │
> -* │      │     │ counter          │ fixed_counters       │█████│  │
> -* │      │     ├──────────────────┼──────────────────────┤█████│  │
> -* │      │     │ ctrls            │ arch_counters        │█████│  │
> -* │      │     ╞═════╤════════╤═══├──────────────────────┤█████│  │
> -* │      │     │     │ regs[] │  ┆│ global_ctrl          │█████│  │
> -* │      │     │     └────────╯  ┆├──────────────────────┤█████│  │
> -* │      │     │struct           ┆│ global_ovf_ctrl      │█████│  │
> -* │      │     │xen_pmu_cntr_pair┆├──────────────────────┤█████│  │
> -* │      │     │[counters]       ┆│ global_status        │█████│  │
> -* │      │     │                 ┆├──────────────────────┤█████│  │
> -* │      │     │                 ┆│ fixed_ctrl           │█████│  │
> -* │      │     │                 ┆├──────────────────────┤█████│  │
> -* │      │     │                 ┆│ ds_area              │█████│  │
> -* │      │     │                 ┆├──────────────────────┤█████│  │
> -* │      │     │                 ┆│ pebs_enable          │█pad█│  │
> -* │      │     │                 ┆├──────────────────────┤█████│  │
> -* │      │     │                 ▽│ debugctl             │█████│  │
> -* │      │     │██████████████████╞═══════╤════════╤═════╡█████│  │
> -* │      │     │██████████████████│       │ regs[] │ ┆[0]│█████│  │
> -* │      │     │██████████████████│       └────────╯ ┆   │█████│  │
> -* │      │     │██████████████████│ uint64_t         ┆   │█████│  │
> -* │      │     │██████████████████│ [fixed_counters] ┆   │█████│  │
> -* │      │     │██████████████████│                  ┆   │█████│  │
> -* │      │     │██████████████████│                  ┆   │█████│  │
> -* │      │     │██████████████████│ ─────────────────┆   │█████│  │
> -* │      │     │██████████████████│  struct          ┆   │█████│  │
> -* │      │     │██████████████████│ xen_pmu_cntr_pair┆   │█████│  │
> -* │      │     ╘══════════════════╡ [arch_counters]  ┆   ╞═════╡  │
> -* │      │                        │                  ┆   │     │  │
> -* │      │                        │                  ▽   │     │  │
> -* │      │                        ╘══════════════════════╛     │  │
> -* │      ╘═════════════════════════════════════════════════════╡  │
> -* ╞════════════════════════════════════════════════════════════╡  │
> -* │████████████████████████████████████████████████████████████│  │
> -* ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
> -* ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
> -* │████████████████████████████████████████████████████████████│  │ PAGE_SIZE
> -* ╘════════════════════════════════════════════════════════════╛ ◁╯
> + *                ╭─────────────────────╮
> + *                │ struct xen_pmu_data │
> + * ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁╮
> + * │ vcpu_id                                                    │  │
> + * ├────────────────────────────────────────────────────────────┤  │
> + * │ pcpu_id                                                    │  │
> + * ├────────────────────────────────────────────────────────────┤  │
> + * │ domain_id                                                  │  │
> + * ├────────────────────────────────────────────────────────────┤  │
> + * │██pad███████████████████████████████████████████████████████│  │
> + * ╞════╤═╤═══╤══════════════════╤══════════════════════════════╡  │
> + * │ pmu│ │ r │ regs             │██pad█████████████████████████│  │
> + * ├────╯ ├───╯ (xen or guest)   │██████████████████████████████│  │
> + * │      ╞══════════════════════╧══════════════════════════════╡  │
> + * │      │ pmu_flags                                           │  │
> + * │      ╞═══╤════════════════════╤════════════════════════════╡  │
> + * │      │ l │ lapic_lvtpc        │████████████████████████████│  │
> + * │      ├───╯ ███████████████████│██pad███████████████████████│  │
> + * │      │     ███████████████████│████████████████████████████│  │
> + * │      ╞═══╤═╤═══════╤═════╤════╪════╤═══════╤═══════════════╡  │
> + * │      │ c │ │       │ amd │    │    │ intel │         │█████│  │
> + * │      ├───┘ │       ╰─────╯    │    ╰───────╯         │█████│  │
> + * │      │     │ counter          │ fixed_counters       │█████│  │
> + * │      │     ├──────────────────┼──────────────────────┤█████│  │
> + * │      │     │ ctrls            │ arch_counters        │█████│  │
> + * │      │     ╞═════╤════════╤═══├──────────────────────┤█████│  │
> + * │      │     │     │ regs[] │  ┆│ global_ctrl          │█████│  │
> + * │      │     │     └────────╯  ┆├──────────────────────┤█████│  │
> + * │      │     │struct           ┆│ global_ovf_ctrl      │█████│  │
> + * │      │     │xen_pmu_cntr_pair┆├──────────────────────┤█████│  │
> + * │      │     │[counters]       ┆│ global_status        │█████│  │
> + * │      │     │                 ┆├──────────────────────┤█████│  │
> + * │      │     │                 ┆│ fixed_ctrl           │█████│  │
> + * │      │     │                 ┆├──────────────────────┤█████│  │
> + * │      │     │                 ┆│ ds_area              │█████│  │
> + * │      │     │                 ┆├──────────────────────┤█████│  │
> + * │      │     │                 ┆│ pebs_enable          │█pad█│  │
> + * │      │     │                 ┆├──────────────────────┤█████│  │
> + * │      │     │                 ▽│ debugctl             │█████│  │
> + * │      │     │██████████████████╞═══════╤════════╤═════╡█████│  │
> + * │      │     │██████████████████│       │ regs[] │ ┆[0]│█████│  │
> + * │      │     │██████████████████│       └────────╯ ┆   │█████│  │
> + * │      │     │██████████████████│ uint64_t         ┆   │█████│  │
> + * │      │     │██████████████████│ [fixed_counters] ┆   │█████│  │
> + * │      │     │██████████████████│                  ┆   │█████│  │
> + * │      │     │██████████████████│                  ┆   │█████│  │
> + * │      │     │██████████████████│ ─────────────────┆   │█████│  │
> + * │      │     │██████████████████│  struct          ┆   │█████│  │
> + * │      │     │██████████████████│ xen_pmu_cntr_pair┆   │█████│  │
> + * │      │     ╘══════════════════╡ [arch_counters]  ┆   ╞═════╡  │
> + * │      │                        │                  ┆   │     │  │
> + * │      │                        │                  ▽   │     │  │
> + * │      │                        ╘══════════════════════╛     │  │
> + * │      ╘═════════════════════════════════════════════════════╡  │
> + * ╞════════════════════════════════════════════════════════════╡  │
> + * │████████████████████████████████████████████████████████████│  │
> + * ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
> + * ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
> + * │████████████████████████████████████████████████████████████│  │
> + * |############################################################|  |
> + * |##########.------------------------------.##################|  |
> + * |##########| struct xen_pmu_hv_stacktrace |##################|  |
> + * +==========+==============================+==================+  |
> + * |                              ^ [stacktrace_nr-1]           |  |
> + * |                              :                             |  |
> + * | stacktrace[stacktrace_nr]    : [0]                         |  |
> + * +------------------------------------------------------------+  |
> + * | stacktrace_nr                                              |  |
> + * +------------------------------------------------------------+  |
> + * | guest_domain_id                                            |  |
> + * +------------------------------------------------------------+  |
> + * |##pad#######################################################|  |
> + * +=======+=+===+==================+===========================+  |
> + * | guest | | r | regs             |##pad######################|  |
> + * +-------. +---. (xen or guest)   |###########################|  |
> + * |         +======================+===========================+  |
> + * |         |##pad2############################################|  | PAGE_SIZE
> + * +=========+==================================================+ <.
>  */
>  
>  #endif /* __XEN_PUBLIC_ARCH_X86_PMU_H__ */
> @@ -202,4 +238,3 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
>   * indent-tabs-mode: nil
>   * End:
>   */
> -

Stray change?

> @@ -120,6 +120,40 @@ struct xen_pmu_data {
>      xen_pmu_arch_t pmu;
>  };
>  
> +/* stacktrace entry populated from the end,
> + * so stacktrace_nr == 1, means that stacktrace[PMU_MAX_STACKTRCE-1] is valid.
> + * This is done, so that PMU_MAX_STACKTRACE can be changed in the future, without breaking the ABI.
> + * The struct itself (and thus the stacktrace_nr field) will always be placed at the end of a page.
> + *
> + * See arch-x86/pmu.h for an example memory layout on x86.
> + *
> + * */
> +#define PMU_MAX_STACKTRACE 127
> +
> +/* WO for hypervisor, RO for guest */
> +struct xen_pmu_hv_stacktrace {
> +    uint64_t stacktrace[PMU_MAX_STACKTRACE];
> +    uint64_t stacktrace_nr;
> +
> +    /* Like xen_pmu_data.domain_id, but instead of DOMID_XEN always contains the
> +     * domain that was interrupted (DOMID_SELF if it matches the sampling
> +     * domain).
> +     */
> +    domid_t guest_domain_id;

How's this related to stack traces? And how would it help associating back
what vCPU the data belongs to?

> +    uint8_t pad[6];
> +
> +    /* When xen_pmu_data.domain_id == DOMID_XEN, this will contain
> +    * the registers of the guest that was interrupted.
> +    * This is useful for Dom0 kernel stacktraces, even if the interrupt
> +    * arrives while in Xen.
> +    * */

Nit: Indentation.

Jan

