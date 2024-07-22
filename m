Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829A939012
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761975.1172053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtKT-0003tj-Qp; Mon, 22 Jul 2024 13:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761975.1172053; Mon, 22 Jul 2024 13:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtKT-0003rL-Nw; Mon, 22 Jul 2024 13:43:53 +0000
Received: by outflank-mailman (input) for mailman id 761975;
 Mon, 22 Jul 2024 13:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVtKS-0003rF-7f
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:43:52 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce9463e-4830-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 15:43:49 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34677so3300313a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 06:43:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c923098sm430796766b.171.2024.07.22.06.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 06:43:49 -0700 (PDT)
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
X-Inumbo-ID: 6ce9463e-4830-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721655829; x=1722260629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=06s4/weRtplC9rmyo4wv1/cJgA2Ve515ziAnoqR0rm0=;
        b=akSzaIUMTfLDyJ4rz3WugsZ2dAPqxqabD0UZit9MeObcplzaT66JzZfOiVSL8FQxeI
         HDII/qWzif5MY0nN1LTV71a/WcGUlC40bBApgrJ6j4GVXpd4at9CxOeMrATCcuB1ap54
         4onIIsjNzQKj9mBStUISIqOkuSrV+Fw2e2KNODI+Dz7EpzJzP7DggtU4jLVtbqfhVVtx
         j6ESiDv785KBjLq+iPpCflmLiZNKt71qye7TfvObVAx7mJkaVZqFqSlA9lMdKlppDcZ5
         8idoR9I7Zakt6fX+wxhCRm+1ksV4LgBF4GcAB1fWieuTaGEaGuRBwNdbFRxy+AtTa7of
         M/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721655829; x=1722260629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06s4/weRtplC9rmyo4wv1/cJgA2Ve515ziAnoqR0rm0=;
        b=neeDUL6RzLTkhIYviIK/w0uz5bGAJj5rwn4xjH33N9IL6UCUD5l+e6wDLRBLFXQE1E
         biYtrP4nxAl129rs1nvlICdsBneJg/AQpz0EAbaH/RMRbB9qHQUtSpeG8FTyGHKv+nLg
         5NGL6foG23QdmXbCH6lUg1AtQNILmkmh+ANweKDDsdsXN8VqSTkbuwuRFXw7PYuKI2oB
         q/f5gr5L9aJzWVyGhjp3FxptHZ8Y4bY7PsyUCIHXG0Yb/t33bQUMKjrqmipcLrNNXCsl
         3/FH7NLrHBUDvV2u0OVpdleerdsxfRF3ztSV3pcup1up5PYudHz90ddQRcFWynVrLsCF
         yKlw==
X-Forwarded-Encrypted: i=1; AJvYcCVvgEzlud/wnAqmO/tOFxixwBTVNUmDMw5qSLEluEuoCHP3At9UGIELWY0z/fWRMJcObTACyWVt967kEP3sLGI5ZVsgpdDzIK3fI7dQ148=
X-Gm-Message-State: AOJu0YxKU0/9hMwd5RN8/ZftxHp6Y2c1VgZ0o79dXrWw8xw+zi2gSEgk
	XcIn+PAxdkHMHKtpfu5lnUU3cOuI4ZPTO25t7NjOYIm5Gks5KLgOm0PqRXjOvg==
X-Google-Smtp-Source: AGHT+IHeFC+nkKS19IJgov3nDOQvBY2nchbCSKIHgvr0ebyUwdyy0eJ4Z9lXfcrBJWvt1nolbpVZCQ==
X-Received: by 2002:a17:907:3faa:b0:a72:7d5c:ace0 with SMTP id a640c23a62f3a-a7a4bfa341emr484628166b.11.1721655829322;
        Mon, 22 Jul 2024 06:43:49 -0700 (PDT)
Message-ID: <a77268c6-2cb0-45d4-af42-ebf8ef928de9@suse.com>
Date: Mon, 22 Jul 2024 15:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 21/22] x86/AMD: fix CPUID for PerfCtr{4,5}
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <29b4fbb1045bb7cb49facfe2bc3e470fd74234bf.1698261255.git.edwin.torok@cloud.com>
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
In-Reply-To: <29b4fbb1045bb7cb49facfe2bc3e470fd74234bf.1698261255.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.10.2023 21:29, Edwin Török wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -340,9 +340,16 @@ static void recalculate_misc(struct cpu_policy *p)
>          p->extd.raw[0x1e] = EMPTY_LEAF; /* TopoExt APIC ID/Core/Node */
>          p->extd.raw[0x1f] = EMPTY_LEAF; /* SEV */
>          p->extd.raw[0x20] = EMPTY_LEAF; /* Platform QoS */
> -        break;
> -    }
> -}
> +
> +        /* These are not implemented yet, hide from CPUID.
> +         * When they become implemented, make them available when full vpmu is on */
> +        p->extd.irperf = 0;
> +        p->extd.perfctrextnb = 0;
> +        p->extd.perfctrextl2i = 0;
> +
> +         break;
> +     }
> + }

Part of this is unwanted churn: You shouldn't (wrongly) re-indent existing
code. The new comment also wants correcting for style.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1905,6 +1905,7 @@ static int cf_check svm_msr_read_intercept(
>      case MSR_AMD_FAM15H_EVNTSEL3:
>      case MSR_AMD_FAM15H_EVNTSEL4:
>      case MSR_AMD_FAM15H_EVNTSEL5:
> +    /* TODO: IRPerfCnt, L2I_* and NB_* support */
>          if ( vpmu_do_rdmsr(msr, msr_content) )
>              goto gpf;
>          break;

Imo such a comment wants indenting as it it was a statement, not a case label.

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -1156,6 +1156,7 @@ static int cf_check write_msr(
>          if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
>          {
>              vpmu_msr = true;
> +            /* fall-through */
>      case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
>      case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
>              if ( vpmu_msr || (boot_cpu_data.x86_vendor &

Unrelated change? And if one is to be made here, perhaps better to use the
pseudo-keyword?

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -166,7 +166,10 @@ XEN_CPUFEATURE(FMA4,          3*32+16) /*A  4 operands MAC instructions */
>  XEN_CPUFEATURE(NODEID_MSR,    3*32+19) /*   NodeId MSR */
>  XEN_CPUFEATURE(TBM,           3*32+21) /*A  trailing bit manipulations */
>  XEN_CPUFEATURE(TOPOEXT,       3*32+22) /*   topology extensions CPUID leafs */
> +XEN_CPUFEATURE(PERFCTREXTCORE, 3*32+23) /*A! Extended core performance event-select registers */

I don't see a need for the exclamation mark.

> @@ -238,6 +241,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
>  
>  /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
>  XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
> +XEN_CPUFEATURE(IRPERF,        8*32+ 1) /* Instruction Retired Performance Counter */

Please add two more padding blanks in the comment. I wonder anyway if the
three additions that you then only hide in calculate_host_policy() really
need adding here. They're definitely standing in the way of possibly
considering this for backport.

Arguably there may also be something missing here: If the feature was
disabled for a guest, shouldn't accesses to these MSRs also be refused?

Jan

