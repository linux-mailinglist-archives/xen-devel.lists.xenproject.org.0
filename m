Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36AA9B83A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 21:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966853.1356932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u829s-0001Xg-46; Thu, 24 Apr 2025 19:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966853.1356932; Thu, 24 Apr 2025 19:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u829r-0001Ve-VN; Thu, 24 Apr 2025 19:22:51 +0000
Received: by outflank-mailman (input) for mailman id 966853;
 Thu, 24 Apr 2025 19:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQwv=XK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u829p-0001VY-Si
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 19:22:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fb60bc8-2141-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 21:22:47 +0200 (CEST)
Received: from PH7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::19)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 19:22:39 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::9d) by PH7P222CA0025.outlook.office365.com
 (2603:10b6:510:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 19:22:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 19:22:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 14:22:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 14:22:37 -0500
Received: from [172.20.75.239] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 14:22:36 -0500
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
X-Inumbo-ID: 7fb60bc8-2141-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cva3LCoe7JU29UebmOu4T9/UKaL11dtd7wMzVsF+wqJ45umr6ZulMPXnXnOL5r0Ii6st5BvEuTfnClFKEJFyqXZAFWjdfVR3BzxyJ5kExazdVh8FSICl4A4G1l0/CmugReXg29c36vCeDQJLcf8ABPOjqUU4PDYK39gQp0YijCBJC8PU2dO1Rh6kHEF6bdmNFxRFeyvWi7fSJAhQQo1yW2YI8u8nDvcgXkd/hE2CLRiVBlxctrJsNSFXuophVYVxpLWr/v+IctYhrKMXoTU3yBDp2vjUFE/bZuNrISw4FWfUOGwHoW2LcPe7VcnsIP65GFvg/+30x+2wtqzze0ougQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KP4TrP33evWVmeNHf/i/UQ1nScqOgEOYvQNG4bPKzPU=;
 b=fu5bCpZzcj8pq/6oNafej/nKUjIeRTJG4/NsbfCC9/E1GKkNWx4Puf0CkaHwwchyMl47PICiZISDLW2yrTC3WeLHvy2lfbkmoDLbb9NDX9B7PQ70DR0qlfX7YBD2V1MWm9yfXwYJPH9vPanH2fhbGWifbp/8OpNZ4WLIFf3wuKWWw22fso6MfonOXnEkQd292FVafIKNVdIxAhCgr139YHJixnVN95eiEyetxp7M5IwQCWnoUlSVGsoROT0s9avBRzm9cSf6Xrd8PTLvw9ozFT4oPKoLIh/2UjOi9/mHBqhzuVTAOQ3TsqjPuM7RmSumH9Acahhr1R5zUsvqDhCYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KP4TrP33evWVmeNHf/i/UQ1nScqOgEOYvQNG4bPKzPU=;
 b=n2RaW3SXr0mhHjCR8psoUVQnHFc4QS7dJgO/2my//CzQp3lA5PPvIgrIdL+6G3o4FIC7pXfXtMynbZysjdmwjDn0fgYX8yelIZcF9Rf93sKhiV8+a8b/O+jx13mlBYE7BinprFE/+w3Kn4bEjQom5pYyfZ4f5hgs4G1aNtWhlAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3d2555d7-83c0-438d-8d61-ac622a662384@amd.com>
Date: Thu, 24 Apr 2025 15:22:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
 <98c8e00a77800e8b1163ab1efa9a60f1bced0fb9.1745402473.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <98c8e00a77800e8b1163ab1efa9a60f1bced0fb9.1745402473.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 185cf162-d507-46c3-37e6-08dd83656066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0pFSEZXOW4zQWN4TlFmMkpvV2hHNUQyeVh0UWhOS2s2dTduWFo5aVZiVVZ5?=
 =?utf-8?B?eENscnRJMDRCZG1SeXJjNjA4bDBzMDcwYlhLcmcwaUNveEZoK3dwMlNnMk15?=
 =?utf-8?B?c3M3TlhzeUhrT1RDWUxFeGNWbUFQQ2pLR0dCNjdvRlM4WVBMSXNneFEyMWpZ?=
 =?utf-8?B?V0MzNmwra2drYktybkFoY1V2emU1UFBxNlFFVWhmQzAwUUNSbXdKa0pMcG9t?=
 =?utf-8?B?ZkNMTEVWTFBtZGxOSXc2UzcxM1V0WElwRTRKUWtQeDREMHN0YXU0NGpYSjJQ?=
 =?utf-8?B?T2NwM3EyU3YzWitBY1Nyb1BJWFkvSFl3WmxoRHFzRVFxdndMMEdXRXZVeUd1?=
 =?utf-8?B?eURnenRaOTlKbnV2S3B6NlllNmwwTVVrMUVHSnkwV3NLaEZ5M09KQ0IvMEkw?=
 =?utf-8?B?WTFYQUpab1hmUHlHQ25lc21TVUwvNnVSdE1NOUtQcWtqa0dGeTk5QTdUeWF6?=
 =?utf-8?B?R2FOZENXMlFHL2lKSkIweEh2bWNvS1phcFMyVlUrWnVIVmE2QzlJTmJxS2Q5?=
 =?utf-8?B?b1lKWnJmUUlBT1NhOVpFNGNBOGs3U2hqWWJyMEJTbDZwQWhhYWgrT050M29B?=
 =?utf-8?B?MGpHVGFxWHFDN0dsVVF5VkZSbHJhNlFRSVBhODhMRWZoZnVRalpwdU93eUdY?=
 =?utf-8?B?U0RQelp0SUJ0eU04YWhyWEdMS1pNV29zMjNaL1BVcGFtZFpjODBPR1ptMFg4?=
 =?utf-8?B?ZXZEekx3eEVRVXJ4YW5EakhSL2ZQcE5hMFJhSkpRWUdkOUgwTG4zcUM3bTEr?=
 =?utf-8?B?QkN3L1Q3eGF6Mk5vaC9ZT3NxMnBMbEdZN0p3SGxuN1dvWTJBdTdlb0J1amFj?=
 =?utf-8?B?ZW1yQUdmN3ErZ1BrbkxXd2xwbEV2SUExRytxQU82bWJQS1BUVVpZL3c3ZG9F?=
 =?utf-8?B?WldpeVFocG5QSW9qS0FJNzNsaVZDeFliajZLanp2OXJ3Zk1kcXJSQlhJdVZD?=
 =?utf-8?B?MGVmSmpIWjhIM3lPU01ScTJGeDJGNW9LNXdhb0JGV0hiNW95dnJ1cWxxcmc2?=
 =?utf-8?B?aFo1Tjd1RnQ2NVllUmx4UlJvQURqVkp3MEFtbHlUdlpEcHpMc1I1UGdFQ2Nj?=
 =?utf-8?B?YVBCTHVtZDU2ZEJ2cVhQN3lwdWFpWGJNbC9wZ2FtblllbTJlK2FGaUlQTWpW?=
 =?utf-8?B?MnJ2RWtTcWpZei9QNlVEdlVFakwvUkRPYUJKSjhHdlJRMDFNUXhLR1hOMjQz?=
 =?utf-8?B?U3NaUFFxZFEyNHcyVDh3SDhMaHhJcUhia3E2NHgvTCtHREFYOUh5RUp6cVdX?=
 =?utf-8?B?aTR1UHgxS2dqOURySEExUUxqTlBDUHdta0xGbjJzWVR6Z2ZsT0NNSW5kTkRF?=
 =?utf-8?B?VVAvaVFqL3dWQmRXZlVzdnZxVjJmczc1MFpnWXNPZzhCZnJJc3FKVWdYaXJT?=
 =?utf-8?B?a3M4bnVpWHZJUjE1TldqenhLQ3dyNDl1RE5WWVJuVHNPUGxjZVgwS1dRbjlx?=
 =?utf-8?B?THpWNmd1S3hETXVac2dMdm5CUk9Bcm9qV2plQWVzQjNSbUhuNFlQZG12Ym5m?=
 =?utf-8?B?OURMZU0rM1k0OUl1bVZWRzJuRVEwY01LOGNrYTdBOURmRE5iVVkxRHRQMVNY?=
 =?utf-8?B?a1dGdXhla2k2RlJiYXJGUVExbEIrcm13UlVnTit1dU1WallodU1IY2RFSlNZ?=
 =?utf-8?B?cWVpbU95b2JUVmY1R00vNEF5QXo5NUNQR1d0aFpQdS9vdWlwOVY5anBtVFd4?=
 =?utf-8?B?V29yQlJtZm1uYXpvVnYrMDJ6U3RrZVl3aHFmam9FVEVjOEJMc0hJeUt2WnZF?=
 =?utf-8?B?NElReVpUZThJckVWaGN2dkpkRk9xVEMvdVo5M3VIdjVxVDhkSitlMnlGOXRn?=
 =?utf-8?B?UXlIekJHNjArdEFGVWIxSWtxeEJ4Mlk5c254T3cwaklyS1E1L0krZnM1UHJm?=
 =?utf-8?B?WHBGVzVUU2pYWW1KT3N1dnVuR3Q5MndEMW5xSENGMGp2Rkp6OWIvc0VGSGs5?=
 =?utf-8?B?YkdnWGFxeG8rNGorZHlOWXZpeXBtcHI0UUlqVW5LekpQUXJuck1xS0E2OXRa?=
 =?utf-8?B?ZElZdGMvYm9NSklpcnpLRzJpYVB4MVVkU2lLN3RyMUQzVTJFV0R6ZVM1TndJ?=
 =?utf-8?B?RGk3YklzNWFCdCtWV284MWhpQmFVS2VkaXRFQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:22:38.7319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 185cf162-d507-46c3-37e6-08dd83656066
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198

On 4/23/25 07:08, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Renesas R-Car Gen4 PCI host controller, specifically
> targeting the S4 and V4H SoCs. The implementation includes configuration
> read/write operations for both root and child buses. For accessing the
> child bus, iATU is used for address translation.

In a system with dom0, I assume dom0 programs the iATU, and would do so
before issuing any PHYSDEVOP_pci_device_add hypercalls or PCI config
space accesses. Is that a correct assumption? If so, what is the use
case for iATU initialization in Xen? E.g. is it to guard against a
misconfigured or broken dom0? Do different iATU settings need to be
applied when running as a Xen guest vs not?

Further, is this driver sufficient to initialize the PCI controller
without dom0 involvement (e.g. to enable dom0less PCI passthrough)?

These would all be valid use cases IMO, but I would just like to
understand the rationale.

> 
> Code common to all DesignWare PCI host controllers is located in a
> separate file to allow for easy reuse in other DesignWare-based PCI
> host controllers.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v3->v4:
> * no changes
> 
> v2->v3:
> * move priv allocation to dw_pcie_host_probe
> 
> v1->v2:
> * move designware code in a separate file
> ---
>  xen/arch/arm/pci/Makefile         |   2 +
>  xen/arch/arm/pci/pci-designware.c | 403 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-designware.h | 102 ++++++++
>  xen/arch/arm/pci/pci-host-rcar4.c | 103 ++++++++
>  4 files changed, 610 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-designware.c
>  create mode 100644 xen/arch/arm/pci/pci-designware.h
>  create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index 1d045ade01..ca6135e282 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -4,3 +4,5 @@ obj-y += pci-host-generic.o
>  obj-y += pci-host-common.o
>  obj-y += ecam.o
>  obj-y += pci-host-zynqmp.o
> +obj-y += pci-designware.o
> +obj-y += pci-host-rcar4.o
> diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-designware.c
> new file mode 100644
> index 0000000000..dcbd07ced3
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -0,0 +1,403 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c

Linux drivers/pci/controller/dwc/pcie-designware.c ?

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */

Please use SPDX (see CODING_STYLE) here and in the other two new files.

> +
> +#include <xen/delay.h>
> +#include <asm/io.h>
> +
> +#include "pci-designware.h"
> +/**
> + * upper_32_bits - return bits 32-63 of a number
> + * @n: the number we're accessing
> + *
> + * A basic shift-right of a 64- or 32-bit quantity.  Use this to suppress
> + * the "right shift count >= width of type" warning when that quantity is
> + * 32-bits.
> + */
> +#define upper_32_bits(n) ((uint32_t)(((n) >> 16) >> 16))
> +
> +/**
> + * lower_32_bits - return bits 0-31 of a number
> + * @n: the number we're accessing
> + */
> +#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffff))

This constant needs a U suffix

> +
> +static int dw_pcie_read(void __iomem *addr, int size, uint32_t *val)
> +{
> +    if ( !IS_ALIGNED((uintptr_t)addr, size) )
> +    {
> +        *val = 0;
> +        return PCIBIOS_BAD_REGISTER_NUMBER;

The callers of dw_pcie_{read,write} below don't appear to do much (other
than printk) about the error returned. Please see
docs/process/coding-best-practices.pandoc regarding error handling.

> +    }
> +
> +    if ( size == 4 )
> +        *val = readl(addr);
> +    else if ( size == 2 )
> +        *val = readw(addr);
> +    else if ( size == 1 )
> +        *val = readb(addr);
> +    else
> +    {
> +        *val = 0;
> +        return PCIBIOS_BAD_REGISTER_NUMBER;
> +    }
> +
> +    return PCIBIOS_SUCCESSFUL;
> +}
> +
> +static int dw_pcie_write(void __iomem *addr, int size, uint32_t val)
> +{
> +    if ( !IS_ALIGNED((uintptr_t)addr, size) )
> +        return PCIBIOS_BAD_REGISTER_NUMBER;
> +
> +    if ( size == 4 )
> +        writel(val, addr);
> +    else if ( size == 2 )
> +        writew(val, addr);
> +    else if ( size == 1 )
> +        writeb(val, addr);
> +    else
> +        return PCIBIOS_BAD_REGISTER_NUMBER;
> +
> +    return PCIBIOS_SUCCESSFUL;
> +}
> +
> +static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge, uint32_t reg,
> +                                 size_t size)
> +{
> +    void __iomem *addr = bridge->cfg->win + reg;
> +    uint32_t val;
> +
> +    dw_pcie_read(addr, size, &val);
> +    return val;
> +}
> +
> +static void dw_pcie_write_dbi(struct pci_host_bridge *bridge, uint32_t reg,
> +                              size_t size, uint32_t val)
> +{
> +    void __iomem *addr = bridge->cfg->win + reg;
> +
> +    dw_pcie_write(addr, size, val);
> +}
> +
> +static uint32_t dw_pcie_readl_dbi(struct pci_host_bridge *bridge, uint32_t reg)
> +{
> +    return dw_pcie_read_dbi(bridge, reg, sizeof(uint32_t));
> +}
> +
> +static void dw_pcie_writel_dbi(struct pci_host_bridge *pci, uint32_t reg,
> +                               uint32_t val)
> +{
> +    dw_pcie_write_dbi(pci, reg, sizeof(uint32_t), val);
> +}
> +
> +static void dw_pcie_read_iatu_unroll_enabled(struct pci_host_bridge *bridge)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    uint32_t val;
> +
> +    val = dw_pcie_readl_dbi(bridge, PCIE_ATU_VIEWPORT);
> +    if ( val == 0xffffffff )

