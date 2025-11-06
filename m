Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE211C3A375
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156689.1485706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxAr-0004A1-8v; Thu, 06 Nov 2025 10:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156689.1485706; Thu, 06 Nov 2025 10:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxAr-00046u-5b; Thu, 06 Nov 2025 10:25:01 +0000
Received: by outflank-mailman (input) for mailman id 1156689;
 Thu, 06 Nov 2025 10:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGxAp-00046o-GE
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:24:59 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d82b3893-bafa-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 11:24:58 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so1114509a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 02:24:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f866dd5sm1405401a12.32.2025.11.06.02.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:24:57 -0800 (PST)
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
X-Inumbo-ID: d82b3893-bafa-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762424697; x=1763029497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=prnQff2mG8GAQcC84FcjGAocA+SkY+ow+f04EBM/5x4=;
        b=IZnK4q7oJ1r6kTPmhz3WjnWwM0nB8hM8hJ+ufCRrLCSj0BEQVe/UAnJKUl4VE8qP3P
         uzdwBi0NVT/LORJwoJt0aVrMTvojNtlnHMXvumt9bgWtRs9UCBHHvDgI8GubhCVigLCu
         SvJIW1Y4CYcoXjJl426emxtXK6SOqzGkdjSUmlpydiJnjo0wGjf8IzSF9Hq+ayIQq0+i
         S5JZpIMD8FepWlrvLmdZi6NsRMq2epcpCYKe3Go0o8XEm+TjThwPKbJUIKxC85kaGPBD
         PyR78LTGyODmAyj+jMxMIvinze528S6X/j7UlxflW22caFgK/OAJDEyniam/AtMw8U3V
         q0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424697; x=1763029497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prnQff2mG8GAQcC84FcjGAocA+SkY+ow+f04EBM/5x4=;
        b=T/S4AdxXaTqNxTZkRDY2KsNQDCaAi3QPPG2RLoFip7DanJ19Pk1CuNKXmG5mG6xdIo
         9IKWrGg8AGVpT3L1oW15F9vqBw1+pI+WIzyHqlaWdTqiOFeCM+gYMQX/+PPg/kCsMrbx
         4UFaZeLpc76B96amRJ8q3t8KMmrZzdMiXw9JH4M1a/h8/i/q5hpJ/LwEwIrMQBDg45jH
         0xHneJfdtM3D4F6nFTbCXoqe8N7V4KBidX2hIvI37pwQlNiDTpOfAn9ifezk7lkyG6Ok
         pw1kRolhzJZo2+r1Qy0Yp8itj7pBjp+4/FysdR6fiqy0jbLw2DP8MicxbNTmwf68LSP2
         p6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHPQtkn+8vjLd4PMwpxKCbfVdVJs6WzJFeu7jpxSHD4xouOYeLw/TzL2BvJ5YjhDKV0b6mBElQy5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd2J8azfnjbZ+WpKHhSNjjKqCXueXb5Fpcy8x9C4uhsKYQnevM
	Mm5zZSOUnWV3cqdKO3jHU90Ix/V/jDayKw718IY9OTbaPtpkhN07qsn4o/9JMumIAg==
X-Gm-Gg: ASbGncsilmqJQARsK7+PdzC+hl+1LPXeEe1tYN5r8NUgIlftxjh3bhzKckFdwZ4WFtU
	ORz593yJSUocFdE1IVo5TTnm2HGUxVU2xKCB8A4998Wq3EdSgg9RqHM3Cylq6suM8MuIqDOzF3e
	H9CCT2AvDgz5SAx4VkxG0K5bjwmTLlOWxKx8EWEEpMY5gvLbfHN3Amh7e7nh18fQyeykcMW+Lf/
	izFMhKPj+cGCdc79y9n5cU50JO6+ExlrXJz+h0tYKzbbBGlQ8Inu8vi+f1SNuTvjZvVJojISx5x
	Y7yWNQ3l0U2Lt2CNXtndxjbqYpk9Bi0zlvqKZEEF8SmHKWw+bjEkvCCgAE2w9ZvmJwbD6RtSHmk
	M6OZ7tSl2eL0lqDQ39v70o6ZapOWmRyfc0Ne0PoTfmIykwQNLveEeOrJuqqZkU/aoJanS038HUJ
	lIBDJaO/XtbYS4aCI4/OSDxyU6pTf3ISs9+MXtA0KlQBUuMNQj61iYZn1cYMUP
