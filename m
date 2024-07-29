Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F893F7DF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766826.1177353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRNL-0005PI-0r; Mon, 29 Jul 2024 14:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766826.1177353; Mon, 29 Jul 2024 14:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRNK-0005NI-T7; Mon, 29 Jul 2024 14:29:22 +0000
Received: by outflank-mailman (input) for mailman id 766826;
 Mon, 29 Jul 2024 14:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYRNJ-0005NC-W2
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:29:21 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1d0c52b-4db6-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 16:29:21 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so701953866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 07:29:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23f21sm513951066b.37.2024.07.29.07.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 07:29:20 -0700 (PDT)
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
X-Inumbo-ID: f1d0c52b-4db6-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722263360; x=1722868160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ek9HDFKIhaL+t8Gwc5EWQqh7/03/2YDofjLoJlxaQxs=;
        b=QBUM+vg363KMmym/zVIpR1X5fqoKm/tw8GgQhrjT7KgBVodMBbJx3kepb6y3zyafXT
         s6naL5912vguSAcdYpUGBESyY4Lb5E5Jnjm2/wR6LT1k9jMRZ6dObbpoX9GZ0grlKKc+
         Q52QnFQ0OddZeHR+XQcb2lfqq0no0YaJ1ANhK+Ji0mMWarivK0AlM1YqapYOC6aVIRUI
         Gkwzg+p2fW9EMRz4wUGyY/+qYIVIVeP1kfrtOcX/Co+PjipG/2T9RM4Crem+fC7aeV3B
         P3DuNtn0l6bH+NLy7Jq6CeorVQBVa4zxIQqaNI+sRYymdC6Ii0jdAhp0tgDDk7XCAaBD
         2UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263360; x=1722868160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek9HDFKIhaL+t8Gwc5EWQqh7/03/2YDofjLoJlxaQxs=;
        b=jA87nyA9ruIn1BFJovp5vIVBPBZ9eknlt2/0uBnWeHBm4yfo+mcpohz3NdO0y+yWge
         aVJmJ2HBx0AImSfGMXLT95ku+7/sPzacopAlp9LDEJs2V1L+OQYyqVYEyvYvpswULlta
         SHou2UPGQx5p7Ey5t40eMtfbvM3z35vguduoKO4E3r+c7b00JT/iSbxC6vaKO8U6EV73
         SIyNSFJ7A0BEP5c4vIB7ptQ9zzvUF1akGdXiWtrcy5AP91zXt2KAPVZEXCSIxLDVVHBA
         3UgxR6eXvbeVZALFGL2oAHe7k4chbYAKnoR0ogpnsAU3OCzd6C+BufmBdRcrX+KXcdhg
         JQEA==
X-Forwarded-Encrypted: i=1; AJvYcCUASwhlP3GEbYzwWlhCQmiC88P7w5eTi8+ywDXIboTwNwDmbvnLBWN/1Y3k9vKP8IEAl4SqTr6KNE89KH489vnjicHo+HnMUdghx3CedSQ=
X-Gm-Message-State: AOJu0YxqTw6ztVJUZCFB7M2TZ7xC1VS6BXyk91KW++San5YRowzQoteE
	AiIA9YEIz9tWWZ6Af9h2MJ0bA9Kdp1+2tasjXFDYIKRDa+NMNSwwp1SG1FxLdQ==
X-Google-Smtp-Source: AGHT+IEts3F4gtfTQUTq/sC3mhp1r+KNGjqDIfa6nq2x1dZso53XSTD4IzIe0pO0gu6tC5JCWabAHg==
X-Received: by 2002:a17:906:d262:b0:a6f:e7a0:91cf with SMTP id a640c23a62f3a-a7d3fa09eccmr746903366b.24.1722263360345;
        Mon, 29 Jul 2024 07:29:20 -0700 (PDT)
Message-ID: <3359e37e-eaae-49ca-80a5-2bf70b9b46c7@suse.com>
Date: Mon, 29 Jul 2024 16:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/riscv: introduce asm/pmap.h header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <11b5487659a9c76793e520c108cd92c6c84b908d.1721834549.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <11b5487659a9c76793e520c108cd92c6c84b908d.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> Introduces arch_pmap_{un}map functions and select HAS_PMAP
> for CONFIG_RISCV.
> 
> Additionaly it was necessary to introduce functions:
>  - mfn_from_xen_entry
>  - mfn_to_pte
> 
> Also flush_xen_tlb_range_va_local() and flush_xen_tlb_one_local()
> are introduced and use in arch_pmap_unmap().

Just flush_xen_tlb_one_local() would suffice for the purposes here.
flush_xen_tlb_range_va_local() will need some kind of cutoff, to
avoid looping for an excessivly long time.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/pmap.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef ASM_PMAP_H
> +#define ASM_PMAP_H
> +
> +#include <xen/bug.h>
> +#include <xen/mm.h>
> +#include <xen/page-size.h>
> +
> +#include <asm/fixmap.h>
> +#include <asm/flushtlb.h>
> +#include <asm/system.h>
> +
> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> +{
> +    pte_t *entry = &xen_fixmap[slot];
> +    pte_t pte;
> +
> +    ASSERT(!pte_is_valid(*entry));
> +
> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> +    write_pte(entry, pte);
> +}

Perhaps add a comment to clarify why it's safe to omit a TLB flush here.
Note that arch_pmap_unmap() having one is a necessary but not sufficient
condition to that. In principle hardware may also cache "negative" TLB
entries; I have no idea how RISC-V behaves in this regard, or whether
that aspect is actually left to implementations.

> +static inline void arch_pmap_unmap(unsigned int slot)
> +{
> +    pte_t pte = {};
> +
> +    write_pte(&xen_fixmap[slot], pte);
> +
> +    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
> +}

For both functions, even if mainly for documentation purposes, it may
be desirable to mark them __init. It's again a necessary (but not
sufficient) condition here, to validly use local TLB flushes only.

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -382,3 +382,18 @@ int map_pages_to_xen(unsigned long virt,
>      BUG_ON("unimplemented");
>      return -1;
>  }
> +
> +static inline pte_t mfn_from_pte(mfn_t mfn)
> +{
> +    unsigned long pte = mfn_x(mfn) << PTE_PPN_SHIFT;
> +    return (pte_t){ .pte = pte };
> +}

My earlier naming related comment may not have been here, but it
was certainly meant to apply to any similar functions: A function
of this name should imo take a pte_t and produce an mfn_t. IOW I'd
expect this function to be pte_from_mfn(). However, I question it being
a good idea to do it this way. The resulting pte_t isn't valid yet, aiui,
as it still needs at least the access controls filled in. Such a partial
pte_t would better not be floating around at any time, imo. IOW the
function likely wants to take a 2nd parameter.

Jan

