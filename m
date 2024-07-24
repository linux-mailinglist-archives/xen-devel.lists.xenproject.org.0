Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D593AD35
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 09:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763816.1174141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWW8-0006cP-3p; Wed, 24 Jul 2024 07:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763816.1174141; Wed, 24 Jul 2024 07:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWW8-0006Zo-0T; Wed, 24 Jul 2024 07:34:32 +0000
Received: by outflank-mailman (input) for mailman id 763816;
 Wed, 24 Jul 2024 07:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWWW6-0006Zi-Ed
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 07:34:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28662c5c-498f-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 09:34:28 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so77389166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 00:34:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa6fea966sm87050266b.223.2024.07.24.00.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:34:27 -0700 (PDT)
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
X-Inumbo-ID: 28662c5c-498f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721806468; x=1722411268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lxpbdfCGrMS+HlYf5Z3VNQfjy8P76FtTN33whdHa8dw=;
        b=A1eQ+2Q65IpzW/7K85kUDtmnNGkgpbTjME/kCiXV4yMDqkpZCt9o5ODdZVbJBtZrx/
         IcIp8MujF4q3VnFYQEZxpj8vMZNpV/3GJyBJLw9PtZhdpLjoZsgsGlDYfCj/A7BgkFpy
         tyUiiqPfbC/CT1I9LoM1a3uV34qZ9gyKKu+Ou7oQZ8AW+iMrZYiY6lXNAOUrByTUsx2v
         0ZRnryD9F4ot0NXA/T2eLcwh2/nzOBjS+JdJ9QrjkB1FQTbuDMjUrKD3v5yHE4Sfk0kj
         6TxjVKSCyGE0BIR9QxTKq4MzXYGnp6Vq24x7HLu5eGT7Sgqt+rAujbYI/5Mwuj8CIKMc
         qGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721806468; x=1722411268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxpbdfCGrMS+HlYf5Z3VNQfjy8P76FtTN33whdHa8dw=;
        b=s1FCaZ/Kab117kx7WjQRlfpdnhkO1cZiR962/V/LPcoa952S0xrP2s//JcniJVKJBg
         52EDNJVA2y2FuDwelEn//+MhRki58I0nOYhq55OnE0c1UWhoBLF+ovyx4RysmwLBNMG7
         BEGMMIF5f3mXMAjY/tWgGG1Dj0b+6V5/rPdFbWs6AQcwdfGz7qFwQlbKrmthykaDZe4R
         2ykbZ5pRH7hCvvlHvB595ZmrAiQfY7EjWLkjNOuUkvn1ikmaCj0SRRFIiJSluWtgECgx
         7NhxN3N8twLZqyvSkTf38AG7RK/+TV1yjRzkQIvtGcFxWJRd8qxesfmjLbCC7wBrLZoV
         ITdg==
X-Forwarded-Encrypted: i=1; AJvYcCXwwAKjcdWpiP6fsYGO9+D0qMsjERt5wpIK7g7PTka1nu8fPAhaW61t2Y7OCETOVLaTC6sOPxL1R7bZe3oB3DS/C1AHlkuvedg6EjV8YjE=
X-Gm-Message-State: AOJu0Yy4ELRyvYti6W+NwDAQnkyfRHCyjP6RtOZrH/jXej8IJFTXPGIZ
	EyQ9fuoT4dJhGsO92xPvY75BCqC8xnk/I49yP5ceve9axDcPAJijXRWwJj7EZP6hAjdkvayzKCs
	=
X-Google-Smtp-Source: AGHT+IHLC//ja0oYDuCPMPVQjT1GF9VodgJK3ZRfQNCYjo/3hgq+W37PxJnF9kXrTBkxfCL2XkZb8w==
X-Received: by 2002:a17:907:97c2:b0:a77:bfca:da53 with SMTP id a640c23a62f3a-a7a4c06a5f6mr949669866b.30.1721806467692;
        Wed, 24 Jul 2024 00:34:27 -0700 (PDT)
