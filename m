Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF974BFCB
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jul 2023 00:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560773.876926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIGKB-0005bc-OY; Sat, 08 Jul 2023 22:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560773.876926; Sat, 08 Jul 2023 22:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIGKB-0005ZC-Lh; Sat, 08 Jul 2023 22:22:43 +0000
Received: by outflank-mailman (input) for mailman id 560773;
 Sat, 08 Jul 2023 22:22:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qIGK9-000517-VW
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 22:22:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2c3e4d9-1ddd-11ee-8611-37d641c3527e;
 Sun, 09 Jul 2023 00:22:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D905260010;
 Sat,  8 Jul 2023 22:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856B2C433C7;
 Sat,  8 Jul 2023 22:22:36 +0000 (UTC)
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
X-Inumbo-ID: f2c3e4d9-1ddd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688854958;
	bh=eY0cOWD3nJddZmtYCGjKmZRXpteaQG62tae8NiGIonw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WDyvlTCgzud/Px2NYuDSWjCAWiH3w6e1NJKEdZb+rGvMC8O+0W7HU63BstR5mOYlp
	 P8zjJRBI6b+Q584QRPt5wbcmj6u4E/U7jkBKyQXweSz8GutsPEN2AGqp1nIKH7krmu
	 Wg3rDHtE95IUQNTWbZ38x/T0ytISEpUErm8xZ3PtEDV5zbm12Mc5q5rBW6hx/CQmGp
	 fKhxv7ilpW5Jrl9dX9VeE+OrbnrC+K5MVrrkSM88MxaoQq7wcbhqu3Ijsqt1jJwSmx
	 FowSD6fuUZxl1WYjEGL2Wut0YI39QmOm0BeDwLWQ2MLnuSI2rKptUV+ihbM8UOqyoK
	 KsIaqoYEHRl/A==
Date: Sat, 8 Jul 2023 15:22:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 08/10] x86, arm, riscv: add per-arch bootinfo headers
In-Reply-To: <20230701071835.41599-9-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307081522180.761183@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-9-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Jul 2023, Christopher Clark wrote:
> Changes to ensure that inclusion of <xen/bootinfo.h> succeeds in each
> of the main archtecture builds and in the 32-bit early x86 boot build.
> 
> The <xen/bootinfo.h> header contains structures that will be used in efi
> logic prior to the main start of Xen, so it needs to be suitable for
> inclusion in Arm source files.
> 
> The same header will also be included in early x86 boot logic, where
> asm/* headers are not reachable, and so they cannot be transitively
> included, so a ifdef condition is needed to prevent an attempt to
> include <asm/bootinfo.h> from within <xen/bootinfo.h> in that case.
> 
> The early x86 boot logic can then directly include <asm/bootinfo.h> via
> a specified directory path where it can be included successfully.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

I think this is fine.


> ---
> New for v2 series.
> 
>  xen/arch/arm/include/asm/bootinfo.h   | 20 ++++++++++++++++++++
>  xen/arch/riscv/include/asm/bootinfo.h | 20 ++++++++++++++++++++
>  xen/include/xen/bootinfo.h            |  7 ++-----
>  3 files changed, 42 insertions(+), 5 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/bootinfo.h
>  create mode 100644 xen/arch/riscv/include/asm/bootinfo.h
> 
> diff --git a/xen/arch/arm/include/asm/bootinfo.h b/xen/arch/arm/include/asm/bootinfo.h
> new file mode 100644
> index 0000000000..5316c87a3d
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/bootinfo.h
> @@ -0,0 +1,20 @@
> +#ifndef __ARCH_ARM_BOOTINFO_H__
> +#define __ARCH_ARM_BOOTINFO_H__
> +
> +struct __packed arch_bootmodule { };
> +DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
> +
> +struct __packed arch_boot_info { };
> +DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/riscv/include/asm/bootinfo.h b/xen/arch/riscv/include/asm/bootinfo.h
> new file mode 100644
> index 0000000000..5316c87a3d
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bootinfo.h
> @@ -0,0 +1,20 @@
> +#ifndef __ARCH_ARM_BOOTINFO_H__
> +#define __ARCH_ARM_BOOTINFO_H__
> +
> +struct __packed arch_bootmodule { };
> +DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
> +
> +struct __packed arch_boot_info { };
> +DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> index 8389da4f72..bf5586a76b 100644
> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -5,11 +5,8 @@
>  #include <xen/compiler.h>
>  #include <xen/mm-frame.h>
>  
> -#ifdef CONFIG_X86
> -#include <asm/bootinfo.h>
> -#else
> -    struct arch_bootmodule { };
> -    struct arch_boot_info { };
> +#if defined CONFIG_X86 || CONFIG_ARM || CONFIG_RISCV
> +# include <asm/bootinfo.h>
>  #endif
>  
>  /* Boot module binary type / purpose */
> -- 
> 2.25.1
> 
> 

