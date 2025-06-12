Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60348AD716C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013076.1391611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhmt-0005LT-4A; Thu, 12 Jun 2025 13:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013076.1391611; Thu, 12 Jun 2025 13:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhmt-0005Jx-0X; Thu, 12 Jun 2025 13:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1013076;
 Thu, 12 Jun 2025 13:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPhms-0004pC-9c
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:16:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 671337ee-478f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 15:16:08 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so595959f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 06:16:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748809d308fsm1371179b3a.72.2025.06.12.06.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 06:16:06 -0700 (PDT)
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
X-Inumbo-ID: 671337ee-478f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749734168; x=1750338968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=35U+F60uK7YOaJDMYu0EyRE5z0hyPIp9rPmS9rZMj30=;
        b=PWFu2n+wFa0X7SAGZWUKbIoIFV3GdCelL35BZ6sAyKLygcGnI9uAOlO7w8NLGnVhPm
         h1Y6lsvhtXiZqKDgddDz9L6Mzjw9KNdlpS4+c3olY2cnCRa+ShfRtX9pyEHqS+O7P/Vj
         0ei92fW0e4iKlTcMsPE5iZ+LHtaX0zUCPfR/axhKWyM/zd6jGfT/jYP0XLZFZ6KAXcic
         PYKiw0kRDZPlQKN0oLBn/wzw5ZdKCRpAN+mq69Z2SQLzvUMpvRc2WG5xBFd9UjV3Jmqb
         7nbSacCRpovF5irRD4wzBJVv+ic0AR0M+INRQseQSqt7As9AIHSgGemYyrq27HvvxCzR
         FNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734168; x=1750338968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35U+F60uK7YOaJDMYu0EyRE5z0hyPIp9rPmS9rZMj30=;
        b=CY1KY0AYuZhYcpIBCVJ8dTb5TBJdh7bBeuh62dFJMuCQgu3X8tnt4JWutplifjT5dz
         R7jxRZd7Lw3DzEBZbE29raeSWFXTePoIkHWuK2QymLJsaXAK09R53fnXNxjuKyzGBUfN
         AcIXTpZEuFKgX+c5QRGoXJ+riFwosa1WASCTBTxSHXT4NcPndAzE8Pn5hUJ+jbicO8SA
         pcMMq/D6NOSIq0mbCKGRMh3zndkJZ0pXMXGhb1yS0gf8XOfEN0uDD4O5jQioIeQ9nmxV
         gBXwIhrGL6ib3+TKFV9RqVFU2F+Nd0OJbxvKqF5xcVFaREIrV5inr967jHnp+CF6hxOJ
         VAww==
X-Forwarded-Encrypted: i=1; AJvYcCX7xjc9OVdYc1NAkTpxnbtw361ujQBWT6uIg6kIifDEfKpwGEUdd60yZHheC/44wfId06DB+wmYCxM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSCT1tj892rGct4NS0TTBl+PnRz40RneWyVemwOSgM0jCVOBIP
	muPL8GvHqyaj+OL9fVIAhs4W0GU1yzGWuI5qR3IBSNZvXINGIXQGH0DZToVLt1yJNw==
X-Gm-Gg: ASbGncue7RIDh2EDwe6JdKOjfY3z/DVDQ294k7iB3RAekGWlpXeNIq/G7SyPh9jIASx
	jgvgveZ2/34S0Kkun/cozYB8VgOD0Y8cDsgiZqBYBTj2kQZudDcmgT73Wd0DMfm5c3ejsqqRcaU
	t00VzI0GssKFMhPe1b/DnGueE6CMjzgUnrhEnoNUfWYdcy50f6hIgoz68uEpDqYtrHslMpCe404
	KZZc49mfyuhg7UgybdtvK+MfTWPwAO16S6xBfaYw/jKYC8DpQ6zvmGr5BVmsHndAQa7TE6l44BC
	pR1cLxfBsUMBn9DpoCil08jz1OFs83Sw2rbOrYlpedqCHNfFRKVnKAeRJTK7G/js0VPkM5D53y/
	GVJt208W3GTI5GMgpyNUAuD/bXV/UiOIu4GRjZA+eNzXta/5VuZcPIrBV+g==