This constant needs a U suffix

> +        priv->iatu_unroll_enabled = true;
> +
> +    printk(XENLOG_DEBUG "%s iATU unroll: %sabled\n",

XENLOG_G_DEBUG

> +           dt_node_full_name(bridge->dt_node),
> +           priv->iatu_unroll_enabled ? "en" : "dis");
> +}
> +
> +static uint32_t dw_pcie_readl_atu(struct pci_host_bridge *pci, uint32_t reg)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    int ret;
> +    uint32_t val;
> +
> +    ret = dw_pcie_read(priv->atu_base + reg, 4, &val);
> +    if ( ret )
> +        printk(XENLOG_ERR "Read ATU address failed\n");

XENLOG_G_ERR

> +
> +    return val;
> +}
> +
> +static void dw_pcie_writel_atu(struct pci_host_bridge *pci, uint32_t reg,
> +                               uint32_t val)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    int ret;
> +
> +    ret = dw_pcie_write(priv->atu_base + reg, 4, val);
> +    if ( ret )
> +        printk(XENLOG_ERR "Write ATU address failed\n");

XENLOG_G_ERR

> +}
> +
> +static uint32_t dw_pcie_readl_ob_unroll(struct pci_host_bridge *pci,
> +                                        uint32_t index, uint32_t reg)
> +{
> +    uint32_t offset = PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
> +
> +    return dw_pcie_readl_atu(pci, offset + reg);
> +}
> +
> +static void dw_pcie_writel_ob_unroll(struct pci_host_bridge *pci,
> +                                     uint32_t index, uint32_t reg, uint32_t val)
> +{
> +    uint32_t offset = PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
> +
> +    dw_pcie_writel_atu(pci, offset + reg, val);
> +}
> +
> +static uint32_t dw_pcie_enable_ecrc(uint32_t val)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +
> +static void dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
> +                                             uint8_t func_no, int index,
> +                                             int type, uint64_t cpu_addr,
> +                                             uint64_t pci_addr, uint64_t size)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    uint32_t retries, val;
> +    uint64_t limit_addr = cpu_addr + size - 1;
> +
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_BASE,
> +                             lower_32_bits(cpu_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_BASE,
> +                             upper_32_bits(cpu_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_LIMIT,
> +                             lower_32_bits(limit_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_LIMIT,
> +                             upper_32_bits(limit_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_TARGET,
> +                             lower_32_bits(pci_addr));
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
> +                             upper_32_bits(pci_addr));
> +    val = type | PCIE_ATU_FUNC_NUM(func_no);
> +    val = upper_32_bits(size - 1) ? val | PCIE_ATU_INCREASE_REGION_SIZE : val;
> +    if ( priv->version == 0x490A )
> +        val = dw_pcie_enable_ecrc(val);
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, val);
> +    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
> +                             PCIE_ATU_ENABLE);
> +
> +    /*
> +     * Make sure ATU enable takes effect before any subsequent config
> +     * and I/O accesses.
> +     */
> +    for ( retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
> +    {
> +        val = dw_pcie_readl_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2);
> +        if ( val & PCIE_ATU_ENABLE )
> +            return;
> +
> +        mdelay(LINK_WAIT_IATU);
> +    }

