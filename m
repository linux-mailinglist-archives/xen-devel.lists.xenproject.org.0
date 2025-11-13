Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74883C57378
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161053.1489076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVcM-0005eD-PG; Thu, 13 Nov 2025 11:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161053.1489076; Thu, 13 Nov 2025 11:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVcM-0005b6-M1; Thu, 13 Nov 2025 11:35:58 +0000
Received: by outflank-mailman (input) for mailman id 1161053;
 Thu, 13 Nov 2025 11:35:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVcK-0005b0-I9
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:35:56 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9be2e4e-c084-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 12:35:54 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b728a43e410so105929266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:35:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa80cb6sm149638166b.7.2025.11.13.03.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:35:52 -0800 (PST)
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
X-Inumbo-ID: e9be2e4e-c084-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763033753; x=1763638553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ROw8OP8t04ZDQgvKd2J8Vdq0edYSR4HDgmS9LGq+kQk=;
        b=RN+FijksBOYlmW+sF3mIxED18v9MLrif94XcJcQ9VwTu1GaeayJO1c5RjWSZ7wkYMq
         vreBb6smSNl41r8wmiBjPKSo7zB+KuMKD0JYJDXYfOju4e9LuVyunS35TUtsZir+RINR
         Wo0N/CqKguKiuVnTbTc56M+tk/2OllO7wRKjWxds9AfJ/stuzHfc+1qIfhGbvdtjiu3f
         laneJpM1ZiIziLi9mJfw7CODwYuN7OMfpfMscNM2gRzPpepk6KBfuY15+OCep4ynXzJd
         fJYq5nac94BxOcmED/QilD/IQfX36neS1ZZHo6RSf/LO+XV+nyRwUYaN+bhpOXvFHRn+
         cJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763033753; x=1763638553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROw8OP8t04ZDQgvKd2J8Vdq0edYSR4HDgmS9LGq+kQk=;
        b=r9yGCsJtBS7jcexlDA5usO0J2CPoERLkTsfCNDvMDoqMpCVq+HMLQ9/2S0vabASAT9
         T5c8PswtwnJ6ocdCIIgg+pCUIeswsiJ5unFFKC8yVpw54IMW2XRx6cSHMoHnTbaCMUu1
         ucHRF4vYfvMNrnmSGQyDsxOiwyk3aS7m5+atpVIIgrwrXmcP2+JNJVgrxNMxJgrEFKOH
         2sZhM8AS8qDGcfsV2kJdsQ4Kwm2OlmzpBgZm9jUnozVwkK9dUzYPcZznKtpjkYDyh9pZ
         bbKvGnZc5ohEIJYfELcZqvx36kj+vYNrRsaDIFBh2zF3lTexE9vlL0YJsxda/s5MAA6Q
         o2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX4f4UkrS0uy6kJi0cOvCW5rsjxiQfRw5GTi5d1sX3avcNEmb4zqK8XbKQtbkyph5TyAuYloRHvCcc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm7HGojMdTR45fmEDFgHFEK8DCLHQB7yiGFrkUWOM+LTH8raj8
	DNhxIqpcDGf0uaZv93P6v57f5pjoeKsvzRPJVmbkxhRAoZ/Mnz2QBY8X342bxi5SsA==
X-Gm-Gg: ASbGncuyb5Ln8SN2rkHfMEjm8cbtV+yOEmSjspy8xbwxs0zz98mZVVqpD5Zit2vYsjY
	z7oRh+FJ+bAMegYqwm5Josfp1LrFqC/P033gjJbJ1fvDmL+jSXb6dnImOXpr8IdWJGVbSxrlmFs
	4ymoS3Q8W2T0+2IGF/wLt5Daj3erR8PHbioXl5NYZREbQ9LaAYOzssfUdEwRY/dsNCRytCDmP2z
	N6OjIgHlSr4asDhlPWGl/OTjIXPcxbQG6en6fB+D1MBoyTIXndFZzrVLfDSJ/Qk+OBAwa2lucoL
	WPlUyPPaaCUKCjkon9ZzzLAETSDt2KACoewPXvUpbBkafw4OUlNQIiA8a3gPEQ3RHeKYb3/HwqM
	eqc+evQib7xboiXQVsc8Enx8v1Hhhsry7WxvgoiU78Gaq1Bra8wkKjvBJK8xmE1Byjlnto9vo9S
	3XE6913AeRBfB+ZXz4XD6miLlGZ/tsRxAnHfSAyJQU3gAAPfe4lCycMzAmOV81KfBA
