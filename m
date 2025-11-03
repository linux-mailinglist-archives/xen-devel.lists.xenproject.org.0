Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60FC2AA34
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 09:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155249.1484755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFqIt-0001IK-27; Mon, 03 Nov 2025 08:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155249.1484755; Mon, 03 Nov 2025 08:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFqIs-0001Fa-VH; Mon, 03 Nov 2025 08:52:42 +0000
Received: by outflank-mailman (input) for mailman id 1155249;
 Mon, 03 Nov 2025 08:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MMMf=5L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vFqIr-0001FU-HD
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 08:52:41 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70e49fa5-b892-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 09:52:35 +0100 (CET)
Received: from BYAPR11CA0094.namprd11.prod.outlook.com (2603:10b6:a03:f4::35)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:52:32 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:a03:f4:cafe::6f) by BYAPR11CA0094.outlook.office365.com
 (2603:10b6:a03:f4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 08:52:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.0 via Frontend Transport; Mon, 3 Nov 2025 08:52:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Nov
 2025 00:52:23 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Nov
 2025 00:52:23 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 00:52:21 -0800
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
X-Inumbo-ID: 70e49fa5-b892-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy3PBHP/WVgrERplBKksNU+LmLNzbd1lkpI6AaIGgPGc8jdR9Zal0TbdLHk2GcEyamMtw3zvK9kUAgLYLSq9MWGId5rW0UJMNmGACUXKZs1MDndmGn0GV5DccIb4bDkHWX1Vs6/4jq5bTqPVZwcJJsU/bYcheAa+zSK8XCiT0Br8VjzXIW+YLVlQh20T8hZrRmWJJMtEVY1iQZn5hjkNlFXOHLEHfAui/siLYF1AWYo+XRCVY3rOSlxeHDvIScLjsXj1/A6aIBSxlUIuUQcULui0YnIzDZXquupgXlvYzuf6HIkHv7uMmN8VVY0hOn/rrwmJZCCe2HPwN+0AylJ3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0DTs4UoAYxbErh4CEudpK8CGNJ61G88ZLCtSiLE5zg=;
 b=aXwFYpRorBD6uz1ghiJFmtoes6n8j4o38jWzPK4dD+Nb7zp2WUWeZrg4M9oe0smq3V4frtkA5STgPiceSFe80ZRHPh5n1gSWf+Iivdrb0MIZf0doAsq84aJwjRne46JC0w7oeMxPx13rLaKwSDpU4vo90vL8eyhi7PDrcuW7iW2M9JB8Tg9BJfYSDBlkZUd3ap3/PnVuUKK2HL1JlaBmQvFlt4CdK7qnInpl/2z/+PIRP2hs4cZuH2EEUJquCZ6WH8xdFHJwts6f+kvBD4NWcD51wAw3J8Y7d76aDIJf14HRmEYs6DZOB9bCH3tOXXny/Tjl44p50lsx2rdmiYW2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0DTs4UoAYxbErh4CEudpK8CGNJ61G88ZLCtSiLE5zg=;
 b=4i2INPBs6j2TavED2v/lj1Lq51zgvfSY3SpVjMK9E3EJSDnljlgik4sf3q4Iiej4FGqEIpEdvis/5roX9sLESZcPZ862ZG6qceJ9J9UC0J0+Bl6yjYSGv36pJ2X1HJu1ewy4NaXc7dwIGCc3PL1h546yc2wgZyfU2sjcct5H59E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <552fc2be-661c-4718-a650-9f2daf6c72ea@amd.com>
Date: Mon, 3 Nov 2025 09:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/efi: address MISRA C Rule 11.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <212a1ac4ee568f027f6cb7f9437aa42d2f0b6c41.1761599221.git.dmytro_prokopchuk1@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <212a1ac4ee568f027f6cb7f9437aa42d2f0b6c41.1761599221.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5595ce-c096-4983-65c8-08de1ab65348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzQvN0d2ckZHWkVTa2p5eURIN2xlTmVkSHJHOVJIaktRSSs0Zkp1clFrbG03?=
 =?utf-8?B?eFZWYUZad2tsZ3NpY3JUZUJHSEUzSExPWXpUYW9UUWoyd0Z2SnkwS3BDUjRQ?=
 =?utf-8?B?cDFwUHAzWTRoNld2elhyYWlERzlwVDQ0R0xkWEY5VjhVT2NVY0JXWlZDY21F?=
 =?utf-8?B?QXBCdU5UM0p5NnhxWU9BWDltWVk5Wmw3aTkzRzJpOGNkUnRFcHZQa1lnckxa?=
 =?utf-8?B?bjI3dm4xdXVScnBvN0NCYSswK1B3MmxPNDRzREFJWHdSdEkwRWNRTFBFbG0x?=
 =?utf-8?B?cHllQTBRellyeFF5eXpUNmxBMG04ekt0Y2tFR3YveE11ZGJuckhRM0ZnYndG?=
 =?utf-8?B?OVRCZk9TYnp5MHpORG1yNXlYK1ZpTHpEMUZHYjRwelRRR3pOdU55YmxwRVVQ?=
 =?utf-8?B?T21HK3B3UFJpNzdpb3ZUUlV6R3U0RGp5TWVLVVh6ZjAwRHViL3Zvb3ZmaWpI?=
 =?utf-8?B?bG82YVM4WWhMMkNOMyt1UVd6MHNKd2JuYzRMdWxvOHBPY3pYKzBSR2dyRWFn?=
 =?utf-8?B?cFQ3ZW5RL091bDF1RFpqeDUxdXdyZVhRMGdEK1ErcWRNODBlVnRMWFBUT0JC?=
 =?utf-8?B?b1Z4WW45ek5LMFFFRXVzUmhQOFZZM1YvVWlpOWg1djVENVVFeFpqUno3Y1RG?=
 =?utf-8?B?Tm9iNmtOdS9kZzhvaHNFM3R4bU9IblF0c2ZpWkUxRW9DRHJhSC9UKzlrcGhn?=
 =?utf-8?B?eW1qVXc3ZTBTa1VpM3J4SHU2cnF1NllRdThzTVVXZnlkUmIwV2U3M3h3M29E?=
 =?utf-8?B?VlhPUStvMGpmU3VJMGxwR2pnSE9oWEVuU1BJaG1iZE9OZXdQZjQ2a2lVTHdx?=
 =?utf-8?B?OXQvVUxJRWpLNzVzeDY4UFBGeXhqR3h5WE1lNGZQb2dnZDRaOU1pUUlKMENo?=
 =?utf-8?B?MnZjK3B5Y1NxL2t5NEVoTm5Ta3NKemtmdlhWNFdxRmZWRVRLMXhmcVRHK21Q?=
 =?utf-8?B?Z3ZXdXk5cVB3S2E2ckszUkFGaWUwM3JEeDVTSjM5U1QxK1Q5QWtwbm5EQUs1?=
 =?utf-8?B?dlNLenpJd0U2aTZiQlBiNG1wdW1FZ0VZTUFLMHBMbktWSklsZDdvdExmS3E4?=
 =?utf-8?B?VzNmLzY1T01QMzlNdDBzZS9lT1ZCRThGWkxkT3prMjhIZUlYZnQ0UVpuU2xY?=
 =?utf-8?B?RmxoMW5rOGhNdlFnL1Z0a08rdnJoQmV3dG9uaUdTWVN1a0FOY0pITEljYzZz?=
 =?utf-8?B?aEhJSi9kNWpLeTRJaGxydHpncUwzTW84U21KNTlVV0RpR25IOXlUQUxjQlBW?=
 =?utf-8?B?K09UZjlzc0hzOWtsWWlzeGJ3SmtrTktBdFVDVy8vcDNhbGMrVyt4MFR1MldK?=
 =?utf-8?B?VEZXcXh2NUJObGF0QkVDODFMNzRtMUVabjhuNWdNRllPYnB5WTk5cXVzeFFm?=
 =?utf-8?B?M3dQdlVzaVdCY3dtRzVJL0Z3N2ZYQUlMSW5UaVJya1liYkZHMksyWTBNZlZk?=
 =?utf-8?B?N2ZJWG5lb3ZlQjJqK0ZYZi9zV0toM0d6NC9ObnVIV0ZhbzFrRlMrL3lNVERh?=
 =?utf-8?B?eVJPVXVLV2J4ZHp4czZObHlHcG9KTzdPRFRjVm1RL2RXc2hEZnhFcTdRd0xJ?=
 =?utf-8?B?VFlUUkVSdVZFM2xEM25vYlRIQUFvYmdhNkxicXQ2VUVac2FFUDdtOUxUR3hl?=
 =?utf-8?B?YkkwcHFBMFptU0F6eEZTekE2bVBiQmc3MlJWSXF5MS9hVVcwaTVqT2VSdjN3?=
 =?utf-8?B?ZDFkVlFMaWVJSzdYM0JVYld0Qm9HdS9XTEt6Y2laVFN6WTR6bVo1bmpCNXpz?=
 =?utf-8?B?aFZZZ2ZROUpPWlJTOVhuT3o2RFAzZjJobVF4RmxSakxZV1k1Z0pnTUtMaTNt?=
 =?utf-8?B?c1V5VGYrYklkazNiNDJTRGIwcnZ3cEJUNndiVm5hR010OTlQOTUzbkp4SGQv?=
 =?utf-8?B?VVVCQ1ZzRFVrMFRDV1lYdmw5TnlIb25FMkZEY01URUhvUWV6UGYxVW1nNjNG?=
 =?utf-8?B?SlRzMHRaVFpZRFg2cUFNZzBLWWJUSEZtQ2tpSWJMSGZGZFRvbWJ0V29lNXBJ?=
 =?utf-8?B?Z2JoT2hTT0I3KzhYU2hKb2Y0ck1MdVF1L0tZb3lXblE1aVVVVkxvTTB6SEFm?=
 =?utf-8?B?UmF5cC84TUFyU0FuN3V1NDZqeWd4ZEt2cm8zYm8vK3NkU1VCa3dSQjA3Wjhq?=
 =?utf-8?Q?zI8w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:52:31.5468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5595ce-c096-4983-65c8-08de1ab65348
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413



On 27/10/2025 22:12, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 11.3 prohibits casting between pointer-to-object types that
> are different types. The original code used a macro 'NextMemoryDescriptor()'
> that performed a non-compliant cast from 'UINT8*' to 'EFI_MEMORY_DESCRIPTOR*'.
> 
> Change 'efi_process_memory_map_bootinfo()' function parameter from
> 'EFI_MEMORY_DESCRIPTOR *' to 'void *' for the memory map parameter. Replace
> usage of 'NextMemoryDescriptor()' macro with compliant pointer arithmetic
> on 'void *', followed by a single compliant cast to 'EFI_MEMORY_DESCRIPTOR *'.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


