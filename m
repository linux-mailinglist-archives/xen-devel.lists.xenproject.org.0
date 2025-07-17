Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC6EB087F4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046386.1416700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucK1p-0002yS-3d; Thu, 17 Jul 2025 08:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046386.1416700; Thu, 17 Jul 2025 08:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucK1p-0002vw-0Y; Thu, 17 Jul 2025 08:31:45 +0000
Received: by outflank-mailman (input) for mailman id 1046386;
 Thu, 17 Jul 2025 08:31:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucK1o-0002vq-2q
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:31:44 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76f2aacc-62e8-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:31:41 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so378269f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:31:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435f262sm136986235ad.236.2025.07.17.01.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:31:40 -0700 (PDT)
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
X-Inumbo-ID: 76f2aacc-62e8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752741101; x=1753345901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5twmBI/aw0mAd7EFVKNJu8fenpnZg+65IFkjLPIz4Nk=;
        b=O2qn8YLSJphweOH6u1YlZhchXWAM5t/4RbAG75frz4PoD+rVGcoXCyRvygEVLrn6HW
         Rp0aQ1DRmRTO3HZm7f71R81lmeT7j9IuqfXnQXCwKhKdJlUiIP47RJgnKkmEreaTCULx
         oWWAd8Q64rmkHiBsICI3kS6FaiVWyh4bc0InrRyQx08kBXW6uiJCtBuEzYa5dj9/fe9M
         lzlzT38HFS/1bbfHB35xSCoSF8btgA8FvC5EFzTU8S9K8tuiaA2ShR5nqnaI7WwVNCNz
         0aFnXqLozp9V/fIDXG+X4rlqMjV4nC6cCzrhUSEI4QftM09ES2DP1ru6sadcv58eYYKg
         +BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752741101; x=1753345901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5twmBI/aw0mAd7EFVKNJu8fenpnZg+65IFkjLPIz4Nk=;
        b=iaGWwQWPeDSCCdaj8qRAG8JRE3fhAtyTAlREMru6oSWc7n3BCqDzdQvhTYU0PyT+EK
         nybe4RJCsWh4obZNOd4+bU+ZDZlQz3XspQQS+tFBTFCl6QJQg2nCY7Vd/tP62eDV28VX
         p4zMBUNN0vbp9/E8JdvFI9HXESVZBFQp8p3GHoCUTioVvGOR1EDzcQaSDqG60/irr5sR
         Ska9HSbS/VPbhvFr2iigo/Fb8FhK8K4mtbMQewdytZxe0pTFTMnsr3dZb+QqD/qeKlAL
         RJPDwUxxiIsKYMD0YX7tu31iOZGSLkYDMtepSyMzYyK2+lYUrhM7WyZSPNuexZ0AsAwe
         BBJg==
X-Forwarded-Encrypted: i=1; AJvYcCWsTeXaGB7ooiqzsSNQfzKbUbOCw9D7g+o82ZcGwrI+YoWwJKmeVAAaUM0/hMT69abd2A6VCQDmrUI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypBnYg1vYnsQCf6knIgvMNumsKc3K0ympbX20pGQ70I5H4qypE
	S8290cRLITC07Z2hUXDxlbXXn6MPzmLwV0a5G/3LMqJ35pNsXcg1riOp3kWBAyipbg==
X-Gm-Gg: ASbGnctB8Mp+SeStv4fu4pq6EXfm/QQhyCFblLfWg27v/eTDZMcC7+21SdndnkXdiBK
	+bG35gTDsy/cx5F1GUzL0HA0tmaPxkJ9NndcZKTKo8cFYPcU94vU1/c9OJTGRPD+g/3FuBJ5RbP
	qkj6BJlatwfoNyncSRsp1kswhHEoAqiEEyB7V0C53Qb8e4BvIGUBEUQ3mysMKjqYyimz/u/1ElT
	npJ0WLNEUulBao8XUWFcxsNcYqqPrznVaOIJxLpmTmFDGz4y6oftzgSQWj12bBgl9LUdtupPsSk
	SzpeyHMISaPP0Ww+1C98aDaWymY02v/g8v9n+1ZtY6+0ch5Egv+8M12pldETbnimcgVTQGtoum1
	3zDroMw1aPmk0IGg/IK1Y3Id0AR0V+uy8sSakz2ZiGXkaHAeg18fZ3XbK9OFeOq++i6GovYSVWY
	+pLQqlSyo=
