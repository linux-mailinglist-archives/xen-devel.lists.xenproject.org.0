Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039FB2C2A1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 14:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086510.1444724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoL53-0007gk-RW; Tue, 19 Aug 2025 12:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086510.1444724; Tue, 19 Aug 2025 12:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoL53-0007em-Oq; Tue, 19 Aug 2025 12:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1086510;
 Tue, 19 Aug 2025 12:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoL51-0007ee-Gk
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 12:04:43 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afa8072f-7cf4-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 14:04:41 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso733417666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 05:04:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfcb2d1sm1002963966b.62.2025.08.19.05.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 05:04:39 -0700 (PDT)
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
X-Inumbo-ID: afa8072f-7cf4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755605080; x=1756209880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mAycf0BcbE8EVd3TEHzIwYGGPS4T5wc1eHsd7l+5SQE=;
        b=NcGJdi3teWXIJa5/8omMfcGu6qD/kYcAfkBVuXXK9t2rdkThWpznZsGMlti43vGT9/
         LBXYMCsCRaLUu93R1ZxCrm9tw/hJ5rQcdlCNJs3L12HVsRTA8sLpNQWOS0InFkGckbz1
         6c/i5VrELLipSTPDGR4XB8ZwBf/NwBYGofF9/TePrOossoekZXzxj3U/YKSNzEvYgU6i
         quynt3OyMc/yEJHPC9U0OMq2GZYbOw5mDNXyFu70xJo4Jq+8onrcKPvUltOm9CmDtMmy
         IUDAVMiqSCsWYGJuK9aBJNyE1PwuL0ktYttBzuCzamWgRMMvX4Ka1CpM9tewFzCXbHEd
         Le9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605080; x=1756209880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAycf0BcbE8EVd3TEHzIwYGGPS4T5wc1eHsd7l+5SQE=;
        b=qWxzku8FdKmfGXUvy9mcbYhE17lfXxoB2tYUP4xJkaxaxD2oKvG0NCRCqIRdbyGCq3
         zbIYHg4wi61wjRRbGNxP03/wSoUhI23M6jacqTi8VhryIxYq13FdhaL0xHlNbtWdWIji
         dL9ft9WD6pzAkH1P2oRfkFKX6th5ojJ8Xtjvr5B2f7AG7zdIRdjsIZp7eIsB2jI97amT
         nrteQ53ez7AxHKfm59uB8NiHaMe0/FKrkFSUIQU5iH0g9BCSrFJDqZUR60K+21hJzMm0
         pZrCsCy+9moCPYlFRuUM0oIUsPGLtxLW1hPgqlIBlWfudIjkf+Ze4XjGl4R5vZtPG7jy
         YNmA==
X-Forwarded-Encrypted: i=1; AJvYcCUT3vsCCfJlWj/uXOixKtczJHg8SF0mD0ivZASedIuAtdSPe4z59JBefm5O6WvI0HldfuxglUZiNAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv4z9akvzWt3+KIFYaorYIcsZY97MwIQak64rk/CmBi6hDqnn4
	p7Di4DqT10IG58uuA8S8spoCFfRytZWbTEOdeTXsgQNlu9N4CDRuqgTr0ZWBC6bcEQ==
X-Gm-Gg: ASbGncty4GTHzrg1omYqMl6hTQmm8tYmNCW8+YUAymXADSxYHrQpKZP6U1XaxNWjIhx
	HRFihPeuomDnaXE+rCsvlSFHXgwMVgg8fCuT9ROujmxV9EhWxBWg4EWdNLkPgUtJgNIg9ZMtt3u
	BHS0kPd1UEAgY/WCVqwSFYQGeu9CfxUm7StqR+j6RBoVWBA2mzrU/rTqUPu35SAOa2hEsNuUBjA
	ybQT+4huCtT6Qj6spUiW7xpq2Gte2ESUudFkN5YQ4bBLkIs0UjSYy+BhD/Fn17udzbvqyO19Ogu
	/ipKXfydPJDCDzdvm92gQVNWFQIzdF4jiz9I9SkjKTg1kVxXHgYmYgVPQ3ZLLDEgRLgLYrmm3yH
	18n7f1zuYdASXoAb0TiA0dOH4YABEXestT3J8Z5r9uGylUerNiW8MfdB0rIMmkVH1BS8feN50Mu
	J2bIxpEhlilcCr+h+pxw==
