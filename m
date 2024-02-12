Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C45851697
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 15:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679583.1057066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZWzZ-000510-Uu; Mon, 12 Feb 2024 14:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679583.1057066; Mon, 12 Feb 2024 14:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZWzZ-0004zD-Rw; Mon, 12 Feb 2024 14:09:05 +0000
Received: by outflank-mailman (input) for mailman id 679583;
 Mon, 12 Feb 2024 14:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZWzY-0004yj-Q6
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 14:09:04 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 466e0dad-c9b0-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 15:09:03 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33b66883de9so2280839f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 06:09:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m10-20020adff38a000000b0033b0d2ba3a1sm6909668wro.63.2024.02.12.06.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 06:09:02 -0800 (PST)
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
X-Inumbo-ID: 466e0dad-c9b0-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707746942; x=1708351742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5ICFZRzFXL4KVkiHMEHxd8Eh85QmsegTMwijrGZIIA=;
        b=HNDkO1VyXgaCj/WyrKZLBBTMkA1H+7JhqrUBY+WxJ/5KnH3qC5cPhy2Sd0q0SIDQ+9
         LOnJweooSIFP7abuNhCmtE+zbSt1/X4R3shjToc0PdGryFGgc/iJi4yBkyV0wkh37slR
         ICsyg1WrhLCMGl7TZdDgz9ay0wm99U/G804eVUbW6getkOe/zPH6VcSXYu5I9YsInD6f
         HHf2NwOD8aFY7yf5iOEiN9Hmi2TXaPBGGyHQDZVApfqD55i41h3F1eav1Q9p4mJCOiUp
         2PhwPwVRRB3Iria1LB00Ez5hnLBp7AMmXLBqzhTKDuvqd/a0fY1mQGheeMKWA0vjm+Ux
         D2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746942; x=1708351742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5ICFZRzFXL4KVkiHMEHxd8Eh85QmsegTMwijrGZIIA=;
        b=lEaRlZWBNuHwmMonBl/JMPNYnzwuZ0G4Bvp8HZEXhV8+iLg9pSRPpSwE3TmOaslhtN
         B1pdDWBNGXTlwSVwvl1h23zN+ZCzWnbjeAXwjtOdkb/Z/ZZw9aWoiIbpWRuKzxGBuvfR
         nHaJ769MXwC2wavKDs2lSbS6jDzaV8pFFRpAPjJUjCkgjPxcuSz7uYEpcfs7up08MZfo
         h1/H3y6hLICRx5r57ba4USOM4/X+RaLeNFYcjUYdC/Y446dzI5sOSEhzhn/g0/GYPnzV
         WCFn2nn6+Wa5y4218ixkQDOb/B1erMA/RKebzQ5JE507idhiZpZYBEk153R3ikhcxl8S
         GdMg==
X-Forwarded-Encrypted: i=1; AJvYcCVi3sci/oNZ9Ly8pPeDOHlfKznMcRiFfd/4AsFV53dSwVKKRkI4viBinWO7uYO7rA3YuzJ4zJYqUKoBfqCTnitsDbwRsnmgSLcB+MNDv24=
X-Gm-Message-State: AOJu0Yyn92H/uhEh2Afwi+6WT3xUxkVVtGo81TaxmTVC2DKcAf43vqbv
	HwPctKcJsh+0LuW1qz4XPqX36yUpGQtasl1vE77q4DRKJb9+VsDpi35NNqEXdA==
X-Google-Smtp-Source: AGHT+IGzT++F0IcboumE1r9sKb6bUjhKYE7kHDwfPOGsSNMZxDm128KvJLTsJ8cJ+BPzk7WFXBbNvQ==
X-Received: by 2002:a05:6000:10cd:b0:33b:81cc:bd15 with SMTP id b13-20020a05600010cd00b0033b81ccbd15mr1899634wrx.37.1707746942359;
        Mon, 12 Feb 2024 06:09:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6btzaimQNkFVtdPOXU1hh1fqtVloBK8mcR2K1lEHOh8EcFpZchVpaQqflFp7xlhEGamD9dpEdYbwCSBkpcBDpkCCsGaIoX+5QLvXN7pVqMcyy6jGyGYmxFxFXw0GwUgI4+hviMhDJY2Dxyd05XOEQNyoF2XpvrHz+5znEM9zeTeCAZ/eyEroy893H