X-Google-Smtp-Source: AGHT+IFr7RXUnndHPHRODJuzOgA3T4Ei3vaB2pDzTvbypuID9WboJatCzXPcJPHD2DaJS1smULB22A==
X-Received: by 2002:a05:6000:2f88:b0:3a6:d26a:f0f5 with SMTP id ffacd0b85a97d-3b60e4ed4f2mr4516162f8f.21.1752741101004;
        Thu, 17 Jul 2025 01:31:41 -0700 (PDT)
Message-ID: <3e3df60f-be4f-451c-aeb9-12a8d490cdc2@suse.com>
Date: Thu, 17 Jul 2025 10:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/apic: Convert the TSC deadline errata table to
 X86_MATCH_*()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 19:31, Andrew Cooper wrote:
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1051,64 +1051,32 @@ static void setup_APIC_timer(void)
>      local_irq_restore(flags);
>  }
>  
> -#define DEADLINE_MODEL_MATCH(m, fr) \
> -    { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
> -      .feature = X86_FEATURE_TSC_DEADLINE, \
> -      .driver_data = (void *)(unsigned long)(fr) }
> +static const struct x86_cpu_id __initconst deadline_match[] = {
> +    X86_MATCH_VFMS(INTEL_HASWELL_X,   0x2, 0x3a), /* EP */
> +    X86_MATCH_VFMS(INTEL_HASWELL_X,   0x4, 0x0f), /* EX */
>  
> -static unsigned int __init hsx_deadline_rev(void)
> -{
> -    switch ( boot_cpu_data.x86_mask )
> -    {
> -    case 0x02: return 0x3a; /* EP */
> -    case 0x04: return 0x0f; /* EX */
> -    }
> +    X86_MATCH_VFM (INTEL_BROADWELL_X,      0x0b000020),
>  
> -    return ~0U;
> -}
> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x2, 0x00000011),
> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x3, 0x0700000e),
> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x4, 0x0f00000c),
> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x5, 0x0e000003),

Hmm, actually - why are Broadwell and ...

> -static unsigned int __init bdx_deadline_rev(void)
> -{
> -    switch ( boot_cpu_data.x86_mask )
> -    {
> -    case 0x02: return 0x00000011;
> -    case 0x03: return 0x0700000e;
> -    case 0x04: return 0x0f00000c;
> -    case 0x05: return 0x0e000003;
> -    }
> +    X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x3, 0x01000136),
> +    X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x4, 0x02000014),

... Skylake each split ...

> -    return ~0U;
> -}
> +    X86_MATCH_VFM (INTEL_HASWELL,          0x22),
> +    X86_MATCH_VFM (INTEL_HASWELL_L,        0x20),
> +    X86_MATCH_VFM (INTEL_HASWELL_G,        0x17),
>  
> -static unsigned int __init skx_deadline_rev(void)
> -{
> -    switch ( boot_cpu_data.x86_mask )
> -    {
> -    case 0x00 ... 0x02: return ~0U;
> -    case 0x03: return 0x01000136;
> -    case 0x04: return 0x02000014;
> -    }
> -
> -    return 0;
> -}
> -
> -static const struct x86_cpu_id __initconstrel deadline_match[] = {
> -    DEADLINE_MODEL_MATCH(0x3c, 0x22),             /* Haswell */
> -    DEADLINE_MODEL_MATCH(0x3f, hsx_deadline_rev), /* Haswell EP/EX */
> -    DEADLINE_MODEL_MATCH(0x45, 0x20),             /* Haswell D */
> -    DEADLINE_MODEL_MATCH(0x46, 0x17),             /* Haswell H */
> +    X86_MATCH_VFM (INTEL_BROADWELL,        0x25),
> +    X86_MATCH_VFM (INTEL_BROADWELL_G,      0x17),

... into disjoint groups (continuing ...

> -    DEADLINE_MODEL_MATCH(0x3d, 0x25),             /* Broadwell */
> -    DEADLINE_MODEL_MATCH(0x47, 0x17),             /* Broadwell H */
> -    DEADLINE_MODEL_MATCH(0x4f, 0x0b000020),       /* Broadwell EP/EX */
> -    DEADLINE_MODEL_MATCH(0x56, bdx_deadline_rev), /* Broadwell D */
> +    X86_MATCH_VFM (INTEL_SKYLAKE_L,        0xb2),
> +    X86_MATCH_VFM (INTEL_SKYLAKE,          0xb2),

... here)? The patch already isn't overly straightforward to review without
that.

Jan