X-Google-Smtp-Source: AGHT+IE3+Jk4YsqtoeyABIQV7PELxHOzIF5uU++RSNuNABcKNqIBz9tHHx4ZSUOLBZZi+JZRy6OP5g==
X-Received: by 2002:a05:6000:40c7:b0:3a5:2e9c:edc with SMTP id ffacd0b85a97d-3a56134958dmr2629906f8f.34.1749734167570;
        Thu, 12 Jun 2025 06:16:07 -0700 (PDT)
Message-ID: <8993b948-24e3-4e3e-bf17-22aa77ba4f25@suse.com>
Date: Thu, 12 Jun 2025 15:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/18] xen/amd: introduce amd_process_freq() to get
 processor frequency
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> When _CPC table could not provide processor frequency range
> values for Xen governor, we need to read processor max frequency
> as anchor point.
> So we extract amd cpu core frequency calculation logic from amd_log_freq(),
> and wrap it as a new helper amd_process_freq().
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - new commit
> ---
> v3 -> v4
> - introduce amd_process_freq()
> ---
> v4 -> v5:
> - make amd_process_freq() static to statisfy Misra demand
> - change "low_mhz", "nom_mhz" and "hi_mhz" parameter to unsigned int
> - fix order of logged frequencies
> ---
>  xen/arch/x86/cpu/amd.c | 58 +++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 3770d75150..8c985466fa 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -611,14 +611,15 @@ static unsigned int attr_const amd_parse_freq(unsigned int family,
>  	return freq;
>  }
>  
> -void amd_log_freq(const struct cpuinfo_x86 *c)
> +static void amd_process_freq(const struct cpuinfo_x86 *c,
> +			     unsigned int *low_mhz,
> +			     unsigned int *nom_mhz,
> +			     unsigned int *hi_mhz)
>  {
>  	unsigned int idx = 0, h;
>  	uint64_t hi, lo, val;
>  
> -	if (c->x86 < 0x10 || c->x86 > 0x1A ||
> -	    (c != &boot_cpu_data &&
> -	     (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1)))))
> +	if (c->x86 < 0x10 || c->x86 > 0x1A)
>  		return;
>  
>  	if (c->x86 < 0x17) {
> @@ -699,20 +700,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>  
>  	if (idx && idx < h &&
>  	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
> -	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
> -		printk("CPU%u: %u (%u ... %u) MHz\n",
> -		       smp_processor_id(),
> -		       amd_parse_freq(c->x86, val),
> -		       amd_parse_freq(c->x86, lo),
> -		       amd_parse_freq(c->x86, hi));
> -	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
> -		printk("CPU%u: %u ... %u MHz\n",
> -		       smp_processor_id(),
> -		       amd_parse_freq(c->x86, lo),
> -		       amd_parse_freq(c->x86, hi));
> -	else
> -		printk("CPU%u: %u MHz\n", smp_processor_id(),
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
> +	} else if (low_mhz)
> +		*low_mhz = amd_parse_freq(c->x86, lo);
>  }
>  
>  void cf_check early_init_amd(struct cpuinfo_x86 *c)
> @@ -723,6 +724,27 @@ void cf_check early_init_amd(struct cpuinfo_x86 *c)
>  	ctxt_switch_levelling(NULL);
>  }
>  
> +void amd_log_freq(const struct cpuinfo_x86 *c)
> +{
> +	unsigned int low_mhz = 0, nom_mhz = 0, hi_mhz = 0;
> +
> +	if (c != &boot_cpu_data &&
> +	    (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1))))
> +		return;
> +
> +	amd_process_freq(c, &low_mhz, &nom_mhz, &hi_mhz);
> +
> +	if (!low_mhz && !nom_mhz && !hi_mhz)

With this ...

> +		printk("CPU%u: %u (%u ... %u) MHz\n",
> +		       smp_processor_id(),
> +		       nom_mhz, low_mhz, hi_mhz);

.. aren't you logging three zeroes here? Considering the earlier mistake
of the order of logged frequencies, did you not think of looking at the
resulting output in the hypervisor boot log?

Same issue again below then.

With all instances corrected:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

