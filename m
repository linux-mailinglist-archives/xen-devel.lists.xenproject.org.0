Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8477BA07257
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867973.1279515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpLh-0005fW-Sg; Thu, 09 Jan 2025 10:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867973.1279515; Thu, 09 Jan 2025 10:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpLh-0005eU-Ob; Thu, 09 Jan 2025 10:01:09 +0000
Received: by outflank-mailman (input) for mailman id 867973;
 Thu, 09 Jan 2025 10:01:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjpQ=UB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tVpLg-0004y9-95
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:01:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2414::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4935b80-ce70-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 11:01:07 +0100 (CET)
Received: from SJ0PR13CA0186.namprd13.prod.outlook.com (2603:10b6:a03:2c3::11)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 10:01:01 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::be) by SJ0PR13CA0186.outlook.office365.com
 (2603:10b6:a03:2c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.7 via Frontend Transport; Thu, 9
 Jan 2025 10:01:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 10:01:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 04:01:00 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 04:00:59 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 9 Jan 2025 04:00:58 -0600
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
X-Inumbo-ID: a4935b80-ce70-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWAqqOv3zZI2rkQhG/PvaygEbYoS+uM3g4ZHg8IOEzegYgPaGiTC3S9tTNALgVMvnYaZmO1+P9BwgSUeltUZQwy+L2FcYTS5YgU4nbRIdbLn6TRF3+pjhb/4PI38t09/9mfHntxMEvQFeDwbMjL0OOive/oRwmRzxlD3Idezzwt2okiqDwAIIup89+yvUhvyHqFBaVc8AAfK6ivW3GubHVSwXTsbw5VRgSCRNYqp5S8CDF6mjBDS5KAgXOB5E8OqTAql2xTTcaUPIDQrS0Z1mhskCB5Tuuva8ynXrWs6+4ZpFVx2sDpteLpGAd3mbZKFwsdhNH80/y0bR9Uc6JdJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZpyhmLzNTo+oOcG9IB+u9cV3l+k4u2f3lkpiORxCAY=;
 b=kQ6ew2VhESilEaHz6KnLoOy6eHzasp8zrF4IiYfPAZox0k1+lQ9QfYYHM4+7PktPaaYUlggbHH1QU3VYtBJpgx0SWcKmX8l2/h34yur7/Mkk+80xrK0PWGM4V6RQFFgHL5mDmkE6ADQXI/Fw5bB2e+9LzEeI4QdqjvZRZXJCpOY/GasipTbBVTEEqbRyyM9z+qL4HUpEEURtj7H/VX+JG061FVd+xCamfF/j/yS16tqj3rrM2XjFfPKvozeXRdYsjJTLddyCl5O7zzSY99R/cMbsZZwZ1Da62GyJt43HfP1X4jqAm7CMM3yRdyKWT7YEVnmrvnea4KMwN12e5zTANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZpyhmLzNTo+oOcG9IB+u9cV3l+k4u2f3lkpiORxCAY=;
 b=KZX9QVI+kPEFtQTKZc4rkhbqtxK6pqs2MNWP3h6lsHZwEMDjjZZc/Z/3IKUS9tQtyPgCV7VbUCgoE0qpbwEjc9odcj1C5nzbyT8kQGVrbKPyFJtJfDDkDWZwCFYCef4WeMcyRb4gkdtpuQtLH+smv4s4fumF9dZ+Rz8Db66t82g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e9477b85-1c9a-4aa6-b7fe-90286fcd461b@amd.com>
Date: Thu, 9 Jan 2025 11:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20250109092816.1619834-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20250109092816.1619834-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 321041d1-9b83-4a9d-e7cb-08dd309485a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUhTQWNYbFhjS05xa2w0V2JLWVRJWlFmNTZjSTB2SHVtd2JrQXRyaUxTK0JQ?=
 =?utf-8?B?WDIyc1BCM0RhZlhDOWlDajZVYjhHUWR1QytIcDJrbG8zR2tZOVpVd2oyWWFh?=
 =?utf-8?B?c1RtVjdWMU5HcEg5WkNqSzltSFcxTHJPMy9HZU5LL3JsaTRFaEFhM2ZpM0pQ?=
 =?utf-8?B?ZWVIb0l1c2JBTE9MMUdsN1dKVzlZV2NJdVQrSnNJL0dLM1d0MldCUklFT0NF?=
 =?utf-8?B?OWQ0NDE3N1pUUXJxWWo2VldZR3lXUUpIS2lNb1lpOG5WMDRlMnR5NFJWY3RK?=
 =?utf-8?B?Y2p1Qm05RjRRNlN4eFh4RW1CS08ybVFBVmVQR1ZHU21oLzd1UWJCYzJzSGcw?=
 =?utf-8?B?c3B6bkN3Y0FaMnJPYzFVRUkyTU5TZnVRaUE5azBxRHc1S3ZqSSs4U2RjY3RR?=
 =?utf-8?B?Y1pUeGtaMmQzUUtnVzV2U3N4cVVhcU9scG1oSUJUQjZ3SGp4dFRyaStETmZO?=
 =?utf-8?B?dyt2SlNMMjBJWkVLUmFDa0dGMlloWHVwZEIyb210YU1OdjRvVllnalRqQkk0?=
 =?utf-8?B?cC93NXJpbU5yOFNOc2FSTStMdmw1VUdDVVpXSmZONTlTYzBudTdxNHNoczhr?=
 =?utf-8?B?QWpDNXBNWlNaSnk2OHN6Tjl5ZExNUUVsckFGVEpMSXhCRU1CR3FWZktxM0s3?=
 =?utf-8?B?UnJYUE5yQVkxdmdyaXlpK1Y1YmY1MnhwcjBuMS9BbExUVkhidXEwenM2R01R?=
 =?utf-8?B?dDh4QVhUWk1BNTZ3MDNTMDZwT0xQZXRaTWVEMlRHdW1XRmZrVjlDUkdmdnZO?=
 =?utf-8?B?NERWVHNHeFY3aXhkelRHRlM2Q2xEUlFad293dllxTUs5TkZPN2xUS1RTRk5s?=
 =?utf-8?B?NGFrRjFQNFdhTXNhM0ZXK0dkUzJhVUpJa3BUY2U2ZG5TS0dRa25Db2pIcS80?=
 =?utf-8?B?RktnUm9WKy93a0ViaGxmc0NxZlVaVEsyMEVrbnBvUVdlbld3UytnRTMrUzcy?=
 =?utf-8?B?NnpzcXZXYXFMQWhRZkJReU9MQXh1bFltT1FqbW1VdGQ4SUZWYW5MQUh3MC9U?=
 =?utf-8?B?YTg0ZzVJaXlMSDhDSFhEbEZHY1FJcXk5c0lDMElkdG9INUJ5aExDUXpqd0xr?=
 =?utf-8?B?UEVKSjMwRWZ3cnlOTys4dzc4SmdnVkw4R0NrQnRkb1JKN3A0WFNEUENHcHZv?=
 =?utf-8?B?bHhXbzUyNUNuYnFZZVplNFBqb1FNYkJlUXo1NVFTOWsyYlZZd2EwMWlDSUJG?=
 =?utf-8?B?eFhSU09tb1FQRWdDa3Z3MURTTnB5OW44WjduUytJdGRPcmNRamdwR1lWRzZZ?=
 =?utf-8?B?K3ZBa0R6RHVab0wwVURqUG96N3NuNWlySHBDaTFlUXRVVitZaGVYanltRGZx?=
 =?utf-8?B?bHlydFJSZ25obDlCMG9DNHAvTGwzcWhpaXpmNXZTWGpDUEZWNzViT2hCdGl2?=
 =?utf-8?B?ZXJDYlpEMDl1T2pkdEJlbng2em5HSk1TVW90YjdxbzFEbGVFcW54bngwM1Ni?=
 =?utf-8?B?K0ZuUWNBQnp2WEZBa0dWekZ2RiswQW83aEwxd2owVzJZVGJzNEFpeWhUYTgx?=
 =?utf-8?B?YXlsVHhRSGVnQ2hVZDRoTEdkYkN0ZE02eStQQk9PMjRxdVcrUmNSc0lycW41?=
 =?utf-8?B?bGNIYmFtQUlFR1lacTl3NE9SV3JqVzlqbmZwbXhSdkNPdHRIbE9NQ1lvY1B2?=
 =?utf-8?B?MjM1QTc5WHo4OVcxL2ZDdXdlS2EvV2pneE1Yd0ppb1RYSUd3QVhLZ3VYSFdk?=
 =?utf-8?B?VmZPNm1rcVdlcVRvS1NvVkNNTUVsNXFHNERBaGdqTEh2d2NTTDEwa0htVnpZ?=
 =?utf-8?B?SmhrTmlFeno4T21XT3ZURlBpTUNNUFFQTVFYUWlYSW11c2ZZK3VIcVNIR1hK?=
 =?utf-8?B?VFluR3BGbkhCUUdtK3lmOVllbzRWdDZIaDlsQTVVTThPbG5VWURSSW9WeWVS?=
 =?utf-8?B?NWt3WjV5QW4zdjVBSWFRYmlDRmlZbVpqcG8rWUhQOUtucW1vQlVuekFQaTlY?=
 =?utf-8?B?ZHl5ekNVNGxudS8xK01yaVphMVZlMjRIcGVsRldHTFNTMFl2WVBITlhEWFE2?=
 =?utf-8?Q?Y2G6BM/0N1t+cb5kEVuJQ0G08O1Ygo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 10:01:00.9967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321041d1-9b83-4a9d-e7cb-08dd309485a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958

Hi Luca,

Is this patch for 4.20? I would say so, therefore it should have "for-4.20" tag and Oleksii as release manager
should be CCed. Doing it now.

On 09/01/2025 10:28, Luca Fancellu wrote:
> 
> 
> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
> but forgot to update the 'struct kernel_info' initialiser, while
> it doesn't lead to failures because the field is not currently
> used while managing kernel_info structures, it's good to have it
> for completeness.
> 
> There are other instance of structures using 'struct membanks_hdr'
> that are dynamically allocated and don't fully initialise these
> fields, provide a static inline helper for that.
> 
> Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /memreserve/ ranges")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v1:
>  - Changed commit title and body msg
>  - initialised max_banks and type for all structures using 'struct membanks_hdr'
> 
> I didn't get why the fixes tag is wrong, but please feel free to
> correct it on commit or suggest the good one
It is ok.

> ---
> ---
>  xen/arch/arm/domain_build.c       | 13 ++++---------
>  xen/arch/arm/include/asm/kernel.h |  5 ++++-
>  xen/arch/arm/static-shmem.c       |  3 ++-
>  xen/include/xen/bootfdt.h         | 16 ++++++++++++++++
>  4 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b072a16249fe..9e3132fb21d8 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1039,7 +1039,7 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>       */
>      if ( is_hardware_domain(d) )
>      {
> -        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
> +        struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
>          /*
>           * Exclude the following regions:
>           * 1) Remove reserved memory
> @@ -1057,13 +1057,10 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>          gnttab->bank[0].start = kinfo->gnttab_start;
>          gnttab->bank[0].size = kinfo->gnttab_size;
> 
> -        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
> -                                             NR_MEM_BANKS);
> +        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
>          if ( !hwdom_free_mem )
>              goto fail;
> 
> -        hwdom_free_mem->max_banks = NR_MEM_BANKS;
> -
>          if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>                                       hwdom_free_mem, add_hwdom_free_regions) )
>              goto fail;
> @@ -1293,7 +1290,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>                                               struct membanks *ext_regions)
>  {
>      int res;
> -    struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
> +    struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
> 
>      /*
>       * Exclude the following regions:
> @@ -1374,12 +1371,10 @@ int __init make_hypervisor_node(struct domain *d,
>      }
>      else
>      {
> -        ext_regions = xzalloc_flex_struct(struct membanks, bank, NR_MEM_BANKS);
> +        ext_regions = membanks_xzalloc(NR_MEM_BANKS, RESERVED_MEMORY);
I'm a bit confused what is the expectations behind using different types of enum region_type, mostly because it can point to
different address spaces depending on the context. Above, you marked gnttab as RESERVED_MEMORY (I guess because this
region has already been found - but in fact it is still unused) and hwdom_free_mem as MEMORY. So I would at least expect
ext_regions to be of MEMORY type as well. After all both hwdom_free_mem and ext_regions contain
banks of unused/free memory (although former lists host memory while latter can also contain guest physical
memory). Could you please clarify the intended use?

~Michal


