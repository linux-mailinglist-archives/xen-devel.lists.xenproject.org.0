Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BAA5CF00
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908898.1315931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4zD-0000g8-7B; Tue, 11 Mar 2025 19:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908898.1315931; Tue, 11 Mar 2025 19:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4zD-0000dd-3m; Tue, 11 Mar 2025 19:09:55 +0000
Received: by outflank-mailman (input) for mailman id 908898;
 Tue, 11 Mar 2025 19:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K949=V6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ts4zB-0000dX-FB
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:09:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2414::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 681f2d5c-feac-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:09:51 +0100 (CET)
Received: from PH7P220CA0176.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::29)
 by CYYPR12MB8961.namprd12.prod.outlook.com (2603:10b6:930:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 19:09:46 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::e4) by PH7P220CA0176.outlook.office365.com
 (2603:10b6:510:33b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.23 via Frontend Transport; Tue,
 11 Mar 2025 19:09:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 19:09:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 14:09:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 14:09:45 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Mar 2025 14:09:44 -0500
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
X-Inumbo-ID: 681f2d5c-feac-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iaoxhv/OHWV/DgS2zlGVs7Vm3fAfKfmy+EPG+2vLjE0zNj9KULef2wLcUhpbdeMZkyEEbn7MuemsZq0ru5PwN2b31oedQU+exIK7nk0GHgnMwM0yz3WSM5APNl3byCRgBZuyqrz4tgbFolvLcLv6sItTDFMw03YfdCAZ1dDMYLPWqRBdHqoFbF+Ipj66eX4qCyKwnK1tFpecsyB4YJcNys2VH6ZJYjzKAPidZigAmdTEQlYMvo6+6IzsnuECzwRh4Vgtg0DXsPiiwVYh07zm2ulIYoLA0H0LZQWYAaujQgJJLAJe8gxgsnab2/XwbRZNdvPEKr/ErOZZiq/jksSmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5BvjoAyXkTv4tmyXhMuvwLaX8nRB8RQJ5nFvWXZLmA=;
 b=TH75VlHBuApC/iMxL25A2/lcrNf0IzAY8CGoNEbQfCfcnmEwqjMcwQlitXS9UnBpqG9/OzJ369ZfSQm0s8Ip9kMyIvjgRhF6ePW9qymj0UdhhjDLsS7Zpluvr2whOYlzOPC0zCPoTgO/iYnV23zGfNqur3DLTse1sQGQgzYhjWS/UMfObk76lRLVfjrchbz2KlyOCaGS5IV2r0Zm4KWHDXqypMxtWuQtBFE27M67vgeKmhi1Aa/2/rzHpfcRizwyUGFkb88vuZASpKN7RB3lbxyJq/NXvYzz+u+N9PoAeCAOv+byvHdvJXbE4FWoLYKnwIMB5jz3lJ/jOHpbJwYykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5BvjoAyXkTv4tmyXhMuvwLaX8nRB8RQJ5nFvWXZLmA=;
 b=v52EjrYePkhunXsVg4BHPVOA+gWU2uNPExdk7v/TtFb8mjTEcQ1BQLQdIiXo02FO9DyFcI4lsiZybwnI3SMFdR/UZViwA7+i1LteQ4GAHdbL+uTn1pPjKQsC+x4uKhdOqt8/0mfq0cilsiG8HxAiHAtz/sE3Bp7Ow1bqoEKsMqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e3f298c9-db4c-4255-aa38-7313a54d4f84@amd.com>
Date: Tue, 11 Mar 2025 15:09:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/console: make console buffer size configurable
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>
References: <20250311070912.730334-1-dmkhn@proton.me>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250311070912.730334-1-dmkhn@proton.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|CYYPR12MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2cdd99-4b00-4277-1a63-08dd60d049c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDBJc2hnTDBCWmZKWWFaS2xPNjFkME1hSGRkVWxOK21vbHVBY1Iwak9NNTVz?=
 =?utf-8?B?dWM4VkFpV3dnLzlnZ3N6ZnkxQTFHZVFxbGlYNFZ3U0lQSVFmSUpJOUUvNnhh?=
 =?utf-8?B?eGRSQzZwWUJmRm45QWVmNkZtbkE5aGlaSTRTMDU0WnBDWHIyK2ZCZWFFT1ky?=
 =?utf-8?B?NEtEREZyM1I3ZUdCMVhqK2hhK3JZV1FMdHR0Mk95MGhmMEVQa0pGQWc3NWQ0?=
 =?utf-8?B?U1BtcjdrRVlEd1locUhvUzZrSzJIcnl4NUxOd1drckRLU1gyZThGSW4zbGhP?=
 =?utf-8?B?V3VEK2phKzVqNTJ3ejhrYTc5NHRmQ3hWRVN2Uzg2cVlCN2NJOFRmOTdDZFdn?=
 =?utf-8?B?dTZsbmE4TU9nUWxKL0xMVXllTkR0ZTVRVnVzNGtPc2lHa3k0WUNVZ3pOdDZG?=
 =?utf-8?B?bGYzSGVnb0ZCTUlXMHkyK1l3SmR5bjgreXozM3ZWMWxBNWN6WThzNGdnSmNI?=
 =?utf-8?B?RHhndzZPVng5a0tmeEZXVUIrN0hrQnF5RnlEQnIzVVk3cVJjTWI3V2t3WmhL?=
 =?utf-8?B?djhwaVBEcTRyUUJuM0xtSmxpcHFtSTlPYXJuRTRJMlIxcGRDc3dCb1RueitX?=
 =?utf-8?B?RWxNM2FDRUQzZno5SWRFSU1ibzRPVEExQTlKbmdwWFFjd1F0cmVQamVvOVBa?=
 =?utf-8?B?OHllK1gxMm5xL25Sb0ZwdTNORm8yTmlRNmhuN2NmQXF5Z01BZ2VibWNSc29y?=
 =?utf-8?B?ZW9uWDFQdkh4QzdEc3dySkREdEw0K0FFT3ZjQkR2c1JsM2E5ay84UmRxVkdQ?=
 =?utf-8?B?OFI4TTVTN3d3TGJCeEgwTUVvRWxMNFRINzlod3pYVys1dzRJcS9oK0tWU2pX?=
 =?utf-8?B?bGVQR2lyemREbjVkNFJablZpV2lQUjVDVDhTWkVTTi9sMzN3YkdYL1huR1pv?=
 =?utf-8?B?alY0T0hNNGJDVVRYZWdBanZ2MFRhR05XcXN6c2N1WUtPV0RIMittNXhYSGY1?=
 =?utf-8?B?dG10eCswR0Rpb0x0UHJGeGZlajZpQmRrZXduOEpFWGJUWkRiRU9YTVR6aEdX?=
 =?utf-8?B?ZjZLbEozd0VzSnBOTFFqMGlUL1dTRmswV1BZRjlQZWVid2FjNHJsS1IzUnhI?=
 =?utf-8?B?em4vbkhlRGttQmZkZlpuQ1BQRlZFNmk3Wncrc0M1K3JZR2xGT2dzMzZFTTZR?=
 =?utf-8?B?NmR6NFRwbVVVUG5FQ1FmK0diMnNLYlRSeE4xMlJQbDNQcWNLK21jYlBmZW4w?=
 =?utf-8?B?ZnRsZHFsbEJEZnBhQkhpVW5kQnIwM0J2RlFacnd2NlhYdHJEdHA5bjZUTGZG?=
 =?utf-8?B?ZWtUTjlQdlNQbW5RYWdlTDFlckMrRlR2OXVscmd4cDZwMS9Ka1lyM3ZDQ0Z0?=
 =?utf-8?B?R1NxOTNNYk9zMDR4RExtby9jV0dHcml6Vzdlb2xqOXoxVjk1Tmx0dE0vcjdX?=
 =?utf-8?B?Z0ZPbnU2eXlsNDR2OXQwUDE0MmpXQyswdVNUZllQNndydVFRaDd3S0RlbUND?=
 =?utf-8?B?UFA4bUNXUlZ5NGlsVDJMWVRKaHhNSDltUVM5R1NOcUcyM09nWWRxOVJXUkcx?=
 =?utf-8?B?SGhIbkIvVlJiZTRpR0dqSDNXZFNXL1JzQ0xWSjUxTVJZK2w1UXpxcHVXQVY3?=
 =?utf-8?B?cnA3NHdhVVUyYlRBWko1bkRWSE52K3hOZTFNUFk0UTBGMHhTSDl2dVp4U2tm?=
 =?utf-8?B?anpKeGQrZS94Wi9OUWdWTm1ySnJhUENEVEZmT1NzV1pmcE1SYVA2OW5INUtN?=
 =?utf-8?B?N0pqd1E0SWJoc1M4a1hWYjJ6emVJYjU0eThlTlZ5RTZDTGU3dlcwSEpPK25k?=
 =?utf-8?B?Si9QRDVNdVBYcWlJOGRKb3ByQXlWSUc1dFkyT0VKUVBxc2NOSllzVUp2dmlD?=
 =?utf-8?B?Q3o1ck1rMUsrMU5DeE9tUWhJTmlVT05vekNlRlEzK2o1dm1PSExqd0wrQ0po?=
 =?utf-8?B?RXV1K3VHOURDQ1hwc1Jnd1JFeHhEMCt0TVVZNVRSRWMrLy9PYXkybzZGbkRQ?=
 =?utf-8?B?T3VDMEk0TlZVYjlmbEIvWFpWVjQ3L3d2Vkd1bTRkOGphUU1QQ2VtancxSlhu?=
 =?utf-8?Q?S4sRmY74UymMV6xl6+judlCufCA/2w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 19:09:46.2008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2cdd99-4b00-4277-1a63-08dd60d049c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8961

On 2025-03-11 03:09, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer size
> as a power of 2.
> 
> The supported range is [14..27] -> [16KiB..128MiB].
> 
> Set default to 15 (32 KiB).
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/185
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