dw_pcie_child_{map_bus,config_read,config_write}, and thus
dw_pcie_prog_outbound_atu{_unroll}, would potentially be called on every
guest PCI access, where the d->pci_lock may be held. It doesn't seem
appropriate to have a busy-wait such as this in that code path.

If the busy-wait is necessary, then perhaps iATU configuration should
happen during init/probe (as your FIXME note below suggests), not as a
consequence of guest PCI access.

Same comment applies below.

> +    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");

XENLOG_G_ERR

> +}
> +
> +static void __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
> +                                        uint8_t func_no, int index, int type,
> +                                        uint64_t cpu_addr, uint64_t pci_addr,
> +                                        uint64_t size)
> +{
> +    struct dw_pcie_priv *priv = pci->priv;
> +    uint32_t retries, val;
> +
> +    if ( priv->iatu_unroll_enabled )
> +    {
> +        dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type, cpu_addr,
> +                                         pci_addr, size);
> +        return;
> +    }
> +
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
> +                       PCIE_ATU_REGION_OUTBOUND | index);
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE, lower_32_bits(cpu_addr));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE, upper_32_bits(cpu_addr));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT, lower_32_bits(cpu_addr + size - 1));
> +    if ( priv->version >= 0x460A )
> +        dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_LIMIT,
> +                           upper_32_bits(cpu_addr + size - 1));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET, lower_32_bits(pci_addr));
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET, upper_32_bits(pci_addr));
> +    val = type | PCIE_ATU_FUNC_NUM(func_no);
> +    val = ((upper_32_bits(size - 1)) && (priv->version >= 0x460A))
> +              ? val | PCIE_ATU_INCREASE_REGION_SIZE
> +              : val;
> +    if ( priv->version == 0x490A )
> +        val = dw_pcie_enable_ecrc(val);
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val);
> +    dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
> +
> +    /*
> +     * Make sure ATU enable takes effect before any subsequent config
> +     * and I/O accesses.
> +     */
> +    for ( retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
> +    {
> +        val = dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
> +        if ( val & PCIE_ATU_ENABLE )
> +            return;
> +
> +        mdelay(LINK_WAIT_IATU);
> +    }> +    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");

XENLOG_G_ERR

> +}
> +
> +static void dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int index,
> +                                      int type, uint64_t cpu_addr,
> +                                      uint64_t pci_addr, uint64_t size)
> +{
> +    __dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_addr, size);
> +}
> +
> +void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int version)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +
> +    priv->version = version;
> +}
> +
> +void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
> +                                    pci_sbdf_t sbdf, uint32_t where)
> +{
> +    uint32_t busdev;
> +
> +    busdev = PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn)) |
> +             PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
> +
> +    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
> +    dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                              PCIE_ATU_TYPE_CFG0, bridge->child_cfg->phys_addr,
> +                              busdev, bridge->child_cfg->size);

