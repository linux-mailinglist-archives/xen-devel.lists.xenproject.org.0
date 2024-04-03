Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38D89682F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 10:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700363.1093377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnN-0003Vp-5g; Wed, 03 Apr 2024 08:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700363.1093377; Wed, 03 Apr 2024 08:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnN-0003TA-2I; Wed, 03 Apr 2024 08:16:33 +0000
Received: by outflank-mailman (input) for mailman id 700363;
 Wed, 03 Apr 2024 08:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUqh=LI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rrvnL-0003T4-6R
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 08:16:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78c9c4fd-f192-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 10:16:29 +0200 (CEST)
Received: from SA1PR05CA0015.namprd05.prod.outlook.com (2603:10b6:806:2d2::24)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:16:26 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::34) by SA1PR05CA0015.outlook.office365.com
 (2603:10b6:806:2d2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 08:16:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 08:16:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:24 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 03:16:23 -0500
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
X-Inumbo-ID: 78c9c4fd-f192-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtBIhvhaCtQqHGqfiQOGr8MkyoExC4A3kwGQPn4R59q0qZ0uK8rIAt0WRjTs/HBJrwb7ahJoP4UFqXoUqVMk7Xr4+uH3dwvPHkPJmoftp7Hx5pQZgOJ9jaJHIQ7F181zwZgcSXpMBDuQau9mzqIB3RhREEZIiB2PF9vRopWCg2JfNMzbvYcKr6VacyYzXmnPo/8IbzwfXdaBQE0HT+YLXIl/hCGEcf4nuIfl4Rm+2t8Wt5Xow5BuH1lkO0s6eyFbzFePs45PHn2+10v30U/RP8C5vY3yHqIOtJClqwNXOMMROngwCa1roVkZQtnVV6KthTvnNRI8bEpe9bqyw4S26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHxMjhwmAzimPSJP1VTomeYb5uReXxIrg/cUbSKwr4Q=;
 b=Gl5NuMnHMFTtsp0ds9qs1k6h0/VMvyPFmUQWtUXqbDkwwGyg8ot7aJgeFz3zTX0JP3xeWZYJ3i47kCRkQIMa7YOEcGxgDsQJLYXnyRLaOaTgB1i/uHPhvk5Yx+sJ/lY19hjutwsu3AY45F6YTLYLZt4hZoI6IAgFacdLYRt2S6S4ussKgGjUhftBUFtCxufUbcKHpBSE8SHXL+TbsrTd1js6z5hY+alECAF0tAOQLWI/8j8YhNRwnsu71dXd7J8hFjNIbBvTahSBDV2ZUARjWHO7Q2s6A8bgdPk6SeWuWFQzk7ATLKOT7Vq+jOZFn5TWic3qFrC2ZDlBuJEt9IcJtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHxMjhwmAzimPSJP1VTomeYb5uReXxIrg/cUbSKwr4Q=;
 b=CBtFGyU/2/Mca7poTft04bLnMGuTW5/vjD47xKhcl/CE1kxE74B64ERDZ9B3eYTf9+3LY++gd3jk1gRCYKAs/Ylc1ny9WwYY4+/8IKmVMs/8fviuC5qy1fYfDM0qYFEhOO5wujQhrcD70rLl866Va4+56HsY9Z+XJDWd5QYvNx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eb7118d0-ca3c-4959-b2e9-4f7fa247c80e@amd.com>
Date: Wed, 3 Apr 2024 10:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm: platform: qcom: add basic support SA8155P SoC
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-4-volodymyr_babchuk@epam.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240329000822.3363568-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5ae14c-d513-4f75-5c81-08dc53b65b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+OiN2K8vP3VkBxWnjIsdGKHSNKO5YGJ5rHnOagyQ3vI+gFmpD5OXNa0lpjpmII2na+1aNGRW4O7fSlxZl30nWmn2pryJmsSEumSehP+bnknn6CxxBMVzVcQYASQyD+pqFSSQDE4yftYhiyriX50ZKTkJgtA693q8Pu907JfT5LbZ0bkOOOEUC2iEbfJ/UU1MzHhhvar2cudiRziU/Y3vj32xz51A9d4dG7fKvfTZnyWYMkF3URrpiWXa23L8qtqGYeq1LWWv2q5dimAg73EAjW1+tmYoJoCR+yqk7kgIgQpB5UEgP7jpnmQ6xuyjuKw3D2W4MipMqK2AfhJqo09EaCu1X7p0MryPAmnfsliDTDcEfn2MX9wQ6VDvWm5wcB7zMiwo2grKw0rvrFnhJkWxVDimT/vI9EfzHEcYuPhYl2lQ059K5iNDXMmC/kCnubEJv+JJQFbfeLh1kTHQc3LsF6t8KCWJIke4LANl5BngJeIlrK2BNUNXrSO14pSQaHfMEScf5NS+RND1SblN1I7at7dZmBqX428hw9D7dIu/tAem3iwReS9bJ/YaA2xYXVHF5GZ/jGhfb42F8HvvcrqhZru+4y3gkRWeuTGfqyJbf7IzZO0bbCSOlzp4tfEs8D8TjX6OsfxOZV4X7Ip3QHDe7OizKg5AkY7o40l4ZGr5L0Fzpb5fn0SLYpgAkucwWymv4w2XxtRictjFENeOVgIqkrPDVEX+eyWIMKuB58ndQvzXFXh9IU8soWJatNbeOEtm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 08:16:26.0707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5ae14c-d513-4f75-5c81-08dc53b65b73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557

Hello,

On 29/03/2024 01:08, Volodymyr Babchuk wrote:
> 
> 
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
Therefore I would consider adding a Kconfig option and placing it under experimental

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  xen/arch/arm/platforms/Makefile |  1 +
>  xen/arch/arm/platforms/qcom.c   | 77 +++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 xen/arch/arm/platforms/qcom.c
> 
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..6873735ef0 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>  obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>  obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>  obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) += qcom.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
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
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
Please use SPDX identifier instead of license text

> + */
> +
> +#include <asm/platform.h>
> +#include <public/arch-arm/smccc.h>
no need for this public header

> +#include <asm/smccc.h>
> +
> +#define SCM_SMC_FNID(s, c)     ((((s) & 0xFF) << 8) | ((c) & 0xFF))
spaces instead of tabs

> +#define QCOM_SCM_SVC_INFO              0x06
spaces instead of tabs

> +#define QCOM_SCM_INFO_IS_CALL_AVAIL    0x01
> +
> +#define ARM_SMCCC_SIP_QCOM_SCM_IS_CALL_AVAIL                            \
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
> +    switch ( funcid ) {
brace should be placed on a new line

~Michal

