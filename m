Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC6E9623EA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784609.1194003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFJ2-0004k3-Tb; Wed, 28 Aug 2024 09:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784609.1194003; Wed, 28 Aug 2024 09:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjFJ2-0004iV-Pv; Wed, 28 Aug 2024 09:49:36 +0000
Received: by outflank-mailman (input) for mailman id 784609;
 Wed, 28 Aug 2024 09:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjFJ1-0003hI-NP
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:49:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5165d79-6522-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 11:49:35 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a86fa3dea99so81388366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:49:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb21567fsm2048281a12.58.2024.08.28.02.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:49:34 -0700 (PDT)
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
X-Inumbo-ID: d5165d79-6522-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724838574; x=1725443374; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ5VyFfuoROWlAKrL/oBSeIt9ZGH4XcNI1AU7gV88z4=;
        b=BxYEaOiqHG05L3hSbWyZygdN3/qByIXersIv3YeEBo1/hanPrXIGt7tF7RgipH+PR9
         icoutT/wiWaQm060KVhawPiKFDecEaqMIR7mXH+sHtgHOFtE6D//Rryou4NgiZnZ5RAM
         TKp7TZOjQax3QyXrR4hmxbpr9vDrIpcnB1czENTGH7A4r443llmrAJrEquIbIF2crYLT
         Umi/molJegUhiJyINzFonbjkIcoHAl1SFNbw60Sji/tUpGWwiFUhnynVWSJ8DnO5rKuK
         CufX349wB8kLQ9da9XRY29NJA0AwabqxECzW7Clo7X3GwupGIl6+Ni4CMXvahzEwUgTd
         dubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724838574; x=1725443374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ5VyFfuoROWlAKrL/oBSeIt9ZGH4XcNI1AU7gV88z4=;
        b=eoTaKLO2YCjUg7PrQgWe2YWjDBbg+dU8v4PDkaDOHt6+iM4LXkHUG4UndgnWHpgfd7
         nD1UITczUGqW+GcNdohqqKp0cHQFYYsGNz7KyJJJyjLv+1ULdnTtxFKF2CzO1C9OxCDW
         +UKSL6NREFNc5ilcnMuOq0odR8rDBp2++cGk9H5XVJCBc6DWsu1w8QuxA9AjH1GwUaOy
         lNKSZ69Gu2ECLR1Y8Gwrqx32iBm4OIR8vydUz4TynLrrozfHqgJK6ro+nRz5s5E6oIGV
         Qdw4O8YqLEuB3klscLQYaiXa48p+DY7UUnP01+YhrBtXWzZV136nf8myuP3uxX6wkrIR
         UPMw==
X-Gm-Message-State: AOJu0YxMduy+YJ0V8TJz+WVpj3lc2+aEYFaFBXebuJBtsBQmt8RMEcxj
	pDd/GYXrWbsWnpdD6YXb38LJs+8tsOK6Yjft7nnne2Z5/BO3zstv/2gmcRo08A==
X-Google-Smtp-Source: AGHT+IEU9RBxYC2SjGdEBpH/Fgaq1zKalGXwNAbEJfZ/EGvM61plEAXIl2qnZ9yOhrn+TAYVtkvWbA==
X-Received: by 2002:a05:6402:2711:b0:5be:dab8:1bb3 with SMTP id 4fb4d7f45d1cf-5c0891692b1mr13558576a12.13.1724838574453;
        Wed, 28 Aug 2024 02:49:34 -0700 (PDT)
Message-ID: <77276161-2fcc-4527-87ba-0ef5988ff82a@suse.com>
Date: Wed, 28 Aug 2024 11:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240827123949.24400-1-roger.pau@citrix.com>
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
In-Reply-To: <20240827123949.24400-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2024 14:39, Roger Pau Monne wrote:
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
>      if ( is_hvm_domain(d) )
>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>      else if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
> +         * construct_dom0().  This saves a large number of corner cases
> +         * interactions with copy_from_user().
> +         */
> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +        {
> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
> +        }
>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +        {
> +            write_cr4(read_cr4() | X86_CR4_SMAP);
> +            cr4_pv32_mask |= X86_CR4_SMAP;
> +        }
> +    }

Andrew, looking at this code I really wonder what benefit you request to
move this further is going to have. Afaict no matter where we put it, it'll
be an #ifdef around each of the two accesses to cr4_pv32_mask when we make
that variable CONFIG_PV32-only.

> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -64,6 +64,8 @@ extern bool opt_dom0_verbose;
>  extern bool opt_dom0_cpuid_faulting;
>  extern bool opt_dom0_msr_relaxed;
>  
> +extern unsigned long cr4_pv32_mask;

With this ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -80,7 +80,7 @@ int8_t __initdata opt_probe_port_aliases = -1;
>  boolean_param("probe-port-aliases", opt_probe_port_aliases);
>  
>  /* Only used in asm code and within this source file */
> -unsigned long asmlinkage __read_mostly cr4_pv32_mask;
> +unsigned long asmlinkage __ro_after_init cr4_pv32_mask;

... both the comment and the asmlinkage become stale now.

Jan

