Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FDE843F53
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674010.1048659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9c3-0002ox-Ey; Wed, 31 Jan 2024 12:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674010.1048659; Wed, 31 Jan 2024 12:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9c3-0002mz-CR; Wed, 31 Jan 2024 12:22:43 +0000
Received: by outflank-mailman (input) for mailman id 674010;
 Wed, 31 Jan 2024 12:22:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rV9c2-0002mr-KJ
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:22:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rV9bw-0004Xf-SV; Wed, 31 Jan 2024 12:22:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rV9bw-00040K-L0; Wed, 31 Jan 2024 12:22:36 +0000
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
	bh=2X3H3P5KppJ9rWeCU4MFgLVbFjBgS7ty9gGS7a8EL/E=; b=T1H646wJ6jEQAPh84DvFOyx3KX
	jNWGvEezGucPcva94yP019VJrWxLA35OLPf01anK/umR0PmNUHuLC9nUzpk/pSQACeFRAqDQnPE31
	X89gogZWgMseOjIjsvGfE1AA63IJfWmRweln8JobG4eTYmlxLn0vpCLzuMekWoExTDBI=;
Message-ID: <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
Date: Wed, 31 Jan 2024 12:22:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
To: John Ernberg <john.ernberg@actia.se>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240131114952.305805-2-john.ernberg@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/01/2024 11:50, John Ernberg wrote:
> When using Linux for dom0 there are a bunch of drivers that need to do SMC
> SIP calls into the PSCI provider to enable certain hardware bits like the
> watchdog.

Do you know which protocol this is under the hood. Is this SCMI?

> 
> Provide a basic platform glue that implements the needed SMC forwarding.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> ---
> NOTE: This is based on code found in NXP Xen tree located here:
> https://github.com/nxp-imx/imx-xen/blob/lf-5.10.y_4.13/xen/arch/arm/platforms/imx8qm.c

Anything after --- will be removed while applied to the three. I think 
this NOTE should be written down in the commit message.

You also possibly want a signed-off-by from Peng as this is his code.

> 
>   xen/arch/arm/platforms/Makefile |  1 +
>   xen/arch/arm/platforms/imx8qm.c | 65 +++++++++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
>   create mode 100644 xen/arch/arm/platforms/imx8qm.c
> 
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..bec6e55d1f 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>   obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>   obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>   obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8qm.c
> new file mode 100644
> index 0000000000..a9cd9c3615
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/platforms/imx8qm.c
> + *
> + * i.MX 8QM setup
> + *
> + * Copyright (c) 2016 Freescale Inc.
> + * Copyright 2018-2019 NXP
> + *
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + */
> +
> +#include <asm/platform.h>
> +#include <asm/smccc.h>
> +
> +static const char * const imx8qm_dt_compat[] __initconst =
> +{
> +    "fsl,imx8qm",
> +    "fsl,imx8qxp",
> +    NULL
> +};
> +
> +static bool imx8qm_smc(struct cpu_user_regs *regs)
> +{

Your implementation below will not only forward SMC for dom0 but also 
for any non-trusted domains. Have you investigated that all the SIP 
calls are safe to be called by anyone?

But even if we restrict to dom0, have you checked that none of the SMCs 
use buffers?

Rather than providing a blanket forward, to me it sounds more like you 
want to provide an allowlist of the SMCs. This is more futureproof and 
avoid the risk to expose unsafe SMCs to any domain.

For an example, you can have a look at the EEMI mediator for Xilinx.

Cheers,

-- 
Julien Grall

