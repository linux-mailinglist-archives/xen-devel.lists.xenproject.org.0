Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1CB390B6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 03:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097310.1451710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR7o-0000UD-7L; Thu, 28 Aug 2025 01:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097310.1451710; Thu, 28 Aug 2025 01:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urR7o-0000Si-3k; Thu, 28 Aug 2025 01:08:24 +0000
Received: by outflank-mailman (input) for mailman id 1097310;
 Thu, 28 Aug 2025 01:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urR7n-0008TG-AF
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 01:08:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c854024-83ab-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 03:08:21 +0200 (CEST)
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 01:08:13 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::b7) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 01:08:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 01:08:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:08:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 18:08:11 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 20:08:10 -0500
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
X-Inumbo-ID: 7c854024-83ab-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkzBmJrs36uoPs58DoR4u+tiE9tP2FXC3RWD+Njegi5UxGNuD8fDb0NCSu4NylBt1DgMighwDD5aCERcS22+qYX/TR52e5hi49huaR/xkUaCUNjEPH0CU2Vce8ZKJHPynpikflBSkqiFZ9wHSr5a4BZxZ2a7FiciUPjJuSk8YwTgLZ57kHG0VVsMtwDsOW5tRALfAtgkaPF3ZRwMgR4q4t2TWN1L8hk1PLRERj2gF9/1PJsDsBrb40AGpjgQnRz3Glz6svb2lAHXhlnOdfbPlMfFgsstYQLXchdWUv1C7w+VlGD3cCPT4hI/wAe5TDItd6w8FJUsgrxOjlbUiZFU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6+TSKfnk47FVFH3ZkV9Y2lCk/gX6KdWrnRfuVGnpoo=;
 b=T5O/QjnaNMfyWCqyNlKVtM3ptPRE+mRBpaUB6EzPSt9ozgF/qL6XAibAT0PQWXRNc5myMnnqYtHa3xheMZ0f0/9KIP157ebEG8aLcQ7/is9NWgNFgEeFBVe+euGXiH3jP7J5gtaCWtE9uIejpl6BbIFBtNpMs1amWhQ3wNsRbH1ppm8vYbK+sJHwkjc0iDxj9+6VePvz+qSYhwZlIIDJV1T+6zNB3kliQhQ8Mt5Oz5yRruXBOnSJMeHag0rlN9wVS70vy4wdZ+rble4dh79m5mYm7J6/T85588B6ZURC9NMNeDQ1LeDPk9Xd5TWZzLb8rX+qO4fcxmjgenTfPsQHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6+TSKfnk47FVFH3ZkV9Y2lCk/gX6KdWrnRfuVGnpoo=;
 b=SlR1aP++WhXj2Wu2B55hKKxV+qqnalv9qVz+uE3M2Oy0drJPHbzqvBForuF6+F1OHXw2a+caSj/pdVapvV6EUupB8smKnBH9b52mdZFSs9nZ5bbs85RMwqzMYIWN130uVh3D7bw/qe0I8UbaipMn2sTtdDCTJky1x7ttk65fAUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c170f613-c42a-47f7-aae2-3e5bf1238a1c@amd.com>
