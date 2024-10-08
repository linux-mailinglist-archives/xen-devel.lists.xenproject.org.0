Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BC995817
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813491.1226452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGSq-0002e4-JO; Tue, 08 Oct 2024 20:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813491.1226452; Tue, 08 Oct 2024 20:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGSq-0002c8-GG; Tue, 08 Oct 2024 20:05:48 +0000
Received: by outflank-mailman (input) for mailman id 813491;
 Tue, 08 Oct 2024 20:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGSp-0002Zo-6P
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:05:47 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:2408::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b39f5750-85b0-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 22:05:45 +0200 (CEST)
Received: from BN9P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::15)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 20:05:41 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::3a) by BN9P221CA0021.outlook.office365.com
 (2603:10b6:408:10a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 20:05:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:05:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:05:40 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:05:39 -0500
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
X-Inumbo-ID: b39f5750-85b0-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj4z4XRGeUyrOguRsuPyhvZBb20JKmoTlkaBOSzCgX4VjpQSZdy/s31mQFgo1eVHSRioljbej1K/JEB8cW6fm0cSu3aJiB/n5E6p3P+4e4wF6MUN5e9WBDQSS+4XcN1a2pdrupFXQKcqQqwVrijaKku9Mo32UBTgi47d4d+Zr4t7zYt3thuAUSJwvnZa2KSimZnrN3nQ0vuMCKnUZmOyq8JD7uEAHFMcOuCHBb3mb2DpyLOrlNf0QBxOi0zgwUyqiNhLyNlGsaPcvjdFcTEwPe/FDZKreVmyA8wai1q3Ps+a0VzYNMQ1C9EH2raPWTYJgwRuhF5N0/XWWsA0csawXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZGSngcZj7YkOh31YCAVgJ7/N0RwzkpVnGxdHwU4jSQ=;
 b=Cd0Q/omx0Piz5v4LMRNz/BZBNX/t4Ov5o/lL4sSRA303U0Gapb19G5ilGBgJXzG4R8oj7X+2E39rOQPWGsdaZsNMVZOUljwfR+MfCvOkzpmT5RTD3dXxZnvcsxJ4FjluxbQxaahg7k8pNSXHdY76fRAx2kbiQvZhNLlDoZ7cVVDlSUnOe4fK55WPsdI+XvOXohA3Rucb4p28YWSZRmNdD/t6b9mSn3fbDwgwwBOmIjoY6e+HLMNu9ug2uj9AWLPIoks0WHwxX8epppJPRGO8LxAmjtYzv9YWxR/qR185hF5CF6q8hzvyaXgNXowskCxFGu1RzZHFD66o6HtaVKcHJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZGSngcZj7YkOh31YCAVgJ7/N0RwzkpVnGxdHwU4jSQ=;
 b=MH6uVf9IFDX/DQF2EkyyBx7HzUbgD7dKAM/a7pkXhqKzq+CIlF1NFWBc0LC3Wa3jrgXMGxb57JuCP9HAtWwskoRnHVoyUrxNVrb3YM/56KMz54pZrPGCaZZkS/inx/8cnF7XZ0Z9NHj0FGoFwa+Fo2KwelLzhGRY/ZYomJUbvJQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d7a9bab6-69ba-43df-8b30-5e10372dfb42@amd.com>
Date: Tue, 8 Oct 2024 15:05:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 35/44] x86/boot: remove usage of mod_end by
 discard_initial_images
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-36-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-36-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ad7724-4d9b-47ec-0732-08dce7d49603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2NJdkFHYldkR3JlNTZLazFBaUhKejlVS3U3czE3ZWQvRTdXMC8ydDBBdy9p?=
 =?utf-8?B?M0V4RkV0SjZkdlpPNnNnOGRKVldYMzJMdTQ0YUNyeGM3VWNRUnlHblVCb0s1?=
 =?utf-8?B?cmYrUDlOL2FpbkxBb1krYmlYUENFZVEraDhQNHlkWW8xeWNFekk1akdsVk9B?=
 =?utf-8?B?dDkxU0plRUwzZ2pRdy9BMEUyd3hBTGIwaVN2ZVhyN0cwT2MwbEVFUjZjQWNx?=
 =?utf-8?B?TXdkekZQdENCeTZRK3I0LytjazFncmxGQUMrWVdRNnQvZUswWExDSTdsbmxJ?=
 =?utf-8?B?WHMxWEIwU2NHc2NadE5DUlZLVXRwVkxXanlab3Jxa1Y0M0VSb2FjMWJkSUoy?=
 =?utf-8?B?WGsvWkROYWkxdjRzL0J1VjZDb1MzRzlMRGdKQ1BJK2xPOXFsbXVGSXMvKzc5?=
 =?utf-8?B?YW5yTmwzaFF0enpZMHdkUU5YMGF6MGFDNm5jaFFWNjh6TTdJaVd0Y0pHS0d5?=
 =?utf-8?B?dkQzenJHZE90RFdGanYwc2V1WWZ1MjlXS3kyZTk3QnVRdTA3K2VROS8weFFJ?=
 =?utf-8?B?T3hrYTlvVStySHM3S1ppOURHbDRCT21tSmo0WWpYTk9uZnMzaEZzRTVPb1Bt?=
 =?utf-8?B?OUwzdUs2ZjRKM1RGTmFZcTBTUlpIN25sQnAxWWp0dTc5NHppQ0pURjVTKzFJ?=
 =?utf-8?B?Yk9qZEFiZXBCaW0weG1ZYUNXN1Y3V0ZtQ1hYZC81OERlb2pqdFdMSDlFRVdO?=
 =?utf-8?B?ZmZ6SnVsaFpNMmg5MEZmSnpwcldCWFJTb2R3MFNVbW1XYyt6NHFlck4rbVpZ?=
 =?utf-8?B?d1oxZERsZlRIY1RpMHFDYjlWV2s5UHBTNlBvb0JTN1pQWGt3a1A3MURJK0My?=
 =?utf-8?B?dDMvVmsvdWQyK3hNbElEYmFQazhZdUxMeFpDN0g4eUY0YWNyYTVrYXdtdVhw?=
 =?utf-8?B?allvbW9yVXZXTnJYaFdNODVpRUgxR25WK3ZPczZ5M3ZoQTN6WHJYdnZiQ3M4?=
 =?utf-8?B?NDhHYURTc2lPbjc1N3ZZVDlPakVWeCtiL3Fic3JLeElEc3FNREd6QWhJYTA2?=
 =?utf-8?B?c25WL2NnOE0zZUJoMkJ4MDVHUE5iSnJzSE5vZktKV245cGlvOUl2YUVMV2dG?=
 =?utf-8?B?bDFEWUFLQmFONk9Gc3FXeDlEQnl4MXF6aS9BYjNGRTUyZWFyYUpuL3ZKa1li?=
 =?utf-8?B?cnpBM2lESTNjQ2lkSkRsNmM0aEZlbDNrODZMMGRrTVV1Rm1zY3YvcmdET3JO?=
 =?utf-8?B?TnB0TjRHdzBNWGV5Q0RUR0xJQ3ZQeUg1TEgydGNuNDlPWWVMY09FTy9aTHdw?=
 =?utf-8?B?NEFlUUl4NUtTNDRGNEllV3Z3SDVZZTJUd0pHREM5enFBakIyZHFpUFRDcFZY?=
 =?utf-8?B?MXpWZXE2bk5jRlJsUUlxT1ZzZHZJVUtwa2ZaK2E1KzBzbkcrWjhZY3hEdlUx?=
 =?utf-8?B?c2dOemNZNUdZNm1RWXFncUU5WjAzKzArR1RlcDVvWXYwTGFYYnZYQUVFL3Ju?=
 =?utf-8?B?dXVLdE9VQ1BUbGQxWTgzVFVzbUtlYXdSK2dhUmI3ZFF4RXM4LzZCcktwMXkv?=
 =?utf-8?B?WEg2L2g3bnYxT01nN3BWSHcxUXdwYWRtSFRpeXhtU1RHR2k4Mnk2SE5SNitW?=
 =?utf-8?B?cU5IemJSVzFNTTRzRUJ5bXdSMU5RK1hUcTM1SWxyT29oWllvWno4M2xSNzhG?=
 =?utf-8?B?ZkQwSEJwODVxMzljWGpuS2lsVmlNTmYrZTdBTDNQRjZvTkpWMlViZWUrekxI?=
 =?utf-8?B?YVJXQWNURTA0amdwUTBRQm04OTkwRWdjS0ZrbzRPM0FiZmVDY1B4RFdFN1N0?=
 =?utf-8?B?Z0lLL0IyeGZ3VGRWbnZZaHlJVWZiVDNMS1plZnFxNjd6eFpVMDNlcklJTkYr?=
 =?utf-8?Q?X6apUXSp4/t626h9wyANaURzM66yYuLsvcoKo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:05:41.4850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ad7724-4d9b-47ec-0732-08dce7d49603
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This eliminates usage of early_mod by discard_initial_images
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


