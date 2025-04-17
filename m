Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C5FA915E6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957031.1350232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5K7v-0003l7-8m; Thu, 17 Apr 2025 07:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957031.1350232; Thu, 17 Apr 2025 07:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5K7v-0003jM-5L; Thu, 17 Apr 2025 07:57:39 +0000
Received: by outflank-mailman (input) for mailman id 957031;
 Thu, 17 Apr 2025 07:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5K7u-0003jG-GM
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:57:38 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0bb3e02-1b61-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 09:57:37 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso306333f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 00:57:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fe6df9sm27267065ad.231.2025.04.17.00.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 00:57:36 -0700 (PDT)
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
X-Inumbo-ID: a0bb3e02-1b61-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744876656; x=1745481456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8sto1vMZJ/RFEaUgXEA7nLXKsvCQoAJjMJfXRluVzbY=;
        b=LjGUdnfioV8rJFvzEwuvRn0EhyZu+QyCIU2w51w3EB5MehVaEyQ0snkJFAvMaOIpmo
         wRpypYD3/tJ7dxAc6leqKyk5phfJUUfkCjoA3yS9sWyP6V/f2zLBrOFXW+7cYp4+K8SS
         2qv0rl/0p9OknhYdMAyv0WtDT9hOJfDFGw6fBicxKkmsOHcp8kiqqGen5U1SgoXBDIAU
         gAeuMNBXywwF/kZ0kvy2S1a/wMvUbXr+dRcKnk3CUqkshDicNgVKlHpiPg+0STk0Wd5+
         w9lk3vteHojuApaw/jZE/s39U9PPN9eaSjamYE2nd9dhw9paSWxY+1UKyrN7T3f99M1G
         X2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876657; x=1745481457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sto1vMZJ/RFEaUgXEA7nLXKsvCQoAJjMJfXRluVzbY=;
        b=vAUzoTV9LFrc7uDl22Htc/NGAu/5EbWzVQEwFx8D9REErECJkjYXVxC9fxSAVp1WdW
         FfOOTCwgYPtxDW9PXPzWOCbWw93tsJ/ACbOt4cgF8b/XjdHlrg9IcbmHL1BBeaWhZs2D
         MmGPogtfOnGQLmWSwytXDJLmnvS/wtIN69+YiRWMXmJhj/GN0UGpTncYOof4BDH8cV2u
         KVuH+j40PfqdJvZd52iGERkztUaADn6jeHwLvpRwJazyXu+Rk8V95B6++//mWwhTVYRl
         oxfW3lc4lkmfoM5H7M2pVrLLTHces6JDqf4zsLqX6YjhwxsVjKYvKOrqZ/dxV0r/Voko
         KKgA==
X-Forwarded-Encrypted: i=1; AJvYcCXq6IH8AumHe0VlOa+ouhJzmMfm0HgM74GDq8fxaj5z5xmv8tnaSeCvCLipS3AoyPSwn+AYyiaXIIY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRpJjpO32y0ht5KFqHkIc6su9sA9x2S3LU+nuClysHh8LnDKhh
	nAEr6e9xTJxxoNyntZWXt0DN+kxhXokK0Rm2Tm/OWRr3PbC92ndGh9uqUrKK8w==
X-Gm-Gg: ASbGncvmU+mKnRUNrpRv7BIjJeM7VjHvBykUMpZISlhVYAf/+HAjkaQbPCNB2gjsyRo
	3qpCaK5qxdR8mO/BDpOrVaRcDnIutr3Fa6kBEK3QeMNCsCMq/8WjSsJanUMHpoyhF9p9LDsc5Sl
	R6dgWLuS9+Uk9Tnv4fSFl07GfS7Q8kFdgHyhOD3pEmuY+ih61/rV/ueCupCnfWN0Q1aTHRDiAqf
	6Q6o2kwFp/j5MyN6iNpIBxeC8GaNnf0sRBxYY+SJI0VON1XJqvxyhvmJR+mItK/ROabPCPJ7Nmt
	deOT4v33Txe0BOf8V2nKTEe0iWmNds7R13e0zEVVheeEIqxj/R8HWzUBweYcXxrCVVHloH3DU9/
	Zs6urkQfbb5gBUm5JglIb8UgjRQ==
