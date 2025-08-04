Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A28B1A1E7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 14:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069196.1433058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuZW-0001ll-EQ; Mon, 04 Aug 2025 12:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069196.1433058; Mon, 04 Aug 2025 12:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuZW-0001jz-Bl; Mon, 04 Aug 2025 12:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1069196;
 Mon, 04 Aug 2025 12:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dY6Z=2Q=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uiuZV-0001jt-9J
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 12:45:45 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2405::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee2b35ee-7130-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 14:45:42 +0200 (CEST)
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 12:45:39 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::d4) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Mon,
 4 Aug 2025 12:45:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 12:45:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 07:45:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 07:45:38 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Aug 2025 07:45:36 -0500
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
X-Inumbo-ID: ee2b35ee-7130-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+Ihw8hd3PpnrBB4bGMHNG55dcCEneCdzGkvuFP3t96bzzOewbyOPUU9IXQ/xR5Di2ig7CLddhWWy9tCKKkF/nwTWFIeO+9R88Hal8wwe26NLZKNXEWfMkH+zNGhLNR6NxNydvEuA9s7VZqyUYHPnni6NoMbtCjdZsPaigyj9DRaPY+Qoi4x3UXxvw/vFG+YhgwiIjaiWEU9QgcnfOkeCCu7aOSTDgmFkoeUHAlbzgyxiNoGuRhOIHrKDnw2WYSrLtz7cJz7B5Ao6fTPeNN8r+Eo3z5O5v6I5nZIwPvlbqdHycn8KmZQeP+OnJ50i3FNmpb2mR1oQXDp3o6x0LHbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwLSnjMkFOlKzzQ0qwoD9JTIwspxDpytCR2ap+l25Xw=;
 b=qQ6tgcEci7kazOvDmkz3/ZJhx9/PUNZfyq+xpF8OKmMbe761xsdik/gIV6Jj15BmSeRhEswjINUSDmOo6fjgxva2rXRld7SEhTYyt8ixS/Y7IWG7Gxv9txy3VgMpB0L2rg9qJrHMg3cHlEjeUXclGYQPhgPsWieShlgUb8Z/eXWdj26sfLxwIqzSI8RDcnud4oravGZoIS+vPyhG5kv3MaWTp6JtTrsdHzXjidOpAcjT1iFGdptd0JzzNFBrjzz4Mtpls4pnbCbcaxCBVz7v0IVsN50+yk4oH7FJlG8xyemhJEzF+GbY83n3BvcmbjcTsIXQHKzLoQDQTIgKh4b7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwLSnjMkFOlKzzQ0qwoD9JTIwspxDpytCR2ap+l25Xw=;
 b=Hfqax7NGMc68QHqojdXzEJ+EC4FT2wUUhIoXufB8XSKPuxtA8C/oXZLH/yLeCr5YFCqg7QbVgjokJiXoj67Lg1WnovIxeYepHhsF+ywF7ABOfWVZfVYnEltw9heDeRTAnR26a8mz9V497e0Bk8XiwfXIPJVLgNlMVoW7zWJVOiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c21ba07a-2363-498e-a590-7a5b32659f84@amd.com>
