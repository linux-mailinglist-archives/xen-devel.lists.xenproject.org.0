Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC248878D79
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 04:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691630.1077838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjslo-0006Px-Mk; Tue, 12 Mar 2024 03:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691630.1077838; Tue, 12 Mar 2024 03:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjslo-0006Nh-IZ; Tue, 12 Mar 2024 03:25:40 +0000
Received: by outflank-mailman (input) for mailman id 691630;
 Tue, 12 Mar 2024 03:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Msr=KS=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rjsln-0006NL-Ak
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 03:25:39 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31654781-e020-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 04:25:37 +0100 (CET)
Received: from CH2PR08CA0006.namprd08.prod.outlook.com (2603:10b6:610:5a::16)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 03:25:33 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:5a:cafe::b5) by CH2PR08CA0006.outlook.office365.com
 (2603:10b6:610:5a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Tue, 12 Mar 2024 03:25:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.0 via Frontend Transport; Tue, 12 Mar 2024 03:25:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 22:25:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 20:25:15 -0700
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 22:25:13 -0500
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
X-Inumbo-ID: 31654781-e020-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0EXCHCIzKofh+bL8opTTCZS50GlUOhva2KJ/zj8Enj2B94LQKrAOPb+FWXGaghfRLqEre15HeJ/6l/Lkc12CuNZTN+d84qfH4j9jEKBdp8DSa/VUYJ0xLux1gN+/8Ey6dWKYX+DNYs5u6rsxYfCQYS0ahM2K5fh53WW1+5GjjjaCnYPX9kVFomSEAS1hp8F4KIMa3VFwXOG5jG2NInf9zATx1FwRA8ry4482gi/ycLV4KWOWHHzN56p4jH5OcIQQlrBu9wqIC/LHZJ0k2Lp6O+4roXzXKh5oYbj+vH+KKFXl3ttvFmZC073obs2QpT6JTqHdtVg8cQMMD9ZXLZw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6Bl6PBC4FkJYU4JrYrA1g5R3/1rnZdldtNvmWVMzVg=;
 b=gFUNiXstml1GznjOqxTfeu6PdkZS84uu/VA9eDKLGLHzbLvHJ6zgEmVNvhIKwQ0/CU26Q1ndLL4KeCVrg3kgWRZopaMY44GFXvK9HyN+ESyWXRBUIuqrqK+5rOXnIsMn2Tx6s+GuXoIWGGcYq8T1KD40TKR794sMbUCy35DK3TFOhjWOAq59u2NKs45PxRVf/OTcTC8OjHzt98ATArYVcVjS3Ox9xrSXA75xF8Q5GXjC5d7xL9jXId8axIDaqCJUIJNmtv4NBuanT1sVn2VmqvBgtRWuFngMCZEV1lHdoIRKMz3+0dWuM2qkXb5h9e+zSAGGn+TxwnDLu4MiNmS7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6Bl6PBC4FkJYU4JrYrA1g5R3/1rnZdldtNvmWVMzVg=;
 b=bKee4yG91tz1Lc5eB5Bs0SJB1qJrZt7LHhbiUen6lvKhGn4nVQM3Kkn19mK+xCE4yy9jyn7IckoeZP6WAIWsrzlqUL+pr7L7ViBhfI0OYAJN0bcSaqcvWImt9j/Y2nLazRbe+iC7XqHm9NYtsKyQCACoIxyBBe3/r2C+bbIZJG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <db776326-6899-4122-9f1f-66dcc2853506@amd.com>
Date: Tue, 12 Mar 2024 11:25:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] xen/arm: Find unallocated spaces for magic pages
 of direct-mapped domU
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-5-xin.wang2@amd.com>
 <4821f30b-94a6-4a2a-8c46-81a9d1e288a4@amd.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <4821f30b-94a6-4a2a-8c46-81a9d1e288a4@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CY8PR12MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: dbade508-fc71-4c0e-36cc-08dc4244136f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I6znPZ3dXaFVroWDdmtYivbY/41hI3HflQaCoA9pKx+b/2ET5q87zT7Jclg9vBnwoyk0rn8iibqMDcRfAH0o06wbVjY3NiO8k87exod1wVUmzrf4Ky+ZJ80v8duPJuT/lH5yfwkDp7mBpe10zGwTrr/tIlcjUVUpdKA4KGEGbJpOn0k9b2LgqTBGcsVAh4Yi4FVSMJvyJOdgQ+VZMGEsM8V3KE6n7NkPUNhopQM9yNMK9/xCQMiZ2zn9YzU9dW/8mIIRSQg0FqobCvzT5e4/vxCMJF+SGBtWiwRoSdU1amE/vugBNli7xAa0dZYtQwUdxSR5C/e2HLRHCA4J+NoZJ7HgU0TptGiDC9LB8QOwrVkkj4Ua3ySHVgDlKfUGNoF8jnRLZX7164pT5WGxYXbWDeaT62GX9hmq7h41EPfCq2wNtcEZDIUy7qRGY79id4deXxtzXdwSkik9PJ881RyONqPDzENLkI9s7bye3MiRXCMogePG2hAw/SRXpMOxQ6lzC51q8mYYvWjMN45rGNlbiDz06NW1oORY8szkJrThrb/8T8cEMn0jL11EMClDI0jgf3/kchlSBPP/9usNeDBu7ZkqqJ+L0aY0n9wP2PW9duRJJxhjbc0xeXkSYOzhxEwxHgI9FNk88T2iP0Nvy+72g/Hg+vTGsplmoo8ibw8reJHgtQr2/lkDc5lnipGOw5Eor3aqRIQdBO1l2vptx2i4sqPR2hm1SLKZvahvRFXeOYTH5YsXCASpSCYlSQ0dfMX6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 03:25:33.0251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbade508-fc71-4c0e-36cc-08dc4244136f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684

