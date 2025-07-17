Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AAB093CB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 20:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047239.1417707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucTC3-0000eD-N4; Thu, 17 Jul 2025 18:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047239.1417707; Thu, 17 Jul 2025 18:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucTC3-0000bD-K4; Thu, 17 Jul 2025 18:18:55 +0000
Received: by outflank-mailman (input) for mailman id 1047239;
 Thu, 17 Jul 2025 18:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucTC2-0000b7-2J
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 18:18:54 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:240a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cb61623-633a-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 20:18:52 +0200 (CEST)
Received: from BYAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:a02:a8::15)
 by IA0PR12MB9009.namprd12.prod.outlook.com (2603:10b6:208:48f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 18:18:46 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a02:a8:cafe::53) by BYAPR03CA0002.outlook.office365.com
 (2603:10b6:a02:a8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 17 Jul 2025 18:18:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 18:18:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 13:18:44 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 13:18:44 -0500
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
X-Inumbo-ID: 7cb61623-633a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7IJMtZ4FirHQMZjMG3QUKlU0AxOCT1s9WbUmA0bpq/IKkTGgPF4XMqVxDO+MxS5yL6U2fKwrDi3T2HYvjvFlhH3/DP8uVWWNZkFXOxUKxtcsY7RohOGuXlsnY+KuVgQmZHdRJjlCT62ah8URoVZlFF6JxohYxB0KDXQBIPTOV+UH4DucBGx36OCRS0OljdFu8kW+uOuD4qzFiKvuTEucSPrbDkUrAfZrQQ7Rkzj3zgO5+q5OsmCXfU1BSlZ0bVS4tIgpOpJIZXhEnYla588ituaPXJtku0z+gD4K16/KZr5oi0sAE7AZudYnNGYGwzTZ0LvC9TNb7zrp4SPVrRSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vUGFajUYroAuIlDtUwKpEnnXRZDPfVhcUxDo+cXSAk=;
 b=uCZw+oR7yV+ftbdrIS3SwE+I+WySJSKqHPV6K6ZAdmST8rmFYpbbGqfHo8mmIlpkvd4Ly1eB+qyIRtmTFqRILp5XtvSaCpA5avCH7b0ZuUKC2ahpVYmhGqMCOXdRzDNDFNZnwoAp3TuPAOg1pvH748+CYeE1pcfy9yqmrZLdxX2DzncYir6Bs22mjyR2/WChV6nvVNK20JUAc87D9t3s18Qlye0GfwJddjWUdbGm+gRpL9E/2yZa1Z99dGRk271ns7ueNdPLajf7E2Ilggf/J50QJCe8NmNIvvf7bvDmhpePnnVuBripWVzulvVHVBYu1Z3/CW2OT8IsIl+86IgcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vUGFajUYroAuIlDtUwKpEnnXRZDPfVhcUxDo+cXSAk=;
 b=RxGepWCPmJwD9LSqh/mLJ9ZrqzfjOmkNnsXD3bGIlFlJeqGcbTGSqcdchLjnkAs9t3jklQiLrB+xXZNHKYlP5272eBBkNclH/4orr10szvX5LORkIGwwCgMGkj5Vh28EN6Z4BhI4e3QTTMv1RQ3M6Pq8RbSig7LBdep0J5kKVSs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4d6586d4-e67c-4b54-9f5f-8b9adfd8e20e@amd.com>
Date: Thu, 17 Jul 2025 14:18:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dom0less: Move single-xenstore check from bindings to
 set_xs_domain()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
References: <20250717142806.257597-1-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250717142806.257597-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|IA0PR12MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: bba3a5d9-834e-4e5f-8036-08ddc55e5e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlRjT3BlWHJodkkwckhkSFNUdkpaWENic1M3YnFlYlMxWTFHaFk4WjdjV0VX?=
 =?utf-8?B?cmlvcjRqZzR2Y2NoL2Voa0Q5R2VackdSYXJ0ZnNRYWphVkk5aEVNcUMxR0FB?=
 =?utf-8?B?OEYxRi9YZFFWbkYvYUZMb3RRanRDNEkrVjVrOXRYK0VibGNhM1JWR2VLaGNk?=
 =?utf-8?B?bWJhYS9McHBjOFVZU2lNRWF2YTkvNHBqQ05HVlV5UUpwNW4yazd3MklURUVq?=
 =?utf-8?B?YldGQXBiNGhFWXNydGZOV2l3WWE1bXk4Y09JR0tuR1YzREwvZ2pzSVJPSXdk?=
 =?utf-8?B?SVFqcjhnSmpPNXFNVUE2TW1wZllLL1I1VlJUNnRERXhlUEZBRWU5RHVHN09V?=
 =?utf-8?B?em1lZUpUMCsrUHZnSndOa3V0OUhNSG5RYkhiMlNrbGV5ME9iS2NsOVpqSEtz?=
 =?utf-8?B?MjI0WHNDUDNMVnU5bGFFRFZ6R2R5UjR5N1pKYno1azhxVkxJdHpRanBJdmZF?=
 =?utf-8?B?NnJOdldoRmN1UFJpN0w0YlUySGZ4bG1QbVJSalk4M3NXcTNyUE0vd0RhQTdl?=
 =?utf-8?B?WFNaTGh3aDk2eFhFWTEwTFp0NEV3UzhSaklPR1lJRk4weXR5b1ZPYnRTSHFH?=
 =?utf-8?B?SjBLaWlud2RLZjR1UFE3VUk3OWhZK2FqZXJLcDlncjZmR2hNS1I5NDhRUXJ3?=
 =?utf-8?B?QkhVU2xHL0pzelMwc2pkRTl0YnVkWVFHTkhzbUc1S1VaczVzV1p4R2tPanBE?=
 =?utf-8?B?VVRNTksrUFNldGdYQVNWcW9EamxYaDlTQ1hsK3l4aGlQeGZkdkxMbjhDOUxs?=
 =?utf-8?B?VnpPWXRrajcvTnZZSmhvdWQwS3dSQnM5dlRrUVVNd3dsWHZMa1JCQXJpY2xT?=
 =?utf-8?B?RkxrMFltTEsyWjFSV28yeVMvQ3RvWlhPOERabnlEWkZUQzVuTG82LysyZFBN?=
 =?utf-8?B?cjg3eU5FTmhDRTl1V0g5NEltSHppTExvd1FSby9FbTRNd3BMK21LV0NkV1Bk?=
 =?utf-8?B?U2xUYkVMMm43RnhxQi9tOTFMUzRjV1h0S05NR2szUitiWWZ2Q2x2WUM2cS9O?=
 =?utf-8?B?VGJYY25ubGx2T0xTQVdiVVA3NXZTZ1NTZHRLQmlJN0ZBUW1PeFF0MkZvWDNl?=
 =?utf-8?B?dURqTlFnelFNSUlLQU5DNVd2TTU3cUV1bzVoZGF3UGxKK1djN2JHUENYSXY4?=
 =?utf-8?B?dC9CRzB3QnJZTk1GMXYzcm9vaEp2M2FaWHVDQ3haMlk2bGg0S3ZucEN2VkVq?=
 =?utf-8?B?Y0V3VUVodVd0ajRJWmhVTXd1M2RzbFFVbFhCNDVuYU9ITzJ2ODhqZ1RNQ21W?=
 =?utf-8?B?amIvTzNScHkxN2VVbGNZYVBydVQrVExwV0JLQW5xcVBVWEQ1dDhsUWhDWnFO?=
 =?utf-8?B?S2hYcHZUbmtEVjdjbE5JY0RuSEpBdzI1a1FqZEtsY09EbWdSMkZhQURMRzVG?=
 =?utf-8?B?d2hUV3hWREtIK2FTSExKWTlYNk9lZjFzWGdPZm04Z2t6SllJN2llMTF3RlVL?=
 =?utf-8?B?UmlZaThKakFaMlhhQkwyNFA4M3NURWI3bjIyUHZHM3NIZStjV2Vja2t4L2V3?=
 =?utf-8?B?R1hXMnljWVY1eDhnV25jVTVsNW5icW1NSXZma2VXTGtHNHhuSjVxcFBQRkRH?=
 =?utf-8?B?UE43eS9lOHNlc0lrcXUrZVltWThpRThOcng1Y3FCREs5dXpGK1E2eXJFZ1F6?=
 =?utf-8?B?UGc5MkI3SjNXVlNCMTI2NEIyNlJHVFFNeDJoRzdlYXVYcytGUEVlVE1rWjR3?=
 =?utf-8?B?Sk84bzQ4d1BXRTlBUW1naUZPbTV1eFlIVWhINnRSUUlQVURJRzFkaithczF2?=
 =?utf-8?B?STh3MDlnL0tNWk9QbXczNkE3SGVORklLSmw0UEU2ZGpoOTZZMm8xYlBBZHlx?=
 =?utf-8?B?STJlbFZRcEU4L3JLdVZ6dFFsb2pRMjB6aHRXUnJISFhFL1VtVWNVRTEyaUQ0?=
 =?utf-8?B?NWRoeDNHT1hXMklKaWNXK25OTkt2WnluN281VTUvVFN6Skpyd0c1SkFwQTdx?=
 =?utf-8?B?bE4xTjMvSDhGNlVmOXZYWmhBQTZaNElyZUV6UDVrSTVTMHUreWN2V09KWk45?=
 =?utf-8?B?U00vYUJCaEZoU3ZHZ2pYaXFueC83djlNRHlhTElvQ2VtTEhOd1BHMkpWdjJT?=
 =?utf-8?Q?BkjBYv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:18:45.4327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba3a5d9-834e-4e5f-8036-08ddc55e5e45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9009

On 2025-07-17 10:28, Alejandro Vallejo wrote:
> Later patches extract the bindings to a separate file, where that global
> won't be available. Make the check when calling the function instead so
> the bindings remain agnostic.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

