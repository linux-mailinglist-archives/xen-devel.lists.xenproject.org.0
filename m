Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A9AD9958
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 03:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015154.1393088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFNT-00081G-K4; Sat, 14 Jun 2025 01:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015154.1393088; Sat, 14 Jun 2025 01:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFNT-0007zW-H8; Sat, 14 Jun 2025 01:08:11 +0000
Received: by outflank-mailman (input) for mailman id 1015154;
 Sat, 14 Jun 2025 01:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFNS-0007zQ-12
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 01:08:10 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08639518-48bc-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 03:08:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9ED8EA50EA3;
 Sat, 14 Jun 2025 01:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF55C4CEE3;
 Sat, 14 Jun 2025 01:08:05 +0000 (UTC)
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
X-Inumbo-ID: 08639518-48bc-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749863287;
	bh=Skl9pqy7QFESPUsAsswkCSbtRvw/ygIJOK1oSXYKeiM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BtF2OmyIqElhACL6I9MfTRm2QPK6+x+fcLA4uG9ZblN5DRdkYjRubOUlUseYf+5L3
	 GCTVWqPmerhd9Hpg0lIlYL6dRN/2oei5LpTeWJv0sqBsqkfiWRFfS5/YDSjPi+Dptq
	 4W/XZqQE0VfuicfTlbzi2pOqNP4bkcoO4RJks4Zu5oSKpF+zcRwYWbEknqP+0sYpSU
	 DMOaDx5eucXNxj5LDMr6WQ4ZcboPAjeN/IlTP97vFo5yyans9u8vzWQddFfRCyEXBL
	 OV+Vy3zV7g827KPzzRrgfsJQ5g0O0d/zem/xKdwIjK2sf7eIH9Nqnb1Vq7XcmVkKJc
	 eYMcXAeCt+ZQg==
Date: Fri, 13 Jun 2025 18:08:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 07/14] x86: Replace arch-specific boot_domain common
 one bootdomain
In-Reply-To: <20250613151612.754222-8-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131806540.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-8-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> Add the single arch-specific field in an "arch" subfield defined in
> asm/bootfdt.h.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> ---
> v3:
>   * Avoid the bootdomain/boot_domain renames.
> ---
>  xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
>  xen/arch/x86/include/asm/bootfdt.h     |  6 +++++
>  xen/arch/x86/include/asm/bootinfo.h    |  1 -
>  xen/arch/x86/setup.c                   | 12 ++++++----
>  xen/include/xen/bootfdt.h              |  4 ++++
>  5 files changed, 17 insertions(+), 39 deletions(-)
>  delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
> 
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
> deleted file mode 100644
> index d7c6042e25..0000000000
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright (c) 2024 Apertus Solutions, LLC
> - * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> - * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> - */
> -
> -#ifndef __XEN_X86_BOOTDOMAIN_H__
> -#define __XEN_X86_BOOTDOMAIN_H__
> -
> -#include <public/xen.h>
> -
> -struct boot_domain {
> -    domid_t domid;
> -
> -    struct boot_module *kernel;
> -    struct boot_module *module;
> -    const char *cmdline;
> -
> -    struct domain *d;
> -};
> -
> -#endif
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * tab-width: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
> index a4c4bf30b9..c21dbe961b 100644
> --- a/xen/arch/x86/include/asm/bootfdt.h
> +++ b/xen/arch/x86/include/asm/bootfdt.h
> @@ -3,6 +3,12 @@
>  #define X86_BOOTFDT_H
>  
>  #include <xen/types.h>
> +#include <public/xen.h>
> +
> +struct arch_boot_domain
> +{
> +    domid_t domid;
> +};

With the understanding from your previous reply that it is best not to
use d->domain_id:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  struct arch_boot_module
>  {


