Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F714B1D50B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 11:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072740.1435712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujx9t-0004CC-E0; Thu, 07 Aug 2025 09:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072740.1435712; Thu, 07 Aug 2025 09:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujx9t-0004AQ-BC; Thu, 07 Aug 2025 09:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1072740;
 Thu, 07 Aug 2025 09:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujx9r-0004AK-Lf
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 09:43:35 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbb57afe-7372-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 11:43:33 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-af95b919093so118442266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 02:43:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91b36e91dsm1235169866b.69.2025.08.07.02.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 02:43:32 -0700 (PDT)
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
X-Inumbo-ID: fbb57afe-7372-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754559813; x=1755164613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r7HxzkHM/6mjtutbbGzIGlGLhAzJGyChLqesKE+8b/w=;
        b=bz868xRGtlIeL5p9tsovk5ScCCZoL1w4Q/a6s4PP160VfBNdX+L1RsTIsWD6O3ONnm
         dIfSnnG1Lp6nto/9jOAbfT5S0bDKJIjYRSwmdZXTzCCfYhO4OMGMdo7c1uQhCsriGOth
         7F3Dr7tjVIS6hzKt6wtQ3WAI5Xdkv1QZLP5xg+K9xXxvrhxjJxVYsGqVpcyhVoZuNmJU
         +arUl77qMkQUzFqZQM9MWfqjnK+rRoyaoHQhZUj5M49cCrin4rY9cxvTUILeY9JE6t1c
         s7B+mHs4f4CNamp7NB0ZE/FZjKaDViqhsWHpk6oxZUKKk0JuCc7wjJxUixvLfNPPrI55
         Hufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754559813; x=1755164613;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7HxzkHM/6mjtutbbGzIGlGLhAzJGyChLqesKE+8b/w=;
        b=PcLG79TU2wcGXYl8owGyIe0fYPD9Q5A1JWr5V+Al6lETGCMkzMeZ30Kfcj5l7J138S
         JKep901kPk9YaoXkLpTFGfh1wp8QvhP6P+RZuEXK4pBz+Aqyz4b/XpftGZ3a1xEWSUi6
         GSe8C/P3/bue19HrvA7xS1y9VRv5hk+bP70yq6wsocvqff11QSfbKU32+4+VXsjb8pIG
         mF14GrpR6RSUsh+dn87QJCeS+A0EF4OEz/AXcntMNi22dy66nyZ87+HRNJYlvjl6++8C
         5rhJCmA9HMPGO8vacm8snIYne9v7nsD6JCqEzJwFER2+7C3Wy7k7PANsEOl/pQ6+tC9H
         f4Kw==
X-Gm-Message-State: AOJu0YxJN13pLXBuhYxzBXPhQO9Mng4KOg1O/yasvEolF0SmDlSDMS4F
	R9MXful2ELZtzLrNa4h4Oj7GIkQQfGyOZ8G+8+K9KczL4POTK41kvtt05zYwEt1dorPI+RBbXCK
	9KRs=
X-Gm-Gg: ASbGnctOSx6aP9FEQAngxjjZiwgZnOb3HpONHXQIqw7XAh6fCS4aBJl0ogfFLCN/D+v
	uZ54uhcnVdQ3BDXtSszrlleUXTmxWHMhzwnugTEc56nJVLPO7QKSitj5yM6ACqq6/Y6vXzcC4RX
	wA0vEID1Mq0+LQSPMSlvjetgs8GHwUJLpl/t5QJaGSHjK06U3pYd5f6LNuyLLDp9j60zqq+x1Bm
	k2k/7UneAOAM8qkvqCba4nWuvDq1sKorsG2ulNl4HWjHkkfA3NNci4WA+xiq82BsLj0wVSwj9yK
	7yoxsQ52lgmrVZjMtRu7f9AE8rRcT5QIBlSc4UXU9rmA0oNAzzDk0g19E1DLxOGlaRE+HYrzDjA
	eAbFBWPKVAgBiQGL1ORmC4KLPg9+DLU7NZLdtS6AwClMYJxOzTWPmq99kxecfhxjahjAubwM6yT
	DFIP34kDk=
X-Google-Smtp-Source: AGHT+IH39RhhH+a3wLByT/fjVJCvMh+dCpwvRJGVCJj+kpcHZOF4rQXYJRt3nTf6E9hTUyI73oVHVA==
X-Received: by 2002:a17:906:fe0b:b0:ae3:bb0a:1ccd with SMTP id a640c23a62f3a-af99032e2bdmr564395866b.26.1754559812916;
        Thu, 07 Aug 2025 02:43:32 -0700 (PDT)
Message-ID: <5f00736f-2f3f-43a3-b9da-5e0e704a64f1@suse.com>
Date: Thu, 7 Aug 2025 11:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/mm: split unmapping and marking-as-I/O in
 arch_init_memory()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cb3eea3a-bd7a-441b-8bd8-eeabad7ae52c@suse.com>
