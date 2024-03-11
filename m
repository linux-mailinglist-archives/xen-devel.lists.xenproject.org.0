Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CFF8780E1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 14:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691502.1077519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjg35-0006wt-Uh; Mon, 11 Mar 2024 13:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691502.1077519; Mon, 11 Mar 2024 13:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjg35-0006uz-Rs; Mon, 11 Mar 2024 13:50:39 +0000
Received: by outflank-mailman (input) for mailman id 691502;
 Mon, 11 Mar 2024 13:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICL+=KR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rjg34-0006ut-Fp
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 13:50:38 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55dd4be6-dfae-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 14:50:36 +0100 (CET)
Received: from CY5PR18CA0033.namprd18.prod.outlook.com (2603:10b6:930:13::16)
 by CH3PR12MB9394.namprd12.prod.outlook.com (2603:10b6:610:1cf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 13:50:31 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::60) by CY5PR18CA0033.outlook.office365.com
 (2603:10b6:930:13::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 13:50:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 13:50:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 08:50:30 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 08:50:28 -0500
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
X-Inumbo-ID: 55dd4be6-dfae-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVcuWv9k9mLNcc3rrNSv9pdT3ZPI+WeSD9kJim7ozu9n+CMbZMN+tGCgpwHc6hE/2qnsBOoR8VkYhUveR6vxNhw1FbdyYr9z9QtsOMUaqawYeYjJ2IpBOxEPHt5K4b/gLieNZMYYHryRM9I1eyRk9yl0pNpt2j+xC+2zJJMBolr9NNPw6TK1pteafFTWDjdQITiAG7wxaW/sv3Yf8hnqCbve6tMhjHFi/j0elAgNYJXlff/iX5u4pJCD7Ike/AFz2Fdzu3BHK/TrSxvuL9jFIZi06PrIR+7+GUgziXEw01DhMJHJfp4UO8bsctMnBsPqihM/BT6DtUOgiPoKe1k0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9M1EeZ8VI0siVPOy8ACdOyTocZjT09LZon/LZAUW9U=;
 b=cIBMptySXdUfxX1qkGN9CxkBSDhbymZ10yEb7N1KZVqHjDuzpLNncTdpjfZknLyyIwa46T2ESAhz2/L+/6smOxbbK8AJOv/QaLsO9gtIqawARnkcASiCnFrXFwFrUHiUPVEdSMzcrLBStUI9A1XgymcAWhiM1UX4RucHs8y3JirW95v+YC4RpRA+i9kpU6327alPDxh/oQlXBMd9uDLeuN4vk6zwzSobJeSAUBey5D4r1oHEgoxEisMupOgiRi2XgJCMYbXgIkahStkXWh/TUzQS+G/07M27P4PY2+xdOWGNJCD7Zx4/NyxIsT8XFHGpjJrbgw0Jfvzv4fKFfIb5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9M1EeZ8VI0siVPOy8ACdOyTocZjT09LZon/LZAUW9U=;
 b=PPGyamqI2CQ2PnIV8yd7nRe0Y+5cN822BXd2O7fPo6J7rTIcjw10RtyrcDyu4lYqBOjyFB9xDlrxFZTbaN/TTNmJOsJE7//Oi3hhCKj//A2kgr6FAOzVAB/Gbt72F7aXJMqmtGe4drj6dB9cfWpSpJVHkPR593bRUZhEeKclRcE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3ed07a07-e423-477d-8a87-7d40bd9a54b9@amd.com>
Date: Mon, 11 Mar 2024 14:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] xen/arm: Find unallocated spaces for magic pages
 of direct-mapped domU
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-5-xin.wang2@amd.com>
 <4821f30b-94a6-4a2a-8c46-81a9d1e288a4@amd.com>
