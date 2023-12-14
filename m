Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F276B8132DB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 15:19:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654610.1021714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmYN-0003vA-25; Thu, 14 Dec 2023 14:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654610.1021714; Thu, 14 Dec 2023 14:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmYM-0003tB-US; Thu, 14 Dec 2023 14:19:06 +0000
Received: by outflank-mailman (input) for mailman id 654610;
 Thu, 14 Dec 2023 14:19:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDmYM-0003t4-4N
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 14:19:06 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc7e57e-9a8b-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 15:19:03 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bf898c43cso7968775e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 06:19:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x9-20020a056402414900b005528b3b3d95sm86577eda.34.2023.12.14.06.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 06:19:02 -0800 (PST)
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
X-Inumbo-ID: bbc7e57e-9a8b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702563543; x=1703168343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CflFT3wIJhbc7Wiv8StCwpl5nqcG2FukpUUb5nB1+Lc=;
        b=Rr7hIxXxMHq3mrEsmJZctCtF+lxbS3HLBhmdjFsjE6zKWG/ZdPqB/qyIkCRSJTU62A
         5yMDYsGzyaE6J3fxYCkhz8w93NFURDot8eBIxALp7Vw5aSoDnUdwGN4ituoudisPN/L2
         oGrLx8oHNN00gO2/nJF4Rt/tuP412XKwj036LQj/OUpTrJEhEFbb4m3eAE8GXzUyfciI
         JmF+mr7KTyAavIBCstqSxFmLIAKtk0C51iEFOfzbNxmvMKIiHOk1DCqoF7pNf1VzCPTE
         LxLRSm6nW9sWBU2M5RaePBy7nwaaScmKLyXLdI+9f54EjAC6a1beZQA+QYMDMRTXaeBU
         JTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702563543; x=1703168343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CflFT3wIJhbc7Wiv8StCwpl5nqcG2FukpUUb5nB1+Lc=;
        b=IRD+ekFvm6zT139cJiL5K4UjjbRo69N6+kv4f2CDlI7gLOecHM1X4QhbeM1HoGPo1C
         e4pm25bvmEZMWL1z8s/SG4vrcnfbVJ8DeXKbxMIiGlAxSxMjvaiVX/H+sJi+e5DoRNkJ
         ZW2wxsJPxhAkXzkzo5M/+AaLl4rUMZ1kFj++JKw9rZiX/aD8/xxtL7sSurGJOENjT8rZ
         r3LAqnExU4we0/h9QhtpItx7vhcF5gYGs84pn0b2NmTjqEKmTh8qzbN0BR987M0PD8k4
         QZnSnlb2PlFN10scc6V3eoBtFJonEjiQbQBHCpHamYZBa4GwJ8FuCiKH65+Bjoqvs6vn
         tPEg==
X-Gm-Message-State: AOJu0YwJF73/asRsphXFK37OEwS3IvMh8V8vPi0xbPE3vDCLkMgubSSV
	MYRtlGX5kjr04nfkknyasPDs
X-Google-Smtp-Source: AGHT+IEvJtHd/K000S76f4Cu0asVd9GBMwv3Ube3BNAQ9ClThgcJxukRCRHr0PXE4ts2hRrWcNTqzg==
X-Received: by 2002:a05:6512:aca:b0:50e:d27:a16b with SMTP id n10-20020a0565120aca00b0050e0d27a16bmr1389824lfu.77.1702563543244;
        Thu, 14 Dec 2023 06:19:03 -0800 (PST)
Message-ID: <46462554-f040-4c34-874d-2d0455707731@suse.com>
Date: Thu, 14 Dec 2023 15:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/39] xen/riscv: introduce asm/p2m.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <a37e4b7115897a0265907c53667a0ede3763f0ce.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a37e4b7115897a0265907c53667a0ede3763f0ce.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -0,0 +1,105 @@
> +#ifndef __ASM_RISCV_P2M_H__
> +#define __ASM_RISCV_P2M_H__
> +
> +#include <asm/page-bits.h>
> +
> +#define paddr_bits PADDR_BITS
> +
> +/*
> + * List of possible type for each page in the p2m entry.
> + * The number of available bit per page in the pte for this purpose is 4 bits.
> + * So it's possible to only have 16 fields. If we run out of value in the
> + * future, it's possible to use higher value for pseudo-type and don't store
> + * them in the p2m entry.
> + */
> +typedef enum {
> +    p2m_invalid = 0,    /* Nothing mapped here */
> +    p2m_ram_rw,         /* Normal read/write guest RAM */
> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
> +    p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area non-cacheable */
> +    p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area cacheable */
> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
> +    p2m_grant_map_rw,   /* Read/write grant mapping */
> +    p2m_grant_map_ro,   /* Read-only grant mapping */
> +    /* The types below are only used to decide the page attribute in the P2M */
> +    p2m_iommu_map_rw,   /* Read/write iommu mapping */
> +    p2m_iommu_map_ro,   /* Read-only iommu mapping */
> +    p2m_max_real_type,  /* Types after this won't be store in the p2m */
> +} p2m_type_t;

As indicated before, I think you should have only those types here which
you're sure you'll need, or even just those which you really need right
away. I question in particular p2m_mmio_direct_*, which all look like
you simply took them from Arm, without regard as to applicability to
RISC-V. The fewer types you have here, the easier it is going to be to
tell what needs adding and what is already _properly_ supported.

> +#include <xen/p2m-common.h>
> +
> +static inline int get_page_and_type(struct page_info *page,
> +                                    struct domain *domain,
> +                                    unsigned long type)
> +{
> +    BUG();
> +    return 1;
> +}

Imo despite the BUG() any such stub would better return failure, just
like ...

> +/* Look up a GFN and take a reference count on the backing page. */
> +typedef unsigned int p2m_query_t;
> +#define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
> +#define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */
> +
> +static inline struct page_info *get_page_from_gfn(
> +    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
> +{
> +    BUG();
> +    return NULL;
> +}

... you do here. May apply again further down.

> +static inline void memory_type_changed(struct domain *d)
> +{
> +    BUG();
> +}
> +
> +
> +static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
> +                                                        unsigned int order)
> +{
> +    BUG();
> +    return 1;
> +}
> +
> +static inline int guest_physmap_add_entry(struct domain *d,
> +                            gfn_t gfn,
> +                            mfn_t mfn,
> +                            unsigned long page_order,
> +                            p2m_type_t t)
> +{
> +    BUG();
> +    return 1;
> +}
> +
> +/* Untyped version for RAM only, for compatibility */
> +static inline int __must_check
> +guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
> +                       unsigned int page_order)
> +{
> +    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
> +}
> +
> +static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
> +{
> +    BUG();
> +    return _mfn(0);
> +}
> +
> +static inline bool arch_acquire_resource_check(struct domain *d)
> +{
> +    /*
> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
> +     * is supported on RISCV.
> +     */
> +    return true;
> +}
> +
> +static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> +{
> +    /* Not supported on RISCV. */
> +}
> +
> +#endif /* __ASM_RISCV_P2M_H__ */
> \ No newline at end of file

This wants taking care of.

Jan