Date: Wed, 27 Aug 2025 21:08:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: except Dom0 from setting PoD target
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <c98069b7-ee38-4f06-bebd-25396f2a210a@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c98069b7-ee38-4f06-bebd-25396f2a210a@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a86ecb7-288b-4a35-ea5c-08dde5cf5bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDlTZEtJcldObTZHQmJzbmdiSU5XOWhjMGk3WW9leExOTVAzcTVCV3hkS01T?=
 =?utf-8?B?ZXNnR0tmTTJlMDV1dFlsNXNXNEJiZHNxTXVFRFBLeXpaR2ZiQnhtK00yalRt?=
 =?utf-8?B?S1pEcVVXM0c0aDFabTVWbnIzU2x0S0FSeWJ0MURtc2J5M1R3by91RUZLS3B5?=
 =?utf-8?B?eUZ5dE8rOVg1U3JSNi83TUNzR0FBU05SYUhXdUpIZUVOcUFiOXhXZUllQ2Vj?=
 =?utf-8?B?MjdXZndiNm5OYmVOQWp2bVlaeHNOdGllZnlmM0FwQ0kxQUptSlhLSGFaMFRp?=
 =?utf-8?B?SzFnV3oyK2cvdlNDMndZSWJLL0FoOG16QnZtYVJJZkN1UUY1WXo1bmdzR2FU?=
 =?utf-8?B?TGFKVGIvVWdVdlhrNXNudnVCSHdYbnN0SGgwVldHNllab2pDVE54b0p3TFZJ?=
 =?utf-8?B?RlYwTW9HNXpCMGt0L3duS25GLzdDUEhpSXlGeFlrOUtWMHp6aU1TWjhuQnVP?=
 =?utf-8?B?TGpwbjRaNWxJdjhudEY1Tk9MOFdDTVdCUkxaeXoyL241SUJzYldTYVhDWlQ5?=
 =?utf-8?B?dlZPRllsSEJtVFR6aU9qek5pN0xwNlF2Y1VvbktHeXFWK2I1RXN2ZUZlWG15?=
 =?utf-8?B?RFhTM1RJdjNieWpsNHI2N1JpYm4zeEpWZ0xMRmNRRlphQ25Ibmp6cHhLRzRD?=
 =?utf-8?B?MW5PTU9ndVE1em9IVytWcmh2bDlSZm5KekpBeDJFZVl1TUNvWmJZeUlObTdl?=
 =?utf-8?B?V3ZCNm9pYzV0YmdRRkYzdEFKbmpvZDRvd1Z0cFZiWDh6NHVWcHdTOEJwdGRU?=
 =?utf-8?B?bmZuS3ovY0txWlcrckJBdTcxdk5QUUZteXMzM2oyNkVTZythdURYeXZ2UlJR?=
 =?utf-8?B?WE9vTGt1ZStOamt5VG9aTXNmTWlaYmltelNpR3FYclN3OGx3c2IxRkNUbjFu?=
 =?utf-8?B?R3JMK0hMVUtlK3BVaFhIR3RkLy8zU0JTWjlnMHF1WjRlKzRLa3lyVUE2YXJv?=
 =?utf-8?B?RDVZTTB2YjJ6T1NkbmJqMUtBNkNpQUZINENoeUxFTkZZS0pNR0d1NEQ1Y2dF?=
 =?utf-8?B?NDZ0NWhGR1ZLZHFWZ1R0Um1JTEIwSUNqTzhXOEwyOEpOM3pHMUpmOGh4YnVY?=
 =?utf-8?B?V3AvWDlBc3VHdXJIbXp6dTZ4NUo4bWJWZWt3aEFJSTZYNU1keE95QldMM2hK?=
 =?utf-8?B?TFpRYnl2bkNrRWxibmlKSVgzYTlxMXJocC9Tc1pyQmdrTktpeXJQdExZZjMr?=
 =?utf-8?B?dEQyUUc1OWhTOEdZMHR6bGtQNU9RZE5MOFNaNFA4dy9qWUdDZGRJM2J4ME9z?=
 =?utf-8?B?RzljMXMyY3hZWkdMdkZGZ20vVUdwQlBvQmE4WllKTUROQ0hjYytMUlVDMkt1?=
 =?utf-8?B?NEI2cDU1RU53cTZLbzgvSGsycXJYNXFHTFhhQUpPcGdyWm5seG9LY2gycTZs?=
 =?utf-8?B?YTJ6MThkUzZxNDVReGpqT3daSDJOcEEwMi92Z2NndC8wTHpybFExcVNEdTll?=
 =?utf-8?B?aW5KenRNblAzWDlMSDFEZkYzTlBlUXIwdmVGT3RDYU9SR0pVRHA1OXJkSjIv?=
 =?utf-8?B?SFFOdXlRNWJCOGpUQU9VVko0Z1Q4eFNNSEhBTTZiazRtVUZRR3lzU2hVN3ZN?=
 =?utf-8?B?TFBLcHg0ZlU4bXlaaCt6eHJZVkIyWjQyWjFCSys2ZUFETFVxLzdMMXVYVSs5?=
 =?utf-8?B?WDg5RVZwdk9mL3dVUXlzb1V3UVhJNy9WWThRamE3a3VjOEl2b1hjalRVSUlU?=
 =?utf-8?B?am53OGVGTkFZclRkRFZIVVp2RlM0RjBwQjRram83OEwxa2FMbHZtTml6Wmsr?=
 =?utf-8?B?TDVGR2xrRy9OR1lJUzVkai9walcxWDlxdWJEaFNIakJGckJnSjY4NEIwVXo2?=
 =?utf-8?B?T0ZDLzRtRG5tNDFnTXFxcjZsL1R1enkzNUdUeTJibFRLU2FrODdockxmZVJP?=
 =?utf-8?B?UEtEYi80SGxIbmh3emNVLzhEd2dDS2t0N0U2NlpCc1NZRFFicGVueitMNEpj?=
 =?utf-8?B?enlsdGJINlh1MHpzOXJvcVlDbVEzUllCNUcrK1VMb1lQYXhnaEtwZjQ5RkRR?=
 =?utf-8?B?SWFDRWUrOXVXVkxLUERodUppbnRsbWJYZ3NpY2o2QU5vWjNaUEpia2E2QWRy?=
 =?utf-8?Q?Gy7re+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:08:11.7955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a86ecb7-288b-4a35-ea5c-08dde5cf5bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859

On 2025-08-27 01:53, Jan Beulich wrote:
> Dom0 is never started in PoD mode, and hence it can at "best" do harm if
> we try to set a PoD target for it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Did you observe an issue, or just notice this when inspecting the code? 
If an issue, please add to the commit message.

Thanks,
Jason

