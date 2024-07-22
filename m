Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1B938E2B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761775.1171803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrS6-0007Mw-4z; Mon, 22 Jul 2024 11:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761775.1171803; Mon, 22 Jul 2024 11:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrS6-0007Lr-0l; Mon, 22 Jul 2024 11:43:38 +0000
Received: by outflank-mailman (input) for mailman id 761775;
 Mon, 22 Jul 2024 11:43:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVrS4-0007Lg-JM
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:43:36 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a079edb4-481f-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 13:43:34 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so3086914a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:43:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c2f88a5sm5972847a12.77.2024.07.22.04.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:43:33 -0700 (PDT)
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
X-Inumbo-ID: a079edb4-481f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721648614; x=1722253414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fEVjJKofTC2lVHMm8iYBgBuuBrpGvOOqHJ6QxOiHIPs=;
        b=ULPMt+ihg9WAbC9gyiYvK68DwhEymMjRdygjd+QGqZs8yQWwOZ5HTRokjjJdmyXaIr
         8t4BQNHIdqgRHHJ/86VF3F0C4In+K9FoDwPJLdQ2LrhRyFFNDQbNmX0h0kWbuPOFZHqY
         /hqy7jeGoYXnI+elPPuab7zVBO1mpVWDPMFXmBcVotBHrqBtctuObDK9B2/nxeuVakFu
         zyhH9o9LDPyBgvXjHaW1Rz26YRnb7y3qtiK5JoslHkOpnR2uZCCP6fLBCJwBzdqeqGDD
         gtcgY/BeBsS2Ray/ebvv0yPwp2bs4SwqEg8RCtAzdtQ0KAU2HKTVNWDvAatdGvZLSZ4H
         FChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648614; x=1722253414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEVjJKofTC2lVHMm8iYBgBuuBrpGvOOqHJ6QxOiHIPs=;
        b=I0qc8vKatWo1NYILQSrVbTrfY+8T+GQeIqiBzQaoqgTyVRFoFXFFaUJluhvejQ8506
         m2BmGaMswme1zQppCfR5LpAXIjl5yQPux0HduyJpqOy9dN/DK10a54n9da/WLm5k8PCg
         K8Y/Wxc2uVbBsjNpRBu5DJbSiUobWKm8PTs+gP9jO11Bbp4k45qod5S162RV5Dj3dL72
         3KmOa5cxLSjipLMrAnoeOjDog9qo22FlDCLBlpwyjwnPjzqUwyAA+LRe1cBG95KvNZk3
         cJp6R/CZo5fX70tvfzBeyjrf8k9Eq2f/rxV0OlkeWFqskxgqeFdRdtMMj7rcgc6ItC0L
         W0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVueHXJ1Pt5gzCUfE/aTUcNzQsx5cUJ/lpeTigpG3HUHMW4vMk7dfHTKGpQXXYzq3b52s7rvm49y4fK0zJx90NwHRzjmUDAXQmEpZE1Es8=
X-Gm-Message-State: AOJu0YwPvckSnHPx2JP/9/fHIXmwPjro7tFAIV/u8ZYlRcyucsktAdXl
	Sd/Pi+aimakW582Br1rMuefRUlx5E/H41zKTfXYsiUa1x1PsJ8BGACW6Z9G2cw==
X-Google-Smtp-Source: AGHT+IEEszISUIFqzrHdAiDsYv2xyfUJmoDaz46P6riW1zcmnb/wArYgLBxYr0g6up+bndmDwDhWVQ==
X-Received: by 2002:a05:6402:510e:b0:5a2:8bf2:92c6 with SMTP id 4fb4d7f45d1cf-5a3ef3792e8mr6052145a12.21.1721648614101;
        Mon, 22 Jul 2024 04:43:34 -0700 (PDT)
Message-ID: <a89c973e-035a-4e8f-b446-03bbcf724f86@suse.com>
Date: Mon, 22 Jul 2024 13:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 10/14] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <668355271f01681070cb15f67af1538104bfc651.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <668355271f01681070cb15f67af1538104bfc651.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 08:05, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5197,7 +5197,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
>      {
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
> -            if ( !cpu_has_monitor_trap_flag )
> +            if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_monitor_trap_flag )
>                  return -EOPNOTSUPP;
>              break;

Why at the use site here and ...

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -196,7 +196,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>          res->a = CPUID4A_RELAX_TIMER_INT;
>          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> -        if ( !cpu_has_vmx_apic_reg_virt )
> +        if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_vmx_apic_reg_virt )
>              res->a |= CPUID4A_MSR_BASED_APIC;
>          if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
>              res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
> @@ -236,7 +236,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>  
>      case 6:
>          /* Detected and in use hardware features. */
> -        if ( cpu_has_vmx_virtualize_apic_accesses )
> +        if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx_virtualize_apic_accesses )
>              res->a |= CPUID6A_APIC_OVERLAY;
>          if ( cpu_has_vmx_msr_bitmap || (read_efer() & EFER_SVME) )
>              res->a |= CPUID6A_MSR_BITMAPS;

... here (and in yet a few more places), but ...

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -306,7 +306,8 @@ extern u64 vmx_ept_vpid_cap;
>  #define cpu_has_vmx_vnmi \
>      (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
>  #define cpu_has_vmx_msr_bitmap \
> -    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
> +    (IS_ENABLED(CONFIG_VMX) && \
> +     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)

... for others right in the definitions, as was suggested before? Yet then
not consistently for all of them? Looks like if you did this consistently
here, you'd have no need at all to fiddle with any .c file.

Jan

