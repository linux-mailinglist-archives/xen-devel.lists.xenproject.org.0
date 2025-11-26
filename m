Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EDBC88578
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 07:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172314.1497398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO9V2-0001rW-Pr; Wed, 26 Nov 2025 06:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172314.1497398; Wed, 26 Nov 2025 06:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO9V2-0001pJ-MI; Wed, 26 Nov 2025 06:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1172314;
 Wed, 26 Nov 2025 06:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vO9V1-0001pD-H6
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 06:59:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ae9bff-ca95-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 07:59:34 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso27032525e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 22:59:34 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52?
 (p200300cab70c6a15dd939ad410e5cb52.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc6220sm27622525e9.2.2025.11.25.22.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 22:59:33 -0800 (PST)
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
X-Inumbo-ID: 76ae9bff-ca95-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764140374; x=1764745174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WVdmRoJZPnE2C4JnKRVRS7SAr+0iskPtZySRJg+foSM=;
        b=fF+hvNfRxigdKNL6EHMRrZ7N961LWajBO9WBLmgd94J7Kj9+W5pTmKCEQj9464veWc
         aUzCh40u5oC7t1kqBnwP+LJY7gYcxUAIxqIxuS8T7Yx5jV+oNylDgI/glpX7zi8MgIVb
         szThQlYLJkuWDdvuWiQa7xP7WnujACtrDP3YC5399FWcBn0Iwfm++njrR8IWG3CABsN3
         xWknVXaC8ux0kNlXXYvR06mzPYH8bjldN0vGvYrrM8H59UqV+joIlVo+WZ0SHGRw/qqk
         8B5RmaSb0FAGvq8oXcSrHX7eawK4dYcIvfHJpRqr7UFS7YtrEW0GEMoovWLLmbwF5zfh
         jI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764140374; x=1764745174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVdmRoJZPnE2C4JnKRVRS7SAr+0iskPtZySRJg+foSM=;
        b=R0+Gwc4SsUVkOVaCNKultsBT8bumwoGQgCuYkqzMVgNmRYKrt4b08ocL2cyD4TPqTL
         Kcb+Ya/4JHXHY8+McZUuMYmXt410e74uKMeayiPXvUYY875QeRm0y1TzDguMc/4qRzkK
         74O2P/cBYvcy7UtZTqDGrr6ALW/a8Agvl22hOt5r2QhRm5FoZc33CC4pur6dLWmWtgLX
         6BZ+eTRLNlDSzNeVN9H8qeKnLAM+wWJQn+ErAzwG8tU8bUzxAWNT2o+JeUNbuWLyOhin
         YOLmn7mgEG1Q10NJAiCQAgNRNZX6XPKIm/G/CaCAxkYwX+/GhO4ez6pusglw/Ebo28or
         9eZw==
X-Forwarded-Encrypted: i=1; AJvYcCXNV7OlT1mS6l2ceMLYDOpdJelamWbCuYtgWFdiYxxuKDsef71sLwNA2IW6dBzW1JHpziDM2+mWv4o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHkabk/NwDYe6yvL4EEIioGPUNV1XI0SSOTJBCzevYV1kQUGWE
	Je+LmEyJZj6Rnp+o8WWKCR4jitq3owV1q4hLUf2T3Yt/MuluFildf9YwJa6SnvKrog==
X-Gm-Gg: ASbGnctx/QMNW3wdbyejFiy4JrfstbT2UNzz78y4TIo3QR3pni1wtMbgIE7AYrZ/oFY
	bR9gD0AimFaKaYUmLSdW82s/7hHnNsOVG8ISRoRlFyVcD5BUeM4LulLOtmhaz2srLRsOqJunKTl
	6tnGS3TUVsm1V5no1kUVwxmoLiWKe2AaihcsTeqEAlA8TjMdiFk/rrDXqGFvRdeWzdWeEh2wgOZ
	BPoPHCAi4YmnfCC7L0AJmqAaw4Ry792vy19k3apVV5DutDyH7+Nj2+U9gcLPRdyRAuOphTWMJkd
	/1F4ZuuzFVTpTU9qhpsn/DRQzAqJcO+reKzpetfLsUL2WLZOsdCFugCBU7MzXgR+TRg1IpWtt7h
	kz42sGIh6ym/hs4LrOETCK2+R820LetuladA1fBsRF/0xfYIRpdy9vArzYLpl+iPj7DQ1EIjJZp
	3dxwvumAk3N+rwk1ZHv7H0jgliz+HtRXXoVqUNIa+4WH+/856rjxxt11GIjAOdyE74+QtC8vDTE
	LGi/a4ElRGs3/geHiSgrqldh8pU1LsBXZBpAU0UfePm/bnQ
X-Google-Smtp-Source: AGHT+IH1eUpzPmYTXhwP5R98qUSxtgqI4CAT/6/FqoUP4fQy6qjFxaYovkkWmQVr6vbfnHK5izFy9A==
X-Received: by 2002:a05:600c:4fcc:b0:471:9da:5252 with SMTP id 5b1f17b1804b1-477c01ebe2amr176970545e9.29.1764140373645;
        Tue, 25 Nov 2025 22:59:33 -0800 (PST)
Message-ID: <f349a91b-89bc-4489-aff2-2590b521621d@suse.com>
Date: Wed, 26 Nov 2025 07:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: move save/restore under HVM_SAVE_RESTORE
 config
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251125230040.3070954-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251125230040.3070954-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 00:00, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Introduce separate HVM_SAVE_RESTORE config for HVM save/restore feature,
> which is enabled by default for HVM and depends on MGMT_HYPERCALLS config.
> 
> This allows to make MGMT_HYPERCALLS specific changes more granular and, if
> required, make HVM save/restore optional, selectable feature.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> I'd like to propose this patch as a replacement of Patch 19 [1]
> 
> [1] https://patchwork.kernel.org/project/xen-devel/patch/20251121105801.1251262-20-Penny.Zheng@amd.com/
> 
>  xen/arch/x86/cpu/mcheck/vmce.c       | 4 ++--
>  xen/arch/x86/emul-i8254.c            | 4 +++-
>  xen/arch/x86/hvm/Kconfig             | 6 ++++++
>  xen/arch/x86/hvm/Makefile            | 2 +-
>  xen/arch/x86/hvm/hpet.c              | 3 ++-
>  xen/arch/x86/hvm/hvm.c               | 4 ++++
>  xen/arch/x86/hvm/irq.c               | 2 ++
>  xen/arch/x86/hvm/mtrr.c              | 2 ++
>  xen/arch/x86/hvm/pmtimer.c           | 2 ++
>  xen/arch/x86/hvm/rtc.c               | 2 ++
>  xen/arch/x86/hvm/vioapic.c           | 2 ++
>  xen/arch/x86/hvm/viridian/viridian.c | 2 ++
>  xen/arch/x86/hvm/vlapic.c            | 3 ++-
>  xen/arch/x86/hvm/vpic.c              | 2 ++
>  xen/arch/x86/include/asm/hvm/save.h  | 5 ++++-
>  15 files changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
> index 1a7e92506ac8..ba27f6f8bd91 100644
> --- a/xen/arch/x86/cpu/mcheck/vmce.c
> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
> @@ -349,7 +349,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
>      return ret;
>  }
>  
> -#if CONFIG_HVM
> +#if defined(CONFIG_HVM_SAVE_RESTORE)

