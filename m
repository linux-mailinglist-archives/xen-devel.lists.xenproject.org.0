Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C9938F6A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761906.1171961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsYL-0000On-F8; Mon, 22 Jul 2024 12:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761906.1171961; Mon, 22 Jul 2024 12:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsYL-0000NC-Bq; Mon, 22 Jul 2024 12:54:09 +0000
Received: by outflank-mailman (input) for mailman id 761906;
 Mon, 22 Jul 2024 12:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVsYJ-0000N3-CZ
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:54:07 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ac23487-4829-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 14:54:06 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ef27bfd15bso17675071fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 05:54:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d70cbsm6086831a12.15.2024.07.22.05.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 05:54:05 -0700 (PDT)
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
X-Inumbo-ID: 7ac23487-4829-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721652846; x=1722257646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XhGfv3L8wgFLVBTBrmj130laA31TPFxkF248H/tu9l8=;
        b=b3Yi8gYOckeeO2zuie8Qt3QGclHHkeR3Rrq8iY/uDdKHWE6UmAhE3K5WljdwjSog2n
         1x9df/0V67owHWiOoFWAg9sWrQ5Dpr+nQHsG1R55skLv9aC3g5ph6zsYFLGJd2Us83mk
         hqpqaYWt6M2dp1whzRN+p1jaFazkJIRSkM6QjJm/6Qg28gtwBydr2KHjkKcKbXWyPyQc
         XtKoJDixwlOcpkYpuI4de8EeMgPo+dUhtqArYwPtQjY2ul3UQrJIWyW1U3++SBQstRa7
         +Lj/BcX0QDAo/PwQvVm4wJEqCuy/BQrFXQ7Eh9x2kgza6sfUb9ZCalwfbZ2amz1qkJV+
         vIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721652846; x=1722257646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhGfv3L8wgFLVBTBrmj130laA31TPFxkF248H/tu9l8=;
        b=ZYp3udcD2xx0H2u1otR1+56leIetXAcU/8OisnfKzKoi2q5TiWBc3DI6BBruFVs++g
         DqHV6j52w4sqmdi72PYeflkjRH9/X/qDrOrpx818utygw/3HoaiUkH3P2HAcviG/tcyH
         w3e6hm+0wSoPaX7fn2RcKXkEQalOatniVMS3ZwgY0QlDMkx0NIr/NvONLToxtDXhpPtR
         pLe+q9LvtwEd87OyXyRWHZVL7mgN+YQt3bKjnpVTFIOREw4wXWGdJ5ybsPl68LXTy1VX
         nXH7i/740AmfbYLxTKmluay5vNFMQUMRrHer890uZvIgRGOvOKnmtxkQf4J3xE1zDu5P
         dDvw==
X-Forwarded-Encrypted: i=1; AJvYcCX5xTWBI7/gVw3dKpnkUWURR6rV9cGrmRPEjDXA8ETkumz71gyJp57zIpxcMbtXJR5EI5c243dUcbO03JgyMMmXe2hBslhvcdBTiABcGz4=
X-Gm-Message-State: AOJu0YyeJj4xcS/qtlKQj2CxYBek1hgbJuLHWk300Kh1t0eAETSlE8jm
	ycx87TgRRMVVjRkJzgJRVDsFtuhKkkxiuuGzCfUoyl7FiFcgxghd99y+5qHmZg==
X-Google-Smtp-Source: AGHT+IHOSjDjhL2Fg7I1IYnZNaB8XZTzMUhIVkdcSg1wtPiuknRAt4QMVpblP1UFyUrSP7q5OUq8pQ==
X-Received: by 2002:a2e:a30a:0:b0:2ef:232c:694a with SMTP id 38308e7fff4ca-2ef232c6c0emr36245721fa.8.1721652845726;
        Mon, 22 Jul 2024 05:54:05 -0700 (PDT)
Message-ID: <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
Date: Mon, 22 Jul 2024 14:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:22, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/pmap.h
> @@ -0,0 +1,28 @@
> +#ifndef __ASM_PMAP_H__
> +#define __ASM_PMAP_H__
> +
> +#include <xen/bug.h>
> +#include <xen/mm.h>
> +
> +#include <asm/fixmap.h>
> +
> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> +{
> +    pte_t *entry = &xen_fixmap[slot];
> +    pte_t pte;
> +
> +    ASSERT(!pte_is_valid(*entry));
> +
> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> +    pte.pte |= PTE_LEAF_DEFAULT;
> +    write_pte(entry, pte);
> +}
> +
> +static inline void arch_pmap_unmap(unsigned int slot)
> +{
> +    pte_t pte = {};
> +
> +    write_pte(&xen_fixmap[slot], pte);
> +}

Why are these not using set_fixmap() / clear_fixmap() respectively?

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -370,3 +370,17 @@ int map_pages_to_xen(unsigned long virt,
>      BUG_ON("unimplemented");
>      return -1;
>  }
> +
> +static inline pte_t mfn_to_pte(mfn_t mfn)

This name suggests (to me) that you're getting _the_ (single) PTE for
a given MFN. However, what the function is doing is make a PTE using
the given MFN. On x86 at least the common way to name such a function
would be pte_from_mfn().

> +{
> +    unsigned long pte = mfn_x(mfn) << PTE_PPN_SHIFT;
> +    return (pte_t){ .pte = pte};

Nit: Blank missing.

Jan

