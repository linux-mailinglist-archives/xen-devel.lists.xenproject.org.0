Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71FC855D39
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 10:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681414.1060175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raXdj-0002nr-JU; Thu, 15 Feb 2024 09:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681414.1060175; Thu, 15 Feb 2024 09:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raXdj-0002le-Gr; Thu, 15 Feb 2024 09:02:43 +0000
Received: by outflank-mailman (input) for mailman id 681414;
 Thu, 15 Feb 2024 09:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DeW9=JY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1raXdi-0002lY-41
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 09:02:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f70152a9-cbe0-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 10:02:38 +0100 (CET)
Received: from BL1PR13CA0209.namprd13.prod.outlook.com (2603:10b6:208:2be::34)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Thu, 15 Feb
 2024 09:02:32 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::ce) by BL1PR13CA0209.outlook.office365.com
 (2603:10b6:208:2be::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.10 via Frontend
 Transport; Thu, 15 Feb 2024 09:02:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 09:02:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 15 Feb
 2024 03:02:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 15 Feb
 2024 03:02:31 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 15 Feb 2024 03:02:29 -0600
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
X-Inumbo-ID: f70152a9-cbe0-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV7Yi9u81PozEB1sph3v7r9+/uP09Eyy+/pkpwr/fCz4rV0cQ9GcA08PifpDFqRpoKjU+TjC4FUEuF3POjdjljyZMQoXS94kECgcvAUqu0bxcd1YeS/Fv5vvX7TYypbl7YkeYm+3s39W9wd5HzRmm5I8ebitGKYYiCEc6gMldmUDNejqC0SMTzy8pCPTT+pfUzf9dmOue96yyFXCKyt9EMKSILf4BX65x9A+oQGGpubCplfNrpC0Lz3Sgyp+gyfjomWV1qiOHvTyFwEG808u1yN6SzhZ7toVTwShgI7wRe9iZuB8k9WXNH6bUyF1MWmmQUnBCuTVi0XpW9TLFM2QJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SMTQcb7Cy9OfOmmMhTCyRGm7XoY2iIL/SVb7fVFy+o=;
 b=Qcbjqv9wVgsle8uBCJPQA7i/Tc2liGQ2TvsP5CyWD1mcsxBbWvo8Q4B2Y8tDeBvYAMAympbi36oSQzib7oMB6f5mjOCFO3f7yKwQSMH8Z+ne4xrIRT07wGWo8WSd3ZBi3RViwuhrJHAkn6cV+Q/3Ap3gWFVE+QrQzNFq+ikwCC18en5q3n/VHWts7T6l2knjYsv5SbvSibEP2OtYJ8FfnT2WqOeL2bUvH4Y9C3AZPlAaJ6TMv0LfawR0u7PLP28XryLxjDwICdDBKqbutcnXWA0ABiIGsDH6Kmhlg+h6oHcAJGtsZBw7xW+3zPGpfg1k6psXLPXDw8O05zyti6clNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=actia.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SMTQcb7Cy9OfOmmMhTCyRGm7XoY2iIL/SVb7fVFy+o=;
 b=F3Qi3PK6eGPF39PnImzF8G29J7QbiY7Gqi9vRiDLpYhv1lp8LIQyJqmEBTE817auUvdAsHVKvdfBlAhFRJMuWeJyh6NbOhf+exMUwE/F6hSmHQ5mJf/zbIhzAB5O5+Rx5nigHMeU35NVLmCZ1OdbNM/ql5CLs8L9qxZDorvb+FM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3fe044c4-5e60-4e11-a99e-38534610640b@amd.com>
Date: Thu, 15 Feb 2024 10:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm: Add imx8q{m,x} platform glue
To: John Ernberg <john.ernberg@actia.se>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peng
 Fan" <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
References: <20240214160644.3418228-1-john.ernberg@actia.se>
 <20240214160644.3418228-2-john.ernberg@actia.se>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240214160644.3418228-2-john.ernberg@actia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5d16c2-dd65-4af7-1e8f-08dc2e04d7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fCC6vWkXuZigwe4HrrjzJ97Spf7d4QR+3Fu3+yBGGsqkLy7PgrF9qIqsB9H9nwbnnGBYU4AoYR+Sn3mBTG9CYyHKvKcgoYW2pOCYFIvg34G320j3x21P5iCGYxk5Y4Lmq3u4d9r7HhCCDMsv02m9Y/jv5ocfJ9DloGYzLpY5fg9Fl7ZGg8VS4gUFq4vCHCmF0MOokfpnXJdjqP7gVTkrrRx3o9m7FIDeJx2YCqhLr2br66AmxMfOtudYXcOY4ouU6x3RZaxPF1+cVOSa+Xg8rCUr1ZzGyKmzV/5XABadgjpvwZYrjiz6G7RwnRGnT3gEwnxUCjCH/9kEnVo5A+GpMqjeV9MprZN0YpoA5yuYJetnc7XBTAnd9mwveCkC+o0OC2d5M1KfGnwzdlFBZziXeOSz1w0QjrJwCs1P8c/BcAL4HD1adiueYbvKiiTE1hk9eRBhez34Tftjfez65hAuZk3WZQ2MGdAz/jF3RhWszwL/0qrvrmGR0asd5fn/QbalBGUrRltTQe+qBlF04RCHECFDClzctw14ibMvU0MQ7ommNugsRobcfqLeNOayPWJP+h3gVIKr47jtAzGX+iyUbQtSmFvUcIsKKNbYh6zuKcruuJb9H64v1T40OVft4zBQmC075m26DEVuFyB6X6q2oQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230273577357003)(230922051799003)(451199024)(36860700004)(186009)(1800799012)(82310400011)(64100799003)(40470700004)(46966006)(36756003)(110136005)(8936002)(26005)(2616005)(426003)(336012)(4326008)(70206006)(83380400001)(8676002)(53546011)(966005)(54906003)(5660300002)(70586007)(31696002)(316002)(86362001)(82740400003)(81166007)(356005)(41300700001)(16576012)(478600001)(31686004)(2906002)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 09:02:31.6395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5d16c2-dd65-4af7-1e8f-08dc2e04d7fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343

