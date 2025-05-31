Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04592AC98B0
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001754.1381874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLARO-00087F-Fu; Sat, 31 May 2025 00:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001754.1381874; Sat, 31 May 2025 00:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLARO-000854-DL; Sat, 31 May 2025 00:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1001754;
 Sat, 31 May 2025 00:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLARN-00084y-4b
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:51:13 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58994576-3db9-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:51:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ACBAEA4FD0F;
 Sat, 31 May 2025 00:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54685C4CEEB;
 Sat, 31 May 2025 00:51:09 +0000 (UTC)
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
X-Inumbo-ID: 58994576-3db9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748652670;
	bh=ThxAtKbtqDIjvDGzTLRBEX/C1do+gn6SW4S8jOtXEiI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mLq+Y4G4mor9Ckij+8db7qyjtYVh6m2a10IsKYLydLQE6wFI4nLbAy3Tkr/IdRh8f
	 1C0499Nnh3fLWJhb5Qz6gYpyZap0xRYTOau2yzJA4HT/eqrPf2huAo6zYUPmFPc6q2
	 7NG46MRuZENHW20hpCvxlOnZmqMrBe4TiS8XBGQmHFXRdGUdevzRcHOVjbfnCX3Gtr
	 yCUGTdGIH3bzpHieR8FDw2zkG35Wp5ZYsPLfbREaM4+SzA6fRRGnih+8QOU9ezuvuB
	 mj3+Lfn/hZBKou1lZW7HPTigBCw+oXHChu1NJM5oMxLn4POilyQ8DRnr7gRX+QGbuf
	 S646qSeVI1HoA==
Date: Fri, 30 May 2025 17:51:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 05/19] arm: Remove dependencies with membank(s) definitions
 from setup.h
In-Reply-To: <20250530120242.39398-6-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301748170.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-6-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-424954523-1748652669=:1147082"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-424954523-1748652669=:1147082
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> ... as they can be forward-declared changing arrays for pointers in the function
> declarations.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/arch/arm/include/asm/setup.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 6cf272c160..0f9e531a34 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -3,7 +3,6 @@
>  
>  #include <public/version.h>
>  #include <asm/p2m.h>
> -#include <xen/bootfdt.h>
>  #include <xen/device_tree.h>

This change breaks the build on ARM:

  CC      xsm/xsm_policy.o
xsm/xsm_policy.c: In function ‘xsm_dt_policy_init’:
xsm/xsm_policy.c:71:30: error: implicit declaration of function ‘boot_module_find_by_kind’ [-Werror=implicit-function-declaration]
   71 |     struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~
xsm/xsm_policy.c:71:30: error: nested extern declaration of ‘boot_module_find_by_kind’ [-Werror=nested-externs]
xsm/xsm_policy.c:71:55: error: ‘BOOTMOD_XSM’ undeclared (first use in this function)
   71 |     struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
      |                                                       ^~~~~~~~~~~
xsm/xsm_policy.c:71:55: note: each undeclared identifier is reported only once for each function it appears in
xsm/xsm_policy.c:74:22: error: dereferencing pointer to incomplete type ‘struct bootmodule’
   74 |     if ( !mod || !mod->size )
      |                      ^~
cc1: all warnings being treated as errors
make[2]: *** [Rules.mk:249: xsm/xsm_policy.o] Error 1
make[1]: *** [build.mk:72: xsm] Error 2
make: *** [Makefile:619: xen] Error 2

The rest looks OK


>  #if defined(CONFIG_MMU)
> @@ -14,6 +13,9 @@
>  
>  #define MAX_FDT_SIZE SZ_2M
>  
> +struct membank;
> +struct membanks;
> +
>  struct map_range_data
>  {
>      struct domain *d;
> @@ -32,13 +34,13 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>  size_t estimate_efi_size(unsigned int mem_nr_banks);
>  
>  void acpi_create_efi_system_table(struct domain *d,
> -                                  struct membank tbl_add[]);
> +                                  struct membank *tbl_add);
>  
>  void acpi_create_efi_mmap_table(struct domain *d,
>                                  const struct membanks *mem,
> -                                struct membank tbl_add[]);
> +                                struct membank *tbl_add);
>  
> -int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
> +int acpi_make_efi_nodes(void *fdt, struct membank *tbl_add);
>  
>  void create_dom0(void);
>  
> -- 
> 2.43.0
> 
--8323329-424954523-1748652669=:1147082--