#if wasn't really correct to use here; #ifdef was and is wanted.

>  static int cf_check vmce_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
>  {
>      struct hvm_vmce_vcpu ctxt = {
> @@ -380,10 +380,10 @@ static int cf_check vmce_load_vcpu_ctxt(struct domain *d, hvm_domain_context_t *
>  
>      return err ?: vmce_restore_vcpu(v, &ctxt);
>  }
> +#endif /* CONFIG_HVM_SAVE_RESTORE */
>  
>  HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt, NULL,
>                            vmce_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
> -#endif

Why would this #endif move? (It gaining a comment is fine of course.)

> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -409,7 +409,9 @@ void pit_stop_channel0_irq(PITState *pit)
>      destroy_periodic_time(&pit->pt0);
>      spin_unlock(&pit->lock);
>  }
> +#endif
>  
> +#if defined(CONFIG_HVM_SAVE_RESTORE)

Hmm, again - please use the shorter #ifdef.

> @@ -507,9 +509,9 @@ static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
>  
>      return rc;
>  }
> +#endif /* CONFIG_HVM_SAVE_RESTORE */
>  
>  HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_check, pit_load, 1, HVMSR_PER_DOM);
> -#endif

And again - why move it?

> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -93,4 +93,10 @@ config MEM_SHARING
>  	depends on INTEL_VMX
>  	depends on MGMT_HYPERCALLS
>  
> +config HVM_SAVE_RESTORE
> +	depends on MGMT_HYPERCALLS
> +	def_bool y
> +	help
> +	  Enables HVM save/load functionality.
> +
>  endif

This wants to move up some imo; MEM_SHARING is clearing the more niche feature.

> --- a/xen/arch/x86/include/asm/hvm/save.h
> +++ b/xen/arch/x86/include/asm/hvm/save.h
> @@ -123,6 +123,7 @@ void hvm_register_savevm(uint16_t typecode,
>  
>  /* Syntactic sugar around that function: specify the max number of
>   * saves, and this calculates the size of buffer needed */
> +#ifdef CONFIG_HVM_SAVE_RESTORE
>  #define HVM_REGISTER_SAVE_RESTORE(_x, _save, check, _load, _num, _k)      \
>  static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
>  {                                                                         \
> @@ -137,7 +138,9 @@ static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
>      return 0;                                                             \
>  }                                                                         \
>  __initcall(__hvm_register_##_x##_save_and_restore);
> -
> +#else
> +#define HVM_REGISTER_SAVE_RESTORE(_x, _save, check, _load, _num, _k)
> +#endif

By suitably moving the #endif-s I would hope we can get away without this
dummy #define.

Jan