X-Google-Smtp-Source: AGHT+IH7wfMikwPWxYMaBxNx2fCGhfA7fmAW8dK0r7fikxWggYIzOqussoQugQdNka9brSFDFwxUgw==
X-Received: by 2002:a5d:5f52:0:b0:39c:30f7:a599 with SMTP id ffacd0b85a97d-39eea304084mr1349922f8f.18.1744876656641;
        Thu, 17 Apr 2025 00:57:36 -0700 (PDT)
Message-ID: <c890cef7-da7c-4cb1-922d-8b0b155eca43@suse.com>
Date: Thu, 17 Apr 2025 09:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-3-roger.pau@citrix.com>
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
In-Reply-To: <20250415153246.81688-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 17:32, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -370,7 +370,12 @@ static int hvmemul_do_io(
>          /* If there is no suitable backing DM, just ignore accesses */
>          if ( !s )
>          {
> -            if ( is_mmio && is_hardware_domain(currd) )
> +            if ( is_mmio && is_hardware_domain(currd) &&
> +                 /*
> +                  * Do not attempt to fixup accesses to r/o MMIO regions, they
> +                  * are expected to be terminated by the null handler below.
> +                  */
> +                 !rangeset_contains_singleton(mmio_ro_ranges, PFN_DOWN(addr)) )
>              {
>                  /*
>                   * PVH dom0 is likely missing MMIO mappings on the p2m, due to

Doesn't this need limiting to writes, i.e. permitting reads to still be
handled right here?

> --- /dev/null
> +++ b/xen/arch/x86/hvm/mmio.c
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * MMIO related routines.
> + *
> + * Copyright (c) 2025 Cloud Software Group
> + */
> +
> +#include <xen/io.h>
> +#include <xen/mm.h>
> +
> +#include <asm/p2m.h>
> +
> +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> +{
> +    p2m_type_t t;
> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, addr, &t);

Don't you need to use PFN_DOWN() on addr?

> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> +           subpage_mmio_find_page(mfn);
> +}
> +
> +static int cf_check subpage_mmio_read(
> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> +{
> +    struct domain *d = v->domain;
> +    p2m_type_t t;
> +    mfn_t mfn = get_gfn_query(d, addr, &t);

Same here and further down, and in the write case?

> +    struct subpage_ro_range *entry;
> +    volatile void __iomem *mem;
> +
> +    *data = ~0UL;
> +
> +    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
> +    {
> +        put_gfn(d, addr);
> +        return X86EMUL_RETRY;
> +    }
> +
> +    entry = subpage_mmio_find_page(mfn);
> +    if ( !entry )
> +    {
> +        put_gfn(d, addr);
> +        return X86EMUL_OKAY;
> +    }
> +
> +    mem = subpage_mmio_map_page(entry);
> +    if ( !mem )
> +    {
> +        put_gfn(d, addr);
> +        gprintk(XENLOG_ERR,
> +                "Failed to map page for MMIO read at %#lx -> %#lx\n",
> +                addr, mfn_to_maddr(mfn) + PAGE_OFFSET(addr));
> +        return X86EMUL_OKAY;
> +    }
> +
> +    *data = read_mmio(mem + PAGE_OFFSET(addr), len);

What if this crosses the trailing page boundary? Imo subpage_mmio_accept()
would better reject misaligned accesses (at least until we know we need to
handle such for some obscure reason).

> +    put_gfn(d, addr);
> +    return X86EMUL_OKAY;
> +}

Thinking of it - why do reads need handling here? The guest has read access?
Hmm, yes, read-modify-write operations may take this path. Maybe worth
having a comment here.

> +void register_subpage_ro_handler(struct domain *d)
> +{
> +    static const struct hvm_mmio_ops subpage_mmio_ops = {
> +        .check = subpage_mmio_accept,
> +        .read = subpage_mmio_read,
> +        .write = subpage_mmio_write,
> +    };
> +
> +    register_mmio_handler(d, &subpage_mmio_ops);

Are there any criteria by which we could limit the registration of this
handler?

Jan

