Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D08A8E50
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 23:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707776.1106026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxD61-0005nq-B6; Wed, 17 Apr 2024 21:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707776.1106026; Wed, 17 Apr 2024 21:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxD61-0005m1-7w; Wed, 17 Apr 2024 21:45:37 +0000
Received: by outflank-mailman (input) for mailman id 707776;
 Wed, 17 Apr 2024 21:45:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rxD60-0005lv-DY
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 21:45:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxD5z-00077o-QC; Wed, 17 Apr 2024 21:45:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxD5z-00083Y-KX; Wed, 17 Apr 2024 21:45:35 +0000
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
	bh=WBRW8q6xoVpfNHV6ssixGiqrpjb5AD0sKpo1xAXBdiA=; b=HlC9O2Dcd5OMbhKTnxaxKDQTOn
	njNKlB+q/1F+ZtBWW1LzRBuuSxZZqYU36klI4QihbNOeGkk/7AFduzSt6Se+yESh0HxJI9rzPCue0
	hrFrNtMTseQVeqUpe9r5AQoqDloDXMt4hvBINRAheqxT/Un38Y1E538WUIWnGlZTTIVA=;
Message-ID: <931b2c4c-cfd0-4b6b-82e0-32d7bde9d42e@xen.org>
Date: Wed, 17 Apr 2024 22:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm: platform: qcom: add basic support SA8155P SoC
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240329000822.3363568-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 29/03/2024 00:08, Volodymyr Babchuk wrote:
> Qualcomm SA8155P is the automotive variant of SM8150 aka Snapdragon
> 855.
> 
> This patch adds very basic support for the platform. We need to handle
> Qualcomm-specific SMC to workaround quirk in the QCOM SCM driver in
> the Linux kernel. Basically the driver tries multiple different SMCs
> to determine which calling convention is supported by a SoC. If all
> calls fail it decides that the SoC uses "legacy SMC" and tries to
> communicate with SCM by issuing SMC with funcid = 1. Problem is that
> Xen has own understanding on how such SMC should be handled. It
> interprets this SMC as legacy PSCI_cpu_off and happily turns of Linux
> boot CPU.
> 
> To workaround this, we pretend that we support
> QCOM_SCM_INFO_IS_CALL_AVAIL, this will make the driver use the latest
> calling convention. All subsequent calls will fail anyways and the
> driver will terminate self gracefully. This is not a big deal, because
> right now (with Linux 6.8) even on baremetal setup the driver fails
> anyways, because it does not know how to work with this SoC.

Is there any patches that are not yet merged and/or on a Qualcomm 
specific tree? I just want to make sure that we have a code that will 
still work in the near future.

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/arch/arm/platforms/Makefile |  1 +
>   xen/arch/arm/platforms/qcom.c   | 77 +++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+)
>   create mode 100644 xen/arch/arm/platforms/qcom.c
> 
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..6873735ef0 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>   obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>   obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>   obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) += qcom.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/qcom.c b/xen/arch/arm/platforms/qcom.c
> new file mode 100644
> index 0000000000..77e9c58649
> --- /dev/null
> +++ b/xen/arch/arm/platforms/qcom.c
> @@ -0,0 +1,77 @@
> +/*
> + * xen/arch/arm/platforms/qcom.c
> + *
> + * Qualcomm SoCs specific code
> + *
> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> + *
> + * Copyright (c) 2024 EPAM Systems.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

Did you intend to license the code as GPLv2+? See [1], for some context.

> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <asm/platform.h>
> +#include <public/arch-arm/smccc.h>
> +#include <asm/smccc.h>
> +
> +#define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
> +#define QCOM_SCM_SVC_INFO		0x06
> +#define QCOM_SCM_INFO_IS_CALL_AVAIL	0x01
> +
> +#define ARM_SMCCC_SIP_QCOM_SCM_IS_CALL_AVAIL                            \

I find this name a little bit too long. Can we remove ARM_SMCCC as I 
don't think it adds any value?

> +    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,                             \
> +                       ARM_SMCCC_CONV_64,                               \
> +                       ARM_SMCCC_OWNER_SIP,                             \
> +                       SCM_SMC_FNID(QCOM_SCM_SVC_INFO,                  \
> +                                    QCOM_SCM_INFO_IS_CALL_AVAIL))
> +
> +static const char * const sa8155p_dt_compat[] __initconst =
> +{
> +    "qcom,sa8155p",
> +    NULL
> +};
> +
> +static bool sa8155p_smc(struct cpu_user_regs *regs)
> +{
> +    uint32_t funcid = get_user_reg(regs, 0);
> +

The function will also called for guests. But only the hardware 
domain/dom0 is using the machine qcom,sa8155p, so I think you want to 
check the domain.

> +    switch ( funcid ) {
> +    case ARM_SMCCC_SIP_QCOM_SCM_IS_CALL_AVAIL:
> +        /*
> +         * We need to implement this specific call only to make Linux
> +         * counterpart happy: QCOM SCM driver in Linux tries to
> +         * determine calling convention by issuing this particular
> +         * SMC. If it receives an error it assumes that platform uses
> +         * legacy calling convention and tries to issue SMC with
> +         * funcid = 1. Xen interprets this as PSCI_cpu_off and turns
> +         * off Linux boot vCPU.
> +         */
> +        set_user_reg(regs, 0, ARM_SMCCC_SUCCESS);
> +        set_user_reg(regs, 1, 1);
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
> +PLATFORM_START(sa8155p, "Qualcomm SA8155P")
> +    .compatible = sa8155p_dt_compat,
> +    .smc = sa8155p_smc
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

Cheers,

[1] https://lore.kernel.org/1272bb77-8a93-4ca2-af0d-4c1c36729307@xen.org

-- 
Julien Grall

