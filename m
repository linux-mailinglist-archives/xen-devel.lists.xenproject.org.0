Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF95A60ADC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913921.1319772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt08I-0001dh-Iz; Fri, 14 Mar 2025 08:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913921.1319772; Fri, 14 Mar 2025 08:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt08I-0001av-GK; Fri, 14 Mar 2025 08:11:06 +0000
Received: by outflank-mailman (input) for mailman id 913921;
 Fri, 14 Mar 2025 08:11:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt08G-0001ap-UN
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:11:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddc8fade-00ab-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:11:01 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso17014195e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:11:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda208sm9884165e9.6.2025.03.14.01.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:11:01 -0700 (PDT)
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
X-Inumbo-ID: ddc8fade-00ab-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741939862; x=1742544662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gQnJxMrTItJAM9neeKO1+D02uWe37tjN9Id/ycVnCPQ=;
        b=AH2dcMo5RH+49zDpF9OB2ig3j6ZO9a83qZmTCPLBepwbEg/vOOSydXV6xnCUs/Wkzs
         egBq7Em71QMHGrdPkuzHRm/Bk69+3z81kWb6jm1OTuZpkvQCXAJzlx99gEnR6VKW2jDS
         mOCLSXb2AbvdDBQqOnP3850koAYOlpvKjmIaAvBeLrhqLrgaiJFCvXXFqa+Edy0ITZJM
         mayPU996q4vWeVLj2EJqDM8VS4xivRuaG26FrxuUrCtRgQVqN2yOCFtvVeroOX2rNunP
         IZ9fpO5Nfsu0Vgq3zgFP46Q1WAOe9D6zwaOCUqf5FBqcyau4wjhqfZRGGw/FVN8fBUt1
         68bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939862; x=1742544662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQnJxMrTItJAM9neeKO1+D02uWe37tjN9Id/ycVnCPQ=;
        b=UJC8pjjvIZkFSNV0Y+GW1ne6DB+MWp9fC8SqBD23gR7c3rnQY/6b04EVuGrPwp8GjT
         uOX/yYtTJXF8YjJTkfDPiX56qp4usEqZvwxeQVWmuE2aZR/pB2ptkyZa/W0+L5ZFzIDZ
         54tGIn7twOt0i8XKqo+8AjAoZHu0APOBBIK0MI090LhJUG1Xq7CqVLpS6LrbUFrWE8g/
         m3hfzeqIEERIbVRHHuR6uxQyBcbKVGh6TRrINFVovAul4yER2Glit6KkDMhviwLPfyK5
         Ofi7ardjpTdQdcMRuO4rooxkPxumNqwuHrHyWUhyKiESMFirywfFynYXqjIz0DK2FHFn
         pG4g==
X-Forwarded-Encrypted: i=1; AJvYcCXvHC3xT0c0W6ntp6YK2SA98LxDZCwrzo4QxGM/WUATXOkBTdaMSSt6WG9WN4Fgv6R8Tif3BFEv4Bw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQcgVVfERPRAsYi+32zVGI/UrqJsTq9wTBGfKxx29e5YqAIic1
	H4AbQLklBw4h45YJFKllbVrlrFlbmQiiCkUrOPihAswxzRfLoLH+nX6sMrc2mQ==
X-Gm-Gg: ASbGncsdknaILpGE2wxNZ3lBqQE+OInQyMH2ZbEBZ4OlU+OmMSVZOro08uLTYXHH4Qw
	CA8wGv/7GoDU8GPCCcf0a7bgsrGrJol7HMBsVagXvgs54FHJyLL5/Sxtq9O+0jhwFka8nWjodw4
	85xJG6aut+4+4LDHVA4tmCnVC7g79iyD+L2nFXXYdj02lqYcezyUvGACDZKb2Ez912dCm56CQbT
	teekwcI7ggiPcFUsE2/fQ2W28IWaE84F5QS/owuvHlIZZLN7bHwM8tvgJly4G6zNV1PWkwo3LrZ
	WuPYuxpmUR8WrbW/yoM0ovIw3yaXN6m/2MbThXPC0enyl7+7OM+RFp9pOAnpB0LqDPhvp8Y7zmV
	rkZ8TLB9scNof2amXIVKokMEnH/+xzg==
X-Google-Smtp-Source: AGHT+IGE8oI1VEfiHu/c2MAm0ZcfLGl9dTxGz/8ahRtYDME2zjQJmPh6ihR4MtpOfSd5TmC06YtFGg==
X-Received: by 2002:a05:600c:4708:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43d1ec72502mr21376015e9.5.1741939862110;
        Fri, 14 Mar 2025 01:11:02 -0700 (PDT)
Message-ID: <eaf90340-929c-4c89-99cf-0383918e9d5a@suse.com>
Date: Fri, 14 Mar 2025 09:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/dom0: placate GCC 12 compile-time errors with
 UBSAN and PVH_GUEST
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-4-roger.pau@citrix.com>
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
In-Reply-To: <20250313153029.93347-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 16:30, Roger Pau Monne wrote:
> When building Xen with GCC 12 with UBSAN and PVH_GUEST both enabled the
> compiler emits the following errors:
> 
> arch/x86/setup.c: In function '__start_xen':
> arch/x86/setup.c:1504:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
>  1504 |             end = consider_modules(s, e, reloc_size + mask,
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1505 |                                    bi->mods, bi->nr_modules, -1);
>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/setup.c:1504:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
>   686 | static uint64_t __init consider_modules(
>       |                        ^~~~~~~~~~~~~~~~
> arch/x86/setup.c:1535:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
>  1535 |             end = consider_modules(s, e, size, bi->mods,
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1536 |                                    bi->nr_modules + relocated, j);
>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/setup.c:1535:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
>   686 | static uint64_t __init consider_modules(
>       |                        ^~~~~~~~~~~~~~~~
> 
> This seems to be the result of some function manipulation done by UBSAN
> triggering GCC stringops related errors.  Placate the errors by declaring
> the function parameter as `const struct *boot_module` instead of `const
> struct boot_module[]`.
> 
> Note that GCC 13 seems to be fixed, and doesn't trigger the error when
> using `[]`.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4a32d8491186..bde5d75ea6ab 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -684,7 +684,7 @@ static void __init noinline move_xen(void)
>  #undef BOOTSTRAP_MAP_LIMIT
>  
>  static uint64_t __init consider_modules(
> -    uint64_t s, uint64_t e, uint32_t size, const struct boot_module mods[],
> +    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
>      unsigned int nr_mods, unsigned int this_mod)
>  {
>      unsigned int i;

While I'm okay-ish with the change, how are we going to make sure it won't be
re-introduced? Or something similar be introduced elsewhere?

Jan