Date: Mon, 4 Aug 2025 13:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm/mpu: Implement setup_frametable_mappings for MPU
 systems
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <f08c240934fc126b651096a315da84d2d8e15197.1753864612.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f08c240934fc126b651096a315da84d2d8e15197.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|LV2PR12MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 9618c8da-d0e0-465e-b9ed-08ddd354d0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXVNVjZlSDhjVEhOYUVYOGtjOHFFZ2UzQklWb1l5bzE1MnJYYW9sUGRjK0Ju?=
 =?utf-8?B?ZldWYnpRdnVrZEZkZXFWV1doMDlOY1Z1Q3Z2aG4xOTVSa3hYRmpWNXFZejdE?=
 =?utf-8?B?dnJpVlQ5Y1g5NUpjWnJIczJJelFydWRhQWdNVTRPeGw2bjd0S2QySVRHVjBR?=
 =?utf-8?B?YlFTQjQreC9vQnNNVWpsQ1J0YkhLbGVaMEc1R3U3enVnRXE5Y283NWhuR2k4?=
 =?utf-8?B?L1hMOVV2ZExoTFNnYnpOVnNDR3BnejNPVDJsZ3N5T1lWS1dodWRaRC9TdUVz?=
 =?utf-8?B?MURzYnowa1d2UlRySlN2Si94U3pSMnpycXI5VXIxTjhEeUt3T25vSldqd2c4?=
 =?utf-8?B?eEhFMmV5M2Z5MS9zVEwwTVM4em5wbkorUHRrTmJHU1ZkRkNUekkzL3R3NU9U?=
 =?utf-8?B?cytGSmhJc1lkSVl3VHMwbXcrdEZhS2JGbTFZa0NHMDdpcm84SFZmaEx6MkJR?=
 =?utf-8?B?UnFnM05iUmZpc1o4ajI5MHNoLzBndTNub0ZWWHBKNTd1ZlVwai9MRlBJN3FX?=
 =?utf-8?B?NnNzeFBMeGJjdTFPUFBScU1NNVFpcHNjTTEvQ2ZYOVVBbmFuQ282TERDdFNs?=
 =?utf-8?B?MTdDQXBwVkFLV21CQmJrZFRndzNzZm54Z3J3SFpNcXl0cWVyOFJpM2cwZmFu?=
 =?utf-8?B?L2FXdW5oQ1M5cGllR3VLVzZPT0JUeTJ6VTRQTE1tMEdON2RKSUhkb3BETWVs?=
 =?utf-8?B?K29iZVlSdVNvT2IvOTh6b0xDV2l4NUNQbVNzU1ViTG8zUkkzMFRFUjU2bmpU?=
 =?utf-8?B?bHNCeGRZMHcyazlRTWFmY0gra0ZZdmdCNWhlWlBEbGlhQ0dnOXhSbmtmRDNH?=
 =?utf-8?B?RzM3VnV6Nk9KVGdnNG95cklMSmQxYXk2bXZmbHhCUlRpZGFxUXpnd2tSbzM3?=
 =?utf-8?B?OE1pSTFERjFKN3I2cVlJT242MGpRSnUwbkZDMXNBSzlublZTdHM2cm5MR054?=
 =?utf-8?B?QWN5dDFKTVpZR1BpcmtscXY5dGdzTmxKSCtQRFBhVDM4NHJHYlJ4cnRyNk5S?=
 =?utf-8?B?NXA3aHpkT1FDTUZ2TXdJTTZ4L1Q1dlRaMG0zNU0zME9ZWnVsZk5OVE1xWmFQ?=
 =?utf-8?B?RW9ncDE2bGJaY0tXU0IyaElwSWcwMUU3L0NtYkhKbjdlRGxRZzNQem1lU09R?=
 =?utf-8?B?UDRHdXRpQmJYZ3JIQWd6T2p3YXdFcWZac1g3M0ptNU1NdW9yY2ErMmNESTlJ?=
 =?utf-8?B?aXpkT0V5SXdiZGRpYVlObjBKc2J3NTNubG1lNHdxMmFVc0NNdm5GMXd4bncz?=
 =?utf-8?B?dGlXWUR1ZC90ZWx0WTA1Zk1ZSjJndnQ2cVRmcTZEclNBYmhYQ084M0NIdnFD?=
 =?utf-8?B?YzQyK1FWZ1lDOHpXTFNLeGtROXBZUnNVcEVIYU9ObjUvQ01UYlhvQVlzR2Ux?=
 =?utf-8?B?MHZmRlZqbWNGYll5YmxxOFZBQnpLUkhpOXozbXpOd1V4NnczYUhRb0U3Q1cy?=
 =?utf-8?B?NnhLT3JNZVFpUWE3ZGo1SjFEMkVJZ010N2hoMGRDMVVkMWRocE9HdGxncjk2?=
 =?utf-8?B?bmJFaFA5MHg3NXl5S0d0UlNSUmMxbjMxVDFSRm9aMjZsSWhoa0c5MHhHOGRz?=
 =?utf-8?B?SnJWTkk1d3hYY2xtUHk4Mld3a09jeU4zaTBFNkpUMXV2WUw3ZkVhbDVBTkhW?=
 =?utf-8?B?Nzdqam43MGxBN0FSVHdodjlVcEUwVi9sR0FRNDZCbEpBV1pnZUxIcWYzdjdR?=
 =?utf-8?B?VzkrcVBkSGVlbm1qUkFReUdoaWc5WXZlTGp6VUYyZTRYSTVLT1ArNXdNQmNN?=
 =?utf-8?B?QktBTUZSNDF6SWxzT0oxVWRuYU5DRTltRDhBZzNHZDBhTmJPZXArZit4dSsx?=
 =?utf-8?B?YjNvRENnM1NQSDRTK24rWUNCVDBoOXB3RitnejludU5iVEdRclhUbzNFWExM?=
 =?utf-8?B?a092WUN4VnlKU1hTaTRldWt3azRQTFlkazZHeUx0YnpaR2ZNRTZJdTRhWWNa?=
 =?utf-8?B?VmRSeitmNTArRFE1RDgrREloTnBOVWsvVjhUdWtKNFdWbzQvNTdwZGpmVnha?=
 =?utf-8?B?VDJ3MkcxdUxoSVkyOStoOTNmWW1mYWdoWHhjZTZHVGdWWDBab2hMelFFa0Yw?=
 =?utf-8?Q?BR5325?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 12:45:39.1542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9618c8da-d0e0-465e-b9ed-08ddd354d0f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5776

Hi Hari,

On 30/07/2025 09:45, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Implement the MPU variant of `setup_frametable_mappings`. This function
> will be called by `setup_mm` when an implementation for MPU systems is
> added in a follow up commit.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>

Reviewed-by: Ayan Kumarb Halder <ayan.kumar.halder@amd.com>

Tested-by: Ayan Kumarb Halder <ayan.kumar.halder@amd.com>

(On R82 and R52 with some additional patches)

- Ayan

