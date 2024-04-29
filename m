Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC08B5DCC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714252.1115395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1T1C-0008NO-8P; Mon, 29 Apr 2024 15:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714252.1115395; Mon, 29 Apr 2024 15:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1T1C-0008Ke-5K; Mon, 29 Apr 2024 15:34:14 +0000
Received: by outflank-mailman (input) for mailman id 714252;
 Mon, 29 Apr 2024 15:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1T1A-0008KY-TC
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:34:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecbedfd1-063d-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:34:10 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41b869326daso21954205e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:34:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jx12-20020a05600c578c00b0041674bf7d4csm44997668wmb.48.2024.04.29.08.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:34:10 -0700 (PDT)
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
X-Inumbo-ID: ecbedfd1-063d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714404850; x=1715009650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8MsNoBgk+0o2iJjXPPiiY2xEx2R0zWeVOvCyicE3wY=;
        b=LIeLehENc98/E6bGdxzlBvGjgmzqOcsX6RjDWvN7sv4Hb/5nklowPUqtI3MjxNklia
         szWceIpRA6kRU2Ttk7chg+MfnV9qADZ0sRYwqjL/FPmiL9kahhpbh44BCjkJCnMHI2ZR
         4LfqgBYXtDnsEWInVBlfapIil9wWKgQGEcwoBSk07ZYlq+ZUBe0oKIpnS5JM5C74VKGm
         7+rDKVmWK8WkTqepJppLQ7QMISKNd1I7FLMW1bU+E8NDqhO3w5CrKQyIfXGq4iYgBb8M
         KgGGj4H3/bMrZPwrw58bm//MdufdlRS9bVA0X1p5SniDyMf5aUXVZ0pIowotX+tewrp3
         buwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714404850; x=1715009650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8MsNoBgk+0o2iJjXPPiiY2xEx2R0zWeVOvCyicE3wY=;
        b=R+NMSOdRp3eVr1xPNzPxHbQg9OUzVcaDa8CVQXwPfiEUkVQ3VCd8uGgiCDx7YJih/T
         oZ0itiywMz0VU+0YJlP8zl9WmZjswlYDfIOJM6r0ogK0q6VthXppR6ePv7iHHjel1DSJ
         pRBayutQH+KNuDzPhrEuFxZVYTQAbC5HEBZLvelk8kGd8dJBebOSk5Keyz86YcF+o2wB
         wVQLZSg7NcixFTOdu/qjihORf40Dpy/4pkukWpR81wPoxsh+wOv2ywwLI8D5XKEVBfgS
         OD+o3Ukpl6PxccWzsBWnATWK7QjUKqQkoakDa1k94MxcxYpbAki9dqw6lVJY5KHaupUJ
         T0dg==
X-Forwarded-Encrypted: i=1; AJvYcCWno9Nu16VhYCjZ4U/ncxffxTnj9bER5Ch/T5IplbZdJ4St8RVso2cBwANGupH5bkXysS/vLsOFRithfMAEqEa3zG5RO90RSmypwA2J8Fk=
X-Gm-Message-State: AOJu0YyegR4LqagEhtE5Hh2fqCGdT+EI+NGVJSr3StLG07artMgApUvs
	vqmReYpFFqHg1AGowdIczYE6JlKmcNrrWvvYQLrpUQ/UXd5vgScJ6aWy1g3JWQ==
X-Google-Smtp-Source: AGHT+IH/lFgBhy907B2+wTMLmP2ZH7L/nu5TUMgS2xCrnlJg6qnqR3zJHkkVboexcTRNVcmqpni1lw==
X-Received: by 2002:a05:600c:3d8f:b0:41c:2992:a3be with SMTP id bi15-20020a05600c3d8f00b0041c2992a3bemr3908960wmb.29.1714404850210;
        Mon, 29 Apr 2024 08:34:10 -0700 (PDT)
Message-ID: <fd6bc6df-1b95-45fb-81ed-b0ccac1a0ad0@suse.com>
Date: Mon, 29 Apr 2024 17:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/7] x86/intel: guard vmce_has_lmce() with INTEL
 option
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <5e26895d84f8b7750799740ac2324b2cb92fa97e.1713860310.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <5e26895d84f8b7750799740ac2324b2cb92fa97e.1713860310.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 10:50, Sergiy Kibrik wrote:
> Since MCG_LMCE_P bit is specific to Intel CPUs

That's the case now. It could change going forward, and an underlying hypervisor
might also have (obscure?) reasons to surface it elsewhere.

> the code to check it can
> possibly be excluded from build if !CONFIG_INTEL. With these guards
> calls to vmce_has_lmce() are eliminated and mce_intel.c can end up
> not being built.
> 
> Also replace boilerplate code that checks for MCG_LMCE_P flag with
> vmce_has_lmce(), which might contribute to readability a bit.

Alternatively, have you considered making that function an inline one in a
suitable header? Besides addressing your build issue (I think), ...

> --- a/xen/arch/x86/cpu/mcheck/vmce.c
> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
> @@ -199,7 +199,7 @@ int vmce_rdmsr(uint32_t msr, uint64_t *val)
>           * bits are always set in guest MSR_IA32_FEATURE_CONTROL by Xen, so it
>           * does not need to check them here.
>           */
> -        if ( cur->arch.vmce.mcg_cap & MCG_LMCE_P )
> +        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(cur) )

... doing so would alternatively also permit integrating the IS_ENABLED()
into the function, rather than repeating the same ...

> @@ -324,7 +324,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
>          break;
>  
>      case MSR_IA32_MCG_EXT_CTL:
> -        if ( (cur->arch.vmce.mcg_cap & MCG_LMCE_P) &&
> +        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(cur) &&
>               !(val & ~MCG_EXT_CTL_LMCE_EN) )
>              cur->arch.vmce.mcg_ext_ctl = val;
>          else
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -86,7 +86,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>              goto gp_fault;
>  
>          *val = IA32_FEATURE_CONTROL_LOCK;
> -        if ( vmce_has_lmce(v) )
> +        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(v) )
>              *val |= IA32_FEATURE_CONTROL_LMCE_ON;
>          if ( cp->basic.vmx )
>              *val |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;

... three times.

Jan

