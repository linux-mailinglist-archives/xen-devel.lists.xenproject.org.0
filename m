Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09DCA12BE6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 20:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873064.1284049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY9ID-00015K-G5; Wed, 15 Jan 2025 19:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873064.1284049; Wed, 15 Jan 2025 19:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY9ID-00012l-DG; Wed, 15 Jan 2025 19:43:09 +0000
Received: by outflank-mailman (input) for mailman id 873064;
 Wed, 15 Jan 2025 19:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZO=UH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tY9IC-00012d-3A
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 19:43:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2417::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0724c83-d378-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 20:43:06 +0100 (CET)
Received: from DS7PR03CA0186.namprd03.prod.outlook.com (2603:10b6:5:3b6::11)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 19:43:03 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::e0) by DS7PR03CA0186.outlook.office365.com
 (2603:10b6:5:3b6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Wed,
 15 Jan 2025 19:43:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 19:43:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 13:43:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 13:43:01 -0600
Received: from [172.27.3.102] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 13:43:01 -0600
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
X-Inumbo-ID: f0724c83-d378-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAV3akHcAslZ6+jagTdzvQjH/FHHqIxj4UxlxddywRimrvsmCQEU3jMbosqoQBZzxrftEjusVNG/35M+savWJZFzk1UfN3Qsut4c8MGQlsfJzb65jU/OXXFv8oWoWIkoG2SDBxUNWzrr8bvSMDeFUqsYRYlXH7BEkM2504cmWWdKrdozgGxq6aaJbWOqpZXpq2wQjOgTKXyNgBlc9f6rjI2GKCh8PkxzlUhm0bX0nrM9ekpzEnXNhAl1qhhzbyQor7XIdXa/+JaE7pf6vm4MQqFqaGSxCFTkGFQaMDe2n3sMkvrImsJ6EmOakI4SEzwlycyF4FWsBcf8IHJWZ2VAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4smHa1qGEBB9avk0ZbJBURnL+T92NB2xIiCHq9iiOQ=;
 b=qPXNddzg/whl1OLP94sP7Q46m2V+SIdBYS3Ps6ZPctjc/efEBufewu9ajsOq2CqppArEYzlW2hsR/uDsoBpIIibij/hjOVxZn9LZA7slsy+lQAQJRzrUNzcXWiZiGoGw4veKL+dPO9tKCSqbMtjII4fHMUYVcU2dW/aV1MZtAORRuHjb8dSr3fZIfVbIuFv8GBgzoWvwXb4N0izp9R265LtXw/BgDfqVGureaRFgW01Jun69CAu9jpbjKxddGbckEERfF6t3CDD3ZlZvXf3g3Jip4AOYPkjpVpGEcQ7+skVeTDLULlBXKEv/VVNTPOMEZFWZ1KPQuj/oyvngZW4xcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4smHa1qGEBB9avk0ZbJBURnL+T92NB2xIiCHq9iiOQ=;
 b=QgTZleaN42aXwOvoYR9eQkNkh6jcK34QfcE8imHeKtA06uYzCwi4Lz2a9rcLPybb/hSrsOHfF0QwnHzElAfXmpDzZiRBGkmubPf9fdkNop3Yf1tDb/JMLBeB3CK0ffu8lsaLz7gIt5/b1XVoBwayrIQUJec0cNUZOzOaWDT4xC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <aa9b0bf9-5d71-4fc0-a11f-3c0d0e9649ca@amd.com>
Date: Wed, 15 Jan 2025 14:42:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] x86/hyperlaunch: specify dom0 mode with device
 tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-13-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7f30f8-45a6-428c-aecb-08dd359cd2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXA2cExYYTNpTFVJNjhRSGtaN2drU2txQisxL0JobHZWME1MeGM5Vk5Bdkk2?=
 =?utf-8?B?NWtvOVZocWVwbGo3dS94eDdDdEdraTJNZlZRY2w0RkxkbzA5NlRVZUNNdWFy?=
 =?utf-8?B?NVhaVnRVYU95djh2anZkYjdLMWtkK1Qxc3RhOWdITC9kcXB0UHlwUHJka2VL?=
 =?utf-8?B?YnlSKyt0eit5UUYrUkVDZFIyVkdDWDJTSThJYmNOdEd6Z2EyeGUrRzd0V05V?=
 =?utf-8?B?Z0Q1cDZLVnBCcHBtNlRYbFE4Y1RiU2duL1ROb2NPWGpodjdvQmpKVlV6Sk5V?=
 =?utf-8?B?bjMzc1paNzNRWUo3cTdzZnZpZCs1ZldFRC84MWdlYTVEcWpGM1dab2o5YWNY?=
 =?utf-8?B?c0s0U0dSdGFoZ3czR2NQWUhmd3R6cVJvdngyMEJ5SnJHdTVPeFpwOHo5MEll?=
 =?utf-8?B?blJaY2J5dHpER3JVRlRUd2dCYnJFQzhVQkdtV1gwbFZzb0hDWGEvWm90R3Fk?=
 =?utf-8?B?blBXMHVsWTR3RkttZGd6TGRZbWJrUDFxblgyREFNUEtnTzVzbHlNcEdwbXM2?=
 =?utf-8?B?NWd5MHlmbEdiTzV2TFg5VkIvWTZXbWNlcU4yZUN3RHYxb1BxQ01sNEdmeUtQ?=
 =?utf-8?B?eW5ITWh0L2VoSXpldXVIbGhrTE9vR1pVcnZSakhjaCtjYmkwOWt6RlNET1Fp?=
 =?utf-8?B?YVptWU5aaURrM3h1cGpCc0ltVnJZZzBkYW40SktHNkZqL1F1enBmRTBWc3JK?=
 =?utf-8?B?cENVeFI3WFkrOElac0E3RzljYWxRUTBCN0lPSm9FVk16U0lqUDQ1UkdWdXR2?=
 =?utf-8?B?aURrM21DQ0poTUtDaFhmK0xoNHhkamtWMmxsVVQ1YW8yWmkrKzJ0TkVHZ3Vz?=
 =?utf-8?B?bHAyU2dwNUg0YUNQa3lyeXlQWjNDQVgwUGZnMC8ybnlUbVhwczNWS2MxL1RE?=
 =?utf-8?B?Y0tZeXhObWl1ZHhnSFBnVEdwMGt6bWR2OWNsT0poVVpuZWZTa3VYUTNMRTI5?=
 =?utf-8?B?T0k1RDNMZ01RM1pFeTAvTEx4RTNtdjZlTlBZVzZwb0UvQ3kya3BKWW0rdVNF?=
 =?utf-8?B?cjFGSWVLQVArOEV5RFZJbTZQV1pmclJZMlp4dEhjTFBBdmQ4aFRmbVk5N1I0?=
 =?utf-8?B?M3ZLMkRBSVFwdzR6NjRnMGhFRXQxUXAvR3hScGdmSVh4WkYrajZ6TjBnT0w4?=
 =?utf-8?B?YXlpNHZ3VU9wTDdIQjBxWnZQMksxeGdxeXJueDBTQUtQUXFlc2Rhdmh2K1g4?=
 =?utf-8?B?Y3ZPbUQ2OFBTL1VPRjRSQ0dxZEpMd3daSUVlVDB0S0J2OUNkQU94dWdrWGxH?=
 =?utf-8?B?UFphd3Q4UWRqQWpRUXB1K1AycEhpLzFOMHY3WVBBL3UxbW54MWUvZW1FdjNE?=
 =?utf-8?B?cGx2RldzNytVckRaUWIxeVlLKzZ4VDZoYmtkeWVKWUc5aktuaVZaRkVtUUFL?=
 =?utf-8?B?R1RSY2N2M2RkNkdDY1JaQ0lLc0FPTTBIZ1VoYU5QVm05SlJFUXYzRndpTUdS?=
 =?utf-8?B?VkIwK25ndU9uQ3I3R0RXVjFNNnhlMjVvZXA0em91L1ZzbFMra0t3aGhMT1k4?=
 =?utf-8?B?Z3RUbS9iNEZpeDRlOWt6ejlDTFMrdVZXazJuZ1M4ZVZEQVg4VVhJOTlKY3V0?=
 =?utf-8?B?Z1BDNzhIeVJOTW50aGdkOHRxVDJxUnJaRGV5ZC9kWEgwTFlBVHBMV3Vod1Mz?=
 =?utf-8?B?YU4zaDM0WHZmdjhFdWkwdWdRTDVnY1JSeEVJaU9TaFo0SHJadTFNL3RudnJN?=
 =?utf-8?B?UFBzVTBqcnQ2NUVVWDJKcWxPL1FTK3F2RmN1WjBheXFNM3lJbU9OSFBoR2ts?=
 =?utf-8?B?MnNpMzlMN1hUQTJoUWdQNlhaYmI0eExoZStpRkJRTGl3N3Z0U3IrUXNOdG91?=
 =?utf-8?B?ckw3YUJmcUFka2tFL2JiR3lDcU1CbzY5N0htWDlUQ0pHNVVFUGhPakxOQXpi?=
 =?utf-8?B?Tmd4cm1Td1c2bVByQm53UVl5K0x1Smx4ai8rN1JlU2E1dkZ5b0FTQXhDdEJj?=
 =?utf-8?B?TzhSei8xVSswK05JeEpJM0laajVoUTRXbjRJWjR6ZEpiOWViNkc4UEszTWxL?=
 =?utf-8?Q?suMjKOsNiiLhastRlBLKJbS953d/0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 19:43:02.5311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7f30f8-45a6-428c-aecb-08dd359cd2f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Enable selecting the mode in which the domain will be built and ran. This

s/built and ran/built and run/

Regards,
Jason

