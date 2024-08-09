Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AE94CFBB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 14:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774681.1185121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scOJX-0005Ww-JV; Fri, 09 Aug 2024 12:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774681.1185121; Fri, 09 Aug 2024 12:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scOJX-0005VL-Gu; Fri, 09 Aug 2024 12:01:47 +0000
Received: by outflank-mailman (input) for mailman id 774681;
 Fri, 09 Aug 2024 12:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3Rt=PI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1scOJW-0005R8-2K
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 12:01:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2418::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24aa99bf-5647-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 14:01:43 +0200 (CEST)
Received: from BN0PR04CA0200.namprd04.prod.outlook.com (2603:10b6:408:e9::25)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 12:01:39 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::ae) by BN0PR04CA0200.outlook.office365.com
 (2603:10b6:408:e9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Fri, 9 Aug 2024 12:01:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 12:01:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 07:01:38 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 9 Aug 2024 07:01:37 -0500
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
X-Inumbo-ID: 24aa99bf-5647-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmwO9p2qUnOK8klfbjzof9TC3oEdpYjNnSNkKxUo8yvV7fJ79irHIDRRZw/wjpAqiDq7OShucafRrIUrQl36dZtdfm+AU0QgiUYZ5s1jGd049Z+pi4ieX5ZDWxmaQYZE8If3FuEapnUycyp7R1SLg1FnteVqsBXsWzH0rkIQNDLeqYazaqp4mkweabBPNhwVoQgFUneYOnbpLXqP0CZLBnfbxSy1WYzDSSuTAOZ62BYld25nj3/6LLM7KzO6gF7ty6GOJp0aokAgTAtkaEtJBmV3Le3ZIjiwmoF4RLl2yyJZ/k9yKJYgC93Qg38HiT/SY+7AkHCSx0YhYIHsugmYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3drCeaBQ0zyexRbZtgHyzy7lkzVED4F8scqv1cCEWs=;
 b=V/rkfjuwYMit0jkcE4+5/ZTAfQyaSQmTqCru8sc+tsn38ex4OGSaKoxNmGJzvxxKBrxFxx95XlEA5UFMhdnWZnPYPnloDYllFttfhWZxdqZ+OVlS0rUCKKL79DfZMWyte2/owpT5HmPGAZQsi1VU70XKdC5bOvrisngdNHROT333pt2/+Cj6bfclRwd9XnSA8fQvRuGJ3uZbqPTmfpjQ8VJv05kuNf+jjZSzoOUhaXOnFsunsIOKdttPpw7kb+8GLfqpFK6F4IyzgGwCzfumbdEXlqswevw5c3iCBlxFHiCZR8yl5aXMhfGPqJvLPQBxSW+aQfP5OLg7TJFPQhZMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3drCeaBQ0zyexRbZtgHyzy7lkzVED4F8scqv1cCEWs=;
 b=1yrTXos0LvrxA5WX9N0uf2MhJeaE4Q8hwcFApOdIOfZPJatRZaXMKJ4zAFQ8aoM6zBpRHL+NbYrGeESr5hPY12e9MTFm9Bkj56TocAWYjYoX88tTzOqplUKQOcM1x9EDteaePUCBGr76o2ZqWya+x+7N0vUNjm9Y8L444l7Zegs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8d1e7fbc-1220-4e09-bd99-eb8a4a17ea06@amd.com>
Date: Fri, 9 Aug 2024 14:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen: arm: Add a new helper update_boot_mapping()
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-2-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240808120936.3299937-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b033cb-3d4d-4f22-01fb-08dcb86b06cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVgvRUFMekh6U0NOcWgzUUpBMGRMU3p1cUlXM2ZLU2hnL21wc1d0alpaTzA2?=
 =?utf-8?B?MTNHSStxcllYRWh1eDlhc1daU3dRU3lVRlFKSm16ODZZbkRMM083ZVJUWThv?=
 =?utf-8?B?Wmx1TEdheVIwVTFDTFpteEVBMHljRTNzWXlaeWlHWnF6cFZmSGJMZlp4SGht?=
 =?utf-8?B?eEphK0pqTDEzdWNxaGt3L3J5NHlFbnZQYlJEOHBrTm9mT0ZEMzR5TkR6OWhs?=
 =?utf-8?B?S3NmR1UyeTI1TUJzVTQyQnRIamJKeHVmQWE0N040eGwvdGpObU9hbE5nMUt0?=
 =?utf-8?B?WWV1ZllWMVN2ZE9IY29LbENUVEVMUlhRZlJzVGZiLzlweGJSZHc0c2JiK0c4?=
 =?utf-8?B?VUdsZ3Bha3NnbG5LZGZlY3pmcHhGZm5PMFNDa2NDSUNsVXBHOXhCSHkxMUY2?=
 =?utf-8?B?UE5aNXd0aHhDM0tVZ0ZyU0JuYkJjQjRJKy8zd0tVMkczOTZHTVZvREt4MmdD?=
 =?utf-8?B?Y1REeVgva3lhZ1c4c0NlVk1SYjdEUGZYeHlIVWlHemhTd20xVTlyL1EyMDVH?=
 =?utf-8?B?M0xrbEdaSlpYK1lHYXc3R0hCTFpYY0lYVzFoUDN5N3hQTTZZTXBwWFFVWDY1?=
 =?utf-8?B?VEFKeXY3SHFiNXBmTk5iYlhYeERkWlV0Z043OTI4M3NqTEYwSHVBUExsMExt?=
 =?utf-8?B?dTdBNWZBaThCTVRQU0hmZXZHWG5qdlZ1RE9LTFp2SW9tWU5VQmxuRGxMbjFn?=
 =?utf-8?B?akF5UEdNQkNVVmZGTzlOWXdsWlpKdkQyL3E2b1BDdEFsRXFPSkVwN3padW1U?=
 =?utf-8?B?OTM0Q0dhSUl5UTRJaVk0eEsyQkxkSFo3N09vMXlxalNNaGJieTgvRGs0dGxS?=
 =?utf-8?B?RW1zV2YwODI3RW9NR1hjZkpENmNyVzRWZE94UGRsMThwRm8xcTUwTldwb2p0?=
 =?utf-8?B?UUFHTUJKcFZUMmtRZ2ZDbUpZZ3lvdUl5ZlRTM094dmlUcmtDZ2l0NmNQMndO?=
 =?utf-8?B?L3hmblc2dGp2RENtUDZjUjZ4WnJlRHc1MmYxdkY5NFE3dFJmamxUSlVwZEM2?=
 =?utf-8?B?MnpEa1dGZ3Q1QXpSVHlzYmtwNnkxQURRUjlJbEkreGFRMTRBSWR1eVB5VFl4?=
 =?utf-8?B?dm5RZE5EcnV3VEJKc0c0Y1pVYzQwSElZdkQ5NHlORHJEVnhkOG1LdmJyTUFj?=
 =?utf-8?B?L1B2a1VBdE9tSDJSR0JrOE9UZVVDVCtKbldkMkJpMHlIMGxKZ3o2NGJTaHJs?=
 =?utf-8?B?d0ZoSnBBbmJIaGhRaEYwYzdTUVo1UDFxaEd3OWFpaXlLb0I4c3FzYndoK3dl?=
 =?utf-8?B?ZEVXMml2WmYxb0Y5RWVFczdUUzNydnhnNUVQOXZYWG8rWEYyUGprcTNyWVN6?=
 =?utf-8?B?M040aHVzTnd0MGZIMUxhRU44aEhxSTVxK3ZjQTB4clFVa3dobitNUFJ5TVNV?=
 =?utf-8?B?c005MUUzc3dDVHEwcWdMdGRxWm92bXhTNXBxVCtVZ0xJalV0TXVhbEJ0amIy?=
 =?utf-8?B?THcrMTR4b2RnKytjVnEwYUlNVmgwOVpjcFlZK2hMZlRJcitXbmhQNFJzTGNK?=
 =?utf-8?B?eWdnbEM5c2tPTnQ1L1dEeERXVFg3R2lBNnZFSlZTczdVRC9EeVJZd0xzdmFW?=
 =?utf-8?B?UmlLRll5UFZGQW84cVVyWk82bjVnUXRwUWxFdXVVR3pqVml3RjVyZnVTQkFz?=
 =?utf-8?B?MVl6a1BGMHBCaitWekVmUzZtVEVWY3IzdTYvTWNLbzc5YkJJSWpiSmVzTWhX?=
 =?utf-8?B?SXR1S2wweWN4UUF6WnVNcEptaG9qSWVpZ00zcC9EQWp5cWYremVvWkhkVXYz?=
 =?utf-8?B?UzZZb0hNOFhsUlRicDhpQWd6ZmN2cnJaa3E1eU82MVI0aSszS2JFWEtUMEkw?=
 =?utf-8?B?andsUXpxOVM5dXN1NWVZVWkrZVlpQWIwNE9JUlNuVUZVZmN0ZE41dUVkL29v?=
 =?utf-8?B?aWxlcCt1MGRjekFGZUZKcjVCd0MzOFhTdndDcU4rU09weWlWRHZENFdTM0xs?=
 =?utf-8?Q?SOD2F0AHS907BtGjBGaHV48C+nRQpBTR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 12:01:39.4252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b033cb-3d4d-4f22-01fb-08dcb86b06cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334

Hi Ayan,

On 08/08/2024 14:09, Ayan Kumar Halder wrote:
> update_boot_mapping() invokes update_identity_mapping() for the MMU specific
> code.
> Later when the MPU code is added, update_boot_mapping() would invoke the
> equivalent.
> 
> The common code now invokes update_boot_mapping() instead of
> update_identity_mapping(). So, that there is clear abstraction between the
> common and MMU/MPU specific logic.
> 
> This is in continuation to commit
> f661a20aa880: "Extract MMU-specific MM code".
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. Introduced update_boot_mapping() which invokes
> update_identity_mapping() in MMU specific code.
> 
>  xen/arch/arm/arm64/mmu/mm.c   | 5 +++++
>  xen/arch/arm/arm64/smpboot.c  | 6 +++---
>  xen/arch/arm/include/asm/mm.h | 2 ++
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 293acb67e0..72e089a339 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -125,6 +125,11 @@ void update_identity_mapping(bool enable)
>      BUG_ON(rc);
>  }
>  
> +void update_boot_mapping(bool enable)
> +{
> +    update_identity_mapping(enable);
With your approach, update_identity_mapping() would only be called from within this file,
therefore it should be marked as static and the prototype removed.

> +}
> +
>  extern void switch_ttbr_id(uint64_t ttbr);
>  
>  typedef void (switch_ttbr_fn)(uint64_t ttbr);
> diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
> index a225fae64d..789f352ab6 100644
> --- a/xen/arch/arm/arm64/smpboot.c
> +++ b/xen/arch/arm/arm64/smpboot.c
> @@ -112,18 +112,18 @@ int arch_cpu_up(int cpu)
>      if ( !smp_enable_ops[cpu].prepare_cpu )
>          return -ENODEV;
>  
> -    update_identity_mapping(true);
> +    update_boot_mapping(true);
>  
>      rc = smp_enable_ops[cpu].prepare_cpu(cpu);
>      if ( rc )
> -        update_identity_mapping(false);
> +        update_boot_mapping(false);
>  
>      return rc;
>  }
>  
>  void arch_cpu_up_finish(void)
>  {
> -    update_identity_mapping(false);
> +    update_boot_mapping(false);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index f6ba611f01..e769d2d3b3 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -426,6 +426,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>      } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>  }
>  
> +void update_boot_mapping(bool enable);
The definition is only present for arm64. Shouldn't the prototype be moved to arm64 header?

~Michal

