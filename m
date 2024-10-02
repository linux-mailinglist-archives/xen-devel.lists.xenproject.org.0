Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8998D2BE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 14:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808742.1220738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svy9N-0001Os-6T; Wed, 02 Oct 2024 12:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808742.1220738; Wed, 02 Oct 2024 12:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svy9N-0001Lh-3R; Wed, 02 Oct 2024 12:08:13 +0000
Received: by outflank-mailman (input) for mailman id 808742;
 Wed, 02 Oct 2024 12:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svy9M-0001Lb-49
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 12:08:12 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe00a86f-80b6-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 14:08:10 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53995380bb3so3830284e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 05:08:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297c2c7sm849725366b.180.2024.10.02.05.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 05:08:09 -0700 (PDT)
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
X-Inumbo-ID: fe00a86f-80b6-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727870890; x=1728475690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BSpaNHtVe2VYxXwXm6BRwx2bRh43b6VH6C+y2IpSS9A=;
        b=PF4ASNPTop2EGUrjWUU8kzmnMC2d19su0OJoZ7gpZpppCpM+X5NKQT2tVfp5Pvw/MK
         Xge4HykPkjGxyjdpdKet8/RIXDtDO8ZNU+tEQ0C/madrrlHiOxbkrvHltSv+7ULG0XfB
         aGiXn/CPwdSsAwNulpr2iIKRAHiF9GUjXCssjMkgs+zU86LcNiaMcZiRtvhstACzDxU1
         pdWWc0EYz2/sdfITG+2cVtvJwVH6ZXlwIKyzPz0Xyz7hzCAIcfmUWy6C03Pdr258qzph
         j9Gsa3w5tf+bUcQZgXzJbSLrrnlJZz5nXNuBUUabaeF3ZskPJGRnrLl73TbW8eEU3IEK
         zPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727870890; x=1728475690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSpaNHtVe2VYxXwXm6BRwx2bRh43b6VH6C+y2IpSS9A=;
        b=RCb6WvLdT0HcSgEsghD1w7UkajFSYQRoG/hV1fkkwa8gSwLQb/TEYkJV90nI4HHe/g
         INnjTDTjKaSWwEWJ/HgaJrNiMKN+xgwOpaIfnrmpWDeqHrMc0lSVGfzd1DT6DQilsv9z
         KlmM9RsigT1kW3cVQ3f/16IgTJlGRVSyzq+NE9ijQj9X1qdUNc7P3QKiKbDp9B5teTtI
         ZJqhmnDeKDj6Q7Xny/AkziWA0IEoNnCM7Qud8Y59USDoxCYozZ6VV3g1tevDFLwhcGnb
         7S2sGroCeyElOEivdKjhHYLR0x4LQMtIHYDYyZ2TZCoq34t2Unnwk2cSj4bbhyb3XKMK
         zHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxx5n57hT6Ab+dKIm/MZOjgo68vJ0pF+NrOEY0fTBQuFQATDZbhAUBap0cRsIOHz9UvWZ3DalUSY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHQUKvfofWrnaN7BpZPz9Plu57qyHJ4j65DmNnta6s4D7F8MZi
	nT64+J/ps7nttnONFWgCEtchIHjd6MU+VoYYOOYWKxeqwtt2jYxDS2viTBagWQ==
X-Google-Smtp-Source: AGHT+IHvlr0NVUD6CsoIEtC8U9V3Wt0Ud3GgZQ4YfxV0HFLyngouWXfK90AvVa9wQGMb73N62eLg+w==
X-Received: by 2002:a05:6512:1054:b0:530:e323:b1cd with SMTP id 2adb3069b0e04-539a07a1dffmr1917029e87.40.1727870889930;
        Wed, 02 Oct 2024 05:08:09 -0700 (PDT)
Message-ID: <b917b21a-6d2b-46b2-a30d-7bab5ebff631@suse.com>
Date: Wed, 2 Oct 2024 14:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kexec: Separate code and data by at least 1 cacheline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002103052.1797237-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241002103052.1797237-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.10.2024 12:30, Andrew Cooper wrote:
> No functional change, but it performs a bit better.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

A question nevertheless:

> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -19,6 +19,7 @@
>  #include <xen/kimage.h>
>  
>  #include <asm/asm_defns.h>
> +#include <asm/cache.h>
>  #include <asm/msr-index.h>
>  #include <asm/page.h>
>  #include <asm/machine_kexec.h>
> @@ -174,6 +175,9 @@ FUNC_LOCAL(compatibility_mode)
>          ud2
>  END(compatibility_mode)
>  
> +        /* Separate code and data into into different cache lines */
> +        .balign L1_CACHE_BYTES
> +
>  DATA_LOCAL(compat_mode_gdt_desc, 4)
>          .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
>          .quad 0x0000000000000000     /* set in call_32_bit above */

Because of L1_CACHE_BYTES being 128, you indeed put at least 1 cache line in
between. Is that necessary, though? Just starting data on the next cache line
ought to be enough? IOW if and when we adjust L1_CACHE_BYTES, we won't need
to touch this again, just that the title here then would end up slightly
misleading.

Jan

