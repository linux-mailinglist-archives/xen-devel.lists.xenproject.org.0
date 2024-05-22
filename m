Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B548CB83C
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727166.1131584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aiF-0004vD-BJ; Wed, 22 May 2024 01:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727166.1131584; Wed, 22 May 2024 01:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aiF-0004sl-7m; Wed, 22 May 2024 01:24:15 +0000
Received: by outflank-mailman (input) for mailman id 727166;
 Wed, 22 May 2024 01:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujjH=MZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9aiD-0004sf-Qe
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:24:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcca2845-17d9-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 03:24:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 03E96CE12AE;
 Wed, 22 May 2024 01:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95240C2BD11;
 Wed, 22 May 2024 01:24:02 +0000 (UTC)
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
X-Inumbo-ID: fcca2845-17d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716341044;
	bh=AT/tYDDNkLHfc9e7JNd+ZKDqKmkYDThuOaWKNlBw/a4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ELi8m9r1lumX00sDOH5OIPe0gQsBzrBlUDy5Hiq8q7EDZ2yJVn4NuO26UJnyMJOD8
	 nD0AfEqAEihcZe5f3UuniL1DYX/11EicxYtm+rKPZX8lPr0pfS4S+Jvqt1yPdhQyzm
	 npyhpp1vkx8/VUcNwZVAjPMm3dTtspzhwT2wyteiPhfxjoxus8NeYKyZ12bV4S9wgS
	 dUTOCunaoL3edH2oqnH7LxmdoVLwqprbNoZs4p+8S4TTLlcLx5IFkNiaPMw4ulJIt4
	 CkvIFMvyDYyKx+3Caiabq7uqAYyOEVVoDeMqnASjDUFRxNznyEfyZaBijkbLWimcyy
	 LbjzuniqYBxOg==
Date: Tue, 21 May 2024 18:24:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/3] xen/x86: Drop useless non-Kconfig CONFIG_*
 variables
In-Reply-To: <20240521171546.3650664-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405211823540.1052252@ubuntu-linux-20-04-desktop>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com> <20240521171546.3650664-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 May 2024, Andrew Cooper wrote:
> These are all either completely unused, or do nothing useful.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/x86/include/asm/config.h |  4 ----
>  xen/include/xen/acpi.h            |  9 ---------
>  xen/include/xen/watchdog.h        | 11 -----------
>  3 files changed, 24 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
> index ab7288cb3682..24b005ba1ff7 100644
> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -20,7 +20,6 @@
>  #define BITS_PER_XEN_ULONG BITS_PER_LONG
>  
>  #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS 1
> -#define CONFIG_DISCONTIGMEM 1
>  #define CONFIG_NUMA_EMU 1
>  
>  #define CONFIG_PAGEALLOC_MAX_ORDER (2 * PAGETABLE_ORDER)
> @@ -30,11 +29,8 @@
>  /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
>  #define CONFIG_X86_L1_CACHE_SHIFT 7
>  
> -#define CONFIG_ACPI_SRAT 1
>  #define CONFIG_ACPI_CSTATE 1
>  
> -#define CONFIG_WATCHDOG 1
> -
>  #define CONFIG_MULTIBOOT 1
>  
>  #define HZ 100
> diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
> index e78e7e785252..bc4818c9430a 100644
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -140,15 +140,6 @@ int get_cpu_id(u32 acpi_id);
>  unsigned int acpi_register_gsi (u32 gsi, int edge_level, int active_high_low);
>  int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
>  
> -/*
> - * This function undoes the effect of one call to acpi_register_gsi().
> - * If this matches the last registration, any IRQ resources for gsi
> - * are freed.
> - */
> -#ifdef CONFIG_ACPI_DEALLOCATE_IRQ
> -void acpi_unregister_gsi (u32 gsi);
> -#endif
> -
>  #ifdef	CONFIG_ACPI_CSTATE
>  /*
>   * max_cstate sets the highest legal C-state.
> diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
> index 86fde0884ae7..434fcbdd2b11 100644
> --- a/xen/include/xen/watchdog.h
> +++ b/xen/include/xen/watchdog.h
> @@ -9,8 +9,6 @@
>  
>  #include <xen/types.h>
>  
> -#ifdef CONFIG_WATCHDOG
> -
>  /* Try to set up a watchdog. */
>  int watchdog_setup(void);
>  
> @@ -23,13 +21,4 @@ void watchdog_disable(void);
>  /* Is the watchdog currently enabled. */
>  bool watchdog_enabled(void);
>  
> -#else
> -
> -#define watchdog_setup() ((void)0)
> -#define watchdog_enable() ((void)0)
> -#define watchdog_disable() ((void)0)
> -#define watchdog_enabled() ((void)0)
> -
> -#endif
> -
>  #endif /* __XEN_WATCHDOG_H__ */
> -- 
> 2.30.2
> 