Does iATU configuration really need to happen on every guest PCI access?

> +
> +    return bridge->child_cfg->win + where;
> +}
> +
> +int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                              uint32_t reg, uint32_t len, uint32_t *value)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    int ret;
> +
> +    /*
> +     * FIXME: we cannot read iATU settings at the early initialization
> +     * (probe) as the host's HW is not yet initialized at that phase.
> +     * This read operation is the very first thing Domain-0 will do
> +     * during its initialization, so take this opportunity and read
> +     * iATU setting now.
> +     */
> +    if ( unlikely(!priv->iatu_unroll_initilized) )
> +    {
> +        dw_pcie_read_iatu_unroll_enabled(bridge);
> +        priv->iatu_unroll_initilized = true;
> +    }
> +
> +    ret = pci_generic_config_read(bridge, sbdf, reg, len, value);
> +    if ( !ret && (priv->num_viewport <= 2) )
> +        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                                  PCIE_ATU_TYPE_IO,
> +                                  bridge->child_cfg->phys_addr, 0,
> +                                  bridge->child_cfg->size);
> +
> +    return ret;
> +}
> +
> +int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                               uint32_t reg, uint32_t len, uint32_t value)
> +{
> +    struct dw_pcie_priv *priv = bridge->priv;
> +    int ret;
> +
> +    ret = pci_generic_config_write(bridge, sbdf, reg, len, value);
> +    if ( !ret && (priv->num_viewport <= 2) )
> +        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
> +                                  PCIE_ATU_TYPE_IO,
> +                                  bridge->child_cfg->phys_addr, 0,
> +                                  bridge->child_cfg->size);
> +    return ret;
> +}
> +
> +bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
> +                                                 struct pci_host_bridge *bridge,
> +                                                 uint64_t addr)
> +{
> +    struct pci_config_window *cfg = bridge->child_cfg;
> +
> +    /*
> +     * We do not want ECAM address space to be mapped in Domain-0's p2m,
> +     * so we can trap access to it.
> +     */
> +    return cfg->phys_addr != addr;
> +}
> +
> +struct pci_host_bridge *__init
> +dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
> +                   const struct pci_ecam_ops *ops,
> +                   const struct pci_ecam_ops *child_ops)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct dw_pcie_priv *priv;
> +
> +    paddr_t atu_phys_addr;
> +    paddr_t atu_size;
> +    int atu_idx, ret;
> +
> +    bridge = pci_host_common_probe(dev, ops, child_ops);
> +    if ( IS_ERR(bridge) )
> +        return bridge;
> +
> +    priv = xzalloc_bytes(sizeof(struct dw_pcie_priv));