X-Google-Smtp-Source: AGHT+IFNN4OAQOuEYS4bIvPGA+DU7fwbl54h3debynjurF/SJyklRLzcw6sKoXIRUJGEpkuhkh7ovw==
X-Received: by 2002:a17:906:c113:b0:af9:5ca0:e4fe with SMTP id a640c23a62f3a-afddd200e55mr201851166b.56.1755605080021;
        Tue, 19 Aug 2025 05:04:40 -0700 (PDT)
Message-ID: <493d4580-62b7-4ff7-9159-4079b4b98f61@suse.com>
Date: Tue, 19 Aug 2025 14:04:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] x86/msr: Change rdmsr() to have normal API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-12-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> We want a consistent MSR API, and these want to be named rdmsr() and wrmsr(),
> but not with their current APIs.  The current rdmsr() flavours writing to
> their parameters by name makes code that reads like invalid C, and is
> unergonomic to use in lots of cases.
> 
> Change the API, and update the callers all in one go.  Where appropriate,
> update the write side to wrmsrns() as per the recommendation.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> I do have a more creative solution if this patch is considered to be too
> large.  https://gitlab.com/xen-project/hardware/xen-staging/-/commit/e13cf25d06d08481e2c138daa1fd902cf36d757b

I'm not concerned by the size of this patch.

> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -23,17 +23,17 @@ static uint32_t __ro_after_init mcu_opt_ctrl_val;
>  
>  void update_mcu_opt_ctrl(void)
>  {
> -    uint32_t mask = mcu_opt_ctrl_mask, lo, hi;
> +    uint32_t mask = mcu_opt_ctrl_mask, val;
>  
>      if ( !mask )
>          return;
>  
> -    rdmsr(MSR_MCU_OPT_CTRL, lo, hi);
> +    val = rdmsr(MSR_MCU_OPT_CTRL);
>  
> -    lo &= ~mask;
> -    lo |= mcu_opt_ctrl_val;
> +    val &= ~mask;
> +    val |= mcu_opt_ctrl_val;
>  
> -    wrmsr(MSR_MCU_OPT_CTRL, lo, hi);
> +    wrmsrns(MSR_MCU_OPT_CTRL, val);
>  }

I don't consider it a good idea to suddenly clear the upper half of this
MSR, and ...

> @@ -51,17 +51,17 @@ static uint32_t __ro_after_init pb_opt_ctrl_val;
>  
>  void update_pb_opt_ctrl(void)
>  {
> -    uint32_t mask = pb_opt_ctrl_mask, lo, hi;
> +    uint32_t mask = pb_opt_ctrl_mask, val;
>  
>      if ( !mask )
>          return;
>  
> -    rdmsr(MSR_PB_OPT_CTRL, lo, hi);
> +    val = rdmsr(MSR_PB_OPT_CTRL);
>  
> -    lo &= ~mask;
> -    lo |= pb_opt_ctrl_val;
> +    val &= ~mask;
> +    val |= pb_opt_ctrl_val;
>  
> -    wrmsr(MSR_PB_OPT_CTRL, lo, hi);
> +    wrmsrns(MSR_PB_OPT_CTRL, val);
>  }

... this one.

> @@ -456,15 +456,15 @@ static void __init probe_mwait_errata(void)
>   */
>  static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>  {
> -	unsigned long lo, hi;
> +	uint64_t val;
>  
>  	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
> -		rdmsr (MSR_IA32_MISC_ENABLE, lo, hi);
> -		if ((lo & (1<<9)) == 0) {
> +		val = rdmsr(MSR_IA32_MISC_ENABLE);
> +		if ((val & (1 << 9)) == 0) {
>  			printk (KERN_INFO "CPU: C0 stepping P4 Xeon detected.\n");
>  			printk (KERN_INFO "CPU: Disabling hardware prefetching (Errata 037)\n");
> -			lo |= (1<<9);	/* Disable hw prefetching */
> -			wrmsr (MSR_IA32_MISC_ENABLE, lo, hi);
> +			val |= (1 << 9); /* Disable hw prefetching */
> +			wrmsrns(MSR_IA32_MISC_ENABLE, val);
>  		}
>  	}

Move val into the more narrow scope at the same time?

> @@ -699,7 +715,7 @@ void cf_check vmx_cpu_dead(unsigned int cpu)
>  
>  static int _vmx_cpu_up(bool bsp)
>  {
> -    u32 eax, edx;
> +    u32 eax;

Like you do elsewhere, switch to uint32_t at the same time?

> --- a/xen/arch/x86/tsx.c
> +++ b/xen/arch/x86/tsx.c
> @@ -42,6 +42,8 @@ void tsx_init(void)
>  {
>      static bool __read_mostly once;
>  
> +    uint64_t val;
> +
>      /*

No real need for yet another newline, I would say.

Jan

