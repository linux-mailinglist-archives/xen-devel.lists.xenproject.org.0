Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A19FAB54
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 08:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862776.1274326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPdKz-0002S0-4n; Mon, 23 Dec 2024 07:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862776.1274326; Mon, 23 Dec 2024 07:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPdKz-0002Pi-1Y; Mon, 23 Dec 2024 07:58:49 +0000
Received: by outflank-mailman (input) for mailman id 862776;
 Mon, 23 Dec 2024 07:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7Xy=TQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tPdKx-0002Pc-2b
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 07:58:47 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2417::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb51b16a-c103-11ef-99a3-01e77a169b0f;
 Mon, 23 Dec 2024 08:58:44 +0100 (CET)
Received: from DM6PR08CA0051.namprd08.prod.outlook.com (2603:10b6:5:1e0::25)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Mon, 23 Dec
 2024 07:58:35 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::cf) by DM6PR08CA0051.outlook.office365.com
 (2603:10b6:5:1e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.20 via Frontend Transport; Mon,
 23 Dec 2024 07:58:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Mon, 23 Dec 2024 07:58:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Dec
 2024 01:58:32 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Dec 2024 01:58:30 -0600
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
X-Inumbo-ID: bb51b16a-c103-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2djVaDPLVBaf6GQdK7AhSBIIyUysPMeo6bImlMwGPBdloSQUKPJ8GT1gE/ARKr4XQwl+tU3/GejK3xMbjN/3B2lqGSGfnFba07R4WP89Vfemg8aPLmNKUdWnJhB5zaUokgt1E9q69SrVzV4HGt5dGXBHsgprQN2Wwc8f/BSbm5jXrzToptfy9x2k0HsCwtgWMf1nRgmWzWDWuqFAwDcnXW+B+WDgXcUQKFJn72GV3gxtjB7aAOH1/uvKBRuFrfRM2uu49d3xnuh2Y1JRsdtyigTYsw1QUpA7DI4kiqiiZbmQgDlOiEglez8gzGypCXBO5mQgcmp3/E62lnqe95IlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSNWnsO7qYRDox0AYIv661NFImBFH14dpdkcFo++nE8=;
 b=FzvlWfIbWOMGSe5qxGB9jpKmaRcghJ2T1OAit635rY2vashM3uat7/MeYj2bKzIonm6LTxW0epi6EJ74uvx3eirL8kfFoLV9kFUrD/MHZNugxojsdpRDa5FhPA7eQr9EzcHwbl0+3GVnHB75qGA6jO8nTnmEk2OX+yK+JnUn2R4grW1YpDU1gA8cwN9+kGmKH8lP/hhsuBT7l4dtBmdumj9/QK6Y5JX7pBG3O7r2BCCeiPtQA+s+5DjZUZNKoUrvlfjbvCkc6Vei6ROwwF8S4Ad5519smBxUCSxSLAy+w+x9lil906wv46bdN/kj6N+shfCso9NdF2MATdj6VCHA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSNWnsO7qYRDox0AYIv661NFImBFH14dpdkcFo++nE8=;
 b=CcFa4WW2BQvNImPljuTIco3UBvW46vlktt+3+Yudcme0bFX78s6pBEppynIoyM1zalFnUYoRqgfwreDEaVfoXyK6J0PUH2OIQjU/grWbSGUmU1XakXef09VLF2QuzjlBJVxf8DPQgoxca5JPDUwp0AIt+07zGl76xBOJ/luLYS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
Date: Mon, 23 Dec 2024 08:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Initialise memory type for struct kernel_info
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241220151941.4192864-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241220151941.4192864-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 909b3bcb-79a8-4741-3af3-08dd232799b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHREVmJoYXZHd0tKOXZreWVQQU8zYisrSk9ZQWhLeXlCcktzYytYL2FQOGJq?=
 =?utf-8?B?clZBRCtVd0JnNzZvQjR0MnZkdklaYWlJdy9NcnlvU0VNWTg2dlBvRVkrWUM1?=
 =?utf-8?B?YTJNbEd2eUFadGVSd3hlS0d5TkpUZkRMQlFraVJpc0hhQnFRUVNqVFRQNzFE?=
 =?utf-8?B?blpkK1l1U2xDdytSOTFpZmpoNmJ1SFFNSmVPajNsVFUrUlNMb3NiZ08xSDFO?=
 =?utf-8?B?WStad2JGc3VZZlJaZ1BtdzNDS1hNY09xaUl4eHVzemZuQlc2c3pBRkovaG1O?=
 =?utf-8?B?U00vTmxxZC9uQjEwYnlhWldJWWpRdGkwUTRyamxhYTRwVDd2dkJ1NFcxaW4y?=
 =?utf-8?B?Z0hGUitCN3RzUXU2NmNNaG1RdUQyWURTcVVCOUJvSFlXblRKNG5uWUpKb0dF?=
 =?utf-8?B?MUV2cGNSbjRIZFBFOUZPYTFJZFl3b3BCQ0o2WG1sQ0dlR2NSMGxEUW9xdEwv?=
 =?utf-8?B?alAvTVNIWVA4MU1BVTF4c2d6NmUyU3ZIVjJvMW8xcFJDczhWcFhjMmNPVjdU?=
 =?utf-8?B?c3o4UzM4ZlZzUHV3ZHJnZmJNWE9xQmVVd0VRdnpLOHFNdzJWOUhidFp0VlFl?=
 =?utf-8?B?eDloaWY1dWhoVGdGWE9GWnZwTzBGRnpsR2RNOTE3QnVHTHhEalBuYlVNa2ND?=
 =?utf-8?B?LzZlMFNkM243dkVkSmxIRHNtY3FaQ2RndFBYQUQ1TFJPOUYvWlo2Wkt1Vmdu?=
 =?utf-8?B?aEJpdGpDOTBEK0duVGVSVUNxR3ZOZDZUUTFlUlVLUW5yektWN1hqditRc2lM?=
 =?utf-8?B?Q1pmU09Id3JvR082MDBmTnZta3FnZWlxVjVINHZBTE9zTmlKa253V1QvemMy?=
 =?utf-8?B?V3BWbUZ2YVNYTWFpUHh3ZTNzeTZ4dWc5RW1iYzNlbHh6dncyTGhIeG1VNmV2?=
 =?utf-8?B?czZzZUovY2lzakpuZkVZamRzQ2R5anVybS9jUUNCVkVnS0pWUU5CaEgrMHdU?=
 =?utf-8?B?NmhES2pvNWI4SFpXY25qWEtBRFVkZUs2Z2wyY0JhWDF2MWltWWxmdUlMT0ll?=
 =?utf-8?B?NzNaeGVycmxPUkdjV0JMUWJmRExGUjVmbzVUSEJaNWdQZjFjSmVLdU53cUxx?=
 =?utf-8?B?eHBsaHJmaUpLelJxWEpkaitNd2FlenQxbE11enpHR1FFSGlHaHRpLyt0UDJM?=
 =?utf-8?B?VXk0TlAyeUdGMWVmQklPeFlaOFhndFdjamhRVEN3NThrRDdaeGJZLzE5V1Vv?=
 =?utf-8?B?MTkzenFjaGVpajRjMDFad1VRWE9meEUyQXhVdjlLTEJsMlloSjh5NlF4VHZF?=
 =?utf-8?B?bjF2UWZuZW43REh6VVd6bysyMGZqaUN3VFdmWUdMTzFuZTlwWmh4cHJvcnJq?=
 =?utf-8?B?WUh4WU9nSnFwTjQzT09MS3NGb1VYQnFtMGxCbHZqZ05WNUdpWHZiZzZ5eG52?=
 =?utf-8?B?NzhNc1BSVk9WUmdCL0FuTjBiNTZsMTF6TGlxZW1BTFArSUhZaUZXZWo1ajMw?=
 =?utf-8?B?TE04SXhCMzZ5NUNTZlhOcVc1R2dPUDBEMm1GbEIyY0tla0ZTQjJlMzM0VXd0?=
 =?utf-8?B?VFQwN3dlL2FseVYvbEIzYTBhSXFocEtWNnNDYlE3Kzl0U1lsNDZZSVhGWXFR?=
 =?utf-8?B?eVhEcTZRa05LbGw1ZTF3WFEvMFhEOEJVbzlVSnRUcXNFakRFZUlLL0ducVlZ?=
 =?utf-8?B?dkpXNzV4QVJYTWFwUUFLUmhzcmh1b2JjcmdHS2MvNW5sQm9ITGI5RERRUGtN?=
 =?utf-8?B?bEtYMXJEUmtzVDFwOTY4cGwyS0Q2bGpFcVFFRVFYV3ZpbWcrVm1zdkIwRzBq?=
 =?utf-8?B?OXdOWW4rRTI4OU4wZ3BoOWlxcG5uWnQrRTBKRlAzb2JnRjN4dzVJVnNwK2RQ?=
 =?utf-8?B?V203RWJWUHR2Y09Rb2hVa1o4U2dwUWdISUtqR1RhaSs4bzhkMWYzZjJxZTh3?=
 =?utf-8?B?NFhJY1cvZEtlcjdldnhlOXJOUnhBdlphekU0UlhzSDJKS040VmhHbW16YXYr?=
 =?utf-8?B?MmVzWktVQkVzZlQyNTAzVWNzV3VmOWRMMnZ2UklqN01Xa3VWWnpMd2grRVla?=
 =?utf-8?Q?MgyZraObs3vKzd5lSrLmen1C2ZfKbE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 07:58:34.4938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 909b3bcb-79a8-4741-3af3-08dd232799b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806



On 20/12/2024 16:19, Luca Fancellu wrote:
> 
> 
> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
> but forgot to update the 'struct kernel_info' initialiser, while
> it doesn't lead to failures because the field is not currently
> used while managing kernel_info structures, it's good to have it
> for completeness.
The last part "good to have it" does not sound like we need a Fixes tag.
I'm in two minds here. At the moment we do have some consistency because
we use and therefore initialize .type member only for bootinfo related structures.

You suggest to expand this also to kernel_info. But what about other places using
struct membanks that, after all, is a useful generic structure? One example you can find
is static struct shm_heap_banks in static-shmem.c for which you do not set a type. Another
example is allocate_memory() or find_host_extended_regions() where we have to convert gnttab
region into struct membanks and there is no need to use the type at all. So, do you suggest
we should initialize (explicitly) .type only for *meminfo based structures or all the structures
using struct membanks?

> 
> Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /memreserve/ ranges")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/include/asm/kernel.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 7e6e3c82a477..de3f945ae54c 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -92,7 +92,9 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>  }
> 
>  #ifdef CONFIG_STATIC_SHM
> -#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
> +#define KERNEL_INFO_SHM_MEM_INIT                \
> +    .shm_mem.common.max_banks = NR_SHMEM_BANKS, \
> +    .shm_mem.common.type = STATIC_SHARED_MEMORY,
>  #else
>  #define KERNEL_INFO_SHM_MEM_INIT
>  #endif
> @@ -100,6 +102,7 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>  #define KERNEL_INFO_INIT                        \
>  {                                               \
>      .mem.common.max_banks = NR_MEM_BANKS,       \
> +    .mem.common.type = MEMORY,                  \
>      KERNEL_INFO_SHM_MEM_INIT                    \
>  }
> 
> --
> 2.34.1
> 

~Michal