Message-ID: <09cf678e-bdbd-47a9-8c9d-533e7bee9450@suse.com>
Date: Mon, 12 Feb 2024 15:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: add support for virtualize SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240209114045.97005-1-roger.pau@citrix.com>
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
In-Reply-To: <20240209114045.97005-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.02.2024 12:40, Roger Pau Monne wrote:
> @@ -1378,6 +1379,10 @@ static int construct_vmcs(struct vcpu *v)
>          rc = vmx_add_msr(v, MSR_PRED_CMD, PRED_CMD_IBPB,
>                           VMX_MSR_HOST);
>  
> +    /* Set any bits we don't allow toggling in the mask field. */
> +    if ( cpu_has_vmx_virt_spec_ctrl && v->arch.msrs->spec_ctrl.raw )
> +        __vmwrite(SPEC_CTRL_MASK, v->arch.msrs->spec_ctrl.raw);

The right side of the conditional isn't strictly necessary here, is it?
Might it be better to omit it, for clarity?

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -823,18 +823,29 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
>      {
>          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>  
> -        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> -        if ( rc )
> -            goto out;
> +        if ( !cpu_has_vmx_virt_spec_ctrl )
> +        {
> +            rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> +            if ( rc )
> +                goto out;
> +        }
>      }
>      else
>      {
>          vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>  
> -        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
> -        if ( rc && rc != -ESRCH )
> -            goto out;
> -        rc = 0; /* Tolerate -ESRCH */
> +        /*
> +         * NB: there's no need to clear the virtualize SPEC_CTRL control, as
> +         * the MSR intercept takes precedence.  The SPEC_CTRL shadow VMCS field
> +         * is also not loaded on guest entry/exit if the intercept is set.
> +         */

It wasn't so much the shadow field than the mask one that I was concerned
might be used in some way. The shadow one clearly is used only during
guest RDMSR/WRMSR processing. To not focus on "shadow", maybe simple say
"The SPEC_CTRL shadow VMCS fields are also not ..."?

> +        if ( !cpu_has_vmx_virt_spec_ctrl )
> +        {
> +            rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
> +            if ( rc && rc != -ESRCH )
> +                goto out;
> +            rc = 0; /* Tolerate -ESRCH */
> +        }
>      }
>  
>      /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
> @@ -2629,6 +2640,9 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>      switch ( reg )
>      {
>      case MSR_SPEC_CTRL:
> +        if ( cpu_has_vmx_virt_spec_ctrl )
> +            /* Requires remote VMCS loaded - fetched below. */

I could see what "fetch" refers to here, but ...

> +            break;
>          rc = vmx_read_guest_msr(v, reg, &val);
>          if ( rc )
>          {
> @@ -2652,6 +2666,11 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>      vmx_vmcs_enter(v);
>      switch ( reg )
>      {
> +    case MSR_SPEC_CTRL:
> +        ASSERT(cpu_has_vmx_virt_spec_ctrl);
> +        __vmread(SPEC_CTRL_SHADOW, &val);
> +        break;
> +
>      case MSR_IA32_BNDCFGS:
>          __vmread(GUEST_BNDCFGS, &val);
>          break;
> @@ -2678,6 +2697,9 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>      switch ( reg )
>      {
>      case MSR_SPEC_CTRL:
> +        if ( cpu_has_vmx_virt_spec_ctrl )
> +            /* Requires remote VMCS loaded - fetched below. */

... since you also use the word here, I'm not sure it's really
the VMREAD up there.

Jan

