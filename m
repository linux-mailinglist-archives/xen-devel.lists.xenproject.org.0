Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C4AA088A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971887.1360291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iDC-0000OJ-Dc; Tue, 29 Apr 2025 10:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971887.1360291; Tue, 29 Apr 2025 10:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iDC-0000Mr-AS; Tue, 29 Apr 2025 10:29:14 +0000
Received: by outflank-mailman (input) for mailman id 971887;
 Tue, 29 Apr 2025 10:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9iDB-0000Ml-02
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:29:13 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d7dd8a-24e4-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 12:29:10 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so674963666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:29:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed70939sm769434266b.141.2025.04.29.03.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 03:29:09 -0700 (PDT)
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
X-Inumbo-ID: c9d7dd8a-24e4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745922550; x=1746527350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PK0RB/lOrvQ1cHv+stbf3EsCejDVH1AQ938YN+2BZiE=;
        b=DckFjtYRjCvYV+eYu1cBojicbKrp49i2dGZijb1jvsFaAXo5pA6vbkj16hB5hb39k5
         HEUA3CvH5t5WszDYxqcBzLNpm6BSqc+7oMzvkkag+YQq/Dw5AtqSD/1RB4pNP3Dv3LIU
         EEBM2RI6TDycIL9Phmhl35n8PkLsyithZLoNpo9hGam70dIeer2dE8YTqclYaqppy5yD
         NYuUkko4T2Vqws6SKk7v3jpF18SwNiiVeoH+AQiIxHTDNbv5hfNMVi4vbyfp0zS9h0pA
         yWaN/TEqmFw63QciX8Q5mS1kZkqZWWt+oSL3Oj2fENnMjZjBMUz3vl4Ouft0L/2nirgq
         Dx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922550; x=1746527350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PK0RB/lOrvQ1cHv+stbf3EsCejDVH1AQ938YN+2BZiE=;
        b=CBaqtNW+Ekzojst+cjdoNF3Wmft+6vHE5+779t7fSfdaJLyXH3XndR4MQUTXF2tqnD
         TKueHSGsQ6FLZKONnIFAVPF/g3QDz+Ho4AE5baq+QbKI0PveeT4MhG0+NxlVgiJI5Exo
         d0t1eeBVnJtk1ml4JrAySrkT/wWM6WxbUY/oAJx39FHvwvspHQgbQyp9yJe5untkSvQ+
         922JE11yI2goi69ZNXaVt45HPZT+rW1oNNO7Ol4f790LQsugW9z1HBah3figLZ+M8kVW
         S6eqHdbz1OFvQlE0PzRBvFNQKZ5zbj/4XWlNOULe/5Hw3fezNogViUyYdYnbp0AIo94J
         xayg==
X-Forwarded-Encrypted: i=1; AJvYcCWvpLcyc37jQE5t4xd1mAD2kyx4rbJrmFXKrck9lkpht527KS/5qxc6lB2vnno0bV1QaFBGFZe18Ms=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4rRKL13xUCbqxo2fKSbzSehEMnB+SutTLxaK2XcArCX0v7V16
	/Wyh03U6dGuPmJu2p0yvehDjKqXFI+4rV+VpMHLBxAFVF3pjLC3PJ55i2RBE2g==
X-Gm-Gg: ASbGnctvLmhDEsI+9mYd+DZjtsZOOZPPCmaI3F0RB0HZz7NwY+D0BEMxPc7tGXP+7Cf
	pRJ4U7rWZI5NOKVD3YPq3NLaSvuUyVLRqs0SBaP7T4PG+pwYPRHkfra42ZN5euekrrS3FaLLFS2
	LdnFp8EuPT6au7fFKzFUGTbN9TcUwJwYrasLeoY62DWy3VUpvRD2nPGy5gHbMiT45B89GbE6Tk5
	MP/w0fGCXjmBu5eCbQUY0yrh4KNPnWP1q8t/WzVxDEkSDnXqvKY3cN4fqY2WYvOBIxB0qMoeUad
	hAfV7yMZz1CliWQyfNdZjxnZ3FHae4ewUbU5rv94dUFa4gHKxc+SwZXsos5gtY3fA2kG14o4lIw
	v6/0rGJg0eW8CZTL9uKtPql2msw==
