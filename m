Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A38BE20E
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718051.1120556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4JuO-0008Oh-73; Tue, 07 May 2024 12:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718051.1120556; Tue, 07 May 2024 12:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4JuO-0008MP-4O; Tue, 07 May 2024 12:27:00 +0000
Received: by outflank-mailman (input) for mailman id 718051;
 Tue, 07 May 2024 12:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r/6G=MK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s4JuM-0008MJ-Ht
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:26:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 182e8ba7-0c6d-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 14:26:57 +0200 (CEST)
Received: from BN8PR04CA0035.namprd04.prod.outlook.com (2603:10b6:408:70::48)
 by PH0PR12MB7815.namprd12.prod.outlook.com (2603:10b6:510:28a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 12:26:50 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:70:cafe::6) by BN8PR04CA0035.outlook.office365.com
 (2603:10b6:408:70::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43 via Frontend
 Transport; Tue, 7 May 2024 12:26:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 12:26:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 07:26:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 07:26:49 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 07:26:47 -0500
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
X-Inumbo-ID: 182e8ba7-0c6d-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx3w/6ERGkLHJIQXcakBDAMn9UdfAjlcYOTs4hhHLeMXIGrMqCmoLIZr1YVEM1OSQ/z+HFdgX0OfC5OmeNbPo78auBFPkvlCej+/e4bsfexuczdTibuhn2HnZ1i/HcQJVS7i+4VVgvVbGQDL+DddPJkwm4T4oB/ArSEAfaduRIUeuwzuAZbXg3WUug+dGPJXoqVo3fg32D5YUOU71/2TNvJNuBTMl7DOTNhFLIWjko3CImrv4Bou4mYATe27fZI9q8gWhqXsPRnD3Pyv4gCZP4+on5SenCzSHnI7fXaw+oxcZ8bVl6om0j/5L9SlLo/PmpVOdSbrKfJ/f1U18xmeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzHcNyRSKZ7Zn+9CUKTIZM2VTaJxubh0xWFmsKJUM4Y=;
 b=Kzp3wFdEUKnWndON5teyx6/4Zo6AZ6/DjaL4D5BGSIAHMwY8Yi9FsG1FJDghkeGldDb27ktCKeKuBl8qeex6h3YY1cdIg2XdX0MrgkpyE9z5ZZ/Tz9dCvq7+Sbr01oUpWIKVhvXZDSpM0HXKL8uI3jbHUqTxgbJYrzv22GseqoHNPr/WDBguQA2W6cntrruVTxYvIQmg05IQf/3TeXeKfQExIAu+sAwpadaxfPn4gkLn2Z4qbTCMdSeM9A6d8p3gu0KAS5zk6il5b9zQpYVMMa4Ip87NVNFUbiCeRx2ubLGwSkD+io5qEscvN/ec6kDkK/azoP/LqrgWcoLcCMSTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzHcNyRSKZ7Zn+9CUKTIZM2VTaJxubh0xWFmsKJUM4Y=;
 b=2w9F7THaQoN7AvkkmGESHAJwMo+19tZ5dpPU/rMNdZ1z7gv3DXOtSZwe9K8JFAy6HfEgncT3GDqnoy3bfcyY7GK14rxN36IT/JyIqHkUdIGuYXh+yFqJVPqQp14sGXP4whAWkxw2ghzt1W2zGl67taN7yskEPy6SUkhgsF0LrSI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c8976284-1a27-4182-a214-9f5a10de6f95@amd.com>
Date: Tue, 7 May 2024 14:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240423082532.776623-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|PH0PR12MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 9375707a-261e-47cb-4a39-08dc6e90f828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UC9jcm1NSmVOSU9SM3FGWVhjemR2OWM5WStUTG9lL3hyOEdDbkMzRFhGY2sv?=
 =?utf-8?B?UUkwMUxWT212dlZEMGV4bjFxOENjSFkrNklwbUtpVEoyNDJ5eXRob3lqUFhs?=
 =?utf-8?B?NUlvVUhwczFGd05TT3BLTTU2SnB1c1p2WEZ6bUJCN2xZNnJVTWV5blFhSkxC?=
 =?utf-8?B?VnhMcFBKMkp1R0pjREVMSys5aTVhWEZZSEg3R2hKMmo1RGNlMHpILzc2REVV?=
 =?utf-8?B?MTZUKzN4VTNrZVhob2tnTHhWUGJxMmRvNE5qdmliM00wRUdEeGpUdGpYaUFN?=
 =?utf-8?B?UHVNMU5CUStPOFRPUTYxNEp3eVA2NmJSNFozYllsdGFxOEN5TUVybnhFZXNT?=
 =?utf-8?B?c00yMWhoVnFYc0xnNFhFRDl6SENlTUZCVW9ucWw0N3FEZXVGWlo0Wk82cEg5?=
 =?utf-8?B?MG95SUErQk1nMndYdm9SMkZWa0FsYTVaMVoyQlU5Yll4RVFzRG5MZmx2VzVh?=
 =?utf-8?B?LytiTlJzUnMzMmhzeVdTVG9ka1V1d1F6a0ZoMk8vR2lQTGk4eFJ3MGJqTlY1?=
 =?utf-8?B?SmsvdWFPdlZRT2ZibmliWDJES1oyd2VnTGZVcmJTSmMwc2JNeWNwd2VuUFVM?=
 =?utf-8?B?ZFVpeXJDbjZVTWs3UVBWNTYxOERURXR6d1VLR2ZRUE5sZmw2OUxzY2FiR1FW?=
 =?utf-8?B?MlZuZlcxeWZ2akhOVWxEajZMYmQybnkwZTZsVUZLa3Y2TFMyWUM4U0oxTVZm?=
 =?utf-8?B?KzdYMElqYm5ZL3lhNWhFWHE2MnNWNm13R2t0UUZpdExGaWlpMmZEY01XZkM1?=
 =?utf-8?B?S05EZW9JY1h1WnFqbDVPY1I1YmJhcFRYakNSN08vMHJSV3dkVWhneHdlckYy?=
 =?utf-8?B?SnR1a0VGZHpuaDVyQWprOTJOZnZuSTlyeFpaWGZWZmZUVVFwRWRaeFBtb214?=
 =?utf-8?B?NXk5U3FpZ1AvdSt6Vkd3RDE0emdUSUd0VzdLQmxQSSt3OUVtOEE2UDIrTkFH?=
 =?utf-8?B?RFZLKzQxYVpYaEZGUm5RejdOSjFDTWVkK1llQmtFZXY2SmVkWWxyR1V2VWhw?=
 =?utf-8?B?dkZ0ZkNlbmlSNmxSRDlKS1BPbHpib2hvZ1ViQkZJTVNtU0VLcTVlV2Nkc0Vq?=
 =?utf-8?B?b09Yenp5dDE2d3dBaCtabUFMQlBkV0VHS1YwRHQ4eUw4SDFkS0JkbFlUdG1y?=
 =?utf-8?B?eVRYTWlldXpMcjV2QjlLc01vTUNWY29rUXhPS3pUYjZ1Tm1xT1hXTlp2RHRh?=
 =?utf-8?B?eHdFd2NJYUpVOFA0NzdrZURRVGJtY0NoU0lsNmNtZytzZmJFbHhqR0NRL0pk?=
 =?utf-8?B?Q0F3bmZXeWlHS2JtSTQ4eGt0eHdEeDRwVVBYKzY1UHMzUXBuRHVET1V2VVVS?=
 =?utf-8?B?cm1zbTZENnBpeUpXdko2QmJwTVBTWWMyeW5HV0F0Z2VsRWpmZHBkVjIwNGJC?=
 =?utf-8?B?SkJjdEsrUm9rNlFkWmdyN3VzSUdpQnlZRnFTTXV1RjdEamx2VXRZRXVpbU0v?=
 =?utf-8?B?MVhQekFVV3NxWUsydlBVSzlFTEJtb2tha0hBdzdQbkJnelBKcHlQc0RKZUc2?=
 =?utf-8?B?SW0wOHNEY0NhRmVNQm5yRU5RMzZtODF5MjNlcEphbDNyL1RrNGhqS3ZBY0t1?=
 =?utf-8?B?cUQzK1VPR3FqbXVkVnNtUlFLR3Q0SXd4UWlMZk00eUtwQzh0bEpMVXNCL3dE?=
 =?utf-8?B?Qi84STExZmNiNnhib09IRDF2NlZWd1pSVjZWL0RDMU83RHUxaE9Xa0pISkxz?=
 =?utf-8?B?OU1xdFlINFhPRTNqOE9qckZyT3dlU2VZQVlvTU5KcmhLbC9KM3NsRmdmRlk4?=
 =?utf-8?Q?nQoefUCrHbwpZyGwGwp2JZ2hNh38aRGJaBV2vu6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 12:26:49.7035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9375707a-261e-47cb-4a39-08dc6e90f828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7815

Hi Luca,

On 23/04/2024 10:25, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> We are doing foreign memory mapping for static shared memory, and
> there is a great possibility that it could be super mapped.
> But today, p2m_put_l3_page could not handle superpages.
> 
> This commits implements a new function p2m_put_superpage to handle superpages,
> specifically for helping put extra references for foreign superpages.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v1:
>  - patch from https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-9-Penny.Zheng@arm.com/
> ---
>  xen/arch/arm/mmu/p2m.c | 58 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 41fcca011cf4..479a80fbd4cf 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -753,17 +753,9 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
>      return rc;
>  }
> 
> -/*
> - * Put any references on the single 4K page referenced by pte.
> - * TODO: Handle superpages, for now we only take special references for leaf
> - * pages (specifically foreign ones, which can't be super mapped today).
> - */
> -static void p2m_put_l3_page(const lpae_t pte)
> +/* Put any references on the single 4K page referenced by mfn. */
> +static void p2m_put_l3_page(mfn_t mfn, unsigned type)
Shouldn't type be of p2m_type_t?

