Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B0C1FCBB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 12:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153528.1483845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQl7-0007fx-P0; Thu, 30 Oct 2025 11:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153528.1483845; Thu, 30 Oct 2025 11:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQl7-0007dC-M8; Thu, 30 Oct 2025 11:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1153528;
 Thu, 30 Oct 2025 11:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEQl7-0007d5-5e
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 11:24:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edb93d23-b582-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 12:23:58 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso10366065e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 04:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771906af34sm63049965e9.14.2025.10.30.04.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 04:23:57 -0700 (PDT)
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
X-Inumbo-ID: edb93d23-b582-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761823438; x=1762428238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Un0AxXYf3WeD6i4MvWi8fdAtJo5uCn8b/Qq3EMnL41Y=;
        b=UW7YQ9aZUGM4r0a+QF8Y19GED2TDjYkFrzFmhFQp5uH+48OEAAORNpQwt8O3RQ+fSK
         hVcYZIRIqUBkJ4erDuldJnZjFFRIShDs6NT1FQd8GfekiMDe53KQzl2lJq4KTpWzIFGW
         22lvWw6CQIgBPsJOmILQ8n8UIBZ1q+ZXmbSwasYBav6BtA64W3rmP+E79JeKO4E8F1aJ
         yEhJZzufsUZcZx5HzLCdMJXsFR2ONBBikPepTYJGJXb3sE7+e01KHu0e+oNZwVUjR2IJ
         FJTIP5w1DGkh0jDrct1IMpEhXrulSPg53c6sRR5iJJ9N2qk2T91CORUR/pth5mohIogo
         q9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761823438; x=1762428238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Un0AxXYf3WeD6i4MvWi8fdAtJo5uCn8b/Qq3EMnL41Y=;
        b=VHjiBcxCh6w4VKlBRtiCUnCenqHB/iLjP8QDTy06wJvIKHJiyU9cSdW15lErnLw5Ta
         IuCjraLzL5zfujsl+RrvEWBwWz4xFHm2jCPoztuiCpR6jmUfaNj/lidCBAIGfoJvAcQg
         Fn4IVBLBFui74ZWqJpCV+4LtsSO0hsb5bEOqi/gIH0rtavf9l6PTIxCdnn7fATVZ62br
         TDgdOM8Eo+2gxs05EoAle4LZ5ko6bdpmS4UIU6FOiW8JVFp1h330h7foJFlQrfhAZGVq
         mJgg1W1/iwAkhJ6N4BOMGUOGewU2NNdyKoOwo/Gh5afeE1Mc5J8dlIb1s4d841k0x6Kr
         f4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU0GO9Yzk5EoYR06ERjCS9FHz6OlbBUgMRBuVcbcjDlVBx++YhxxzH5K4gOI1LcnmhHw8SMev7tJPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yys36AwautCLtA9ygxa22P/BD4jxbcsJMaSoYsbU+AOFM4MTmgW
	F+ALLdQLgm1yX+bO5Sqwpw4jt9LVRXL6saTfCp9U8YWIqVGJvx6yLX0zyI9sWGOzPw==
X-Gm-Gg: ASbGnct3hWRoPVi0bAE3tIqDxA01ym8XZ1tc/0k/tHHGKJsfG29BKTy68Ahc+Ged/KA
	0EHF26RzQF+2xY70bEmGRao59r599h2VdZMBScYWZnyzT3jmwdHmXi3ClZ5N7+ooSbicl0YstWK
	HL0X7jbkJ5HSDpHs+Udun+3iIUPcV02DHRd2t5kYUddMVZ2yxl9dIewOwWMs5Ny/oOE9spxEyRj
	5cHczICkWhSv9WaZuNDqcZPYoBLtz+6b7mK9x7J3W6W987hDawGmrffv9X6fIDS+2MzxTPHF7Xi
	keGWeXFf/9a5y9S1uTYN+g/CX/Ee+zM80vHHVehxzY2mAEEuHgYVAGMfGhMeZP5WWNAb/sCG/Op
	HPBp9gelHcQDOqGKBqgZrwpSwru/w4/WO4rNQp3VjvyeMqzR36kvTCCU6YY3porDfF6cBD4QOe/
	RNw5WxBe8HMvU4d4TJU/LR9EdM1ZDqOjDJbhAa1Ni8+YdZ8Tm+xxgqOmxDCwcK