Message-ID: <f88005d5-8c1f-4060-b3b4-7f88d8c42725@suse.com>
Date: Wed, 24 Jul 2024 09:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/printk: Avoid the use of L as a length modifier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723174129.67911-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240723174129.67911-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 19:41, Andrew Cooper wrote:
> Coverity complains about it being invalid.  It turns out that it is a GCC-ism
> to treat ll and L equivalently.  C99 only permits L to mean long double.
> 
> Convert all uses of L in to alternatives, either l, ll or PRI.64 depending on
> the operand type.  This in turn removes some unnecessary casts which look to
> predate us having correct PRI* constants.

I'm certainly okay with switching to PRI.64 where appropriate. Switching to ll,
however, means longer string literals for no really good reason. We use all
sorts of GCC / GNU extensions; I don't see why we shouldn't be permitted to
also use this one. It's Coverity that wants to cope, imo.

Or, if we really meant to no longer use L, support for it should then imo also
be purged from vsnprintf().

> I'm disappointed at having to use %ll for __fix_to_virt() in apic.c and
> io_apic.c.  The expression ends up ULL because of the GB(64) in VMAP_VIRT_END,
> but can't really be changed without breaking 32bit builds of Xen.
> 
> One option might be to turn __fix_to_virt() into a proper function, but
> there's a lot of that infrastructure which should be dedup'd and not left to
> each arch to copy.

Maybe it doesn't need us going that far, as ...

> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -938,7 +938,7 @@ void __init init_apic_mappings(void)
>          apic_phys = mp_lapic_addr;
>  
>      set_fixmap_nocache(FIX_APIC_BASE, apic_phys);
> -    apic_printk(APIC_VERBOSE, "mapped APIC to %08Lx (%08lx)\n", APIC_BASE,
> +    apic_printk(APIC_VERBOSE, "mapped APIC to %08llx (%08lx)\n", APIC_BASE,
>                  apic_phys);

... I wonder why we use __fix_to_virt() for APIC_BASE in the first place.
Using fix_to_virt() would look to be more logical, as all users cast to
a pointer anyway. Then it could simply be %p here.

> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -441,7 +441,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>              unsigned long long val = ecx;
>  
>              val *= ebx;
> -            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
> +            printk("CPU%u: TSC: %u Hz * %u / %u = %llu Hz\n",
>                     smp_processor_id(), ecx, ebx, eax, val / eax);
>          }

Maybe change val to be uint64_t instead? That's against what ./CODING_STYLE
calls for, but would be for a reason (to be able to use PRIu64) here.

> --- a/xen/arch/x86/cpu/mcheck/vmce.c
> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
> @@ -71,7 +71,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
>      if ( ctxt->caps & ~guest_mcg_cap & ~MCG_CAP_COUNT & ~MCG_CTL_P )
>      {
>          printk(XENLOG_G_ERR
> -               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#Lx)\n",
> +               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#llx)\n",
>                  is_hvm_vcpu(v) ? "HVM" : "PV", ctxt->caps,
>                  v, guest_mcg_cap & ~MCG_CAP_COUNT);

guest_mcg_cap is unsigned long and MCG_CAP_COUNT could as well use UL instead
of ULL, couldn't it?

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -517,7 +517,7 @@ static int vmx_init_vmcs_config(bool bsp)
>          if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) >
>               PAGE_SIZE )
>          {
> -            printk("VMX: CPU%d VMCS size is too big (%Lu bytes)\n",
> +            printk("VMX: CPU%d VMCS size is too big (%llu bytes)\n",
>                     smp_processor_id(),
>                     vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
>              return -EINVAL;
> @@ -564,7 +564,7 @@ static int vmx_init_vmcs_config(bool bsp)
>          if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) !=
>               ((vmx_basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
>          {
> -            printk("VMX: CPU%d unexpected VMCS size %Lu\n",
> +            printk("VMX: CPU%d unexpected VMCS size %llu\n",
>                     smp_processor_id(),
>                     vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
>              mismatch = 1;

Same here for VMX_BASIC_VMCS_SIZE_MASK. We leverage not doing 32-bit builds
anymore in exactly this way elsewhere.

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2597,7 +2597,7 @@ static void __init ioapic_init_mappings(void)
>          }
>  
>          set_fixmap_nocache(idx, ioapic_phys);
> -        apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08Lx (%08lx)\n",
> +        apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08llx (%08lx)\n",
>                      __fix_to_virt(idx), ioapic_phys);

Like above, switch to using fix_to_virt() and %p?

Jan