X-Google-Smtp-Source: AGHT+IFWHCJbKQlvp33spBWRSPXqixooZ+gVJdwbLmMI41T7bgJ7JVa7WhTWY0uBPjfIeExizDephw==
X-Received: by 2002:a17:907:3f19:b0:b73:4fbb:37a2 with SMTP id a640c23a62f3a-b734fbb412dmr216534866b.5.1763033753189;
        Thu, 13 Nov 2025 03:35:53 -0800 (PST)
Message-ID: <b3ed438d-2b73-4b07-99e5-01e66a833f4d@suse.com>
Date: Thu, 13 Nov 2025 12:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] amd/iommu: Always atomically update DTE
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech>
 <a14812d39743f5f49614d099bdac6720bf7c4fae.1762961527.git.teddy.astie@vates.tech>
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
In-Reply-To: <a14812d39743f5f49614d099bdac6720bf7c4fae.1762961527.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 16:37, Teddy Astie wrote:
> amd_iommu_set_root_page_table chooses between updating atomically
> and non-atomically depending on whether the DTE is active or not.
> 
> This choice existed mostly because cx16 wasn't supposed always available
> until [1]. Thus we don't need to threat the non-atomic path in a special
> way anymore.
> 
> By rearranging slightly the atomic path, we can make it cover all the cases
> which improves the code generation at the expense of systematically performing
> cmpxchg16b.
> 
> Also remove unused raw64 fields of ldte, and the deprecated comment as the
> function actually behaves in a more usual way and can't return >0.
> 
> [1] 2636fcdc15c7 "x86/iommu: check for CMPXCHG16B when enabling IOMMU"
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/passthrough/amd/iommu_map.c | 78 ++++++++-----------------
>  1 file changed, 25 insertions(+), 53 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> index 320a2dc64c..e3165d93aa 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -154,69 +154,41 @@ static void set_iommu_ptes_present(unsigned long pt_mfn,
>      unmap_domain_page(table);
>  }
>  
> -/*
> - * This function returns
> - * - -errno for errors,
> - * - 0 for a successful update, atomic when necessary
> - * - 1 for a successful but non-atomic update, which may need to be warned
> - *   about by the caller.
> - */
>  int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
>                                    uint64_t root_ptr, uint16_t domain_id,
>                                    uint8_t paging_mode, unsigned int flags)
>  {
>      bool valid = flags & SET_ROOT_VALID;
>  
> -    if ( dte->v && dte->tv )
> -    {
> -        union {
> -            struct amd_iommu_dte dte;
> -            uint64_t raw64[4];
> -            __uint128_t raw128[2];
> -        } ldte = { .dte = *dte };
> -        __uint128_t res, old = ldte.raw128[0];
> -        int ret = 0;
> -
> -        ldte.dte.domain_id = domain_id;
> -        ldte.dte.pt_root = paddr_to_pfn(root_ptr);
> -        ldte.dte.iw = true;
> -        ldte.dte.ir = true;
> -        ldte.dte.paging_mode = paging_mode;
> -        ldte.dte.v = valid;
> -
> -        res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
> -
> -        /*
> -         * Hardware does not update the DTE behind our backs, so the
> -         * return value should match "old".
> -         */
> -        if ( res != old )
> -        {
> -            printk(XENLOG_ERR
> -                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
> -                   domain_id,
> -                   (uint64_t)(res >> 64), (uint64_t)res,
> -                   (uint64_t)(old >> 64), (uint64_t)old);
> -            ret = -EILSEQ;
> -        }
> +    union {
> +        struct amd_iommu_dte dte;
> +        __uint128_t raw128[2];
> +    } ldte = { .dte = *dte };
> +    __uint128_t res, old = ldte.raw128[0];
>  
> -        return ret;
> -    }
> +    ldte.dte.domain_id = domain_id;
> +    ldte.dte.pt_root = paddr_to_pfn(root_ptr);
> +    ldte.dte.iw = true;
> +    ldte.dte.ir = true;
> +    ldte.dte.paging_mode = paging_mode;
> +    ldte.dte.tv = true;
> +    ldte.dte.v = valid;
> +
> +    res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
>  
> -    if ( valid || dte->v )
> +    /*
> +     * Hardware does not update the DTE behind our backs, so the
> +     * return value should match "old".
> +     */
> +    if ( res != old )
>      {
> -        dte->tv = false;
> -        dte->v = true;
> -        smp_wmb();
> +        printk(XENLOG_ERR
> +                "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
> +                domain_id,
> +                (uint64_t)(res >> 64), (uint64_t)res,
> +                (uint64_t)(old >> 64), (uint64_t)old);

Indentation is now off by 1 here.

> +        return -EILSEQ;

The downside of this is that all updates can now take this path. Yes, this shouldn't
be possible to be taken, but it's a (minor) concern nevertheless. At the very least
such a downside wants, imo, mentioning in the description, even if for nothing else
than to make clear that it was a deliberate choice.

Jan

