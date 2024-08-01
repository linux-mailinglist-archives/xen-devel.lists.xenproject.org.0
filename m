Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75CF94494E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 12:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769542.1180435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZT2x-0004oH-MU; Thu, 01 Aug 2024 10:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769542.1180435; Thu, 01 Aug 2024 10:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZT2x-0004m6-Iq; Thu, 01 Aug 2024 10:28:35 +0000
Received: by outflank-mailman (input) for mailman id 769542;
 Thu, 01 Aug 2024 10:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZT2w-0004m0-7w
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 10:28:34 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccf2c4f2-4ff0-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 12:28:32 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5b01af9b0c9so5845379a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 03:28:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b6e1ab07dasm1037129a12.63.2024.08.01.03.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 03:28:07 -0700 (PDT)
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
X-Inumbo-ID: ccf2c4f2-4ff0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722508112; x=1723112912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0AVnc1WK7lO1o0tpjFVWEbgzYm93TD3A4f2NoYNit5I=;
        b=CuqPvICeBa1X1W8SgJT4WS9qKRskxRyaG+m5i8k1Ht+rtrjxeau5CNuLPj3kAqLqMh
         uY520AbT3VmMOTMQ+Xku7FE0olg1HexHA8FDoipHkRqyqgC4Bfv5BgIGeyf/oalcBpyq
         47LijYVDHMD/oksVPiAgeQocTO26x7CgCYS+oZkT194llmioF5/LQyTENSfolwnELEHd
         21kDnbRt3sZX2mtLsvmJgVTdUo+nGgMMAX6Y3OrGEGXM8+hTZYDobfghLmqqJ5AceLob
         bthdLCKhtbBPLYy9hmDFAPn3hmzf0Qz8u23mXtV7dRcShH0NykArxt3X0BM9txD2Mnf8
         W0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722508112; x=1723112912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AVnc1WK7lO1o0tpjFVWEbgzYm93TD3A4f2NoYNit5I=;
        b=b+jlIyCloKJkJgbXd0e+ZgmZEXh5GgSFRBcn07iYZgi9ZIHOMcj/Vl65zf1bB+fGkW
         JyZRvp7pQXAE1UlAxDelxBsh1Ggiz/ClbLhwh/FNtiZbl25KwhYgJZ7ftBUzKP3J5aR1
         +sgFdP1VZXhH6iNeixkrWRe0mjwkPlWF7QEQRhCnaFpMFABiiqMwFq1USL6C6e7TBry2
         QKlvSfDEymaedjtBoQhoxd5fibylRAVAdHeaL3M1IQm5Un2hf+xtItWJQ7B11SpX4o7y
         YYiO/peCjGedzvuRTiGEB8eJqp8QQs+HHl4Ev6PAPqzm1jBmosmQ0pF187sW8tbh16Nj
         IFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh3p57tgLJ2cWo6r4lbo5XIkpXYjJEWADNBW4Uq6B47a1jK9c911kWALHtJDgkLtaPkvxqYKB0ct5ZbGwPL3ufeDFmoEudN9uQ5Ste8Jk=
X-Gm-Message-State: AOJu0YxXe4B1EyeBHeb7YaTTi2P3v3/QhN9DTWLKZl+MwZj7cEbnwZk4
	NsUc88CJBx/gBB4m/O2FR89qPMppaC2V0IVYwUrTf4oNQOufdaSkdP5cza7Uqw==
X-Google-Smtp-Source: AGHT+IHRjQo+RGRLGWi6m7uyNkPJwzf+Co+rIIBmT+5iedQ/k/iNANEQnp/RkwXdJ/Id900TF4FQVg==
X-Received: by 2002:aa7:c690:0:b0:57c:6d1c:3cee with SMTP id 4fb4d7f45d1cf-5b6fed0b757mr1497875a12.14.1722508087592;
        Thu, 01 Aug 2024 03:28:07 -0700 (PDT)
Message-ID: <988147f4-3de2-4aae-99cc-7d0ba48b158f@suse.com>
Date: Thu, 1 Aug 2024 12:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/dom0: delay setting SMAP after dom0 build is done
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240801095201.91180-1-roger.pau@citrix.com>
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
In-Reply-To: <20240801095201.91180-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2024 11:52, Roger Pau Monne wrote:
> @@ -1907,16 +1890,25 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      if ( cpu_has_smep && opt_smep != SMEP_HVM_ONLY )
>          setup_force_cpu_cap(X86_FEATURE_XEN_SMEP);
>      if ( boot_cpu_has(X86_FEATURE_XEN_SMEP) )
> +    {
>          set_in_cr4(X86_CR4_SMEP);
> +        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;

Could be just "cr4_pv32_mask = X86_CR4_SMEP" now?

> +    }
>  
>      if ( !opt_smap )
>          setup_clear_cpu_cap(X86_FEATURE_SMAP);
>      if ( cpu_has_smap && opt_smap != SMAP_HVM_ONLY )
>          setup_force_cpu_cap(X86_FEATURE_XEN_SMAP);
>      if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> -        set_in_cr4(X86_CR4_SMAP);
> -
> -    cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> +        /*
> +         * Set SMAP on the %cr4 mask so that it's set for APs on bringup, but
> +         * don't set for the BSP until domain building is done.
> +         *
> +         * Don't set it in cr4_pv32_mask either, until it's also set on the
> +         * BSP.  Otherwise the BUG in cr4_pv32_restore would trigger for events
> +         * received on the BSP.
> +         */
> +        mmu_cr4_features |= X86_CR4_SMAP;

Don't you put APs at risk this way of triggering the BUG in cr4_pv32_restore()?
They'll have the bit set in %cr4, but the bit remains clear in cr4_pv32_mask
until much later.

> @@ -2048,6 +2040,18 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      if ( !dom0 )
>          panic("Could not set up DOM0 guest OS\n");
>  
> +    /*
> +     * Enable SMAP only after being done with the domain building phase, as the
> +     * PV builder switches to the domain page-tables and must be run with SMAP
> +     * disabled.
> +     */
> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +    {
> +        ASSERT(mmu_cr4_features & X86_CR4_SMAP);
> +        write_cr4(read_cr4() | X86_CR4_SMAP);
> +        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> +    }

Similarly for the BSP here: If we take an NMI between setting CR4.SMAP and
setting the bit in cr4_pv32_mask, cr4_pv32_restore() would hit the BUG
there if I'm not mistaken. I further fear that switching things around won't
help either. The code you remove from create_dom0() looks to have the same
issue. The only NMI-safe sequence looks to be: Clear both bits from %cr4,
update cr4_pv32_mask as wanted, and then write %cr4 with the bits from
cr4_pv32_mask ORed in.

Jan

