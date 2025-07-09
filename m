Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB426AFED69
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 17:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038377.1410867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWXN-0006v7-JG; Wed, 09 Jul 2025 15:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038377.1410867; Wed, 09 Jul 2025 15:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWXN-0006tJ-GH; Wed, 09 Jul 2025 15:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1038377;
 Wed, 09 Jul 2025 15:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04TA=ZW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZWXM-0006tD-62
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 15:16:44 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [2a01:111:f403:2409::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b769b307-5cd7-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 17:16:42 +0200 (CEST)
Received: from DS7PR05CA0066.namprd05.prod.outlook.com (2603:10b6:8:57::11) by
 DM4PR12MB9735.namprd12.prod.outlook.com (2603:10b6:8:225::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.22; Wed, 9 Jul 2025 15:16:39 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::59) by DS7PR05CA0066.outlook.office365.com
 (2603:10b6:8:57::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Wed, 9
 Jul 2025 15:16:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:16:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 10:16:37 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 10:16:36 -0500
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
X-Inumbo-ID: b769b307-5cd7-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxpsOOUumBevHJAPnaFg+RZhyTYh4rhEV9nEeX0/ImjF+FG2zKOZqiqjBMMICqCWojsbJanNbbwPAjge6HaCaNXOhkLY33uv7avGfAyWLyM5eXBhJDDBBT9Q6onKbwlVWHiaosZ4+RFsYRg65OCvynBk4PLQUPm7Xzudx3aeXc8LkA3wavf1gMjsOxPbHohbATQ/+OsohD3Z2AEWN8pTAt9iya8cuLMAZv9Nct3f3eRdXQgAxUJaHbQ81sUpANTDP6aNUXlyKc/tHOP2LNRgpTl3kBH7fulNrqvYvFM0SX4lO4rRe+sx4q9ANaMXPDH0Ld/bWH2hx+9NIuCtlj5crA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsNgBj2LhzxuVXJuw52HOa8KymJSbE9xf0OvUrjDBNA=;
 b=GPuRuGw+3N4S2x/RxWzypENlHsxqF3PT6nZhgwQET+6FXe+ydIH35uXH5pP0Wmyh0cJN3vzUmFLUp5joAuyx1bVPhBgtNW6sRcfe+afBkqFbiufwbYmHhNK9Zcy99bkN/0ej4P5+4GXK2+DW2caEAGol+kyoQsYh43wDkOcoWMsa8cLpz4In7ujltFsCI3+WqltAxa0zC5tc+CTcD5RhS+6R5D/WjHoMwJk6nPzCfetpRgw6jY7+iC88KiQHRHa/suwbQVMX1b1ntBrxcAMzMWzfPELbN4e7SCHPVdHPKDT8F/dM6kj8WQj79OXhUbm854aTZq3AMRWTXhoIibRocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsNgBj2LhzxuVXJuw52HOa8KymJSbE9xf0OvUrjDBNA=;
 b=atihvLFOwygecxBW6Rb3Y8b5J5MtcfwNq8d1SkmEf2OlOQRKz0A7f0kyQQZ1IlJcxId8w7kvoP4rDV1lwlu34dyseANi5iqssQyBmXYHRnj91h88utJHy+yWrQpTl+tKrmAV+f95qGNJBJwASCUtcr/E39us41e6TTeSbofodfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <28789fb6-b5fd-4e90-b7cb-431734aa0ea9@amd.com>
Date: Wed, 9 Jul 2025 11:16:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: BUG during vgic3 ITS mapping
CC: <Mykyta_Poturai@epam.com>, <rahul.singh@arm.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DM4PR12MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: d137b913-b2f3-4fe2-a40e-08ddbefb9a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djZYRS9wVnVlK0NuYlJYby9tR0IyOXFvTmtUTGZReTZZY0RpaDdDcldhNUU3?=
 =?utf-8?B?b3U2ZEJHb3FzWXB6VjdPQUhMbGh5dVBIenhXd1Bva0EvSDJUaldxOHJ5ZFpv?=
 =?utf-8?B?Tzh6ck9PS3dhUURiLzhnSVdIdXQzY0gvdnJsSFliczd0QkhwTEpOaVMvNkFL?=
 =?utf-8?B?Z3UrNlJLWDRBN3Fpc3RHQUxleVhYbXp2SkJzdDZCTlJIcFhSNXg3K2IwSWZD?=
 =?utf-8?B?VlhJQlBLN3I2MlErdWtGTEkvRU94cnJvNnpiYm1QTWlLWEIvOFBMcXdQK1Nl?=
 =?utf-8?B?UmsrNmMxZ0szRXNnSEFqeFRNcjZCQWFDNk5rNVFjK3Y3S3I1Vnhna0kzUmh1?=
 =?utf-8?B?cDFVTVAvdTZ5TFJnVk11YzBFMWhRTjlIVzBDTEI1aTBmekFkL2ZjdFZkVUx2?=
 =?utf-8?B?WkpxZkJzZVNJTS92alBGTGtaR0t3VDYzZ0xmeGlremhvdU1hU1FNbGljbWUx?=
 =?utf-8?B?MGIxUW1tZjBJVTU5dHJvOGpaV1ZrZm5KZFB3alBQem5hU3EzZmZBVzJpS3Yw?=
 =?utf-8?B?S1lIbEpSSnVDY3BzTnpwNDhlUEJmOG44SHVJQmhMbmhNSStkR0I2WFphNnRI?=
 =?utf-8?B?K2pMZWxvUThXUG5BYW9tU3hFMEZZZEpZbjVST2F5QlhMVkhQR1VmSis2T2to?=
 =?utf-8?B?dVZnZ3NVcTNMa1p4MUJqWXo5NTA4LzMxVHA5Rmx3ZXY2U2sxQ25hdXN5ZW5K?=
 =?utf-8?B?WXlhb0RpTHhlNzlpTkRwVmZHeUp5MExMdkc2N0grZmRaWXE4bHJWV3luNEFQ?=
 =?utf-8?B?WjM0ajBYbzVwS1E5U2xsNVNzTUJwTndEb3VVRnpFalRaNWd0dVM3RU1sbWtJ?=
 =?utf-8?B?TmJoaWhnREZqVjBpUytWMmhoR3JQVG9lRFJwdkpCTW9WUDN0TUdlNFJ5bVRO?=
 =?utf-8?B?RXdyWVdyeTN1NUJtbTlzVVpnUm5VNVVEdk5jZ3NNU29IUkg5Y3FkZC9vWDI2?=
 =?utf-8?B?STRaR3J1TVdQamRCbnI1d1FkR2N0eVZjRWZGWDJoWEMyR2dKalYrcWtXcDRk?=
 =?utf-8?B?eG54M0FRYlp4TEZrdTBxOXZWWmkrTnNLM1Y5RzhCRXJRN3cxZUN1WGkxTURs?=
 =?utf-8?B?TE4zUTIxWTk5VWxoek5uVFVRK1NqVjAzc0QwL0lIZFVYdTgzb2o1YTViaHdi?=
 =?utf-8?B?TVFXcCtic3BwQi9MR2FBYjlqM2tBbEFyeHdIcnVhVk9RSHU2ODRHSitIM0VM?=
 =?utf-8?B?UXhFVEZuV0QzVkp4VFJ6WDA2OGVqcnpSTGJYY1RJRjkvbmFUWnZIVUs0UGI4?=
 =?utf-8?B?U0FCUEMrYkw4dVQ3ZnhnczkzTXNCQnVYb25JRThjS0pwa2J1V3doM0FETjVB?=
 =?utf-8?B?c0EzKzN1K0hRNXJ1dnhUK01WY1Jwem1XZS9rNmErMHB6ZjMvRmROVTQvU3dn?=
 =?utf-8?B?RDl3M2w2ckt1Zm5ST0FSZlZXRFIzd29ZdDRpNTZiYXpIZ0NXK1NtK1JLWGtK?=
 =?utf-8?B?VUcyKzYyaEE1WmJpcS9jR01NeUt2c3RBMkdoV0VjUVdpakVBbXVqWkllYmVB?=
 =?utf-8?B?WFJPTGMvd1BhSW1yNS9qOHNMZmw0UmpJOUZVQ2h0YmxuQnhIcTk2a1phbWVi?=
 =?utf-8?B?Wnd5cUJYL0dWWWVsZmtBQnludU05UUcrWk8xNWtEdkpNTFQ1MDV0a3c4anU0?=
 =?utf-8?B?WlJPNGhVWFNURHI1ekJZdGxISmF3aTk3bkxESUEwdVpGemZDdERlN2htTnNO?=
 =?utf-8?B?SUVOVE9jbUxCZGt1Vjk0REg1a0FNU0JPL0dydEJTTmo0WDlPREkwRVVBV3R5?=
 =?utf-8?B?Y3FCWFFjZkRTb3lNaEw4K3VrVHllL05KS09JZmNwSit1cjdqVkV5NGZPbE9Z?=
 =?utf-8?B?VDdtZTU0b1o5ZVVsNlAvZlJpZjlPN1k1Z3JEbFQ2QWlCQXBnZkhaMzE3Zkpw?=
 =?utf-8?B?Z0preG1JYTFaMTFXMjVJaW1jS1lOM1lBeGFsRDdVTnR4cnlvNVVBZ01hREcz?=
 =?utf-8?B?NGJGVktxVEdPS3h3WU02Uld6akczRmlRR1gydStZRnAwUkFvMEtVaUdnQjgx?=
 =?utf-8?B?ZHFkNDluZm9qekVRclRqaUE5a2dMSS9Nay9jSlMxK1ZMQjM3ZjBjQmtya0d1?=
 =?utf-8?Q?8/pNFW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:16:38.9128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d137b913-b2f3-4fe2-a40e-08ddbefb9a37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9735

Hi,

I'm running Xen in QEMU with vgic3 and started hitting:

(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49

     BUG_ON(!is_domain_direct_mapped(d));

I'm using dmo0less to create a split hardware and control domains.  That 
means hwdom is not direct mapped, but is_iommu_enabled() is true.  It 
looks to be caused by the new call to iommu_map() in:

commit f9f6b22abf1d8d88c97fbc9925b274c0bb4ac881
Author: Rahul Singh <rahul.singh@arm.com>
Date:   Wed Jul 2 07:10:03 2025 +0000

     xen/arm: Map ITS doorbell register to IOMMU page tables

Thoughts on how to address this?

Thanks,
Jason

(XEN) Loading d1 initrd from 0000000045800000 to 
0x0000000048200000-0x000000004bdcd615
(XEN) Loading d1 DTB to 0x0000000048000000-0x00000000480005c4
(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
(XEN) ----[ Xen-4.21-unstable  arm64  debug=y  Tainted: I      ]----
(XEN) CPU:    0
(XEN) PC:     00000a000024c758 arm_iommu_map_page+0x80/0x90
(XEN) LR:     00000a000024c750
(XEN) SP:     00000a000032fb70
(XEN) CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
...
(XEN) Xen call trace:
(XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
(XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
(XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
(XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
(XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
(XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
(XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
(XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
(XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
(XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
(XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

