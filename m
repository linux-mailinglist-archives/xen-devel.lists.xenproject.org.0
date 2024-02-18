Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B08598F3
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 20:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682643.1061731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbmVw-0002Jg-7l; Sun, 18 Feb 2024 19:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682643.1061731; Sun, 18 Feb 2024 19:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbmVw-0002IA-4W; Sun, 18 Feb 2024 19:07:48 +0000
Received: by outflank-mailman (input) for mailman id 682643;
 Sun, 18 Feb 2024 19:07:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rbmVv-0002I2-8K
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 19:07:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rbmVu-000064-Ag; Sun, 18 Feb 2024 19:07:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rbmVu-00075l-1M; Sun, 18 Feb 2024 19:07:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=16JJ2E5ZzPSV7RUl42eeFeuchlqNnTqERQgrGYqYmTc=; b=kZ3zDdfmg65TVqowh9UXOC3Oyp
	OHNyTw71R+s1Ikx0RGJhZoXM0+3JsIpqkfdB/bZk2asFxiPVCQaVqZboxS5S+N4A8C3JyflCLLsOh
	jqcNyH9vSNfIT5P2TShWGqHYsx/8HH5XwUNyh3ZwuOSJWX9Y6nA0P29l5u5eVgsmjTCk=;
Message-ID: <afa59d63-2310-4081-9fc8-1d8a66ae24fc@xen.org>
Date: Sun, 18 Feb 2024 19:07:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/30] xen/riscv: introduce io.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <64afc021f680e55d486f8429c02513bc9bf4b9ea.1707146506.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <64afc021f680e55d486f8429c02513bc9bf4b9ea.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/02/2024 15:32, Oleksii Kurochko wrote:
> The header taken form Linux 6.4.0-rc1 and is based on
> arch/riscv/include/asm/mmio.h.
> 
> Addionally, to the header was added definions of ioremap_*().

s/definions/definitions/

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>   - delete inner parentheses in macros.
>   - s/u<N>/uint<N>.
> ---
> Changes in V3:
>   - re-sync with linux kernel
>   - update the commit message
> ---
> Changes in V2:
>   - Nothing changed. Only rebase.
> ---
>   xen/arch/riscv/include/asm/io.h | 142 ++++++++++++++++++++++++++++++++
>   1 file changed, 142 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/io.h
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
> +static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
> +{
> +	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +
> +#define __raw_writew __raw_writew
> +static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
> +{
> +	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +
> +#define __raw_writel __raw_writel
> +static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
> +{
> +	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +
> +#ifdef CONFIG_64BIT
> +#define __raw_writeq __raw_writeq
> +static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
> +{
> +	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +#endif
> +
> +#define __raw_readb __raw_readb
> +static inline uint8_t __raw_readb(const volatile void __iomem *addr)
> +{
> +	uint8_t val;
> +
> +	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +
> +#define __raw_readw __raw_readw
> +static inline uint16_t __raw_readw(const volatile void __iomem *addr)
> +{
> +	uint16_t val;
> +
> +	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +
> +#define __raw_readl __raw_readl
> +static inline uint32_t __raw_readl(const volatile void __iomem *addr)
> +{
> +	uint32_t val;
> +
> +	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +
> +#ifdef CONFIG_64BIT
> +#define __raw_readq __raw_readq
> +static inline u64 __raw_readq(const volatile void __iomem *addr)
> +{
> +	u64 val;
> +
> +	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +#endif
> +
> +/*
> + * Unordered I/O memory access primitives.  These are even more relaxed than
> + * the relaxed versions, as they don't even order accesses between successive
> + * operations to the I/O regions.
> + */
> +#define readb_cpu(c)		({ uint8_t  __r = __raw_readb(c); __r; })
> +#define readw_cpu(c)		({ uint16_t __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
> +#define readl_cpu(c)		({ uint32_t __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
> +
> +#define writeb_cpu(v,c)		((void)__raw_writeb(v,c))
> +#define writew_cpu(v,c)		((void)__raw_writew((__force uint16_t)cpu_to_le16(v),c))
> +#define writel_cpu(v,c)		((void)__raw_writel((__force uint32_t)cpu_to_le32(v),c))

NIT: __raw_write*() are already returning void. So I am not sure to 
understand the pointer of the cast. IIUC, this is coming from Linux, are 
you intend to keep the code as-is (including style)? If not, then I 
woudl consider to drop the cast on the three lines above and ...

> +
> +#ifdef CONFIG_64BIT
> +#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
> +#define writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),c))

... here as well.

> +#endif
> +
> +/*
> + * I/O memory access primitives. Reads are ordered relative to any
> + * following Normal memory access. Writes are ordered relative to any prior
> + * Normal memory access.  The memory barriers here are necessary as RISC-V
> + * doesn't define any ordering between the memory space and the I/O space.
> + */
> +#define __io_br()	do {} while (0)
> +#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : : "memory");
> +#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : : "memory");
> +#define __io_aw()	do { } while (0)
> +
> +#define readb(c)	({ uint8_t  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
> +#define readw(c)	({ uint16_t __v; __io_br(); __v = readw_cpu(c); __io_ar(__v); __v; })
> +#define readl(c)	({ uint32_t __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
> +
> +#define writeb(v,c)	({ __io_bw(); writeb_cpu(v,c); __io_aw(); })
> +#define writew(v,c)	({ __io_bw(); writew_cpu(v,c); __io_aw(); })
> +#define writel(v,c)	({ __io_bw(); writel_cpu(v,c); __io_aw(); })
> +
> +#ifdef CONFIG_64BIT
> +#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(__v); __v; })
> +#define writeq(v,c)	({ __io_bw(); writeq_cpu((v),(c)); __io_aw(); })
> +#endif
> +
> +#endif /* _ASM_RISCV_IO_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall

