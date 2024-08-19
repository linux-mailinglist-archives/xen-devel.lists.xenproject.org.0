Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60727956AA5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779599.1189303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1O8-0000Ie-O6; Mon, 19 Aug 2024 12:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779599.1189303; Mon, 19 Aug 2024 12:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1O8-0000G6-L9; Mon, 19 Aug 2024 12:21:32 +0000
Received: by outflank-mailman (input) for mailman id 779599;
 Mon, 19 Aug 2024 12:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg1O7-0000G0-BZ
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:21:31 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 902fc922-5e25-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 14:21:29 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52efd855adbso5250986e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:21:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383969e05sm628199266b.191.2024.08.19.05.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 05:21:29 -0700 (PDT)
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
X-Inumbo-ID: 902fc922-5e25-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724070090; x=1724674890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Vz8vE/ymJZICUcyrHGy5xrlNpTTvJ67BxOWCKxn3Cg=;
        b=QVrOPxHG8NukukaETD0BCLlpyf0wmA0fQs31iKSfsCrYMK6igpVw3VaOahUMk+NABp
         DKQlGl0Izr9FHr1eV9+BU877URptmOAnLNNyHoIPy4Ee+nNrKRsHZ87wGKolredG6//u
         aC6pZcZ6mzgoiYzcz4ONwXVs+Smzk+hf5CvZtw5jD8+GFNf9NMAf2Myu+75BSSBHKp/E
         ze6p864MUiREyhQf3hprZAjpZK2Kf2Vcba34bR+NM9WekbcNuBAhJwdGvNYByxSpI4cO
         CUJiV34aBVNXoJwiX9pmXAcdwJtsOxEXCdLD+y3FxUSaTk5vmmXsmNfYbsx3DJ0JflPG
         pfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724070090; x=1724674890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Vz8vE/ymJZICUcyrHGy5xrlNpTTvJ67BxOWCKxn3Cg=;
        b=dULtViGloDXm9iWqg++v7mRV57TRxp95N2tIS1kmOJCn1Wh8WHo8zGlxUrdBXou8xR
         ijxqSApswVYOGQHCWqq+Ewm5mRzRXqUp3ZoURWIZzh7WFTktwN1RZPePrWAjWeVoS3V7
         8/gtLsVH1Ih00kz+DvXzSX4zuMeWfB6qgu979GO7CkTT7OOOd/0xax/ooJXVDcxssCev
         VjOPS45XSb4CAhVmBDQVV0TZvLGndeMS8SNBlmvISctB06e8RiWXeqs/Q8lBVO9jFbrb
         P5JF3GamzagYnxDADp//Oij/+MD1QlDgGeiDMCwgSvAGFBT8c8zpXoth8kaslYO/kCye
         Dz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoeEgsGeup+B1nFV+/s5Atpi0NG5KpJHf+WT+eCn0FhvXQ7MCLkTqogb1ilWyVBCWKUJNH2hidwI5+rf2vURgcRxS+4Ytcmgu8K5XMkLE=
X-Gm-Message-State: AOJu0YzL3GgnV31G8bJ9LcupQcxJ9uJmZkX4MpyUYtDwML9FcEF1aWDG
	2qdla0Y779IKfawNAqQ2AhvJwMzyvV3Qip5g9wE1KvnAqC9mNROfb+4FvkHK9w==
X-Google-Smtp-Source: AGHT+IHRzRib003uODeZ67kzaZAcZ232AZ8r60jrcee9EspZzBiFa35k7u+HvaLuQaLftbGY1qjpIQ==
X-Received: by 2002:a05:6512:1086:b0:52e:bf53:1c2b with SMTP id 2adb3069b0e04-5331c692d51mr7534819e87.12.1724070089517;
        Mon, 19 Aug 2024 05:21:29 -0700 (PDT)
Message-ID: <a8de2dc4-24a1-418e-8ad3-2673e008ae96@suse.com>
Date: Mon, 19 Aug 2024 14:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/5] x86/amd: configurable handling of AMD-specific
 MSRs access
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <917d2186db56c6f4c820f6b9e26b29fbe93301d6.1723806405.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <917d2186db56c6f4c820f6b9e26b29fbe93301d6.1723806405.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:12, Sergiy Kibrik wrote:
> Do not compile handlers of guest access to AMD-specific MSRs when CONFIG_AMD=n.

What I'm missing in the description is clarification on how boundaries were
drawn. In guest_rdmsr() there is, for example, also handling of MSR_AMD_PATCHLEVEL.
Which I'm okay to leave aside for now, as long as it's clear why that is.

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -219,6 +219,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          *val = msrs->tsc_aux;
>          break;
>  
> +#ifdef CONFIG_AMD
>      case MSR_K8_SYSCFG:
>      case MSR_K8_TOP_MEM1:
>      case MSR_K8_TOP_MEM2:
> @@ -281,6 +282,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>                                     ? 0 : (msr - MSR_AMD64_DR1_ADDRESS_MASK + 1),
>                                     ARRAY_SIZE(msrs->dr_mask))];
>          break;
> +#endif /* CONFIG_AMD */
>  
>          /*
>           * TODO: Implement when we have better topology representation.
> @@ -552,6 +554,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>              wrmsr_tsc_aux(val);
>          break;
>  
> +#ifdef CONFIG_AMD
>      case MSR_VIRT_SPEC_CTRL:
>          if ( !cp->extd.virt_ssbd )
>              goto gp_fault;
> @@ -598,6 +601,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          if ( v == curr && (curr->arch.dr7 & DR7_ACTIVE_MASK) )
>              wrmsrl(msr, val);
>          break;
> +#endif /* CONFIG_AMD */
>  
>      default:
>          return X86EMUL_UNHANDLEABLE;

Is just adding #ifdef-s actually correct? That results in different behavior on
e.g. Intel hardware, I think, depending on whether AMD=y or AMD=n. In the latter
case the function will now return X86EMUL_UNHANDLEABLE, while in the former case
it would return X86EMUL_EXCEPTION.

Jan

