Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA75B3ACC5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 23:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100023.1453621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkFw-0000Tu-6m; Thu, 28 Aug 2025 21:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100023.1453621; Thu, 28 Aug 2025 21:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkFw-0000SM-3J; Thu, 28 Aug 2025 21:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1100023;
 Thu, 28 Aug 2025 21:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urkFu-0000K4-9H
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 21:34:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2418::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b54d9abb-8456-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 23:34:00 +0200 (CEST)
Received: from MW2PR2101CA0002.namprd21.prod.outlook.com (2603:10b6:302:1::15)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 21:33:55 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::cb) by MW2PR2101CA0002.outlook.office365.com
 (2603:10b6:302:1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.8 via Frontend Transport; Thu,
 28 Aug 2025 21:33:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 21:33:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 16:33:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 16:33:50 -0500
Received: from [172.20.7.230] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 16:33:50 -0500
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
X-Inumbo-ID: b54d9abb-8456-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfho165DUtDBrYB/7VGsuFZlNu37PuerTSPoHIbPXTHwRWB0peMvlC+HZxdSLG3Pj0/1v2mLIaPJEPK+yxf3W2OhGvvq2Vhe+sqJJLJiKNAl8pyAZSTDHF+tR6AK5FJZuI/uIhEJYtY6OAIcw8Z5EK5xIXZqomrEHBfINHMe5wjJUiTU55tAr5cTYe4d4X1OB7q5Eyj3mC0ybB+JqJ2feNOMo+wlO6BpXO5FgnuT5N946kzWYOIO1XBrihn+XLYXiRiHhZ/sOpsdMRK7MKIJlFBsjKZSSMJCnWfNGqFUglQQAqeuWv8eNZ1DpD/h8gUCz1m3u/appf+8HyAxYUD1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCcMokIzdxsRGZTu7FFcxph5XHXNPNBe/LWzJ4Nhfa0=;
 b=LWepDgYVO1ACDa18hM8XT0mTHT4FqMyH5BtIrXQXUCbrDHSZ+xjmrKWkyuMQCSIbgHpSNMrwulk29cLqBayjOPE0hxBcWHhm2SF92hAC4jdFEXXb3Yv9Pk3CFM1k0aohlVpxkHWmtkT1FqhLISgzcIR7hiKt3ci+e7XK7+B2DI1Rw6sXAkVKC7w19mXOu3Hersl0A+nw6TElTcJXtkz6rP6ucMkGPdHh2jKIwIq7qqDS9qjmr3KvXKWHWV8uoTUEArq9LNBiRz/5F7ADRiIsfQ5WOr9sy2nTLNGFbpnyghG8XsLpLmZBhZB4QfFhxeQmWi7kkOG3JAUY7+AfFLqJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCcMokIzdxsRGZTu7FFcxph5XHXNPNBe/LWzJ4Nhfa0=;
 b=dPuTZuTKclNQqk5Z8lgHw7iucKAJO+G5fbsPcxj3rCc+ifcaBA/P0sCSKzVYtX6ek0JA6WJxKNRXJ2tA9uJMYOhe8RHiBRC3CJ+9ok7lC6M14G0Jkp6S73CRcJk/JkbHy8ftcV9nksC8nF3OvKg0ULwZYopEkajdoTMYOaw9NuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4d06bd13-6f75-4dcf-aa4d-c225139c2575@amd.com>
Date: Thu, 28 Aug 2025 17:33:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: introduce "hot" and "cold" page copying functions
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1b9e5d46-20a8-4b5f-b938-e28a0429c770@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1b9e5d46-20a8-4b5f-b938-e28a0429c770@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e560ad-5676-4c5f-ff54-08dde67a96b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnVSMkYyMlhYWHhQY3FCQ0Q4Mm9aSHIzMFdHRmZWRE5mRjhZc3pjM0xoTUpC?=
 =?utf-8?B?VW1Qd1VaVldBRlFSejNTN0RzRUtkc0pmREFLaWQrODhkeWZNQmhNd2RCbi9F?=
 =?utf-8?B?RndhTXdTTE4yTGp0emxiR2VOMmhiM3hYL21DUW5DWmE2eS9BeUt1bFhnaHlX?=
 =?utf-8?B?VnhNSi9wbXhCM01ZcHE2MS90OWUyNHJQSXh1YUNqb2VPU3FjQjBtaFJvdlVm?=
 =?utf-8?B?bEVwTUEyUFRxV1J1WjF5QkFrY25lN01MMjFoU083Nk9UNnBQeFpZeFhGNTND?=
 =?utf-8?B?eWl0WExkQlYvSHdmb1VucWh0VUJua09wRkRKZTJPd2dqSC9BRzRMOXJheDA3?=
 =?utf-8?B?T3Q5ZXNvN0s5YXBiR1M1UitTeGdldXZ5Wi9mcndpN09MdE5mcktyV1p6dG4x?=
 =?utf-8?B?RFRvZ1kvRWRKYUNmMHRiOUl3Zk1nQ3RMMWdiVmxkRU1QYXJ1dU9EUGRwOXk4?=
 =?utf-8?B?SWNyMlNnR3Eyclg4eCttbm55OWFSTUtLcFhrV1MwV2RYdy85dlZUT2pJOTN2?=
 =?utf-8?B?V05QVXBQRW9qZW0rcDNuTXludGVzMitXS29rWDNDaEpXeEhUWjExblZITTMy?=
 =?utf-8?B?aDNIZ2orcXV6M1p4TmZKNi9ZdEx3dFpMM1dzMkFMdTBlelMydS80T1ErSVMr?=
 =?utf-8?B?bGMwWm9UNi93cVA5WHJodDhnWExFNEppMFVjbGRaNC9STDlqc00zck95MCs0?=
 =?utf-8?B?Y2VjeFdnRDI3cEtzbTIyakNHQUhMbHZITUY3V0F5dWhvT3MyS0U0UllFZUVU?=
 =?utf-8?B?WnUvSjRFRUV3R2IzejBsSVpsSlVKeTVNWm8wOStjWGgwRXRXNjluZk15bTg2?=
 =?utf-8?B?QXRldHUxeU8wbEtvMVJvbTNuMWJqSmlLck1BSUpoQ2pndXBlMHBuNGFMdE5N?=
 =?utf-8?B?Um1ocWJZRTR4OVUxUHN4a3B4TGVMZWNLL2N3RXY2YnBqNmhvZlJ5TklaZFha?=
 =?utf-8?B?K0FPb3pwSncrVzNxbkgvMGFEM3BkRW9ZVjBnN1YzVFVrUDdub0pINnN3eEtI?=
 =?utf-8?B?TTFDMmRnTVl1Y244WFpuRkVBb3dtS2pkS1A3SjhSWDh2MHVJQlU4SDF4UjRB?=
 =?utf-8?B?N01BY0paWnpabC9sdUhvWTdRZGk5R2cyV2dKaTNVK1RiNG5hMC8xaUU1S1ZX?=
 =?utf-8?B?elNodlk3bTBRZWFZS1FtY0xlWVVZOXJ6bmtjRUdMZ0VYWm5USmcxckhWdDg0?=
 =?utf-8?B?Z3A4L2NUZUtCQkVEcXVMWmZya0JOQlRiOGtXVG1COEJPV3lkUEdGRmdvUnVJ?=
 =?utf-8?B?Rm9wSndvSklLNEZwbDN4ZlZPRnZGci9DNTg2MHRXTFMwZ3gxMWo4RG9pMWF6?=
 =?utf-8?B?Sk1zejJkL1M2Um1naitIOVkvR3BEdWZIU1drZTVXN2JIV0c0RktkRXA4MVJK?=
 =?utf-8?B?NFljMVB3aDhFUUdMZWtDNGZ6R1pEakIvSlIzTGR6ejc1bTRFUzJMVVUzVmJI?=
 =?utf-8?B?RTlqK0hVRjUwUy95ZzNIbG9lR2NGdTFxaUtPZHpsY29aUE04bjhYeFh4Yk1X?=
 =?utf-8?B?UURDVG1zTGtRYWRxcWNWNjVLYzVGRnhKenNFR2NWK0syRG9nQWZNWmgvaFk4?=
 =?utf-8?B?QjZZNmN6dDNveE01Y0tJUTl1c1g5M3RrM2J2Z3FQTVMyOHRaUlhlWDVJd1VH?=
 =?utf-8?B?MXMrYWVtSUxxVGZPZnZBS0ZJL3BIUU5zd0ZLQTRXM3pPeDYxUUFOcnVFeVVY?=
 =?utf-8?B?SEIzR3JBKzdYMlFqYnNFMFdOZWIrQ1JYM2VPY1d4M2FoN2dlR2VWR2VLS1dy?=
 =?utf-8?B?aTNvZEFuTGNwYzRoNlNvclRvZldNSmtUT0ZKZzhjd0hDbUJyYUxYRC80clpC?=
 =?utf-8?B?MVZndlpXYmZBSE8rOGNSM3ZST1ZTcnVGRlRESTlodzNyekZDRGd5cUczWk0w?=
 =?utf-8?B?WDVvS0htUTEvQm1KNnFWdEFPa1EzVGRkYTFRaVo5cjZUTXFwcGpsRTM2WjZ0?=
 =?utf-8?B?SDdCa3d2bzBNQXBvZHk5RW9aRlk2aE1zWTF3ckVZVWo1ZWVTNXp5Qml4MzJ5?=
 =?utf-8?B?M2ZJNGFaQjVHdTJkSlg2TG9qc2pGbmNXYXByUUFsUEVFM3d3UXVGSnMwK3Rq?=
 =?utf-8?Q?NB+FAR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 21:33:54.3826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e560ad-5676-4c5f-ff54-08dde67a96b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212

On 2025-08-28 05:17, Jan Beulich wrote:
> The present copy_page_sse2() is useful in case the destination page isn't
> going to get touched again soon, or if we want to limit churn on the
> caches. Just rename it, to fit the corresponding {clear,scrub}_page_*()
> naming scheme.
> 
> For cases where latency is the most important aspect, or when it is
> expected that sufficiently large parts of a destination page will get
> accessed again soon after the copying, introduce a "hot" alternative.
> Again use alternatives patching to select between a "legacy" and an ERMS
> variant.
> 
> Don't switch any callers just yet - this will be the subject of subsequent
> changes.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> ---
> Of course both pages can be independently hot/cold, and hence more flavors
> may be necessary here.
> 
> To avoid the NOP padding (also in clear_page_hot()) we could use a double
> REP prefix in the replacement code (accounting for the REX one in the code
> being replaced).

Did my tool chain do it automatically?

0000000000000000 <.altinstr_replacement>:
    0:	b9 00 10 00 00       	mov    $0x1000,%ecx
    5:	f3 f3 a4             	repz rep movsb %ds:(%rsi),%es:(%rdi)

Regards,
Jason