Hi Michal,

On 3/11/2024 9:46 PM, Michal Orzel wrote:
> Hi Henry,
>
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 1e1c8d83ae..99447bfb0c 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -682,6 +682,49 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>   
>       if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>       {
> +        if ( is_domain_direct_mapped(d) )
> +        {
> This whole block is dependent on static memory feature that is compiled out by default.
> Shouldn't you move it to static-memory.c ?

This makes sense. I will convert this block to a function then move to 
static-memory.c in v3.

>> +            struct meminfo *avail_magic_regions = xzalloc(struct meminfo);
> I can't see corresponding xfree(avail_magic_regions). It's not going to be used after unused memory
> regions are retrieved.

Hmmm I realized I've made a mess here and below. I will do the proper 
error handling in v3.

>> +            struct meminfo *rsrv_mem = &bootinfo.reserved_mem;
>> +            struct mem_map_domain *mem_map = &d->arch.mem_map;
>> +            uint64_t magic_region_start = INVALID_PADDR;
> What's the purpose of this initialization? magic_region_start is going to be re-assigned before making use of this value.

Personally for variables holding an address, I would like to init the 
local variable to a poison value before use. But you are right it does 
not make a difference here I think. I can drop the initialization if you 
prefer not having it, sure.

>> +            uint64_t magic_region_size = GUEST_MAGIC_SIZE;
> Why not paddr_t?

Good catch, I mixed struct meminfo with the newly added struct. Will use 
paddr_t.
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

I agree with your point. Let's wait a bit longer for more 
ideas/comments. If no other inputs, I think I will drop the
"adding to reserved_mem" part of logic and record the found unused 
memory in kinfo, then use rangeset_remove_range() to remove this range 
in both

find_unallocated_memory() and find_memory_holes().

> Also, CCing Carlo since he was in a need of retrieving free memory regions as well for cache coloring with dom0.

(+ Carlo)
Any inputs from your side for this topic Carlo?

Kind regards,
Henry
> ~Michal


