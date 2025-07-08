Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B791DAFD9FA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037344.1410015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFuI-0008CV-9l; Tue, 08 Jul 2025 21:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037344.1410015; Tue, 08 Jul 2025 21:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFuI-0008BL-4b; Tue, 08 Jul 2025 21:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1037344;
 Tue, 08 Jul 2025 21:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFuF-0006hl-VS
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:31:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2009::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfeef1fb-5c42-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:31:15 +0200 (CEST)
Received: from DS7PR03CA0320.namprd03.prod.outlook.com (2603:10b6:8:2b::15) by
 CH1PPFC8B3B7859.namprd12.prod.outlook.com (2603:10b6:61f:fc00::622)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 8 Jul
 2025 21:31:11 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::e5) by DS7PR03CA0320.outlook.office365.com
 (2603:10b6:8:2b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 21:31:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:31:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:31:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:31:10 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:31:09 -0500
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
X-Inumbo-ID: dfeef1fb-5c42-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C22oqjsEaKf7CGkEnGG0uJexAA3qfqZ7JeCwwKYkw0++S3Oac4zCONMFQS5ohQZ7aMpieW/brfr9WXXq0aE/SND1P00o73nB5zem6Gq2k37/+Gr4/6jk/5LXMb583sS1Zn5f31ukSxQF4XeTbHAjRsfbqMxYI5gkCAyfqSfEWny4J9bm94O7kZDfrklAmSBCuht8Nl+3B+wSXuH24hVec6P+wrgBCYdyCP5VvKUS30ocQxNtXfJ5YOkeSEbBxItMB+1QAv4ZttvBkP7Tis/Z9rUcCPDmX6MylCSteH7GP+GIBqqKMeeZvKnyowvAKzeX6bPokpUEFeayfP9ernH8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhngEDgbrB/8gGUD5Iz+zChPA8uXe2n06pB1XDHR4d4=;
 b=WSEQwVIwGWUjHtfY8OTOviazgz4wmnx4/AzADtIfzftmrh0eAf3nfypdxHb2Hz1zQaYuYxzN8WrDvcHg5bX1u5VUbGMVcdXHZ+4927OLYlbAELwGZLYDnctCQ0zcyDpTfDSyrFl2EN0/m4B8Hy+S64TKlqCAAia9WBRJHREVq7TYK1haguQ/bXyxR73G4S7UL3mgzOmtzZJtkuZRbPcnFOjj+UB5wH5YCiF2exJYnreXdwVk4sYW+5yRFxZEnVfjUb+n8w1Y8F5GKJ5F13Pk8GmeQrBslWIiDbBzkokcMmKJihbcIYwAzHvZlzv6e6enZQzfqqeZURGso3m9V2In2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhngEDgbrB/8gGUD5Iz+zChPA8uXe2n06pB1XDHR4d4=;
 b=nJqojC+S0pDMzTodpc7eTfIiT3NC5WDHgkiEG7ePgWR85CLZs2JzEJRsimWaU6dvnv5Yd7nfD99Pnv/hsyQE7fQM8P3t3YSE+BthN6n05Cs8PhjHzEmvmtjPQuJZ/T4ZRMEQgjEDntKtxyJWhDUKC0oWlpMBMyE95pHnYkyG90E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <625cb0cd-771b-4ea2-87ee-5ead311b1c00@amd.com>
Date: Tue, 8 Jul 2025 17:14:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 07/19] kexec: fix physical addresses in start info
 data
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-8-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-8-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|CH1PPFC8B3B7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 47dbcf20-8cbd-4f88-2918-08ddbe66c25b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1VxQTF3dlJnOUt6bHI4ZTdzcCsrNzJUQVB0M1FGd2prZSswVTZvYndQUU1r?=
 =?utf-8?B?YWFHSHVZMDF1SXE0aUZ6Y24zR3hCNGRaT3JzWlMvTmh5Wi81K3pqaloyd1RC?=
 =?utf-8?B?VG5waFUzbVEwdHdYc21lam93OHRCWmVMWkxoNVlOOG9oODArQ3Z4aFhXWGJq?=
 =?utf-8?B?MUZvRlB6SnYyQ2tRMlRnRG9ocDFlemQ1MWRENm5UT3Q5Mzk2YnAzbjRQckpG?=
 =?utf-8?B?RS9TdHBHODJaOGh1U0oxd2dFV0hWeHlmL0JrVmdNckFWV0wyVzI0YThvSENk?=
 =?utf-8?B?NG53N1J3VDQyQVp2dHFKdGdRaThtZWtUVFhCWXdwcjBnYUZWbmVUMURIRG1V?=
 =?utf-8?B?bUdORkx4ZzZiRGl4YWRSbkZzVnNSelRVdWQvdlV6dFdvZDlic0xvRjdQRHo2?=
 =?utf-8?B?TXphTU9kRGV3b3lWekFFcGlXK3ZpRlZ1QnFGWXRPZGVvY0xXZkliaE1GcUFL?=
 =?utf-8?B?UEZ6eWpiNlFWckZqRk1Zc2NSWEF0Wkh0SWhPbWk4bFZWZHUyYkVLM1k3cDFK?=
 =?utf-8?B?aFVsczB3SktKdUp2d2dwOElnbU5lWVk2ZmRuaVNQTTc5RG5Ib0dFV1dwbXBa?=
 =?utf-8?B?Z3duSEFqaXhudGs3UzBhMG9QcUhEZi8wRlQrUFNsRUlMcjRRd3U3S3VhQjNP?=
 =?utf-8?B?bjJpY0RobHFLNXlrMTZuYjV0bjZCbXgwU1JKTkdVTTI2RUtUL0MybDFjbnRa?=
 =?utf-8?B?V2VnRlJhWjFQelpHc1FIcG1nckx4NVdtSGs1MXZUTTZvdEdUK3F4NEwya3hO?=
 =?utf-8?B?S044aFdVY1gxRERSWXlWdlkwbmNkM2J2WEZWWG8vTTI3Y09TSnU5a3cvNTl4?=
 =?utf-8?B?WUNZL08xcjkwWERaaDRXczRnS04zUFlqdVVDeFRQUmxNTGRmS0swU09UUFdp?=
 =?utf-8?B?N3F4ZHNmZWtEWWZyc3lEcm5CdGdUd2N4TTA3WmZEbllnSmdIdkROdDJjU3pz?=
 =?utf-8?B?WHAyK3ZvV25lZUsvaisvVFR2NEtYVEY5NFhGK2g0bjhlOWJmWGlveEJXdzZt?=
 =?utf-8?B?RzVTaGpuRUoydWwwcHZqSXUxVkxVUGRoSU9MemZrMWRtRFo2MVhBbWlXOTBy?=
 =?utf-8?B?N3VUY1d6YlRob1JROU1TVk1oOUdtWnoyNG9zajk0a0hNMi80NEE5SE45NWN0?=
 =?utf-8?B?cFEza3JZcllvOU9NeXJyblFrNzljSXVHL0c4L1NaMHV6eW1jaEtyRGNUWVlL?=
 =?utf-8?B?T1R2K0h2MHZDbkRGR2MzQlVidUk0ZnV0dFBhUUJYMWVuNTNRL0J4enFpZSty?=
 =?utf-8?B?di9sRHJOMWNIWWo1RFRtbjJoN3J2K3J2UG1qakdhZnVHUWozU3ZCajM1UENS?=
 =?utf-8?B?Y3J5SVEvUzQ4QjdaN1NxMFJlMFRvYU16L09rV01NcUJZSUNXbkdjRUtMSWxS?=
 =?utf-8?B?ei9KUlNQUTNjUWZmUHZrSER5RS93WG5CSHgxbi9SRTEyU2MvOE9UcGZtalF5?=
 =?utf-8?B?L29vL0psdWNySXBWR3c3bysvdko1czVNM0tNcVgzMitlS2RQa2U2dGFCNU1Z?=
 =?utf-8?B?aE94WmhkdFMvSm9ZN0lqZWZScC9ML2lEVVdXMVczK00rU0U3cDNNU2JoN1Nk?=
 =?utf-8?B?b2NjQUNMK28rMm84Z0dJTUl2alAxbVBUY3hLbzcxVE1pL1IveUpTbW1oTXZ2?=
 =?utf-8?B?ZmwxOWFmMktzZ3VRUVNJY1dGOEFYbXVIK1VMMGE3T0oyRlV1dWEvREJSQ2JV?=
 =?utf-8?B?UHlZbXNtdW5zSk1VRWwzbHFBeEtqSkpWZFQweXJURjc0SEpXN0NMOGExZ1Zo?=
 =?utf-8?B?T3padTlJMjI1T25RVlNnQXg3M2tUYUF2K2dMRWJlWWpBZkFpV2pkTGlEcWtH?=
 =?utf-8?B?eDcxR2tQUEU4TGtJTjYzeENybVRTd1pDUHE2b29rbHJFOWJoUDdQckx5R2pZ?=
 =?utf-8?B?SjU1dmNzZFVJSzNRaFdRSGF2WEU0OUhoSmxlSk50RW5NWDE4OERGSnJRczRw?=
 =?utf-8?B?YjVWS2JDb0ZRdVhZdTRJL2FEODJtb0h1UHFCVDNBSThMVnA0bldLMlM0bnlv?=
 =?utf-8?B?MlRiejdsbnZ0b3pEaWhtQWNyQzNsdnhlZEQ2MHoyeHNXbzBKWU1IYjdVNGZH?=
 =?utf-8?Q?frh4w4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:31:11.2290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dbcf20-8cbd-4f88-2918-08ddbe66c25b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC8B3B7859

On 2025-07-02 04:12, Juergen Gross wrote:
> The physical addresses in struct hvm_start_info are pointing to the
> memory where the data is being built instead of the location where it
> will finally be moved to.
> 
> Fix that.
> 
> Fixes: b7994b6409a4 ("mini-os: kexec: build parameters for new kernel")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

