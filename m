Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D34B39824
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097942.1452114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYqG-000061-Do; Thu, 28 Aug 2025 09:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097942.1452114; Thu, 28 Aug 2025 09:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYqG-0008VR-AX; Thu, 28 Aug 2025 09:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1097942;
 Thu, 28 Aug 2025 09:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urYqE-00075k-L7
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:22:46 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2009::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d8c523f-83f0-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:22:45 +0200 (CEST)
Received: from BN9PR03CA0735.namprd03.prod.outlook.com (2603:10b6:408:110::20)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 09:22:38 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::88) by BN9PR03CA0735.outlook.office365.com
 (2603:10b6:408:110::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Thu,
 28 Aug 2025 09:22:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 09:22:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 03:51:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 01:51:55 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 03:51:52 -0500
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
X-Inumbo-ID: 8d8c523f-83f0-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQ+iE0U9z+PK9It8SnvRKkYNgRK4i8H0Mn6Weu3zoXrPRAMsQnNvhcCjREF7mD8UurFLZo2sBnAfla1HASVpAT21rjv+gLBvgk38cFMxV+XsIrmkaYLfplQ7guYLRwTGHgw+Pd/e35BLyE3B/BEvqTWlel5tcEIizjA7NV5W6nUy0PFXcwBn8qNFEwfSXCQMGIbW9aExqsOlR7fCibujl1Nt/oFru7iNFmbI9C8bSvvphy43tyUeIBInQVUaScGyu3lPpM5ewybwEkQedXtU3lQmFitC99XyhboacHEHe8Mr+Dmh4REEaL3Urx1yioZo/IN9rMJFSDjEXZA30uitJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ro0Cf3wEN6SFb2YNnM7oWhgHK9wMhiZt0j9W9EEwXyU=;
 b=JSMetj4joezhxYUIk5SiDBKX3AKg6/fvEKUW3kqc1u/pprK8J0WuRacPMJ78RTPxg4OjjFTZ4HeqHTp2/6lE9zhf7X+29XubMRLpbnXlEK/giI8RW8KrO+drNdqiUIgMNLUbw9QYhTMdEgcGTdAdTnKAUJCJIF5YOpsnRx7Kt3nsQjYyVA80titdCYxBmZ7CpT1NrjiXGQ1gc+/Vw+RPUGP4SXFtSTLxuY0jiXm9SEJfavmRpciU+nSNvtZxCYHlpp/Ga8sE9LnbZbAGkZvG/x1UNZHwVtrO536jPva5QfZpgc5VV77WCYKx1zxkYnFtmfV8gaRE3d6ZSgN443t63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro0Cf3wEN6SFb2YNnM7oWhgHK9wMhiZt0j9W9EEwXyU=;
 b=5MZNC0Bx81pzfbKgEt0hWdUs9zBBcS7xuC1Fx8KQZTZboov9/BQGufMmgOiFtWxZIlmAVbeOR3Eo1TGtrWTz38OPBpT/OkyB4GyDbCX4dILF0/O6rfraOJIXBRmnEzaPUSwJL0K1Zbdwm+a2406Ln3Wwqww/N6zbiL9sUpRj6mU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a4fc373b-5fe9-4c10-a60d-ce57a6df9af4@amd.com>
Date: Thu, 28 Aug 2025 10:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/arm: map static memory on demand
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<wei.chen@arm.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
 <6408f218f3075acd43f5563bff26165091d9f184.1756312498.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6408f218f3075acd43f5563bff26165091d9f184.1756312498.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa730fb-c3ab-4dca-71ea-08dde6146e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzZaYTUxY0h0Q3lRSUcxeDlzTmpzR05FMWNKRHlCZkpJRHlRUGJManFxTGgx?=
 =?utf-8?B?T1Jwc3REUzNrMkNWRi85UVNzd0R5akVMV1plQXRBYkF0U3dRZTlJVUhPNlZz?=
 =?utf-8?B?U0liUnZ0VEM5OEc0ZjdyUU52ZjV4emxOd0kvaFp0TGEzSU1HdkE5R0pIbXg2?=
 =?utf-8?B?d0dGb1haeVJPSFp6WFlEVG1zeUpVcjFUOENONTgzUS9ONjJEakdxL2ltSmVW?=
 =?utf-8?B?ck5IV0ZyZzFqZldhYmlwU3lEWllXZTBxK0hyWmxOclJmRWp2K0h4WlhSUVNV?=
 =?utf-8?B?Y1FFMkJOTm41anpwRk41bmVoVUl2d2xUd2hJQ1k3Nk9rU3pzZFdWVldLVzRv?=
 =?utf-8?B?NDRCTVVQZFlGQk9FdnJNbHdpOE4vcEFNTXdJSmxwVHMrYW9abzVYWWdBT3g2?=
 =?utf-8?B?STNoVFcvQWhQL0t3ODg3ME9Fb21iNTgyVnIrZFlsYWt2N0tKcWxvOUZ4KzNy?=
 =?utf-8?B?MGx0UEMxV2J2SStyWSsyc0pTcTRzZjhDL25TemcvckQva3JudzZKUXhTVm5I?=
 =?utf-8?B?MjJxcFdJY0YyNWxKeVRiU0VFQUc1ZEVkb05obklEazNhZHN3SnE3YUNXeEln?=
 =?utf-8?B?cGs3Y0dRUVdueE1Pdzl5QisvWDEyamQyYUJJTWV5TU5uSjA0NnZXUTdpREZX?=
 =?utf-8?B?aWxpYXRTQzd5c2NlNzRwWU1MekZRMVQ5SmlsSUhJN2JjaTVta2ZDRHpudW1t?=
 =?utf-8?B?UGxFR0xtWmsrcGdvSTgxcHlYOE42OXZEWkRTa3pmZ3JPdkFoWndMNWFLSTYr?=
 =?utf-8?B?UGJJTCswSGl3WFcvc016Y3VjOW52SlBEZ3oxckdvSm1ZTDdTb0ZTeGw2Z09T?=
 =?utf-8?B?TkI5NWwrVXB4NFRXQ0N6ZS9VVm1VSjd4MWgwNldqRWd4Z0VZRDRmNFJhV2VO?=
 =?utf-8?B?ZkN0WDloQURpWkswMUxoVmZnTGpuZmxHeVZadU15YXQ0V2RLcTljdFFqRXFE?=
 =?utf-8?B?NXI3dnNYN1Z6VkEwV0k1UGQ5d1NYZUN1cVFkNmtVZzR0MTBhdFlzcW1lei9D?=
 =?utf-8?B?SnY2UU9LUzU2Vk1JMm9LaWUxWDI2RXB1YUdMWFJDSHRXZ3VUOUJwa2l2N3F6?=
 =?utf-8?B?Vk5uNmx2cC91R1IzVHJlUmVJZkJScGl0SVdVTHVoem1SbjV4YUhRZGR0WXpv?=
 =?utf-8?B?V09jdmpzMjdWK0Q5K1FSK0lYVVhhWnJFazQ5bHJ3RjhPajVOYTVTdGl3VWpW?=
 =?utf-8?B?eXRMdk1POVM2dGRHeVlOeXBIRXpqcDZ3Q244d0U2ZmdiNWpudWRBYjJuUk5w?=
 =?utf-8?B?QlV3bVVmVTN2VnAxL1V3eGJnaGoxK3IySDlNZW9uY0lxaHRJdmxmQVM4clBW?=
 =?utf-8?B?RHBLQ1VNN3Y1aW1Lejc0OTEycitZM21jY0YwcnFGR3crd3ljUEhSbFp2N0ho?=
 =?utf-8?B?Tm95NmNCNEdydkRqeHRmSUZqeldwNmdZVmNHRy82WTFDbDk4aDRZZ24xa3NE?=
 =?utf-8?B?Q1JXanpyT3YyQ2hJbnE5aVlhNGxFS0hzemRRM2g1NDlkRnFxcUxWVytkc3Bn?=
 =?utf-8?B?bklKRlZKK1dwd2RqUUxQQzhRRXBPbEF6N1JPVm5LNjdzR1lkRFFCYXAyMnNB?=
 =?utf-8?B?NzNKbGRkSllubkVTUm5QMVJrVEhoOHFqTENub1VGUXFHNElJME1YTkQ3ZUJQ?=
 =?utf-8?B?bUs0bUdSZ2ZTeGkvRDVmSG9zOUlqQWpsUGdUY0xGdVg2V2o3RFRMUHNrb01P?=
 =?utf-8?B?RDJxVU5OVGFscVRJWEN6dWFwWFlNeUYyQzNRRDdVUWdNcTdtcGR4RisyMHVT?=
 =?utf-8?B?cmF1R08yUlloNmFMYU5YVE52b2RkcDB6aXpXbm9nS3RwOUx0OHlhL2hCTEVS?=
 =?utf-8?B?b3gvaDNDNllZTHV2K0p5TUszcHNIbHdWb0cxMmJCVjdQWW1Vb3REZTZ0SHJr?=
 =?utf-8?B?cUlJSkJrOEU0M1piNU9yVzRyNWIwMmN4c0Nqc1JnVldqZmhlSDBVK0tYNzFB?=
 =?utf-8?B?akRUc2MxOElTaU9DUGprT0NQeElrdzJZTGRIbys5blZYU0hYZzZFMkxVQ0pJ?=
 =?utf-8?B?RVM0eWhSZGYzcmE1OHQvY3BuRldrWUlZV0RtRXRQdFZ1aEJWZzBKRXdhNDZX?=
 =?utf-8?Q?oW4MeU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:22:37.5356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa730fb-c3ab-4dca-71ea-08dde6146e01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186



On 27/08/2025 18:35, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In the function `init_staticmem_pages` we need to have mapped static
> memory banks for initialization. Unlike on an MMU system, we cannot map
> the entire RAM on an MPU system as we have a limited number of MPU
> memory regions. To solve this, transiently map the static memory banks
> for initialization.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


