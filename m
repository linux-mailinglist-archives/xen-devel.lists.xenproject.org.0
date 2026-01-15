Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A88D21DA8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 01:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203983.1518892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgBEe-0006Lk-9k; Thu, 15 Jan 2026 00:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203983.1518892; Thu, 15 Jan 2026 00:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgBEe-0006Ih-6E; Thu, 15 Jan 2026 00:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1203983;
 Thu, 15 Jan 2026 00:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=by25=7U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vgBEc-0006IZ-Kw
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 00:29:10 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34592784-f1a9-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 01:29:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E6C343258;
 Thu, 15 Jan 2026 00:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499BDC4CEF7;
 Thu, 15 Jan 2026 00:29:05 +0000 (UTC)
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
X-Inumbo-ID: 34592784-f1a9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768436947;
	bh=4aKe4OAPA0op+l26oHzSgj0yVQfWdRKuWfz5OopJ588=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dfuwk3RQshcp0qDEw8rKI9v16E8Jof9oMOarA7qvm8VWKY8UV31ID5FaoUE+7GHjj
	 H5rxdPvNbFjjamATT8wXc2FyIwHvHvkU5aspFi/m0jTrbePTLm8aw9WSM5P1DuX0XW
	 fodX8K/HrUEUlYMhVBowxdlEnPsljRgK055WuU30opg/U54NXfKmJ7D9bDBSUf9xJU
	 5Dw2ySjLyZNuygrV9YADZiK75DsRhLpk7DAZebkFs0YiMuZewaa7k/g/HKtPj0apOB
	 gkSpVYxUHO0soLMSxmnsn2c6c1rK9VdZKX7FQ3nvJ7oMQYITB35sNC8ZvPjw1o9jpm
	 93B+XOrhudefA==
Date: Wed, 14 Jan 2026 16:28:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
In-Reply-To: <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601141628300.72558@ubuntu-linux-20-04-desktop>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com> <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jan 2026, Oleksii Moisieiev wrote:
> This commit introduces two helper functions, `memcpy_fromio` and
> `memcpy_toio`, to provide a robust mechanism for copying data between
> standard memory and memory-mapped I/O (MMIO) space for the ARM
> architecture.
> 
> These helpers handle alignment safely by using byte accesses for any
> leading/trailing unaligned bytes and 32-bit raw accesses for the aligned
> bulk transfer. Using `__raw_readb/__raw_readl` and
> `__raw_writeb/__raw_writel` avoids unintended endianness conversion while
> remaining safe across ARM32/ARM64 devices that only support 32-bit
> accesses.
> 
> The interface lives in the generic header so other architectures can
> provide their own implementations (as macros or functions). The ARM
> implementation is split into separate compilation units and added to the
> architecture-specific lib Makefile.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

From an ARM point of view:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Thanks Jan for the good feedback on the previous version which has now
been addressed


