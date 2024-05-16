Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C38C77DE
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723335.1128100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bNF-0001Gq-Gp; Thu, 16 May 2024 13:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723335.1128100; Thu, 16 May 2024 13:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bNF-0001Df-DC; Thu, 16 May 2024 13:42:21 +0000
Received: by outflank-mailman (input) for mailman id 723335;
 Thu, 16 May 2024 13:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yDT=MT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s7bNE-0001DZ-1m
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:42:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bdf6754-138a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:42:17 +0200 (CEST)
Received: from DS7PR06CA0022.namprd06.prod.outlook.com (2603:10b6:8:2a::10) by
 DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.26; Thu, 16 May 2024 13:42:14 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::e2) by DS7PR06CA0022.outlook.office365.com
 (2603:10b6:8:2a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Thu, 16 May 2024 13:42:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 13:42:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 08:42:13 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 08:42:12 -0500
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
X-Inumbo-ID: 1bdf6754-138a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBdEPLBzdP3WZUhwM71IRit+AdCL7whylgEf4fVC01QflS6M0Mb82023BCVZz26XfesBf9aJ3mw6PLfdF2lL0tNnsqywTUeANB2GytlxPH5udYtqrGL9TRPqr+YvXWlShPWwRp7Rd+OYxfNDi8UCrZEnAUnNxJoK/SLp207uk6+XZfrup1WFT+KybdFIicMFEA2BJNSIi/A0owJNN7luFdKpy/Py9t/kbVAWS6ogfhRWX0HdPUCM4P+KYoz0dctNUwYtjeK1jL4jFKDz6+nxgFhFaWHAUc51SLczgs8F/S0P9CIVIeSEqrvT05Sx7bqukp+3n4lQnC5Y6AZ7Ag0YfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbCiiT6Z2rWvizVA1JY6tTL7+yCkRWhu3zFgm1eXdOY=;
 b=JiU/F563CjXMoBQFz+PIeqcGvm6X/0fxAfUn/n0s3aWimZlCiaDkQInbkL6QHFZCyIq9LHKF6Yg+u/uLq9RlrJ8ygU8WP/8+Sxm3ql9yrEd+N1JY9TaftoqPQsvjFwMvdkRHmybTnX+qrWNpK1KM/IJFsg8KjGrs7ribnkAMvV5XIiS94oQnOI/XglrVTA5IezvjEvFoxrQHzPrvh8tP1q63RwHN6iKEf+Vbai4Rq9xbjvWPsvdwQI8TGOWvkF3ZflS+niFOEDxPX5rrrtxuS4Ai+uiyLPbmGJbwD2QdHwZdJrROO/bY119JDNYWBay0x1zocaP851ZlJCxvRKKnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbCiiT6Z2rWvizVA1JY6tTL7+yCkRWhu3zFgm1eXdOY=;
 b=bU+HyrUfkVvkeB0mahjznjTXfGqQQ4+w7ScNb5Kf2ICpw0oUG7kztKOXgONQBcwDQfgS1Qfq/lfx3Hqg+/gRYigvqGOBzB30aeJqIngAikO9RZueh7vX6GYIoF34XxMuvDH9JiAzLMmFvJtTU03jR1ejOd6KB+zFettYONJKhTc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4141bf2c-5190-4e8e-89bd-42382439e517@amd.com>
Date: Thu, 16 May 2024 15:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/p2m: put reference for level 2 superpage
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-4-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240515142626.3480640-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd79731-80bf-46c2-399b-08dc75adfe81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZElRV2t5eVFZdHFiSUVOL2wxNCs1eDNrRDY4b3ZNbVdKdDVWWUFaeklmU1Yx?=
 =?utf-8?B?aWs2bzBUVmkrTkJ2bGl2VlBIN0gyNU9DOEJXTkhKajZFUFdQOVhyOGoxcmE5?=
 =?utf-8?B?bmpOQzY3bUw3TFRmVFJVVHo4eTk1YWVLdVdmRlc1YjhnOGtqNmlyWnNmK1FC?=
 =?utf-8?B?MlV0YWIwNnRXVTlPYWFPTXI1MFJTWms3U0xpSGZZRWZzaHJFdVBQQmFqRDNx?=
 =?utf-8?B?NGx2YnQraE5LR3FwME4rZU5DU1p6eUt4QURFV2RXYnRDblM3WDNhalNvVzRH?=
 =?utf-8?B?OHVucTV2MjFrWlFGMnR3SFlhK2pDZFBoK0hCVVZKTlB6cmQ3STR0RzFka2Mz?=
 =?utf-8?B?dG9RRDAvUlMzWndCUGdueHdIbHJOZ0FtdTJLOERwWklndWdXMjJSS2t6N1N3?=
 =?utf-8?B?czlBbS9DeVBzRU81bGp0RzFpOTRPRDdBbjJJeDdUNmMzY3JOQW1tOHN0cS8w?=
 =?utf-8?B?LzNDek01eHVMT1BObkc0bllFNUpaQUtCcDlzeTlMTFovaTNNZGpDZXltN29U?=
 =?utf-8?B?UEtMU0ZRSnk5MERrMzFCNUZ5aFN3UWt1K25hMkVhMzZPME5aZ2ZzNncvVUpt?=
 =?utf-8?B?cHI3RlNpNnFCMWpPMThWVG83S2xnbElCRDFScURpVDM5YTFXblpjNFk3N05q?=
 =?utf-8?B?U1BLRVphOGRUdWh2ZUJDQjAzcjZnNnZhZEdXcDJPVnFMOXpyM3NGS1VtdW1F?=
 =?utf-8?B?YXpyOGRMdndWR2o0aTRwb0dUeE5CZFc2U3lRZ3FGVURodHdWTzJIMWNmczM2?=
 =?utf-8?B?UmEzdDNMdHIyRDVQNzlUMHQvYXB2N0xUSFRxNy9BQ0IwWnNCamJvem52UXZE?=
 =?utf-8?B?cHVOcjQrbVpsY0t3cVhSdXYwOFNacEZUL1RJWVBkdXVrQTB2YkRHUmZON1hS?=
 =?utf-8?B?SUQxT04wTE4wVTBzcUxNQklhZEp5Nnp6dU4yVldOV3BjZXIrUGNEL3dFVVkz?=
 =?utf-8?B?ZkkwQTNxYStuOFNtbm9WdWpITlpPTHlXTHdTQlhPVUh5cHlrcGxFVW0xaGRD?=
 =?utf-8?B?NFhzTEFCM3pFNGxxTWtTbUJ2K2tpelJydEQzVElWTSsvU2llMXpqQ1ArTElB?=
 =?utf-8?B?YUNPeVgrYitIdGtKOEN5Sk9EbHIzQ0hnU2xqcWJMR3BadzhrMEVBeWV4WU43?=
 =?utf-8?B?ajRhRWFwWnNoWStnYnMvaElGSThwM09OSXZJeHZJRi9ETzIrNjNFTGMzbEZ2?=
 =?utf-8?B?Vlphc0pORnlRcGhrZmcydzVET3VwZDVaeVExWEcwd0ozcDY1MXJld25CTnZ0?=
 =?utf-8?B?NDZIZEZKbzBKckx1ellVam9oU1BzaG96cENiY2FNUU00QTEyL2hlOTVMVDBX?=
 =?utf-8?B?TUIrbFcvMXhPck96cUVCSkRTZmhkbzBVZ3ZBcTV3MTZmSlVMaXZYWm1ydWFO?=
 =?utf-8?B?MTBrci9zNUJqa1RmbVJ1WEhJdUF4WjlOWXJSWUxSNitUYkJKOEpVV0Nwdkts?=
 =?utf-8?B?VUdPY3pLVDI5S3hidmE3N0FmdHdzUFNxQ3NoUk5jb0J5SFRSUmJ1cEpKYUpr?=
 =?utf-8?B?UU1GdTduODB3bWhjK2prUzAyM29wS1R5U2dMdFo3U3dXRmsySjBpUmtRWXBr?=
 =?utf-8?B?TVBPK2R4SnI3U0ljTVhNVlE1VWNQZ1M2U3kvYU5TQzZ2dVJST3BBUzA2amJ4?=
 =?utf-8?B?TWlQQVdWc3RmS3lqWUxSbFU0ZE9HdWUweVdPUURWSzBtbTZ5RWNFZUg5ZXJw?=
 =?utf-8?B?MGxIQXZSZU1NZk05Z0R6YVl6VnJnRDBXN2JKbzZSbFlwSTIyMGhwWDFuNHhz?=
 =?utf-8?Q?FVwC00Zrpeqb3l6LPnrFHMpHadAGlaR8Ni5CYh7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 13:42:13.8504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd79731-80bf-46c2-399b-08dc75adfe81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373

Hi Luca,

On 15/05/2024 16:26, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> We are doing foreign memory mapping for static shared memory, and
> there is a great possibility that it could be super mapped.
> But today, p2m_put_l3_page could not handle superpages.
s/could/can

> 
> This commits implements a new function p2m_put_l2_superpage to handle
> 2MB superpages, specifically for helping put extra references for
> foreign superpages.
> 
> Modify relinquish_p2m_mapping as well to take into account preemption
> when type is foreign memory and order is above 9 (2MB).
I don't see the reasoning why we don't handle 1GB super pages. It would be beneficial
to include such in commit msg as well as in the code.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2:
>  - Do not handle 1GB super page as there might be some issue where
>    a lot of calls to put_page(...) might be issued which could lead
>    to free memory that is a long operation.
> v1:
>  - patch from https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-9-Penny.Zheng@arm.com/
> ---
>  xen/arch/arm/mmu/p2m.c | 57 +++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 41fcca011cf4..29fdb3b87dd0 100644
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
> +static void p2m_put_l3_page(mfn_t mfn, p2m_type_t type)
>  {
> -    mfn_t mfn = lpae_get_mfn(pte);
> -
> -    ASSERT(p2m_is_valid(pte));
> -
>      /*
>       * TODO: Handle other p2m types
>       *
> @@ -771,16 +763,44 @@ static void p2m_put_l3_page(const lpae_t pte)
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
> +static void p2m_put_l2_superpage(mfn_t mfn, p2m_type_t type)
> +{
> +    unsigned int i;
> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(3);
If we know the third level order is always 0 no matter the page shift, does it make sense to have this variable?

> +
> +    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
> +    {
> +        p2m_put_l3_page(mfn, type);
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
> +    /* We have a second level 2M superpage */
> +    if ( p2m_is_superpage(pte, level) && (level == 2) )
> +        return p2m_put_l2_superpage(mfn, pte.p2m.type);
> +    else if ( level == 3 )
> +        return p2m_put_l3_page(mfn, pte.p2m.type);
> +}
> +
>  /* Free lpae sub-tree behind an entry */
>  static void p2m_free_entry(struct p2m_domain *p2m,
>                             lpae_t entry, unsigned int level)
> @@ -809,9 +829,10 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>  #endif
> 
>          p2m->stats.mappings[level]--;
> -        /* Nothing to do if the entry is a super-page. */
> -        if ( level == 3 )
> -            p2m_put_l3_page(entry);
> +        /* TODO: Currently we don't handle 1GB super-page. */
As a future reader of the code it would be beneficial to say why.

> +        if ( level >= 2 )
> +            p2m_put_page(entry, level);
> +
>          return;
>      }
> 
> @@ -1558,9 +1579,11 @@ int relinquish_p2m_mapping(struct domain *d)
> 
>          count++;
>          /*
> -         * Arbitrarily preempt every 512 iterations.
> +         * Arbitrarily preempt every 512 iterations or when type is foreign
> +         * mapping and the order is above 9 (2MB).
>           */
> -        if ( !(count % 512) && hypercall_preempt_check() )
> +        if ( (!(count % 512) || (p2m_is_foreign(t) && (order > 9))) &&
Instead of (order > 9), use XEN_PT_LEVEL_ORDER(2)

> +             hypercall_preempt_check() )
>          {
>              rc = -ERESTART;
>              break;
> --
> 2.34.1
> 

~Michal


