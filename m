Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90771B1B941
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 19:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070819.1434445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujLMQ-0006th-0I; Tue, 05 Aug 2025 17:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070819.1434445; Tue, 05 Aug 2025 17:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujLMP-0006rZ-T9; Tue, 05 Aug 2025 17:22:01 +0000
Received: by outflank-mailman (input) for mailman id 1070819;
 Tue, 05 Aug 2025 17:22:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjfC=2R=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujLMP-0006rT-1P
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 17:22:01 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2418::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adfbcab6-7220-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 19:21:55 +0200 (CEST)
Received: from SA1P222CA0064.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::15)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 5 Aug
 2025 17:21:49 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:2c1:cafe::9) by SA1P222CA0064.outlook.office365.com
 (2603:10b6:806:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.13 via Frontend Transport; Tue,
 5 Aug 2025 17:21:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 17:21:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 12:21:48 -0500
Received: from [172.17.35.128] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Aug 2025 12:21:47 -0500
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
X-Inumbo-ID: adfbcab6-7220-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8mKRkE6CRnS7/hX3Q33KRAwx+nOYrRmzu5PD1C+5LlqIxCMQ6VVF5MkCjQiqxWP1e261XO1qP6ojni04+nMzL8Ut2LhWlJGB5VOqKGPxrFOENWa1+TdQKa0Rwwdsptott05dflpNe1E20KmrCrhO+zi5lwA35j6wddvN/ftYgpl/Tewi4m7a76crPO6FHsq91Pgx+LVzZLbp8JmAj1a7sEOMAw2HmLrDvqLAo7qvuUkqCpZWAxhClUU23IZ+ofTrLtuRYjE1+J3/Rshg+bwkObZ2akJ2m5JxzfQMiJ0Gt04sA6uyrILOrA0Ys1foQzz0ko4TzLEG67CJnzP82an3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtiIpBwFbTUaDMGzbHbXFv65uwFcj+S2UhPgeI3K+7A=;
 b=Gl9ylc2fXr8IecqjBxeJO1+9ViUvthzZn/BcZkXC7iESEiZRN3dbgPKQek/MMAQKHDV3Bjhq2mwJCW1EknQtgWKd456/zvnJ3K4p2Tt3y0SPT6UC7Ldm/W+MM0HBgoksACugfngysYg1FJs/QhSOX9k0yALDqWYP4I+zdUPdzliotPk9Jz13gnSqIkuN5hvsAWaws3wyiTdi0RuaZxEbdi2YHxOvUpmNpQ+cVD7Z2CXsFpq4BilLRsYWxUN/8HfNk606bolhqZvq8Etnf1Rw7L6UmcI5UJM6dQKhWK7rNGCn4VRxp7DaFZvhcJOdkki2jgdoiFJeznfXQxKCPYe6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtiIpBwFbTUaDMGzbHbXFv65uwFcj+S2UhPgeI3K+7A=;
 b=LGubpx00BrRy4xsafWODSmZRDQaiUi70mzu4pe7pRzcc+vuN+B6cqe+bdkq8UrvTogxlPfRUDUVRAwjE6ruwywqplBu2AEKdLvktm6iHY4kbDPcIQcvC2iyrwGeSnZEXxTMT9muy8BnDydYJ7GXP1Gg2dBbZfpidZ8g1PWSqF5o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7c867f77-3846-4b2a-a028-4dfb248a4fc2@amd.com>
Date: Tue, 5 Aug 2025 13:21:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/dom0less: arm: fix hwdom 1:1 low memory
 allocation
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250801155429.1402395-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250801155429.1402395-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d41a7d-89d2-4d69-26c4-08ddd4448fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2NESmd5cGlFRjBSRW5PcTNpbnF0S1UybHFWNHZ1QWlTU3dHVTlSOGhXcUQx?=
 =?utf-8?B?YWFUTWRVS29qN1I5cThDSlZSZEU0OFdQK3hkOEtHNENFTng3V2VuUEhNR1RV?=
 =?utf-8?B?VzgwbUtKUFdaTS9CWW9FYUdXaEZLR0pLR1gzb2hVS1QzVWY1YjRZMVYvUmV4?=
 =?utf-8?B?WWJXSmZjSnFmbW9md0UwcXhBWGx5Z3Bwdk1yZ2ovbjBFNDhHQndkNlRmQW1y?=
 =?utf-8?B?MXUwR1NuRUVjQ291OEZEQlFXSG1tZm91cFJPdFZwNUZWOVA1V2tBckJ5MUdW?=
 =?utf-8?B?OWZJcnhsc3ltN09nY3VZSmRubXJpckxkNWEyaS9QZzJISXpQcTJ2U0lKSjYr?=
 =?utf-8?B?UTZXL2xQMC84VjEvNGVIaTkwMmFra2xibE5rT1hYcXl4QnFKMEFWV2xXdXNk?=
 =?utf-8?B?SWkrOUJtSXpLVFFVR3JOcDNMTlVZazNRckdLY3N3blBwYmExanNKcjBJYWVL?=
 =?utf-8?B?eXB3NHZ3S3htVWZTZ2R6YlI4TFE5R2NoVldCSGxVRzE2T2VjdGhvMko5M0Nv?=
 =?utf-8?B?N3UyTXlvNUg5Y1lLajVtbUJBanhUYWU1VFA1SGxyd3UxT3pLU3lSckU0cUpE?=
 =?utf-8?B?UTZLRmNRamZkbHM2Uzh6OTI3SGFzc3JXTWxQSUk5cmlTZGtYaGFzQTVWc1JN?=
 =?utf-8?B?WmRQNGZqRVh0WEdUcER5Q2E5ajZNNUp2dVRvQmMyYVU2TUZYMXF1NHA5Y21I?=
 =?utf-8?B?ak1DNDNEUFV1Wmx4UjZ2RUtBWXNwY1NXNEZtSW9lU2ZWU3RTd0pWWm9sbStB?=
 =?utf-8?B?Yzk1TVR0TXA4bURpOWV0dG82WVZJaWJiYk5vY2VVOXhSeXVIM1JabnFZb2do?=
 =?utf-8?B?Nm1JZXFDMmJ5Y3pGNG95S3J2aFUxemNqRzR5U1RDbEJ2OEM1ZE0yNkkrVUxI?=
 =?utf-8?B?UENwK3BqU25IZEdyL1JaRXlGMUVGai9RYmdNb1c1KzNGWGxsQUxNNUVUZ2NU?=
 =?utf-8?B?Y2ZUUGkzK2hrZFI5c2hWQ0ozZUxXQUZkYWQ0RW5hemRIbkU3L2RTVXJ3Y0dG?=
 =?utf-8?B?TjNSUzJPSi90Q3NhV0JRRWlNcmhBczlQOHpOTUxOVFJiNFROSmx4UUZqVG1V?=
 =?utf-8?B?c3dBTHljS0hkUXhIemFOaThaNG92dHJWWUN0Y3M4Y09qUTYvWUZZbm9tQUpv?=
 =?utf-8?B?Q3p6a0xxbmRDYkZCQ1VOdlBnVTNVTy9GYTJBNWVhc0RGcGRPSHBlNTJXVk5B?=
 =?utf-8?B?TUdMbThKRnRTR0NKTnJTRW9oM1VTcGg0ci9rTzB0WnM1TkpqeXMrK2xpTjJV?=
 =?utf-8?B?TklBSDVia0tyMld1L2h6RFNDeGttaUF0cFlvTTEvNXVuM3Q1a3IrYUljd2gw?=
 =?utf-8?B?b1FtS2c3SmNUMzluM01EdGgxbTJUd1BJSURLSHM4RHI5VTVYUFVQU0s3NE9a?=
 =?utf-8?B?SGV6alBXYWQ4NGVscU5NQ014c0M5N0k4MU9iYWY4eUl5S2FlWFlNSitzZkZI?=
 =?utf-8?B?OFErWFJkNUhtaUpzUmp6TXgvMXdLZXNuTDkyM1E1S1RkOXhXQjAwYlZxMEM3?=
 =?utf-8?B?S3RmcmRpU1IwNUNNOUVCQnBCUWozbDMzLzVzTGZKYVF3d1JDV2ROVVYyMU5l?=
 =?utf-8?B?SkJBaklaZVBwSzJDOGlQcnJpckM1TEZNMVcvbmhxVnVERTI2c3o2OXZXV1A4?=
 =?utf-8?B?SWxMUzNkdy90VXpjL1lRUHlqUnVwQ2pRMjdBZmJobGhYN2VkNFdTK24yQ0lC?=
 =?utf-8?B?Umg3K0hzZjQrbW9EejhnY015U05qUW9nT0h5WFowWGZ6aFB1VGhJMjZSUmNp?=
 =?utf-8?B?MVdUN0JKNFMzS0tzdVBmZmhsYXhLNjQyQThVSHZLczdUNVB5MHF6VEp4ejdp?=
 =?utf-8?B?ZjNxM1ZKSFphQU1aM1R2WEZveFdpYkd2VFlDVDJRSlkreTFmRFhYZXdnT2U2?=
 =?utf-8?B?TlJUMmlsUWkxR3MzTVpyUFl4MXVQSzlRd3hnT3ZVLy9RZ1IzQzBQLzZDNkhj?=
 =?utf-8?B?bmE0OFMxNWdZSERNQ1dPbDZ4dUtlY2Q4UGZSMys4M0tCYXNYc2E1S2daL2ho?=
 =?utf-8?B?eFljNlBRS2dpRnErT2ZNeG16dVM4RzRMK2xKLzFhQ1M2VG1XajFwU3VqNTIz?=
 =?utf-8?Q?IEqZck?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 17:21:48.9382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d41a7d-89d2-4d69-26c4-08ddd4448fb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115

On 2025-08-01 11:54, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Call stack for dom0less hwdom case (1:1) memory:
> create_domUs
> |-construct_domU
>    |-construct_hwdom()
>      |-allocate_memory_11()
> 
> And allocate_memory_11() uses "dom0_mem" as:
> min_low_order =
>    get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
> 
> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
> which causes min_low_order to get high value > order and so no allocations
> happens from low memory.
> 
> Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has correct
> memory size in both cases: regular dom0 boot and dom0less boot.
> 
> Fixes: 43afe6f030244 ("xen/common: dom0less: introduce common dom0less-build.c")

I think I introduced this bug with the dom0less hwdom support, and the 
correct fixes is:

Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")

> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

dom0_mem is also mentioned in the comment on line 252.  With that 
changed as well:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