Content-Language: en-US
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
In-Reply-To: <cb3eea3a-bd7a-441b-8bd8-eeabad7ae52c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 11:37, Jan Beulich wrote:
> The unmapping part also wants to cover UNUSABLE regions, and it will now
> be necessary for space outside the low 16Mb (wherever Xen is placed).
> 
> While there, limit the scopes of involved variables.
> 
> Fixes: e4dd91ea85a3 ("x86: Ensure RAM holes really are not mapped in Xen's ongoing 1:1 physmap")
> Fixes: 7cd7f2f5e116 ("x86/boot: Remove the preconstructed low 16M superpage mappings")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Originally I had the unmap cover the entire range up to 4Gb, which made
> this ACPI mapping issue more pronounced: Mappings done by
> acpi_dmar_init(), erst_init(), and acpi_hest_init() may wrongly be
> undone this way. Having limited things to the initial mapping range, the
> risk of an overlap with some area which needs to remain mapped is lower,
> but it's not gone.
> 
> As the excess mappings could, at least in principle, also cause other
> issues (like mapping a range WB which must strictly be non-cachable), I
> wonder whether we can actually get away with those excess mappings,
> despite properly tearing them down in arch_init_memory() (directmap) and
> __start_xen() (Xen image space). Options would appear to be to move
> _end[] to a 2Mb aligned boundary (or at least extend the PT_LOAD segment
> to end at the next 2Mb boundary), or to use 4k mappings for the tail
> part of .bss. That would then also eliminate the remaining concern here.
> 
> Extending the PT_LOAD segment (in mkelf32) would apparently allow to do
> away with the hackery introduced by 773ded42218d ("Move cpu0_stack out
> of Xen text section and into BSS"), to "work around" a supposed linker
> bug (which really was a bug in the linker script imo). The extra command
> line argument then wouldn't be needed anymore.

Thinking about it, this would then also simplify ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -275,8 +275,6 @@ static void __init assign_io_page(struct
>  
>  void __init arch_init_memory(void)
>  {
> -    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
> -
>      /*
>       * Basic guest-accessible flags:
>       *   PRESENT, R/W, USER, A/D, AVAIL[0,1,2], AVAIL_HIGH, NX (if available).
> @@ -292,12 +290,55 @@ void __init arch_init_memory(void)
>       * case the low 1MB.
>       */
>      BUG_ON(pvh_boot && trampoline_phys != 0x1000);
> -    for ( i = 0; i < 0x100; i++ )
> +    for ( unsigned int i = 0; i < MB(1) >> PAGE_SHIFT; i++ )
>          assign_io_page(mfn_to_page(_mfn(i)));
>  
> -    /* Any areas not specified as RAM by the e820 map are considered I/O. */
> -    for ( i = 0, pfn = 0; pfn < max_page; i++ )
> +    /*
> +     * Any areas not specified as RAM by the e820 map want to have no mappings.
> +     * We may have established some by mapping more than necessary in head.S,
> +     * due to the use of super-pages there.
> +     */
> +    for ( unsigned long i = 0, pfn = 0,
> +                        rlimit_pfn = PFN_DOWN(PAGE_ALIGN_2M(__pa(_end)));
> +          pfn < rlimit_pfn; i++ )
>      {
> +        unsigned long rstart_pfn, rend_pfn, start_pfn;
> +
> +        while ( i < e820.nr_map &&
> +                e820.map[i].type != E820_RAM )
> +            i++;
> +
> +        if ( i >= e820.nr_map )
> +        {
> +            /* No more RAM regions: Unmap right to upper boundary. */
> +            rstart_pfn = rend_pfn = rlimit_pfn;
> +        }
> +        else
> +        {
> +            /* Unmap just up as far as next RAM region. */
> +            rstart_pfn = min(rlimit_pfn, PFN_UP(e820.map[i].addr));
> +            rend_pfn   = max(rstart_pfn,
> +                             PFN_DOWN(e820.map[i].addr + e820.map[i].size));
> +        }
> +
> +        /* NB: _start is already 2Mb-aligned. */
> +        start_pfn = max(pfn, PFN_DOWN(__pa(_start)));
> +        if ( start_pfn < rstart_pfn )
> +            destroy_xen_mappings((unsigned long)mfn_to_virt(start_pfn),
> +                                 (unsigned long)mfn_to_virt(rstart_pfn));
> +
> +        /* Skip the RAM region. */
> +        pfn = rend_pfn;
> +    }

... this: If we're loaded in an area that's a multiple of 2Mb in size (and
2Mb aligned), we wouldn't need to walk the E820 map anymore. The boot loader
(or whatever else) must have placed the entire image inside a RAM region.
Hence we could simply unmap [PAGE_ALIGN_4K(_end), PAGE_ALIGN_2M(_end)),
outside of any loop.

Jan

