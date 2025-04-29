Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A11AA0DF1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972699.1361006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lPW-0003Cr-Mp; Tue, 29 Apr 2025 13:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972699.1361006; Tue, 29 Apr 2025 13:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lPW-0003Aw-K3; Tue, 29 Apr 2025 13:54:10 +0000
Received: by outflank-mailman (input) for mailman id 972699;
 Tue, 29 Apr 2025 13:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9lPV-0003Aq-7t
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:54:09 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b92000e-2501-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 15:54:08 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so1079878466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 06:54:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed6affesm781606266b.130.2025.04.29.06.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 06:54:06 -0700 (PDT)
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
X-Inumbo-ID: 6b92000e-2501-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745934847; x=1746539647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jym2KC8L4FuBx1GFrNl/3YF2Ljt7pmQWFYO6FxDZRyU=;
        b=RrrX8gr+VxbsA9d5Uko8aeW4LPlGizxM3myqu+wvlcMqijby1exr5tE7AtRfi9vSvL
         1hjNJGHDVsrre6WZHYfmnKitt/1P+w3yTWCjwrdwifoMV2v6938tB+O8kDc4d30wT8SD
         D8MRWfFNezPoWlHZ1jNWqs+wE5imkE1Wi7go34Z8ecku/PywELjHrBwJtFe81w67wFGU
         dWg+4hQnQv0gMmxkqPl6Rb9o4QgX8qhZyKSGMKNvybVNdV09ycHiOyyr1gSwAVu1IrHQ
         Bxx9T3o9/OzBiXdRQeMYGx1k5aALIKvKC9NEZ8XPL2VPMmAfVc7m5v6DeUqTdXzGOIrK
         pCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934847; x=1746539647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jym2KC8L4FuBx1GFrNl/3YF2Ljt7pmQWFYO6FxDZRyU=;
        b=oqpGMHf9gKXlbRBQCBRmamUeDoY/jfhYJSPmq7/cLYd6pg8XBAt+gkAgj7qGbkra0c
         JlQPJ0K0TWruO7f6dEorxsQUGJzZaJDwhtu0/U7scWibRg0RSngL3sm/wkyGyZXczofi
         TiGUR2oVJ7fVYNHxP4wD4r3GDCAkjWzSEpnptHHMusj/k+Uo2cbvc3PHSsZAWGEAZ0gq
         QjLaZk+Gom3xBZvQ8EpxfrjK+woElIUSpcD6fksEJWBoQ52OCdkG2SFetNBaXCz6Cl7G
         gI4/IRavAFc2FrHvI6yeYXmtbUfoNYB+KLFWjCTEe+Oombp/81vAhBD94zFUaepBClgm
         vFug==
X-Forwarded-Encrypted: i=1; AJvYcCU2QCh+8n3tPANmfGxFbhFTvdf/zdsHY9ATZumrHhEX+Jkwp+T90YJZ9hhOmgY6JgxzWOC5sEW8QiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygphQJqbmpB5IUaxjynYvrnlrMtNeJ669AyQm8JSLOW7Jwu4MQ
	hrKKPxfLW7ysTIs+8DEW1FU0ClTsVIddz8uzkMuh2oWE239gbC1bCuezMBqrug==
X-Gm-Gg: ASbGnctWKT/H9B7FI4atQppdxoUqGTh7XtECge4xW3CI/nIXWx0Q0CM+t/tAZpU5l5I
	lcWSOWLJCRULHhabMPoojXTCUwYhl6IfcNh7VPQlJkvbreh7HU+0V40wqw5e5d5+hwzaQeaOlkS
	ikgdgaatnJHlttx4TjE9ivxpZ3upLSxoXy/CBGo27qei7NZqMJwt7E2DzTqDro6FATzJ6GHshki
	G1aMdA3L4/ijn8Ijo5BIGth04lWjP2aQyPvzbeLcMsD/aDUps9oCWUdZuk7P0eHst4CODXxVxsa
	ewgd8ttM9n34gl8goR5NMpaDozYtR701Yca33paTpemUdIgRNHJOywuyQHrpwTHf9eblo0kv1LT
	mf98YaQTPx4E7MfEyqUKqUXE1+w==
