Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026C907531
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 16:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740014.1147009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlV2-0005pk-Ei; Thu, 13 Jun 2024 14:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740014.1147009; Thu, 13 Jun 2024 14:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlV2-0005nR-Az; Thu, 13 Jun 2024 14:32:24 +0000
Received: by outflank-mailman (input) for mailman id 740014;
 Thu, 13 Jun 2024 14:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHlV0-0005nL-3d
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 14:32:22 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd82f4f3-2991-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 16:32:19 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6e43dad8ecso204241566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 07:32:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db5b98sm77613766b.86.2024.06.13.07.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 07:32:19 -0700 (PDT)
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
X-Inumbo-ID: bd82f4f3-2991-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718289139; x=1718893939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H8hdHd+JfSqX4icctlXjtDZnZCcoDc5cvXDOcUQHCnQ=;
        b=bfqjEG6iqvQmAUx14cfKOLDexKsHhiApnV07Sh/X9KFCMZHZXLUYNjq8JDn/8IaLqr
         epwKeldosA8wTvFMg4rz2MeAhTZY4iwVyV7de+Kr6X/i69R5HZScKLHfFvq/R+2T94HV
         2cn/wzrNBTHfaxDhhlEEUsA8JKPmr/Ojnx7akDWVtn7cls7CbzB5U7NSS4vdkddTUA7z
         OkRpvUeknyG48/0rKOircNUQpGTH9jEVT7CMCTi32gfbXzs7aP2NdJxOC3xPW3f358Gx
         gDrLYAlqaD8b0xKF0CNjN7ecqDG53DXd2WSQg+aGUOm7N7lHUMYtbErt1aDVD2m+TZdG
         B2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289139; x=1718893939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8hdHd+JfSqX4icctlXjtDZnZCcoDc5cvXDOcUQHCnQ=;
        b=FFumIbNr34uYb19nkeEHJyspd0t4S0NbubQuEDI/fKETLQ4pze3yTByRXc5b1/85YM
         iZepIvxErEk936aygthSLaEo9wIrgwnW8+kbxzOjh9brcpc8LAqqgdReaCcfJpPLNXZB
         sgfXJ7YnhvuSBAjrS+J68oiSqadX34AumHItnxvbEplqOmvaxhJDAqV3zDG9lg77oDjl
         amxD4hU3oYvxM1bjXVweOiJ+cdU8xSgdDt58Emyc0vNH9glP2XjaSLV0WXk6/IHewsSl
         AJV6LY2g1GZfXZs3gSSwcKo22Z0i4gPeuJLE2weLXo5zqRInG5EHXupszyWDBL5GMYTR
         0rxg==
X-Forwarded-Encrypted: i=1; AJvYcCVSq//2CIxJF/WTmbukidcl6yrl4pgldqlRO3NqEnRujv1F0SEF+2RYHafNxCRUC/o0Pi7SpY1lCovGTQy8OahUJ+uzxoptYwCPwaXsab8=
X-Gm-Message-State: AOJu0YyColC/br4Bqf1UqXJVcCAsprwIs9PoTOHp1PME/Pbr9R+Wlh+Y
	DnInOTBufU5HpjIMokzm/htRSpvIEo8ybgylMlkkUbJNIbaOXNLbetJFLHzAbQ==
X-Google-Smtp-Source: AGHT+IE2qhU5F+JpTGV9aNXNR4R4rO/hYPvUlKujrAOHJT5A7rvJJOddpFyigwaDJHM0jNu9Jjn3pA==
X-Received: by 2002:a17:907:944c:b0:a6f:56d7:2caf with SMTP id a640c23a62f3a-a6f56d72f33mr184680366b.30.1718289139347;
        Thu, 13 Jun 2024 07:32:19 -0700 (PDT)
