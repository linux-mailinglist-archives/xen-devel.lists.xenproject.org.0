Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DB4995536
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 19:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813386.1226311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDaC-0007Hw-QX; Tue, 08 Oct 2024 17:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813386.1226311; Tue, 08 Oct 2024 17:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syDaC-0007Eq-Md; Tue, 08 Oct 2024 17:01:12 +0000
Received: by outflank-mailman (input) for mailman id 813386;
 Tue, 08 Oct 2024 17:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syDaB-0007Ek-08
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 17:01:11 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2416::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b55c9f-8596-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 19:01:08 +0200 (CEST)
Received: from BLAPR03CA0090.namprd03.prod.outlook.com (2603:10b6:208:329::35)
 by LV8PR12MB9262.namprd12.prod.outlook.com (2603:10b6:408:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 17:01:03 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:329:cafe::9f) by BLAPR03CA0090.outlook.office365.com
 (2603:10b6:208:329::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 17:01:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.0 via Frontend Transport; Tue, 8 Oct 2024 17:01:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 12:01:03 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 12:01:02 -0500
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
X-Inumbo-ID: e8b55c9f-8596-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjbOSzkRm4Jvj+o5yxtjh5w9OO3p39TKeN0a7+vI9evdFK4JaikS6eK0tbtpZ0e8fYj5B/OpQAs2ijvhyv4vHDEeWEkxuSZiqahjZFjIKpwukgnmtmSVJEWrRS2nKCVtQj6pBIBwQlQmEYRN281XpLUG/8L2xgnziIoxqBjw8TTrXCCTCChUeWtdr9s+lHB380JFMlNfimm8ah5gSVRdyTIIib6uSvZI6QBAP38dLd0EXBgUmEz7mUwf5z19+/c4ujVDYKWAZo9Xt13FelfVlctpDucc3ivzze8mdE8kOkWAv2BH102tHHMcuiYkfln9A+HeXxZADe66BByJAYMt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9uXffkH/Ov5GjjLKT0LoE3trWhXlAAKcT4A7f6eSWo=;
 b=BeLav2w9q9tGhhyxgXE02qz4M5ft6sxI7Vmb6/ou7oiDY19LN0VzVe/Ic990xdixRUcbpkah8qsz3uD47m2zEev8EAD4R5aEbPFZMZrTR8+mSMhljT1JOk5eoizHyrvm5rOuPl327IOezYIrZHL1WNGqaXG02iiXHy9rliNSPkUFrSVQbHrF+QqgRFSoB0COWnD5OUwzyX+guo54P1jC78c6yqnl4S7Y/8Pa/XcF9qksYIDG4fzrnO8G+U5XiwY55piHvF6K/fhTbAH9bxj0u1uPLAjUpGKqyd+sx5SpvXYswJctY9H5mCdhI/vq47sTQo8s63pZdfcg0G0UpSsXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9uXffkH/Ov5GjjLKT0LoE3trWhXlAAKcT4A7f6eSWo=;
 b=RpdgdQ5Z6WswWbVr0+0P5vajx3CO8MDqIjoZnaXLBwZNqkcmX0ojGNbZxP6xERfaRfJQd5P6+3cwcBunPbjeEkUSHRIqrZYC9H07gULoOre/ItFtrMjD2Z2QETJc9QA5ckjsif2/qNVAZeJRGNvOzQdVS7c7NPvbC8Nh3Ru0ZRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5e656c31-192e-4dff-8dff-2822fd98fe63@amd.com>
Date: Tue, 8 Oct 2024 13:01:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/44] x86/boot: relocate kextra into boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-28-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-28-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|LV8PR12MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: be651f0c-8259-439d-00df-08dce7bacb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVJ3U1JFWlpGTWovNitNSGxZNGo4V3RsQUIwa25jaVpHd0JDRjR6QjZkUVA2?=
 =?utf-8?B?VHI2ZVNIUDhHMGhjeGYyQkpKVUdyUCtYQ29lTVdwRFJCaHp2cE5YZFovRjVL?=
 =?utf-8?B?Y3Y4Y3FVeDNlUUFDOFRPNEoxdVEyRWNlTzBUd1hDL0Fia0hoQlNQYm9nSnJJ?=
 =?utf-8?B?QnhnaVNHN3ZwZUozeGF6Y1JMaE5ST0V3eEp6UnVxOFZLMXRFbGUvU3crU1Ax?=
 =?utf-8?B?RUNsMG9SNHhZU2lIa0Y1UGxpQVB5dzl4N0w5R2dkMEZxbjNEUThaZlhYeG9t?=
 =?utf-8?B?c0xseXRYTTNlNmlVSlY5Y1VucDhMdHllK0lWRTYrTG9OT1JRRGNYWEdBWXd4?=
 =?utf-8?B?MnBuVWZOZk4zOXJHVFVQTGtua3dGc1lCZ2NOVDNjQ0Q3a1M1L01xWU1HNno3?=
 =?utf-8?B?enhhVzNocDYwZC9ZdGdudEVETzI5WTJyZ0JXR2QxV3ZtUnN0aHJTK3VLa3Zj?=
 =?utf-8?B?aFRCVlpLakRzdzE1SnFER3VKUk8wL1Zrclc3Tzk2T2J3YkI3b3FsZGJyTnEx?=
 =?utf-8?B?ZmJ6TGliN1h2NW1QZ0RtL0kweVFmQ1FnT20wQWFSQ0RscUQ4Nmh6Y1o2dnli?=
 =?utf-8?B?TzkrdnhVcXJQVjd2MnhxaFFJSXFhbGpSMHI2QTJXU0V3SHNUaEV5MWc3cmJz?=
 =?utf-8?B?V2VndHErWjJrU1lWQjMyMzFGcWs3NzhCcTRvWEpZeDZuODN1WElaSmx4SVJX?=
 =?utf-8?B?Z2ZRcFZERGJraTRwSGNvN0gvZXh6Q0wvalJEZEtNTkFmQkpwMTJxd01UU1Ns?=
 =?utf-8?B?dWhuNXVMQWFqZ241RGl3SENIT3FDZldvQU5yVm1mRTh4ZUo4THAxdlFaRElB?=
 =?utf-8?B?YWd0SXBHVytRdTZINTh5Y3BMVDkvRGZ5ZFQ2YTRNbm9OSU1RZTlxUVM0Sjli?=
 =?utf-8?B?OTd2ZHovcWpaYVpTRWFDUk4xWWFodlZ2MEJRdlczSHFDbG42OTdJSmF4MzZZ?=
 =?utf-8?B?ZWNiOVJUWTF3L3pkMGdYcGNUeENRSDEyMEZTRDFrOGtMSGlyeVhZTGNTdHk2?=
 =?utf-8?B?VWlCWXdGWHFmNEk4YmgwenVwVm1RS0Nqd1JzR1V1RlNtWENEbVRTdFp6ajBr?=
 =?utf-8?B?dXJBZGhDMVpVZ2ZmQ01JSWYzYkVIbGJDY2tKMDhzaXVyM0s3YkNZOUtFWjlV?=
 =?utf-8?B?U0gwbStxZTl4MVVjWWpLSmJ5NEdyUUp0NzZMdVN3L0JGb3lpazQzM0tFUGtF?=
 =?utf-8?B?c1VVSkYydzRNaFNURFl1RnZuUjJJTUdXdVI3bXliQkUzQ3owVnhtRkxwWVF1?=
 =?utf-8?B?UlBQUk1ydXVsWWNVZmdta0k3SHo5R1gzNW9uNlhJZXRtV1R3NXNacmpDLzZC?=
 =?utf-8?B?T0xzNXFmZGRpU1VMTkNkUjA5VjRqaVQ1eEhoWUR2SnNOSk94QXF4SUJOVWtV?=
 =?utf-8?B?SHc3RFVkTndvZjgzV2tRdytPK1pDQ0ozZFpTZjBncENqZGJrMHhvbDFWZmdC?=
 =?utf-8?B?UTBjU0V0T2dxNzlFdXE5bnczVktIcEtZbXQ2Rk9LdXc2N1dqR3ozeUZ6L2Vr?=
 =?utf-8?B?ZUs1dGlGUmliNGh6WGFVeURVbFUwbFNadENoYkowK2hndXBqRERDUm1vdVpQ?=
 =?utf-8?B?SlYreHh2dzA1cEw4OG1iSHZYUVRrMDFFK2srWnJHRmRkc1NOeEl6NllWZm82?=
 =?utf-8?B?RGc0VHhqeWMrSlhQTFlyWnR4Z3ZYZUlRSzRFL1VZbG5nV2RGZEs0QUhlTjlH?=
 =?utf-8?B?RHFTdkR2dGZQbWdhRjdPUGZRcTFTZzVvV29hcHdYZHN4QjZGU2tmTHk0VWE0?=
 =?utf-8?B?MG05ZHNGUDgwd1dlRUpiRGoxKzdndzk4VTZtYXJrbUszOG9Ccmh3RVNXU3or?=
 =?utf-8?B?NWZvM3M4aFVDTitCU3EwelM4Y01LR1hVQkIvQTlnd2o5RkNFQWwvNEUzeE82?=
 =?utf-8?Q?lvv53VSmnsEdt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:01:03.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be651f0c-8259-439d-00df-08dce7bacb1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9262

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Move kextra into struct boot_info, thus no longer needed to be passed as a
> parameter to create_dom0.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

