Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CEAD996C
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 03:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015184.1393128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFe7-00042R-Jt; Sat, 14 Jun 2025 01:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015184.1393128; Sat, 14 Jun 2025 01:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFe7-00040u-HI; Sat, 14 Jun 2025 01:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1015184;
 Sat, 14 Jun 2025 01:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFe6-0003Vr-2d
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 01:25:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb9425b-48be-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 03:25:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6630CA50F91;
 Sat, 14 Jun 2025 01:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8522C4CEE3;
 Sat, 14 Jun 2025 01:25:16 +0000 (UTC)
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
X-Inumbo-ID: 6eb9425b-48be-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749864318;
	bh=L8EhTOB7UxYfD4FL4DSbA53OV7AVMq2H6kN5vh0F/U0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PEAwlUrF6Mn9IApkuimshR/7wzzYKYF8S141V5Y9TBwXcBlVjy1zBkTyx3qgStMR3
	 rbY3CdPYuvfq6Cpmhu87FM18PKvouS/Uo8LoHn+54uleecuoMJ/i5usH6+mw4VAOS2
	 g1hHkQqzJ5RBZT4XKmNFcb9IHsaIWn2RSVAxrllZ9NRIUhyMJAIdLHIpePhuc9baTP
	 Dbnc+7+gu5cRW29bC6izSw2+RlzSD/nZafqT0wcWj4oNMCoSVj6oAjPGsa5DzAtKYj
	 GSVD4CkTaccZtfoOBRUcAykxaaQMhxZF6TizY98j2nMECmVWnc3ca6Q6ZnjdPZsE/W
	 BnOzEGTYHfRFg==
Date: Fri, 13 Jun 2025 18:25:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 13/14] xen/dt: Allow CONFIG_DOM0LESS_BOOT to include
 device-tree/
In-Reply-To: <20250613151612.754222-14-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131825090.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-14-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> ... without CONFIG_HAS_DEVICE_TREE
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/Kconfig              | 1 +
>  xen/common/Makefile             | 2 +-
>  xen/common/device-tree/Makefile | 8 ++++----
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 867710134a..2baa4221fd 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -14,6 +14,7 @@ config CORE_PARKING
>  
>  config DOM0LESS_BOOT
>  	bool "Dom0less boot support" if EXPERT
> +	select LIBFDT
>  	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
>  	default y
>  	help
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 98f0873056..2717c81f9c 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -8,7 +8,7 @@ obj-y += cpu.o
>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
> -obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
> +obj-$(firstword $(CONFIG_HAS_DEVICE_TREE) $(CONFIG_DOM0LESS_BOOT)) += device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
>  obj-y += event_2l.o
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 8abc069c4b..cc56f42df9 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,11 +1,11 @@
>  obj-y += bootfdt.init.o
> -obj-y += bootinfo-fdt.init.o
> -obj-y += bootinfo.init.o
> -obj-y += device-tree.o
> +obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo-fdt.init.o
> +obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo.init.o
> +obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>  obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> -obj-y += intc.o
> +obj-$(CONFIG_HAS_DEVICE_TREE) += intc.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
> -- 
> 2.43.0
> 

