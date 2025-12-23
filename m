Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CDECD9E88
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 17:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192689.1511818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY510-0002gN-R3; Tue, 23 Dec 2025 16:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192689.1511818; Tue, 23 Dec 2025 16:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY510-0002eL-Nz; Tue, 23 Dec 2025 16:13:38 +0000
Received: by outflank-mailman (input) for mailman id 1192689;
 Tue, 23 Dec 2025 16:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY50z-0002eF-Hv
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 16:13:37 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 534a487d-e01a-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 17:13:32 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so46280155e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 08:13:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbc0bsm250242475e9.11.2025.12.23.08.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 08:13:31 -0800 (PST)
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
X-Inumbo-ID: 534a487d-e01a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766506411; x=1767111211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XaAmLtP9lufuDfAjNuVDIKxib9iohk8JY6Eod+nUjJo=;
        b=CTjAZAjJ6/VGo9/MeY01l3qSABKEFsNAAh0NHS3YOTfCUHYQ7o6lxyIM/PifNshy39
         sGpUpNzKe9PMXdjGtoheH4Iw/hhK6pyT3UklT1nUVUVS5WEmgkWJCT7E5W+/hDjWfR5f
         X9PVIyVrpwTzzdv0Wnv8+g4fCtFT40CNUY+c7BsqmupUWjs0ZwvqGNOx7KLhS/vyZ0GN
         g0A807n5ML5qUSUQ8hTU0QFPkxGn7HS/mE+FnuMWiGSTpOfkQoNQykQmCSTT9zuL6jx8
         xtjky2ZwwA6Y2OGSeP2B1paNLq1m8Ybp5YbxvCnlD1kIlpviyhVIl9bpshOQIyou4ESO
         k2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766506411; x=1767111211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaAmLtP9lufuDfAjNuVDIKxib9iohk8JY6Eod+nUjJo=;
        b=ObePlnpUfZIcXO9Ra2R1RSyCTOl0BVclR3dDO/mYsaXULB9hEE4SvM1DTGOYWUqMzm
         vSx9KqZNekEJxJ0LT+vZnA9tVx33s1weSckcWKFgHmAHa7yZKKXn4bUSz9LD+Vq9AnD2
         XkSNCWmAUxyEFKY1Y2+r7eXFIyXxH4PS8h+UQVcFbHO+8CbU2V+YVQdxePlCIpdcbIMh
         yxDbiIjqjbq9thDMOzaC4MmU3CdJe50j40k7Z4xMHiMb3/h2Vsp+UGyTWUeWhToF439t
         s1PhCqS0mPTAW2cdptq5exdeDmP3JiDnVWtpGzGd4EZKOy71eYCBFiZUMFEU9EvpUdJg
         3ibw==
X-Forwarded-Encrypted: i=1; AJvYcCUB9RY8wZU0TtpnFRGTa5TvJFO94DCa3L+8WAbz9ANzBtFuW6OTNfXLOFiRBaVjZHMGa1y3WJH0bjY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6MXyhAYxa6u3yOqfcIY4nQZjCne+fE4JJDe1ObfX41S5ZKzGX
	kqUfN9iv1Tct1AhbP6G53hW8MNjsY6liHR8paZ7THjOCJyLvGMY9rxlQGsuaFLElCw==
X-Gm-Gg: AY/fxX7VMZUoJlbbQbMEuoQ4j/SJfcTR0MZybwUXAtCHiOxT4/39Ka1NNATYOAPyMhk
	wJ1J9B4E1WpJoaBDT8xBg4uKvVGaVQ3OkBrmoTwk/EWeNXUcW6DcjJHAe3YlN5MIu1j0D5FBVE4
	8YFFhwzp1thYTlbR2Q80oGBmJxXj8ZfLZ7YUvaIGzXbf17cXQ5JhA/rQBIkluZLB8wxG4mEjX23
	awEnuOdPyBQRPOrMdE41wENu0YauSybrC3Q1bpo18O2L+KfW7MYt1/ZT9DBsbQhhtUseDRHF8gf
	je7cEsypCu9pooL1UwxO4yxj/v2VgVaMox+OTbIWTn4Vc5JyraK+1W3hqquD9a5wsvFz/Cgp5Ah
	m9n22V5+wj8/v62AMFk4L6kQk/v17mwW3VUz0sQ8KtygFppnBV82sU83Qjuk3kXgthRETylA+ke
	tLT+JYSCICoqlUW4ZOZZfHEhHQIleYBTixo7P4SxQTR3529GNNhLLi5fhasb5s/2XeYknKGtdMq
	5g=
X-Google-Smtp-Source: AGHT+IF/iT/J9oF+tyHAhZPPin6vUZshytWGXHkITtP9sQ7ZJK0FHgCliah38cQ+dFK3pQ9YMUbzOw==
X-Received: by 2002:a05:600c:4711:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-47d195c1a71mr162820365e9.34.1766506411523;
        Tue, 23 Dec 2025 08:13:31 -0800 (PST)
Message-ID: <6d7304db-7b75-4b69-aec6-663f951c37f7@suse.com>
Date: Tue, 23 Dec 2025 17:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
 <d7c8217605ad5d88a94baf32c2543654a415236d.1766399205.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d7c8217605ad5d88a94baf32c2543654a415236d.1766399205.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:37, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -14,6 +14,13 @@
>  
>  #include <xen/cpumask.h>
>  
> +/* Xen-controlled SBI version reported to guests */
> +#define XEN_SBI_VER_MAJOR 0
> +#define XEN_SBI_VER_MINOR 2

Are these going to gain a 2nd use, justifying their placement here?

> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/base-extension.c
> @@ -0,0 +1,78 @@
> +
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/version.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/vsbi.h>
> +
> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
> +                                   struct cpu_user_regs *regs)
> +{
> +    int ret = 0;
> +    struct sbiret sbi_ret;
> +
> +    ASSERT(eid == SBI_EXT_BASE);
> +
> +    switch ( fid )
> +    {
> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
> +                   XEN_SBI_VER_MINOR;
> +        break;
> +
> +    case SBI_EXT_BASE_GET_IMP_ID:
> +        regs->a1 = SBI_XEN_IMPID;
> +        break;
> +
> +    case SBI_EXT_BASE_GET_IMP_VERSION:
> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
> +        break;
> +
> +    case SBI_EXT_BASE_GET_MVENDORID:
> +    case SBI_EXT_BASE_GET_MARCHID:
> +    case SBI_EXT_BASE_GET_MIMPID:
> +        if ( is_hardware_domain(current->domain) )
> +        {
> +            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +            ret = sbi_ret.error;
> +            regs->a1 = sbi_ret.value;
> +        }
> +        else
> +            /*
> +             * vSBI should present a consistent, virtualized view to guests.
> +             * In particular, DomU-visible data must remain stable across
> +             * migration and must not expose hardware-specific details.
> +             *
> +             * These register(s) must be readable in any implementation,
> +             * but a value of 0 can be returned to indicate the field
> +             * is not implemented.
> +             */
> +            regs->a1 = 0;
> +
> +        break;
> +
> +    case SBI_EXT_BASE_PROBE_EXT:
> +        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
> +        break;
> +
> +    default:
> +        /*
> +         * TODO: domain_crash() is acceptable here while things are still under
> +         * development.
> +         * It shouldn't stay like this in the end though: guests should not
> +         * be punished like this for something Xen hasn't implemented.
> +         */
> +        domain_crash(current->domain,
> +                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",

Same remark here as for patch 2.

Jan

