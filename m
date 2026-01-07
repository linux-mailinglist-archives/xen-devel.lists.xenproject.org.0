Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F42CFCDA3
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 10:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196586.1514364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPoh-0000TP-NJ; Wed, 07 Jan 2026 09:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196586.1514364; Wed, 07 Jan 2026 09:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPoh-0000Ry-Ka; Wed, 07 Jan 2026 09:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1196586;
 Wed, 07 Jan 2026 09:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K00X=7M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vdPog-0000Rs-Lq
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 09:26:58 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02e08139-ebab-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 10:26:57 +0100 (CET)
Received: from SA9PR03CA0025.namprd03.prod.outlook.com (2603:10b6:806:20::30)
 by DS2PR12MB9663.namprd12.prod.outlook.com (2603:10b6:8:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 09:26:53 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::31) by SA9PR03CA0025.outlook.office365.com
 (2603:10b6:806:20::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 09:26:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:26:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 7 Jan
 2026 03:26:52 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 03:26:52 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 03:26:50 -0600
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
X-Inumbo-ID: 02e08139-ebab-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTx9LEB5PfslRLAQGZ4/dKH2WsyQqPx8H5j/Z1fneZ6ZBEd07ZgmHLsaBigqWNyb1pGagaPzI2WZXzq8CquQvbw4lKXn7yTXa0JtXRee3e8xX/r0Vdqu4hEkwHO22EI9/MYkhxLZY0KNGK7hkdXSCjzsyOflJOXhXnFTZAhYWBqspOu9sgw8e69tH85DH5IPo3j90xHJi3rzOKju8atqpBCgMIJGvsRJpRcKK+ZD77HG1TZpmguw1GmHjLdahonXbiYfgZF0UXktWysNhYrfOMNOTix2/r0g50+AvBmuHMeqS8B8OaDzb1bTTxnwNB8VTKUAjaq+5RSIzAzmBmOCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYLwJKGF2Zmr9o6J084P8prhRYOwg6LglebErqqr/+c=;
 b=Vgx8puBCNNdVBQd8oKjTgkgvZPqXLt6KAk9pMnEUlPxiHwjq7/aDBJvoYIok1k+xdYUCoiHU8PONT2WCo8R1noqBg4awMBwYWymw/6ZmiQtFke51/+xXeJD9BeqGCJrWb7o2PC8QB00cjYU+ud/qGKLPUcEdXIBH7darymMNNRc2Yo+qfsyfC1jKMQwWvHrwEIgHUhg9bOUQCezCw0eqo8VDCYSknV2OG9QIZTUiXlWSFeRnCqk1GgcfYJEq9TlIevnf/O7Qn+pzuEgbkafJvuLBX2ddKTmDj029mSpQLHraKt3Banxc31Y5wWOsEhjhZunIt5FoIZ9u5w0Cu2hmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYLwJKGF2Zmr9o6J084P8prhRYOwg6LglebErqqr/+c=;
 b=qzPm1a29hlLVEK28OB1lsLgscJmc5wInTpmkfKbEurWgjlUEOH6M3Q8vzMe7z9zfBRRYSY0L6N+OZKTNINhkpjoUnxyF8yYknIfgvizDsFnMd4BAUDM+i/l8iKrOLudPjycrX1BX3grsVx9TEVRBeQoJsOO9vizq6d4MHW6elnc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a8cb52f1-69e5-42df-9b77-6b6e1cbf2c6f@amd.com>
Date: Wed, 7 Jan 2026 10:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm/time: Sort headers
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
 <20251230135050.188191-3-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251230135050.188191-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|DS2PR12MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c59efe-3716-4a1d-4ca7-08de4dcee4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU9MSnFRamJzR2tyV1NMV2tWSm5sc25jQnJJVmd1emkxVllzK21yNkhRbHIx?=
 =?utf-8?B?WUJIbjdTOUkvYmlrM0tZR3lqdkFQR1NmMmZFR2l2Tml3YU9zZWt2VXdhaUY4?=
 =?utf-8?B?NldLM281ZnpMZnoyZWRwV3ptS2N1MnZnbU5lcVVIeFRtdlJlcHBMRDZHNkVN?=
 =?utf-8?B?dHJtUjZKU0FLMkJ1NHRlZ0czaVlyUCs3ZHFCai8zRHhwK3lsTUMrcVhob21h?=
 =?utf-8?B?emgxY1FXL3RudGtwMklIaEpqZy9OdldQeWlTMGdPOWY1MkpZRkgwMkFsWEpt?=
 =?utf-8?B?cy9uTXlSTGNIbU1lcnJkejZGbXJLRSt6clVjaFkrZkxORzZnRndqZm13N0FV?=
 =?utf-8?B?cVBxOTJ4enZURFRVSTFDemJJbmlNVWE5SW53bDMxdWNrRWhXMXhCNGV4M0R4?=
 =?utf-8?B?RTR0dktyWk1OSlgvV1p6S0pLQW9vTlFhYmZqZStZVkNWYnBMZm5heFBzVU1m?=
 =?utf-8?B?emJ0YkI5b01tZTJnTjR4cmxkSkdLS01mWFkrL3VYcFNmTkxTM3pkdDNZTDZP?=
 =?utf-8?B?d2tqYUpJUmhDRkZoOU5WcExMYTE5T3pMMXZFaUFZRENUeHVzZTN6VzI1S3o2?=
 =?utf-8?B?ZmU2ZmN2RnN3QlpqbnpwTnJQQ2tnblFubitpdVFZdnV0Vm5HVktnV09QRTB3?=
 =?utf-8?B?MFB0TG95Mm9yeENUeXZiVm50cVBkWWE5ZSthRXBKVmxoWlhyYVV3TjlVc1Bo?=
 =?utf-8?B?NzVrU1NzRGp3eC9vYnhkQVJSTFNGcEdEcnFvNHdIV1FaakwzMnM0eHZsU1Aw?=
 =?utf-8?B?U0RwOWVaR0puL2ptZVB1b2owK2ozUnliM2pTRVY0bUtvVjNscVBJa3pkbUVs?=
 =?utf-8?B?WXZXQ1lNdXZ5WGtGTXQ1V2hQbngrQUNIWW51ejUrVjIrYlNWSExDQTAxeENm?=
 =?utf-8?B?Rm54K0lIOUVleThEL1RkcmY0T1Y4b0xkZUllVzVXdDRiMERBT0R5a3plNDd6?=
 =?utf-8?B?bTNxdWFpMGg1L3FNV29RbG40L2ZpdTkzWU9NUXZaQkNmdUJjK2FPUys4ZUFG?=
 =?utf-8?B?L3YvdVFVSkRPOGlpMkFYTSszcHRuWWxadmxKWVdDbVdwWFNudFZ2b1lJT2k0?=
 =?utf-8?B?UFdOQTZ6d0p6UmpsVTVjRG1mVU9ZRzBkWFVub05oeVQyaU84VUFNbXlLeDNa?=
 =?utf-8?B?eGdlZHhaM1RjdVdFSVc2bzA2Y2djZFdFcFJLU2o2K3kzTFZhc3FXS0NEZmJE?=
 =?utf-8?B?R0pmSkVkc2IwU29qelNhRWkvQUwyQUNmWmN0TjYyM1lzT0MxR2ttZVNncXlw?=
 =?utf-8?B?RUFoWFlhZ1liODNHU3VqNlB4TWwwTlhBN0tmRVhzNzk3b3QrWmZyazE4UDJE?=
 =?utf-8?B?ZTBqdnM2T0NiRkpEUFVRVHN2cGZBc2ppakt5T2E4UWRQUmVUVjZvaGhVZUw5?=
 =?utf-8?B?cUVSblhHSU52Yzk4R0NUdUlZOEs3YmEvVHAxZE9KWSsvaGRuWjFjNENnRlF0?=
 =?utf-8?B?YVpwcEJPOGxJY1ZNQ2RSNWxnejdsSzNmbDZxY0xuN0JjeGY1d2RncWs1RXJv?=
 =?utf-8?B?NUl3NTJMRTIwTDB6ZzRPYWpFcG9zd0xTUUZ0Vk9zZ1JLN2lTejkvalM0TFhR?=
 =?utf-8?B?M3VlOFJsSzk2a1BwWlg2MlExdFUvU1krQzIxVlJxbWR0am9RTjJSVUFUQVow?=
 =?utf-8?B?elJVOU9mNVVwck5obGo5K0tJZk91dEdGbWlwbWlYN3NPTDNoMndmMTdsbGFV?=
 =?utf-8?B?Zm1vZndDSFcyN1FzeVVYVk1KRlBzRFpNMXJjdCtSZ0RYU3lYeGpZd1ZFekZm?=
 =?utf-8?B?V3NNZ2dqZ1ZxLy95ODJlYlMwVDhVdUMyb1BFZHlZdSt2MlNLVXRjbEh1cEF6?=
 =?utf-8?B?N1p3UFd6ZkVPeUFEVkxnZ1FpUmlqeGo3RVBUN2R6bDYyRncxVmRFZHlDMGdG?=
 =?utf-8?B?RThmVFFNdVd4eTdyTkVlS3kyRWUwUHNXbzhuRVN1NUFJMkd5YjBFckNCdGMv?=
 =?utf-8?B?d2tHTXcvRHEveXRsQVRMV1JjM1d1SGhpK3FDalZZYVZQWHd6M0llU3JLd3Rv?=
 =?utf-8?B?ejYxcGNYdHFraGpZa0MyTUNnZ1dCWkVEbnpVODd6U01kNGZYcEpDYTE0WHFy?=
 =?utf-8?B?VStjZGhNWFlwUG4rWjVqdHBEOTlOMmlLNkZpVWhIa0tCYytaRUhyYjFBeG5l?=
 =?utf-8?Q?pgZQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:26:52.9152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c59efe-3716-4a1d-4ca7-08de4dcee4c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9663



On 30/12/2025 14:50, Andrew Cooper wrote:
> ... in preparation for a logical change.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


