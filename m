Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FF985A8E1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 17:26:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683026.1062342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc6SY-0003tW-2f; Mon, 19 Feb 2024 16:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683026.1062342; Mon, 19 Feb 2024 16:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc6SY-0003rD-04; Mon, 19 Feb 2024 16:25:38 +0000
Received: by outflank-mailman (input) for mailman id 683026;
 Mon, 19 Feb 2024 16:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc6SW-0003r7-K8
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 16:25:36 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82452733-cf43-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 17:25:35 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4125cf71eecso14527265e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 08:25:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c20d500b0041044e130bfsm11613758wmm.33.2024.02.19.08.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 08:25:34 -0800 (PST)
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
X-Inumbo-ID: 82452733-cf43-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708359934; x=1708964734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KyLwGj6vFDAiGJSuAGHwa4trOZDeOAdto4sZpeY4CE=;
        b=F0Rm3OZJBDned01k9hZNv9nWCV/xot8KZ1VQBAVqRdSeY+YfWnw9TDMX+oKdfr+XFH
         t8H/TcuOs6Ncm8x5+h38QgGGB7v2byzACmkGCnC6L1g/7waWDM1RQ89VRHr/APnWHAcF
         l3DYvlG4gzhFecCIPOua+M+GJP7mnk+gZCp9T8gNApZDR5oPgPOr7Auwm4ooTD0Kpeup
         yDIhRRRjBLRCu+991CfsOak6YKmNkP5HObtL3gfTfMbi03+f0woOLjI8Wqwi4D/NFatQ
         F9xAEWZhMkYLA0pcS/EcXpJqGMXI6B43zi/ZRgZryoju+Z1M50vy9QiwdeFjEh8XOCgw
         YDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708359934; x=1708964734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KyLwGj6vFDAiGJSuAGHwa4trOZDeOAdto4sZpeY4CE=;
        b=CV2DxcfWHUMPAbPksQYDWBbMLK7sjNxp7xm+je8j8M940MNn9Xn9oStZOL73/rPsdM
         7tGkl7Z0yJsfK0IKnrilKw/HD5MBGGF90M6dILFV5owzpbxW4cf4jaFgwc4vu04qHpQW
         eEhZziod5iZtCTYHFpujde5QdnUfu9R2Z2xax2kPD3VkAOCMSaCh21d5OpvwsYhmKrve
         BGB+2bvh67ZWtD+K5XhcWV1w23zC9+8yi0z7P5SLng89oZGfvc3qnQl2Ld56cDWbATBM
         nMs8Kg9tqUPDSgViAFMqMH8+KilM4pmGRFVCj5BqM3lK7pM/E03AmuBUmZmCbxbornw9
         /Umg==
X-Forwarded-Encrypted: i=1; AJvYcCWuR6qYHbhI6nqI4I790iNlCcX03oNmfXbjCwyWuq8PWLI2cdsYWqB5vnzfiLj0sUOxkJZNKJwbrgmFcXepmxHo4HKJP7B4thcOLlWyHLY=
X-Gm-Message-State: AOJu0YwFDSUKVH6ktQUnzFPR5s+LxkVwq+g0QrbVw053os8Qrxj4Pfxe
	mOhpE7E64kqpi7p4CCx1nPtjrJK4/xMiYZn8I9WZSbrA3kS8FX7oJ9HQ+X4SAQ==
X-Google-Smtp-Source: AGHT+IGzRA0VBYAkCzGHilQZlODScbSJu0Gt9LaysinnC4MnlqMGhkXyrllUcjGk/8usWkIynsJu2g==
X-Received: by 2002:a05:600c:4588:b0:411:e0f0:7a71 with SMTP id r8-20020a05600c458800b00411e0f07a71mr9902390wmo.33.1708359934636;
        Mon, 19 Feb 2024 08:25:34 -0800 (PST)
