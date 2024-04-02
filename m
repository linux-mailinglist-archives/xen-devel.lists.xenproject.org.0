Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118BA894C9B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700004.1092540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVc-0006ln-66; Tue, 02 Apr 2024 07:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700004.1092540; Tue, 02 Apr 2024 07:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVc-0006hc-1M; Tue, 02 Apr 2024 07:24:40 +0000
Received: by outflank-mailman (input) for mailman id 700004;
 Tue, 02 Apr 2024 07:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3oM=LH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rrYVZ-0003jQ-QU
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0df3a58d-f0c2-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 09:24:35 +0200 (CEST)
Received: from SJ0PR13CA0155.namprd13.prod.outlook.com (2603:10b6:a03:2c7::10)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 07:24:31 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::df) by SJ0PR13CA0155.outlook.office365.com
 (2603:10b6:a03:2c7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25 via Frontend
 Transport; Tue, 2 Apr 2024 07:24:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 07:24:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 02:24:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Apr 2024 02:24:25 -0500
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
X-Inumbo-ID: 0df3a58d-f0c2-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVm/9qAABP1MCgARLU5JQYYV2eOa9lY+FCMiu5CBUlcm6PztozyWfwC4xnd4BdwUq1px6FVModD8b9eyKwEOUISzdxeimDDAItjrGyVh5RZN8H64sOLXY6ZcAt8IDbaERim/o/9Du09R/1Kcv18GFdeshYlqL6dpkq13cDvZ06bvxf7aKJBctfJWv7q+DHeBOktDFB7m3lw4ZBy5Huh5o5Mul6QYxfX0WzkM1mmVMNuXbK5qeCfm/4U9R074Yli5WeZVlxc63J2cufZE/HcR7R2HqFFSWZhgeQLEkvC7GpbNwPEFiEHwJjcRRrfusBaQVxEEgs+w9kIoRtFoNgWvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXNxJhuBaXSFA5QS+l+dNL67WxWcquNUnuCC7uV8B4w=;
 b=WgYt8sFRSHhPvyAAlZyTUsR8f3UrSXmikAsienTOqVRLBBk0ug+KZrEQ2Psn6Z/JG5EH9elIW4w4zB7lpqqHoU1b1mLUd8lTCoqSKSlLPgUmX96CEwEqxwYxEsfeX/d2xx37+p75XxFosovJ8nBs1pWfwpBqybAr/zzNBmGVqipbvmV7h86lNawExELUJynvpP8SPBOgt0QtJP9cNzd9/xsoeX5rrZqntu+UaKMZ05ajoQcnuwj+m1WuAy5lnwAr6NQdFp05f/xcA5uvVTxkTCnRVH/LrRZ5stsvZ37adufMU+NjP6lP3JOmY5cgVJOxC9iu1sA3tF3svBSLs9L3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=actia.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXNxJhuBaXSFA5QS+l+dNL67WxWcquNUnuCC7uV8B4w=;
 b=MqhBfQWdzC+u5/iiOn0ptQRPaO01hEan7u5PPr+7Lj1BUp/QVoGmTUJziziW+O4M3fvyg/w9D2X/loHaN/KuMFFSxLmPU9wkLGHyO8sj15yExXlqy6y0+bkpZDgzt2nffrifs2lhH5zrbjuKESzPTV0/H2H4FljbHc0XmuygNw0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8259527d-fc75-4f6d-8a0e-00f509a52c58@amd.com>
Date: Tue, 2 Apr 2024 09:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/arm: Add imx8q{m,x} platform glue
To: John Ernberg <john.ernberg@actia.se>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
References: <20240328163351.64808-1-john.ernberg@actia.se>
 <20240328163351.64808-2-john.ernberg@actia.se>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240328163351.64808-2-john.ernberg@actia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c93931-4359-4880-3cab-08dc52e5efc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KsAYMxtcxq4gEkmV1UAVqGcLkvlQZFz9ezQnzSqrBAl03SLMRH6bzJT2xrGhltSOskPtHCHA+a4RmJEcFS6XnKTWbhm43azb5s0NMpcO/9tq6RnOD63iv33vni6TfSYlqXjfTBPE8H75Mz+LuqH8HE7c9ahTBgzJ76dtPgwG2y0dU+XpJgyo6fv7H9jhjT1Ci9/BMgoIBBqPgrGFiSt5Mxa9Nrbi14LdOC0P5WeBf7870DpYe341x3fubQmWdunOhrB35Fp2WkW53obBQJdtkVe0Ym2ap+xYJEtzDk+mVoEpFMsqB4LRMVlYVjyecfk4k/sZ5hHm8BByiUnEoNPVTCIlVBM+jhppoJyTIzKWtEgrpXg+Y0DIwbRbAOoKTo19EKpR1YPFHzgRHzrZro9Df6J6gRAN4EDPXbC+YjZEKAIcQovXru+ES9E5hx90otEQOz3b86yU+MIh7gMXbhOKB9mIbnb49V0bdOwwbwSOw2rCCvB7/3Y0m89XARDfXmtserWoeGN8qRx9v8821qyN1AmOiTEGjVEopCBncIskJosYXi3mwdfP3DCItfe+9bKfima3Si1mMfoCOAVJZvc6ZK2CTNE3APJ9DPRO3zXGy31bJwpBYcdfVD0A+zeqc3pldiNCYyn0mMl9Wpl0rAKUWpYEqi5YIWxnflfVh89jNgZT8f0umAr4wAJpNWcH6+HXPVIh5ZNcxxVjea0wtKubLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(7416005)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 07:24:30.1446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c93931-4359-4880-3cab-08dc52e5efc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500

Hi John,

On 28/03/2024 17:34, John Ernberg wrote:
> 
> 
> When using Linux for dom0 there are a bunch of drivers that need to do SMC
> SIP calls into the firmware to enable certain hardware bits like the
> watchdog.
> 
> Provide a basic platform glue that implements the needed SMC forwarding.
> 
> The format of these calls are as follows:
>  - reg 0: function ID
>  - reg 1: subfunction ID (when there's a subfunction)
>  remaining regs: args
> 
> For now we only allow Dom0 to make these calls as they are all managing
> hardware. There is no specification for these SIP calls, the IDs and names
> have been extracted from the upstream linux kernel and the vendor kernel.
> 
> Most of the SIP calls are only available for the iMX8M series of SoCs, so
> they are easy to reject and they need to be revisited when iMX8M series
> support is added.
I just realized that you pinged me in v2 for clarification, sorry I missed that.
I still believe we shouldn't list FIDs that are meant for IMX8M, given that
the driver is written for IMX8QM/QXP.

> 
> From the other calls we can reject CPUFREQ because Dom0 cannot make an
> informed decision regarding CPU frequency scaling, WAKEUP_SRC is to wake
> up from suspend, which Xen doesn't support at this time.
> 
> This leaves the TIME SIP, OTP SIPs, BUILDINFO SIP and TEMP ALARM SIP, which
> for now are allowed to Dom0.
> 
> NOTE: This code is based on code found in NXP Xen tree located here:
> https://github.com/nxp-imx/imx-xen/blob/lf-5.10.y_4.13/xen/arch/arm/platforms/imx8qm.c
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> [jernberg: Add SIP call filtering]
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> v3:
>  - Adhere to style guidelines for line length and label indentation (Michal Orzel)
>  - Use smccc macros to build the SIP function identifier (Michal Orzel)
>  - Adjust platform name to be specific to QM and QXP variants (Michal Orzel)
>  - Pick up additional SIPs which may be used by other Linux versions - for review purposes
>  - Changes to the commit message due to above
> 
> v2:
>  - Reword the commit message to be a bit clearer
>  - Include the link previously added as a context note to the commit message (Julien Grall)
>  - Add Pengs signed off (Julien Grall, Peng Fan)
>  - Add basic SIP call filter (Julien Grall)
>  - Expand the commit message a whole bunch because of the changes to the code
> ---
>  xen/arch/arm/platforms/Makefile |   1 +
>  xen/arch/arm/platforms/imx8qm.c | 168 ++++++++++++++++++++++++++++++++
>  2 files changed, 169 insertions(+)
>  create mode 100644 xen/arch/arm/platforms/imx8qm.c
> 
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..bec6e55d1f 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>  obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>  obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>  obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8qm.c
> new file mode 100644
> index 0000000000..0992475474
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -0,0 +1,168 @@
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
> +#include <xen/sched.h>
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
> +#define IMX_SIP_FID(fid) \
> +    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, \
> +                       ARM_SMCCC_CONV_64, \
> +                       ARM_SMCCC_OWNER_SIP, \
> +                       fid)
macro parameter should be enclosed within parenthesis

> +
> +#define IMX_SIP_F_GPC            0x0000
> +#define IMX_SIP_F_CPUFREQ        0x0001
> +#define IMX_SIP_F_TIME           0x0002
> +#define IMX_SIP_F_BUILDINFO      0x0003
> +#define IMX_SIP_F_DDR_DVFS       0x0004
> +#define IMX_SIP_F_SRC            0x0005
> +#define IMX_SIP_F_GET_SOC_INFO   0x0006
> +#define IMX_SIP_F_NOC            0x0008
> +#define IMX_SIP_F_WAKEUP_SRC     0x0009
> +#define IMX_SIP_F_OTP_READ       0x000A
> +#define IMX_SIP_F_OTP_WRITE      0x000B
> +#define IMX_SIP_F_SET_TEMP_ALARM 0x000C
Is there specific reason for leading zeros?

> +
> +#define IMX_SIP_TIME_SF_RTC_SET_TIME     0x00
> +#define IMX_SIP_TIME_SF_WDOG_START       0x01
> +#define IMX_SIP_TIME_SF_WDOG_STOP        0x02
> +#define IMX_SIP_TIME_SF_WDOG_SET_ACT     0x03
> +#define IMX_SIP_TIME_SF_WDOG_PING        0x04
> +#define IMX_SIP_TIME_SF_WDOG_SET_TIMEOUT 0x05
> +#define IMX_SIP_TIME_SF_WDOG_GET_STAT    0x06
> +#define IMX_SIP_TIME_SF_WDOG_SET_PRETIME 0x07
> +
> +static bool imx8qm_is_sip_time_call_ok(uint32_t subfunction_id)
> +{
> +    switch ( subfunction_id )
> +    {
> +    case IMX_SIP_TIME_SF_RTC_SET_TIME:
> +        return true;
> +    case IMX_SIP_TIME_SF_WDOG_START:
> +    case IMX_SIP_TIME_SF_WDOG_STOP:
> +    case IMX_SIP_TIME_SF_WDOG_SET_ACT:
> +    case IMX_SIP_TIME_SF_WDOG_PING:
> +    case IMX_SIP_TIME_SF_WDOG_SET_TIMEOUT:
> +    case IMX_SIP_TIME_SF_WDOG_GET_STAT:
> +    case IMX_SIP_TIME_SF_WDOG_SET_PRETIME:
> +        return true;
> +    default:
> +        printk(XENLOG_WARNING "imx8qm: smc: time: Unknown subfunction id %x\n",
gprintk

> +               subfunction_id);
> +        return false;
> +    }
> +}
> +
> +static bool imx8qm_smc(struct cpu_user_regs *regs)
> +{
> +    uint32_t function_id = get_user_reg(regs, 0);
> +    uint32_t subfunction_id = get_user_reg(regs, 1);
> +    struct arm_smccc_res res;
> +
> +    if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
> +    {
> +        printk_once(XENLOG_WARNING "no SMCCC 1.1 support. Disabling firmware calls\n");
NIT: you can move string within quotes to the next line to avoid exceeding 80 chars.
Also, all the other messages are prepended with "imx8qm: smc:" so better be consistent.

> +
> +        return false;
> +    }
> +
> +    /* Only hardware domain may use the SIP calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_WARNING, "imx8qm: smc: No access\n");
Here you use gprintk, but ...

> +        return false;
> +    }
> +
> +    switch ( function_id )
> +    {
> +    /* Only available on imx8m series */
> +    case IMX_SIP_FID(IMX_SIP_F_GPC):
> +        return false;
> +    case IMX_SIP_FID(IMX_SIP_F_CPUFREQ):
> +        /* Hardware domain can't take any informed decision here */
> +        return false;
> +    case IMX_SIP_FID(IMX_SIP_F_BUILDINFO):
> +        goto allow_call;
> +    case IMX_SIP_FID(IMX_SIP_F_TIME):
> +        if ( imx8qm_is_sip_time_call_ok(subfunction_id) )
> +            goto allow_call;
> +        return false;
> +    /* Only available on imx8m series */
> +    case IMX_SIP_FID(IMX_SIP_F_DDR_DVFS):
> +        return false;
> +    /* Only available on imx8m series */
> +    case IMX_SIP_FID(IMX_SIP_F_SRC):
> +        return false;
> +    /* Only available on imx8m series */
> +    case IMX_SIP_FID(IMX_SIP_F_GET_SOC_INFO):
> +        return false;
> +    /* Only available on imx8m series */
> +    case IMX_SIP_FID(IMX_SIP_F_NOC):
> +        return false;
> +    /* Xen doesn't have suspend support */
> +    case IMX_SIP_FID(IMX_SIP_F_WAKEUP_SRC):
> +        return false;
> +    case IMX_SIP_FID(IMX_SIP_F_OTP_READ):
> +        /* subfunction_id is the fuse number, no sensible check possible */
> +        goto allow_call;
> +    case IMX_SIP_FID(IMX_SIP_F_OTP_WRITE):
> +        /* subfunction_id is the fuse number, no sensible check possible */
> +        goto allow_call;
> +    case IMX_SIP_FID(IMX_SIP_F_SET_TEMP_ALARM):
> +        goto allow_call;
> +    default:
> +        printk(XENLOG_WARNING "imx8qm: smc: Unknown function id %x\n",
... here you don't.

> +               function_id);
> +        return false;
> +    }
> +
> + allow_call:
> +    arm_smccc_1_1_smc(function_id,
> +                      subfunction_id,
> +                      get_user_reg(regs, 2),
> +                      get_user_reg(regs, 3),
> +                      get_user_reg(regs, 4),
> +                      get_user_reg(regs, 5),
> +                      get_user_reg(regs, 6),
> +                      get_user_reg(regs, 7),
> +                      &res);
> +
> +    set_user_reg(regs, 0, res.a0);
> +    set_user_reg(regs, 1, res.a1);
> +    set_user_reg(regs, 2, res.a2);
> +    set_user_reg(regs, 3, res.a3);
> +
> +    return true;
> +}
> +
> +PLATFORM_START(imx8qm, "i.MX 8Q{M,XP}")
> +    .compatible = imx8qm_dt_compat,
> +    .smc = imx8qm_smc,
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
> 2.44.0


~Michal

