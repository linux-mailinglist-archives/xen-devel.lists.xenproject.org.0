Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26CC98B029
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 00:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807646.1219220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svP7P-0005LQ-39; Mon, 30 Sep 2024 22:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807646.1219220; Mon, 30 Sep 2024 22:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svP7P-0005Jq-0U; Mon, 30 Sep 2024 22:43:51 +0000
Received: by outflank-mailman (input) for mailman id 807646;
 Mon, 30 Sep 2024 22:43:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJxO=Q4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svP7N-0005Ji-5A
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 22:43:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 739415b4-7f7d-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 00:43:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 525615C481C;
 Mon, 30 Sep 2024 22:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432B4C4CEC7;
 Mon, 30 Sep 2024 22:43:42 +0000 (UTC)
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
X-Inumbo-ID: 739415b4-7f7d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727736223;
	bh=gK8QEo9vI8qzXCISsGZX4YAbNHw/T1aoiD/7CehbI7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SStLU+lVnApg8yqu/G+GFrB9pv4t/9NTmeCz8PAHqHot/IJLNB6Qey/56Hd/2AcZl
	 FWkvLcq+3+Go2SMsXRPm9xHu9wTOTM60YAQCA8JAzRmueopk0XFVefYTWkuOyNcbr5
	 TmTd3nXlBgk1FJKbefJNyfWL35efBSTB97tjWF6F6FIdYB0Aiun/8BrMAekX1wBHHL
	 vz5ecOM4GxS/A/MpZL65nFj8mQCm/oHV+dskc7Ansvnbrpyh3sG+l5AE4Bg/epQ2QT
	 yVbUjGug6OQUnn58ZqPsZQhz/BvK4Otc3ZE1CmEXOiHGfntTsSdD/G0ily4M9375kv
	 t/OukLVR3WuRg==
Date: Mon, 30 Sep 2024 15:43:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, S32@nxp.com, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, s32@nxp.com
Subject: Re: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
In-Reply-To: <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2409301543290.451631@ubuntu-linux-20-04-desktop>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com> <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).
> 
> S32CC platforms use the NXP LINFlexD UART driver for
> console by default, and rely on Dom0 having access to
> SCMI services for system-level resources from firmware
> at EL3.
> 
> Platform-related quirks will be addressed in following
> commits.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/platforms/Kconfig  | 11 +++++++++++
>  xen/arch/arm/platforms/Makefile |  1 +
>  xen/arch/arm/platforms/s32cc.c  | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 xen/arch/arm/platforms/s32cc.c
> 
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 76f7e76b1b..9837cba475 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -37,6 +37,14 @@ config MPSOC
>  	help
>  	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>  
> +config S32CC
> +	bool "NXP S32CC platforms support"
> +	depends on ARM_64
> +	select HAS_LINFLEX
> +	select SCMI_SMC
> +	help
> +	Enable all the required drivers for NXP S32CC platforms
> +
>  config NO_PLAT
>  	bool "No Platforms"
>  	help
> @@ -56,3 +64,6 @@ config MPSOC_PLATFORM
>  	bool
>  	default (ALL64_PLAT || MPSOC)
>  
> +config S32CC_PLATFORM
> +	bool
> +	default (ALL64_PLAT || S32CC)
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index bec6e55d1f..2c304b964d 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>  obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>  obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
>  obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
> +obj-$(CONFIG_S32CC_PLATFORM)  += s32cc.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/s32cc.c b/xen/arch/arm/platforms/s32cc.c
> new file mode 100644
> index 0000000000..f99a2d56f6
> --- /dev/null
> +++ b/xen/arch/arm/platforms/s32cc.c
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/platforms/s32cc.c
> + *
> + * NXP S32CC Platform-specific settings
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2021-2024 NXP
> + */
> +
> +#include <asm/platform.h>
> +
> +static const char * const s32cc_dt_compat[] __initconst =
> +{
> +    "nxp,s32g2",
> +    "nxp,s32g3",
> +    "nxp,s32r45",
> +    NULL
> +};
> +
> +PLATFORM_START(s32cc, "NXP S32CC")
> +    .compatible = s32cc_dt_compat,
> +PLATFORM_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> -- 
> 2.45.2
> 

