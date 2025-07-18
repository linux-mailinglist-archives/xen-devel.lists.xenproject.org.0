Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D1B098C3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 02:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047663.1418062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucYfR-00033h-IS; Fri, 18 Jul 2025 00:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047663.1418062; Fri, 18 Jul 2025 00:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucYfR-00031w-FH; Fri, 18 Jul 2025 00:09:37 +0000
Received: by outflank-mailman (input) for mailman id 1047663;
 Fri, 18 Jul 2025 00:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucYfQ-00031q-DT
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 00:09:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7689447e-636b-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 02:09:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9693F5C6D52;
 Fri, 18 Jul 2025 00:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4205C4CEEB;
 Fri, 18 Jul 2025 00:09:22 +0000 (UTC)
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
X-Inumbo-ID: 7689447e-636b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752797364;
	bh=UxAk1Q9vq0X2Oq3oAs44sWpYl9Bknm8/WSsa1fcC0rI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XW5iSv7Ydhu2Zg6/FtXpUttAas6IAAvbfj0FVAjQLMwJnySTt7+Qish7PTK9wCnwD
	 vCp9ETvQ8LR83MorMOqQoxNOClE0QqVA1EW4Tb+3xqexd7azxQBKLRMdWCwesYSDBD
	 pDp01o/tnnW+de/MBubrkciQonAyHaicKUNYtVWrhvdihpOfb6YDg7y1hxfP4KDQAb
	 BsAV534hL8MFmfOD8nk3zP0DM5Ts4OTvcRn2ogFTEUu8M3Ba4FZfUcv+DQ694ECumt
	 Q1sUX5VUGmznlDRIp1sFVEqfea+mq57s3EVeHGeoZAet7pz5WA0y9CdsB2RqoE7nl+
	 PRbqNuYB5OvMA==
Date: Thu, 17 Jul 2025 17:09:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    alejandro.garciavallejo@amd.com
Subject: Re: [PATCH v7 03/11] x86: Replace arch-specific boot_domain with
 the common one
In-Reply-To: <20250715161108.141126-4-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171707170.15546@ubuntu-linux-20-04-desktop>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com> <20250715161108.141126-4-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Jan,

It looks like this patch is the only one missing an Ack. (Aside from
patch #11).

Cheers,

Stefano

On Tue, 15 Jul 2025, Alejandro Vallejo wrote:
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/arch/x86/hvm/dom0_build.c          |  2 +-
>  xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
>  xen/arch/x86/include/asm/bootinfo.h    |  1 -
>  xen/arch/x86/pv/dom0_build.c           |  2 +-
>  xen/arch/x86/setup.c                   |  2 +-
>  xen/include/xen/bootfdt.h              |  4 ++++
>  6 files changed, 7 insertions(+), 37 deletions(-)
>  delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 2bb8ef355c..8d2734f2b5 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -648,7 +648,7 @@ static int __init pvh_load_kernel(
>  {
>      struct domain *d = bd->d;
>      struct boot_module *image = bd->kernel;
> -    struct boot_module *initrd = bd->module;
> +    struct boot_module *initrd = bd->initrd;
>      void *image_base = bootstrap_map_bm(image);
>      void *image_start = image_base + image->arch.headroom;
>      unsigned long image_len = image->size;
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
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index d33b100e04..4f2cc5906e 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -12,7 +12,6 @@
>  #include <xen/init.h>
>  #include <xen/multiboot.h>
>  #include <xen/types.h>
> -#include <asm/boot-domain.h>
>  
>  /* Max number of boot modules a bootloader can provide in addition to Xen */
>  #define MAX_NR_BOOTMODS 63
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index a4b5362357..c37bea9454 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>      struct vcpu *v = d->vcpu[0];
>  
>      struct boot_module *image = bd->kernel;
> -    struct boot_module *initrd = bd->module;
> +    struct boot_module *initrd = bd->initrd;
>      void *image_base;
>      unsigned long image_len;
>      void *image_start;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 7e70b46332..7380f1053f 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2171,7 +2171,7 @@ void asmlinkage __init noreturn __start_xen(void)
>      if ( initrdidx < MAX_NR_BOOTMODS )
>      {
>          bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
> -        bi->domains[0].module = &bi->mods[initrdidx];
> +        bi->domains[0].initrd = &bi->mods[initrdidx];
>          if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
>              printk(XENLOG_WARNING
>                     "Multiple initrd candidates, picking module #%u\n",
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 28f7d18262..ac2a79b59b 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -103,6 +103,10 @@ struct shared_meminfo {
>  struct boot_domain {
>      struct domain *d;
>  
> +#ifdef CONFIG_X86
> +    domid_t domid;
> +#endif
> +
>      struct boot_module *kernel;
>      struct boot_module *initrd;
>  
> -- 
> 2.43.0
> 

