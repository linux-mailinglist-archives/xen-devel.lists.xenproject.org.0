Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86B2AE6691
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023693.1399730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3lQ-00041h-7t; Tue, 24 Jun 2025 13:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023693.1399730; Tue, 24 Jun 2025 13:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3lQ-000402-51; Tue, 24 Jun 2025 13:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1023693;
 Tue, 24 Jun 2025 13:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU3lO-0003z2-UV
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:32:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7f25f8-50ff-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 15:32:34 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so39941215e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 06:32:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df8354bsm11561933a91.18.2025.06.24.06.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 06:32:32 -0700 (PDT)
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
X-Inumbo-ID: af7f25f8-50ff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750771953; x=1751376753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=blhfPWIypShvcGCB6Ww5PN1dp+qPVMDSX21SiT0WU6c=;
        b=PXn0AunYU8M5JWc7vIEmsFAFsq9Wy8d299SXXamYQ/1PTEmIkA5nqjM8ov7evBIgBB
         s7pnY21nWX6jFgeVDaDqKW0dzjWKGkGETjBmLIo0iJf6/z61hBqVyr6ikUwnM+PvZ3l+
         j8ktLHA1zob6JeShVRde/jp6f99bXgHru+vfHmUqehPEeu5F9PwDxwlZlbbxyevZHkEo
         A8A/+5+B6uOZKSh9wVGGkteByFkaHBjDWSdFl416HUzV3hdIhmkAduL9+O1EKjF4AVeV
         1GYHR6S5QhF8CSvTECetW0bc4rJMID42yXFrTssX/ntcXX+gBvbQqhAAC9R/+/OCoscQ
         O+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771953; x=1751376753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blhfPWIypShvcGCB6Ww5PN1dp+qPVMDSX21SiT0WU6c=;
        b=bz+eL5woPTaEmv2M7GQQNKl9BmydqlpQvuutWKQxS6Nn/YeDzSzHtOdSmDWDYevfwx
         tq7wOR2hgt2zUgP75g8/kSG1KDGP+Eg4NWfepz0KrnDWLoa+HT6ddXZ+OKiUyv8SIyiX
         5Gg6n847SMWrabgJSKt1nezPCk61rSl2dEryHlMtGYh1B/HjYKnqlH/REOfQaOR7NE7M
         3Qkp1z4m8i3VOpmnrhlrZOoQzmQlGO4wK4/OfKyLf5ZLD5ZzXiUFDJYfrcl0f3JVpdCS
         soSfrEnAZxlQ+tCKYGU3IWE8VRINDCwzyiHOaqCu2PWzQ7W+jnUe3ZRjtPjgO8danaAZ
         NRuw==
X-Forwarded-Encrypted: i=1; AJvYcCW2k8KG08Cksu9K/glCs2NPaF2HEvFiCvv7YSrKw+gC1SXBFtHOAVXRnJ/homR7O7zsVMS8eGN8wcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyjeyc8mX700y+Is4MWZrv/GcTT3dGbOUzxFAfL8Wfb8RviI/rp
	yq/Qat70pCPD1uHdi0EQaD4SfPDhxNQL6CyEqqdhMp0sRN7x2Clr1Id9fekgLNM8Lw==
X-Gm-Gg: ASbGncsIvkjv44+ezC77zvZnfqIjx94RcWQmUdONkBhUXhY+fyV5O2Rk9xXeZQ7V8W/
	oxH8f0+LBvpJ9UO5kGBms72cvd+jdjXXlQv225zfkNFA95nEcYZy9Hvy0B3JOBl9RBUljE90Sn1
	OJ+F+j0LZlwqrJ92cf3hzeuR3tlPJr6HS8i/toVCM54lehe0YaNiuvxkaR0wqm+4QNt7CBrvgBl
	ffP5JF+T6OLvRWrJRGVslCFTqUA0pBm+B//8r7+kTqeN3aFluVik6RHvcS/D2zv22uqdKp3XCE1
	oHfNyf0ojf3zlFTE4lwwlDlNYdoKVANURoEW6Gc0Rj0Aua2+H/UYzwqpxUVemGn/aTAN8a351JS
	AyOAW4bP5wture8Afy0ibnmgH/Iyhn45esEJhS8gGbUCQy4yHHia2lEkZpQ==
X-Google-Smtp-Source: AGHT+IEF8dGR52fbnkmu/7jg+UOfALVhkpxhpmJQGQEVyU12ojT5HyexjzdTqSke27xXKzkZOwcFnA==
X-Received: by 2002:a05:6000:26cc:b0:3a6:d255:7eda with SMTP id ffacd0b85a97d-3a6d25584ddmr12905011f8f.28.1750771953347;
        Tue, 24 Jun 2025 06:32:33 -0700 (PDT)