>  {
> -    mfn_t mfn = lpae_get_mfn(pte);
> -
> -    ASSERT(p2m_is_valid(pte));
> -
>      /*
>       * TODO: Handle other p2m types
>       *
> @@ -771,16 +763,53 @@ static void p2m_put_l3_page(const lpae_t pte)
>       * flush the TLBs if the page is reallocated before the end of
>       * this loop.
>       */
> -    if ( p2m_is_foreign(pte.p2m.type) )
> +    if ( p2m_is_foreign(type) )
>      {
>          ASSERT(mfn_valid(mfn));
>          put_page(mfn_to_page(mfn));
>      }
>      /* Detect the xenheap page and mark the stored GFN as invalid. */
> -    else if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
> +    else if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>          page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
>  }
> 
> +/* Put any references on the superpage referenced by mfn. */
> +static void p2m_put_superpage(mfn_t mfn, unsigned int next_level, unsigned type)
Shouldn't type be of p2m_type_t?

> +{
> +    unsigned int i;
> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
> +
> +    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
> +    {
> +        if ( next_level == 3 )
> +            p2m_put_l3_page(mfn, type);
> +        else
> +            p2m_put_superpage(mfn, next_level + 1, type);
> +
> +        mfn = mfn_add(mfn, 1 << level_order);
> +    }
> +}
> +
> +/* Put any references on the page referenced by pte. */
> +static void p2m_put_page(const lpae_t pte, unsigned int level)
> +{
> +    mfn_t mfn = lpae_get_mfn(pte);
> +
> +    ASSERT(p2m_is_valid(pte));
> +
> +    /*
> +     * We are either having a first level 1G superpage or a
> +     * second level 2M superpage.
> +     */
> +    if ( p2m_is_superpage(pte, level) )
> +        return p2m_put_superpage(mfn, level + 1, pte.p2m.type);
> +    else
No need for this else

> +    {
> +        ASSERT(level == 3);
> +        return p2m_put_l3_page(mfn, pte.p2m.type);
> +    }
> +}
> +
>  /* Free lpae sub-tree behind an entry */
>  static void p2m_free_entry(struct p2m_domain *p2m,
>                             lpae_t entry, unsigned int level)
> @@ -809,9 +838,8 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>  #endif
> 
>          p2m->stats.mappings[level]--;
> -        /* Nothing to do if the entry is a super-page. */
> -        if ( level == 3 )
> -            p2m_put_l3_page(entry);
> +        p2m_put_page(entry, level);
> +
>          return;
>      }
> 
> --
> 2.34.1
> 

~Michal

