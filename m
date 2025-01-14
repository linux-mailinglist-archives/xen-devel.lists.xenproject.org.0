Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04190A10CCC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 17:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871581.1282562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkCf-0007tZ-5b; Tue, 14 Jan 2025 16:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871581.1282562; Tue, 14 Jan 2025 16:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXkCf-0007ru-2p; Tue, 14 Jan 2025 16:55:45 +0000
Received: by outflank-mailman (input) for mailman id 871581;
 Tue, 14 Jan 2025 16:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXkCe-0007ro-8a
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:55:44 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63d19fa8-d298-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 17:55:42 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43618283dedso54863585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:55:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e92f60sm216490695e9.40.2025.01.14.08.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:55:41 -0800 (PST)
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
X-Inumbo-ID: 63d19fa8-d298-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736873742; x=1737478542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rFemZztPxAtbSNdSi9bGcpqJA38Lw/RzqbtiIYXoaKA=;
        b=CN4yIQHnUGpDjSyxr/KnIEAv8ZXCbqbEr9BmdHigVHaNTfz7iVJWBLCEgXOk2PTRh+
         xn39dfEOfRsMlrt9m78NsM6kWAVn9oMMFhcVHD2mkDFYjK8GarRYA6KQWoVRhVFiwUh+
         0k00rsS5fyo3wDGfwFWK/7CgUdQW6lRb1HjvCMeELpRbtNpFodajsgu7F4TSibdYCJur
         8nuANxGuFQO+2oxut4fY0xBDXh9rnTKTfAfA1PH4Q5hrLJZmbpVEuVs2DsJOOTk6PoSG
         IE4Bj5O4CbSWXMhGONUvrEMm4l5qTp7NIKrUpDe7MOeGVvyVnYg4jESzFgZODGS1y37j
         F2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873742; x=1737478542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFemZztPxAtbSNdSi9bGcpqJA38Lw/RzqbtiIYXoaKA=;
        b=deY3OG3fOA9493ze76O3m7pJ+ssgOIQU1XBdszba2KJahpy99NhjHHrKUDcvmhW0gG
         fu93hlg5yTy193CovyrLBMy0VIM6LOq273p7QVT6Hb7bXQUfXJMNFluB94u7GgtWoI1O
         pVFTHJQSTEAnTT6c/gLRXwCqBWvXQ5sG/duMSxPzhAiTcF9stvQ3AN//N4EyAh6vFOKc
         J+3B3E2wS1zeZHw4RyVcORjRfMqglUtvR+V3go8wk12zX7ulq3pb0pe3DfiyoEAGLlYq
         PsvxE/3kn7FI12WxNfeQjdjinTGnu0VDkBkAdm19flcL4tylOCuoP2ScxYswOcisVhDX
         Kmug==
X-Forwarded-Encrypted: i=1; AJvYcCWGR4Mlb2sAurIBvPWG9Iu00HEB2R7lJYAbB5aqzVarXc5UXgC6lmgkLdWXg4oyJmkvStG9XX1D2pQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMeslwu0DJ0ngbrVrvfh4m5hVJG6aOKjC7OZwM1MZWwREdobIG
	JttUMbCy2mx0lmEwCJkoqLpyERz0d++thbCg2hyGdp6lqJ/UruAzQdYOdSsrmQ==
X-Gm-Gg: ASbGncuV4cm4gMmwN+0mTNhCORvvpksnm0vQTtK3e2qkrCi3dLpIOo4ldzgJiMd0tSP
	tJy2iFfISrT4nnUoN1QzVZx/vPHFoP6CjGv1IpHLsc6dmB9BD0LcMnUKYYUnW9tO6gzrlxs5OKl
	fKccHL66Kz937abnBNTjavRoaUYomxgBKYsrZ5xQl7XB/9aQ61zVnAMsMGw4nNilugaffq5GVy2
	hTTYLZV8d3WKzVngVBWwFxtYExjdsk8h0y2yFINLlieP/gr2vuYIlXQ4XYXt3w9MaTyAl126I8a
	KdmgVWY32PV9PAC/BzjMhN7dIQfPjCJaijT47YFhRQ==
X-Google-Smtp-Source: AGHT+IHziQXbEtY1wLT6yDpOI88o26Jdy0S0Ahn1+ZkSyP9lFeIrHbJ4RfASssu9MZ+Ja6NLFpWw6g==
X-Received: by 2002:a05:600c:4383:b0:436:fb9e:26c with SMTP id 5b1f17b1804b1-436fb9e0497mr88381895e9.17.1736873741904;
        Tue, 14 Jan 2025 08:55:41 -0800 (PST)
Message-ID: <02749804-4346-4eb5-a874-afb53b86a866@suse.com>
Date: Tue, 14 Jan 2025 17:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/10] x86: Calculate arch LBR CPUID policies
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-5-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-5-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -190,6 +190,16 @@ static void sanitise_featureset(uint32_t *fs)
>      }
>  }
>  
> +static void recalculate_arch_lbr(struct cpu_policy *p)
> +{
> +    if ( p->basic.max_leaf < 0x1c ||
> +         !(cpu_policy_xstates(&host_cpu_policy) & X86_XSS_LBR) ||

A reference to the host policy looks questionable here. If you ...

> +         p->basic.lbr_1Ca.supported_depths == 0)
> +        p->feat.arch_lbr = 0;
> +    if ( !p->feat.arch_lbr )
> +        p->basic.raw[0x1c] = EMPTY_LEAF;
> +}
> +
>  static void recalculate_xstate(struct cpu_policy *p)
>  {
>      uint64_t xstates = XSTATE_FP_SSE;
> @@ -219,6 +229,9 @@ static void recalculate_xstate(struct cpu_policy *p)
>      if ( p->feat.amx_tile )
>          xstates |= X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA;
>  
> +    if ( p->feat.arch_lbr )
> +        xstates |= X86_XSS_LBR;
> +
>      /* Subleaf 0 */
>      p->xstate.max_size =
>          xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
> @@ -271,6 +284,8 @@ static void recalculate_misc(struct cpu_policy *p)
>  
>      p->basic.raw[0xc] = EMPTY_LEAF;
>  
> +    zero_leaves(p->basic.raw, 0xe, 0x1b);
> +
>      p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
>  
>      /* Most of Power/RAS hidden from guests. */
> @@ -630,6 +645,7 @@ static void __init calculate_pv_max_policy(void)
>  
>      sanitise_featureset(fs);
>      x86_cpu_featureset_to_policy(fs, p);
> +    recalculate_arch_lbr(p);
>      recalculate_xstate(p);

... flipped the order of these calls, couldn't you use the respective bit
from the correct policy? Then again you need p->feat.arch_lbr to actually
set X86_XSS_LBR. Still the aspect in recalculate_arch_lbr() wants sorting
somehow.

Jan

