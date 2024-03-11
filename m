Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFFC8780DA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 14:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691499.1077508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjfzV-0005Ao-FD; Mon, 11 Mar 2024 13:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691499.1077508; Mon, 11 Mar 2024 13:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjfzV-000598-CS; Mon, 11 Mar 2024 13:46:57 +0000
Received: by outflank-mailman (input) for mailman id 691499;
 Mon, 11 Mar 2024 13:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICL+=KR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rjfzT-00058W-LW
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 13:46:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d107b31c-dfad-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 14:46:53 +0100 (CET)
Received: from PH7P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::21)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 13:46:46 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::b5) by PH7P221CA0026.outlook.office365.com
 (2603:10b6:510:32a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Mon, 11 Mar 2024 13:46:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 13:46:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 08:46:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 08:46:45 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 08:46:43 -0500
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
X-Inumbo-ID: d107b31c-dfad-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtinkVnah7GuApJLazNjFldi9a7m2Mp08KdUNZujQrEe7sZuLic+KLWt0PR3ltylkkMnXFa3rkdSsfpbcCBd6FBQZsciBj7Qhz0ZTMDXDOHC238ZhCJq2JOIA1Pu50EtmMK4z8k0LEOxZs2fzPIIGP6bqPtROnFunhJsdjgm2L6FQUkimec/6iRuyJnnVhSTKRAQGSR+dciTstXy9xDE7ecT749Plc6IFbxWjfoX+8dZzevKJIYwQg3EzsGnBLK9Ny0RkeQcNQ6QTF3i/GUjX8POpncyyy3C8vJC65pEDcoaafrhiGYT34RA/y3tpN+n5tB4X81WVZONw98ZTZkzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX5tZpRAfK5z1BaWM+DhWh42XoB4kkl3hXYhqmsyTfk=;
 b=X+BDn5Q0MB80qEpSIxL6p07jYbLq20tFUgjq1SJAA9FVCVcDF7P4JktHPqpilCccUWZ/fdEuEXfaKd+ghuvFk1uYRC6paYec/hC/sQCDPff5PqmgiS/Z/qiixiCirHLTiPPEtlouBASxyGUM+dkVii02FjxExSJxJr0EYiO/RvVaef7ogFY0eZWzMq7fvyIAsf7FQiFDQiuUW0mQt2aw5J0yUwJoh93ITAQ2YBOnnH446OtF4738lj68lh9boRjndqAIl9FD5L1EMqwgzxJ05tGaTv0uDgpjwrK+iEwJWPbMqL3BEt86WruR2MaEUPx/v3E9KkGrTsP/yvvQNjW22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX5tZpRAfK5z1BaWM+DhWh42XoB4kkl3hXYhqmsyTfk=;
 b=Bseu0aO9/xZWiv7LuXGX+Yjo0fxJAnOCt2nckjDjWwTtxl3ejwDgvGY3BPTj6QvbSk+hQ7nDB2aqzBIdN2FJrviICFmPVc0+QlYNiccBO25GFUy6nc6rTMxxQd+xJldSRK9t1v6q1DlOr4DGpyT80BxtvcjrbON8ap0VyXtMDTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4821f30b-94a6-4a2a-8c46-81a9d1e288a4@amd.com>
Date: Mon, 11 Mar 2024 14:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] xen/arm: Find unallocated spaces for magic pages
 of direct-mapped domU
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-5-xin.wang2@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240308015435.4044339-5-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|BY5PR12MB4049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de0c8bd-2003-4b1c-f00b-08dc41d1b13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	COy+ncP1I1KfdBKZZTszkpfc7qRO0qHWYuGVyebnFRwYOM7G6A7YRJeqIFYSrF2jN2GU1g24odSgrJBkUCmZKc/lG9OOc4F0eUSARs7ChhABQD4gRslivaez9HlW5BTuFhLz7bITa/w/0fkkVJoWMJC4cqT/dHTOP17gSXpyCDGqBImF/URb+C86DbnBllFUgIGjBodWGoOt5xqh1tDroGVDUNR+/V64WWjTRIXQKlv1SE46KfcER1j6HXLRFhgqLieXZod2Fy7MxtGXvBh8EQ/jyDi7MESg76vBZKPBzWWSv0sWqFkig55KcWAnFeSZam5fIpD+IUhddWH5GFr6i7PkHgunXACMcqFHoOmXcHGCilRrQfWGHdhG4A7B4lIyHhgbzsFr7Osyr1Rtwb6fY+fl1iFv3u4O6tKd5WLJZq5MhkCG+aoO04Qe9wOFI6p0PRx+OKwMRMuYqrL0/7u0K4EMMjrsfYLXmrQF6oHqDyP+ETsOVo5qtBwTo6HRXMLSNqqHGrj+2WdZuAMooMBqqEh8pGMBAZREXgxhOVIWDMDItqAPs4JOgeAnXBg8lCqZ/4rnjFgYSUCLBJkXVj2HvPLSAjgR8QVUZDSAz/5jljjPNDvGbsQ/9hPD81E7JhItx9VWeEnpYZ04XF3XbmhoHNyK5GgXcPhjgWNyD1NGuxlEnXA/wUCcbDiyQrZh2twUGNGC92ZHq4Ou5TmDxO//YRRlx//rAkJDPOlcPRymEpaN2p3DMv7MOuzUzwVdCqX0
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 13:46:45.6739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de0c8bd-2003-4b1c-f00b-08dc41d1b13d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049

