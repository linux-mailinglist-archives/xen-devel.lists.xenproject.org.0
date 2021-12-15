Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDA475553
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 10:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247292.426395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQl6-0006Ve-Dm; Wed, 15 Dec 2021 09:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247292.426395; Wed, 15 Dec 2021 09:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQl6-0006Th-AW; Wed, 15 Dec 2021 09:39:36 +0000
Received: by outflank-mailman (input) for mailman id 247292;
 Wed, 15 Dec 2021 09:39:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxQl5-0006Tb-41
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 09:39:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxQl4-0008S3-M1; Wed, 15 Dec 2021 09:39:34 +0000
Received: from [54.239.6.190] (helo=[10.85.97.145])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxQl4-0004Ou-Bn; Wed, 15 Dec 2021 09:39:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Tmal6A7zHVQ6hD/i5vkcSVJU+yGxCgWMiNpa62MSAaA=; b=g3ujYxtperrrR+0zH/FSRA/LuA
	mwhL5y53ifcZ2V6USur3LaQRfrtjjnMbq8KvrSJQi8kQd3VP6fe4iKAWkLOhES2HSkLiYVRZCo2C+
	YU9KC4h/EM9vxyDNy4X3EvPQ3sXrYBW8XXTYU2Uh32u6WISKN7WAYyUAu+XuDx9uHSPc=;
Message-ID: <35435638-a132-1b46-6add-b923f9f2785f@xen.org>
Date: Wed, 15 Dec 2021 09:39:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3 platform
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/12/2021 09:34, Oleksii Moisieiev wrote:
> Implementation includes platform-specific smc handler for rcar3 platform.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>   xen/arch/arm/platforms/Makefile |  1 +
>   xen/arch/arm/platforms/rcar3.c  | 46 +++++++++++++++++++++++++++++++++
>   2 files changed, 47 insertions(+)
>   create mode 100644 xen/arch/arm/platforms/rcar3.c
> 
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..b64c25de6c 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_ALL32_PLAT) += exynos5.o
>   obj-$(CONFIG_ALL32_PLAT) += midway.o
>   obj-$(CONFIG_ALL32_PLAT) += omap5.o
>   obj-$(CONFIG_ALL32_PLAT) += rcar2.o
> +obj-$(CONFIG_RCAR3) += rcar3.o
>   obj-$(CONFIG_ALL64_PLAT) += seattle.o
>   obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>   obj-$(CONFIG_ALL64_PLAT) += thunderx.o
> diff --git a/xen/arch/arm/platforms/rcar3.c b/xen/arch/arm/platforms/rcar3.c
> new file mode 100644
> index 0000000000..d740145c71
> --- /dev/null
> +++ b/xen/arch/arm/platforms/rcar3.c
> @@ -0,0 +1,46 @@
> +/*
> + * xen/arch/arm/platforms/rcar3.c
> + *
> + * Renesas R-Car Gen3 specific settings
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (C) 2021 EPAM Systems
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <asm/platform.h>
> +
> +static bool rcar3_smc(struct cpu_user_regs *regs)
> +{
> +    return false;
> +}

Looking at the rest of the series, this is going to be replaced in patch 
#2 with:

return sci_handle_call();

SCMI is not specific to RCAR3. So I would expect the function to be 
called from common code.

If it still needs some platform specific code, then I think it would be 
best to introduce rcar3.c at the end of the series. So we don't 
introduce a dummy platform and not hook the code in the middle of 
patch#2 which is meant to be generic.

I will have a proper review of the rest of the series in the new year.

Cheers,

-- 
Julien Grall