X-Google-Smtp-Source: AGHT+IH+nJvR7m+ccNulcSzuF5Oghtb52N1Ckogd8oR1sIgdhHnz0saiD+p83ticJeGF22qQL8vXDA==
X-Received: by 2002:a05:600c:3509:b0:45f:2cb5:ecff with SMTP id 5b1f17b1804b1-4771e1edaa4mr62367795e9.31.1761823438198;
        Thu, 30 Oct 2025 04:23:58 -0700 (PDT)
Message-ID: <52395897-0e7f-4d24-8a28-0a303ff717b5@suse.com>
Date: Thu, 30 Oct 2025 12:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/3] x86/hvm: vmx: refactor cache disable mode data
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-4-grygorii_strashko@epam.com>
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
In-Reply-To: <20251029235448.602380-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 00:54, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The Cache Disable mode data is used only by VMX code, so move it from
> common HVM structures into VMX specific structures:
> - move "uc_lock", "is_in_uc_mode" fields from struct hvm_domain to struct
> vmx_domain;
> - move "cache_mode" field from struct hvm_vcpu to struct vmx_vcpu.
> 
> Hence, the "is_in_uc_mode" field is used directly in mm/shadow/multi.c
> _sh_propagate(), introduce the hvm_is_in_uc_mode() macro to avoid direct
> access to this field and account for INTEL_VMX configuration.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Requested-by: Andrew ?

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -583,6 +583,7 @@ static int cf_check vmx_domain_initialise(struct domain *d)
>      int rc;
>  
>      d->arch.ctxt_switch = &csw;
> +    spin_lock_init(&d->arch.hvm.vmx.uc_lock);

I don't think this is the best place; in any event it wants to be separated from
adjacent code by a blank line. I'd prefer if it was put ...

>      /*
>       * Work around CVE-2018-12207?  The hardware domain is already permitted

... below this CVE workaround.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -46,7 +46,9 @@ struct ept_data {
>  
>  #define _VMX_DOMAIN_PML_ENABLED    0
>  #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
> +
>  struct vmx_domain {
> +    spinlock_t uc_lock;
>      mfn_t apic_access_mfn;
>      /* VMX_DOMAIN_* */
>      unsigned int status;

Any reason to make this the very first field of the struct? It might better
live adjacent to the other field you move; there's going to be some padding
anyway, afaict.

> @@ -56,6 +58,12 @@ struct vmx_domain {
>       * around CVE-2018-12207 as appropriate.
>       */
>      bool exec_sp;
> +    /*
> +     * If one of vcpus of this domain is in no_fill_mode or
> +     * mtrr/pat between vcpus is not the same, set is_in_uc_mode.
> +     * Protected by uc_lock.
> +     */
> +    bool is_in_uc_mode;

Imo while moving, the is_ prefix could also be dropped. It doesn't convey any
extra information on top of the in_, and I think we prefer is_*() also as
typically function(-like) predicates. (I.e. in hvm_is_in_uc_mode() I'm fine
with the name.)

> @@ -93,6 +101,9 @@ struct pi_blocking_vcpu {
>      spinlock_t           *lock;
>  };
>  
> +#define NORMAL_CACHE_MODE          0
> +#define NO_FILL_CACHE_MODE         2

As you necessarily touch all use sites, could we switch to the more common
CACHE_MODE_* at this occasion? Also imo these want to live ...

> @@ -156,6 +167,9 @@ struct vmx_vcpu {
>  
>      uint8_t              lbr_flags;
>  
> +    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
> +    uint8_t              cache_mode;

... right next to the field they belong to.

Jan

