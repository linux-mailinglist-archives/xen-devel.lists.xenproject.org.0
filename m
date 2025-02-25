Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6554FA438B8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895530.1304186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqut-0001fw-AN; Tue, 25 Feb 2025 09:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895530.1304186; Tue, 25 Feb 2025 09:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqut-0001dx-6z; Tue, 25 Feb 2025 09:07:51 +0000
Received: by outflank-mailman (input) for mailman id 895530;
 Tue, 25 Feb 2025 09:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmqus-0001dp-0s
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:07:50 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb826816-f357-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 10:07:48 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2f3so3866004f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 01:07:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fc31fsm1539703f8f.87.2025.02.25.01.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 01:07:47 -0800 (PST)
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
X-Inumbo-ID: fb826816-f357-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740474467; x=1741079267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TiJAiHESl5tl6eyE/GYnGssvyGLXXENH2SKuAtA8UEg=;
        b=IDJ3gJe9+b3zt/3yUnIwae8Z7v8kEVJnQBkuo8z+s13MWxOonno7AyuCpqq4hdXo4h
         4zd+vBlcnpPVt0VQfPfnIuH9sPvD2lmIgImPvkSzEv/pUucCsR5dk98Js+gxIFCDil1y
         A4BQFvn9G9ZyMvU0taRq4cp3tP8pE/J0akQ3P24VZwyG19Vn9JKaxCvnOL332GBot53G
         xIzn0gwUdbdq3PnswKPlAPR/hZYP2EHIk+AVzh05PMCiTXqrm0oZ2nBYRhEoFfeQWWYN
         Ht3BeQNBQK3/9fkuWXN3vKwm4DoFofRgn+nC/8HrbT0Rcsr8+80budeb7H5Cw+mKvpMi
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474467; x=1741079267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiJAiHESl5tl6eyE/GYnGssvyGLXXENH2SKuAtA8UEg=;
        b=rAoxemyh4KW49KzRsV3+g/hDzeb1uPFORsDF67OWBQaNZKiJlQS+D6OzeFekOKoptr
         6asLxLcNrPM9rs5JVh/JEsNb2E7Bt9s8HmnjM4NfmX+wYu2XMQTYKI+GiUBHDk/5pfKD
         kULw41cTh2g58xgJq5edTSGlrD/X70Z+InA7epzwf3YbeK6oorzgAXKIGJojHaEE6SZB
         ZyIulZsYE95/IY772T2mubDrgRTosrdW3nrK+X37R/kLTWMdq9OTlibkMAE/p6ZvktGp
         29CO1tAduIkfsYz5KL0C4vFTLoPxZ/0e/J5lHpkGb7dicEw/qve1OEbW25IQ6OuYJ1PY
         palQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCUzNSK4vITtocrkMpfMIZY66qcYkj9ANEErvb4XXF6BhtINDDfMuhNVL16Lylw+Kak9ufL+4+Isg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxAEXoHOBjwlYdhN3kIxxu2Ji8tf6u6B0Yg1G+KwRAJNCatLgr
	bAdKVniYwOXswk07AofOgT109P5Wjoi9s+K3OcXDy4LkdPkTSgJycQmx4Yb79Q==
X-Gm-Gg: ASbGnctamaWEw+nIY11TH0GhUnjiudJbGiweFVFwWkK7W7McmecLemgIZ4FMuqyVpke
	DDHLg5gdDXpokZB0Zqy1fITQvLmUXLkLZdzwAkpzBtCC4aXNmMRY9kcl3Uq2eq2hWVdeAQxTFyU
	EFvRQ4zESQ0AVo4wdsVnX61VtgbCXkykXIH/lTzzSpX66FXD6PFZyQ1xDYmPfUphFLk5y7s8xbX
	GbPVrJCvra3nxbzYfH62c82TTwNkeujBc2tVlYf7geLSm7GKaVW7L1x4Ek2xDFZodObfaWq2awt
	QeAsMe/zjPqYXIx8W9AzS2G/Rgx31Mg3RbEaog4wceg+u47odJwOQ5W1ZemwSDAh1GnDyC/rDrr
	0xfMtaN/6dI0=
X-Google-Smtp-Source: AGHT+IH6cwdE1Si1KX5Nuxm8t3r7j/WZudLsL+MnbebYWpQT+RVRd9pf/dGTagJs8dJdh0UVvXBf7A==
X-Received: by 2002:a5d:6c63:0:b0:38f:2a7f:b6cd with SMTP id ffacd0b85a97d-38f7079a134mr11607382f8f.20.1740474467487;
        Tue, 25 Feb 2025 01:07:47 -0800 (PST)
Message-ID: <59e8952f-d49b-46de-ab57-07536a1028c0@suse.com>
Date: Tue, 25 Feb 2025 10:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/IDT: Make idt_tables[] be per_cpu(idt)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250224160509.1117847-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 17:05, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -819,6 +819,7 @@ void load_system_tables(void)
>  	 * support using ARRAY_SIZE against per-cpu variables.
>  	 */
>  	struct tss_page *tss_page = &this_cpu(tss_page);
> +        idt_entry_t *idt = this_cpu(idt);

Nit: Tab indentation here.

> @@ -830,7 +831,7 @@ void load_system_tables(void)
>  		.limit = LAST_RESERVED_GDT_BYTE,
>  	};
>  	const struct desc_ptr idtr = {
> -		.base = (unsigned long)idt_tables[cpu],
> +		.base = (unsigned long)idt,
>  		.limit = sizeof(bsp_idt) - 1,
>  	};

Coming back to the comment on the earlier patch: Now that you touch all
of the idt_tables[] uses anyway, ...

> @@ -30,7 +31,7 @@ typedef union {
>  } idt_entry_t;
>  
>  extern idt_entry_t bsp_idt[X86_IDT_VECTORS];
> -extern idt_entry_t *idt_tables[];
> +DECLARE_PER_CPU(idt_entry_t *, idt);

... this probably really ought to become

DECLARE_PER_CPU(idt_entry_t (*)[X86_IDT_VECTORS], idt);

?

Jan

