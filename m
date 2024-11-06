Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE39BF136
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 16:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831199.1246394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hdP-0006Ej-KV; Wed, 06 Nov 2024 15:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831199.1246394; Wed, 06 Nov 2024 15:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hdP-0006C3-HA; Wed, 06 Nov 2024 15:07:51 +0000
Received: by outflank-mailman (input) for mailman id 831199;
 Wed, 06 Nov 2024 15:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF+1=SB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1t8hdN-0006Bt-Ul
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 15:07:50 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:200a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de0f931b-9c50-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 16:07:42 +0100 (CET)
Received: from MN2PR01CA0055.prod.exchangelabs.com (2603:10b6:208:23f::24) by
 PH7PR12MB6936.namprd12.prod.outlook.com (2603:10b6:510:1ba::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Wed, 6 Nov 2024 15:07:36 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::de) by MN2PR01CA0055.outlook.office365.com
 (2603:10b6:208:23f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Wed, 6 Nov 2024 15:07:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 15:07:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 09:07:30 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 09:07:30 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 09:07:28 -0600
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
X-Inumbo-ID: de0f931b-9c50-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjA4IiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRlMGY5MzFiLTljNTAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA1NjYyLjUwOTA0Miwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKHbHh92XKmN+JqlE+y6Th03b2uuG4Rl7JDk/eSKbm4jlMPAnmOM9edjMNd9bhHrNsgxxISNXf5Hs3xYZQr1y+qam4XeFMazVTJFyuAFuDu4FIPSf78g/nLDr2ujGLN2912RF4XMBZjXOaBv9OgsFEGbJxNeVQgA07t0a0lBr8nox9OgmD0LrfqQPzFTHDkz2+BYfyX8rQmnJRdXpQYvoRWsMS+er0uPH3oQoOQ5VkihQOwRN3myTGPCBKFbP9LVB5LCpr+yZ7AHIEGoJaMYXm+CweLC6Qat7TH6Yr1oaSbSpYqqMMaPcNeTCwkm7psuunIGwbR7mmYmeORUStznvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmGfr9YAT/jMo+NtkL6AVLsUurS+IfL8hP3NwFSI/H4=;
 b=p1TreqSBMMvGioVGRwm1vnfBAIsySiBfYcJMnVUgFVhK1887ZfiUI4oaVUhQ+A3k8A1AI4w8mMmc6VJkflca2SFrAssELkz/R3KQUilKXa0+WMe9X/bBUqXEBocNN8Mw6/DRs/FQvxGhz/nM4ELxYaoMmIsEqdDgLyzAPvTXOqWzfmbk0cUWm/J0wAI82xoBcCuXW7ZXbQory6YehXllwH1AXc85BMdNdUXMs5leTGoRKXIUJ6vX9eMKlTkT030D4Gc9Uk+URhmn6RtOEAzME8cFDE8kfyiHKnjFHNyzVN9zzXqxbhCKF9zPkFZrhb4AYCt4SsFyaksFuDnhioNI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmGfr9YAT/jMo+NtkL6AVLsUurS+IfL8hP3NwFSI/H4=;
 b=LRyiHqB+tqvibqRKmQ3QVbk4spX9rEPjwBEL6UAkW3NzXbfTnDKW5zxS2igiKEr+O2JtFzAUTHjUMn0TV8ansJUrNFooinaUYM2EmI5ATi+lU802dff8qIQ7rePnyXYEITOVcQRh+MroxMvRRpGlFRSWjD8n5vBZFwEVvrLniL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
Date: Wed, 6 Nov 2024 16:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241106134132.2185492-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|PH7PR12MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 317d7eb2-1f12-414d-11d9-08dcfe74bc48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHBmb3Nxd0p4TVlWWEk2MldJK2t4ejFlMGhWbWdWQmU0TUovM0gzZTdXdmZy?=
 =?utf-8?B?dVhjNjRUdytJRHNUckk0M2NoUTVnMXBXclpzM2JUQURJcG43SnZTRC9KbzFG?=
 =?utf-8?B?V0t1a3pWem5YQlBhMXBwdzdqdHFPaDNqemIvSUlFTW5QaFlXdXJrNHgzQWxN?=
 =?utf-8?B?VzBQSlZ5YkhZSHBCTHJEemloaFE2elE1UGJ6U2ZveFBSNVdkZGFtWHFTcldp?=
 =?utf-8?B?VEIvcHkyUzlFUFo4N0pBSnUvQTdxSytQM1lTZ1VVSnpXRjlNYlRaVHJabnd4?=
 =?utf-8?B?YnBJV0g1b0JuaDZyWm94WUFRRHJIMFVpUm5DZC9kUzNlU2E0UVhMUmV2Y0Iy?=
 =?utf-8?B?THBSYlN3YzhNei8yNTgrRUE2bzFidXRnbVRIU3JMTlFQY2dIeEZxZmJVSlR0?=
 =?utf-8?B?STZzZHN5bHJLSDBLZVBNdEhudDNHK05HbmZzT3k2QkJjOWFRVWtpejZWeDdU?=
 =?utf-8?B?UjRCa3laMEc5cktCTEpYY3BjcklzWlV3ejZoeTI4MlZ6QUYwdHJMeWEwVFBO?=
 =?utf-8?B?QW12L2IzNnV4L01jVDdPTGVyR3RaTE4wUS9jWmI3TGduSGJ6NEhPN3l0b3kw?=
 =?utf-8?B?aEthM3F4d0xWbk8rekJ4aHh5RVVZK1VmbnUwcWZXTzRjQ3BKUFBmUEtFR2xs?=
 =?utf-8?B?eW8yMnJFRWl1ZGpCRkJYUHBmSDJ1SkVpb2JVRzFrc2xZR3htbnQ5TVczTU9X?=
 =?utf-8?B?NThEZ1RFNTZVRzNaeW5FbUZjYVpGSjdTZ1E4Uk5jWFRxdHEvQjFBZXQ1eDJR?=
 =?utf-8?B?c0dydlRCMFZ1RXRzazlvdytGcEY1a3RSRjRoUi9LL09ydkQ0ekc2RTZuNWR2?=
 =?utf-8?B?eXUvLzlja1VOSHZBNFJWczM0WndpWUtpZzErcEYvWnNxRVZxMGxab0hqbHF4?=
 =?utf-8?B?SFZ1SzIzNW52M1dQSWNIOXFvS1Bka0lCQU81N2J6VFlvR1FRZyszMFFwT05a?=
 =?utf-8?B?bitwN081L3Jrb0tiUWE3WnBLZkgzZEx2R3VZdnQ3Mm1IRXRsTSs5VkxGRnph?=
 =?utf-8?B?WFVBaDVLTkFtRjk1WlQyVzQzM1hEdlR5YkFrZjBxdFBZd2prU1dWNmpzL3NQ?=
 =?utf-8?B?NE9TR1MzZXN1THNwT0tvaTBaK1FIT1BFV05FS1ZmSFlPU2NzTnBDd2RnVHVB?=
 =?utf-8?B?V2hGdGY3bTZKc24vUVpkU0g4a05id3JDUXpqQjlEUFFpc0JHSUhTMk54RlRM?=
 =?utf-8?B?WElRT1ZxQXFDQjVWNnVvS05STHVyWTJIU1d1RmdrTURRZUlKTEpTdWJzazRX?=
 =?utf-8?B?MGprS215dzhEdk05VkdzM3hsbWZMUWRqMm1XeTZUcDcra2lsUUcyb0p0OGFO?=
 =?utf-8?B?OVFUUkFJS1Vmc2twblg2R0d1VlR1NXpFWmJsU0poUEdzbFRJd25ML1MycnRO?=
 =?utf-8?B?bTlDRUM5WWNlWFRLRDN6Yk5aSnYwMExzMWFYaHA4MzgzVElFVld5QUhNeE1Q?=
 =?utf-8?B?SXV5ck12bGtDZlluRUsrK3VrN1V1UDFibi9JMnQ5dEFlSE9EbDM4NVBOeks5?=
 =?utf-8?B?eG9mZWFlUjFpMHE1alRIOU44c08yeGJob1lQajlzTlpTTnRLRlE3NDJURE9j?=
 =?utf-8?B?QVhvREJOQXMzZHc2cy85R3o4Y3ZueXJuYUdJTFg2WDhnMGdWTkpKWnFxV3dO?=
 =?utf-8?B?UmpjNHVPNURJU0wrWTdFLy9uc2ZMc0JPWlAvSmFyc2gxWEF6anUwZHFRVnZv?=
 =?utf-8?B?SlRWNVdZejI2a3plUWV4WjRkZFNiTlBvbTR3S0t5ODI4VnJWUlBwQXpVVlZu?=
 =?utf-8?B?TDFaTmdhUkVONGF6MFRzUTYrY0F0cTdZL3hMU2pZbzF3WnN2R25UY1hwSnYy?=
 =?utf-8?B?Uk91b0dWenNTUi9meis5a09XNG52NyswSkVGbk03UHlqODR1TkJqN2JKT1Nw?=
 =?utf-8?B?bmIrcHFjOUZ4eGhRVEVPd1BiTzhVaEhaYmhzWWNlVEZIOWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:07:30.7644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 317d7eb2-1f12-414d-11d9-08dcfe74bc48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6936



On 06/11/2024 14:41, Luca Fancellu wrote:
> 
> 
> There are some cases where the device tree exposes a memory range
> in both /memreserve/ and reserved-memory node, in this case the
> current code will stop Xen to boot since it will find that the
> latter range is clashing with the already recorded /memreserve/
> ranges.
> 
> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
> in the /memreserve/ part and even in this case this will prevent
> Xen to boot since it will see that the module memory range that
> it is going to add in 'add_boot_module' clashes with a /memreserve/
> range.
> 
> When Xen populate the data structure that tracks the memory ranges,
> it also adds a memory type described in 'enum membank_type', so
> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
> function to check for exact memory range match given a specific memory
> type; allowing reserved-memory node ranges and boot modules to have an
> exact match with ranges from /memreserve/.
> 
> While there, set a type for the memory recorded during ACPI boot.
> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> I tested this patch adding the same range in a /memreserve/ entry and
> /reserved-memory node, and by letting u-boot pass a ramdisk.
> I've also tested that a configuration running static shared memory still works
> fine.
> ---
So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
and the changes below look a bit too much for me, given that for boot modules we can only have
/memreserve/ matching initrd.

Shawn patch fixes the first issue. AFAICT the second issue can be fixed by below simple patch:
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 927f59c64b0d..d8bd8c44bd35 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -586,6 +586,10 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)

     add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);

+    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
+    if ( ret )
+        panic("Early FDT parsing failed (%d)\n", ret);
+
     nr_rsvd = fdt_num_mem_rsv(fdt);
     if ( nr_rsvd < 0 )
         panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
@@ -594,10 +598,14 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     {
         struct membank *bank;
         paddr_t s, sz;
+        const struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_RAMDISK);

         if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
             continue;

+        if ( mod && (mod->start == s) && (mod->size == sz) )
+            continue;
+
         if ( reserved_mem->nr_banks < reserved_mem->max_banks )
         {
             bank = &reserved_mem->bank[reserved_mem->nr_banks];
@@ -610,10 +618,6 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
             panic("Cannot allocate reserved memory bank\n");
     }

-    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
-    if ( ret )
-        panic("Early FDT parsing failed (%d)\n", ret);
-
     /*
      * On Arm64 setup_directmap_mappings() expects to be called with the lowest
      * bank in memory first. There is no requirement that the DT will provide

I'll let other DT maintainers voice their opinion.

~Michal

