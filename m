Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC88A35D01
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 12:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888748.1298049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiuFn-0001NV-U6; Fri, 14 Feb 2025 11:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888748.1298049; Fri, 14 Feb 2025 11:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiuFn-0001LX-Q1; Fri, 14 Feb 2025 11:53:07 +0000
Received: by outflank-mailman (input) for mailman id 888748;
 Fri, 14 Feb 2025 11:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiuFm-0001LR-IB
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 11:53:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f4ff3d6-eaca-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 12:53:03 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so296035366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 03:53:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532580c5sm330524966b.56.2025.02.14.03.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 03:53:02 -0800 (PST)
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
X-Inumbo-ID: 3f4ff3d6-eaca-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739533983; x=1740138783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7JABtyg2sNeFLHUdM97QnSZiuyZWAu9WFaVIDHmlQ48=;
        b=RPpWhjEi6Ge4zDA0sCWP3lSugA6iKrtXxCj34xmj9s82vk37qviRIbeRVKjMuA/n+c
         NQJFnJG5c7vUFJa2VscNwXROJzjRJ8Vk+KCH1iPG5KaFUzocxgrGzScxHfS74FaWhS6x
         w9DLk1eGJhySYAzIbY+GwhSUYn3P9z2Ie2aUKnAbk6QDKLQBUy7n4e0UXSxQVk1OyzwJ
         iN9NLypd7MaFLYquyKU9JLb1auQgTtSOOcQZyNT3PXWVBszu3HamwtXPfCQf5G/fHBV+
         rYHLHsOmEXKShouWNOoY/bVjDDmE6et0JuQkTsjB/O5iwfpv/LzqMixX1PPZqwo/zC8D
         7Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533983; x=1740138783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JABtyg2sNeFLHUdM97QnSZiuyZWAu9WFaVIDHmlQ48=;
        b=V5uy2/Jnb7W2e/b2FsKU8pBQLZoEoKyBjJv8f5qK1uxH5DcyR2Rj2bTKDxdFK/JdXf
         kSX3IVVZdE4cYstzhJI7e6Lk2f1Smdp3rMOJdB9s9tEejJLoFA9TKK3YXX57TtkCayI3
         KFDMdVXiBwH0qhlUH0+V7a9a/H0HlMflWeRmOBROeeSVqD+qvQuwK/AXsOUZn1lerNbx
         rz8U50hSSB0he2Co74BkWr1RWe7oxp9ZtQEIQNCOSRkSoBrv2yIVnsjh/fyr0g8s41GT
         EiYnAqKAZZ+L5HViOYd4tGxXCk8V9q04PFD6FPTVArIz53i2wldg9HjYxw8ZHF7L/qon
         Nu7w==
X-Forwarded-Encrypted: i=1; AJvYcCU0IYcFqraB4pmoq8JYf+2MwJbB7qL8IOdDT4ENMeELqEfE8694jSFdsPMYPOoqN9RRrVuqksWOoLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWtw14YKMvnESBXEC5cZgCJ7Xi+sLJTKIc1VtR/x4BiTMSquJ3
	aE/jLdmmugiEHlYly2cfQ5B0KBvVbcVjhiVu6jeyksGbC1ZJlPDVxV/wnadFTg==
X-Gm-Gg: ASbGncsGmJKyR5yUUjhOp8jXmPKkFbcZqyEe5xSuB2MDocWNr9K2wH+afJVyE63TAvM
	/vuWUp2t143rVNNVHmMNKoSmbnJfnfvWHTejV3sMyQz2QAwdjhb080e5YwMILO4NgYRq+IcySNS
	KvoU5iFX14fxlJIwJRB/sBLdP9jgH0ZIbxW6/U4VluZshR62qeTI0Mo4LTKAXjFMINDUbVcv1ZR
	Z4ZsN5fbj+UrKa6bVAbVY6g10/Jj7yagPNyiuoz9iU1Ojh54bxCN3ROnMs7ghOdz2IYa/M3GkaQ
	5UziUU46IAVWMowh10/M1shtvY7h414rDc/qoeVAsjMhpEDFCNI6jnfslvYJ9SlxxuGoCyqGbfd
	6
X-Google-Smtp-Source: AGHT+IF+ULH71N96SLDxp/kwqP9kVAL4k7i+8djepR+WcbWpfTEAwBKzCF3u5Tm0TXSBV09o4TrA5w==
X-Received: by 2002:a17:907:3fa2:b0:ab7:5b58:f467 with SMTP id a640c23a62f3a-ab7f347aa6cmr1186922266b.40.1739533983275;
        Fri, 14 Feb 2025 03:53:03 -0800 (PST)
