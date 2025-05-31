Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87DEAC98DC
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001831.1381964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBF2-0002cr-14; Sat, 31 May 2025 01:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001831.1381964; Sat, 31 May 2025 01:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBF1-0002aK-U8; Sat, 31 May 2025 01:42:31 +0000
Received: by outflank-mailman (input) for mailman id 1001831;
 Sat, 31 May 2025 01:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLBF1-0002aE-0G
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:42:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 828ac196-3dc0-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 03:42:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BB35CA4FB3D;
 Sat, 31 May 2025 01:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E03C4CEEB;
 Sat, 31 May 2025 01:42:25 +0000 (UTC)
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
X-Inumbo-ID: 828ac196-3dc0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748655747;
	bh=u1dJsMgM3KzjGoDPaYsft6HHPcYrrWkYrCQihYWct6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MCFTJC41QAeRleF4hecQmzxjGZzVsmfk7s8Q0hP0h45VCg1thdeuq7qrx9uCVPDV0
	 jpbiy4qFZxgKSYax9I1HVZAeQIolzws+R7cDd3XoWF8z1QoqYGR9mAvllDiSbG6JkC
	 BX/lcfINItwhr9WkQhGE2wLzK2hJKT67wTWrfD49DIf09dXX3N3mnbWvZ4j1J+wsaL
	 werGm8O4oa2ZyKXIueD+4in4uaPtuhWGj9LicPVLOu5b1spOYo4xJyT/oGxekG3eQO
	 38fB8aMqftnhnjMyGji0VB0yUQIi2H5Op1Qb/hrxc5OQsrVyknrY8siu5G67ZL4A73
	 Swnh0HDGcCmJw==
Date: Fri, 30 May 2025 18:42:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 13/19] xen/dt: Move bootinfo functions to a new
 bootinfo.h
In-Reply-To: <20250530120242.39398-14-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301832520.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-14-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of
> bootinfo to a separate file for x86 to take.
> 
> With this, bootfdt.h can be cleanly included from x86. A later patch
> extracts the definitions so the functions may be called too.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/arch/arm/domain_build.c             |   1 +
>  xen/arch/arm/mmu/mm.c                   |   1 +
>  xen/arch/riscv/mm.c                     |   2 +-
>  xen/arch/riscv/setup.c                  |   2 +-
>  xen/common/device-tree/bootfdt.c        |   1 +
>  xen/common/device-tree/bootinfo.c       |   2 +-
>  xen/common/device-tree/dom0less-build.c |   2 +-
>  xen/common/device-tree/domain-build.c   |   2 +-
>  xen/common/device-tree/kernel.c         |   2 +-
>  xen/include/xen/bootfdt.h               | 206 -----------------------
>  xen/include/xen/bootinfo.h              | 212 ++++++++++++++++++++++++
>  xen/include/xen/device_tree.h           |   2 +-
>  xen/include/xen/fdt-domain-build.h      |   2 +-
>  xen/include/xen/fdt-kernel.h            |   2 +-
>  14 files changed, 224 insertions(+), 215 deletions(-)
>  create mode 100644 xen/include/xen/bootinfo.h
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 11cc03e5db..c53da76682 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/init.h>
> +#include <xen/bootinfo.h>
>  #include <xen/compile.h>
>  #include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
> index 9c50479c63..77f82757bb 100644
> --- a/xen/arch/arm/mmu/mm.c
> +++ b/xen/arch/arm/mmu/mm.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  
> +#include <xen/bootinfo.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/macros.h>
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index d3ece9f132..040db73d00 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/bug.h>
>  #include <xen/compiler.h>
>  #include <xen/init.h>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 4e416f6e44..0a2d0dc1eb 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -2,7 +2,7 @@
>  
>  #include <xen/acpi.h>
>  #include <xen/bug.h>
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>  #include <xen/compile.h>
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 529c91e603..fb4ac06390 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <xen/bootfdt.h>

Is this kept on purpose?


> +#include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/efi.h>
>  #include <xen/init.h>