Hi,

On 14/02/2024 17:06, John Ernberg wrote:
> 
> 
> When using Linux for dom0 there are a bunch of drivers that need to do SMC
> SIP calls into the firmware to enable certain hardware bits like the
> watchdog.
> 
> Provide a basic platform glue that implements the needed SMC forwarding.
> 
> The format of these calls are as follows:
>  - reg 0: service ID
>  - reg 1: function ID
>  remaining regs: args
> 
> For now we only allow Dom0 to make these calls as they are all managing
> hardware. There is no specification for these SIP calls, the IDs and names
> have been extracted from the upstream linux kernel and the vendor kernel.
> 
> Most of the SIP calls are only available for the iMX8M series of SoCs, so
> they are easy to reject and they need to be revisited when iMX8M series
> support is added.
Given that you named your driver *qm and you search for dt compatible *qm, *qxp, does it really
make sense to add SIP calls for iMX8M?

> 
> From the other calls we can reject CPUFREQ because Dom0 cannot make an
> informed decision regarding CPU frequency scaling, WAKEUP_SRC is to wake
> up from suspend, which Xen doesn't support at this time.
> 
> This leaves the TIME SIP and the OTP_WRITE SIP, which for now are allowed
> to Dom0.
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
> v2:
>  - Reword the commit message to be a bit clearer
>  - Include the link previously added as a context note to the commit message (Julien Grall)
>  - Add Pengs signed off (Julien Grall, Peng Fan)
>  - Add basic SIP call filter (Julien Grall)
>  - Expand the commit message a whole bunch because of the changes to the code
> ---
>  xen/arch/arm/platforms/Makefile |   1 +
>  xen/arch/arm/platforms/imx8qm.c | 143 ++++++++++++++++++++++++++++++++
>  2 files changed, 144 insertions(+)
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
> index 0000000000..4515c75935
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -0,0 +1,143 @@
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
> +#define IMX_SIP_GPC          0xC2000000
NIT: A matter of personal opinion but all the Arm64 SIP services starts with 0xc2000000,
so you could just define a function id i.e. 1, 2, ... and use a macro similar to EEMI_FID(fid).
This is just a suggestion.

> +#define IMX_SIP_CPUFREQ      0xC2000001
> +#define IMX_SIP_TIME         0xC2000002
> +#define IMX_SIP_DDR_DVFS     0xC2000004
> +#define IMX_SIP_SRC          0xC2000005
> +#define IMX_SIP_GET_SOC_INFO 0xC2000006
> +#define IMX_SIP_NOC          0xC2000008
> +#define IMX_SIP_WAKEUP_SRC   0xC2000009
> +#define IMX_SIP_OTP_WRITE    0xC200000B
Looking at ATF, for QM,QXP there are also:
BUILDINFO 0xC2000003
OTP_READ  0xC200000A
SET_TEMP  0xC200000C

