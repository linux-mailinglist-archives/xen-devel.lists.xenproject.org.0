Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE98BCCDB
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717576.1119934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3waD-0005gv-Up; Mon, 06 May 2024 11:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717576.1119934; Mon, 06 May 2024 11:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3waD-0005f8-Ro; Mon, 06 May 2024 11:32:37 +0000
Received: by outflank-mailman (input) for mailman id 717576;
 Mon, 06 May 2024 11:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3waC-0005f2-6I
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:32:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54bf47b0-0b9c-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 13:32:33 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b79451153so14983235e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:32:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r2-20020adfce82000000b0034dd7984d7fsm10450975wrn.94.2024.05.06.04.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:32:33 -0700 (PDT)
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
X-Inumbo-ID: 54bf47b0-0b9c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714995153; x=1715599953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sbwKYqc4ObxT5PtsWwJ+fQdTLqENUDfgL5UhlzbL1a0=;
        b=QywJJThyBumbLeVdl6SjH0g0cYrI6u3qsFCY5Fz6Yp2AcaWIy3KaMcCWiMbSwodsjJ
         fqUnbqz2htwziWRPENFd8uChVONEKB/LhoA+8FIuERgkKiYaw8BCBv0FTcaa+Q19W4i6
         5v+Ks+tmLLvP1T1I6KtiYqoe4F7ti5ax4VnqUagOlCP9RwRJdyGkxgoLzjFZTQxKYOTW
         hxqJdGBxqoVWdBT/Q9pKqpdm2dp53P1hZg9++QV+F8xbB6kUBs4hhnvf+Hcbml9N5sQD
         i9uucJvSpXXyqPPTIAxgoj1X42pbw0Or27SNGNW7zI6I8fP9ItFE6brfyyvzDKNGsXiu
         mvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714995153; x=1715599953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbwKYqc4ObxT5PtsWwJ+fQdTLqENUDfgL5UhlzbL1a0=;
        b=SMqWjnVIN0s4bSTjbdMz9eitDJtF8+PS4yRmSlQs+gudeWM/Jiet9dTucjZ83oz+5V
         ID4iyJsLWdGhy6GpaCeWVA4rGNKn9oPWCnDc+hlSYy+WT0anXB9pAPluoXmMrtWKnIMI
         ifbd4KaJ+Xz1hMO7L3jIzBeTFIFwHzj1eOdS+NJqbrBynjB5/4MG1eo1J4QD9uKV0Wfi
         9rwgTm5SRR8tSKV8s7NIzerwv+UbyzgXjGHB4URFaziWJBY175sNqZ+8+EvQ5yIDSoUl
         ruecl1YXALGCajEsLDW8oJUTt+CH6EIZDxBq/YbPVw5T28CYdaglGHhF4ok4SPUk0G7c
         ktOA==
X-Forwarded-Encrypted: i=1; AJvYcCVVJT2V0J4B4ioJCWFmMBNRTipgjblifLdzlBpkqhRQuawoZTtdWbU2kplvDPpvXbWqwVHfPJeht/8+CK+iHWQvbpAs31hx1nJbgacdm1U=
X-Gm-Message-State: AOJu0Yzpmm8lKSEEho7GdkR+c6fZNR8Iaflb3jLDKW/j2weAfvDNrAI6
	hMIKi0lxkK1yW76JRZHBYrQDEkAzjKwINeFjQ9kb7UegdJoR+Getv7af5Oeatw==
X-Google-Smtp-Source: AGHT+IF0lYVjmW/3y7oemnIhn9f0F2zG9N/m9PTI+XSBjHavdQcZ+hJ9Y/yM43qJ5lpw9A5k9i32eA==
X-Received: by 2002:a05:600c:3b02:b0:418:f760:abfb with SMTP id m2-20020a05600c3b0200b00418f760abfbmr6528723wms.5.1714995153288;
        Mon, 06 May 2024 04:32:33 -0700 (PDT)
Message-ID: <dc14d45e-b2b2-4414-a937-ae95115aa2cd@suse.com>
Date: Mon, 6 May 2024 13:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] x86/MCE: optional build of AMD/Intel MCE code
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <47d32ecff7b915bd23b6d13b76cedf4b39db71a2.1714640459.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <47d32ecff7b915bd23b6d13b76cedf4b39db71a2.1714640459.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 11:21, Sergiy Kibrik wrote:
> Separate Intel/AMD-specific MCE code using CONFIG_{INTEL,AMD} config options.
> Now we can avoid build of mcheck code if support for specific platform is
> intentionally disabled by configuration.
> 
> Add default return value to init_nonfatal_mce_checker() routine -- in case
> of a build with both AMD and INTEL options are off (e.g. randconfig).

I'm afraid that, as before, I can't accept this as a justification for the
addition. The addition likely is wanted, but perhaps in a separate up-front
patch and explaining what's wrong when that's missing.

> Also global Intel-specific variables lmce_support & cmci_support have to be
> redefined if !INTEL, as they get checked in common code.

Them being checked in common code may have different resolution strategies.
The justification here imo is that, right now, both variables are only ever
written by mce_intel.c. As mentioned for vmce_has_lmce(), there's nothing
fundamentally preventing MCG_CAP from having respective bits set on a non-
Intel CPU.

> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -40,7 +40,11 @@ enum mcheck_type {
>  };
>  
>  extern uint8_t cmci_apic_vector;
> +#ifdef CONFIG_INTEL
>  extern bool lmce_support;
> +#else
> +#define lmce_support (false)

Nit: Neither here nor ...

> @@ -120,7 +124,11 @@ DECLARE_PER_CPU(struct mca_banks *, poll_bankmask);
>  DECLARE_PER_CPU(struct mca_banks *, no_cmci_banks);
>  DECLARE_PER_CPU(struct mca_banks *, mce_clear_banks);
>  
> +#ifdef CONFIG_INTEL
>  extern bool cmci_support;
> +#else
> +#define cmci_support (false)

... here parentheses are really needed.

> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
> @@ -24,14 +24,20 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>  	 * Check for non-fatal errors every MCE_RATE s
>  	 */
>  	switch (c->x86_vendor) {
> +#ifdef CONFIG_AMD
>  	case X86_VENDOR_AMD:
>  	case X86_VENDOR_HYGON:
>  		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>  		amd_nonfatal_mcheck_init(c);
>  		break;
> +#endif
> +#ifdef CONFIG_INTEL
>  	case X86_VENDOR_INTEL:
>  		intel_nonfatal_mcheck_init(c);
>  		break;
> +#endif
> +	default:
> +		return -ENODEV;
>  	}
>  	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>  	return 0;

Along the lines of remarks on earlier patches, it would be a good opportunity
here to add missing blank lines between non-fall-through case blocks.

Jan