> ---
> 
> Changes in v7:
> - x86 guidance: removed the speculative note; header now just says
>   each arch supplies its own implementation or macro.
> - name spacing: dropped the double-underscore; the helpers are now
>   memcpy_fromio / memcpy_toio. The header also explicitly allows an
>   arch to define these as macros before including it.
> - updated io.c to keep 32-bit transfers safe on arm32
> - moved to __raw_read*/__raw_write* accessors to avoid endianness conversion.
> - split the helpers into separate compilation units
> 
> Changes in v6:
> - sorted objs in Makefile alhabetically
> - added newline at the end of Makefile
> - used uint{N}_t intead of u{N}
> - add comment about why 32 bit IO operations were used
> - updated cast opertaions to avoid dropping constness which is wrong
> - move function definitions to generic place so the could be reused by
> other arch
> - add SPDX tag to io.c
> 
> Changes in v5:
> - move memcpy_toio/fromio to the generic place
> 
>  xen/include/xen/lib/io.h    | 65 +++++++++++++++++++++++++++++++++++++
>  xen/lib/Makefile            |  1 +
>  xen/lib/arm/Makefile        |  1 +
>  xen/lib/arm/memcpy_fromio.c | 48 +++++++++++++++++++++++++++
>  xen/lib/arm/memcpy_toio.c   | 48 +++++++++++++++++++++++++++
>  5 files changed, 163 insertions(+)
>  create mode 100644 xen/include/xen/lib/io.h
>  create mode 100644 xen/lib/arm/Makefile
>  create mode 100644 xen/lib/arm/memcpy_fromio.c
>  create mode 100644 xen/lib/arm/memcpy_toio.c
> 
> diff --git a/xen/include/xen/lib/io.h b/xen/include/xen/lib/io.h
> new file mode 100644
> index 0000000000..cd2b6680d5
> --- /dev/null
> +++ b/xen/include/xen/lib/io.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Generic I/O memory copy function prototypes.
> + *
> + * These functions provide low-level implementation for copying data between
> + * regular memory and I/O memory regions. Each architecture must provide its
> + * own implementation based on the specific requirements of the architecture's
> + * memory model and I/O access patterns. An architecture may supply these as
> + * functions or as macros in its own headers before including this file.
> + *
> + * Architecture-specific implementations:
> + * =====================================
> + * Each architecture should implement these functions in xen/lib/<arch>/io.c
> + * (or define them as macros) based on their hardware requirements. See
> + * xen/lib/arm/io.c for an example using explicit I/O accessors.
> + */
> +
> +#ifndef _XEN_LIB_IO_H
> +#define _XEN_LIB_IO_H
> +
> +#include <xen/types.h>
> +
> +/*
> + * memcpy_fromio - Copy data from I/O memory space to regular memory
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
> +extern void memcpy_fromio(void *to, const volatile void __iomem *from,
> +                          size_t count);
> +
> +/*
> + * memcpy_toio - Copy data from regular memory to I/O memory space
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
> +extern void memcpy_toio(volatile void __iomem *to, const void *from,
> +                        size_t count);
> +
> +#endif /* _XEN_LIB_IO_H */
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 5ccb1e5241..6bb0491d89 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,3 +1,4 @@
> +obj-$(CONFIG_ARM) += arm/
>  obj-$(CONFIG_X86) += x86/
>  
>  lib-y += bsearch.o
> diff --git a/xen/lib/arm/Makefile b/xen/lib/arm/Makefile
> new file mode 100644
> index 0000000000..0bb1a825ce
> --- /dev/null
> +++ b/xen/lib/arm/Makefile
> @@ -0,0 +1 @@
> +obj-y += memcpy_fromio.o memcpy_toio.o
> diff --git a/xen/lib/arm/memcpy_fromio.c b/xen/lib/arm/memcpy_fromio.c
> new file mode 100644
> index 0000000000..342a28cb49
> --- /dev/null
> +++ b/xen/lib/arm/memcpy_fromio.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <asm/io.h>
> +#include <xen/lib/io.h>
> +
> +/*
> + * Use 32-bit raw IO operations for portability across ARM32/ARM64 where
> + * 64-bit accessors may not be atomic and some devices only support 32-bit
> + * aligned accesses.
> + */
> +
> +void memcpy_fromio(void *to, const volatile void __iomem *from,
> +		   size_t count)
> +{
> +	while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
> +			  !IS_ALIGNED((unsigned long)to, 4)) )
> +	{
> +		*(uint8_t *)to = __raw_readb(from);
> +		from++;
> +		to++;
> +		count--;
> +	}
> +
> +	while ( count >= 4 )
> +	{
> +		*(uint32_t *)to = __raw_readl(from);
> +		from += 4;
> +		to += 4;
> +		count -= 4;
> +	}
> +
> +	while ( count )
> +	{
> +		*(uint8_t *)to = __raw_readb(from);
> +		from++;
> +		to++;
> +		count--;
> +	}
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 8
> + * tab-width: 8
> + * indent-tabs-mode: t
> + * End:
> + */
> diff --git a/xen/lib/arm/memcpy_toio.c b/xen/lib/arm/memcpy_toio.c
> new file mode 100644
> index 0000000000..e543c49124
> --- /dev/null
> +++ b/xen/lib/arm/memcpy_toio.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <asm/io.h>
> +#include <xen/lib/io.h>
> +
> +/*
> + * Use 32-bit raw IO operations for portability across ARM32/ARM64 where
> + * 64-bit accessors may not be atomic and some devices only support 32-bit
> + * aligned accesses.
> + */
> +
> +void memcpy_toio(volatile void __iomem *to, const void *from,
> +	       size_t count)
> +{
> +	while ( count && (!IS_ALIGNED((unsigned long)to, 4) ||
> +			  !IS_ALIGNED((unsigned long)from, 4)) )
> +	{
> +		__raw_writeb(*(const uint8_t *)from, to);
> +		from++;
> +		to++;
> +		count--;
> +	}
> +
> +	while ( count >= 4 )
> +	{
> +		__raw_writel(*(const uint32_t *)from, to);
> +		from += 4;
> +		to += 4;
> +		count -= 4;
> +	}
> +
> +	while ( count )
> +	{
> +		__raw_writeb(*(const uint8_t *)from, to);
> +		from++;
> +		to++;
> +		count--;
> +	}
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 8
> + * tab-width: 8
> + * indent-tabs-mode: t
> + * End:
> + */
> -- 
> 2.34.1
> 

