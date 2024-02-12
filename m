Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4508517BC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679640.1057197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZY2c-0004qj-Nt; Mon, 12 Feb 2024 15:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679640.1057197; Mon, 12 Feb 2024 15:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZY2c-0004oB-K1; Mon, 12 Feb 2024 15:16:18 +0000
Received: by outflank-mailman (input) for mailman id 679640;
 Mon, 12 Feb 2024 15:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZY2b-0004o5-6T
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:16:17 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa45ac2d-c9b9-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 16:16:16 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b670d8a74so2166328f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:16:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5229000000b0033ae7d768b2sm7048670wra.117.2024.02.12.07.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:16:15 -0800 (PST)
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
X-Inumbo-ID: aa45ac2d-c9b9-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707750975; x=1708355775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFRmbZWrJgN5eXjLOclQO6ULKvl6rSK34mkGuilIuAQ=;
        b=AlYeKHbZwx9karbB53Wx8W2JwiUtnEO8zCcHjJ+R5zEK0dr7gsZ27geWWB7//zQhZJ
         xyiUi7+nXJhASD72hvfHNJcG/wd4eArHhozvbVu8cUGNaNDxFykAfxYWjZsm1WPozkPV
         dwkcFxkjhf+CojH3gVfJsFrkiERo3x38OdU8QYGX4vzBraQ1zmiyZyGn+GlDdy7D0+P5
         TIBj+gLUfSbMv+25tXZvFJg1nkI+Xpq01SNzzRy7TS7+3qt0DZhILX9x6RHN4XjADgsM
         8ibY3VpO3eMEIE6rkfKP6madmjvG+hN/iWHsusBo6VUaYgO8zPHZHC80ZW7apcmaZaGv
         L76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750975; x=1708355775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFRmbZWrJgN5eXjLOclQO6ULKvl6rSK34mkGuilIuAQ=;
        b=OHy18Yc24HDZrUrwUgdbVYafyuNOJUicj6CfVzto0kh7yePjnO8Um62GyB4Osybq6W
         d4Puc2UHSJy8hV99ruz5PP4dHd5DU8i65BdvZA9SOMcR9FGjG4IFEtOB03GgGvSHXNvj
         +QwyBcWfCmNf/BdEJ5SyCB/7j/Y4UiCBp43Qx1gXKT3VNPY64zUpDNY17gpaZU3wZGNS
         B9e1WXfUAvRUlkp41bvBbjKAS7Xxj/Zh77XYy87VUqhrKR8cc799ixtAMWPJD4cTN8Om
         qwrpJoH+V5eaMOCNLEXpZBJG71b5kyXaf5ek+TJw9956GIDYMbHMPCDZDs2ePLa02DYa
         mQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyws+LGE/YdWfXmiNiXS1N1Y7ucS3eXfz0dHoGEIy7rAC/JSrY1OFUCalTNQdTrKYY/EiP9NxOntLCsBn/NVl5QOiXw2AvB3o49LNWIkg=
X-Gm-Message-State: AOJu0YwaHpM7LXl93LVrVjHZ4KNdSYfPMYSZmaThxoPfV37YaiDKV4Un
	1vb7449dE+egH9ZQlH0kckemgPFySAbfcuHwOyWKg+aaGdab3SFGYiBMRJreoA==
X-Google-Smtp-Source: AGHT+IHfZsUS2D21RtC1Q/mgzNtE4jQAnQbI5bG/jSLGt+RgtwnvTRmsmfyJWihOGBUIE3zHkWBJPw==
X-Received: by 2002:adf:e492:0:b0:33b:87d8:678a with SMTP id i18-20020adfe492000000b0033b87d8678amr998045wrm.10.1707750975395;
        Mon, 12 Feb 2024 07:16:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXu+wjTYZmPVwLmaXJRWmcWHzhO6pokM/82hlU/FifjGoiR8iP9Z8UAByHlHCZ1PXQtU6ugVpGeL6CSninP9SNvX9sO7JMUIKzrsW+NngTiU2ONglPETSH5qCbHsQzofvvCs3sf3LOD/w25nyCLmj8L4b1gIz5wVJSfNp+7IrtV6DupmeADkxEEuKcJOXxVycQofk/5WiXrik+20DTo0Ln/ZvQnv89+FBXlE3Gtd8AJXnZp67PvlTuagbB6tIYh4MR3106Th0tczmb9bEeEqjOThKCxLDUrKyL0qdBFVqhRAyQGzo988A8=
Message-ID: <5e5887b2-5eb4-4a81-90f6-246553c28863@suse.com>
Date: Mon, 12 Feb 2024 16:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/30] xen/riscv: introduce p2m.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <c2a2e872f8c32d81c3d3f428f0273819dd7df081.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c2a2e872f8c32d81c3d3f428f0273819dd7df081.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with two more nits:

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_RISCV_P2M_H__
> +#define __ASM_RISCV_P2M_H__
> +
> +#include <asm/page-bits.h>
> +
> +#define paddr_bits PADDR_BITS
> +
> +/*
> + * List of possible type for each page in the p2m entry.
> + * The number of available bit per page in the pte for this purpose is 2 bits.
> + * So it's possible to only have 4 fields. If we run out of value in the
> + * future, it's possible to use higher value for pseudo-type and don't store
> + * them in the p2m entry.
> + */
> +typedef enum {
> +    p2m_invalid = 0,    /* Nothing mapped here */
> +    p2m_ram_rw,         /* Normal read/write domain RAM */
> +} p2m_type_t;
> +
> +#include <xen/p2m-common.h>
> +
> +static inline int get_page_and_type(struct page_info *page,
> +                                    struct domain *domain,
> +                                    unsigned long type)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +/* Look up a GFN and take a reference count on the backing page. */
> +typedef unsigned int p2m_query_t;
> +#define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
> +#define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */
> +
> +static inline struct page_info *get_page_from_gfn(
> +    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +static inline void memory_type_changed(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +
> +static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,

This line looks to be too long.

> +                                                        unsigned int order)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int guest_physmap_add_entry(struct domain *d,
> +                            gfn_t gfn,
> +                            mfn_t mfn,
> +                            unsigned long page_order,
> +                            p2m_type_t t)

Indentation isn't quite right here.

I'll see about dealing with those while committing.

Jan

