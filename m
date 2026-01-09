Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A92D0A73B
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198827.1515646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veChw-0003x8-RZ; Fri, 09 Jan 2026 13:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198827.1515646; Fri, 09 Jan 2026 13:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veChw-0003vj-OK; Fri, 09 Jan 2026 13:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1198827;
 Fri, 09 Jan 2026 13:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1veChu-0003vd-Hk
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:39:14 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93794438-ed60-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 14:39:11 +0100 (CET)
Received: from SA9PR13CA0024.namprd13.prod.outlook.com (2603:10b6:806:21::29)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 13:39:03 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:21:cafe::3e) by SA9PR13CA0024.outlook.office365.com
 (2603:10b6:806:21::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Fri, 9
 Jan 2026 13:38:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 13:39:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 07:39:02 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 05:39:02 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 07:39:01 -0600
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
X-Inumbo-ID: 93794438-ed60-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBYAN1Fsfe3VEv88xux4NKI5UKRsJZ/rgfafmTdpsu0CWFFI4zErVjczexGZl6NXgjFqGhVK40wSCgASVWfUtB/vcnf7Vg2UNoChAI4vg+51VUarHfUAtqvX8tQE1mjPzPhPsUZsbvxt7DALosmvLHu1hVpH+f7p4kpNM/e+VOxC9EkWxu1JgbehSUcyaV4Q5yO3KyQEhYldR7ls7+zrl8f7iMYsMFHmKEgOncXjX3cnepLaFDf77oD+ejSsqPVEjrdaqjHOGur/WuO73tVpepr2QL3uSmSUIt+n5VnF6ldiHWRnjbWJcSwwJJwl4PsSAE6JW2PiGNNXJRjpFsK1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/97QvYe2/F0Hn9azJhZ1OEYQhRSgO+YRIB7L6Spx60c=;
 b=emAnK1MgCGVJnkqGfgKWdhxhF7E7iivgjCB9l0bgGHGmGxhZk4plDfRkM05AXvG2g3kiBmijIWNa0CUtr4gVjOKxQcfeEHo0iQGmY1RWV5YHwYfuO8qlYBj7lCsD+cgbPYDgqDCsOh6MdDCP6lJwhBbDp20Hny3xGYRuDJr/VJgzd8BJj8o+JG96HpnLUCuD9Za4E66fWWxalKVkxb66VvyjGGj+PHXcO+JxapCLBP+4wXI6+rVMWcjbkBJEPhkcDLo6MrhjxNWCqWbk4LdcOsYxYTcb+wdUER1JZpTQjx5n+jMUOwEsx3S47J7uJ4mk1XP4Xzh4Nzzxlx0PefOmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/97QvYe2/F0Hn9azJhZ1OEYQhRSgO+YRIB7L6Spx60c=;
 b=qEA+PNf1oOW13a6uOoGlu/1ndU4EUA/SLqXgRBIp0rQ8V83YIx5LukXbZXivSCnAxDctYowgmRABBPRGE1DTZsBO5GEFCLfpgOUSQ5bycItJVAlgg9rovNYx1htWF8clcWGFgHY46g1tEJnUcNUtYdsKAbsY0I+8CGCyeVFqvPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <09de85de-5d49-4dec-bb9a-db7afa22a858@amd.com>
Date: Fri, 9 Jan 2026 14:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MISRA: Extend the R3.1 deviation for URLs to include
 git://
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260109131807.860397-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260109131807.860397-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 6598d673-169d-4594-ec4f-08de4f84741e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVB2c1Jqa1JBVkhZZzhhWnV5MWxLZHIwN21aWFVLS0VjQVlHNnRjS2w4SkdU?=
 =?utf-8?B?K01PRHkvTFhoWlk1dCtzdnpCMU5hVFlWU0pDajBrQWhJbEF2ZjRjcVBvdDVL?=
 =?utf-8?B?L3crM2pvV3lzMk9hQXc0WlhINHBRaDQ1MmtVNlVyTWFlTnB5dVZRMUNQdkYr?=
 =?utf-8?B?dkphdWlzOVk1OGlyYkdZR3JDNkZDZzdtcERQODB4eEp1aVh6N053QWtEdGpE?=
 =?utf-8?B?VG10S3g3MUNkVnlBNE1JZkZoaUJVdXpEN0V4UmVadHJOZWFUT2M4SGYyZ0tJ?=
 =?utf-8?B?ZWNwMzg4N042ZWs3TzFIREFwNXdUakF4WTg4aC9XcDdzd21XdjhGdmxHYjJX?=
 =?utf-8?B?SlhBQjJPcFJIeHdaamk2L3psQnpmRWEvQW5laVE3SXJkcmJVN3p3YllSaTNX?=
 =?utf-8?B?VHZ1aFEvbmRkMndZR0xKSW5DQ04vM0QzVGUySWxtMDlnQ080bG9wZnVtQVZp?=
 =?utf-8?B?S3ZPR3ZnV1dBY2VWY1RqZ2s1QkJ2UzZlZTF0LzJsWFdUalRjVWl4QUVGazBG?=
 =?utf-8?B?Mm8yV1MrWlJrTnllc3g1VTR2YXAvKzQ4KzJQeEtUbWVBMzJrYnlhRmF4SlFu?=
 =?utf-8?B?N2NnRU8vcm16bSs1WGZrZFpIT1oxMUFMQTJ4Z1N0c21kNnluemNVWDM0Nzdp?=
 =?utf-8?B?dHl1dXEzMmhZWDQ2czRQMkowYnRhbCswdkJlR3h1RDBjWGRxSWpZOEtTVWpM?=
 =?utf-8?B?K3dqWjU5dmlXQ0QxeGxtVjZwK3owWkcyK3drbFNCc3VFT1p5bkJhK3NGbUdo?=
 =?utf-8?B?QXlBbFlKbEtlUzdETVZKbnBiRnVNRzNKUXQzSEIveUVKUFA3Um9UTFh3b0tt?=
 =?utf-8?B?MDllbnBNZkVOR0xUbGVoaVlIQUdWV0lqSVo1elRhWlBzaTJpbE9XU3haelhp?=
 =?utf-8?B?QitjWjJtNzlhMVNuQTg1MVpyYUVCbG5RcUVCZllxRzdVZ3dhc2JGeHd5NlRN?=
 =?utf-8?B?bnR3WWFRb1JZRzZJVDZEOHZ1dGJHU0s5Nmpadm14WTAyU1MrVk1wSmxFc1lP?=
 =?utf-8?B?UC9ZYVE1ZE5yZnpyMk5yRXhLQlBSWTgraktSWHJqdXlQZmdGekczcEhkYld4?=
 =?utf-8?B?aHRrZDNOMTM3VU4vQUhzOHFBMm9jc1JITzNtOVZZL2dqVTlKU0xmMStWektv?=
 =?utf-8?B?b1Z0RnBWREZXZjZEaGNUNlNjYmpzekN4bXgrMGNGV3BYQ2pjVkgrUGliUDlF?=
 =?utf-8?B?MXBISUlkM1lIYk9vdUFKSHJ3L3hEOHFaTHhmOHBIdVJ5MHRnUDlNZ2dZUCt2?=
 =?utf-8?B?QWVQMlQrZjhkWWtjazJkNDh2bzdJTm9tZTNqMnQxUUI1SnFCWjgvdlRkamdI?=
 =?utf-8?B?LzhkV2E2Q3J0WVVDbWJuZzlzT0F6aFpmYnVVb3QrOVVWa0Zzd3NlRHVweWR4?=
 =?utf-8?B?dkhoQkd2YmZUb1dEekhDM3hpZUFiZDJzbHludDhnMmtOZGdEdEtIWjFLSCtl?=
 =?utf-8?B?KzlWUWJaK2VpbDFCVlBlKzErSTVIcE4yQksrS2taWmpTekdwdDdzZGVCckMr?=
 =?utf-8?B?M2hvR2dnb3JWcWY5R05sQWdQOS92QUxsRnl0VDVMMXg4NDNqV2U0MnNxSXJX?=
 =?utf-8?B?eXBvQ2NlZVRLS0gxNy96LzA4dDR3ZXJVUjVJNi9rR0NkWE91bkpHY0NDZThX?=
 =?utf-8?B?UFNoNVFtRnBaM0pGTEJGZFRhNmxIU1RjQ2JKREhONEsrNHhsWmIzL0Z0MGhZ?=
 =?utf-8?B?Z2tTRDVVZTVrZzloMlV2Q0JJZXFVWDN5bm5uVUxudGg2bXF0NDB6MzBGN0FP?=
 =?utf-8?B?NU15em9VcXNJNEZKZUNyYkhOOElEa1FPeHc3ajFqSW9yQWtlenVEL2VLQXhz?=
 =?utf-8?B?Z2JpdExnR1hCZlBxbnpBdkM4NHBzV2R0NmlTS2xRblFzaGYwcDRhOTB2dG5E?=
 =?utf-8?B?ZnFYWDQ4djVpSktnNTg4QzVXaWc3c1l6Mk5tVTRyRksyYVBjVUFEakgxRW5I?=
 =?utf-8?B?d016TUw2WWVBZlNiRTJYWnVuRlZ6MUtKc1VQZXhxcndZU2J4dzZhZEZoN2ll?=
 =?utf-8?B?TVUrR1Rwc0oyR1JlYTZKalQ5VVpNKzM0T29Kdmh2d0QxdDYyc1VsY1gvbjJo?=
 =?utf-8?B?R0tBU0RCWjRSVU9LQjB2T081NWY2ZXA2Y2xjdXZuNjVNV3FsZ3lxWlJja0RJ?=
 =?utf-8?Q?utd0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:39:03.5040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6598d673-169d-4594-ec4f-08de4f84741e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167



On 09/01/2026 14:18, Andrew Cooper wrote:
> xen/drivers/passthrough/arm/ipmmu-vmsa.c contains a git:// URL in a block
> comment.  This is also not an example of commented out code, so shouldn't be
> considered a R3.1 violation.
> 
> Extend the regex to include git://, and swap hyperlink for URL in the
> associated documentation to be more precise.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


