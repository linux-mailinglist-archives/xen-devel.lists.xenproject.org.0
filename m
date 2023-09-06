Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB017932E0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595923.929612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgLP-0007vN-Ht; Wed, 06 Sep 2023 00:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595923.929612; Wed, 06 Sep 2023 00:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgLP-0007tH-En; Wed, 06 Sep 2023 00:24:31 +0000
Received: by outflank-mailman (input) for mailman id 595923;
 Wed, 06 Sep 2023 00:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgLO-0007t9-0s
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:24:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcd6c50c-4c4b-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 02:24:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AEED60EE9;
 Wed,  6 Sep 2023 00:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBAFC433C9;
 Wed,  6 Sep 2023 00:24:24 +0000 (UTC)
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
X-Inumbo-ID: bcd6c50c-4c4b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693959866;
	bh=0nPjol8i5HwWlJY59KqUNswONKRiALt7aET4yUbGTeI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SOhaDFL4XeEIdYyiLX08A5J0a91cFwjQYp/CF1Q3cJghD+a/+LYK3uNBt67/tzKZk
	 wS8tD0EJUcpPU3YoQ0ZEF0yu476oTlc3NLv8mSetkS7djP4tIq3fhvuSW1LIiy8yT+
	 sbz7Fh9jqhWTwagpvxN7KBQI4dongEP/P37Z/m9bioakRjTctlYq7EdaKA2A51nD94
	 Cad/PZanEEuAD+kL/DOTOrcBP1rfcmy040JPPQx8U/5NnzcVxB0MmTzQi5U2nt+/pH
	 +/pL4W5tmcWeT30dG9KzsLqU7BZoDpamNqymOKXb51B1JEyMoDw3KODW0yM86kyW5r
	 PqL5Am/r8f6Ug==
Date: Tue, 5 Sep 2023 17:24:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, michal.orzel@amd.com, 
    sstabellini@kernel.org, Henry Wang <Henry.Wang@arm.com>, 
    Community Manager <community.manager@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v11 05/20] xen/arm: Add CONFIG_OVERLAY_DTB
In-Reply-To: <20230901045947.32351-6-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051724110.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-6-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Vikram Garhwal wrote:
> Introduce a config option where the user can enable support for adding/removing
> device tree nodes using a device tree binary overlay.
> 
> Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
> Arm.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Acked-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> Changes from v9:
>     Fix style.
> Changes from v7:
>     Add this feature as "experimental support" in CHANGELOG.md
> ---
> ---
>  CHANGELOG.md         | 2 ++
>  SUPPORT.md           | 6 ++++++
>  xen/arch/arm/Kconfig | 5 +++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 2516526589..24636b8eaf 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -27,6 +27,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On Arm, add suport for Firmware Framework for Arm A-profile (FF-A) Mediator
>     (Tech Preview)
>   - Add Intel Hardware P-States (HWP) cpufreq driver.
> + - On Arm, experimental support for dynamic addition/removal of Xen device tree
> +   nodes using a device tree overlay binary (.dtbo).
>  
>  ### Removed
>   - On x86, the "pku" command line option has been removed.  It has never
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6ce0ec29b0..3461f5cf2f 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -855,6 +855,12 @@ xen/arch/arm/tee/ffa.c for limitations.
>  
>      Status: Supported
>  
> +### Device Tree Overlays
> +
> +Add/Remove device tree nodes using a device tree overlay binary (.dtbo).
> +
> +    Status, ARM: Experimental
> +
>  ### ARM: Guest ACPI support
>  
>      Status: Supported
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 57bd1d01d7..650aca99ac 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -92,6 +92,11 @@ config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
>  
> +config OVERLAY_DTB
> +	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +	help
> +	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
> +
>  config HVM
>          def_bool y
>  
> -- 
> 2.17.1
> 

