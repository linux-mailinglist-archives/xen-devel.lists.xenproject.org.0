Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32366A6FE1B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 13:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926447.1329290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3jg-0002rM-9n; Tue, 25 Mar 2025 12:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926447.1329290; Tue, 25 Mar 2025 12:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx3jg-0002pc-7B; Tue, 25 Mar 2025 12:50:28 +0000
Received: by outflank-mailman (input) for mailman id 926447;
 Tue, 25 Mar 2025 12:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gb8l=WM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tx3je-0002pG-M2
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 12:50:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b55e27c7-0977-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 13:50:21 +0100 (CET)
Received: from CH0PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:76::23)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 12:50:16 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::b0) by CH0PR04CA0018.outlook.office365.com
 (2603:10b6:610:76::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 12:50:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 12:50:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 07:50:15 -0500
Received: from [172.22.20.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 07:50:15 -0500
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
X-Inumbo-ID: b55e27c7-0977-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpXodbaRrd8oJbkSMBXk80+UFtJtD7n4KkCwA9J2xsB1At5DIBq3NZIkiH8ypW7RHkJ+lkwDM6Gj2acTka1rLMowD+tGPzZke2PW+EajIPfiYFT852K9jfAVIv/sLP+iX5iHyTqcbE5ELrGk061x4ozwbQ13icesfzocygVpxvNyBpNA/sfbZ6ozJItBQamTYjQYmk3jYhDfLWPyGyVus+iocksY14C+z/P1czCQH8X9WbAM5g5be2NhBUSjFN4dZq7DtQEie92lclOCAm2uhe/JMxRBllAxU/rrGz1rrAbDacdXb5LcfCPyEbdST9tXd2Zv2VEMKkwFMi2WcB3iPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv8ujZsVBJ7ND122M0FVt/qSVDuWdkBERR2tTgU/snE=;
 b=ftzfr3e+f37HIINIP/V+2kNzv17YWKPzaAZCb+nBQ/j6nfPdP7SQAAz4IIymrZNI9b9nEuWuIT5/7StCepT3sLNcn8Po+yGc55hDJCOTk3izLfqKuvEGeqGCEPSyHf+WkijEC2yXeeFnHjpEF5v8VUST/ZG4PU8o+aQw9upS9QEG9TGAc/b0BapFJapDZdqk9RR8VBZ/75711iFL0bTbVRKMOeobI1NghICnkQjLKQ6Zld92pTJ6ACGqZL43b6fLaLbXC/K7HXidK+FiXgOmYLQ1KLu6pdPzT3U2Sfwo7SaV1oFH4phclcb+Yn5NZxk3QtgaSBYWzaoqJ+7p8vr/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv8ujZsVBJ7ND122M0FVt/qSVDuWdkBERR2tTgU/snE=;
 b=KxLMV5muDk1MFix6wCh4jWIZBc2nxTSYDg2QiE3xKQCKMam48vWmPHUnvAp0EOk77er0DMbuQOLZfDe/QX4hcUz2rL9uP9ocdJWarvG7OYTGLOFMtWHfiTm3gmqLTrifcMlcvKWorKKVEf6xB6mOLCEfglfPZvtSGEHh9n5eWDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <477085e5-7c0b-424f-ad71-62f6b8ee94ab@amd.com>
Date: Tue, 25 Mar 2025 08:50:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/PVH: account for module command line length
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>
References: <89d87fb0-88af-4495-92dd-cde28d8c25ff@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <89d87fb0-88af-4495-92dd-cde28d8c25ff@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae27726-aeba-46d2-6be9-08dd6b9b97a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlRwRXBvb05uankzbkw3dkp6Ty9EVHFDeEtFNUpDYVQ0TkRWR0JIVUI4cVFw?=
 =?utf-8?B?by85cElQdnVwRlF3ZFlJM2RDVFh0ejNRQkRDU3NpWTlGRGZscDRUbDhSc2p0?=
 =?utf-8?B?QjJqYytZU1Y1b0FJQ21ocng2dXhVM2tVMXdhcFh4UDA0c0xXc2pHczZFcFR1?=
 =?utf-8?B?d2I0WEZPSCtWeUFsRWRFejN4YUF6eGYvRVkvcFpUK3NyNU9TUGRPVlJqMUVJ?=
 =?utf-8?B?a0dkWlI3R1UwT3NDQkI0YXJtT21Ea3ZHRlcxU09hS1dFSnVGOW90U1pDMktk?=
 =?utf-8?B?eU84cjNHK29uUSszU3ZPeEQyMlA1akRQNDBKcGMzblVYaVNsWmpQVmg5S3Va?=
 =?utf-8?B?SDYrVVlmZDA3SnRVS3FoSUkwY09EeGFzenE3aEZPSUkxK2tPNWUwSld4cWx6?=
 =?utf-8?B?MFZPZXBpLy90NDBtOG9CWEg3S1gwQk84a3o1clluNnExdnhpdUI2a0dsNzRZ?=
 =?utf-8?B?NXNpSmdmYWZIRmdtdXV0bTk4SGFFR0FEcW1ydGV1VXRUcXNRRlk1K2dkdjEw?=
 =?utf-8?B?dkJkTFhJdTlLWWRqVFNqTWN3Y0dyMlhaakhUS0RLTDR5NXU5SFlicXd4VStB?=
 =?utf-8?B?aitMNnl3eEV4Zjh3N1IyQVBCQkdON3k4TlMrZHFwSEVhUlByOXkxZDd5TnZm?=
 =?utf-8?B?YzZOVDFhT3kwSVczNVNKQzM1U3RJNmdnYTUvSGtCYUdSb3ptYmVTV1MzNmIx?=
 =?utf-8?B?d0IzaU8xQjhvdXZqY3JIaUxHcTFpckJQMUxGa0FUMGxyT2NiakY5SkR1akJu?=
 =?utf-8?B?WXJOemNMdXQzQU03bUN5RUhOUXBrU2krVTVva2ZUWnZEemVDa2pQZmRlZjFY?=
 =?utf-8?B?dDFVc2M0Tkd0bUQrNHJvaUFxcEQ3UlI4U1JRaUNrRjFBUnRxRGE5UTlYOVgz?=
 =?utf-8?B?OGFBVTdnbGpmRUdJTzIrUk9LbHh4TXlLeUY0RjNaZG1HTTZndmtYR1pkNy9a?=
 =?utf-8?B?SEp5U2hzTVdzcEF0cGl4S1k1ZmpVVmZHNWhGdXk0MVNKMVM5LzJiSmNJbjFm?=
 =?utf-8?B?UXNBTWtvRk5IMUJyNENNZk1POEZ0ck9VNG5qYzgrR2kyRGlxV2tJcFdhNE04?=
 =?utf-8?B?bzJrUXo0MjVPS2RTWW9HRUt2bnJEZ2VINzRTNmV0T0dmYnM3TGNFblhCbDJ4?=
 =?utf-8?B?Zm9KZHNiNGJjeUptV2NKNGtqTDRDQnBIeW5SM0taV2VyUjFLaWVHWnFsWEhX?=
 =?utf-8?B?cGRTUWxXc3RqMVpuZjJwQUltY1U1V0xHMk1VbW91TkUxSWxkcklSOVZMVzQw?=
 =?utf-8?B?QnNOOUZwT0xWVVNzNk5VZ2FDenRZTnJJT3N1Z3dycnFjekIxekRRUTlmV0Zx?=
 =?utf-8?B?OW5pYXJTMGlLbUp5RmZITWJtTVNZOG1xT0dUaklsWjI2K0pnY0JWZE11MTha?=
 =?utf-8?B?cGxzMEJYRHlQSlBSemZ4eUZFRnFtZ2gxMHRBN29GM1RrdFpCeDQrektacHhp?=
 =?utf-8?B?UEt0V3lMNUJnZkVFK3BxVkVlNTFiZ29rRVFaN3hWYldWdzkzeDZ6SFZBUi9o?=
 =?utf-8?B?dGExNG40MGlNU2RiTFQ2bjNvd0ZENXg3c3VjUjZkWHJxek1mOVhQdzc2NkxZ?=
 =?utf-8?B?NGU2RE85WHFPSlY5N0crRDZDMGkwaGZmN0dwZWZUcXZXRU1DTVA1WStocmZ3?=
 =?utf-8?B?cnMrbHM1UnRBS3p2ekI5cTNPc0ZFN3BYQ0VVeS9Xa2Ivc3hURm1FU2VtaCtI?=
 =?utf-8?B?RE1BMnErQ21MNTYvNkdBMzJvL1cyREZNQllrT3VqbnVqU0VEZ1ZIZDZmV1Fl?=
 =?utf-8?B?OU1TTldzVUlKYlNNQ1dYQkMyN3ZlRXFNVE55NUNiRjFaUjFRRFU0MDNxaFhY?=
 =?utf-8?B?MnltNlNLbXdkWm9nODhYSDg4Z0hlQUVENWVXRHJTQjcwdk4wTEdxaUZ2NXJj?=
 =?utf-8?B?cGxsMU9JT1JRcEM4dHdkYlJmTldjUUliWHZNV2I5K0hPTU9QRE1LTFV1blVj?=
 =?utf-8?B?eE93RkxZUHdGQmhFR2VncGlqeC95V1VyVU51TURFNWxaZHhFN2VXWlpmQy9q?=
 =?utf-8?Q?PoAAse7pWcwrTzv4k5nYKSAexC2OiE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 12:50:16.3869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae27726-aeba-46d2-6be9-08dd6b9b97a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395

On 2025-03-25 04:47, Jan Beulich wrote:
> As per observation in practice, initrd->cmdline_pa is not normally zero.
> Hence so far we always appended at least one byte. That alone may
> already render insufficient the "allocation" made by find_memory().
> Things would be worse when there's actually a (perhaps long) command
> line.
> 
> Skip setup when the command line is empty. Amend the "allocation" size
> by padding and actual size of module command line. Along these lines
> also skip initrd setup when the initrd is zero size.
> 
> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

