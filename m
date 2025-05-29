Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47547AC84F8
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 01:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000247.1380588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmaV-0007RU-Dy; Thu, 29 May 2025 23:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000247.1380588; Thu, 29 May 2025 23:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmaV-0007Q2-B9; Thu, 29 May 2025 23:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1000247;
 Thu, 29 May 2025 23:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKmaT-0007Pu-91
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 23:23:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d600d084-3ce3-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 01:22:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB1794ACCF;
 Thu, 29 May 2025 23:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622DAC4CEEB;
 Thu, 29 May 2025 23:22:47 +0000 (UTC)
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
X-Inumbo-ID: d600d084-3ce3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748560968;
	bh=ae/9YhRWjVTNXpnYDKCwWz8NiJ2GS09KOAWo/M7aoRU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mnG1KlCxNyWiaXzSHzULKuC+WyY07B6DrkvrbfvACsJXmtqU6bEjPexWzp9bkIhtf
	 UXRd5G4LHGhTaqix2dl0/FN0b2Mnx/Clqgu9B/ngqMTl3YeXtbEW+jvJutnwLC5psL
	 7xDuvJ64ayj8omPltVj8JAOXB6oScYSXiXAL+LCAkfn6Sz+mGyZlb0wfIFd4+BTYAY
	 LVO/niTh0bXdEQx15ypEuqoX3BsJN0idNBiXCibZp5pjEyrUNd4qcpp2H5PBKNZW+A
	 hTsb2l6fJCh+2TTg1nPb69SURT3d1+5hbftEhKSDnOfhN/crNhTzDGZCPn/2vvSvII
	 DQsQBxKbadBRg==
Date: Thu, 29 May 2025 16:22:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 03/20] xen/x86: remove "depends on
 !PV_SHIM_EXCLUSIVE"
In-Reply-To: <20250528091708.390767-4-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505291622390.135336@ubuntu-linux-20-04-desktop>
References: <20250528091708.390767-1-Penny.Zheng@amd.com> <20250528091708.390767-4-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 May 2025, Penny Zheng wrote:
> Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
> equivalent "if !...") in Kconfig file, since negative dependancy will badly
> affect allyesconfig. To make sure unchanging produced config file based
> on "pvshim_defconfig", we shall explicitly state according Kconfig is not set
> 
> Add "default y" for SHADOW_PAGING and TBOOT, otherwise we will have unset
> values when running make defconfig based on "x86_64_defconfig".
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 -> v3:
> - remove comment for PV_SHIM_EXCLUSIVE
> ---
> v3 -> v4:
> - explicitly state "CONFIG_xxx is not set" in "pvshim_defconfig"
> - Add "default y" for SHADOW_PAGING and TBOOT
> - refactor commit message
> ---
>  xen/arch/x86/Kconfig                  | 6 ++----
>  xen/arch/x86/configs/pvshim_defconfig | 5 +++++
>  xen/arch/x86/hvm/Kconfig              | 1 -
>  xen/drivers/video/Kconfig             | 4 ++--
>  4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 7afe879710..8c8e661d53 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -143,7 +143,7 @@ config XEN_IBT
>  
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
> -	default !PV_SHIM_EXCLUSIVE
> +	default y
>  	depends on PV || HVM
>  	help
>  
> @@ -175,7 +175,7 @@ config BIGMEM
>  config TBOOT
>  	bool "Xen tboot support (UNSUPPORTED)"
>  	depends on INTEL && UNSUPPORTED
> -	default !PV_SHIM_EXCLUSIVE
> +	default y
>  	select CRYPTO
>  	help
>  	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
> @@ -288,7 +288,6 @@ config PV_SHIM_EXCLUSIVE
>  
>  	  If unsure, say N.
>  
> -if !PV_SHIM_EXCLUSIVE
>  
>  config HYPERV_GUEST
>  	bool "Hyper-V Guest"
> @@ -298,7 +297,6 @@ config HYPERV_GUEST
>  
>  	  If unsure, say N.
>  
> -endif
>  
>  config REQUIRE_NX
>  	bool "Require NX (No eXecute) support"
> diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
> index 2ad27f898e..6f652e145e 100644
> --- a/xen/arch/x86/configs/pvshim_defconfig
> +++ b/xen/arch/x86/configs/pvshim_defconfig
> @@ -26,3 +26,8 @@ CONFIG_EXPERT=y
>  # CONFIG_INTEL_IOMMU is not set
>  # CONFIG_DEBUG is not set
>  # CONFIG_GDBSX is not set
> +# CONFIG_SHADOW_PAGING is not set
> +# CONFIG_TBOOT is not set
> +# HYPERV_HYPERV_GUEST is not set
> +# CONFIG_HVM is not set
> +# CONFIG_VGA is not set
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index 2def0f98e2..b903764bda 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -1,6 +1,5 @@
>  menuconfig HVM
>  	bool "HVM support"
> -	depends on !PV_SHIM_EXCLUSIVE
>  	default !PV_SHIM
>  	select COMPAT
>  	select IOREQ_SERVER
> diff --git a/xen/drivers/video/Kconfig b/xen/drivers/video/Kconfig
> index 245030beea..66ee1e7c9c 100644
> --- a/xen/drivers/video/Kconfig
> +++ b/xen/drivers/video/Kconfig
> @@ -3,10 +3,10 @@ config VIDEO
>  	bool
>  
>  config VGA
> -	bool "VGA support" if !PV_SHIM_EXCLUSIVE
> +	bool "VGA support"
>  	select VIDEO
>  	depends on X86
> -	default y if !PV_SHIM_EXCLUSIVE
> +	default y
>  	help
>  	  Enable VGA output for the Xen hypervisor.
>  
> -- 
> 2.34.1
> 