Message-ID: <8ee35193-9715-4c4b-a1cb-11af04c4dab9@suse.com>
Date: Mon, 19 Feb 2024 17:25:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] svm/nestedvm: Introduce nested capabilities bit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-7-george.dunlap@cloud.com>
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
In-Reply-To: <20240206012051.3564035-7-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 02:20, George Dunlap wrote:
> --- /dev/null
> +++ b/docs/designs/nested-svm-cpu-features.md
> @@ -0,0 +1,110 @@
> +# Nested SVM (AMD) CPUID requirements
> +
> +The first step in making nested SVM production-ready is to make sure
> +that all features are implemented and well-tested.  To make this
> +tractable, we will initially be limiting the "supported" range of
> +nested virt to a specific subset of host and guest features.  This
> +document describes the criteria for deciding on features, and the
> +rationale behind each feature.
> +
> +For AMD, all virtualization-related features can be found in CPUID
> +leaf 8000000A:edx
> +
> +# Criteria
> +
> +- Processor support: At a minimum we want to support processors from
> +  the last 5 years.  All things being equal, older processors are
> +  better.

Nit: Perhaps missing "covering"? Generally I hope newer processors are
"better".

>  Bits 0:7 were available in the very earliest processors;
> +  and even through bit 15 we should be pretty good support-wise.
> +
> +- Faithfulness to hardware: We need the behavior of the "virtual cpu"
> +  from the L1 hypervisor's perspective to be as close as possible to
> +  the original hardware.  In particular, the behavior of the hardware
> +  on error paths 1) is not easy to understand or test, 2) can be the
> +  source of surprising vulnerabiliies.  (See XSA-7 for an example of a
> +  case where subtle error-handling differences can open up a privilege
> +  escalation.)  We should avoid emulating any bit of the hardware with
> +  complex error paths if we can at all help it.
> +
> +- Cost of implementation: We want to minimize the cost of
> +  implementation (where this includes bringing an existing sub-par
> +  implementation up to speed).  All things being equal, we'll favor a
> +  configuration which does not require any new implementation.
> +
> +- Performance: All things being equal, we'd prefer to choose a set of
> +  L0 / L1 CPUID bits that are faster than slower.
> +
> +
> +# Bits
> +
> +- 0 `NP` *Nested Paging*: Required both for L0 and L1.
> +
> +  Based primarily on faithfulness and performance, as well as
> +  potential cost of implementation.  Available on earliest hardware,
> +  so no compatibility issues.
> +
> +- 1 `LbrVirt` *LBR / debugging virtualization*: Require for L0 and L1.
> +
> +  For L0 this is required for performance: There's no way to tell the
> +  guests not to use the LBR-related registers; and if the guest does,
> +  then you have to save and restore all LBR-related registers on
> +  context switch, which is prohibitive.

"prohibitive" is too strong imo; maybe "undesirable"?

> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -35,6 +35,7 @@ enum nestedhvm_vmexits
>  nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
>      uint64_t exitcode);
>  void svm_nested_features_on_efer_update(struct vcpu *v);
> +void __init start_nested_svm(struct hvm_function_table *svm_function_table);

No section placement attributes on declarations, please.

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1666,3 +1666,17 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
>          }
>      }
>  }
> +
> +void __init start_nested_svm(struct hvm_function_table *svm_function_table)
> +{
> +    /* 
> +     * Required host functionality to support nested virt.  See
> +     * docs/designs/nested-svm-cpu-features.md for rationale.
> +     */
> +    svm_function_table->caps.nested_virt =
> +        cpu_has_svm_nrips &&
> +        cpu_has_svm_lbrv &&
> +        cpu_has_svm_nrips &&

nrips twice? Was the earlier one meant to be npt?

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3021,6 +3021,9 @@ const struct hvm_function_table * __init start_vmx(void)
>      if ( cpu_has_vmx_tsc_scaling )
>          vmx_function_table.tsc_scaling.ratio_frac_bits = 48;
>  
> +    /* TODO: Require hardware support before enabling nested virt */
> +    vmx_function_table.caps.nested_virt = vmx_function_table.caps.hap;

This won't have the intended effect if hap_supported() ends up clearing
the bit (used as input here) due to a command line option override. I
wonder if instead this wants doing e.g. in a new hook to be called from
nestedhvm_setup(). On the SVM side the hook function would then be the
start_nested_svm() that you already introduce, with a caps.hap check
added.

Since you leave the other nested-related if() in place in
arch_sanitise_domain_config(), all ought to be well, but I think that
other if() really wants replacing by the one you presently add.

Jan