X-Google-Smtp-Source: AGHT+IHdNW4lraAV6sHJxyoCDu+JVjpAP0bv6o4+W5N0SB8CGH/7R6sGj3UbSoI6C3AfhlCr7LrdfQ==
X-Received: by 2002:a17:907:72d3:b0:ac8:1cf7:7aa7 with SMTP id a640c23a62f3a-acec84d2cebmr264185166b.15.1745934847412;
        Tue, 29 Apr 2025 06:54:07 -0700 (PDT)
Message-ID: <4332c290-f67e-425e-bdac-20bff38c288d@suse.com>
Date: Tue, 29 Apr 2025 15:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] xen/amd: introduce amd_process_freq() to get
 processor frequency
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -57,7 +57,6 @@ bool __initdata amd_virt_spec_ctrl;
>  static bool __read_mostly fam17_c6_disabled;
>  
>  static uint64_t attr_const amd_parse_freq(unsigned char c, uint64_t value);
> -#define INVAL_FREQ_MHZ  ~(uint64_t)0
>  
>  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
>  				 unsigned int *hi)
> @@ -596,14 +595,13 @@ static uint64_t amd_parse_freq(unsigned char c, uint64_t value)
>  	return freq;
>  }
>  
> -void amd_log_freq(const struct cpuinfo_x86 *c)
> +void amd_process_freq(const struct cpuinfo_x86 *c,

Misra demands that functions only used in a single CU be static.

> +		      uint64_t *low_mhz, uint64_t *nom_mhz, uint64_t *hi_mhz)

See comments on patch 07 as to types used here.

> @@ -684,20 +682,21 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>  
>  	if (idx && idx < h &&
>  	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
> -	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
> -		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
> -		       smp_processor_id(),
> -		       amd_parse_freq(c->x86, val),
> -		       amd_parse_freq(c->x86, lo),
> -		       amd_parse_freq(c->x86, hi));
> -	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
> -		printk("CPU%u: %lu ... %lu MHz\n",
> -		       smp_processor_id(),
> -		       amd_parse_freq(c->x86, lo),
> -		       amd_parse_freq(c->x86, hi));
> -	else
> -		printk("CPU%u: %lu MHz\n", smp_processor_id(),
> -		       amd_parse_freq(c->x86, lo));
> +	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
> +		if (nom_mhz)
> +			*nom_mhz = amd_parse_freq(c->x86, val);
> +		if (low_mhz)
> +			*low_mhz = amd_parse_freq(c->x86, lo);
> +		if (hi_mhz)
> +			*hi_mhz = amd_parse_freq(c->x86, hi);
> +	} else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
> +		if (low_mhz)
> +			*low_mhz = amd_parse_freq(c->x86, lo);
> +		if (hi_mhz)
> +			*hi_mhz = amd_parse_freq(c->x86, hi);
> +	} else
> +		if (low_mhz)

Why does this "else if()" extend across two lines?

> @@ -708,6 +707,29 @@ void cf_check early_init_amd(struct cpuinfo_x86 *c)
>  	ctxt_switch_levelling(NULL);
>  }
>  
> +void amd_log_freq(const struct cpuinfo_x86 *c)
> +{
> +	uint64_t low_mhz, nom_mhz, hi_mhz;
> +
> +	if (c != &boot_cpu_data &&
> +	    (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1))))
> +		return;
> +
> +	low_mhz = nom_mhz = hi_mhz = INVAL_FREQ_MHZ;
> +	amd_process_freq(c, &low_mhz, &nom_mhz, &hi_mhz);
> +
> +	if (low_mhz != INVAL_FREQ_MHZ && nom_mhz != INVAL_FREQ_MHZ &&
> +	    hi_mhz != INVAL_FREQ_MHZ)
> +		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
> +		       smp_processor_id(),
> +		       low_mhz, nom_mhz, hi_mhz);

This doesn't match the original order of frequencies logged.

Jan