xzalloc(struct dw_pcie_priv) ?

> +    if ( !priv )
> +        return ERR_PTR(-ENOMEM);
> +
> +    bridge->priv = priv;
> +
> +    atu_idx = dt_property_match_string(dev, "reg-names", "atu");
> +    if ( atu_idx < 0 )
> +    {
> +        printk(XENLOG_ERR "Cannot find \"atu\" range index in device tree\n");
> +        return ERR_PTR(atu_idx);
> +    }
> +    ret = dt_device_get_address(dev, atu_idx, &atu_phys_addr, &atu_size);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "Cannot find \"atu\" range in device tree\n");
> +        return ERR_PTR(ret);
> +    }
> +    printk("iATU at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", atu_phys_addr,
> +           atu_phys_addr + atu_size - 1);
> +    priv->atu_base = ioremap_nocache(atu_phys_addr, atu_size);
> +    if ( !priv->atu_base )
> +    {
> +        printk(XENLOG_ERR "iATU ioremap failed\n");
> +        return ERR_PTR(ENXIO);
> +    }
> +
> +    if ( !dt_property_read_u32(dev, "num-viewport", &priv->num_viewport) )
> +        priv->num_viewport = 2;
> +
> +    /*
> +     * FIXME: we cannot read iATU unroll enable now as the host bridge's
> +     * HW is not yet initialized by Domain-0: leave it for later.
> +     */

