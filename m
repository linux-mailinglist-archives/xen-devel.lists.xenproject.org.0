Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994BC6B45C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 19:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165275.1492056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLQhV-0000Uk-Po; Tue, 18 Nov 2025 18:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165275.1492056; Tue, 18 Nov 2025 18:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLQhV-0000TI-Mi; Tue, 18 Nov 2025 18:45:13 +0000
Received: by outflank-mailman (input) for mailman id 1165275;
 Tue, 18 Nov 2025 18:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/+5=52=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLQhU-0000T4-Bq
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 18:45:12 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29cd1f4-c4ae-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 19:45:05 +0100 (CET)
Received: from MN2PR20CA0004.namprd20.prod.outlook.com (2603:10b6:208:e8::17)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 18:45:01 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::39) by MN2PR20CA0004.outlook.office365.com
 (2603:10b6:208:e8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 18:45:04 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 18:45:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 10:45:01 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 10:45:00 -0800
Received: from [172.27.232.218] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 10:45:00 -0800
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
X-Inumbo-ID: b29cd1f4-c4ae-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OytJ362bMH/bFSd0QDzn2+gj99/SdQLvPIh/VExhjxseHrFqQaetiePfye6inqbhZulaVpRA6jkgrXLt3DdVz9xIcrywBtF3qHT4Li7dZCzz4DW/nMWHxcmzEVjEwcmHAFie4J/fyqRK/8gHVamMQuy/bfzwJ8942Q9lZ+vizJNNmV4P9YFZfPycCbH78GQnonJ9Y7qEVccSh1Tqv7g6wB3BgbOZhUUFPYzv0hwWqmf1vROoLgpui3sSRLxm/nEro/GFJ0xRakKkyBhudB2X6nTpaJFhJuquKwxPyp30kST87725IEkGR1A1PMXRNFTAe25AMo0KVe3+gznGfh3u+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5ZelEBTFB/Ck8Ka+JbG3DrzBAWsvYeYujs4JKs+USQ=;
 b=XQG8sWYsgdfeFk964I4QpL15o87j1U/6MSBxgYAd1uVwSD1hHSPOkAxyNXFt6X9AgNC8JO3Dxh5oiwx5mwQu7AZ9Kg7kh3P6W86Zbl34bYpy82cjw2Fa6oSwTMz8e6qcXavDlWKX0w65ArxYq/V6LLGrAex+emoXuxrozBTaKPcspDV2v9o4D5YarcsJ2hBH2ICBpts3n76JX9gCvypiBlO2jhRwzfqDGG5RqVz4qPK0reX7tILX80k3l3tvnG8F48ZcG5B+UnJ1mKd8VQgE/+BILTsCxy6v1ieC4+tqNNEvVd888+Gxd3aZB8t6Si1+y0mS6RAFpT64NcoReGC8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5ZelEBTFB/Ck8Ka+JbG3DrzBAWsvYeYujs4JKs+USQ=;
 b=H2Xhqajih3KsrgCiNKA4tNlDwgwz1omIzSywJ6OGDhaS21gsWLIyhrfOel/ppjEp8f7i2UIeqYiNqDBXtw8QqJm9wSLDyJpoB5BMG2bIV/fbAung/ux74j4pQVxRE1moh8HvU1FtP+CogmC+7xUwfBXfrUosZybTIrfuBuF5RHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f26dccc4-740b-4acf-b1cb-fe052a8e8424@amd.com>
Date: Tue, 18 Nov 2025 13:45:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] x86/cpufreq: use host CPU policy in HWP driver
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <c0ed26a0-6e34-4aab-ad7d-44b9f596b1e9@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c0ed26a0-6e34-4aab-ad7d-44b9f596b1e9@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f6ac30-03e9-4901-614a-08de26d294db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWd1NzVJYjhEMU40WitGeU5hODJBZ2l5ZUE2RFZzb1NxS1JrdjRFbERTRHMx?=
 =?utf-8?B?ZnVFeFhXQ25vMlBVU1Q5cFNjZ0NQcFVWejJqSlIwVFMxU3Rwa3hpb1J4b3FL?=
 =?utf-8?B?SWl0QnhmRmkwWll4NUpIblp1STZVVHYvbTFLcTZOYlVncWQ0eU9aSTRwRjNp?=
 =?utf-8?B?VCtrTHlwRkFVQVpKYTlPVUtRdVd3OERHR3JJajk5OG9vMUxtRy9Ja0h1dVlp?=
 =?utf-8?B?aFBVR2ZxYTg1U2N1dHFRSEp4MGt4blVjbnFlVzRPYURVeVV2Z3ViMWZUL3dD?=
 =?utf-8?B?YTdSRlBPd25WLzdDcERSQnlqSnh4RzdSTzV0N2ZhR2ExSHlSVThwamZBNVpX?=
 =?utf-8?B?NTJDQXMxVElibUh6aUFlVkc0c3pJYlJzRlBKWTQxeldRSFZtMzVUN0k1RUk3?=
 =?utf-8?B?WDFrdy83bVJQSTJqalMxQlpMdkRudGY2eW1ldkxFdWFxaXJDckNQajB5Lzd2?=
 =?utf-8?B?WHR5TGVTUWREalg0N0J4NlV4alk1c0dNbDVHRlFYOVNzZVdSYVpuRE1lU2c3?=
 =?utf-8?B?MmZpcythQU1qVXNGNU1zMW9QdWw4UU1XYjdHQVRReXVvem56cnpLQ3B1eWhL?=
 =?utf-8?B?VFBWQWc5MURKeVBpQXY5QTVZRElOT1RIQTd1VzUxL0RqUjEyQ0FjU1Z1eElE?=
 =?utf-8?B?akkyTmMyZU9lUUhFdVk2QjZKcmpscG5jUk85dmxrUVhnK2tWYW9Sdk5WM2xW?=
 =?utf-8?B?OXZlb0N2eUptUUZlWi9XQkZ4a1dwSGhPVzhJcVE0UjVoUHh5VVpnQUIxYi9y?=
 =?utf-8?B?R09Zd1ZLeUhhUGoyODFrcFhORi8wUEs4NEtLR3RpNGRvN0ZNYVhNVWhuRitM?=
 =?utf-8?B?ZHE0Vk96QjVpMnZOTXVRV0FHV2dTNHRwWEZXb01XRmxmSDlsaW5PbEo1RTNJ?=
 =?utf-8?B?UVRXTjlYdlRHNHNmQ3ZLb3VzOTJFRUpsNDJJZkt2WEp1bVIrS1drVzkzNWZm?=
 =?utf-8?B?cjljQXo1cjJKYUMra0crU0dGQytqc3N5NnFQNlA5S01UOHIwWmtPaGxKb1pL?=
 =?utf-8?B?UDl4K01YYWJEdnZlUlFjOWVqcFRMZk9mRTJENnNVMUx3bWxOZ2RNdWxocUx4?=
 =?utf-8?B?cURaOFF5aHYrRjRIZlpVclN1RUdiVWtRdjQ2aTFQVktSSVVPR3luQktRMjJj?=
 =?utf-8?B?U0tJZjdxWG5DSGhsaWg2N2VOYmNSS2NsRm42eUlxU2VvVHZJakFxZGN3RVB2?=
 =?utf-8?B?TzI1V2kyKzFJOWk5TWRudC92VnVyRGVyMHhRaGVodnBzSHJPOGlBQ0x4Q0pa?=
 =?utf-8?B?cFRXSkxpTWt5ZStQQVN4QlZlU0kxOU9qT2Q1VE5PODRjOC9yWTJpdzJiNHhZ?=
 =?utf-8?B?M0xja1crcnQrNzRKUTJabGlPMjNYL3gzcThxMWdybkpzUHZ5SkpZdlJRa0t0?=
 =?utf-8?B?TXFkeDhmQ3M4NTRpUFhGQVNMSlhFa2lyVVpYYVl0T3BDcld0U0k2RGtUSkpt?=
 =?utf-8?B?SCtxQnJPOVJ1VFV0cjZwa1I4MWRBMWxFT2kwNGhEb0VISlpDQWx0azVpSy83?=
 =?utf-8?B?dG5XQ1oxV2pLR1lPUzJrSnVVY3ZyQUFCczJjKzdpYXFUKzJtSm1zYUVSdkVP?=
 =?utf-8?B?ZHpNZXB1YWtraFQza0dvWFZlWmNGYkNPZUEyNW9VclQxODZRUUYrd1BzMUow?=
 =?utf-8?B?ZXgzcWpBUVNPL2UzKzZ1eEp6d2h2L0YySWlWWUZLenpqTjVEQTNjSzRmQ1JC?=
 =?utf-8?B?ZVVERDhpUHExejFLMTI5RDdTd1RDNDB1dUF3U2NYY0dpMXQxQm5yMFh2UHVm?=
 =?utf-8?B?T3RDMjZqYUNqckVLOUw3cEZJVEVGSVc2YUZoYk5xYWlJWU5DL1lVUnpGQlhv?=
 =?utf-8?B?a1Zicks4NTZBcW9hMkhUZy9YZStMK0NTamhhMTc3RldXN1BVMk40SXB4eDJJ?=
 =?utf-8?B?VXdHcTdPaW1QUTNpMUF6ZjFlbE5SVjJCY3kyZGR3bk1jV1ROWm0vejU2bHdq?=
 =?utf-8?B?S1NuUDdyV3pXQ0dSYXc3ZXhFSmV1V282SVVhaXhFTEVLenJsMENnYVZ4c0Fu?=
 =?utf-8?B?aHZWbC9SaFkrTnUwaFdzeEsrSVFJaUpGYjF0K0c2VXBkNytIS1BVOGFZaU9O?=
 =?utf-8?B?RDdKbmJzYXpwdDNTUUpDcU1uRzlDNnFjUjRWUTlZVFpQL2h0S3djQmRBZDdX?=
 =?utf-8?Q?4Yr4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 18:45:01.5140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f6ac30-03e9-4901-614a-08de26d294db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961

On 2025-11-18 10:09, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time. This way two of the
> static booleans can also go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