X-Google-Smtp-Source: AGHT+IEK6/XPI8boX+h4WHZZ6ms3u9YX2cwFEozGewBMj809BbL87XZWGWtCwKxLSbowCgNS3DbYZw==
X-Received: by 2002:a05:6402:440a:b0:63c:5d27:7ed7 with SMTP id 4fb4d7f45d1cf-64105b707e7mr6186615a12.30.1762424697443;
        Thu, 06 Nov 2025 02:24:57 -0800 (PST)
Message-ID: <fb5d3725-617c-4cbb-b0f3-b8f6c84b19c1@suse.com>
Date: Thu, 6 Nov 2025 11:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <33372689f3097b0dde1d47b81a1bb8176b35d20c.1761998077.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <33372689f3097b0dde1d47b81a1bb8176b35d20c.1761998077.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.11.2025 12:56, Oleksii Moisieiev wrote:
> --- /dev/null
> +++ b/xen/include/xen/lib/io.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Generic I/O memory copy function prototypes.
> + *
> + * These functions provide low-level implementation for copying data between
> + * regular memory and I/O memory regions. Each architecture must provide its
> + * own implementation based on the specific requirements of the architecture's
> + * memory model and I/O access patterns.
> + *
> + * Architecture-specific implementations:
> + * =====================================
> + * Each architecture should implement these functions in xen/lib/<arch>/io.c
> + * based on their hardware requirements:
> + *
> + * - ARM/ARM64: Requires special I/O accessors (readl_relaxed, writel_relaxed)
> + *              with proper memory barriers and alignment handling.
> + *              See xen/lib/arm/io.c for implementation.
> + *
> + * - x86/x86_64: I/O memory is directly accessible, so typically uses:
> + *               #define memcpy_fromio memcpy
> + *               #define memcpy_toio   memcpy
> + *               See xen/arch/x86/dmi_scan.c for example usage.

I'm not quite sure this is true, especially when now we prefer to use REP MOVSB
there. You don't provide the x86 implementation anyway, so it's not clear whether
it's a good idea so say anything here about (unclear) future code. (What may be
appropriate in dmi_scan.c, where it's really RAM that is being accessed, may not
be appropriate for actual MMIO.)

> + * - Other architectures (RISC-V, PowerPC, MIPS, etc.): Should provide their
> + *   own implementations following the function signatures defined below.
> + *
> + * Naming Convention:
> + * ==================
> + * The double underscore (__) prefix indicates these are low-level "raw"
> + * implementation functions, following the Linux kernel convention for
> + * architecture-specific primitives. This warns developers that these
> + * functions have specific requirements and should not be confused with
> + * regular memcpy().

I disagree here. We really should stop violating name spacing rules set forth
by the spec and/or Misra.

> + */
> +
> +#ifndef _XEN_LIB_IO_H
> +#define _XEN_LIB_IO_H
> +
> +#include <xen/types.h>
> +
> +/*
> + * __memcpy_fromio - Copy data from I/O memory space to regular memory
> + * @to: Destination buffer in regular memory
> + * @from: Source address in I/O memory space (must be marked __iomem)
> + * @count: Number of bytes to copy
> + *
> + * This function handles copying from memory-mapped I/O regions using
> + * architecture-appropriate I/O accessor functions. It ensures proper:
> + * - Memory ordering and barriers
> + * - Alignment requirements
> + * - Hardware-specific access semantics
> + *
> + * Each architecture provides its own implementation that may:
> + * - Use special I/O accessor functions (ARM: readl_relaxed, readb_relaxed)
> + * - Implement alignment handling for devices requiring specific access sizes
> + * - Add memory barriers to ensure ordering with other I/O operations
> + * - Or simply map to memcpy() if the architecture allows direct I/O access
> + */
> +extern void __memcpy_fromio(void *to, const volatile void __iomem *from,
> +                            size_t count);
> +
> +/*
> + * __memcpy_toio - Copy data from regular memory to I/O memory space
> + * @to: Destination address in I/O memory space (must be marked __iomem)
> + * @from: Source buffer in regular memory
> + * @count: Number of bytes to copy
> + *
> + * This function handles copying to memory-mapped I/O regions using
> + * architecture-appropriate I/O accessor functions. It ensures proper:
> + * - Memory ordering and barriers
> + * - Alignment requirements
> + * - Hardware-specific access semantics
> + *
> + * Each architecture provides its own implementation that may:
> + * - Use special I/O accessor functions (ARM: writel_relaxed, writeb_relaxed)
> + * - Implement alignment handling for devices requiring specific access sizes
> + * - Add memory barriers to ensure ordering with other I/O operations
> + * - Or simply map to memcpy() if the architecture allows direct I/O access
> + */
> +extern void __memcpy_toio(volatile void __iomem *to, const void *from,
> +                          size_t count);
> +
> +#endif /* _XEN_LIB_IO_H */

