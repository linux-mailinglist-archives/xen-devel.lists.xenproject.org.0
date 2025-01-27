Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BB0A1D540
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877769.1287917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNCv-0001pX-NS; Mon, 27 Jan 2025 11:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877769.1287917; Mon, 27 Jan 2025 11:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNCv-0001nP-Ki; Mon, 27 Jan 2025 11:23:09 +0000
Received: by outflank-mailman (input) for mailman id 877769;
 Mon, 27 Jan 2025 11:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcNCu-0001nF-QT
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:23:08 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15312bac-dca1-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 12:23:07 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso156352366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:23:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e63177sm575186766b.58.2025.01.27.03.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 03:23:06 -0800 (PST)
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
X-Inumbo-ID: 15312bac-dca1-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737976987; x=1738581787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lm0QtMrPvnrzQ9lpLNrwgXP6KR8PUuVz+jjFjySMBmg=;
        b=XKOLPfwRwZV0PXJTIYq4Z5eQvPDv9SLbi4JV6dppKoxD/vqoRhkQXrbO6NDmFU/r/v
         onOMpKJnY/CUK9hbQVwYJMiT4WsIJVO6zh/WURI5hJjnD2gwX4XlB8XqSTVreCJFFBly
         amNl9SF271tEK6/A8jWrn3G1ys2Oc4xlT+P5p0SkfgJn2T3CSYuM9ZvDrCjdC4dvBOgD
         nVfpvnwZWVws9bK3hJ4MN/NddIYFmq8WUyEIXr7gBtuFZuYFtHIe4qz1OgtO4YNHCNU8
         bBosCeY/4hWJw44DO119NK0LFEKcZvhzAmtVIeW+N3eqcSrsXjuS2IvwpCB6u1rBniOK
         yL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976987; x=1738581787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm0QtMrPvnrzQ9lpLNrwgXP6KR8PUuVz+jjFjySMBmg=;
        b=UIZL2kWpu/Ue7LLdZuSS0GYonsrsJ8gqlC0qxFoCeWc3Hyx4W2VqbSAqZp/bjz+Ckn
         vWZaCmr0t6TJ9TjCCLUxyCZDLsnItU/SND3QdG6M7xZiGGh455JSeP8Hmw8LBg5xWAfZ
         v96r21B7FSmihcMmfzhmaa8mkLpj9RDwR4yJ8GD6YAgzWGK1IwqEiWEbwMsooUKCfX8c
         J8nRgO3eJjck5M1UOTg+/TUt20wTUkLsM9hur3nCK/vPUZNG45cDRLgsNbhXdoIPdI9c
         s6Ic7hnb7JcBlD/2bzbsdw5g6DwVcVy2WgxKXDfmeTg37BC06XtX8V1iZMW8yVjrXWUp
         H8dA==
X-Forwarded-Encrypted: i=1; AJvYcCXrwlu8FOzjf/oDfWsmUmvmgWKc5d7AeJJMhI4UnjoETVaknQYBlIG0XgagMRS2VwgeHZLNWao87tA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6JIBeK+9PZI6VyvQfv//wzGfSLL3XMj9MZOl8/yLL3j3Ugilp
	eM72EMJiVRhyIDnKI6Br+iLgmxza1Ig6O3dISGmyOWFH4ufEJKjlp5p0bFE4Ug==
X-Gm-Gg: ASbGncslrDjGcGPhGKSLIjboq6bMZ2kabm4ndd8erIa4gFo7OMnnV6F8ZRhKyAMeBg1
	HzltGPGghMbniiH1/6U9XGSjLoQurg59NVbPlRcgY++UGjeGe+3qBuNGz6MWmmx912dxRGzN1jg
	NyZe716vRG9JMl6ed9sc34/waITkEoDBV0kxFlzTvG55MAWMzq9jgQg9FrSd2IGyeA+In/ej7Hd
	JiFBv7HJNyLPMqgtmTcgl3RIpgWfe9nOammxUU31DTQTGvo6J3cMCp9gHDgQksBdF5ElY7/5xmr
	NaEtr+AYrC+S1FXvAB5ccZwQN2ur/Z33+p6zh+e8DrTGjy07gUWksZzBvUUKo46x3A==
X-Google-Smtp-Source: AGHT+IG78vQ2pIMfNxKeSKP2qAi5ur9DPCG6rSCwv4eYJ+U+0tnJjtFb79bw7udES64VUpdhNMX0Ig==
X-Received: by 2002:a17:907:1c11:b0:ab2:f74f:3f82 with SMTP id a640c23a62f3a-ab38b3da0cemr3587389866b.57.1737976987228;
        Mon, 27 Jan 2025 03:23:07 -0800 (PST)
Message-ID: <347b4bb0-5fd1-439f-9e3b-ef13ac89bbe9@suse.com>
Date: Mon, 27 Jan 2025 12:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] asm-generic: move some parts of Arm's
 domain_build.h to asm-generic header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <ba3cde730ae072ba1088e396dd7d03482e4c4011.1736334615.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ba3cde730ae072ba1088e396dd7d03482e4c4011.1736334615.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 12:13, Oleksii Kurochko wrote:
> Nothing changed. Only some functions declaration are moved to asm-generic
> header as they are expected to be used by common code of domain builing or
> dom0less.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/arm/include/asm/domain_build.h | 19 ++----------
>  xen/include/asm-generic/domain-build.h  | 41 +++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 17 deletions(-)
>  create mode 100644 xen/include/asm-generic/domain-build.h

Again I question this movement under this name. "Domain building" is a pretty
generic thing, yes, but what you move would e.g. be entirely inapplicable on
x86 (as it is now). For example ...

> --- /dev/null
> +++ b/xen/include/asm-generic/domain-build.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DOMAIN_BUILD_H__
> +#define __ASM_GENERIC_DOMAIN_BUILD_H__
> +
> +#include <xen/types.h>
> +
> +struct domain;
> +struct page_info;
> +struct kernel_info;
> +struct membanks;
> +
> +typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
> +                                     unsigned int order, void *extra);
> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
> +                             alloc_domheap_mem_cb cb, void *extra);
> +
> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> +                          paddr_t tot_size);

... the term "bank" seems pretty closely tied to DT. Other stuff ...

> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
> +int make_chosen_node(const struct kernel_info *kinfo);
> +int make_cpus_node(const struct domain *d, void *fdt);
> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
> +                         int addrcells, int sizecells);
> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
> +                     int sizecells, const struct membanks *mem);
> +int make_timer_node(const struct kernel_info *kinfo);

... here also falls in this category. Stuff like this may well live
under asm-generic/, but the file name chosen then needs to reflect
constraints.

> +unsigned int get_allocation_size(paddr_t size);
> +
> +

Nit: As before - no double blank lines please.

Jan

