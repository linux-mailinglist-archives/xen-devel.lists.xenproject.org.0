Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCC8B1C7A5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 16:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071872.1435232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfAt-0001wE-Ka; Wed, 06 Aug 2025 14:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071872.1435232; Wed, 06 Aug 2025 14:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfAt-0001td-HC; Wed, 06 Aug 2025 14:31:27 +0000
Received: by outflank-mailman (input) for mailman id 1071872;
 Wed, 06 Aug 2025 14:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPx=2S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujfAs-0001jI-88
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 14:31:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 072f1ed2-72d2-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 16:31:24 +0200 (CEST)
Received: from BY3PR10CA0010.namprd10.prod.outlook.com (2603:10b6:a03:255::15)
 by DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 14:31:21 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::f7) by BY3PR10CA0010.outlook.office365.com
 (2603:10b6:a03:255::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Wed,
 6 Aug 2025 14:31:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 14:31:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 09:31:18 -0500
Received: from [172.17.35.128] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Aug 2025 09:31:18 -0500
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
X-Inumbo-ID: 072f1ed2-72d2-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTQWpqrOu7G0eCsVloHhT+mI5Wc1fgodIdLuNWynLUAK0PdR9zizjmkNxHRhGM3IuB0AZio5YRQLW7NZlWQmA+wPUoBjLc+YYLbN6B/vkyK/A49JbHvUmqAmnC3oSjv7hxGUw7mZT2nxaz0nZw9yG3NB5H/TzojNAc2z5wjx+NeB+WNST8tUciclCO3YbG3IbG18x+3CACYuG4cfRgpKxO499tRmVyl+gZSZiJFZz2RuOAZyFGQd5/JE+JdRJIrW9J8HfNYEpightYH0za40onxOiKq+nP3ypTpKn+jlDTLMKS9flWGe+vkFK5PFq/WtfYO5A3MHkZQZg9nnFd4V3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaxQgQDECCLvFYAOX1ZPAH3MZYbZQIBrg+H1izWfFic=;
 b=JKneQBaea3INg4nljj8C/AWOjlQUsyOlUc9x2ZRwtFSf3hWu7STydl+D3VhslyslLa+ICy1mdagIyFydZzZ9JDxyqqFV+2tyf/ApVe54feBhMzWjtDvbu7r7BGjejKXMlAKAPY7s16/yMYwSDYMHPpXsC81S8hj0y9CA896vHumIu7qd+tXIqoi8EUb4I+cgTeg5rQ8vilgkjptX9nz4fIi4h2RYFd+elo28NrQ4VLw32DJfo8HY3jZUQAGhOh3FPc/eF697NnIp7TX0b/nFfdXhEBOUEvumVKYCSHsZ3vHvCQ6RXy50yFNhoZMqLfirqArHF5reK3eUJ/gc/iIbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaxQgQDECCLvFYAOX1ZPAH3MZYbZQIBrg+H1izWfFic=;
 b=b+fK3Knzk+2jFexPyMATXAd1MqkRamrUvAr0f9MOpIc18kKV8IHpUFQtvf3RbK5VtOKkeWZBWZhZhMOgyXwSir9CTbatrnbFg9ZjZKk4K9Fx6CXtOQCB5Z95GZea5KstHa7E1GRw5iG+kpauD136krFfziblIqLWoFK2HT7RzhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6de94af6-f3d9-4a1c-9d0f-22332e721c57@amd.com>
Date: Wed, 6 Aug 2025 10:31:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] xen/arm: allow translated iommu mappings
To: Julien Grall <julien@xen.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20250725140130.4008-1-stewart.hildebrand@amd.com>
 <20250725140130.4008-2-stewart.hildebrand@amd.com>
 <02f0d392-c817-4c5a-9b74-6a0f2e6e18ea@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <02f0d392-c817-4c5a-9b74-6a0f2e6e18ea@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DM4PR12MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a142df-6e89-4080-79fb-08ddd4f5e951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkwvd1QvNlAwaytGRXRmRkkrWUdVcVNRSDR5c3FhUlM4bU9zQ3NqUzhia2lC?=
 =?utf-8?B?L1p4dkg5U0o3ZFkxMnA0aEkzSm5QM2VoZCtPZ0E1U1p0VWZ4dDRKKzc1cGhC?=
 =?utf-8?B?aWtkNk1yYWQ5Sk9Rd3Jwbkg5NVlsKzFXS0piWXpMTzFlWHEvcE1FRitQcjNX?=
 =?utf-8?B?K1NtVVc1bDM1NlYyYWRqeG5aSkxEMDR1UFBHQ0RhaW9EZ0tldXg0VW1BUmRk?=
 =?utf-8?B?aXBBbGpxa09nbEVPelhxcGRORjloRWlVMkhITXlKRDBmK0t1dlFBM01BNHNB?=
 =?utf-8?B?VmJwV1ptUnhkNks2bWVGUkIxQ2lqQmIvVkVkTHpaWWpuNFY2OWNTTkRkMERU?=
 =?utf-8?B?NzZBVDlia08yZEtqQ0Uyb05WUFNXRiswcmlBemZrM3JTRDJuUTVUcFdoVUFl?=
 =?utf-8?B?aUlWZDAvQXZHbjBGSVduaGx6U2pwN3lZT1dyY0ljYmZXVFB6a1E4VjRJWmkw?=
 =?utf-8?B?VFdwcHljNks4K0E3R1lTTzRtdkxFblpWSlFqbCs5b0s2MC9TNUt3SGZDOHNs?=
 =?utf-8?B?andRSVIwdHRzOTdBU2haU1FqQlRicXRTT0NFNDQ0ZlVWZWJXZkg5OU55bmMr?=
 =?utf-8?B?NldmNytqNUVHUVJLTlg3R08rQmxSRHoyeHRUZ3BJUC91eGsvZ0hSNFJ4Q0pM?=
 =?utf-8?B?RWdiSnhaV3FGNXBIRFNRWE44eVFjTWdUNC95bG1jOTBHUFFFNnUydDM3eU84?=
 =?utf-8?B?TXI5QUFVUG4vYU1ueXFyWlkvV0g2b3pCdXREM0NBNVl0dzlucDk0UVE2RGNR?=
 =?utf-8?B?TU96aS9aajNmZnFNSjVNL1cyRjF0U1BOaU1qeFI0OUhsbUpOMFZSekZwUTlJ?=
 =?utf-8?B?dEQ3TWZBbzA3UnY0Si80NTAvMXk3dzRKeCsvMk1wOER1cjdYSk1JaE9OSUEz?=
 =?utf-8?B?dWZjN2RiNHJkNzR2MWNobVhiTk9SaExadHpkU1pPaklCN0xXWjBqZXBEYzZO?=
 =?utf-8?B?ZE8vOHVsMVErdGJmS0RENVpmYyttRWRRWDlrNDd4QktENjcxaHh3OGJicEZY?=
 =?utf-8?B?a015Tml2VjhCTkZZa0xqc29hSEhleUo3bGVvN0hlYjNmb3VYTVR4eWpFbk5E?=
 =?utf-8?B?eVdTZWNrMXFsZ0F3OHkvMzBWM3BZeUMrbHc0d2JQbzMwWnU2L3kvWDIwRnhZ?=
 =?utf-8?B?OWg1MWhBckYzYkg4TmFNQlA4N0FzOFI4WWhUQnphL1VubUtEL29LRSt5Q1lU?=
 =?utf-8?B?Q0dOaExGWGFwenZvWDd5UmtVZE5nU3p3L3diV0lINmxObUlFY2VCdEYwcndO?=
 =?utf-8?B?M3JaR2RuR1Rvb01ZZFZRbkQzRFduMVdwUG81S3BFTXVGd291L1BVNlVWYU4z?=
 =?utf-8?B?ekJhZW52ZG1YU1pXU2lkb2w4SWFoZnU1ZGhQY0QxVW01TUNQLzM3NGlrT2Ft?=
 =?utf-8?B?bVlmVFRjUHdYcE1oOVd4eWVRSnB4UmxRQ1BMNEYrcUwwVmRielRYRTVoQjNj?=
 =?utf-8?B?RVpOVm03QWlNc1V3c2czWUVCeU5WVDlJYm8wVldWTWN3V25hdVdYNWlrM2lZ?=
 =?utf-8?B?SHBId3p1QlhyaWdQNUtjdzFjTGlEVTdvNHhSSFdJZEJjbE1EN0ZKRENIMFNX?=
 =?utf-8?B?Z2x2Q1lSR0l0R2x4UnBVMmpHZFF0NWg3MWZGZG9yM1RzWjJBQUJWaGM4dWJ6?=
 =?utf-8?B?MWkwT3V0WU1pN2E4cG9naktBSWRiNHc2eUNGd3djd2JEU1RnUFlHbWZTTjlx?=
 =?utf-8?B?eThDcU83NDNTdkxxdGMwSzlKcE5kM011S3dwZkU4NzFzZVpUejIxRDZHSGFZ?=
 =?utf-8?B?RmFFTEJzRUwzQUpCN0g3Zm8wdE5heS9Sak1SK3ZKdXJrOEdWYW0rSEo1NEhC?=
 =?utf-8?B?ajExc2dqdHJWZ3kzZDVBVEFTbXcyQ2ZqR21OL1ZVc2tXOUc2NURMMFR1Ui9C?=
 =?utf-8?B?VG5FNU1GVjVSOStxZ041WVV1ZE1USUpkSXA4OTAySjNadVJjZGpacU82MWFU?=
 =?utf-8?B?UkE2Vm13VzBQUXR4QUVEVGtlODlBNGFOcno5QVJOLzZYWVdwS2lKMFZwRjMw?=
 =?utf-8?B?REtSU2RqRXJhL3BJRHJ2bUY3MjNjZEVyTFV5c2tpWXlORkhqeXUrU0JnbXNE?=
 =?utf-8?Q?fwUgxq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:31:20.1554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a142df-6e89-4080-79fb-08ddd4f5e951
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794

On 2025-07-26 05:23, Julien Grall wrote:
> Hi,
> 
> On 25/07/2025 15:01, Stewart Hildebrand wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> In preparation of exposing vITS to domUs, generalize arm_iommu_map_page
>> and arm_iommu_unmap_page to allow ITS doorbell mappings with dfn != mfn.
>>
>> The mfn does not need to be passed to guest_physmap_remove_page since
>> there is no mfn checking on the p2m_iommu_map_{rw,ro} p2m types during
>> unmap. Pass INVALID_MFN to guest_physmap_remove_page.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

