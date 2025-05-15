Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21386AB838C
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985152.1371088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVW6-0007Wn-D0; Thu, 15 May 2025 10:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985152.1371088; Thu, 15 May 2025 10:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVW6-0007Tu-9G; Thu, 15 May 2025 10:08:42 +0000
Received: by outflank-mailman (input) for mailman id 985152;
 Thu, 15 May 2025 10:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFVW5-0007To-Ky
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:08:41 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92b7ed27-3174-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 12:08:39 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5fbc736f0c7so1148606a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:08:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fd2b82297esm6812713a12.44.2025.05.15.03.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 03:08:38 -0700 (PDT)
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
X-Inumbo-ID: 92b7ed27-3174-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747303719; x=1747908519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=isIMdZ8Pin1EYuoK9HNbdwiEJU+o8JaDPxr2CJqfkkI=;
        b=VXrTg0fn9AtzdLUHqY9yFDuEaD9XPx2ySf30RI9vMD9cVskFMzHfWB/nEmHxlyTVmX
         6rRzba512lLWIgpLCI2q7uWy1QP1eLkJblEVoVwgTDnWtULXh5UonBSzF6pehHX4D87P
         TONKAw8e22L6wm3jlwtmjjIAcTqVSq6ooLxiRdjARLzheWvbhsRFbIuYADsXjbSu7Sd2
         88AjOc0/vEQi2BZLxgEaXTGhk+8uWBVj5R3rUOK+gnW2g4NzOzq86EBrTAInrdyp1fCd
         vvMHnbOfK7Xu1qnruszuhtlU+vxAqS2mFPCMqpdIvBHcTi7XneSiXkx7/Udrp0Shpbc9
         TzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747303719; x=1747908519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isIMdZ8Pin1EYuoK9HNbdwiEJU+o8JaDPxr2CJqfkkI=;
        b=LgxdGpkTS9N78xkMof6LnSfqfkcrFKHuC/T6n0OjnMkwO7KyzyAx7kKDXxPJWHGPe3
         ofPd3ymAN2iPhtktSjiyWVbmyr+JE+0TD1Ts9GbPshF2WJWZsT/YCE+2VVBLZCSadY8e
         TeP+ezorUsQ9SZEzeXuVSRqQ1m/b92o2szZoYWs2BA2O2RZC7R7ei4hamXbTavCVDESe
         gmrnj9+bq5KxBwfGeJbSEK8YxFwBOXUPcelTr0UzT3b00XurhfB5ajAEvaYTYFg8yutk
         kEeCX5XFTXtknJav7JAEpOMCOsaR6h+GE7C8Tez1aM7uXN/Q47RldKx/5x/ta3sKG5/S
         JoyA==
X-Forwarded-Encrypted: i=1; AJvYcCXUzjatsbKTuCm0AUzZcCov13+BGSGO6E0eguB0DTzDd/Ue/m/icEaQkKPvFa+PcmCa8rPO00t1mYM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4AuhMeXvgCLQNV5pJVr8c6n2c2KeJEwzErpgceCF2hw9lxOt9
	agV6T6YOxdivJhgcpTLk5OI1MKwBEmB9Xrq8xn+cglFI0Pj412u1dNO2r2wc8w==
X-Gm-Gg: ASbGncuOON/BEmanQaqaSMQilR2SQeIvS1TSr+ZoTl28wIiph/KdXaTQEkNgaQagh3w
	KlRy8c4SJCBj05OjfQEoJ28ChfKLWt5rb+hQy1ovdFdikIoqvjw4N5kEwD3suR3E0Efe7hT/m5k
	AMqzew7hs8PcaP6FLnNk2SYfLS5Ptrvz8630J8bw2psXDlembbbiSPNREQ+1U2+08QaKF7uzqN8
	BMnnFzrdjwaC+OleHQ0sZfkV9x2ytibidJ19gj9+zgOH4ORI6a9n41UE4YSqxaQ+n8zSXRYGiLP
	WOVVUWg3mNVeXaOGt78COzKHUR0H4q1SbIzDSK/DG57FKcwORglVV7/8LAasZg+ClcyYHmKW7Gg
	61ddvNxhaFkazQcyfCHDvhPfS/NG4I5/hpqQK
X-Google-Smtp-Source: AGHT+IFX+uG785reGbuu72hta70J2BQu/hSXGonvstXIvJ+/JG0Hm0AMjjiSVUSdN6ce8FrrzIpyzg==
X-Received: by 2002:a05:6402:520b:b0:5ff:7175:a6f6 with SMTP id 4fb4d7f45d1cf-5ff988ad823mr5585751a12.19.1747303719145;
        Thu, 15 May 2025 03:08:39 -0700 (PDT)
Message-ID: <d923a7dc-f850-4256-8639-310243a26736@suse.com>
Date: Thu, 15 May 2025 12:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: add initialization support for virtual SBI
 UART (vSBI UART)
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 17:55, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>  obj-y += aplic.o
>  obj-y += cpufeature.o
> +obj-y += dom0less-build.o

Arm uses

obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o

Why the two differences?

> --- /dev/null
> +++ b/xen/arch/riscv/dom0less-build.c
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bug.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +
> +#include <asm/vsbi-uart.h>
> +
> +int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
> +                      const struct dt_device_node *node)
> +{
> +    int rc = -EINVAL;
> +
> +    kinfo->arch.vsbi_uart = dt_property_read_bool(node, "vsbi_uart");
> +
> +    if ( kinfo->arch.vsbi_uart )
> +    {
> +        rc = domain_vsbi_uart_init(d, NULL);
> +        if ( rc < 0 )
> +            return rc;
> +    }
> +
> +    if ( rc )
> +        panic("%s: what a domain should use as an UART?\n", __func__);

Is this a reason to panic()? Isn't it possible for domains to be fine
without any UART?

> --- /dev/null
> +++ b/xen/arch/riscv/vsbi-uart.c
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/sched.h>
> +#include <xen/xmalloc.h>
> +
> +#include <asm/vsbi-uart.h>
> +
> +int domain_vsbi_uart_init(struct domain *d, struct vsbi_uart_init_info *info)
> +{
> +    int rc;
> +    struct vsbi_uart *vsbi_uart = &d->arch.vsbi_uart;
> +
> +    if ( vsbi_uart->backend.dom.ring_buf )
> +    {
> +        printk("%s: ring_buf != 0\n", __func__);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * info is NULL when the backend is in Xen.
> +     * info is != NULL when the backend is in a domain.
> +     */
> +    if ( info != NULL )
> +    {
> +        printk("%s: vsbi_uart backend in a domain isn't supported\n", __func__);
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +    else

Pointless "else" after "goto".

> +    {
> +        vsbi_uart->backend_in_domain = false;
> +
> +        vsbi_uart->backend.xen = xzalloc(struct vsbi_uart_xen_backend);
> +        if ( vsbi_uart->backend.xen == NULL )
> +        {
> +            rc = -ENOMEM;
> +            goto out;
> +        }
> +    }
> +
> +    spin_lock_init(&vsbi_uart->lock);
> +
> +    return 0;
> +
> +out:

Nit (you know what, I suppose).

> +    domain_vsbi_uart_deinit(d);
> +
> +    return rc;
> +}
> +
> +void domain_vsbi_uart_deinit(struct domain *d)
> +{
> +    struct vsbi_uart *vsbi_uart = &d->arch.vsbi_uart;
> +
> +    if ( vsbi_uart->backend_in_domain )
> +        printk("%s: backed in a domain isn't supported\n", __func__);

Is this relevant in a de-init function?

Jan