X-Google-Smtp-Source: AGHT+IGmMDHAlfawGLIOLRYXhJ0yJiIqc6kSZ3L7jowlp2jGfsdPqS4NYxTAtuQsPtFGwvJ4WX8ZtA==
X-Received: by 2002:a17:907:26ce:b0:ac7:cfcb:c3e3 with SMTP id a640c23a62f3a-acec4eae46fmr268922166b.45.1745922550082;
        Tue, 29 Apr 2025 03:29:10 -0700 (PDT)
Message-ID: <42b052b7-535b-4697-86d1-bae857f6ccad@suse.com>
Date: Tue, 29 Apr 2025 12:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250429101252.50071-1-roger.pau@citrix.com>
 <20250429101252.50071-3-roger.pau@citrix.com>
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
In-Reply-To: <20250429101252.50071-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.04.2025 12:12, Roger Pau Monne wrote:
> The current logic to handle accesses to MMIO pages partially read-only is
> based on the (now removed) logic used to handle accesses to the r/o MMCFG
> region(s) for PVH v1 dom0.  However that has issues when running on AMD
> hardware, as in that case the guest linear address that triggered the fault
> is not provided as part of the VM exit.  This caused
> mmio_ro_emulated_write() to always fail before calling
> subpage_mmio_write_emulate() when running on AMD and called from an HVM
> context.
> 
> Take a different approach and convert the handling of partial read-only
> MMIO page accesses into an HVM MMIO ops handler, as that's the more natural
> way to handle this kind of emulation for HVM domains.
> 
> This allows getting rid of hvm_emulate_one_mmio() and it's single call site
> in hvm_hap_nested_page_fault().  As part of the fix r/o MMIO accesses are
> now handled by handle_mmio_with_translation(), re-using the same logic that
> was used for other read-only types part of p2m_is_discard_write().  The
> usage of emulation for faulting p2m_mmio_direct types is limited to
> addresses in the r/o MMIO range. The page present check is dropped as type
> p2m_mmio_direct must have the present bit set in the PTE.
> 
> Note a small adjustment is needed to the `pf-fixup` dom0 PVH logic: avoid
> attempting to fixup faults resulting from write accesses to read-only MMIO
> regions, as handling of those accesses is now done by handle_mmio().
> 
> Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two nits:

> --- /dev/null
> +++ b/xen/arch/x86/hvm/mmio.c
> @@ -0,0 +1,125 @@
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
> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
> +
> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> +           subpage_mmio_find_page(mfn);
> +}
> +
> +/*
> + * The guest has read access to those regions, and consequently read accesses
> + * shouldn't fault.  However read-modify-write operations may take this path,
> + * so handling of reads is necessary.
> + */
> +static int cf_check subpage_mmio_read(
> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> +{
> +    struct domain *d = v->domain;
> +    unsigned long gfn = PFN_DOWN(addr);
> +    p2m_type_t t;
> +    mfn_t mfn;
> +    struct subpage_ro_range *entry;
> +    volatile void __iomem *mem;
> +
> +    *data = ~0UL;
> +
> +    if ( !len || len > 8 || len & (len - 1) || !IS_ALIGNED(addr, len) )

The & expression wants parenthesizing against the ||s.

> +    {
> +        gprintk(XENLOG_ERR,
> +                "ignoring unaligned read to r/o MMIO subpage %#lx size %u\n",

It's not just unaligned, but also oversized or zero-size now. Maybe better
drop the word?

Both similarly applicable to the write path.

Jan