In-Reply-To: <4821f30b-94a6-4a2a-8c46-81a9d1e288a4@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CH3PR12MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c80433-9e9a-4986-5699-08dc41d23782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y7GGoh7M0oQ+NOPqiOTLDc5WKRbMV7ER8ASG/ozyuUiq4t3EETbGf+FsrzUhYEbmeCa7Sasx90huqNIX5bkBOUuxlfmSwwcfbv5MAb2PRL5cfkp0ALroLKGpeuYUKkvApInOhzH/Pbfsn9nidyMUSXCSJV0LHx1p0y2oW8+0s2yCGl9B1MAHIUfbT6lYeeIa9Tc0b01JA9ml8U9YrpwPbzhrVW1f1YWqX/v3RoQOUf8rfVZOz1sNQ1fGyrBhA7WUrZsewHyLcEAbCiUJLUAGXTY64XCxoJiyrvH1/S2NIMjnoW3BYd994fZHyGbSBYmaC52A691AOU114MAOxVCm3Da2NwTY+VIxnxjrYG5IID8ZLr+dF7pkuTF/KZqqt5vQPkPYA9fUzFKxw2EzmLvmlXx5n2EZrcu+VtycsqrPX54zLzpJVUiVDECEBZry3O5yq77xvEyti7tRlL5Gxkn14KVWAY0hzB8zuqbn25iPZjUV0NWDWtldNIw0E/hGX84QA2tmOgPwAuZwjdNIdYUoAFBEB/r6xaTmuSlUJpPRNVNXt2RhJ4s+64xgJVVBA5rWAYihJyTcBbALuMckVNNhDkQu+PoVZsdzWHrv5hlIhP8UtqVOUlMKRMwfgzH6Jy9378nKtHOkBwn1JWknJqk/63ZtO5Z4DAAn41kxgNIXEvAKfq4NqxGeRTUurovQakQXwrJeAwrlP9yZpQFEuP5O+DeDhhuo6+Z6LlH0cHn+tgcUgCBuO7xtlopq3SCo95/Z
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 13:50:30.8901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c80433-9e9a-4986-5699-08dc41d23782
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9394



On 11/03/2024 14:46, Michal Orzel wrote:
> 
> 
> Hi Henry,
> 
> On 08/03/2024 02:54, Henry Wang wrote:
>> For 1:1 direct-mapped dom0less DomUs, the magic pages should not clash
>> with any RAM region. To find a proper region for guest magic pages,
>> we can reuse the logic of finding domain extended regions.
>>
>> Extract the logic of finding domain extended regions to a helper
>> function named find_unused_memory() and use it to find unallocated
>> spaces for magic pages before make_hypervisor_node(). The result magic
>> page region is added to the reserved memory section of the bootinfo so
>> that it is carved out from the extended regions.
>>
>> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>> v2:
>> - New patch
>> ---
>>  xen/arch/arm/dom0less-build.c           | 43 +++++++++++++++++++++++++
>>  xen/arch/arm/domain_build.c             | 30 ++++++++++-------
>>  xen/arch/arm/include/asm/domain_build.h |  2 ++
>>  3 files changed, 64 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 1e1c8d83ae..99447bfb0c 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -682,6 +682,49 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>
>>      if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>>      {
>> +        if ( is_domain_direct_mapped(d) )
>> +        {
> This whole block is dependent on static memory feature that is compiled out by default.
> Shouldn't you move it to static-memory.c ?
> 
>> +            struct meminfo *avail_magic_regions = xzalloc(struct meminfo);
> I can't see corresponding xfree(avail_magic_regions). It's not going to be used after unused memory
> regions are retrieved.
> 
>> +            struct meminfo *rsrv_mem = &bootinfo.reserved_mem;
>> +            struct mem_map_domain *mem_map = &d->arch.mem_map;
>> +            uint64_t magic_region_start = INVALID_PADDR;
> What's the purpose of this initialization? magic_region_start is going to be re-assigned before making use of this value.
> 
>> +            uint64_t magic_region_size = GUEST_MAGIC_SIZE;
> Why not paddr_t?
> 
>> +            unsigned int i;
>> +
>> +            if ( !avail_magic_regions )
>> +                return -ENOMEM;
> What about memory allocated for kinfo->fdt? You should goto err;
> 
>> +
>> +            ret = find_unused_memory(d, kinfo, avail_magic_regions);
>> +            if ( ret )
>> +            {
>> +                printk(XENLOG_WARNING
>> +                       "%pd: failed to find a region for domain magic pages\n",
>> +                      d);
>> +                goto err;
> What about memory allocated for avail_magic_regions? You should free it.
> 
>> +            }
>> +
>> +            magic_region_start = avail_magic_regions->bank[0].start;
>> +
>> +            /*
>> +             * Register the magic region as reserved mem to make sure this
>> +             * region will not be counted when allocating extended regions.
> Well, this is only true in case find_unallocated_memory() is used to retrieve free regions.
> What if our direct mapped domU used partial dtb and IOMMU is in use? In this case,
> find_memory_holes() will be used and the behavior will be different.
> 
> Also, I'm not sure if it is a good idea to call find_unused_memory twice (with lots of steps inside)
> just to retrieve 16MB (btw. add_ext_regions will only return 64MB+ regions) region for magic pages.
> I'll let other maintainers share their opinion.
> 
> Also, CCing Carlo since he was in a need of retrieving free memory regions as well for cache coloring with dom0.
In the end, I forgot to CC Carlo. Adding him now.

~Michal