There are no provisions here for an arch using macro aliasing, as you suggest in
the comment further up for x86.

> --- /dev/null
> +++ b/xen/lib/arm/io.c
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <asm/io.h>
> +#include <xen/lib/io.h>
> +
> +/*
> + * These functions use 32-bit (uint32_t) IO operations rather than 64-bit for
> + * the following reasons:
> + *
> + * 1. ARM32/ARM64 compatibility: On ARM32, there is no atomic 64-bit IO accessor
> + *    (readq_relaxed). Only readq_relaxed_non_atomic() exists, which internally
> + *    performs two separate 32-bit reads. Using it would not provide any
> + *    performance benefit and could introduce ordering issues.
> + *
> + * 2. Hardware compatibility: Many IO devices only support 32-bit aligned accesses.
> + *    64-bit accesses might not be supported or could cause bus errors on some
> + *    hardware.
> + *
> + * 3. Simplicity: Using 32-bit operations keeps the code simple, maintainable,
> + *    and consistent across both ARM32 and ARM64 architectures without
> + *    architecture-specific conditionals.
> + *
> + * The performance difference between 32-bit and 64-bit operations in this
> + * context is negligible compared to the IO access latency itself.
> + */
> +
> +/*
> + * memcpy_fromio - Copy data from IO memory space to "real" memory space.
> + * @to: Where to copy to
> + * @from: Where to copy from
> + * @count: The size of the area.
> + */
> +void __memcpy_fromio(void *to, const volatile void __iomem *from,
> +                     size_t count)
> +{
> +    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
> +    {
> +        *(uint8_t *)to = readb_relaxed(from);
> +        from++;
> +        to++;
> +        count--;
> +    }
> +
> +    while ( count >= 4 )
> +    {
> +        *(uint32_t *)to = readl_relaxed(from);

Is this going to be fine on Arm32, when "to" doesn't point at a 4-byte-aligned
location?

> +        from += 4;
> +        to += 4;
> +        count -= 4;
> +    }
> +
> +    while ( count )
> +    {
> +        *(uint8_t *)to = readb_relaxed(from);
> +        from++;
> +        to++;
> +        count--;
> +    }
> +}
> +
> +/*
> + * memcpy_toio - Copy data from "real" memory space to IO memory space.
> + * @to: Where to copy to
> + * @from: Where to copy from
> + * @count: The size of the area.
> + */
> +void __memcpy_toio(volatile void __iomem *to, const void *from,
> +                   size_t count)
> +{
> +    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
> +    {
> +        writeb_relaxed(*(const uint8_t *)from, to);
> +        from++;
> +        to++;
> +        count--;
> +    }
> +
> +    while ( count >= 4 )
> +    {
> +        writel_relaxed(*(const uint32_t *)from, to);
> +        from += 4;
> +        to += 4;
> +        count -= 4;
> +    }
> +
> +    while ( count )
> +    {
> +        writeb_relaxed(*(const uint8_t *)from, to);
> +        from++;
> +        to++;
> +        count--;
> +    }
> +}

Is use of {read,write}l_relaxed() appropriate here anyway, when those
functions do endian-ness conversions (which memcpy()-like functions clearly
shouldn't do)?

Jan