> +
> +#define IMX_SIP_TIME_F_RTC_SET_TIME     0x00
> +#define IMX_SIP_TIME_F_WDOG_START       0x01
> +#define IMX_SIP_TIME_F_WDOG_STOP        0x02
> +#define IMX_SIP_TIME_F_WDOG_SET_ACT     0x03
> +#define IMX_SIP_TIME_F_WDOG_PING        0x04
> +#define IMX_SIP_TIME_F_WDOG_SET_TIMEOUT 0x05
> +#define IMX_SIP_TIME_F_WDOG_GET_STAT    0x06
> +#define IMX_SIP_TIME_F_WDOG_SET_PRETIME 0x07
> +
> +static bool imx8qm_is_sip_time_call_ok(uint32_t function_id)
> +{
> +    switch ( function_id )
> +    {
> +    case IMX_SIP_TIME_F_RTC_SET_TIME:
> +        return true;
> +    case IMX_SIP_TIME_F_WDOG_START:
> +    case IMX_SIP_TIME_F_WDOG_STOP:
> +    case IMX_SIP_TIME_F_WDOG_SET_ACT:
> +    case IMX_SIP_TIME_F_WDOG_PING:
> +    case IMX_SIP_TIME_F_WDOG_SET_TIMEOUT:
> +    case IMX_SIP_TIME_F_WDOG_GET_STAT:
> +    case IMX_SIP_TIME_F_WDOG_SET_PRETIME:
> +        return true;
> +    default:
> +        printk(XENLOG_WARNING "imx8qm: smc: time: Unknown function id %x\n", function_id);
80 chars limit, move argument list to the next line

> +        return false;
> +    }
> +}
> +
> +static bool imx8qm_smc(struct cpu_user_regs *regs)
> +{
> +    uint32_t service_id = get_user_reg(regs, 0);
In SMCCC naming convention, W0 is called function identifier. Instead you call X1 function_id
which is a bit misleading.

> +    uint32_t function_id = get_user_reg(regs, 1);
> +    struct arm_smccc_res res;
> +
> +    if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
> +    {
> +        printk_once(XENLOG_WARNING "no SMCCC 1.1 support. Disabling firmware calls\n");
80 chars limit, move string to the next line

> +
> +        return false;
> +    }
> +
> +    /* Only hardware domain may use the SIP calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_WARNING, "imx8qm: smc: No access\n");
> +        return false;
> +    }
> +
> +    switch ( service_id )
> +    {
> +    case IMX_SIP_GPC: /* Only available on imx8m series */
If we decide to keep iMX8M FIDs, I think adding comments on top of a case would result in a more readable code.

> +        return false;
> +    case IMX_SIP_CPUFREQ: /* Dom0 can't take any informed descision here */
> +        return false;
> +    case IMX_SIP_TIME:
> +        if ( imx8qm_is_sip_time_call_ok(function_id) )
> +            goto allow_call;
> +        return false;
> +    case IMX_SIP_DDR_DVFS: /* Only available on imx8m series */
> +        return false;
> +    case IMX_SIP_SRC: /* Only available on imx8m series */
> +        return false;
> +    case IMX_SIP_GET_SOC_INFO: /* Only available on imx8m series */
> +        return false;
> +    case IMX_SIP_NOC: /* Only available on imx8m series */
> +        return false;
> +    case IMX_SIP_WAKEUP_SRC: /* Xen doesn't have suspend support */
> +        return false;
> +    case IMX_SIP_OTP_WRITE:
> +        /* function_id is the fuse number, no sensible check possible */
> +        goto allow_call;
> +    default:
> +        printk(XENLOG_WARNING "imx8qm: smc: Unknown service id %x\n", service_id);
80 chars limit, move argument list to the next line

> +        return false;
> +    }
> +
> +allow_call:
labels need to be indented with one space

> +    arm_smccc_1_1_smc(service_id,
> +                      function_id,
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
> +PLATFORM_START(imx8qm, "i.MX 8")
Shouldn't it be i.MX 8Q{M,XP} ?

~Michal

