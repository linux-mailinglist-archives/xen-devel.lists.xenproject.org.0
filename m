Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD369F1852
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 23:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857222.1269620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMDof-0008DN-Cr; Fri, 13 Dec 2024 22:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857222.1269620; Fri, 13 Dec 2024 22:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMDof-0008Bo-A9; Fri, 13 Dec 2024 22:07:21 +0000
Received: by outflank-mailman (input) for mailman id 857222;
 Fri, 13 Dec 2024 22:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ2+=TG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tMDod-0007e3-Hi
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 22:07:19 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc2396a-b99e-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 23:07:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 11313A42E09;
 Fri, 13 Dec 2024 22:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C66C4CED0;
 Fri, 13 Dec 2024 22:07:15 +0000 (UTC)
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
X-Inumbo-ID: 9dc2396a-b99e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734127636;
	bh=vdpib4y+gL1a3865p0IRl3l7ICW/lrQh+lZjgFg2pS4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IZn4pKD1e00zkZZ7QoWlmC9dSGAvnWxTCKDhOCFEpYuHCM2P9rUNRdPPkDIxDjhno
	 kLHfPlEWJFq1V8kf2mnCjVedBSTN73CFLbrjtDvAz3T+7LZqISotOLDorvwm74ZarE
	 iA7OfEHp8fsj8dvxauQpYy/Y5ZinjpGAGevN7ZNj4JSi/V6NJuqfemp1MB3aOexcne
	 MWA4/nUni2O3IEHlX819lNsc7X63gsAsa+F+jhjJuIiD5KPby42bG1mAP8RJffUXCF
	 a4eeeLppNTFj5K2ZVbb92RAs6FFFZS7dPQ5pD+rnS8COOF0ga6sfhc6LhqsZSf/o4O
	 fh0z1FVVptQwg==
Date: Fri, 13 Dec 2024 14:07:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: platform: Add support for R-Car Gen4
In-Reply-To: <bfa54a4a5dc8c3f985e8c6eed2fbbe266aa71385.1734096752.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2412131407070.463523@ubuntu-linux-20-04-desktop>
References: <cover.1734096752.git.mykyta_poturai@epam.com> <bfa54a4a5dc8c3f985e8c6eed2fbbe266aa71385.1734096752.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Dec 2024, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add Rcar Gen4 platform choice to Kconfig to select all required
> drivers automatically.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/platforms/Kconfig | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 02322c259c..8785c168bd 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -29,6 +29,15 @@ config RCAR3
>  	help
>  	Enable all the required drivers for Renesas RCar3
>  
> +config RCAR4
> +	bool "Renesas RCar4 support"
> +	depends on ARM_64
> +	select HAS_SCIF
> +	select HAS_ITS
> +	select IPMMU_VMSA
> +	help
> +	Enable all the required drivers for Renesas RCar4
> +
>  config MPSOC
>  	bool "Xilinx Ultrascale+ MPSoC support"
>  	depends on ARM_64
> @@ -55,4 +64,3 @@ config ALL32_PLAT
>  config MPSOC_PLATFORM
>  	bool
>  	default (ALL64_PLAT || MPSOC)
> -
> -- 
> 2.34.1
> 

