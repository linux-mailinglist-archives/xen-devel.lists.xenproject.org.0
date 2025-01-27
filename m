Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27963A1D643
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877873.1288028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcObk-0006VQ-9m; Mon, 27 Jan 2025 12:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877873.1288028; Mon, 27 Jan 2025 12:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcObk-0006So-71; Mon, 27 Jan 2025 12:52:52 +0000
Received: by outflank-mailman (input) for mailman id 877873;
 Mon, 27 Jan 2025 12:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEBS=UT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tcObi-0006Ai-J5
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:52:50 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f403:240a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b892487-dcad-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 13:52:48 +0100 (CET)
Received: from BL1PR13CA0450.namprd13.prod.outlook.com (2603:10b6:208:2c3::35)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Mon, 27 Jan
 2025 12:52:42 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::b) by BL1PR13CA0450.outlook.office365.com
 (2603:10b6:208:2c3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14 via Frontend Transport; Mon,
 27 Jan 2025 12:52:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 12:52:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 06:52:41 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 06:52:40 -0600
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
X-Inumbo-ID: 9b892487-dcad-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHPcj6wifu+2dtKoZJBRuqTGq1BfW5Ese17h+gwVHK20L+DP1wVIlYTYtI5xEL+u1dyZLgnO//aEJW/hgR4fOHn+QExfCLuYdqdYbB5NcaVh6sq3pu4LfZfgZ3BZoxd21bzQuLbWhO14bG36lB8AeHJAMvhyKFNN2zcurL1XzoTR4FjtUZlYwqzECuunsRMmpmHpcTMQhvu87AFF5zaKIK41MlSgv5PYSPg8/BCG5xxGfwBpHSWRKCHB5k6nzN1mvEZkDmyYrv72RJfyPssv1TW0npV4yN9VEJ6Z/iMWLm9m3hCDm2A0oirbe276ApB0KiPTVuh+MM7fKet/icSnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XFgsxSwQx1KRayDWUBjwuGRg2YMiR5oxVMFrlWouDI=;
 b=GFItp0rBjmIT0bvBnuZZQwqMkOP5LMv2EsqxnS3rT61VBl6Rm6gY89kcEBWXcZXZgijuvoP+BT/4bkUbI2/neLs3U3j5G4WK4iJJ324Xn41ueiaQo8rBSsCk6wV1lzgs4ctPuHnd2RnisR7p8QpwDJXVeuh16lSDPKbgAdtUYVWe0ZuJTtwrU1F6Reulie2qsaeFyYc993RcaKAuX0Xs9R/6FpkmDdMkaGbr33n2PmQBnDRBl9vzi/yrECKzEEg6qLSBzv8wEo3RvFrDcwy8Qi/s95H6R95cYmgro0hPunXK5vfqkyHvQgNZJOl2j9tJ1lEbaoGzdaizZU8JARkNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XFgsxSwQx1KRayDWUBjwuGRg2YMiR5oxVMFrlWouDI=;
 b=2Fmt9P61o8vDHkvGEbUcbtyHqVN68KyX7v2KNBeXrSDfqm9AaRsvJB7l8RQvKhxpdEHzPHod0ZRVyQXVuuq4/GwWeD80fynHyqad5TmhbH/HIy01X9ZODSow6rdCDyAYrBN4CfTBX9RPQDprbRiamZ7Ij0CSzO7cRZDDDrGiPNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <32d42df5-08d9-4670-a571-ef315897514b@amd.com>
Date: Mon, 27 Jan 2025 13:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
To: Julien Grall <julien.grall.oss@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	<oleksii.kurochko@gmail.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
 <20250127104556.175641-2-michal.orzel@amd.com>
 <CAJ=z9a24=PE-3bhmZvfTaTgpdCXp9iDTWfoH-9F9-_OdkEf4Tg@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAJ=z9a24=PE-3bhmZvfTaTgpdCXp9iDTWfoH-9F9-_OdkEf4Tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: efff4bb7-4be0-434c-6df3-08dd3ed17ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHIzZS9YQ2J2eHEvUG5JU3dlQmhXNnVvT0ZJNWlQZDh2blpybFVDRmJrVUMr?=
 =?utf-8?B?VlhQQ1ByL1FGZ05qMnl3VUtoeWtDSWY0K0JJQUV1Q0cycFhzenhjYTlZZWhB?=
 =?utf-8?B?alh1K0hsVVFiTVVFa3BYOTBjbDk3K3ArR1JndmYvMlVJQXZQRktyeGhHQTc3?=
 =?utf-8?B?dThycmVwSjFTSm10bGJWYVNUL3lIaXpqR2RTOXJLUTBpaEVDMFRudFV4SWV2?=
 =?utf-8?B?V085TGdwNC9vRTFPbUtXNk9VaTA2dmhtakNvTFNlYmpIcVpIL05xSHozNXNq?=
 =?utf-8?B?dUY4Nis5bTNuQWtodUFjQUlqSGVLZ1E5eVR4aWdDdGtkMm5uOTBJMlVHM0tW?=
 =?utf-8?B?b1VyekVOYy9nVlNoQ1pSK3NHSUpLYXZTdU44eXFENHRCU0xUcHJ0VkRNUFJP?=
 =?utf-8?B?RjY2QWQ2UmIvT1M5eG5LT0ZrQ21nRlZtN2Z5VkxLSWNHSy9TMkwwT3M3RHhL?=
 =?utf-8?B?ZGZVYXVRNndobFB3K1Z0dVIwaS94TWNOb2dtalQ0ZVp4dVQ3bzhML0R1Njk0?=
 =?utf-8?B?c0svQUpzS213K21wcWNteFNCOFZJMFptdkFMcG9ORFE2WXRxVTlHNWdoWDBx?=
 =?utf-8?B?YmpFTnlud01iWmQ1YVZsN1NGaWM4UWhVM09wL0l1UUZuTzc5VzJtc0dCNmZz?=
 =?utf-8?B?QTdYZ3dDUmtHUEE3L2t4a1BjeDB6MjJHY3ZkR1VHUXF5T05EZ3NPR2pKUkRI?=
 =?utf-8?B?bTcrS3R5T2t3a25iZTR5cC9aWHhPZGpsSDN6VERFYXNkNU9WZVJYUmtOK2hX?=
 =?utf-8?B?MnlRNDFzYjhrbExraEtjbDBtZ3E4Z3AxaXJITlRGdzhjWm1qejBEZlNKYTZK?=
 =?utf-8?B?bExHT29GSTdsamJOZkR2YlZCOWh4VmJEUDdSdm9vTWdGSzd3aGNrREVxeHdw?=
 =?utf-8?B?ZStJdVF6bEl5RXdlMElmYjMxUzNWSkpiOFFGcmlOV1JWSkRxWFo1UmJOaG05?=
 =?utf-8?B?dlZpYm5ncXdpVVIvWWp1eEFqUnFlOXlvRmZiR3RmQ2J5bGp6NlVSN21MMGJ6?=
 =?utf-8?B?N0hjeWJQclhsSGlVS3BCOEFaRzB2TnhHcHI3a1dJU2V4UmNSUEtHZHUwRnVs?=
 =?utf-8?B?bXQvNllYWEN2YU9rUTBBR2Nhckl4YmtSMWFqYkRLeUlidzhBckJuMHdpaVlw?=
 =?utf-8?B?WDZQSXpzLzlTSTZpM1RsV0krZFRKWVZLUXhSMFpwcGR1eGgzL0paTmJNQ0lO?=
 =?utf-8?B?TzVlZ0p5VUNyaHhhZGxSTE9CME0xWUZuek9EbUhPNzNxdkV5bWdCaUZBN0Jt?=
 =?utf-8?B?Wm9INmhzYmZRY2pWTXJOM2FYcFBtbWJUcjZTbkFaNW4waVE3Qi9OcDl1elNU?=
 =?utf-8?B?MW5zc24yRnZhMklySGNJY2hjVmYwZGo5KzJ2NkdvaHplS3ZOUVMxbnJPMXdB?=
 =?utf-8?B?OUZHOEhxcThZZFRBc3o4OFkvZ0h6dENxaWhtMFVEODBMcW9oREtDUWlXajFs?=
 =?utf-8?B?bnd1Y0lvdFJkc0M4OEs2UXExTDY1S0dnUHZOOElpNXFrVW8yeUhUTndDRWVj?=
 =?utf-8?B?MVVBRUJBSVIxK0ZPUXZ6TytUMGFKT2lXWklwQmo0eUdyaUUxVUVla3pJUlky?=
 =?utf-8?B?OFlhZGFURk5nOHQ5OVQ1R0JKMWhqNUQwbHFUUWlLMmh6V28welg3WFllaGdM?=
 =?utf-8?B?amJObm0vc0lFN1pDTkpmVDJ3ZXc2KzgyajM1NEV1SnVQZEswRzNqZTFFQzdq?=
 =?utf-8?B?WmUzWjl3R3dKTnBEaDJneHIrekZBNWlVMU1HSitKQmV0NXRMWStTLzNDVnl4?=
 =?utf-8?B?eERsRFRxQ0s5L1VjWmk4RXpZc1Yyck9PY0RBcjZOSHFFVlNqbkNad0ZhVHVQ?=
 =?utf-8?B?UktuV1RTdWJGKzVtQlRxVDl4ZmVGSHlHb2FCOUQ4dEhnbzBKNFY4NGk0Q1lx?=
 =?utf-8?B?aElxU2ZtOGJUd2RFQ1JhSUdBS1pLaHB3ekFnMWlHOTNIUTc1YVJ4WW1aclZk?=
 =?utf-8?B?Q1JuZTZacUxqcVo1NExWb014WmYxbWtURzZjZUJ1SnRzOEpPV0VlSFVRSE85?=
 =?utf-8?Q?j/hh6E5CdQzFI6ZKtHiF/j/NLqVnWw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 12:52:42.0220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efff4bb7-4be0-434c-6df3-08dd3ed17ce3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597



On 27/01/2025 12:19, Julien Grall wrote:
> 	
> 
> 
> 
> 
> On Mon, 27 Jan 2025 at 07:46, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
> 
>     On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
>     common/device-tree/bootfdt.c: In function 'build_assertions':
>     ./include/xen/macros.h:47:31: error: static assertion failed: "!(alignof(struct membanks) != 8)"
>        47 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
>           |                               ^~~~~~~~~~~~~~
>     common/device-tree/bootfdt.c:31:5: note: in expansion of macro 'BUILD_BUG_ON'
>        31 |     BUILD_BUG_ON(alignof(struct membanks) != 8);
> 
>     When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long,
>     therefore the struct membanks alignment is 4B. Fix it.
> 
> 
> Usually, we add a BUILD_BUG_ON when other parts of the code rely on a specific property (in this case alignment). Can you explain in the commit message why the new check is still ok?
Well, the change itself reflects the change in alignment requirement.
When paddr_t is 64b (Arm64, Arm32 with PA=40b) the alignment is 8B.
On Arm32 with PA=32b, the alignment is 4B because paddr_t is 4B.

AFAICT you requested this check back then, because struct membanks contains flexible array member 'bank' of type struct membank.
The alignment requirement of struct membanks becomes the requirement of struct membank whose largest type is paddr_t.
Let me know how you would like to have this written in commit msg.

~Michal