Message-ID: <1298a33e-b602-4887-86a7-cb69cdaa6311@suse.com>
Date: Tue, 24 Jun 2025 15:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] pdx: provide a unified set of unit functions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-4-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -255,6 +255,10 @@ void __init init_pdx(void)
>  {
>      const struct membanks *mem = bootinfo_get_mem();
>      paddr_t bank_start, bank_size, bank_end;
> +    unsigned int bank;
> +
> +    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
>  
>      /*
>       * Arm does not have any restrictions on the bits to compress. Pass 0 to
> @@ -263,28 +267,24 @@ void __init init_pdx(void)
>       * If the logic changes in pfn_pdx_hole_setup we might have to
>       * update this function too.
>       */
> -    uint64_t mask = pdx_init_mask(0x0);
> -    int bank;
> +    pfn_pdx_compression_setup(0);
>  
>      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>      {
> -        bank_start = mem->bank[bank].start;
> -        bank_size = mem->bank[bank].size;
> -
> -        mask |= bank_start | pdx_region_mask(bank_start, bank_size);
> -    }
> -
> -    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> -    {
> -        bank_start = mem->bank[bank].start;
> -        bank_size = mem->bank[bank].size;
> -
> -        if (~mask & pdx_region_mask(bank_start, bank_size))
> -            mask = 0;
> +        if ( !pdx_is_region_compressible(mem->bank[bank].start,
> +                 PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
> +                 PFN_DOWN(mem->bank[bank].start)) )

Nit: This, according to my understanding, is an "impossible" style. It wants
to either be

        if ( !pdx_is_region_compressible(
                  mem->bank[bank].start,
                  PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
                  PFN_DOWN(mem->bank[bank].start)) )

or ...

> +        {
> +            pfn_pdx_compression_reset();
> +            printk(XENLOG_WARNING
> +                   "PFN compression disabled, RAM region [%#" PRIpaddr ", %#"
> +                   PRIpaddr "] not covered\n",
> +                   mem->bank[bank].start,
> +                   mem->bank[bank].start + mem->bank[bank].size - 1);

... like this. But it's not written down anywhere, so I guess I shouldn't
insist.

And then - isn't the use of PFN_UP() and PFN_DOWN() the wrong way round?
Partial pages aren't usable anyway, so the smaller range is what matters
for every individual bank. However, for two contiguous banks (no idea
whether Arm would fold such into a single one, like we do with same-type
E820 regions on x86) this gets more complicated then.

> @@ -299,19 +295,29 @@ void __init srat_parse_regions(paddr_t addr)
>  
>  	/* Set "PXM" as early as feasible. */
>  	numa_fw_nid_name = "PXM";
> -	srat_region_mask = pdx_init_mask(addr);
>  	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
>  			      srat_parse_region, 0);
>  
> -	for (mask = srat_region_mask, i = 0; mask && i < e820.nr_map; i++) {
> +	pfn_pdx_compression_setup(addr);
> +
> +	/* Ensure all RAM ranges in the e820 are covered. */
> +	for (i = 0; i < e820.nr_map; i++) {
>  		if (e820.map[i].type != E820_RAM)
>  			continue;
>  
> -		if (~mask & pdx_region_mask(e820.map[i].addr, e820.map[i].size))
> -			mask = 0;
> +		if (!pdx_is_region_compressible(e820.map[i].addr,
> +		    PFN_UP(e820.map[i].addr + e820.map[i].size) -
> +		    PFN_DOWN(e820.map[i].addr)))

Indentation is off here in any event, i.e. irrespective of my earlier
remark.

> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -19,6 +19,7 @@
>  #include <xen/mm.h>
>  #include <xen/bitops.h>
>  #include <xen/nospec.h>
> +#include <xen/pfn.h>
>  #include <xen/sections.h>
>  
>  /**
> @@ -55,6 +56,44 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
>          __set_bit(idx, pdx_group_valid);
>  }
>  
> +#ifndef CONFIG_PDX_NONE
> +
> +#ifdef CONFIG_X86
> +# include <asm/e820.h>
> +# define MAX_PFN_RANGES E820MAX
> +#elif defined(CONFIG_HAS_DEVICE_TREE)
> +# include <xen/bootfdt.h>
> +# define MAX_PFN_RANGES NR_MEM_BANKS
> +#endif
> +
> +#ifndef MAX_PFN_RANGES
> +# error "Missing architecture maximum number of RAM ranges"
> +#endif
> +
> +/* Generic PFN compression helpers. */
> +static struct pfn_range {
> +    unsigned long base, size;
> +} ranges[MAX_PFN_RANGES] __initdata;
> +static unsigned int __initdata nr_ranges;
> +
> +void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
> +{
> +    if ( !size )
> +        return;
> +
> +    if ( nr_ranges >= ARRAY_SIZE(ranges) )
> +    {
> +        ASSERT((nr_ranges + 1) > nr_ranges);

This looks overly pessimistic to me. (I won't outright insist on its removal,
though.)

> +        nr_ranges++;

This requires pretty careful use of the variable as an upper bound of loops.
It's fine in pfn_pdx_compression_setup(), but it feels a little risky.

Jan