Is there a plan to address this?

> +
> +    printk(XENLOG_INFO "%s number of view ports: %d\n", dt_node_full_name(dev),
> +           priv->num_viewport);
> +
> +    return bridge;
> +}
> diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-designware.h
> new file mode 100644
> index 0000000000..a15ba9a329
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-designware.h
> @@ -0,0 +1,102 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/pci.h>
> +#include <xen/init.h>
> +
> +#ifndef __PCI_DESIGNWARE_H__
> +#define __PCI_DESIGNWARE_H__
> +
> +#define PCIBIOS_SUCCESSFUL              0x00
> +#define PCIBIOS_BAD_REGISTER_NUMBER     0x87

Could you use existing error code definitions instead of introducing new
ones?

> +
> +#define PCIE_ATU_VIEWPORT               0x900
> +#define PCIE_ATU_REGION_OUTBOUND        0
> +#define PCIE_ATU_CR1                    0x904
> +#define PCIE_ATU_INCREASE_REGION_SIZE   BIT(13, UL)
> +#define PCIE_ATU_CR2                    0x908
> +#define PCIE_ATU_ENABLE                 BIT(31, UL)
> +#define PCIE_ATU_LOWER_BASE             0x90C
> +#define PCIE_ATU_UPPER_BASE             0x910
> +#define PCIE_ATU_LIMIT                  0x914
> +#define PCIE_ATU_LOWER_TARGET           0x918
> +#define PCIE_ATU_UPPER_TARGET           0x91C
> +#define PCIE_ATU_UPPER_LIMIT            0x924
> +
> +#define PCIE_ATU_REGION_INDEX1  0x1
> +#define PCIE_ATU_TYPE_IO        0x2
> +#define PCIE_ATU_TYPE_CFG0      0x4
> +
> +#define FIELD_PREP(_mask, _val) \
> +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> +
> +#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), x)
> +#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), x)
> +#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), x)

