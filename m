Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E41B1C72D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 15:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071803.1435174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujefe-0002Ye-V3; Wed, 06 Aug 2025 13:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071803.1435174; Wed, 06 Aug 2025 13:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujefe-0002WR-R5; Wed, 06 Aug 2025 13:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1071803;
 Wed, 06 Aug 2025 13:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+iWh=2S=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ujefd-0002WL-2l
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 13:59:09 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2412::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 833ae05b-72cd-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 15:59:06 +0200 (CEST)
Received: from DS7PR03CA0002.namprd03.prod.outlook.com (2603:10b6:5:3b8::7) by
 SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 13:59:02 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::8f) by DS7PR03CA0002.outlook.office365.com
 (2603:10b6:5:3b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Wed,
 6 Aug 2025 13:59:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 13:59:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 08:59:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 08:59:00 -0500
Received: from [172.17.155.73] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Aug 2025 08:58:59 -0500
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
X-Inumbo-ID: 833ae05b-72cd-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN+uGJ3ZluUxBpUYEdGIi+0g4S+YhprPYAJP37X65VgzjvH5qBJE+zVMs6aqY8UH28y86e05A74jkHCy+GGqDGKgofe5NU3/Hr0MD/7nC+DfKrUcf9jVFiQszDHAKPSxwpdmubdAcmJXvPOdaaIeq0pzSs1b7QlbiPxpmUClE1Dx/kRo1Kb6hNalGxoPPOuX/bHHB1vU39BV1nyvxV2S48p+TpUnNZf65EjaeG5nzYj/f8kRbeisvJqch+YUmYMM4DnFs89odJ6FefmLZ2n2wwvcrhTY24p+5MBpE2cd2lj+OqK9i/f7nyc1kOJRGVlU9pIan4BEhmXDFJPAWXd/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6On5oSpWZ/57NDRbW88a6PpTtm95AeMleWpwBtFVKM=;
 b=vyJISeJTvPKj2Q8imlu9AZhf4KaT8Gexm77LfqQ0H+URJ0YTdW670dSFIPeA8gagYyuvRMyKWA2iWs0mLDegJbsOkzpM67WHKlWplpom7/WkoKMg5WpcII1+r0nOljkI+58Mh62XVq2Y54t1ON3dOCHzMZ/AFqwX/CzGPIgqwveCMjsRFnnKH74e6RGBH2yzjXkf2ql1DCo49NxcD8jUzooQFKwGRfk09xRWVNEystuDw9GlybqTYiBN2RevURsnIx6WwBbQl7G3FwiD5ynF+D39PwbX/pfjQOcVZPEfZTIAvd+cBWVg2TNiig8QlRAmtmkufzewmiZhQaBd3Ofygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6On5oSpWZ/57NDRbW88a6PpTtm95AeMleWpwBtFVKM=;
 b=OHbAxYpGmm9m2bbvrvuAdpWWhkzNZ8dhqQi0E/4HwyAkT698u19dws3vNsTgqeLb4Vpa3/f6k0SA1JH3v7gtPeDMPe/7eXF3NGxykhTWqsHYTqJsBQB5lmyJVLmYA528J0OLRuhcKY0ScYKB/o6yiVArCHkYTAA4IG+r21HgUWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7a3a08f4-c08e-4490-a033-53e81b261181@amd.com>
Date: Wed, 6 Aug 2025 09:58:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250725140130.4008-1-stewart.hildebrand@amd.com>
 <5fab90b6-7cae-45d0-bb8e-b1ffa0390b6f@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5fab90b6-7cae-45d0-bb8e-b1ffa0390b6f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|SA3PR12MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: e380959d-2677-455e-d0c7-08ddd4f16596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjMvV3lVMXFsYkdDWDUvaHoxUUdpS2EzOEw0YjE2TzhrVDV6R2RxMnZVdW1G?=
 =?utf-8?B?WU9xRTg1SlZLODBPL2R1ZlFqNmx2Q0dCOGJja1lEU3ZkcE9EalgyS1MyeFlX?=
 =?utf-8?B?d2t6aFh6ZFdCYTA3NzJVZlRDOEFNa2F6L0ZncnUvc1JBTjlVekgzNzlGS1FP?=
 =?utf-8?B?Z1BkT09kcXdZM0cvY1FPOXdIcU5kNERWdERFNkU5OFJtMjhLZDhHZ1VzWnhZ?=
 =?utf-8?B?VXNuZm1Ra2huSnJ4amVycElkUitaRXE1MUt6cE5tRCtNUmxlQzhlb0txcDNH?=
 =?utf-8?B?eFhCRFc2cW1vT3FkcFprQmZGd3hSMFZMZTBHNGxjRXU2NFFTRk8rcitzRnpX?=
 =?utf-8?B?ZG9LY3JpSlNldGgwcmRmaDNqMXJ3L1NYMmxuUVlmbFQ5dUg0cjduWGZNNnBG?=
 =?utf-8?B?SmIxK280L1BVVGt6akNucHdqcU1nNUx0TXNHZXVxc1ZGcGpQV1BtWWtlcFdY?=
 =?utf-8?B?MVpQSy94Qng5WmdwZEd0S2xkcXNHc2R5ZHcvRFl2YklqVW94SFJRanpINGVa?=
 =?utf-8?B?WXB3YXo1QWxiQk9mdWRMaGRjd0NaTVpDMXBZdWV1RXZ6cUkxZFp6cHdMaXhi?=
 =?utf-8?B?YzZod1k4bkVtSXFjVElGSjVsMTFoNlp3cEdyMGk4SmNLbHREZE42akErTXNu?=
 =?utf-8?B?cU9lbTA1LzBRWUV4M2IrSEwwMEQ1UUhqV1dnSlZCRE9kQzFxbUFmKzhZTFFQ?=
 =?utf-8?B?UGpvdVlkVXkxTGFXSzI0N3QwSUo0d1ZUdERIUisxdzMxV2RmVUw2TGxycnFC?=
 =?utf-8?B?Wmx5Q0dkUWVTUTJTcmc2RThETU9SdTNtclVybDExZ2x6ZXhnNlpheVI5cG5s?=
 =?utf-8?B?MUVYZjNEdkcxTTZwenJIODdBUW9HTHczYUp6eTlXTW80VXBaUDBVeFVSMmxV?=
 =?utf-8?B?R0M0Rkg1Wm9jaHB3WkJaSzlzQVBET3cwZGsvK29ycitzakdJM0FUbGVwQzA4?=
 =?utf-8?B?NGxYTVhyamMvWTVBdkxBVHpuUE1FL1R4QW1XeTM4dVV6ZDRjMnEvYlBsYTg2?=
 =?utf-8?B?aTBSTmRxN00zTjQ3aEJIY01xV1Bma2t5Kys3c1kyQ0J5bmFEa1Iyc3RLNzR3?=
 =?utf-8?B?Z2tFV0RMMmJKbzVHK29NMytQR2J4L2FXemRON1NCbkF3MHRJaFNlL1JOaHFM?=
 =?utf-8?B?aXAvVHpJSDZwaFhGOHR4TkhZTnJwVVdMbit3RGRSekVzS3VRWDh3YlRXRlVv?=
 =?utf-8?B?SmxQSExPd0ZldXF5dURPSUd3akVSRE1mYXk4dE94ZW51Ykw2UFIxSVBmVGI0?=
 =?utf-8?B?TDRQZ2pTam9xTTUxc0grZWptcDNTVG1GYXJSZlozYlpaNVVoRG1SRFNHUEtT?=
 =?utf-8?B?WTZGV0wzQ1BUTHRIVW10cFBpOWdxT24rWFB1Mmx1eUduaTRIZzdxRjl4N1or?=
 =?utf-8?B?ZHYyZ3dWOHlzS2hhRkh1ZzgrZzNwMzlFczliRk9LTk5WN1dFMUdHNEZqYjlV?=
 =?utf-8?B?L1k1eTdOcnVYVWwyc0tGN0tiOUtQU24wTjVteGg1ZXNXaTVxb2RCRzFtOXpZ?=
 =?utf-8?B?UlQ0a0RFZU9xV0VicEVkN1g3N3dwOXIyRjNvQ0RpRGdBV1EwR0NQV20raTNN?=
 =?utf-8?B?akFISXhYdk9ZdFF3S3VEVlFBNUVqdFNXbm1sbG0vK3JyaGx3djMvenN0NTl3?=
 =?utf-8?B?RFFkTUNvQm9lV0xYR2ZyZGFFa2RGYmdRS0xlcGdaRVF0dTJaTHNEb0kybVM3?=
 =?utf-8?B?VzhDVk0wTmw4TmdFMFI3dDB5L0IwZXFxYlZtcDdqN2VLUVJONXJiNTA5NHFT?=
 =?utf-8?B?a1VNL0VBa0kvRkNkenV5Y3M2Y2w2OHAwR0FnbVFNN1diNHpjRVdrTWxUWVVM?=
 =?utf-8?B?OGh4UTRkMXk4a05EZVE1UXpKTVcrdkVjWVJYdUZxZ1Z4d3dLSXJzaVZjWGtp?=
 =?utf-8?B?eG1XN2lmWjhHVWwrQ29UcitPNnlQUXl6QVdEdnFhaVZtWUNhbE92ejRYaGhG?=
 =?utf-8?B?aFdjR1JnbWg2YUFlTmJneTVEZnlBN25kRFlTZ0tHT2wzOVVQWGk4MDdTZm4x?=
 =?utf-8?B?eC9TWXkwOXBHNjducnUyVExTV0lMbk5SUVNBUC81bXNrcXJuVmRCMzM2UUt1?=
 =?utf-8?Q?E/3NAy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 13:59:01.2286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e380959d-2677-455e-d0c7-08ddd4f16596
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763

On 7/26/25 05:23, Julien Grall wrote:
> Hi,
> 
> On 25/07/2025 15:01, Stewart Hildebrand wrote:
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
>> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
>> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
>> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
>> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
>> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
>> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
>> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
>> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
>> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
>> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
>> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
>>
>> Specifically, non-1:1 hardware domain exists with cache coloring
>> enabled. For that, is_domain_direct_mapped(d) is false but
>> domain_use_host_layout(d) is true.
>>
>> Change the is_domain_direct_mapped(d) checks in arm_iommu_map_page and
>> arm_iommu_unmap_page into domain_use_host_layout(d) checks.
>>
>> Drop stale in-code comment specific to grant table mappings.
>>
>> Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks for the review! Is this ready to be committed?

