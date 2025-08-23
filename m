Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D368FB32600
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090809.1447909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcIg-0002KT-Ta; Sat, 23 Aug 2025 00:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090809.1447909; Sat, 23 Aug 2025 00:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcIg-0002Iy-Qy; Sat, 23 Aug 2025 00:40:06 +0000
Received: by outflank-mailman (input) for mailman id 1090809;
 Sat, 23 Aug 2025 00:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MmA+=3D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upcIg-0002DR-5q
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:40:06 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b6c059-7fb9-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:40:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B432CA58C37;
 Sat, 23 Aug 2025 00:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611B3C4CEED;
 Sat, 23 Aug 2025 00:40:01 +0000 (UTC)
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
X-Inumbo-ID: b5b6c059-7fb9-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755909603;
	bh=X4y6vvrVwVP8d2R/v3Z6dA/bg/Ea2gAFz5FT8FIkSC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p6reIiWsFZIGQfimiimqj2On6JCDc3xlVbmUNhm/7ibIh8Y39DeocsJuED8v0vAQ3
	 OJRWri+QaqCuMroaVx2dzst3q+SF9QAxs/lZjWyBCbZaBMkPDYmNWh+NVxGcYkOgd+
	 MugcbSH6DtJzspzPR+g7J1WAKsQ63CyvfmvQujGWUgULkE/ksMYNJyCBJGh5+psZ3+
	 z5HdikGHFIQUkSWf0nqQ++eUNSpu6Em5Ru+IxbERYw+U4Warvk4VcG4W28vAcyR1Pn
	 7mF5CoQEMdb5g37mztKx41m2IPEAoKYErFzdOxbHF6W0O9Rc6R/PCHjbzzXXFDxOiD
	 fMbrNaFO8rJxg==
Date: Fri, 22 Aug 2025 17:40:00 -0700 (PDT)
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
Subject: Re: [RFC PATCH v5 08/10] lib/arm: Add I/O memory copy helpers
In-Reply-To: <6df9b5bbeae12a74397d72d53c530313f0778025.1753184487.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508221738030.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <6df9b5bbeae12a74397d72d53c530313f0778025.1753184487.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
> This commit introduces two helper functions, `__memcpy_fromio` and
> `__memcpy_toio`, to provide a robust mechanism for copying data between
> standard memory and memory-mapped I/O (MMIO) space for the ARM
> architecture.
> 
> These functions are designed to handle memory transfers safely,
> accounting for potential address alignment issues to ensure correctness
> and improve performance where possible. The implementation is specific
> to ARM and uses relaxed I/O accessors.
> 
> __memcpy_fromio:
> Copies a block of data from an I/O memory source to a destination in
> standard ("real") memory. The implementation first handles any unaligned
> bytes at the beginning of the source buffer individually using byte-wise
> reads. It then copies the bulk of the data using 32-bit reads for
> efficiency, and finally processes any remaining bytes at the end of the
> buffer.
> 
> __memcpy_toio:
> Copies a block of data from standard memory to a destination in I/O
> memory space. It follows a similar strategy, handling any initial
> unaligned portion of the destination buffer byte-by-byte before using
> more efficient 32-bit writes for the main, aligned part of the transfer.
> Any trailing bytes are also handled individually.
> xen/include/xen/lib/arm/io.h
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v5:
> - move memcpy_toio/fromio to the generic place
> 
>  xen/include/xen/lib/arm/io.h | 15 +++++++
>  xen/lib/Makefile             |  1 +
>  xen/lib/arm/Makefile         |  1 +
>  xen/lib/arm/io.c             | 80 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+)
>  create mode 100644 xen/include/xen/lib/arm/io.h
>  create mode 100644 xen/lib/arm/Makefile
>  create mode 100644 xen/lib/arm/io.c
> 
> diff --git a/xen/include/xen/lib/arm/io.h b/xen/include/xen/lib/arm/io.h
> new file mode 100644
> index 0000000000..86973660ba
> --- /dev/null
> +++ b/xen/include/xen/lib/arm/io.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _XEN_LIB_ARM_IO_H
> +#define _XEN_LIB_ARM_IO_H
> +
> +#include <xen/types.h>
> +
> +/*
> + * Prototypes for I/O memory access functions.
> + */
> +extern void __memcpy_fromio(void *to, const volatile void __iomem *from,
> +                     size_t count);
> +extern void __memcpy_toio(volatile void __iomem *to, const void *from,
> +                   size_t count);
> +
> +#endif /* _XEN_LIB_ARM_IO_H */
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 5ccb1e5241..efa8157a72 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_X86) += x86/
> +obj-$(CONFIG_ARM) += arm/
>  
>  lib-y += bsearch.o
>  lib-y += ctors.o
> diff --git a/xen/lib/arm/Makefile b/xen/lib/arm/Makefile
> new file mode 100644
> index 0000000000..87250b3822
> --- /dev/null
> +++ b/xen/lib/arm/Makefile
> @@ -0,0 +1 @@
> +obj-y += io.o
> \ No newline at end of file
> diff --git a/xen/lib/arm/io.c b/xen/lib/arm/io.c
> new file mode 100644
> index 0000000000..d267bd28e4
> --- /dev/null
> +++ b/xen/lib/arm/io.c
> @@ -0,0 +1,80 @@
> +#include <asm/io.h>
> +#include <xen/lib/arm/io.h>

Please add the SPDX tag


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
> +        *(u8 *)to = readb_relaxed(from);
> +        from++;
> +        to++;
> +        count--;
> +    }
> +
> +    while ( count >= 4 )
> +    {
> +        *(u32 *)to = readl_relaxed(from);
> +        from += 4;
> +        to += 4;
> +        count -= 4;
> +    }
> +
> +    while ( count )
> +    {
> +        *(u8 *)to = readb_relaxed(from);
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
> +        writeb_relaxed(*(u8 *)from, to);
> +        from++;
> +        to++;
> +        count--;
> +    }
> +
> +    while ( count >= 4 )
> +    {
> +        writel_relaxed(*(u32 *)from, to);
> +        from += 4;
> +        to += 4;
> +        count -= 4;
> +    }
> +
> +    while ( count )
> +    {
> +        writeb_relaxed(*(u8 *)from, to);
> +        from++;
> +        to++;
> +        count--;
> +    }
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