Hi Henry,

On 08/03/2024 02:54, Henry Wang wrote:
> For 1:1 direct-mapped dom0less DomUs, the magic pages should not clash
> with any RAM region. To find a proper region for guest magic pages,
> we can reuse the logic of finding domain extended regions.
> 
> Extract the logic of finding domain extended regions to a helper
> function named find_unused_memory() and use it to find unallocated
> spaces for magic pages before make_hypervisor_node(). The result magic
> page region is added to the reserved memory section of the bootinfo so
> that it is carved out from the extended regions.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - New patch
> ---
>  xen/arch/arm/dom0less-build.c           | 43 +++++++++++++++++++++++++
>  xen/arch/arm/domain_build.c             | 30 ++++++++++-------
>  xen/arch/arm/include/asm/domain_build.h |  2 ++
>  3 files changed, 64 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 1e1c8d83ae..99447bfb0c 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -682,6 +682,49 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>  
>      if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>      {
> +        if ( is_domain_direct_mapped(d) )
> +        {
This whole block is dependent on static memory feature that is compiled out by default.
Shouldn't you move it to static-memory.c ?

> +            struct meminfo *avail_magic_regions = xzalloc(struct meminfo);
I can't see corresponding xfree(avail_magic_regions). It's not going to be used after unused memory
regions are retrieved.

> +            struct meminfo *rsrv_mem = &bootinfo.reserved_mem;
> +            struct mem_map_domain *mem_map = &d->arch.mem_map;
> +            uint64_t magic_region_start = INVALID_PADDR;
What's the purpose of this initialization? magic_region_start is going to be re-assigned before making use of this value.

> +            uint64_t magic_region_size = GUEST_MAGIC_SIZE;
Why not paddr_t?

> +            unsigned int i;
> +
> +            if ( !avail_magic_regions )
> +                return -ENOMEM;
What about memory allocated for kinfo->fdt? You should goto err;

> +
> +            ret = find_unused_memory(d, kinfo, avail_magic_regions);
> +            if ( ret )
> +            {
> +                printk(XENLOG_WARNING
> +                       "%pd: failed to find a region for domain magic pages\n",
> +                      d);
> +                goto err;
What about memory allocated for avail_magic_regions? You should free it.

> +            }
> +
> +            magic_region_start = avail_magic_regions->bank[0].start;
> +
> +            /*
> +             * Register the magic region as reserved mem to make sure this
> +             * region will not be counted when allocating extended regions.
Well, this is only true in case find_unallocated_memory() is used to retrieve free regions.
What if our direct mapped domU used partial dtb and IOMMU is in use? In this case,
find_memory_holes() will be used and the behavior will be different.

Also, I'm not sure if it is a good idea to call find_unused_memory twice (with lots of steps inside)
just to retrieve 16MB (btw. add_ext_regions will only return 64MB+ regions) region for magic pages.
I'll let other maintainers share their opinion.

Also, CCing Carlo since he was in a need of retrieving free memory regions as well for cache coloring with dom0.

~Michal