Parenthesis around (x)

> +
> +/* Register address builder */
> +#define PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(region) \
> +    ((region) << 9)
> +
> +/*
> + * iATU Unroll-specific register definitions
> + * From 4.80 core version the address translation will be made by unroll
> + */
> +#define PCIE_ATU_UNR_REGION_CTRL1       0x00
> +#define PCIE_ATU_UNR_REGION_CTRL2       0x04
> +#define PCIE_ATU_UNR_LOWER_BASE         0x08
> +#define PCIE_ATU_UNR_UPPER_BASE         0x0C
> +#define PCIE_ATU_UNR_LOWER_LIMIT        0x10
> +#define PCIE_ATU_UNR_LOWER_TARGET       0x14
> +#define PCIE_ATU_UNR_UPPER_TARGET       0x18
> +#define PCIE_ATU_UNR_UPPER_LIMIT        0x20
> +
> +#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
> +
> +/* Parameters for the waiting for iATU enabled routine */
> +#define LINK_WAIT_MAX_IATU_RETRIES      5
> +#define LINK_WAIT_IATU                  9
> +
> +struct dw_pcie_priv {
> +    uint32_t num_viewport;
> +    bool iatu_unroll_initilized;
> +    bool iatu_unroll_enabled;
> +    void __iomem *atu_base;
> +    unsigned int version;
> +};
> +
> +void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int version);
> +
> +void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
> +                                    pci_sbdf_t sbdf, uint32_t where);
> +
> +int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                              uint32_t reg, uint32_t len, uint32_t *value);
> +
> +int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                               uint32_t reg, uint32_t len, uint32_t value);
> +
> +bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
> +                                                 struct pci_host_bridge *bridge,
> +                                                 uint64_t addr);
> +
> +struct pci_host_bridge *__init
> +dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
> +                   const struct pci_ecam_ops *ops,
> +                   const struct pci_ecam_ops *child_ops);
> +#endif /* __PCI_DESIGNWARE_H__ */
> diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-rcar4.c
> new file mode 100644
> index 0000000000..cae1b4254d
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-rcar4.c
> @@ -0,0 +1,103 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */> +
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +
> +#include <asm/device.h>
> +#include <asm/io.h>
> +#include <asm/pci.h>
> +
> +#include "pci-designware.h"
> +
> +#define RCAR4_DWC_VERSION       0x520A
> +
> +/*
> + * PCI host bridges often have different ways to access the root and child
> + * bus config spaces:
> + *   "dbi"   : the aperture where root port's own configuration registers
> + *             are available.
> + *   "config": child's configuration space
> + *   "atu"   : iATU registers for DWC version 4.80 or later
> + */
> +static int __init rcar4_cfg_reg_index(struct dt_device_node *np)
> +{
> +    return dt_property_match_string(np, "reg-names", "dbi");
> +}
> +
> +static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
> +{
> +    return dt_property_match_string(np, "reg-names", "config");
> +}
> +
> +/* ECAM ops */
> +const struct pci_ecam_ops rcar4_pcie_ops = {
> +    .bus_shift  = 20,
> +    .cfg_reg_index = rcar4_cfg_reg_index,
> +    .pci_ops    = {
> +        .map_bus                = pci_ecam_map_bus,
> +        .read                   = pci_generic_config_read,
> +        .write                  = pci_generic_config_write,
> +        .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
> +    }
> +};
> +
> +const struct pci_ecam_ops rcar4_pcie_child_ops = {
> +    .bus_shift  = 20,
> +    .cfg_reg_index = rcar4_child_cfg_reg_index,
> +    .pci_ops    = {
> +        .map_bus                = dw_pcie_child_map_bus,
> +        .read                   = dw_pcie_child_config_read,
> +        .write                  = dw_pcie_child_config_write,
> +        .need_p2m_hwdom_mapping = dw_pcie_child_need_p2m_hwdom_mapping,
> +    }
> +};
> +
> +static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] = {
> +    { .compatible = "renesas,r8a779f0-pcie" },
> +    { .compatible = "renesas,r8a779g0-pcie" },
> +    {},
> +};
> +
> +static int __init pci_host_generic_probe(struct dt_device_node *dev,
> +                                         const void *data)

It's not really a "generic" probe... How about naming the function
pci_host_rcar4_probe ?

> +{
> +    struct pci_host_bridge *bridge;
> +
> +    bridge = dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
> +                                &rcar4_pcie_child_ops);
> +
> +    dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
> +
> +    return 0;
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
> +.dt_match = rcar4_pcie_dt_match,
> +.init = pci_host_generic_probe,
> +DT_DEVICE_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


