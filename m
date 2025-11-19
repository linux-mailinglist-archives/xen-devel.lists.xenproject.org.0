Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E223C6D571
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 09:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165674.1492360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLdJm-0006Zc-5y; Wed, 19 Nov 2025 08:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165674.1492360; Wed, 19 Nov 2025 08:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLdJm-0006X1-2V; Wed, 19 Nov 2025 08:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1165674;
 Wed, 19 Nov 2025 08:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vLdJk-0006Wv-FZ
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 08:13:32 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a13fd03b-c51f-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 09:13:30 +0100 (CET)
Received: from MN2PR12CA0032.namprd12.prod.outlook.com (2603:10b6:208:a8::45)
 by SA1PR12MB9548.namprd12.prod.outlook.com (2603:10b6:806:458::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:13:25 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::bc) by MN2PR12CA0032.outlook.office365.com
 (2603:10b6:208:a8::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 08:13:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 08:13:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 19 Nov
 2025 00:13:24 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Nov
 2025 02:13:24 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 00:13:23 -0800
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
X-Inumbo-ID: a13fd03b-c51f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndkZj1lG5nOvd9Dg3LfVMEHy+Vae/6dO6oA4hY4W7w5+k1CrnkZayXhr1HiFirOcwFqwfd/4mbvO7Jo7UZjXizB0UQOUfmWe0xXtuOAtga1nUwS/fQ4in8PBsd9Fa6s6ttDc98fb8TDC4WWGT84u5fcbQ2Kc9urKYgkNeYtpTgJwdmrJ/apvN3QSoI0ezmFbKHhnm/w6dHRqbDhsKxpHGiGC6ZmDQqx0slXB0o2JrTjEF87o3nTYbb6jiU45MjNE/4YKAevnVAmrNRfHHCV31u0Fz3zEsy8eDSDjjZYe+/m5Kgr9e6nS03KyS8Bi1nZXzt/VUTRZqahRf0uX4kW20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24AyysSNcNIiHw+H3hH98QJaEOrIoTB56CxyVKzb4U0=;
 b=PKI/F2P1SkZtUTzIAgDPBhCX0NOt5PjWqwdEQQpZJVMeDbXS27a/Hn6o8ObuzTeJcW5AOdMrBD1B6mibvMceJXw/8ma3jQ2mxRJ+jILgpQpYJ+VnmLvCEERf3YeO1WQSn0PsT0+YsjTZ3cAX9IJA7G5zZtYg62GYpB13Xart38Vm6GIFs1KW5+Q6ihXpTFQNTyClFWnDKXUBhw8wb/vN7WIxzMWFnTQzVX9tXkXL9hj89xhd8KYiR7C6CVDgP1URlCLsRXBqzmITim6DG9HQ5x7irSLvXdLsmagbZ+ab7fdfyiJmZyr/AlBzlf1BMCqiXkxe8nuY1e4QkSn61MAUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24AyysSNcNIiHw+H3hH98QJaEOrIoTB56CxyVKzb4U0=;
 b=qSuJnvmiuPo4jpoa9vUzA901Nrr70XQ1Uf9q5XGI4vAm7bXl1KOy36K7aec+UCfliO3ch4ep5WMNn2QvvkmROHQ8/U4JLGNLWcU0nmet0PJkDyBBgenu6VqBGMY6xOrllynLSPKJBSjQe3nV0Qpqoj2ZfFQIAwsK0HXtchoMg8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6a58e48e-b56f-4139-8229-dd48838de5ae@amd.com>
Date: Wed, 19 Nov 2025 09:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm/mpu: Implement setup_mm for MPU systems
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251119075351.3926690-1-harry.ramsey@arm.com>
 <20251119075351.3926690-2-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251119075351.3926690-2-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|SA1PR12MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e77f041-8865-4896-4172-08de27438334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0srSlNBSW0vVVN5aGdXSXFOdS91N2YwcWR3czJLbExVUGhtaXcwYjVzZW5k?=
 =?utf-8?B?QTd1RW14aVhsYUxGODlqbjh6RThqVTNPdEcwMElIdmQwVEtmVWtOMHEwWkdh?=
 =?utf-8?B?T0JwUjRscU1LYlFsYkZPMXlHMUpISUFVMnFnd2lRVE1GQis1OC83ckNFMkg2?=
 =?utf-8?B?cDhYblBHcjlyMjVmTWpuSEJUWml5ZmlNd0IrZnlabmhlU3pQYnllb083L1p1?=
 =?utf-8?B?djc1WWR5di9JQVBmNnordTNxMWVXZGNyeWFndkp3UFV4SytvS2h1QnJ1L2dK?=
 =?utf-8?B?NkZtUzQrNXVuOVBybnRORCtJVmtHSjM5QXRyWGIzWHhZTC90ZnNVMXREenM0?=
 =?utf-8?B?ZzFmekRsOG5tcTF4dHJWd2Y1V1QrUXU2bHdIelpIN1h0dldvaHRQOEZaNHdY?=
 =?utf-8?B?aVFiM2EzbVhFcjYxdUd6elF6Y0ZDdVEwd3RVZUxuT1IwZjAzNjVTSWxFaEFT?=
 =?utf-8?B?L2p1ckdlUk9kT0MrcWtMZ1p6WEtsckRVM3VUanFHKy82c3VKQ0pwNUtwN0JH?=
 =?utf-8?B?RHNkb1NZb2FNLzZ4ZGpVbWtRNXhHNFlJazF4OWVsenI4bStISjN4WElUVVQ4?=
 =?utf-8?B?b1ZjbGJMTnhoZ1lDQys2aDRuNTdCc0M3VmFGM3kyMlBEMjZEOVBTVngwQ0tV?=
 =?utf-8?B?NmtmMFhuLzZ3Z1VBMFBVNEhCeHBqWWVmR1lJQUJJNytxZVg5R1hnSFNydFdr?=
 =?utf-8?B?TTdlbElWK0VHSmNubmNlRXNFRDc0U2lvT2JXaitQSUhWZEVwSDN1a3ZHODJv?=
 =?utf-8?B?eElBRkZNbmtkZ3gyN0dyN051cW1FbjlHd0RxeUhFdUNpclB1UnM0ZWJoRGpq?=
 =?utf-8?B?d0RpSk05eThoVFlJdG8wd1E0ZzQ1MUZ0NjBkU0l1NUFqN2poNHozUitHR2JU?=
 =?utf-8?B?bE5oeEZyR3pzOVNlbXRYVGY0dDdJcmVSVVp3Mk00NnNxL1Q0YllKaFFGbWlw?=
 =?utf-8?B?cHViRUY0UGhxVGo4Q2pkTXMvWlhaK1NvNGJOanFmRWlvWjFPOFpQZ1p2cEN3?=
 =?utf-8?B?SXlzMFhEd1VKVXlaWUFUQVVCYWtCMjAxcUhmb3U5MGh4bWg3bGFRSzJzMTAy?=
 =?utf-8?B?OUFRWE5mSzF1eU9xZjBpaEFCR05SRjMrMWRvV0lpNExpdk9BUUc0cE5FMXBL?=
 =?utf-8?B?aUd6aG5Dd0lYdUZuQ2w5THh4NTJCbVp2NWg5aW1iYmcwamRTaXZHSFVDWTFZ?=
 =?utf-8?B?U3I5b1FJM1VQZnE2UTZGVndLZVlIVUdEeWJpOVVBbGtRd2c3K2pzWFlyUzAy?=
 =?utf-8?B?MUtDYWFsL05NNVpZQkRTY0lVYkJuS29NTzlpUThqWFZoMmZzdG4zMStrcExY?=
 =?utf-8?B?djRseW9QcUhLcnVJK1hsTHFaV3RQbkFvNnpCYm9LcTg4U1UzZm5SWElVL3dP?=
 =?utf-8?B?Umk4NlNEQmk5dDZ4aHczRjk1UjdFL2p4UWk2WCtpWGN2SkZ0VWdGRG8vTGMr?=
 =?utf-8?B?b3JUYVF0WVJrd2VvZ0puQjVETnV2Vi85NlBtWlJRU1Q3R2V3U1BkVFJRSFZw?=
 =?utf-8?B?QmxxN1UxSnFyK29FbnVoTHZxWUNoV3BaTTlXTjk3NjB3TXhaRDZ5aU9ySG40?=
 =?utf-8?B?ZUlzMUM0Uy9mckhaVVpNV1duQkNVYXhYYkpBbVRxZFNJR0dyY3dyTnl2Y2tP?=
 =?utf-8?B?V0c3cVM1LysyUTlpeGIwNng3NkY1MUhyMmZqS3cxQ2tOVU8rVFRQOGFscHhD?=
 =?utf-8?B?eFFsNkt1KzVFUzh1d0ZacUN6d25TUGFMbEtwSXNxTFFib0VFajExL0c0YWZB?=
 =?utf-8?B?M3pYR1J5TzdqOXFIV2NLaFFzdm5PS2JtMC92ZUFBMUY5dFVabm9MSXdjOU15?=
 =?utf-8?B?dzdhek5zRlcwdGszRkFjVGVaQkNSOU9PbnhyUm50K2lyVncwSjZRMytGTmJQ?=
 =?utf-8?B?R1BBNGpTL01yV1g5emYyck9MbGlZNnQ4RGdjbEtDUmg5YkpFclVlUVZrTGdp?=
 =?utf-8?B?N1E1V3NleDhhNllzMnhrM0dWZ05Yd3ExOTIwYVRBYlFCUExEa0NxNHZSUFJq?=
 =?utf-8?B?SlYwSUl5WjZtYXd3aU5yc0JzZWx4K3BkbkhudTdhSFpFMU5DdzA0LzdFeWQ4?=
 =?utf-8?B?bVJFU3NIaXBmTk9IZ1lTRTVPb2RISlgrL2d2cFRrbXhabW40cjVRYk10S055?=
 =?utf-8?Q?4+Pk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:13:25.0287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e77f041-8865-4896-4172-08de27438334
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9548



On 19/11/2025 08:53, Harry Ramsey wrote:
> Implement `setup_mm` for MPU systems. This variant does not require
> setting up a direct map.
> 
> To reduce code duplication the common initalisation code for both MPU
> and MMU Arm64 configurations is refactored into `setup_mm`. Platform-specific
> setup steps are now handled by a new helper function `setup_mm_helper`.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


