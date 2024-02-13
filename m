Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B686B852EBE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679841.1057562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZqb4-0000sq-6v; Tue, 13 Feb 2024 11:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679841.1057562; Tue, 13 Feb 2024 11:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZqb4-0000rI-2w; Tue, 13 Feb 2024 11:05:06 +0000
Received: by outflank-mailman (input) for mailman id 679841;
 Tue, 13 Feb 2024 11:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZqb2-0000rC-Jq
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:05:04 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc88ecfb-ca5f-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 12:05:03 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-339289fead2so2709705f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:05:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e27-20020a5d595b000000b0033b80a0d002sm5924940wri.57.2024.02.13.03.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 03:05:02 -0800 (PST)
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
X-Inumbo-ID: bc88ecfb-ca5f-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707822302; x=1708427102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkomEXbfXI/7ZZptfA2/rfk5DOgP+KKcci0WVktYpTg=;
        b=XlmRjHhbbPDEQW0vEyA96Hci/fnwPxs3jQ9EhFmOUcY1w4MnvNLKxSrLxPYTHaGyIg
         zBC2UXg6aE4ZY52kz8usVVngrqxPgSspaP44I7CeaZ4L5JpdtfTAZ02/H5V6x9XYkv3S
         hFf54TZ/YKQ3C/F8aNhydR9UqrRBFMCDCT85KvSiWPlLL+VeRDf1q+sf8p+hrU8CAq8d
         BKncisOUl0x417mH96Tr4W5S072MPe70kUTEdTtrySEqtlf5C7r99MqXNvcm/Ea01bXr
         Q+6fHuegSJkiDMuNadYxWas61dcvf/JMUj7eKnIK7Id3SVLkZvGVhekeG8R2fj5p9keS
         AxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707822302; x=1708427102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkomEXbfXI/7ZZptfA2/rfk5DOgP+KKcci0WVktYpTg=;
        b=j06++yjHGJ8t/WosxNjBYoKlMbQSms7Be2dHLBAoEVXhkHuID3q58HhLdjhwoHZGov
         RspPZkbkhskP7iSMZRKeXR2Sj3JqkRzu9yA6f7A1/ZkXIwCYEtqUZPDGjC8QfCiEWA1a
         jvhXPpCafzS8ajlKUAPH4ofB4o0C5faasKPgxO4JtXcFTm/Jz8mOUYhM7EluTM4q6ole
         htCvP/OtG9Yh0qrP4GsSpU3+/5fZrtzKw9P09+wMHXL0/wy8hQCD+g81J4f7v3/rjNkz
         4qMNTauFPGxfiluORSG1qC/68buKZrUquXgP/DvUUAQbcLoiZ+GeIJAtRNuV9VsPwPd/
         6Vqw==
X-Forwarded-Encrypted: i=1; AJvYcCVdBcpCgE0QqsV7ygKpZ3miJiOVYmD8yRcQFm13E8AYzHTaGi5Uay7Cgy8yyAtAcpBqa0hqSJ8DZ7Zk9vPKguVE+gFnXIFXXbhVkisKNdI=
X-Gm-Message-State: AOJu0YzwKvYzAiTCORQUjJ51tF4BftU/jbXeZUktoPCcI637tugsu3y1
	rWR48IxubF0X0ktBcABHEdDxady07BPndMdTSQjt4c5v5Akz96SmPatSyK8jpg==
X-Google-Smtp-Source: AGHT+IE3xHY382busbeHjY3skFDuUEygR1VQgBNmtSRZE4gZNUZYy+VQyqLy6GYYJUVZqJrTeel+JQ==
X-Received: by 2002:adf:f582:0:b0:33b:237b:22c2 with SMTP id f2-20020adff582000000b0033b237b22c2mr6585437wro.21.1707822302459;
        Tue, 13 Feb 2024 03:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWO3F7Xxte6KTRfftuOyC9eDRbfSjQpnbSkP+/aPmWruLpS1+uPKV+03x21BsacpHKWDAemcb/ouz04b4YXeTzhzRLjnlntRaLjvASnKy37ShHumnkNZoVx93jX+R2l0uDnSgOKZwAcxdZXv7ed+rBQAwDbS14/4lI0FkZffFwCJOp6iN2tTzzfMVJHi6Ndu5sax7neQhd/DxU/QJ3pwVtnzKjOzV3GZXBdLKlwB6BomW8mDTF+xy8GI0T6bz2hKxr7J2S1n9bBh8oBBLatWX9cXpZr3rRqhQw+eBpc50JaHuY6s3/Wd7I=
