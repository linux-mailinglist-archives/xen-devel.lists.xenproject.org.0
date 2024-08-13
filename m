Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C794FEF3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 09:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776021.1186175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdm8g-0003UI-Om; Tue, 13 Aug 2024 07:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776021.1186175; Tue, 13 Aug 2024 07:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdm8g-0003SZ-M4; Tue, 13 Aug 2024 07:40:18 +0000
Received: by outflank-mailman (input) for mailman id 776021;
 Tue, 13 Aug 2024 07:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdm8f-0003ST-F0
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 07:40:17 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47e5214c-5947-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 09:40:15 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so601022766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 00:40:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411b4e3sm45263166b.126.2024.08.13.00.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 00:40:14 -0700 (PDT)
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
X-Inumbo-ID: 47e5214c-5947-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723534815; x=1724139615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F68ubw53LZI2jL3telJkywVWNadBzNJB5N+2hKuEjQU=;
        b=Jmhubhd71KYMmYCULxBwyH7hzfp16LZjS0OpEGyP+YS1Z9Mog8NGovr/Z223iDxw5n
         u8xnOHgAbLab8As//Zj3oaToiTYAKyywNTim+ov2EZFKQDbQ/WEbd0TuWW2OOt3YOZ1r
         9p/RPo+CxEnFpgP0QRqP33glxhaxwNJCTeDCmB5h5beisUNKtoxLAWJXVfLZm5pZW4dJ
         coXe2SgLCSgJAaGdnSwQ8rYISD51YVWclK4dB6itPiaT7YS8H5u9Fsr9tG65rtRkdLfG
         9DelVF5jFLlgPd4mrOWKgo35SP4pkCjgpf7TN0tOWE+Gd4cZPdcrJ/39ali8/dmaypWq
         /16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723534815; x=1724139615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F68ubw53LZI2jL3telJkywVWNadBzNJB5N+2hKuEjQU=;
        b=IRcHd8xOcBavQ7DlQaz5KH1Abik8IMq3U14sWJd0pnQL5xEzq9qEiHRx3qCqt2fDoW
         rBQFj7tpnz//qRqRlyVjVvY4TGlKFYyOVmIJ0Uxa1yB5b9gRggHUBIj+TPF0AEMEWY5R
         4gvCjN4GCiK0kwCU8LiqK7DY0wy2LbyTLLj7Fv2904MgFxE4fwNTJP/+S3G8TCOJ7nGV
         /npGt/d03aNc5GSDPVk3875GlZiu1i1Zmp5g3JlkdS50hlvjPFoTdiYOhqbpyy1r5Xtx
         AuT9gZl/S2dJiL6KQrvf/EBP3CLc4e11crr5kVN4/DCfkUzyf3XiNE0mX59LUn5SkTVF
         OYQw==
X-Forwarded-Encrypted: i=1; AJvYcCULzgqi2X0ScmB9eABJW9ruAnEiXZ2KyRikn0AauOX45BfvbdgrqMGYtRSxbKAxAapfkIzzF/2mixuhbB+KmlP3J9elHwNVc3OMcNzejcM=
X-Gm-Message-State: AOJu0YxmT4wuCLwSXLNXZk8cLPJKJH5uNcWwXh7ue9PS1ApWKhdJ5L4f
	Whi3ITflnrc68ufTLTYQJP4xekZLExgfPoaYtIuvKdkAFRK2bDgyjj1z/1vr4A==
X-Google-Smtp-Source: AGHT+IFvVSbjXv5zfDnR6nG8sl7fAYkkrhUdwocf4kSXSPnsBLHgjRTG7CR97aQKft9XsdlSpOpM0w==
X-Received: by 2002:a17:907:9411:b0:a7a:c106:3640 with SMTP id a640c23a62f3a-a80ed2d4853mr164475066b.66.1723534814810;
        Tue, 13 Aug 2024 00:40:14 -0700 (PDT)
Message-ID: <7d390391-4ae2-442e-90a3-d8d242d7ae6f@suse.com>
Date: Tue, 13 Aug 2024 09:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 12:09, Sergiy Kibrik wrote:
> With specific config option INTEL in place and most of the code that depends
> on intel.c now can be optionally enabled/disabled it's now possible to put
> the whole intel.c under INTEL option as well. This will allow for a Xen build
> without Intel CPU support.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/cpu/Makefile            | 6 +++---
>  xen/arch/x86/cpu/common.c            | 4 +++-
>  xen/arch/x86/include/asm/processor.h | 7 ++++---
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
> index eafce5f204..020c86bda3 100644
> --- a/xen/arch/x86/cpu/Makefile
> +++ b/xen/arch/x86/cpu/Makefile
> @@ -6,10 +6,10 @@ obj-y += amd.o
>  obj-y += centaur.o
>  obj-y += common.o
>  obj-y += hygon.o
> -obj-y += intel.o
> -obj-y += intel_cacheinfo.o
> +obj-$(CONFIG_INTEL) += intel.o
> +obj-$(CONFIG_INTEL) += intel_cacheinfo.o
>  obj-y += mwait-idle.o
> -obj-y += shanghai.o
> +obj-$(CONFIG_INTEL) += shanghai.o
>  obj-y += vpmu.o
>  obj-$(CONFIG_AMD) += vpmu_amd.o
>  obj-$(CONFIG_INTEL) += vpmu_intel.o
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index ff4cd22897..50ce13f81c 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -336,11 +336,13 @@ void __init early_cpu_init(bool verbose)
>  
>  	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
>  	switch (c->x86_vendor) {
> +#ifdef CONFIG_INTEL
>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>  				  actual_cpu = intel_cpu_dev;    break;
> +	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
> +#endif
>  	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
>  	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
> -	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
>  	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
>  	default:
>  		actual_cpu = default_cpu;
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
> index 66463f6a6d..a88d45252b 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -507,15 +507,16 @@ static inline uint8_t get_cpu_family(uint32_t raw, uint8_t *model,
>  extern int8_t opt_tsx;
>  extern bool rtm_disabled;
>  void tsx_init(void);
> +void update_mcu_opt_ctrl(void);
> +void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
>  #else
>  #define opt_tsx      0     /* explicitly indicate TSX is off */
>  #define rtm_disabled false /* RTM was not force-disabled */
>  static inline void tsx_init(void) {}
> +static inline void update_mcu_opt_ctrl(void) {}
> +static inline void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val) {}
>  #endif
>  
> -void update_mcu_opt_ctrl(void);
> -void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);

I'm okay-ish with the simple stubbing out for update_mcu_opt_ctrl(), but
set_in_mcu_opt_ctrl() imo requires more work. The call sites in spec_ctrl.c
shouldn't give the wrong impression of having some effect. Imo in
init_speculation_mitigations() an #endif wants to move down, while all of
gds_calculations() wants to be compiled out. And that likely extends to
further Intel-only functions there (with an early bail-out keyed to
boot_cpu_data.x86_vendor != X86_VENDOR_INTEL). Which overall likely means
there wants to be another separate patch dealing with that. (And then
maybe a counterpart one for AMD.)

Jan

