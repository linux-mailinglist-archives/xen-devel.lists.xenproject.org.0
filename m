Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F51AE5677
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 00:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022829.1398687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpX8-0006qG-1X; Mon, 23 Jun 2025 22:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022829.1398687; Mon, 23 Jun 2025 22:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpX7-0006oj-U6; Mon, 23 Jun 2025 22:20:57 +0000
Received: by outflank-mailman (input) for mailman id 1022829;
 Mon, 23 Jun 2025 22:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0jg=ZG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uTpX6-0006WR-01
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 22:20:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 540297a6-5080-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 00:20:54 +0200 (CEST)
Received: from BYAPR05CA0071.namprd05.prod.outlook.com (2603:10b6:a03:74::48)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 22:20:51 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::b3) by BYAPR05CA0071.outlook.office365.com
 (2603:10b6:a03:74::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.15 via Frontend Transport; Mon,
 23 Jun 2025 22:20:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 22:20:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 17:20:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 17:20:47 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 17:20:47 -0500
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
X-Inumbo-ID: 540297a6-5080-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elVzQVN2TQuq9y2Vvj2wDx6OEHA9miYe7Asn3IVnPsv7X2t7FX3KFYbupwUQb7IjBxj8+aYyhZSaAJqg9wpJp9JuanGMEhn4/63nFcgTGXsqIOxm1VX/kJc+aQARfRG1tBpq69qUCG+TyOFJhblYeFClKr0U/YqBBDKL9oaEUqzuJfuHVUzoKam0f1ubauSPurV+zZYjVSLD31J/fFnEXyCj3XsS5N/6Cm2uPyUcFA/IQVyS8K14N1INophYNWVk8QFksl93aubH1Gu5i11QvFHkINIjiqgzpG6sWLUGNuTqs5Dmp7XoboTfRec7SP8vJSFtZrC3KQSGwGFfdx8mxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii1fNGp6HNiLb19C5vR+Zl3rPUSVUG7ABdOEVMMEFp0=;
 b=GsZ8siyBsU9YyPq0g/gPXwZzPbuEIrxABwEMqccCTYPvG5JIFE1faueL2mHfG+myqkfjO/C2C2ID3g3rlZRuixuKOVSVfDvAC/tgLgwluEFgjQbPA5zIwBbFdh0rXfIK19ubqD/dqdsX9/yq5vvRQm5iEYrBY66AXUjrxId3+RMhUq0JZ4xExn0x8QLSWLxRfvyL5YAJYVVoaiUPi4kFOCLGBxBHavg1M1ngnoFY4F/2H9YJSADJg0KvS/CmLva4QSd9gRjC1ydjurc7VHtnmvF2E3jEdeAV09YddrtrZcE9whAr/bf/HekJczGv++DpaqnSwhQyuTQMVoDsY0gCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii1fNGp6HNiLb19C5vR+Zl3rPUSVUG7ABdOEVMMEFp0=;
 b=TJA9CyAnQw6d45kjiJ0hDf0WZ3MV5pAZfM7IGaSz4xzIHzemJEsty9f+qvjfm0lHfGptNuYFFqrpSxcNDq0qMUkRmLneKgPeXos5r7zRLhBf+o1CHckGZCWfD4VjZycqc/Rie5x2CM5KKLF74TGOmvz8Tu0f7w7yuK9DNUcCiwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fa4ee6ba-0bb4-4491-8899-b9f2a4d82cdb@amd.com>
Date: Mon, 23 Jun 2025 18:18:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] x86/alternatives: serialize after (self-)modifying
 code
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <658802b4-1847-455d-98ad-244d97fddc5e@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <658802b4-1847-455d-98ad-244d97fddc5e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: f165f09c-03dc-4a77-4cae-08ddb2a435f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmxwaGR0RENiWFhYQy9BUkZFRG56Q2ZHRU5WME1tUG5IRXd2SjVjcUJzMnZn?=
 =?utf-8?B?dllNNTBGR1M4bU90aENCLzNCQXA0cUNUVEdGYzJRMkRnNjRmWDJLbjhHbUds?=
 =?utf-8?B?RnVZLzlqWDE1L3R6ZXlhT3phQmFqSVJTanFSTkhhNExqU1BTdkJYeWZlV2hl?=
 =?utf-8?B?UUJMMytxQk1pWVdkVk5iVXBZTm1KbVhZQ2V5M0gwQlN2dm9US0hkd0J0RU9o?=
 =?utf-8?B?T3c2MXIzUiszVlR5SXYwNVZqZDF4Z1crNXU4UngvZ2ZFNWNMVng2N3E2dW9X?=
 =?utf-8?B?UFZjTU1hZzFnL0p2Q29xM1AweldkY253VDVhZnNYZXBVMFpYRlJSTS80RUxI?=
 =?utf-8?B?MVhLcGJ3YUtTNGVaSGNaSkxYSXlPMVRldmU2eFNnMlkxOGdMNk1raFBmLzdi?=
 =?utf-8?B?blUwTEloMW5kRUVkRmlPVk5FRW5ObnluZVRWQk1XdDRDM0NRdnlVdWw3Qnp5?=
 =?utf-8?B?MlRBQWVhdVNPMXFGUEdlWndpd0dRbExJTDFVUGFhbTZzMzJXaktNbEkvb3A0?=
 =?utf-8?B?MHRONWtBb0Nrc3QxZXNYMnM5QmdtUnArL1BvdzUxR0tjcWpTakVYQUJubG4z?=
 =?utf-8?B?YUZqSmNwUy9uMUFYUkoxT2tUOTdCdjZHVXFaK084b1FNMXB4RUZjaEs0QnIz?=
 =?utf-8?B?anlmczZoeDdZc1JsejZGc2hTSG1NOW1FZFBmZGgvUTFPUlBCVjdPMkQyajI3?=
 =?utf-8?B?SEhmYnptcGFWSlBrT28rUnZ2RE9mbW5rOUZOVksxeUE2b2lwemtSWkc1UVd2?=
 =?utf-8?B?V2ZzU05qMEh6eVFUbFRZS3lCUkV3WTY0aG5hYXFIUVZCd3FUcWtPTUNKSGFh?=
 =?utf-8?B?bXIvVm5IenJZVHpMU0xla09ucFd6Tkh6OWZSNjY3UTNwdmg0UHVZM1NadC9a?=
 =?utf-8?B?UlVuTTRzUjdHb1BwWU1mTmk3YWVwTDNXL3BLSWV5Y2dyK2VmUHFzZmNnbmhB?=
 =?utf-8?B?aHllQllrcXJTYXZBaDdzc1gyQUlhLzVabVAzS2d4RWRMU01aajFrMG96OFo3?=
 =?utf-8?B?MmZ1OE9CMUZYNUkrL2xmbzlsNHQvRkZxVE82U2VrRm50WXlJSTVBTUI0TkIx?=
 =?utf-8?B?dGpvN3RuT1k0UTJlb3ZxQy9SdXd4ZXFPQ1k3S2IwTTBZTXFzSHNJeTEyYkdX?=
 =?utf-8?B?MDBTMmd3Unp6UW5mV0R3RWtEM1FtY0FsOU91anFLS2pQc0NiNGlPK05lY2t0?=
 =?utf-8?B?SGFoeEtRNzJCWThHYWtLNjNPeHpCSUZPRytGSXlIb2JBNy9OV3VLUWF3bjZQ?=
 =?utf-8?B?Z2t1UGQrVmN5R1RleWU5bGNvWUREMEdjWVlidjQvaVI0V2tSZDVQNlRLQ09S?=
 =?utf-8?B?Ukc5RXZPWWxTN2xtOG0va0Z3Q2NFMHBXbzVJNVZVeVFGdnRVdkdaRmRjc0RK?=
 =?utf-8?B?NlhvTXNOeE9xbUE5OW5DOTdsbjlyUGZLMTc2S2drSXZ4enRZWFRDQUpWWFJk?=
 =?utf-8?B?MVRkWVh5d3A3NnUzaHptZ3NwelBqN2J2YytOVnF2NW1xZ3dzalRNMEFvYms3?=
 =?utf-8?B?dklLVWpQT0xGWExzQ3ZHbzM0aDJlbzFqWG9haG9qREFzQStCNUx1UDNYYVhB?=
 =?utf-8?B?STBxY1owMUhka3JGWjhuMHhOVkQ4VS94RGJoS0swRkIrSmZYdTZUbHc0dEw1?=
 =?utf-8?B?ak5yaU9DSjF1ZnhFWmdBY1IxMVhJRHJBRkpXYTZFR0wrQWlXSWlkdG14TG5Y?=
 =?utf-8?B?SEU2ZXlYdGthV1E5SEg4Q2lNemJLT0xMNjdyWEhuTFZSSWRlaldXdnhHMVVM?=
 =?utf-8?B?YmREeUY1bEpxRzB5blZsbGpmcFdwR29hYVZFamRyVVp1cnlpQ2VTQWM1SXNv?=
 =?utf-8?B?Z0Y4UXpFRzlaWFFVK2FpcUIwYkZZdHRYQll6bGFGYUIrVGJRL3JTckExZEdh?=
 =?utf-8?B?Uk1sZ2JWMFdhRURJWndRWTE5YmU5TXl4N0hicXR5NGRhVVY1eDJlVldpMWEx?=
 =?utf-8?B?QkIrQXMrUnNTaTJ6Q25FbVVabStYNFcybkdtQWRkb3pMdS9jZHZNa0dIaXdq?=
 =?utf-8?B?VWpKanM0Tk43V3lSY01nZWh4VGZnV0tDS3lyNiswQjlKZTgvUzRlNktVUGg5?=
 =?utf-8?Q?sjC+oI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 22:20:50.5050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f165f09c-03dc-4a77-4cae-08ddb2a435f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689

On 2025-06-16 08:59, Jan Beulich wrote:
> While supposedly safe via enforcing a control flow change when modifying
> already prefetched code, it may not really be. Afaik a request is
> pending to drop the first of the two options in the SDM's "Handling
> Self- and Cross-Modifying Code" section (still present there as of
> version 087). Insert a serializing instruction there, and remove the
> "noinline" in exchange.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

