Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47849A7537E
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 00:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931284.1333662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJYw-0007oJ-Gy; Fri, 28 Mar 2025 23:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931284.1333662; Fri, 28 Mar 2025 23:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJYw-0007ln-E6; Fri, 28 Mar 2025 23:56:34 +0000
Received: by outflank-mailman (input) for mailman id 931284;
 Fri, 28 Mar 2025 23:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJYu-0007lh-V8
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 23:56:32 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 428ca21b-0c30-11f0-9ffa-bf95429c2676;
 Sat, 29 Mar 2025 00:56:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 20C4543797;
 Fri, 28 Mar 2025 23:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F962C4CEE4;
 Fri, 28 Mar 2025 23:56:23 +0000 (UTC)
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
X-Inumbo-ID: 428ca21b-0c30-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743206185;
	bh=CfkvG1rNf+GDssOZ+ONzQ7J60yE/yifgAvpEn4t2ueQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VTd1I4KMYhVraDx63bu6LDp5pI/F9y0BM88iypWvbt4HXUphR476OAl5dvSdRlUD0
	 dazZhLaqc5bYIRAebfmRacWCgsTQ3KJks+5Jopvp1I1tpJqoUFxRTVXVVfj6DJ4EKN
	 pBgeE014jmeKwGOBP7guq+N2PYdlX6VL40mC7vsqQLSHg4UaDUfIIQV2MEMK9E5pJq
	 mAJRChPAhnh31SMRhgf5AUD+pTEf25XNQZ9Ja7M3fw11SiOrG9ZQxPIR9HnC7LmCZ4
	 XKKfQd3me68Q5mVm1Qmd/vdJoFOQwSTANXvvNwX0wLgdr2xe8GV5FkY/JKDGW/imhQ
	 zOqoXJjXfdSqg==
Date: Fri, 28 Mar 2025 16:56:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/19] xen/x86: remove "depends on
 !PV_SHIM_EXCLUSIVE"
In-Reply-To: <20250326055053.3313146-2-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281655590.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-2-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> We intend to remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
> equivalent "if !...") in Kconfig file, since negative dependancy will badly
> affect allyesconfig.
> This commit is based on "x86: provide an inverted Kconfig control for
> shim-exclusive mode"[1]
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/arch/x86/Kconfig      | 6 ++----
>  xen/arch/x86/hvm/Kconfig  | 1 -
>  xen/drivers/video/Kconfig | 4 ++--
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 18efdb2e31..1e5df84b25 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -137,7 +137,6 @@ config XEN_IBT
>  
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
> -	default !PV_SHIM_EXCLUSIVE
>  	depends on PV || HVM
>  	help
>  
> @@ -169,7 +168,6 @@ config BIGMEM
>  config TBOOT
>  	bool "Xen tboot support (UNSUPPORTED)"
>  	depends on INTEL && UNSUPPORTED
> -	default !PV_SHIM_EXCLUSIVE
>  	select CRYPTO
>  	help
>  	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
> @@ -279,10 +277,11 @@ config PV_SHIM_EXCLUSIVE
>  	  Build Xen in a way which unconditionally assumes PV_SHIM mode.  This
>  	  option is only intended for use when building a dedicated PV Shim
>  	  firmware, and will not function correctly in other scenarios.
> +	  Features, like tboot, shadow page, VGA, HVM, Hyper-V Guest, etc,
> +	  are unavailable in shim-exclusive mode.

I don't know if we want to add these two lines or not. Either way:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  	  If unsure, say N.
>  
> -if !PV_SHIM_EXCLUSIVE
>  
>  config HYPERV_GUEST
>  	bool "Hyper-V Guest"
> @@ -292,7 +291,6 @@ config HYPERV_GUEST
>  
>  	  If unsure, say N.
>  
> -endif
>  
>  config REQUIRE_NX
>  	bool "Require NX (No eXecute) support"
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

