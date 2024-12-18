Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947C9F685B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860478.1272498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNv0N-0003wQ-GW; Wed, 18 Dec 2024 14:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860478.1272498; Wed, 18 Dec 2024 14:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNv0N-0003ti-Di; Wed, 18 Dec 2024 14:26:27 +0000
Received: by outflank-mailman (input) for mailman id 860478;
 Wed, 18 Dec 2024 14:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bs8F=TL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNv0M-0003sB-33
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:26:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d6fea5e-bd4c-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 15:26:25 +0100 (CET)
Received: from MN0P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::13)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 14:26:17 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::d7) by MN0P222CA0003.outlook.office365.com
 (2603:10b6:208:531::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 14:26:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 14:26:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 08:26:15 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 08:26:13 -0600
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
X-Inumbo-ID: 0d6fea5e-bd4c-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0TvbE8rJKXcQ7dyrNl3QoE9vLyZeLClReTLY1J0y7zyE5p20LzQT4tqU94KXmzEoA0hkIDL7zQKtpoA3I0Y6t+hPoG0BRPgRMGFc73rNFz25Ch1ZHbal5MVHJUvHGdX34s5njAN691vJvke/hr3spa0kZENlxaQsCjyHM3aOiwKnJU8Q218GeB4oQyrrPdjDVeG/aTAh0jZRPW2ahXkI9zGseM8XGteF9FWDCy3N6wB7tx6cGJpFeTx+rAqtPVTR+8zze+Ju2vQfPUzOTFQdEqd0+opoDOddVmYTFH9iIzyAjel/lQxR3GfiWfJ8Af2660ok9MoAOltIOPy7qivgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05SOyKmzutmcKPhgk89AiitgH5Cz57v5pmXECL8+GiA=;
 b=BGdDKM/Cup5pPzxt9xAYrovQ37946CktMKElqrGsBXGeH4EI70PJ4/eWMEXuAm7cvVKR53Nx8k4zdlUjt1tKfMUrQg11BN0DMeDuNRoKaDQYkBq6rYtBoFX8T4pyf+sCr1e76MQcgOloFRFhVZRngxHA0UQhV4PAcllvU48+wEBKCEgfbnFfMEhDaWL/wLVAkuGbu/C+qQ5mQO0FGYcur/NDsL79YrAE9uZuWg6La6oo/ZUMOd9OZ1vM7rzYVA4Q5+crsupy/Go028GRrLtubNAPvqbPcBmcCQZWykybflhptGSTJYMgEmKhL4Pk9rRf93ZGVDyumfWKPUGg2hSBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05SOyKmzutmcKPhgk89AiitgH5Cz57v5pmXECL8+GiA=;
 b=a2irqtk8t+lKbgpBuHgwOt2M+IzAhPJZI9bDWi8/oGVLEKzKTEFQGP82+WXYc7erRcdyt+J724wY9V7ihem9AJ9h9AxrMMzBfw5Ap6nQPyYLjs/jLmH4sK0ZQmQ036B1WYGBl/NQ3d5c2IjJyeG98vFmTtiqWSh5YGRD2c1VuSI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <60d4ac08-c5e8-4a38-bfc9-2b73e6cf5ec7@amd.com>
Date: Wed, 18 Dec 2024 15:26:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: firmware: Add SCMI over SMC calls
 handling layer
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	<xen-devel@lists.xenproject.org>
CC: <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|PH8PR12MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: df53d78e-2a03-41fd-1f6b-08dd1f6fef59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3k5NzlKTGpQNExQU1FjMFhNc1Q1WURUeWEybVlZbDNjU2lGRWtwMFlCV1pj?=
 =?utf-8?B?cXZBQ0Fwd3JSRnRDN0NZcmo4aGJJcFBHZy9tdEFMaTI4YU5MYXduNUFjTUZP?=
 =?utf-8?B?WHFmVnY3VVhKRHdJdlM1aW43bjk5dFF2VTBwbUVRSjl1SGNEUXhYSXlTa0R1?=
 =?utf-8?B?ZUtVMERjSWUwMmdFTXY5UXVsRHVpSURGM1RybTFkNnhwanZYOEtmTlV3S2xr?=
 =?utf-8?B?cHJFajJMYkRINS9JNjk2RC8vL2ljYm1mRHNLdkpSY3J1MHJIY09CTjBaZXZu?=
 =?utf-8?B?ZXV5SHNqcTdHZnAyZVNGNFI4azJuRWROM05XVTkrTlZQUTg2WEN6eXFqUUN0?=
 =?utf-8?B?K25XbThPcnJOU21CTGw0VldZRU8vNEwxalFqS3lyeHFjOHRDOWRBK3NtR1dH?=
 =?utf-8?B?TEp4MTRCQUVLM0JTVXh5RzNQYWxYNUtXRWRBS2VvakI1MzNyLzRFYmgyZTFz?=
 =?utf-8?B?N0R0TW5GTTlPWjl4eTNrQTZCM1VNc3FXQ3l4OWlUekNZZXVCMXdCbVIxWEQ3?=
 =?utf-8?B?Z1BUSGhMV28ySzNqSjZXQjhZWjkrQ2UvNkd5dEl5OXByR0s4dUwrbUovUldw?=
 =?utf-8?B?OHV3RTBvcGpUcXRyTVBvNTNJUVdLalROK0hhRjRaRzFvR1E3MklrYVI5RDVo?=
 =?utf-8?B?NTRpcHo2NUNYTVE4ZFVxSzc2VEpWcnlwSXVGQkNHaFJRSHNBRW53L1FDTlJH?=
 =?utf-8?B?dW41c3QrekZDSndwTzJBY0F3a2dZSDRCWGpFMm5NZnF3KzJrQWJoMXg4RFMw?=
 =?utf-8?B?RjBHRkNERGhOTjNYL2xtZFA4b1FDeCtrdmYyZ3hyNkZyYmlXMGw3SHJoWFl2?=
 =?utf-8?B?ZTdtblA2NkVOUC93SVJ3WXMvTFg2RkhkalMvME0wMHJxWVVjOFRQRk11Z0Zr?=
 =?utf-8?B?ZFdkNUxqS21NNy9wZWVDd3M5TWNPWFpGWVg3TFh0cWFiNjFSR3BZYkxrUGpD?=
 =?utf-8?B?VDZhMzRPb2ZjSGxtamVtcFp2WWd4UHZOSG9LakVLWDVFWlVXYmF1SUh6cm8y?=
 =?utf-8?B?R1VEL0R1LzlTNVN5TEZCU2FtWW9hNVpxVFZSVEplck05QS9lSDFvVm02bElL?=
 =?utf-8?B?dFdpTEJmNUZQSnB6U0ZKVnlVaTYwV0xyOG5mc1publBKdkMxd0ZKMWo3cTJ4?=
 =?utf-8?B?RlR2QW1la1ExM1ppME1xOVRvVlJXeVR1NnNEeEllenNxR1FZUkxqbXFQT2s3?=
 =?utf-8?B?UitBOUU1cFFyWStHbmJWc0F4cjB5djdtdGtuZFRyKzc3ZjBKczc5djN6YmxM?=
 =?utf-8?B?ZEFjVHZsdHNIcFJFajNLREc0TFdMNXg4alJqc3BGb0tOUWhlbWFCWmVEL2xS?=
 =?utf-8?B?dlkxL1BqT0l4cDRXdHJHa2lvYlllazZoZUw3SXNYZU4zcHdzOEZPNmZJejR5?=
 =?utf-8?B?S3ZJYVRjbVd6UDFab0lZOUluL2s4dFd5S25Ra2N3ZnJTOSsyWkxxMTRYNkxI?=
 =?utf-8?B?REd1bEEyWGZVMExDK0REWUNsbjNMODZNZmEvQTBLdUxRYkVUWmYwWGxMOXgw?=
 =?utf-8?B?eEt0SGQxSENZZDlYU0RDMlM0c2ZRVGZMTDRSOC9PQ1lKUFBjLzVXcHdDSE1o?=
 =?utf-8?B?NWkrWU80cnZYbTdodGIwZWhCbTRjUW01T25xeWlJaU15TllvQ2J2dXhpaE93?=
 =?utf-8?B?VEFNWHc1N3pJV25vM0hxYVRMVUNsWVNLZ2tYTnpKV2E1YXFTdVJGbnhBVjlP?=
 =?utf-8?B?M0h2Vk04RSsvYTdDN3JOaHRGOXlvUXBGNzJXZEI1anl3Z0hSN2JPTWJiNVpx?=
 =?utf-8?B?QkN0MC80VkZQM3FXWHdMSU45WlN5R3l2OVRnNExrNTJmZFhKUm9Sb0w3OFdL?=
 =?utf-8?B?RUNvVzBVTXRDaW1XWi9qUnh6SmhHeXVmLzZrM0trWGdyOTdSVTdUcG9tYkJY?=
 =?utf-8?B?Q2lXVGlBdEZjeFlDZGJXa1QzMlgvZkRUZ21QUVJ3UDR0UStjdEI1UFB4c2NB?=
 =?utf-8?B?V2U5RjJMMU1GdXJCQ3l5R1FSRUFuUVZMME9qZ1lVMnhjWi81cVdtSlRqZ1BO?=
 =?utf-8?Q?Z37dT53xixjpWIlH8PLoEBltigSpFw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:26:17.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df53d78e-2a03-41fd-1f6b-08dd1f6fef59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027



On 18/12/2024 11:11, Andrei Cherechesu (OSS) wrote:
> 
> 
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Introduce the SCMI-SMC layer to have some basic degree of
> awareness about SCMI calls that are based on the ARM System
> Control and Management Interface (SCMI) specification (DEN0056E).
> 
> The SCMI specification includes various protocols for managing
> system-level resources, such as: clocks, pins, reset, system power,
> power domains, performance domains, etc. The clients are named
> "SCMI agents" and the server is named "SCMI platform".
> 
> Only support the shared-memory based transport with SMCs as
> the doorbell mechanism for notifying the platform. Also, this
> implementation only handles the "arm,scmi-smc" compatible,
> requiring the following properties:
>         - "arm,smc-id" (unique SMC ID)
>         - "shmem" (one or more phandles pointing to shmem zones
>         for each channel)
> 
> The initialization is done as initcall, since we need
> SMCs, and PSCI should already probe EL3 FW for SMCCC support.
> If no "arm,scmi-smc" compatible node is found in the host
> DT, the initialization fails silently, as it's not mandatory.
> Otherwise, we get the 'arm,smc-id' DT property from the node,
> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
> are not validated, as the SMC calls are only passed through
> to EL3 FW if coming from the hardware domain.
> 
> Create a new 'firmware' folder to keep the SCMI code separate
> from the generic ARM code.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/arch/arm/Kconfig                         |   2 +
>  xen/arch/arm/Makefile                        |   1 +
>  xen/arch/arm/firmware/Kconfig                |  13 ++
>  xen/arch/arm/firmware/Makefile               |   1 +
>  xen/arch/arm/firmware/scmi-smc.c             | 166 +++++++++++++++++++
>  xen/arch/arm/include/asm/firmware/scmi-smc.h |  46 +++++
>  6 files changed, 229 insertions(+)
>  create mode 100644 xen/arch/arm/firmware/Kconfig
>  create mode 100644 xen/arch/arm/firmware/Makefile
>  create mode 100644 xen/arch/arm/firmware/scmi-smc.c
>  create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 604aba4996..23dc7162a7 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -271,6 +271,8 @@ config PARTIAL_EMULATION
>           not been emulated to their complete functionality. Enabling this might
>           result in unwanted/non-spec compliant behavior.
> 
> +source "arch/arm/firmware/Kconfig"
> +
>  endmenu
> 
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index e4ad1ce851..8c696c2011 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
>  ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
>  endif
> +obj-y += firmware/
>  obj-$(CONFIG_TEE) += tee/
>  obj-$(CONFIG_HAS_VPCI) += vpci.o
> 
> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> new file mode 100644
> index 0000000000..817da745fd
> --- /dev/null
> +++ b/xen/arch/arm/firmware/Kconfig
> @@ -0,0 +1,13 @@
> +menu "Firmware Drivers"
> +
> +config SCMI_SMC
> +       bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
> +       default y
> +       help
> +         This option enables basic awareness for SCMI calls using SMC as
> +         doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
> +         compatible only). The value of "arm,smc-id" DT property from SCMI
> +         firmware node is used to trap and forward corresponding SCMI SMCs
> +         to firmware running at EL3, for calls coming from the hardware domain.
> +
> +endmenu
> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
> new file mode 100644
> index 0000000000..a5e4542666
> --- /dev/null
> +++ b/xen/arch/arm/firmware/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> new file mode 100644
> index 0000000000..62657308d6
> --- /dev/null
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> @@ -0,0 +1,166 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/firmware/scmi-smc.c
> + *
> + * ARM System Control and Management Interface (SCMI) over SMC
> + * Generic handling layer
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2024 NXP
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/firmware/scmi-smc.h>
> +
> +#define SCMI_SMC_ID_PROP   "arm,smc-id"
> +
> +static bool __ro_after_init scmi_support;
I don't understand the need for this variable. IMO it's useless, given that in next patch you do:

...
if ( scmi_is_enabled() )
    return scmi_handle_smc(regs);

return false;

which could simply be changed to:
...
return scmi_handle_smc(regs);

and the variable, functions for it, etc. could be removed which would simplify the code.

[...]

> +err:
CODING_STYLE: this should be indented with one space.

~Michal


