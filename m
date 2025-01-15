Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D48A12942
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872912.1283910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6gS-0007pE-4m; Wed, 15 Jan 2025 16:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872912.1283910; Wed, 15 Jan 2025 16:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6gS-0007mT-1N; Wed, 15 Jan 2025 16:56:00 +0000
Received: by outflank-mailman (input) for mailman id 872912;
 Wed, 15 Jan 2025 16:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZO=UH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tY6gR-0007mH-20
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:55:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2413::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91335e55-d361-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 17:55:48 +0100 (CET)
Received: from PH8PR21CA0015.namprd21.prod.outlook.com (2603:10b6:510:2ce::12)
 by CH2PR12MB9460.namprd12.prod.outlook.com (2603:10b6:610:27f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 16:55:44 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::3b) by PH8PR21CA0015.outlook.office365.com
 (2603:10b6:510:2ce::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.8 via Frontend Transport; Wed,
 15 Jan 2025 16:55:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 16:55:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:55:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:55:42 -0600
Received: from [172.27.3.102] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 10:55:41 -0600
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
X-Inumbo-ID: 91335e55-d361-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cU6yn63JYUT2lhDwqiDcDqh06TD+gVaCAGsjiDctryCjXujfM2CH5dN6zl3ESkcUMdNyYpb1kRPOGaF1cHwaAuHj4IqKy91FQZGlwOZYg0ACq15p8CGXNjPx2qCnztm2WlaXe45z8iejQq3uIOC/sCOdu2kF3R/OHzl9Ky6lCYTAzIKH5/VvuGiXBYVjmAL4ykGeTgGyCRmYis7KM6CjWVGuHOph7TGtWpLZZmW4a5T9VTKXvh+x+dMo5/CoAF/G5KpyniyV6pFq2BrzPDCEw/agtBpek9eVpZ0jkZaWJJJ8y7FckjPVdudrg86BcYtFWSC+7AXjRibO5y0jFiEipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0PKYXo3UQpMtUn9vNyPhmzpYAnpUNlYmbDApzfUiow=;
 b=H+oAPymXIeohUBVJrO5XFEl/QfqSC0jxcgBvz6OqmdZo4Zc5IPlSpEufAeZfyQr6Fo1y15L5iABOelBucto1PhDxMp2IKMwxl19c3N0sn9B59sIh55eOtG2me1YdCNCF5mdMSwIHhxB0qIcqzUlflJDIAjGVhyydUuQeiYPFDGzcmwMFLIS6xoOiaYcYYLEVWM7efTdDrasNJlQmImdYYpNiGJ961too5Y10OB+4urJn9q8ylNR3Xr8aUpHhjs5H6jxy+ynhQ+vFKIxoWM+a0N9VWPcSpV3hghdqeFwmcGP8oRbv95m9EBStg2Ox/VIuIY6nVrUlX/etG2lXizjKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0PKYXo3UQpMtUn9vNyPhmzpYAnpUNlYmbDApzfUiow=;
 b=GInGRGM22YtHJm3mhlASjtOW9HSVnTcnvCm0usSXYh03QDKEf+ILDX/Yuf7QGvrMP61wWJqRVhTxabWYOgWe1xpgRPB/m2LH4Rs/7/8zD4sPKhG+KPPgXV71IlrZ6vcIENrfdHHI4S8Dg7yrv24J55w2DEgC+apHnutgmA+PpIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7aa994e5-2878-4dd0-ab2b-349dff44b478@amd.com>
Date: Wed, 15 Jan 2025 11:55:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] x86/hyperlaunch: add memory parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-14-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-14-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CH2PR12MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f748009-66ee-49fe-0245-08dd3585735d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkJ4SU0xb3hUUjQ1RDNZVDQ0eTRpbEN0MzBocFZhZVNJVEhQZkVPeEVtWm9m?=
 =?utf-8?B?N3dZSEZMU1EwUmFELzZmbnZ1cmdEdDQzSEh6MEtLRWNxQWVacjh4STFEcThq?=
 =?utf-8?B?dVhSbGQ4MlZhRkJLcGdJTlB6MC9xUXNpOWwxVzF4c3IwOWF4dEwvWWNNdVFk?=
 =?utf-8?B?K1ZEdkxUY04wcUlNVk5WbXVwN0l2cVFCWEk3RkxMbVBIVWZydTRSQit3YmR2?=
 =?utf-8?B?MmwxL1VtTnhVcHZrSlJTZnJyLzFxcHBBdVQ2YVZWeitHWlA0L3l5UDlkdlpn?=
 =?utf-8?B?Z3BDSzJldVhBTU5VTkZhOWl4QXV2a3oxdnl6WEU5dTFoeVA5V01pUGhFWWFs?=
 =?utf-8?B?ZFAzYVB0bmZBWlRQcWdqbHRQcER0by9MT2N3aS9BK1RLM0FMOUFmbEJnazAv?=
 =?utf-8?B?SXp5VUU3S1hob0REbkt4Z1V3NGZmNU50aE12dkRLT3JDSjQxWVNMNWZWZU5n?=
 =?utf-8?B?TGYyS1RpRThMZmpMQ2hBbEFkMkpyVCtGV29LaTIyRmpreTNQcVlPTXVEUlha?=
 =?utf-8?B?SzN4Rmp4akJoR1lpS2M0Q053dnRJVSs2bGN3MTZTNjZQeXNJTVAwV2hFNXcx?=
 =?utf-8?B?MDJNMFFwK21BTEN2YWlpM2RuMzZLdThoczVMQW1vYVhOOWIwTzNuU0M4WkhB?=
 =?utf-8?B?MEJ2bjN3TnNlMXkwcERjcE5rQnJyREpROVJyNVZhZ0xYd1Z0NmJlTkc2WFg1?=
 =?utf-8?B?WkJqdXdOZHJTbGh1T2toS3lQWFA1c3ZHOE1vcWQzdzVQc2lHTm1LbjErWVRH?=
 =?utf-8?B?eXRYaFMybzJtSnY5d1hQaTdadTBtditRcHVYcnJpdVJGcTZTcjV6SzRDYTg0?=
 =?utf-8?B?N0xYempuWVNoVWo1bVNabTlEc3ZTUldrdkduUUhMUnJtVFNHaklhMTJMbllm?=
 =?utf-8?B?SzBQMFd6bk5DTUIzcndrR2FkdG81TW5EWSsrdjBNb2VwT28vbnE5S2NhSm1s?=
 =?utf-8?B?MUErbnQwVUhyK2dYZHBDdFpncVNhb2hqTWtvdmswNTZiSVZtYkVIME9wQyt1?=
 =?utf-8?B?aWVSbjJPcGdMYkt6dkdqRzltK21rVXhZNjIwSGJHV0p6TFVVNmlIdXBIYzAr?=
 =?utf-8?B?WWJnWkYwSFlkZEh0TDE0RGVSREEzY3h5KzRueGdCZWtpbEVyNks3eUZlb3RC?=
 =?utf-8?B?b0FnWFBSK3poSFlCdkFzNCtUbWVTNDdXYjBEUDlCTDRnczVnNXFRVGo0WGJI?=
 =?utf-8?B?MENwaVJkSWZIanJacmI1YmpDSGxRdW9pc0pJOXNhOGFGZWxocE9DckZBUURJ?=
 =?utf-8?B?V2lZSjVyaHdZNEZHUFJ0N0NzV1RseFFESng3Y1lmVUd2dU1yZEZSTERyYWNX?=
 =?utf-8?B?T3JYdHpHRDVpRjJBS3REODlCRm16UU53RnMzY3k5ZDM2VmRuRXZ0czJ5S1pR?=
 =?utf-8?B?ajhiL0lJc0diblREUy80WGQrZjFWS1hsNDh1NEVSR2FTZUE2bnBuNXJPbU54?=
 =?utf-8?B?NGpTcnVQVmN1UFZocW5iUGx5RHFGT3FwdjkyNU8vWGNoTTY2UHFUbkJmV1pN?=
 =?utf-8?B?UnVTcDlsaXYyTFpxQnBuTFpWUC9WVE5iVC9CemtHbVVmSTY0NXZwc3FKVVRU?=
 =?utf-8?B?Qytqc0VjcmJNbFhnMDQ3VW9TQ1FQZ1hqSUdOcXg0RkpUS3VWMGF4eUpoL2p2?=
 =?utf-8?B?eTczUFVCd2Vib3F6T2Q2TXdNSmpvVkdBS0NyVi9QTnVDNHRXSEpsMmtHbUpp?=
 =?utf-8?B?cCt6SXUyMzNKZ0M3QzZMZHV2ZjRqY0kxbEMxYVhkT05XVVNKK2ZuSkV3WEcv?=
 =?utf-8?B?ckQ0L0s5RE5ISU5UV2J5WlIwQmNqcU9xYjJ2cWoyclliTE9IMjZZdUFuRGMv?=
 =?utf-8?B?TC95ZXpvelgrR3k3MnRQS3VaRmsreWRMSjh5VmZQNzJRU21teXNQeGpoNkpW?=
 =?utf-8?B?VUpSZU90cmx3SkdoQ2NnKzJtbW1ac2xaUS9vU2VTN0tDMHVsWGUwNi9RWCt1?=
 =?utf-8?B?MjlaT3k3L2w5ODJmdVE3TC80Y0ExNWV1ZzFEZXlxTk1SYmJsN2lxS3hHRU1k?=
 =?utf-8?Q?I/fIbXjmSxNqxg7shgnlPOulba+b/w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:55:43.7313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f748009-66ee-49fe-0245-08dd3585735d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9460

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Add three properties, memory, mem-min, and mem-max, to the domain node device
> tree parsing to define the memory allocation for a domain. All three fields are
> expressed in kb and written as a u64 in the device tree entries.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
> index db584ba78e92..aff1b8c3235d 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -6,6 +6,7 @@
>   #include <xen/init.h>
>   #include <xen/lib.h>
>   #include <xen/libfdt/libfdt.h>
> +#include <xen/sizes.h>
>   
>   #include <asm/bootinfo.h>
>   #include <asm/guest.h>
> @@ -113,6 +114,39 @@ static int __init process_domain_node(
>               else
>                   printk("PV\n");
>           }
> +        else if ( strncmp(prop_name, "memory", name_len) == 0 )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  memory: %ld kb\n", kb);
> +        }
> +        else if ( strncmp(prop_name, "mem-min", name_len) == 0 )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n", name);

s/memory/mem-min/

> +                return -EINVAL;
> +            }
> +            bd->min_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  min memory: %ld kb\n", kb);
> +        }
> +        else if ( strncmp(prop_name, "mem-max", name_len) == 0 )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n", name);

s/memory/mem-max/

With that,

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> +                return -EINVAL;
> +            }
> +            bd->max_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  max memory: %ld kb\n", kb);
> +        }
>       }
>   
>       fdt_for_each_subnode(node, fdt, dom_node)

