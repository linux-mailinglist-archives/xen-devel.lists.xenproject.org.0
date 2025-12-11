Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D7CB4935
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 03:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183524.1506191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTWlz-0001Kj-RE; Thu, 11 Dec 2025 02:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183524.1506191; Thu, 11 Dec 2025 02:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTWlz-0001IV-Nu; Thu, 11 Dec 2025 02:51:19 +0000
Received: by outflank-mailman (input) for mailman id 1183524;
 Thu, 11 Dec 2025 02:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rmkk=6R=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTWly-0001IP-LA
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 02:51:18 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42dceefd-d63c-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 03:51:16 +0100 (CET)
Received: from SJ0PR13CA0162.namprd13.prod.outlook.com (2603:10b6:a03:2c7::17)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 02:51:11 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::8e) by SJ0PR13CA0162.outlook.office365.com
 (2603:10b6:a03:2c7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Thu,
 11 Dec 2025 02:51:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 02:51:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 20:51:11 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 18:51:10 -0800
Received: from [172.17.249.106] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 18:51:09 -0800
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
X-Inumbo-ID: 42dceefd-d63c-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9xpOmbphE6a844vYm3NCgQfS3DPSlavGyLmtDMXO9nOkPNkZKqGYVP3fLqZI+/Z3gJihcmb87MH8C3Se1ar7M6EnIqxA+ReHYRYlUDWyqLr4GaX7yis5C8LMyEY8W3QvcoJfaENGdHpKI50+/q9TSKuS/H2rP5ZKakqDTzOsg0hGYrL0SI/+Uv1hHaG99C6hx2aTc3Gc2gjQ87Ld8N4r3G52ekys++5C8sc/DK+DW0D7dLB/w+wfrlK61LSQ0hL/wm8AdzbYymsvb2xjBc+uc0I1iN9pHBam2l7mfxLqAQW8yEoO1yAtAY+jBCKaZPP4z64J34+I7blc9TP+ffe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaHXOMs0nIbZzsMQlGoVACqZtQlTeT+eTH/0N6FbIwg=;
 b=ALNJ1tui6c0/diXa3SWQmAO3oRxUQGsev8nytiex6UTkVKEMkijvq86lREHcEao6+mLm/Cq24aJd0I0y3TFSfiRdsWVod30vBaiH6HA20sNOHLkPvvjFzeYDn6809a3aQ2ifIQ2F91x0tc+7maXVVMviEZGGoUHg5uCkvH5cZFS8CCojXtwjnOjzT+NhYjxoucJhCeGz+jJ31bJm0nAhFnv8tLiH/Yf2zFf9B6cvpal5rZ9biMA3yakXkTdpa0FRHv3xVvDPZvaMxMqNqex01GxRlYdcuk5o2mpCmO/bp9iJLLE7vF2gAtm92B7Bbt7Xi/O8/NcBgTfY8CI9vvB7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaHXOMs0nIbZzsMQlGoVACqZtQlTeT+eTH/0N6FbIwg=;
 b=0LGvGNnPom4Ji2e1AaqBVjSTSI5QliAXJrlgbOAA27dAHE87cgOPZBr/YizOl33fCj3630hOW20hnj6zpF16tJCavGZEHvgZ14/2EE3Kp+4kb8iTk8Fgq8h5Y1ZPczSo2VyliygPezbt5Rn9BOyMcPr+KWZD9ra41iJGC6NJYVU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2fc46143-2e1f-4fa8-a403-101a4256336a@amd.com>
Date: Wed, 10 Dec 2025 20:53:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
From: Jason Andryuk <jason.andryuk@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
Content-Language: en-US
In-Reply-To: <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9b6d9f-eef5-4e82-9991-08de38602494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWM4TzB5VGxpblEzMDZaSWJmZkpzdDgzWUtaZEc2MDhja0xFWUd5YUJHSFhi?=
 =?utf-8?B?RjhremdVay9XQTNXdlM1dzBlRVNEb1FnTGN1TTMybFV5bkc1MmxEOUJJTHdT?=
 =?utf-8?B?bnpyNEtHcmpaMnpsTlhueFhzaG9SWnlUajBBZ1Z1TkhqVy8xOUplNnRlWEdK?=
 =?utf-8?B?U0tsUkJXWnk5U241SmE3T0MwZHBDUzR4TUpXN3hLZXEzZCtBa0dUbmR0aUhN?=
 =?utf-8?B?QVpOTU0yV3plS291OVZERE1ONzNqUWNsVHJVWWpnL1JtbnFzQmIydDd5b203?=
 =?utf-8?B?bDBRU1pUUms3RjBMYzBSV1RuemZiRmEzQWdGNnhlaDgzaGhRNDlRT3ZBTGFX?=
 =?utf-8?B?cERnaEdEVTY3eGsyWUkrVlVaU2oyVkxOYjY1aUVwd1AzSFlpOEExMkx5NGt3?=
 =?utf-8?B?My9OR0tGRUxEUHQ2Q25IZ2pZWERjUzVXOEtBeUtZY2dtVUp5NnJtenBDM0RL?=
 =?utf-8?B?dnhJNGluNFplWnJxZnhtREdzeFVpNGtrdDlydEpTQm9lbHNPSzZDSTc5ak9j?=
 =?utf-8?B?dngycFgxTzRwTjhONXRkNi83S1lZYVBHd1FBZlBEQUpuUVpzQVZ1ZVByTS9P?=
 =?utf-8?B?UlY3b0lmL2xrYkNWZHlrcit1bWxnS3lndFBFakkwVmY1bnNINUkxazhVdmRG?=
 =?utf-8?B?RGJibzY0S0NwYWxmY3EwOC9Wb1ljQTlFYnB3bnp5ZUtjTTJmZHpVblRJVjRp?=
 =?utf-8?B?NkhJTExRU3lDREEzYlBWR0xGLzlNaHZud29hNGZ5TTVHSzExa3ZxZ2dUcmdt?=
 =?utf-8?B?NlJpV1pDUTZPbGUwMkl3Snp2ckZnV0tIMmJWMVl0OCsxTWRoZ2YvUkQvS0lU?=
 =?utf-8?B?dEp2NTdwRDZEckEyWHZyN3Q5ZjFIMHcxWkhxUjVWYXlyb2prR1hnd3NoNGpp?=
 =?utf-8?B?NFRqaDNJYWtkM2txRWduMTFsNXZzaGpvSmpFRHUzNE5mUysxUHhvaUxDN3o4?=
 =?utf-8?B?cU9VNzNMSFFiTnowS3VmNFl2UkRsaGhDanFUbnFzTXFIMG1IQ084aWQyalh2?=
 =?utf-8?B?NEM1alBLNFM1K2tyazExUjlUMnBSTzBES0dlcEhLcGlGZEZiV3RHTzJSMXVs?=
 =?utf-8?B?QlRneVRpVUZQMWV1eUJxSU5iTDdpdzEvUXluRG9XclZWeEZZdEpzcDVnS3dG?=
 =?utf-8?B?eHNvNzV0aGxtVUJVaG9lSWZnRlVwQzZFSFd3cE9oWVluU1VWNFR2b01aRHFP?=
 =?utf-8?B?ajNiOWJqUGxYQ3RNdTVSMXhzaVJscEwwWmdxR1k0Qzd4VGprTHV6RW53Y284?=
 =?utf-8?B?OTZ1eHo1OFIxUFlBRlU2eVlEYU5vV1Y1SmdGYzM1WVpWUVlZRDdibFFsN0hI?=
 =?utf-8?B?ZktOMTZuL1JJYWNoZkVBamVEYm5yQ2dCNkFlYVU4czEwMTNEUjFITFd5R1c3?=
 =?utf-8?B?QXQ3czRlVFVreTdXMXNsaEdQam1rUDBZUnRyaFRIVVNTbyt1Z1RidU95bFRr?=
 =?utf-8?B?Y1ZyOUFOdHpDYkZCQ0FlZ2dhOHY2L1RBZys3Z2FxVUNDanJ2RFdHS3ZVc1pm?=
 =?utf-8?B?NVRWK3RoWmdKUXQ4QTU4VHg4UnFSWjlsZXZJYWNHWU9kWkdZZkhKOTE5Z2tL?=
 =?utf-8?B?aDhRT2VzUWpHVjA3Uk9WaEJKL21GMlhrNytqcGpJMXoxY0h0Q3Y1VnFSY1JD?=
 =?utf-8?B?cHI3U2lNVXVaNjZjUE8vWkJ5bS95Y0MzT0lKYndwNmp0MTk0cnNiUUlxVnRx?=
 =?utf-8?B?b3lrOVRoTEtvQms0Zm1OalYwV2lkVmx3UnRoNmFwb3VWQjQ4RUFJZmVUQzk2?=
 =?utf-8?B?NzVLaGxFTHNVZS9KMGduQlFEWGVzcjZkVVdwMmVrYW10S0xrNXBmN0drWGpw?=
 =?utf-8?B?N0YwZllQOGYrYWtUVnRCYlpjeVRPYlJ5MjUxbTNLbmlWeWpQK0JtRXYxSklo?=
 =?utf-8?B?QlhEUk1IdnBDRGJWN0FhV1Nqd3UrakloQmJScEYxRmE1N1RHbUZTRWV4NEZK?=
 =?utf-8?B?cUU1Zk9EbkZGNTVUY2R4Mnd0L3ZmYXB3elQ4UEYwZEZaYjdEYXdBWVNNMXpy?=
 =?utf-8?B?ZHdFZDk1enpTakJQR3B4T0NqakxKL1JjYlNVWWpSTC9SeXBOWm82NEdlZjZJ?=
 =?utf-8?B?ZmFXVlpac0dxeFJRVlk3VUtTaExBcnc3ajNKL2tPSXZpUEtldTA0UW1UQjR4?=
 =?utf-8?Q?oE6U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 02:51:11.3579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9b6d9f-eef5-4e82-9991-08de38602494
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764

On 2025-12-10 20:28, Jason Andryuk wrote:
> Also, my test of removing the path to memory_add() still doesn't drop 
> memory_add().

Splitting .altinstr_replacements and .bug_frame.* seems to be needed to 
drop memory_add().

Regards,
Jason

