Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555F960768
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783790.1193079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sitRp-0001ML-At; Tue, 27 Aug 2024 10:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783790.1193079; Tue, 27 Aug 2024 10:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sitRp-0001JK-8B; Tue, 27 Aug 2024 10:29:13 +0000
Received: by outflank-mailman (input) for mailman id 783790;
 Tue, 27 Aug 2024 10:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sitRn-0001JE-Km
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:29:11 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32092efc-645f-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 12:29:09 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f4f5dbd93bso39171611fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 03:29:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d965sm91073666b.100.2024.08.27.03.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 03:29:08 -0700 (PDT)
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
X-Inumbo-ID: 32092efc-645f-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724754549; x=1725359349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1C/Ev2CQ1DZYN+9tMmU6GXQxTfRZwTT4FZ9YN963NPo=;
        b=PjfofYbRv9dS1A/6F4Vcf47vGd6HFF53wXyOHBRWdxq4hvhIhFn8T6zd2+hL/YFWzB
         4TuX9FsDT8TaXMs5z++uQmSyQsHuK5PbTwjB4BxMyowkud7HiINREJPjTXLRauoPcN2n
         5C5xEceHBTMbxOZWF7zNg/oUsS7dWjJZWgt2r9fxLHBuyolz4WHkdDnG+bh9LjHwoZ1/
         a2HXSsHBCbCYlDydrIyMzywfuH7o8KURjncQcYjDT05gWG2NTm91lKDoqM23ZkXcdqVL
         4X0YILFPfDf1o0i3TFVhjSOv4vfKZRE0ZdU8Mg8NGYNrJiTlfdepSQgr/6m4X2wlpezt
         8xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724754549; x=1725359349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C/Ev2CQ1DZYN+9tMmU6GXQxTfRZwTT4FZ9YN963NPo=;
        b=uZ5RiKe8p5ap8IyhC0xo5PQie4I2WNvwy2iuHeENjqeKePpnqDvOtR9Q6CkE+yRK+k
         IJScx1ACDljtK4CpraIO6+jCAqmodf1NoN7paprXZgdybyjISyUP+728qtqUfXgE6oCK
         mUUCgCNlSzhtNWqK9N0ciQ1fvAdF14YQELP3ERUysF4RLOrKU+2w4GZh7mzV5rb+sS5r
         OrvueY/jdyiHrhy7JIz4i74qW/MWCkgLXjNBIQaIM5+jGbkJ2kZk1r6XatlXaa9smgvo
         IH0ZHKbRDrwrzvyukYW7sbCY5a5C3BEPtfdFn7wWvXKiqFTpBWoyjO4fMOPFCw4EigSX
         7mAw==
X-Forwarded-Encrypted: i=1; AJvYcCXdowr0D+dy9X4nsGhfJDK295fvX9JPQyPTj4Sew6ZLWKygQG1qTZ83syHd4BhZHEJ8Qt0onhLZeqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7tzORT7fKj3NLCAhs7AqMfJElflEYhHihKRvD37tAlwvioqcz
	i2SIoXy1AMkISNHWzg2lDYXjTC1iZvMdPG9NkShdm6YcYvKjSqsB0Mk9gaZjww==
X-Google-Smtp-Source: AGHT+IGhiaoJNK4P2JMh+GilgxqJT941DWDpjxehVWuIJxBwDvcISAkU9bpibdzA8TlL+l85ahIDZQ==
X-Received: by 2002:a05:6512:159d:b0:52c:8a12:3d3b with SMTP id 2adb3069b0e04-534387c4a27mr8142158e87.56.1724754548834;
        Tue, 27 Aug 2024 03:29:08 -0700 (PDT)
Message-ID: <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
Date: Tue, 27 Aug 2024 12:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] xen/riscv: set up fixmap mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 18:06, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -41,8 +41,10 @@
>   * Start addr          | End addr         | Slot       | area description
>   * ============================================================================
>   *                   .....                 L2 511          Unused
> - *  0xffffffffc0600000  0xffffffffc0800000 L2 511          Fixmap
> - *  0xffffffffc0200000  0xffffffffc0600000 L2 511          FDT
> + *  0xffffffffc0A00000  0xffffffffc0C00000 L2 511          Fixmap

Nit: Please can you avoid using mixed case in numbers?

> @@ -74,6 +76,15 @@
>  #error "unsupported RV_STAGE1_MODE"
>  #endif
>  
> +#define GAP_SIZE                MB(2)
> +
> +#define XEN_VIRT_SIZE           MB(2)
> +
> +#define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE + GAP_SIZE)
> +#define BOOT_FDT_VIRT_SIZE      MB(4)
> +
> +#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE + GAP_SIZE)

Nit: Overly long line.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/fixmap.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * fixmap.h: compile-time virtual memory allocation
> + */
> +#ifndef ASM_FIXMAP_H
> +#define ASM_FIXMAP_H
> +
> +#include <xen/bug.h>
> +#include <xen/page-size.h>
> +#include <xen/pmap.h>
> +
> +#include <asm/page.h>
> +
> +#define FIXMAP_ADDR(n) (FIXMAP_BASE + (n) * PAGE_SIZE)
> +
> +/* Fixmap slots */
> +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
> +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
> +#define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of hardware */
> +
> +#define FIX_LAST FIX_MISC
> +
> +#define FIXADDR_START FIXMAP_ADDR(0)
> +#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST + 1)
> +
> +#ifndef __ASSEMBLY__
> +
> +/*
> + * Direct access to xen_fixmap[] should only happen when {set,
> + * clear}_fixmap() is unusable (e.g. where we would end up to
> + * recursively call the helpers).
> + */
> +extern pte_t xen_fixmap[];

I'm afraid I keep being irritated by the comment: What recursive use of
helpers is being talked about here? I can't see anything recursive in this
patch. If this starts happening with a subsequent patch, then you have
two options: Move the declaration + comment there, or clarify in the
description (in enough detail) what this is about.

> @@ -81,6 +82,18 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>      BUG_ON("unimplemented");
>  }
>  
> +/* Write a pagetable entry. */
> +static inline void write_pte(pte_t *p, pte_t pte)
> +{
> +    write_atomic(p, pte);
> +}
> +
> +/* Read a pagetable entry. */
> +static inline pte_t read_pte(pte_t *p)
> +{
> +    return read_atomic(p);

This only works because of the strange type trickery you're playing in
read_atomic(). Look at x86 code - there's a strict expectation that the
type can be converted to/from unsigned long. And page table accessors
are written with that taken into consideration. Same goes for write_pte()
of course, with the respective comment on the earlier patch in mind.

Otoh I see that Arm does something very similar. If you have a strong
need / desire to follow that, then please at least split the two
entirely separate aspects that patch 1 presently changes both in one go.

Jan

