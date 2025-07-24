Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B01B10CEF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056156.1424327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewix-0000iE-47; Thu, 24 Jul 2025 14:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056156.1424327; Thu, 24 Jul 2025 14:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewix-0000gh-1G; Thu, 24 Jul 2025 14:15:07 +0000
Received: by outflank-mailman (input) for mailman id 1056156;
 Thu, 24 Jul 2025 14:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Qx4=2F=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uewiw-0000gZ-AF
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:15:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2412::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d59782f-6898-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:14:49 +0200 (CEST)
Received: from MW4PR03CA0277.namprd03.prod.outlook.com (2603:10b6:303:b5::12)
 by DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 14:14:40 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::d0) by MW4PR03CA0277.outlook.office365.com
 (2603:10b6:303:b5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Thu,
 24 Jul 2025 14:14:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 14:14:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 09:14:39 -0500
Received: from [172.20.135.109] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 09:14:37 -0500
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
X-Inumbo-ID: 8d59782f-6898-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L17lhswk8+8x+xN3P1Qt4CXzdtt4Luqad1uT8cxM5Xhpi2sgGfqRTlMwFO9c+wJpE/DldNCtd4Gk6xVK6bNg9orchhwsnVjpo3KvKrWXX7Kwrjw1N2VyRDqnZTHcg501jDezUF7lvd8cSJMLktc5JrQ2KQJGo/tO5SVpZ/CBdd8SbATcUyoGl5O/MFmDYF98iPS97qJs5pYvRHZVJzkvz1Hw+TLGcKOKtiVObsLdo6W6SzxL1mLMn1hTBm/kZjoXY8t122RXT0i2STjbIZPjxDsWCy5pfZCgl5iEr6w5VNs+AMtf/D1ZwdFBQHnqH1S2ARTE0xR44314hpytlQCF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piFjnQMGW7ohJbHPkBNKz8dr3T7e/7nke42T/lRvTzI=;
 b=x1HnsUE0fcdyZSEIV61f4OFQF2S1ZTQ6e4YCaaE8KwWIeTiL4Smvu+NQbI/iCjLZc4P095jVgXPdesJRYyMk7qv90Fdv1XsVy9tvnyi4rRraVuuCJfs4H9pBpg8fK/mfa4azDoit3vM1r55h5juka9C69P4XudHwbopepKrUaou8e3QcN0VOd4JoN24Id4nwKRLYyMkMDduNkGlyfJd588Ywdh3CblgM0APxdoOe10dqB1az8hrmWG+xmDET+dprhgbk7dtvZSX4GBR3o4FxR3V7kIhGJ/9B+TWakbXg/cekUJy5e7Rmm3RjHxlVyKpwU4c2mJ6qub5jmKwMImytNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piFjnQMGW7ohJbHPkBNKz8dr3T7e/7nke42T/lRvTzI=;
 b=4Cf82ALguABuXnWsc32ndFs1tTj/b+l/hId9DG24ogSNY0Mb9GSZN5OZeLEI65yTDrDVb4WTilKsCPIijODo42FFA0wpCK+fKwqCAApMyEQSuQqv/ldKHVisMtwRa5CQXjHCoAaSn2ij6AGEhABcakZTxBXo8JCPYgbFW/GMLtY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3033c88d-b9bf-49b0-b3df-8d4fa7886396@amd.com>
Date: Thu, 24 Jul 2025 10:14:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20250723181330.14305-1-stewart.hildebrand@amd.com>
 <4004ecba-71c8-4b82-bd65-e1967da94352@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4004ecba-71c8-4b82-bd65-e1967da94352@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 70aad46f-fbf3-466c-c9b9-08ddcabc6dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHh6V0l4bXg5YUJJcDJPOHVwSE5lWHdGR1ZJT3lmL3d3d25JVGRUcHcyMVBy?=
 =?utf-8?B?YS9NQ240YldXaS9VZlFCQ1RyOXJHZTllb2Q4YiswUHdqNjlEZ1dqU0d0ZERP?=
 =?utf-8?B?WDEwOEZ1OWd6eWd1WVhGYzlaZFFYc2JGV3dQUCtKR1BRVmpMdyt5N3pLZ29F?=
 =?utf-8?B?UHVsanc5NGJIODBRcTk5SnEyZ01Md2RNaE5VMHFXWEdkelZaa2RpT1VPMTIv?=
 =?utf-8?B?SGo0Z0FHWVgrSlFKbytXZlJQdlZLaldPZVRiTkw5ZnIvYVoxQldzTFN5WnBO?=
 =?utf-8?B?WjhaYTFzRHJUUzJVQjFGaWt0N2dHcFQyOThyR0tTWGVjSVZiOXdad1I2QkFP?=
 =?utf-8?B?Qm1uTTcwYVYwZzNMNERRZi9wOGRnc1FkMWgxTE15VWMrNjRyanJncmkxUDB5?=
 =?utf-8?B?blpWOG1jaU4vM2k3NUNIRkVjaTFLbEFwaks0aWhkM1ROSmd4WGxydXpxSXpp?=
 =?utf-8?B?ZnI5V2hhb1pkaXE1QzUvcHV3cXZEVEdWRHhOZUI5ZUhpUjhDNzR0eTdHRW0v?=
 =?utf-8?B?RmcxNEpMNE00RVFsdk1iYTJYb0w2dXlKNDBxWDFvWjg1QllzekZzdTZVZ2RY?=
 =?utf-8?B?SU9CS0hiUkpXRm9EM0d6ZzRrYkFPNFNQVU9JZVFMS2k3dlc1ODJLdkdJeWh5?=
 =?utf-8?B?U2JPRktmTTNMd2xnejFuSzMyR2hNbFFkSzFRZGJ1OXQxSFhXL3AwdmZGQTRM?=
 =?utf-8?B?MEZJNWRiK3FleFcyMHIyWWREeXRXeEVQbkxHZ3lCZHFGZytjSndKV1FWbEhk?=
 =?utf-8?B?bWlMSU1FQTVkUzVWc05PY3hOVXd4cC9DZWtzS3lkWnpqYURsUSt4WloycWZI?=
 =?utf-8?B?TjNodkJuS0l1S01lY1psaDh3dXRpNS9LczNPb0d1N3JtVVd0VUZOV0dCSC9x?=
 =?utf-8?B?b2lPcS85MEU4S1lFdklMUVI3MWdHY0FHaU5IVjJuQWJTQW1CU3djYnlwMmZs?=
 =?utf-8?B?a3Y0SmtVeU1mbUZwUWRPYi9qMlBMTmRKRzVPSlNEdlVkT1pmTjhGVnk0VXF4?=
 =?utf-8?B?dVdrUjU4a3JSNGJWcTErUUdLelJKNEwveU1UYVpIZE5lZkpFaXZNV1VaZ0Vs?=
 =?utf-8?B?SXJHdngvMitxbXBVTHJ5em84QWdnbDRHTi93SEZRZC9saEgyMG53cWQzOVFj?=
 =?utf-8?B?MUpUQkpVS0ZmZFN0SGl4SHN3V2liSVlXUFo5Rnl3OEFrRjBydE9RRll4TU10?=
 =?utf-8?B?TkZ0R2dkdUVVWWtkL25TQkEwN3BvSmRMQlpjeTJhcEJXWllORlZieGxCQmZo?=
 =?utf-8?B?MnpUR3BXVHRDTzArR2IvSDgzbGVNVEcwelIzb0M1VDl6YUNXa3RLZDRlWDRh?=
 =?utf-8?B?NGpqVmYwQ0VqckpSdjloUnZnb25FV3FZcWxkSkZqNXBiaG9vdjJEWGM1eHZV?=
 =?utf-8?B?ZkFYWWtMVG90bEdvT0ovK2p4cUkwN3Y0L1NkUlF1RUNmaDNwS1ZCNStMdVJC?=
 =?utf-8?B?aHE0WGhXaWZuaEp1WTkvMGpuZ3JKaDZYU2loNHFvOUIrYVd6ZnRleGZ3K1E4?=
 =?utf-8?B?T1pGOUMxMXkvclRCOU5ueHRQQVpleFE0RDI3TVVSN0UrOGVGYTg1WjJVUXJM?=
 =?utf-8?B?L3lueVgxcXpSdnpIVy9CQUhFbUxINFdMVnhFclhrbkt5VFpETXZ4UGNFS1lJ?=
 =?utf-8?B?aFlHYmtjZ05UUU5uV3pDNkxrSmlQUC9XUldXSUhUaEVPYUdCZXp6Y1pMV0Vv?=
 =?utf-8?B?bWtZN0RUTmxqWENVWnZPd2tUTmkvS0ZWZ1F4enJQeDZETEQ2STcveHRNWFdN?=
 =?utf-8?B?U25sY1pYMDEyZFpUa3FKcWJkMVZIVTRBeVRKVEo0RXNKRGJaY1dwQ3ExMkxG?=
 =?utf-8?B?VnY4Q2tSdXdUWG11YTVxNTRtT21FQVBqOThDS1FGellSSVUrMnR5RS9hcGQw?=
 =?utf-8?B?MzNuU2FwZDdxQURWc0grZ0IzYnY0TjFmLzdoblFCY2VRYWdNMVQ2bGhMdVF3?=
 =?utf-8?B?Zy85ZjM0NzBRN3p3bm81V1lTcjRrSFQvbFgxcUpNdDRQWUdIM2hqTFFNdFlk?=
 =?utf-8?B?MmZzNW9EYjd3Lzl4bjMrcjNvTWJ0T0dYQ1dyZXlRUEZlcFJGTk8yc2FKUkVn?=
 =?utf-8?Q?FxTE+b?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 14:14:39.9734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70aad46f-fbf3-466c-c9b9-08ddcabc6dc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199

On 7/24/25 04:07, Jan Beulich wrote:
> On 23.07.2025 20:13, Stewart Hildebrand wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Up until f9f6b22abf1d "xen/arm: Map ITS doorbell register to IOMMU page
>> tables" the only caller of iommu_map on ARM was grant_table.c which has
>> a specific usage model and restrictions as described by the in-code
>> comment in arm_iommu_map_page.
>>
>> f9f6b22abf1d introduced a second caller to iommu_map on ARM:
>> vgic_v3_its_init_virtual. This specific statement in the
>> f9f6b22abf1d commit message is partially wrong:
>>
>> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
>> virtual ITSes are currently only created for hwdom where the doorbell
>> mapping is always 1:1."
>>
>> Leading to crashes any time the hardware domain is not direct-mapped
>> (e.g. cache coloring and non-Dom0 hardware domain):
>>
>> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:47
>> [...]
>> (XEN) Xen call trace:
>> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
>> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
>> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
>> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
>> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
>> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
>> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
>> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
>> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
>> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
>> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
>>
>> Specifically, non-1:1 hardware domain exists with cache coloring
>> enabled. For that, is_domain_direct_mapped(d) is false but
>> domain_use_host_layout(d) is true.
>>
>> Change the is_domain_direct_mapped(d) checks in arm_iommu_map_page and
>> arm_iommu_unmap_page into domain_use_host_layout(d) checks.
>>
>> Move the in-code comment specific to the grant table to grant-table.c
>> and adjust to be architecture-neutral.
>>
>> Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v3->v4:
>> * adjust comment to be architecture-neutral
> 
> Hmm, it's now arch-neutral, but still not quite correct.
> 
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -1274,6 +1274,11 @@ map_grant_ref(
>>          }
>>  
>>          /*
>> +         * Grant mappings can be used for DMA requests. The dev_bus_addr
>> +         * returned by the hypercall is the MFN (not the GFN). For device
>> +         * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
>> +         * p2m to allow DMA request to work.
>> +         *
>>           * We're not translated, so we know that dfns and mfns are
>>           * the same things, so the IOMMU entry is always 1-to-1.
>>           */
> 
> The original comment, for a reason, talks about DFN, not GFN. The relationship
> to P2M (where GFNs might indeed matter) also isn't quite clear to me:
> iommu_legacy_map() alters IOMMU mappings. Which may or may not be shared with
> CPU ones.

Ah, you're right, I assumed iommu page tables are always shared with
cpu... A bad assumption, sorry about that.

> 
> Fundamental question: What exactly is insufficient in the comment that's there
> already?

Nothing. It was nothing more than trying to find a new home for the
comment in xen/drivers/passthrough/arm/iommu_helpers.c, but perhaps it's
better to drop the comment altogether and leave xen/common/grant_table.c
unchanged.

