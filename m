Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3EB1A6A0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 17:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069702.1433468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uixUq-0004BY-62; Mon, 04 Aug 2025 15:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069702.1433468; Mon, 04 Aug 2025 15:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uixUq-00048W-2v; Mon, 04 Aug 2025 15:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1069702;
 Mon, 04 Aug 2025 15:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uixUp-00047I-4a
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 15:53:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb42055-714b-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 17:53:05 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-615c29fc31eso7059956a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 08:53:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9247845edsm683443166b.46.2025.08.04.08.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:53:03 -0700 (PDT)
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
X-Inumbo-ID: 1bb42055-714b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754322784; x=1754927584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EsAODfqZ3sep76Tn+MGFebB71CzByqg4OlXzxi1b1Bo=;
        b=e6k5utGv2a1LMYFzJDXDakvo2bjzJ7ng98HMOUftCbhrDusBPlj4uXLSjs+ZzO1WaT
         m646Fepj2qjCzne3ITjRCvw2gAkW98RKbu+uEIOucpsSkgpAFHaKCjo9kOcjpDvrjr+5
         nY5ntdlIoPqs33Zx60t1bTHS7ukJaZaXWFo7mEz4AS12/NvhVWxbUD5XMy8FHHKlZtzn
         8RUV4eNhjGGzxrFRjz/C7sH0xpP1f6c9cnn6Iu/Ue9OVfNZoJI4S5wrEojfDSN4bLAMd
         u9g2EmjIH7n4CAoO1OjYr3ro5cB1MWo6gnwxYWFExfYBBm4cJDnF6ue6H3xvG8NxFFJc
         3cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322784; x=1754927584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsAODfqZ3sep76Tn+MGFebB71CzByqg4OlXzxi1b1Bo=;
        b=US0HF6KOKvKacxlLAs2MyOEm1a7V6acb2ipXQ2hMqq1vrg/MTpecToo7xaC7psOWGR
         ylc3w2r7vme9qi/i7A8jjMTT6jRbSKZqG//zGO/9XyT6itnoq4TL4RhikDVZebJeKtOP
         G4JDLBKDMZL2FC7q8fxpEwRRMHB5vGCXuFPAaHMTDa9qQpNOgNP1Sh3c5dKYh0WiegFN
         pUz8H3QYbb0kWDjpUHoGBoDpj2uRhDBDNiW1M4IJRI29ub5ZQZlDbcmPMMvl1VC/Z1La
         1gmnnUW1rRG7OMiqlRbjckvW1k8yw7tRC3z7ttw2H0hYGGqY8fHhIOahKA+6l9zlV13/
         llkA==
X-Forwarded-Encrypted: i=1; AJvYcCXhPbP32BZ/jbAMsxclAtEr+ZFQfuxn7QUA/XJsQNZ0PbW6NSxERIN/obi9L6qFhfQpLCHFHJjoECY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuqiIea7DBJkuzwH7yiLgPcJiUhpA/X5pcx8pWKONhq+giepnj
	C2QO0ge+sOxcY4VURZrXJsXbkHm8Y/M53rv2lTrTfpq2/tOHl6EGpKCHfSa0yuKqFw==
X-Gm-Gg: ASbGncsCLiojV1QfVi3jWtoMiH/xfwnbVa4jwX3YkImkdLWcw6UfIMthAbp+KtrEngg
	Pi6t078Mf9sMkYn0BnCXkS4d/putdE5p/3E2GnPIf9SkhsAZK3Ga0FC31/5wath9TUXJx339C1d
	RG+bYQzfRFP6ZSecSA7nSq6dAvutQFUH6rqeUCU2N4/mn0Z1hn/zbBqKgyn6750gcrj0N+3tCyD
	0QI7rJRxmogqVt2m60LsTMZjLfr4GvePpJGjS8YKdFHV/F/Dc+p7ih+/6ysHvIAYaDhTBAcvle4
	otpZAkLpydMO6o1946rVTuNkuRwGDbhgAg8CyqMKzvLGW/NeDhyYL0eCJQG4Snyyo/lf2pbo9m4
	jOD/HHmYF/7pRB9YhU7Se8zFT+bOzLgDyG8BgM/pdmdn+78qSiJkSXqNiat7vDcaW+aKSYNxu66
	2PhFHxG4A=
X-Google-Smtp-Source: AGHT+IH6EE/Ay87sTiqtTBrm7BVg/kV3FtbldzOKhykIZN9ZF4OGp7I880vxySOKNmoDYXq3ywrANw==
X-Received: by 2002:a17:907:7247:b0:ae0:df46:abd1 with SMTP id a640c23a62f3a-af9401c783emr1066689566b.45.1754322784199;
        Mon, 04 Aug 2025 08:53:04 -0700 (PDT)
Message-ID: <cff0fc63-f5f6-464e-b738-0de03661084a@suse.com>
Date: Mon, 4 Aug 2025 17:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/20] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <c526512aeda09527421e2d60bac7955a8c7c7c56.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c526512aeda09527421e2d60bac7955a8c7c7c56.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -3,11 +3,45 @@
>  #define ASM__RISCV__P2M_H
>  
>  #include <xen/errno.h>
> +#include <xen/mm.h>
> +#include <xen/rwlock.h>
> +#include <xen/types.h>
>  
>  #include <asm/page-bits.h>
>  
>  #define paddr_bits PADDR_BITS
>  
> +/* Get host p2m table */
> +#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
> +
> +/* Per-p2m-table state */
> +struct p2m_domain {
> +    /*
> +     * Lock that protects updates to the p2m.
> +     */
> +    rwlock_t lock;
> +
> +    /* Pages used to construct the p2m */
> +    struct page_list_head pages;
> +
> +    /* Indicate if it is required to clean the cache when writing an entry */
> +    bool clean_pte;

I'm a little puzzled by this field still being here, despite the extensive
revlog commentary. If you really feel you need to keep it, please ...

> +    /* Back pointer to domain */
> +    struct domain *domain;
> +
> +    /*
> +     * P2M updates may required TLBs to be flushed (invalidated).
> +     *
> +     * Flushes may be deferred by setting 'need_flush' and then flushing
> +     * when the p2m write lock is released.
> +     *
> +     * If an immediate flush is required (e.g, if a super page is
> +     * shattered), call p2m_tlb_flush_sync().
> +     */
> +    bool need_flush;

... group booleans together, for better packing.

Jan

