Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9CE416949
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 03:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194710.346932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZoJ-0007LD-JT; Fri, 24 Sep 2021 01:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194710.346932; Fri, 24 Sep 2021 01:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZoJ-0007JK-GG; Fri, 24 Sep 2021 01:15:31 +0000
Received: by outflank-mailman (input) for mailman id 194710;
 Fri, 24 Sep 2021 01:15:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZoI-0007JE-66
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 01:15:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e798c5e4-1cd4-11ec-ba97-12813bfff9fa;
 Fri, 24 Sep 2021 01:15:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F08D761211;
 Fri, 24 Sep 2021 01:15:26 +0000 (UTC)
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
X-Inumbo-ID: e798c5e4-1cd4-11ec-ba97-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632446128;
	bh=xaEcrMGc5UTMc7WSH9XwcG1s3jyZgAFA8/pBaWvTTQQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tK2bUrVsCTSH/XVTANrXVVvy4oYYn/nCR6q8KNYImfS17eG+k2MNldNJjj/a5A1tA
	 RKiunT3WBaOSaf7exzZwAwFAnFzgvVD9fwelbwi4IKSo0E2dDz5xWACSAREGzEDTdV
	 BHYtF8rEwwUpwCYCG1+F3kcuqPGmJE2umL6Hn77C4wG/BDWU1B6af0M2OGwZVoDtFu
	 IyQAnKLTIzj7jzpV5jQe/SBSpnAGbHSX9W6Gtjvow1bj0oBiJYR1RrHuu3ESYnNZaS
	 +x4vlqujMS0DoChTTuYldLM+CTshWSKlU8mzUjiz/Cxw4piW4cYFFXsUMu3EwsZ5xm
	 GNOYnpMilkEaw==
Date: Thu, 23 Sep 2021 18:15:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
In-Reply-To: <20210923120236.3692135-21-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-21-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> Some architectures do not support EFI, but EFI API will be used
> in some common features. Instead of spreading #ifdef ARCH, we
> introduce this Kconfig option to give Xen the ability of stubing
> EFI API for non-EFI supported architectures.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/Kconfig  |  1 +
>  xen/arch/arm/Makefile |  2 +-
>  xen/arch/x86/Kconfig  |  1 +
>  xen/common/Kconfig    | 11 +++++++++++
>  xen/include/xen/efi.h |  4 ++++
>  5 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..865ad83a89 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_64
>  	def_bool y
>  	depends on !ARM_32
>  	select 64BIT
> +	select EFI
>  	select HAS_FAST_MULTIPLY
>  
>  config ARM
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b4..ae4efbf76e 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,6 @@
>  obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
> -obj-$(CONFIG_ARM_64) += efi/
> +obj-$(CONFIG_EFI) += efi/
>  obj-$(CONFIG_ACPI) += acpi/
>  ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 28d13b9705..b9ed187f6b 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -10,6 +10,7 @@ config X86
>  	select ALTERNATIVE_CALL
>  	select ARCH_SUPPORTS_INT128
>  	select CORE_PARKING
> +	select EFI
>  	select HAS_ALTERNATIVE
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 9ebb1c239b..f998746a1a 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -11,6 +11,16 @@ config COMPAT
>  config CORE_PARKING
>  	bool
>  
> +config EFI
> +	bool

Without the title the option is not user-selectable (or de-selectable).
So the help message below can never be seen.

Either add a title, e.g.:

bool "EFI support"

Or fully make the option a silent option by removing the help text.



> +	---help---
> +      This option provides support for runtime services provided
> +      by UEFI firmware (such as non-volatile variables, realtime
> +      clock, and platform reset). A UEFI stub is also provided to
> +      allow the kernel to be booted as an EFI application. This
> +      is only useful for kernels that may run on systems that have
> +      UEFI firmware.
> +
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y
> @@ -196,6 +206,7 @@ config KEXEC
>  
>  config EFI_SET_VIRTUAL_ADDRESS_MAP
>      bool "EFI: call SetVirtualAddressMap()" if EXPERT
> +    depends on EFI
>      ---help---
>        Call EFI SetVirtualAddressMap() runtime service to setup memory map for
>        further runtime services. According to UEFI spec, it isn't strictly
> diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
> index 94a7e547f9..661a48286a 100644
> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -25,6 +25,8 @@ extern struct efi efi;
>  
>  #ifndef __ASSEMBLY__
>  
> +#ifdef CONFIG_EFI
> +
>  union xenpf_efi_info;
>  union compat_pf_efi_info;
>  
> @@ -45,6 +47,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *);
>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
>  
> +#endif /* CONFIG_EFI*/
> +
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif /* __XEN_EFI_H__ */
> -- 
> 2.25.1
> 