Message-ID: <5508296c-2721-43e4-83d3-2603ce31d010@suse.com>
Date: Tue, 13 Feb 2024 12:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/30] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <64afc021f680e55d486f8429c02513bc9bf4b9ea.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <64afc021f680e55d486f8429c02513bc9bf4b9ea.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> The header taken form Linux 6.4.0-rc1 and is based on
> arch/riscv/include/asm/mmio.h.
> 
> Addionally, to the header was added definions of ioremap_*().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - delete inner parentheses in macros.
>  - s/u<N>/uint<N>.
> ---
> Changes in V3:
>  - re-sync with linux kernel
>  - update the commit message
> ---
> Changes in V2:
>  - Nothing changed. Only rebase.
> ---
>  xen/arch/riscv/include/asm/io.h | 142 ++++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/io.h
> 
> diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
> new file mode 100644
> index 0000000000..1e61a40522
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
> + *   which was based on arch/arm/include/io.h
> + *
> + * Copyright (C) 1996-2000 Russell King
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2014 Regents of the University of California
> + */
> +
> +
> +#ifndef _ASM_RISCV_IO_H
> +#define _ASM_RISCV_IO_H
> +
> +#include <asm/byteorder.h>
> +
> +/*
> + * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
> + * change the properties of memory regions.  This should be fixed by the
> + * upcoming platform spec.
> + */
> +#define ioremap_nocache(addr, size) ioremap(addr, size)
> +#define ioremap_wc(addr, size) ioremap(addr, size)
> +#define ioremap_wt(addr, size) ioremap(addr, size)
> +
> +/* Generic IO read/write.  These perform native-endian accesses. */
> +#define __raw_writeb __raw_writeb

What use are this and the similar other #define-s?

> +static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
> +{
> +	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));

Nit (throughout): Missing blanks. Or wait - is this file intended to
be Linux style? If so, it's just one blank that's missing.

> +/*
> + * Unordered I/O memory access primitives.  These are even more relaxed than
> + * the relaxed versions, as they don't even order accesses between successive
> + * operations to the I/O regions.
> + */
> +#define readb_cpu(c)		({ uint8_t  __r = __raw_readb(c); __r; })
> +#define readw_cpu(c)		({ uint16_t __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
> +#define readl_cpu(c)		({ uint32_t __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })

Didn't we settle on the little-endian stuff to be dropped from here?
No matter what CPU endianness, what endianness a particular device
(and hence its MMIO region(s)) is using is entirely independent. Hence
conversion, where necessary, needs to occur at a layer up.

Also, what good do the __r variables do here? If they weren't here,
we also wouldn't need to discuss their naming.

> +#define writeb_cpu(v,c)		((void)__raw_writeb(v,c))
> +#define writew_cpu(v,c)		((void)__raw_writew((__force uint16_t)cpu_to_le16(v),c))
> +#define writel_cpu(v,c)		((void)__raw_writel((__force uint32_t)cpu_to_le32(v),c))

Nit: Blanks after commas please (also again further down).

> +#ifdef CONFIG_64BIT
> +#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
> +#define writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),c))

uint64_t (twice)

> +#endif
> +
> +/*
> + * I/O memory access primitives. Reads are ordered relative to any
> + * following Normal memory access. Writes are ordered relative to any prior
> + * Normal memory access.  The memory barriers here are necessary as RISC-V
> + * doesn't define any ordering between the memory space and the I/O space.
> + */
> +#define __io_br()	do {} while (0)

Nit: This and ...

> +#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : : "memory");
> +#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : : "memory");
> +#define __io_aw()	do { } while (0)

... this want to be spelled exactly the same.

Also, why does __io_ar() have a parameter (which it then doesn't use)?

Finally at least within a single file please be consistent about asm()
vs __asm__() use.

> +#define readb(c)	({ uint8_t  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
> +#define readw(c)	({ uint16_t __v; __io_br(); __v = readw_cpu(c); __io_ar(__v); __v; })
> +#define readl(c)	({ uint32_t __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })

Here the local variables are surely needed. Still they would preferably
not have any underscores as prefixes.

> +#define writeb(v,c)	({ __io_bw(); writeb_cpu(v,c); __io_aw(); })
> +#define writew(v,c)	({ __io_bw(); writew_cpu(v,c); __io_aw(); })
> +#define writel(v,c)	({ __io_bw(); writel_cpu(v,c); __io_aw(); })
> +
> +#ifdef CONFIG_64BIT
> +#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(__v); __v; })

uint64_t again

> +#define writeq(v,c)	({ __io_bw(); writeq_cpu((v),(c)); __io_aw(); })

Inner parentheses still left?

Jan

