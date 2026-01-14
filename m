Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D803D20E5A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 19:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203761.1518811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5wZ-00053F-UQ; Wed, 14 Jan 2026 18:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203761.1518811; Wed, 14 Jan 2026 18:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5wZ-00051I-Rd; Wed, 14 Jan 2026 18:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1203761;
 Wed, 14 Jan 2026 18:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSw=7T=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vg5wY-0004G4-KA
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 18:50:10 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8890b2a-f179-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 19:50:08 +0100 (CET)
Received: from BN0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:e7::7)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 18:50:00 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::64) by BN0PR03CA0032.outlook.office365.com
 (2603:10b6:408:e7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 18:49:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 18:50:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 12:50:00 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 10:49:59 -0800
Received: from [172.28.136.14] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 12:49:59 -0600
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
X-Inumbo-ID: d8890b2a-f179-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNp2DK4j07vqhfohb5AgB2NBX+ZbM/GlApFe8KyvrlC4hObUYSdKSstZeqNTe4uS4KdVXL7we/KLbjkzimfkG3pIQW6Bt6eM/kbhnWLT5OqLDkv4InuEKuHJPx0jKDmAHQCNqDFJM1EBggmk5M/YMiNa+hbJMc/hS78HUgckbGqRVvGdZE+zaspvQV8svf4GGH2vKiG+s3SDSn7uMnkQYHcFzMuPxrxxyjSzZWtU/yR2UdcZEUDbB+TzM2Fo9lChzxQM+893qAIDUo8fgslJrdLGoYXNFK8xd8XJ5Q6e7i3v7le95G8ndF9nRlTjGj4ID4a0V0plFICZV50fRj63QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgDTmPXvcD2+YrtQy7k5rE7ZgRJqltpcxKpIxIYbBBA=;
 b=V00kr6XErA4C/4TzxahjMjYMp88HDKmEW7x8zGM+moq2O8wyBV3Lye8dfDuATSUjIMiNYTN8bNHnzU+b7puHKMgT+oAX5KrovWoCCHgl4u46hqDpOEwc0x04lzvnEgOgM+0d+ZC93klr4oW1dLb46TMApIJIhHapErDYkToulDKGJvXVeS4zFTiDyczr/4smY7StOLngNQSrhaK7oBD+8hRh85A96igY8PcxPfbdbekTCD5+P610S2xWBRa+yWqfCa+Xz8gVuDyG4TRHWj1JIjO/spSUDt2xLqfZOc8KkRb+5w/ezmDGDiiPhryGbJBAamfraFgNZDSnfefSohoutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgDTmPXvcD2+YrtQy7k5rE7ZgRJqltpcxKpIxIYbBBA=;
 b=tadRTbYD0JcwjysVcDhMtPKKhJBP9w9717KdT0lOe5/s2dEd45warLEbaAMEs50m1ATzQZ9WKJRoP0de9nC7GPXiFHpYFKjo0c93drjtI1pj0nrr2XJeKwIv4Rrb1ZF6r3erJMazellJzC4lqGLSSt8BmKse1Ir8JuIVV17jnSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f90c93d3-44f6-434a-bd7d-02abc1705e5d@amd.com>
Date: Wed, 14 Jan 2026 13:49:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] x86/cpufreq: use host CPU policy in HWP driver
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
 <7d52c0cf-c097-4c32-9af6-5044727c3ef8@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7d52c0cf-c097-4c32-9af6-5044727c3ef8@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5cd258-70e1-4f5f-c326-08de539db88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGhyc0duMms0QXJ0VEpxcGVqUjh0RFNaazVaZGxGcEViZ0xPcHZlTE9FUzVm?=
 =?utf-8?B?MWN6NHpTNzBCQW14czBJZ1NiaUswN2RBb3JSUTVvbkl1bFhoK3V3UFpsS3p1?=
 =?utf-8?B?UUhacmxZVndPK1N6RjZjaTlGVGg1SzhJWXV2allZTEpnNWpYSks2aUpQUndv?=
 =?utf-8?B?VzlIb3NRN1I0ZUZvYTdJalplSEg1UkppS3hvczJFdGlQajdjS2pjcUNESXNz?=
 =?utf-8?B?cG12VlhZSjQ5ZGs4dk1oY3lOd2hjNHc3VXhwbTYwbC9JS0pEN0JHMWNFWU1s?=
 =?utf-8?B?YS9oMFZNRjlsaktaL3lvVlpSSFI3eDkrVGhqZnJRQ3NiZEtYalVnL1hGT3Bh?=
 =?utf-8?B?MWdreC9hNFlWVEg2ZytydVRiSHNVRm94TDVhdVFnZE9mSWp0Uno2L0dXRENh?=
 =?utf-8?B?ZnFUelh5U1VqaXFabjltNnFLQ1hScm95NXhVUWRSOXRvc3VqRjhWYkZyN0Zy?=
 =?utf-8?B?VmhpMTMyejZqV2k2WjNNRXRJdnR5dVZINzZvejBEZ09od09yTkdCeUQ2OGZp?=
 =?utf-8?B?U1loVS9vK3dWT2p5NTlhM1lpRUhDaEpIekRpSkEzUW5ieFFYbTFRV1VOKy91?=
 =?utf-8?B?ZG8yZXJBQmZnVUZvSnZxdXdmUW1MR2JYVzlLRk84UnhoaUNnSk5JYTRGdlV0?=
 =?utf-8?B?ZHFQRURWZUdTd0dMK0VEM2wxTE5tNkJ0ZHdNUlVhNFRBWWQ1Tjg0c0d6Wlp0?=
 =?utf-8?B?aTFubzhPYUMraEh6bllZb1ErV3dzNlMzQ2FmNGJ0VDdKU2JSNEJyeUhLOXQ2?=
 =?utf-8?B?WWZZT1h6cUYyTG9DQ05kMUs4cUxyV0tGZmdKR3A0RVpwcnk0YlU0U2ZmVldD?=
 =?utf-8?B?clFqNE9vQjg2SEdJeE1PUklOUUVwSFFjUkJ3ZDRvTWh1eXlLdGcxdHdwdkRy?=
 =?utf-8?B?ZndQQUlaTXpiNzdnUEVtZHZOeTJZY0pQQUdyTHNGcE4zSWljamtNZ3Z0T2JY?=
 =?utf-8?B?K0pjR3NkQUZ0Z3VDRVRiVTZxN1RzdkFOOEh3S3NjUS9ocVlhUFZnZE8xVWRM?=
 =?utf-8?B?anhhckJsa3FLbFQyZ2hBczhRZmdmS082VldQblJZYU9mOXlPb1ExZlZiQzR2?=
 =?utf-8?B?bXBiK3VWYzZNNjdaL284SXZKL1g3d3NYMU5oL1UzS3FPSU1mR3hwUFZ6Y2pU?=
 =?utf-8?B?OWYraHZkaVUremFValpVbnF1aHllMk56Zy91Zk9JclZvMndkS0xZUExDYi9G?=
 =?utf-8?B?VmI0d2pTWXJLTlkzMjN0Z05Oc05LNW5BSnozTWlFdEJ3ek9zS2ozSzlBdzRp?=
 =?utf-8?B?OTRWUWt3SEhIb3krbHpwYnQxVFkrWUVPb016K0hkcWRTZi9vVC9hZ2xVbEdB?=
 =?utf-8?B?YXo3V0ZOQmpRS3doTVY4ZERVTkJ4T3lRcHkzY0FhY3RnNzh4ZDJVVE9JWGkx?=
 =?utf-8?B?K3R4R1JkWWNHTUt0UnV1OG5CcVoxdTFIa2xHa1p0YmtLOHRrSFcwN1NOTnBR?=
 =?utf-8?B?U0lvald3SjJiaWcweDZmYXo0SzJpL24yUWE3V0hEWi9HZisrZTd6MWNwY2VB?=
 =?utf-8?B?UmJoSTF6SjVRbXpra0pNL1gvSkthalBDaUw5aHJnNE14ZkhNenEzWmRlM1hH?=
 =?utf-8?B?a2tuZUxlcU1RNVUrSDROQmRZbmpaZlhlTGhkVDljMHM0UGNjbGcvWmlWOThs?=
 =?utf-8?B?TlYveDAxUit3dzhwYlowVldvMERWbkZQaEdPK0RwdDEvRUkxVmtxeHZGakRF?=
 =?utf-8?B?YzVMUFJlbXgrNnRsU1N4MEtPaTdBWnpBLzd2V3d1b0tOL3RRNDFGekNpNnFH?=
 =?utf-8?B?azRnSVdCRXhrVU54WW5zRzhkUHcwVTdFbklWV2kzYkdUOWFrT2pTRTZSMWJj?=
 =?utf-8?B?aENFR2daNjQwMXJudm9IL3d6V01IRWNBbFU0NXpzKytWZ0szNkhjVFRUNFJk?=
 =?utf-8?B?aXhwM1Q4RCthNTVubDliSnZXZGFSWnZFWjhKLzRuTkRyTmVMM1k2dURjekto?=
 =?utf-8?B?WGxKNnVRMCthZFZaUDhtcGs3a0xHeXBBVTY2NEVtZHdNYzcxNThSSXBpRHFW?=
 =?utf-8?B?c3pETGx5OGlKZTRCa2FISnlWbndDWlpBNDYwZTcxMGhycXI2WVU3d09VZnFk?=
 =?utf-8?B?S0U4N0ZNMEJuWDBsME1LY3I1NUFqcysvT2EwQmE1dHc3QkFaYmlFSGZBMXRX?=
 =?utf-8?B?RFFsNFExcjBUdmFKMWF1TjNVREZCMldmK0RMSzlwejlnd0ZwZllYSjl4QStL?=
 =?utf-8?B?dElUem1VaWZ4bmoxZ1p3UFlPZ0c0UXZQVHNyelRVNGtEOTVJTkR4MXpLMVBs?=
 =?utf-8?B?ZENjOE5OaUkvQlRsZWI5UmlLOHhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:50:00.3822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5cd258-70e1-4f5f-c326-08de539db88a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156

On 2026-01-14 08:45, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time. This way two of the
> static booleans can also go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