Message-ID: <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>
Date: Fri, 14 Feb 2025 12:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-3-roger.pau@citrix.com>
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
In-Reply-To: <20250214092928.28932-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2025 10:29, Roger Pau Monne wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -822,7 +822,8 @@ Specify the bit width of the DMA heap.
>  
>  ### dom0
>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
> +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
> +                pf-fixup=<bool> ] (x86)
>  
>      = List of [ sve=<integer> ] (Arm64)
>  
> @@ -883,6 +884,19 @@ Controls for how dom0 is constructed on x86 systems.
>  
>      If using this option is necessary to fix an issue, please report a bug.
>  
> +*   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
> +    defaults to false.
> +
> +    When running dom0 in PVH mode the dom0 kernel has no way to map MMIO
> +    regions into the p2m, such mode relies on Xen dom0 builder populating
> +    the p2m with all MMIO regions that dom0 should access.  However Xen
> +    doesn't have a complete picture of the host memory map, due to not
> +    being able to process ACPI dynamic tables.
> +
> +    The `pf-fixup` option allows Xen to attempt to add missing MMIO regions
> +    to the p2m in response to page-faults generated by dom0 trying to access
> +    unpopulated entries in the p2m.

I wonder if this is to implementation focused for a command line option doc.
In particular the multiple uses of "p2m" are standing out in this regard.

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -286,6 +286,10 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>          opt_dom0_cpuid_faulting = val;
>      else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
>          opt_dom0_msr_relaxed = val;
> +#ifdef CONFIG_HVM
> +    else if ( (val = parse_boolean("pf-fixup", s, e)) >= 0 )
> +        opt_dom0_pf_fixup = val;
> +#endif
>      else
>          return -EINVAL;

I fear the scope of these sub-options is getting increasingly confusing.
opt_dom0_msr_relaxed is what its name says - specific to Dom0.
opt_dom0_cpuid_faulting, otoh, is a control domain option (i.e. also
applicable to a [hypothetical?] late ctrldom). Now you add an option
that's applicable to the hardware domain, i.e. also coverting late-hwdom.

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -338,8 +338,38 @@ static int hvmemul_do_io(
>          if ( !s )
>          {
>              if ( is_mmio && is_hardware_domain(currd) )
> -                gdprintk(XENLOG_DEBUG, "unhandled memory %s to %#lx size %u\n",
> -                         dir ? "read" : "write", addr, size);
> +            {
> +                /*
> +                 * PVH dom0 is likely missing MMIO mappings on the p2m, due to
> +                 * the incomplete information Xen has about the memory layout.
> +                 *
> +                 * Either print a message to note dom0 attempted to access an
> +                 * unpopulated GPA, or try to fixup the p2m by creating an
> +                 * identity mapping for the faulting GPA.
> +                 */
> +                if ( opt_dom0_pf_fixup )
> +                {
> +                    int inner_rc = hvm_hwdom_fixup_p2m(addr);

Why not use rc, as we do elsewhere in the function?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -13,6 +13,7 @@
>  #include <xen/lib.h>
>  #include <xen/trace.h>
>  #include <xen/sched.h>
> +#include <xen/iocap.h>
>  #include <xen/irq.h>
>  #include <xen/softirq.h>
>  #include <xen/domain.h>
> @@ -5458,6 +5459,36 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
>      return rc;
>  }
>  
> +bool __ro_after_init opt_dom0_pf_fixup;
> +int hvm_hwdom_fixup_p2m(paddr_t addr)

The placement here looks odd to me. Why not as static function in emulate.c?
Or alternatively why not as p2m_hwdom_fixup() in mm/p2m.c?

> +{
> +    unsigned long gfn = paddr_to_pfn(addr);
> +    struct domain *currd = current->domain;
> +    p2m_type_t type;
> +    mfn_t mfn;
> +    int rc;
> +
> +    ASSERT(is_hardware_domain(currd));
> +    ASSERT(!altp2m_active(currd));
> +
> +    /*
> +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
> +     * having identity mappings for non RAM regions (gfn == mfn).
> +     */
> +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
> +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
> +        return -EPERM;
> +
> +    mfn = get_gfn(currd, gfn, &type);
> +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
> +        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;

I understand this is to cover the case where two vCPU-s access the same GFN
at about the same time. However, the "success" log message at the call site
being debug-only means we may be silently hiding bugs in release builds, if
e.g. we get here despite the GFN having had an identity mapping already for
ages.

Jan

