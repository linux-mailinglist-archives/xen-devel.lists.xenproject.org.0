Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA31D25456
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205332.1519633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPAL-0003M4-B8; Thu, 15 Jan 2026 15:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205332.1519633; Thu, 15 Jan 2026 15:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPAL-0003KM-8V; Thu, 15 Jan 2026 15:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1205332;
 Thu, 15 Jan 2026 15:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jd1q=7U=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vgPAJ-000379-NW
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:21:39 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2dc7fe0-f225-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 16:21:38 +0100 (CET)
Received: from BN9P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::9)
 by LV9PR12MB9808.namprd12.prod.outlook.com (2603:10b6:408:2e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 15:21:34 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::cf) by BN9P223CA0004.outlook.office365.com
 (2603:10b6:408:10b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 15:21:20 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 15:21:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 09:21:33 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 07:21:33 -0800
Received: from [172.28.136.14] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 07:21:32 -0800
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
X-Inumbo-ID: e2dc7fe0-f225-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzBZ8iQPP5BLvfZpeDGUQkjTpS6k3tyr6xQZTQSdmsANmRyHvLw7lJ5RDNO+j8v2hzf2rQEBTG0/wXTrHBAQzqmny4/0cWhoAMiFTdub8/uez9+RX0/oih0FkeR5l58wj0FuRg1ZZX2ArUcX6fHrNU8Zy/UyZWQamxo/P3HUBwDLKQkT/EOSklLSm88Oa9qe6rgi0TrRP/kPx54AVWxVNZzQ3AM8VOlK1tQ/Lt9HTHdWAAHKNtC8nARpnKPr4A+Q2BD+MVAooXENCsl9lDilyTpmrMJqV+WaUBWHBrwW0AM1VVzHLNH4Jyta52jyCghhX0tAU5rHkm+qNXKXpkEjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eunTBxQUoCuFapaUeyOHSujr8tPvlHJRrRm31BHHiLU=;
 b=rk5RLGKna8I5jCMHYY78CmCBNG0BGZXqp2wLcfZMEZnjHXDRM9Ruy8qxJC+4BPkCfAVHzQ56Q6E5GEkuHj9YWhX0OILSRQKbevv9UC1Z5fA58DfjnzL79+HkZv2QKtH3UEfovaCh+L/Ow1V9+HImPXH7A/ZhJWq5nKO3DdOgZ+BK6IuFcuHUc8d55WEwwsElh6VRrHD2s2u5WK6XQJls5vSGxwK8RNeJYaU9JgBVY/J/RG6svQNFLswyuTT3yuo5dZsKH7Zy/iLatcW4pQIJVwz5WY7PkuJ+OKgdzhWCWm08GCZo39k90mv2x2xNjx8cq8z1K4xkB9QH07mQz8TtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eunTBxQUoCuFapaUeyOHSujr8tPvlHJRrRm31BHHiLU=;
 b=o+Aqj6bhxPWQQUVZew+RBymS0+MTwouO1IQJKwUl/gfBd9/yOONg1stFr6o+KJRlTl1ChkhtyP/P8x6nkQR7q5h/QTi7UEBY787j2TtMY1J8Q85J+TxDTViXPMPOkoUATgVlOUZ6Lr0nWAcGwqq26kszq1Ysl9skh/Gr0pVJHtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <84943630-0f68-4097-a5a4-4aba17c0fb86@amd.com>
Date: Thu, 15 Jan 2026 10:09:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] xen/mem_access: wrap memory access when VM_EVENT=n
To: Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-6-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260115092841.2651224-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|LV9PR12MB9808:EE_
X-MS-Office365-Filtering-Correlation-Id: df4d648f-03c6-46d6-7c97-08de5449c48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHVJZ0RLa1RIdDN4VTZpN1N3ZitGUGNtN3M4ckg3UG4vaUdkUklxakRZNFhu?=
 =?utf-8?B?Rml2N1gzSXlVYXRHaEtnZWJHRGY3MG5xVEx5MVZIOFhsZWh0KzVsNHVzT2VO?=
 =?utf-8?B?ZmZHbXVhaEUweWtsVk93K2NVVkQvNkJQdkRGWklBbTI4aTkyV2N6U2ppYlBa?=
 =?utf-8?B?YWJtZUV6MFpDMkNta3lwNEF3WTkvdWFjZzNkRGhtVUpxUE9xYWc4Y3gvdWJq?=
 =?utf-8?B?QWRkOGxhS0lmSVF5MGZsdjd0VUdYWnJTNnhyZUNIQ21WNTl1aGgzV3IzSTV0?=
 =?utf-8?B?TDNIbVBMZ1F4M0JlZTFpYjRHYkllMG9Vc0tzNmFnSWs4a1JVVGRVb0RWdmll?=
 =?utf-8?B?VnplWUIvRS9SVHJtM3AvMXd1LysvbG5sZklYTXhrSm1IOWMzM2Y3V0s2endz?=
 =?utf-8?B?Y3V4UEMxV3pacFNBd0ZRYzU5cWh3YkNScmkzQzRKT2M0bkV3a0lxQjMwd3gv?=
 =?utf-8?B?N0lSZE95aTQ1b0VwSjFYd1RzQi91NXRYSGZlSWgrUEJDUmNPeTI0QjRHY3JG?=
 =?utf-8?B?ZFg1S0VUWkxGMzNEc2IyM2FicDBxK1FnbUo3UmlnejdWZkR1ditBQ2tzNGp3?=
 =?utf-8?B?THVxVjZJbXUyVnByMXRPUGtodGJPaVZ1cXJCNkIwVjdHYjZKaXdOWm1sTnJs?=
 =?utf-8?B?RW5FcjRLOFA3SEw3TEpGeXhWYy9jdS80aTBwdFlEN0lTYmc3ZlVjN1V6WWhS?=
 =?utf-8?B?S0psMFJMd1lrZzk5WnRjYjVSaGxQSGZqVnoxZ3RpaEpCYkEwVEdJc0lIQVAv?=
 =?utf-8?B?YzUvRC80bFpTeEVuU0Rma3plVlN1emFjQWpXR2NCdU9wWXcxSjdkQ3V2dEFE?=
 =?utf-8?B?amIwY2VQMnpHNldNREdTS0ExemNEVVNlaGd2Q0FwZm56U3l0QVBhQkJyNEM2?=
 =?utf-8?B?Tk0wSkpyUkdNNXJ2bFlTTTlPMC83U0plUlJHcUhlWVVTY2U0NGdRSVpkdTN2?=
 =?utf-8?B?a3lhRGlsNHEyNXlKNXIwd0FHODVDMXRZY1FuKzVkeHNHY28vendQQjJ0VWZx?=
 =?utf-8?B?bFdCRWJTZ2o1VDRicmxZZFZXL01zc2kzS0tEa3dPTlJHMFY2OTJ3SEh1TE9M?=
 =?utf-8?B?M1puQjRNUUloaHV1ZHZFeGp4czMwSjlydHhCZ0U2VGNYNUNiOFFPVDBZVHlG?=
 =?utf-8?B?RXpqVEcwbVM5UEpNUWNJQlAxVEZLaHZkOGQ4enhteVpXbk9IZXJWMkNxNVJ5?=
 =?utf-8?B?YmJhVjVnYnVqeVMrQlk1Q0RIZnpneFFqWVZVU1hBeVB0YmdrZ0lFMStrRlk5?=
 =?utf-8?B?UU9JNjJjZmMvL2RrT1Ezd1drN0FtVFdmV01iVldsb3FxMEszNTBiSENoZGsx?=
 =?utf-8?B?ZU9TMVhoVERGYWYwdEl6eDBOZElvZ3ppNVVZSm85SENRcnk2elo2cmVCeVcw?=
 =?utf-8?B?enNnZzdjbjArWUY5TWRmNnhBS3RiT1hKdGRTZCtEOFBjQ2xwbEJybnl5cVh0?=
 =?utf-8?B?d0l5MUZubVY5R1FBRXJTUHYxcUhxL3BuT2wrT1oxQXNhb3UyYS9mc0RscERP?=
 =?utf-8?B?eW8wamN3WXdyUjlSVDF0YmN5cjFuL1hVeG9jSGpBRUh1UnRac2RMc0lJemxG?=
 =?utf-8?B?Ui9xdmg2RDZRaEtIVm5ORytDb2h5aTU4NG16bjVCR0duSHVxcmx6YWFhZUR5?=
 =?utf-8?B?ejR5YUYrWDRXV1lUdVczbHpoQUROZXVsRW9FaGdzZWNaTjRYYWd3YzdZeHcw?=
 =?utf-8?B?azNkMWU1VDBXcG84aHRMSTB2cTFMLzRxdjdCOGc2eUd1QzF3ZG9VeUVKNUc3?=
 =?utf-8?B?VWRVSWhybGdINC81S1BsVjFvaUNDeHJtOGhZd2d6MENhd3FKcG5GSm9tcFFt?=
 =?utf-8?B?bkRFbjNSdTZmMFo3T2RJZUE4T1ZOcGFsdHF4YmV1Nm0zWFVhaGQrVGpHbU42?=
 =?utf-8?B?WnA5WkF0R29MWnBwcjd0NWgrZGlFUWlDVEVLRGJXakZING9wcFh1Q2I4TWxW?=
 =?utf-8?B?azllallnMVhjc2tvbzVTMUNURVhMem1nelJwMVV3TVlWeFVKVWowNDMxMVM1?=
 =?utf-8?B?VURvYlNIOHdRYVdlSkRnN0x3RE5sVTg2bUJLbWZwcFUvSTM4dlJXKytTWnJI?=
 =?utf-8?B?cSs0NVROcnRwdmZ2SUdON0kzc202dXpmMlBtdU10Q2Y2Q0ZIMDBUYVc4VVZ2?=
 =?utf-8?B?ZWJWeFNFOHlLVHNQbTk4S0t3eThwU21TV2ZrUzhjVHZYKzEwUVF6djIwZkd1?=
 =?utf-8?B?UFBqWU9kR0l3YjUzYjJucUVWeitrY1p4c3hkSkE3b1B0d21lS2ZEcWxoMVJG?=
 =?utf-8?B?SDZ3OGdybjdEd0VqRWRRVSt6WjBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:21:33.9505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df4d648f-03c6-46d6-7c97-08de5449c48a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9808

On 2026-01-15 04:28, Penny Zheng wrote:
> Feature memory access is based on vm event subsystem, and it could be disabled
> in the future. So a few switch-blocks in do_altp2m_op() need
> vm_event_is_enabled() condition check to pass compilation when ALTP2M=y and
> VM_EVENT=n(, hence MEM_ACCESS=n), like HVMOP_altp2m_set_mem_access, etc.
> Function p2m_mem_access_check() still needs stub when VM_EVENT=n to
> pass compilation.
> Although local variable "req_ptr" still remains NULL throughout its lifetime,
> with the change of NULL assignment, we will face runtime undefined error only
> when CONFIG_USBAN is on. So we strengthen the condition check via adding
> vm_event_is_enabled() for the special case.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

