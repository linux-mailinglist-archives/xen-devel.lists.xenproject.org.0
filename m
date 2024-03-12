Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407C87964A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 15:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691883.1078404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk39E-0002MZ-Bu; Tue, 12 Mar 2024 14:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691883.1078404; Tue, 12 Mar 2024 14:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk39E-0002K6-7x; Tue, 12 Mar 2024 14:30:32 +0000
Received: by outflank-mailman (input) for mailman id 691883;
 Tue, 12 Mar 2024 14:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk39D-0002K0-1u
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 14:30:31 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12f8d8f8-e07d-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 15:30:29 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so5214490a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 07:30:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f13-20020a056402194d00b005687aae14c5sm370423edz.30.2024.03.12.07.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 07:30:28 -0700 (PDT)
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
X-Inumbo-ID: 12f8d8f8-e07d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710253828; x=1710858628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvvi9JZq3xKp7qaCKyEAWmIewp8HiF5rca+d2RmpviY=;
        b=CGX4fwIReAR6c3mQ+8EhH8PBwtLtYbnhFka2UD+JKAbVuN/4512AtfTWImzjAFLFes
         n4Nt1ZR1f8Nze7wWGTU0vtFfiYDCq2vSC1AJBcv1HOV4x0f0x7aV2mN7Uba7dYN4VFCM
         hPvvQ7NHSCTqkI/Kz7eTkJGMWLarV8+OqICPkjn0JPV5xffbzPaC+lg88nolLi+7edIR
         684AQL8QKhH3VlNvsDB/+v7mgh17oiT4T/4+tPJgJF1O4nL/5igAy7d1jO/2ImAR1rOD
         lnA0AHxFJD15UV6DoVuGFb/I4dSrDymPS8AScPXJim/IMYOhvI669W+FrdQD682S3epe
         ZbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710253828; x=1710858628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvvi9JZq3xKp7qaCKyEAWmIewp8HiF5rca+d2RmpviY=;
        b=T9h5Krn39TEX8ZL6KDfOoa0+NwBnTZfTqHf4G4sB+N3waQ4Ur4ALHR91YG3GEMIt7Z
         8JXb1nXe6w8VZYaR6WELqnqu5EQohL87hJRuoBDgVvHXLXK2mBGOOG8Ib4627jI9QiSM
         kAdpx7kAqAYK/WBw4H/TnfYR/0Lh4ZsNZllVRmpL282Om9IN41IOQd2csK2UU/HbYt22
         jpdsge+coS9Be8K85Mq/R008ZyxSAgz+FWwNnp2TvFnz2LElh91m0U6rMoay7K6D5pWv
         LDanSSXx6nVpvf/Xoi+0TPyXKQ+uu5LBJmdDTfxC6P4kuFM/iMgfomKCdrrcobJtFv31
         cHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHXFg3akbbNya1/B1dA731SPPCOMmdBCappjWQsyOgCtgWJvbwSZ+m1KsTmnHK2V4cylnJ4P7ODJcANGF9ifnPkG07IHWVXeuizWGCHlw=
X-Gm-Message-State: AOJu0YzD5FPUbAbDzKU5HfaeEx34mO+chcS6q9AfNkY7Dv6rdjrCBgjK
	etkT2rLtaGYbM2RAoHIA5sw2Uk+DHqtBG8Rlf0m16vJb7Vq1UHbdUjVNU+R3UQ==
X-Google-Smtp-Source: AGHT+IEd1hSPEgZbTGqBrJdd0N3Lk672BdlpNFwF/XhsCd8qcgqbUBFQ6v24H8a6p4HlQBny8LS4uw==
X-Received: by 2002:a50:a694:0:b0:566:4d9:c3cd with SMTP id e20-20020a50a694000000b0056604d9c3cdmr6324353edc.41.1710253828535;
        Tue, 12 Mar 2024 07:30:28 -0700 (PDT)
Message-ID: <338db1b9-54f1-4687-ba9a-2eec282db1d5@suse.com>
Date: Tue, 12 Mar 2024 15:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] xen: avoid grep fodder define and undef
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <0002f3df03aac283fa3dc7365e9040ab7ffaee2e.1710242950.git.federico.serafini@bugseng.com>
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
In-Reply-To: <0002f3df03aac283fa3dc7365e9040ab7ffaee2e.1710242950.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 12:48, Federico Serafini wrote:
> Place an "#if 0" before grep fodder definitions and remove the
> "#undef".
> 
> This addresses several violations of MISRA C:2012 Rule 5.5
> ("Identifiers shall be distinct from macro names").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Hello, I would like to know what you think about this change.
> If you want to keep grep fodders as they are, an alternative could be to
> deviate violations of Rule 5.5 involving the TYPE_SAFE macro.

I think the original intention was to allow for some (arch?) override.
But we have lived without for long enough that I think we could do as
you suggest. One question though: Wasn't there also a rule against the
use of #undef, violations of which would then be eliminate here as well?
If so, I think that would want mentioning in the description. If not,
I'd like to give it a couple of days before ack-ing, just in case other
opinions would be voiced.

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -33,13 +33,10 @@ TYPE_SAFE(uint64_t, dfn);
>  #define PRI_dfn     PRIx64
>  #define INVALID_DFN _dfn(~0ULL)
>  
> -#ifndef dfn_t
> +#if 0
>  #define dfn_t /* Grep fodder: dfn_t, _dfn() and dfn_x() are defined above */
>  #define _dfn
>  #define dfn_x
> -#undef dfn_t
> -#undef _dfn
> -#undef dfn_x
>  #endif

I have to admit that I'm a little surprised that Misra (Eclair) is
happy with this: The #define-s are all still there, after all.

Jan