Message-ID: <8b0151a8-2293-409a-8469-d9e73cf561a3@suse.com>
Date: Thu, 13 Jun 2024 16:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu/xen: Add Xen PV-IOMMU driver
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>
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
In-Reply-To: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 15:50, Teddy Astie wrote:
> @@ -214,6 +215,38 @@ struct xen_add_to_physmap_range {
>  };
>  DEFINE_GUEST_HANDLE_STRUCT(xen_add_to_physmap_range);
>  
> +/*
> + * With some legacy devices, certain guest-physical addresses cannot safely
> + * be used for other purposes, e.g. to map guest RAM.  This hypercall
> + * enumerates those regions so the toolstack can avoid using them.
> + */
> +#define XENMEM_reserved_device_memory_map   27
> +struct xen_reserved_device_memory {
> +    xen_pfn_t start_pfn;
> +    xen_ulong_t nr_pages;
> +};
> +DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory);
> +
> +struct xen_reserved_device_memory_map {
> +#define XENMEM_RDM_ALL 1 /* Request all regions (ignore dev union). */
> +    /* IN */
> +    uint32_t flags;
> +    /*
> +     * IN/OUT
> +     *
> +     * Gets set to the required number of entries when too low,
> +     * signaled by error code -ERANGE.
> +     */
> +    unsigned int nr_entries;
> +    /* OUT */
> +    GUEST_HANDLE(xen_reserved_device_memory) buffer;
> +    /* IN */
> +    union {
> +        struct physdev_pci_device pci;
> +    } dev;
> +};
> +DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory_map);

This is a tools-only (i.e. unstable) sub-function in Xen; even the comment
at the top says "toolstack". It is therefore not suitable for use in a
kernel.

> --- /dev/null
> +++ b/include/xen/interface/pv-iommu.h
> @@ -0,0 +1,114 @@
> +/* SPDX-License-Identifier: MIT */
> +/******************************************************************************
> + * pv-iommu.h
> + *
> + * Paravirtualized IOMMU driver interface.
> + *
> + * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
> + */
> +
> +#ifndef __XEN_PUBLIC_PV_IOMMU_H__
> +#define __XEN_PUBLIC_PV_IOMMU_H__
> +
> +#include "xen.h"
> +#include "physdev.h"
> +
> +#define IOMMU_DEFAULT_CONTEXT (0)
> +
> +/**
> + * Query PV-IOMMU capabilities for this domain.
> + */
> +#define IOMMUOP_query_capabilities    1
> +
> +/**
> + * Allocate an IOMMU context, the new context handle will be written to ctx_no.
> + */
> +#define IOMMUOP_alloc_context         2
> +
> +/**
> + * Destroy a IOMMU context.
> + * All devices attached to this context are reattached to default context.
> + *
> + * The default context can't be destroyed (0).
> + */
> +#define IOMMUOP_free_context          3
> +
> +/**
> + * Reattach the device to IOMMU context.
> + */
> +#define IOMMUOP_reattach_device       4
> +
> +#define IOMMUOP_map_pages             5
> +#define IOMMUOP_unmap_pages           6
> +
> +/**
> + * Get the GFN associated to a specific DFN.
> + */
> +#define IOMMUOP_lookup_page           7
> +
> +struct pv_iommu_op {
> +    uint16_t subop_id;
> +    uint16_t ctx_no;
> +
> +/**
> + * Create a context that is cloned from default.
> + * The new context will be populated with 1:1 mappings covering the entire guest memory.
> + */
> +#define IOMMU_CREATE_clone (1 << 0)
> +
> +#define IOMMU_OP_readable (1 << 0)
> +#define IOMMU_OP_writeable (1 << 1)
> +    uint32_t flags;
> +
> +    union {
> +        struct {
> +            uint64_t gfn;
> +            uint64_t dfn;
> +            /* Number of pages to map */
> +            uint32_t nr_pages;
> +            /* Number of pages actually mapped after sub-op */
> +            uint32_t mapped;
> +        } map_pages;
> +
> +        struct {
> +            uint64_t dfn;
> +            /* Number of pages to unmap */
> +            uint32_t nr_pages;
> +            /* Number of pages actually unmapped after sub-op */
> +            uint32_t unmapped;
> +        } unmap_pages;
> +
> +        struct {
> +            struct physdev_pci_device dev;
> +        } reattach_device;
> +
> +        struct {
> +            uint64_t gfn;
> +            uint64_t dfn;
> +        } lookup_page;
> +
> +        struct {
> +            /* Maximum number of IOMMU context this domain can use. */
> +            uint16_t max_ctx_no;
> +            /* Maximum number of pages that can be modified in a single map/unmap operation. */
> +            uint32_t max_nr_pages;
> +            /* Maximum device address (iova) that the guest can use for mappings. */
> +            uint64_t max_iova_addr;
> +        } cap;
> +    };
> +};
> +
> +typedef struct pv_iommu_op pv_iommu_op_t;
> +DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_op_t);
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> \ No newline at end of file

Nit: I'm pretty sure you want to avoid this.

Jan

