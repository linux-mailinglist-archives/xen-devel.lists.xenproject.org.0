Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOz/El2QeGmarAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:15:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF192986
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:15:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214156.1524531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkg66-0003TQ-HI; Tue, 27 Jan 2026 10:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214156.1524531; Tue, 27 Jan 2026 10:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkg66-0003Qx-EI; Tue, 27 Jan 2026 10:14:58 +0000
Received: by outflank-mailman (input) for mailman id 1214156;
 Tue, 27 Jan 2026 10:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2xL=AA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vkg65-0003Qn-GN
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 10:14:57 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06373b51-fb69-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 11:14:54 +0100 (CET)
Received: from BN0PR04CA0197.namprd04.prod.outlook.com (2603:10b6:408:e9::22)
 by MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 10:14:48 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::19) by BN0PR04CA0197.outlook.office365.com
 (2603:10b6:408:e9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 27 Jan 2026 10:14:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 27 Jan 2026 10:14:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 04:14:47 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 02:14:47 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 27 Jan 2026 02:14:45 -0800
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
X-Inumbo-ID: 06373b51-fb69-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4oLx+KqwiW5o186j+fhOAOfIdKq/CgCR6v1oDdyqLvmgkKrfqvQhcFV4YRTc8Qp9tt3mwnW0SXhZeVxlZ3bcpjONFCvgp+BkfHI+vyHJc+i9VBJeLKUQGpWzUJ86vSfRPRkgrRrTyla0BbycdJCeDqVbWEV00HKNHZmSV59mz29mFYdWz25+mAAcclPzHc4c3GZcrzaxI5JJ1i1gYrVrLqt38wyL5BfCwY5GgwWpUVz3BT/jKu3zx/xYu/0oH9TWhLLQEmdobFTLkknyPtQ38Aw12b45rctQewSMtxin1ZMdo95j1aA6aB5ZQ5GkndBYNNnltiSZx6qpalpxmOn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6G/ev7DfkxLhti4nY1GLMsJL47FkmJv6/RKrOUycog=;
 b=A0Un7WMbWawPEYx6YahUuDyJl44A6A0xHyG8f4XLR2hJPjJG/Zf1J9gjlVJVB06K3+t0ZaQlxsXxzuuLLq56Typ0W2cZGbmBhEFL2C2K50cd0aifrj4DNCLq3Alx2kzU9F/23Zpb8UVWMjEmoxIFQQ6CQEkmATPEOgEDQnlpn0ixAQ5bf2Ntzf+vhgpIBY2Yv8pLAA9TQ5hR+V3DVxyLsVTHjyaqNK2Wx6BHK96+iVxmC9dLd8OkZ9Jt4s1ko+SNK8Z1G7s8BnhKSXpwvVlzr/EyXjWryT5Y4SxvASYXyrGzPX37Dso9qbD+1b7ld9cIA2RbBnyevmlA6apKCFWolQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6G/ev7DfkxLhti4nY1GLMsJL47FkmJv6/RKrOUycog=;
 b=1tD/se3x/G6IOyEgjn32xMVk8+xsCUMA8BfyiCQIo63YoOKOo8gJ3Rl5wsaVOqHmMaGU7M0Z/32Us18iq5Wbw3I5EhIdUI65FeTNpU6u/owMB0U9PYo0JSDms1O3cHJ186fTTXiKNtPn/Mra4vp72Pc6/6O0mMvNffu4LLNoSx0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <899a572a-1ba6-4bc6-806e-d049b4ac3ce3@amd.com>
Date: Tue, 27 Jan 2026 11:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/mpu: implement setup_virt_paging for MPU system
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20260119105022.3616126-1-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260119105022.3616126-1-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|MW6PR12MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f64e59-26e8-4ffc-ee1c-08de5d8ce666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzBhRVFJS1A0MmRsVTRQZlBsVjFOZitza2U3dDBxSGhzdk1lZk1zZ1g4YzAr?=
 =?utf-8?B?SjJMeVEyMnMvdHVDWWpsQ0ppZHF2YU5jRENGa1pVcGptVmVQOUVRZzZLemhp?=
 =?utf-8?B?KzBHbzFPTXRqaHJqdjA1Z2RQWERvb3JQQ1VnTS9MZ21reGMvcEFOajdBUEI2?=
 =?utf-8?B?TmtBTGMrT1JDU1RrMmcvN2lpaXNRZURnbWlDRTRidjVFOWlzTzhheXFndVJJ?=
 =?utf-8?B?VzV4QUJnZ2lTMnZNTVJGUFFvOXJMV1BQSFovYUV6OUlwOWlwOERzOTM0QzE3?=
 =?utf-8?B?QVlwbHVyRFBQTW9CcVU4S094RklOUTBVU0VPVkdJYnlvSjRkRGFkMTQvMkIv?=
 =?utf-8?B?cHZMRWtqL0MwVG9zN0JKSW1GSk14UEw2SDdadzNMMkZDeVd5eWZKS1ZDU0pn?=
 =?utf-8?B?YytYZWtDYVdxU3RacHV2TEMwdEZzc0ljS3huYzN3YmJiUGdXN0ZSZGFjV0Jn?=
 =?utf-8?B?Y29jOFdEMWk3dElpcXBrNjFRcjY2bC9ad1VxOERyZUVFWXl3SE5BMFIrYmQ5?=
 =?utf-8?B?OWNpS1Bka2JOSFhpY3RHSVdrYUhYR1k0c1Q2Q3Fmb1VFQzZ6bG9pTVFYNXJC?=
 =?utf-8?B?dko3RklsZ3hwNXg2bzFoajdRWGxMaFVaUkQzamNKR0t3NXd0aVhmQk5FbFAx?=
 =?utf-8?B?bWk0c3JTVnlPQXE3alNWbjVjNis2SEZ3ZUJsM25CMG1ySW1xY1FQOXRkdlA5?=
 =?utf-8?B?VHJxWnl0d3QwQ0NPcWNvb2xqdklXdytNWE8xRUNYUlZPTnJHUUdVeDc1SXd5?=
 =?utf-8?B?bXYrSnAxSXd0QU9EdFJIcUxOeWhXNEJLNXVZZERydkphVGdwaWRqeGh1NE9r?=
 =?utf-8?B?Y0YwYnVYTkdpaWdDcjJYcXZ5RWJZYVJMVzRmUTJCemRiMFR6SHZTcGh1dW4w?=
 =?utf-8?B?OUhJbkQzRXJsVkRIeWFoOVFyRjl3aWZMeXJoU29MVDRnM2gyQm1DdWYvcmY4?=
 =?utf-8?B?WlJ2U3J0K21Nc2lib0ZNcU9WY2xLNGd3N3dvdzZnQlhEWEdQUGZ5enZLU0hP?=
 =?utf-8?B?bHp3UzlLNFY3N0xUTmhVYkFGWmxzWUI1YlJEQmpEVTJhZkMyL3A0Sm9ZQlhI?=
 =?utf-8?B?bk9RTkhNMTRnNGFCd2hSUi9vd3BTb1dRL3VIQmtRZ245aWdvTnNqVWZKVjVF?=
 =?utf-8?B?WG5nTVdsWTdzVHZWQmtsQ25xRWRrazNSd3NGcHhlZUtCbEJWaitZdjU5ZE1T?=
 =?utf-8?B?eHo3TTI5TzR2dVRxcEE1TThrU05ZbDNLaFpJQm9BbzJ3TXJMdVZYb1h1eWVP?=
 =?utf-8?B?N01yTmZncUF0c3VPc3c3RWl0U2I2VXhMcXV3d0NVNmk3VDNOQVJ2Wkk0cnht?=
 =?utf-8?B?TFpteUI1ZXpNMTRReFVCMFRURHhBQzFnLzV1blRLK3Zla01QUHRpMFlIWG1X?=
 =?utf-8?B?RjlLTFJzVnB6N2VSNTZWMUFibmRlWjQva3RIWDE1b0MyWU1ad3hYZFp0Y2lh?=
 =?utf-8?B?blIwZ2JXV2c0TUwydTdmcUhXbmxzZUJRQllXZ1kvd3lDZHBTTC9QUnRXR25s?=
 =?utf-8?B?WCtrd1h2VU53Tm5uYmVFVEhLSWM3NEtZNWtCWXREejY2Mk9MV0dWaHlQakM5?=
 =?utf-8?B?NDNHcFZkQURZM28wZlRiWGFraWVxSlpRZDh6NTRJWjdROU9XRDJ1cGJiWktj?=
 =?utf-8?B?UksyYXhtdUVXTmxUdXJGT0Q0dGJUMjRUK3J1S0tQdUo3RWpoR3VsSzZKUTls?=
 =?utf-8?B?VUxpTnpQQ3I4dWFENitETW96YXFRSnhyRDRHTkxPall6bXcraXRBTXpIT3Ns?=
 =?utf-8?B?L0RLZXJ6ckljMzVWQVZiVWF3REJRTmVqVWViaWtkRGgrdGlwSm9DMDlBSFhK?=
 =?utf-8?B?MEVKb1lmM0VkQ2txVTg5UjJIdjJxUmdSNTZwZ2JEaVFZUk8zRmlFcUJsUnNY?=
 =?utf-8?B?TTMvKzRBazdWY3Z2NWdiR2RuVzRoY2ZyUXhyZG5NVWRXY0pTR3AxYXVINlpp?=
 =?utf-8?B?R1NKN0NIbWJGU1FhalREaFp3UlhLQWxwcDY2M3ZYelc1aXhXVytTakhzczdR?=
 =?utf-8?B?SDd4bWJ6enU0bGd6ZTBmY3BHcndKMndUOWxYaW5TRHZxZDNnczB1dVV6YXV0?=
 =?utf-8?B?K3p4SjFFaVRWRFJiczlCcDMvYk5nTDRGT0U1ajdPTWxYR1NtL0ZRR1VVZ2Zv?=
 =?utf-8?B?VG1yd1BJYzdJVnpLYm4wVWtHZkpqT3NXK1M0RkJqbHN6MFJmdk9kOXVDai9V?=
 =?utf-8?B?TUp3b0kycjVJY0xCQ0pBQmdIS2FEYWVBNzBMaTNMTjJ2YWhMbGlXanE0L2d4?=
 =?utf-8?B?WmJJNkZhK0F1TG0rMXdKQzU0VVl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:14:47.5067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f64e59-26e8-4ffc-ee1c-08de5d8ce666
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8705
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harry.ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,arm.com:email]
X-Rspamd-Queue-Id: 7FEF192986
X-Rspamd-Action: no action



On 19/01/2026 11:50, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> For MMU system, setup_virt_paging is used to configure stage 2 address
> translation regime, like IPA bits, VMID allocator set up, etc.
> Some could be inherited in MPU system, like VMID allocator set up, etc.
The commit msg only mentions setup_virt_paging, so why do you implement other
p2m functions in the same commit? I would split the patch in two for clarity and
ease of review. I will focus on setup_virt_paging.

> 
> For MPU system, we could have the following memory translation regime:
> - PMSAv8-64 at both EL1/EL0 and EL2
> - VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2
> The default option will be the second, unless the platform could not support,
> which could be checked against MSA_frac bit in Memory Model Feature Register 0(
> ID_AA64MMFR0_EL1).
What's the reasoning behind it? Why do we prefer VMSA at EL1 rather than PMSA?
AFAICT PMSA is a default and VMSA is optional, so logically PMSA should be
preffered. We should also make it configurable I think, so that a user has a choice.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/arm64/mpu/p2m.c             | 90 +++++++++++++++++++++++-
>  xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
>  xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>  xen/arch/arm/include/asm/arm64/sysregs.h |  5 ++
>  xen/arch/arm/include/asm/cpufeature.h    |  7 ++
>  xen/arch/arm/include/asm/mpu.h           |  7 +-
>  xen/arch/arm/include/asm/mpu/p2m.h       | 12 ++++
>  xen/arch/arm/include/asm/p2m.h           |  5 ++
>  xen/arch/arm/include/asm/processor.h     | 13 ++++
>  xen/arch/arm/mpu/p2m.c                   | 71 ++++++++++++++++++-
>  10 files changed, 209 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index b6d8b2777b..13b633d9fe 100644
> --- a/xen/arch/arm/arm64/mpu/p2m.c
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -2,11 +2,99 @@
>  
>  #include <xen/bug.h>
>  #include <xen/init.h>
> +#include <xen/warning.h>
>  #include <asm/p2m.h>
>  
>  void __init setup_virt_paging(void)
>  {
> -    BUG_ON("unimplemented");
> +    uint64_t vtcr_el2 = 0, vstcr_el2 = 0;
> +    bool p2m_vmsa = true;
> +
> +    /* PA size */
> +    const unsigned int pa_range_info[] = { 32, 36, 40, 42, 44, 48, 52, 0, /* Invalid */ };
80 chars exceeded.
Do we still need 0 here to denote invalid value?

> +
> +    /*
> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
> +     * with IPA bits == PA bits, compare against "pabits".
> +     */
> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
> +
> +    /*
> +     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
> +     * address space to access the Secure PA space.
> +     */
> +    vtcr_el2 &= NSA_SEL2;
This has no effect.

> +
> +    /*
> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
> +     * memory system configurations supported at EL1. In Armv8-R AArch64, the
The spec mentions all translation regimes + specific configuration for EL1, so
it's not EL1 only.

> +     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
> +     */
> +    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
> +        goto fault;
> +
> +    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
> +    if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
> +        goto fault;
> +
> +    /*
> +     * When ID_AA64MMFR0_EL1.MSA_frac is 0b0010 the stage 1 EL1&0 translation
> +     * regime supports both PMSAv8-64 and VMSAv8-64.
> +     */
> +    if ( system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT )
> +    {
> +        p2m_vmsa = false;
> +        warning_add("Be aware of that there is no support for VMSAv8-64 at EL1 on this platform\n");
I think we should make PMSA a default.
If at all, a warning message could be made simpler e.g. "No support for
VMSAv8-64 at EL1". Seeing a warning already means that user should be aware of
sth and it's clear that the message is about this platform.

> +    }
> +
> +    /*
> +     * If PE supports both PMSAv8-64 and VMSAv8-64 at EL1, then VTCR_EL2.MSA
> +     * determines the memory system architecture enabled at stage 1 of the
> +     * Secure EL1&0 translation regime.
> +     *
> +     * Normally, we set the initial VTCR_EL2.MSA value VMSAv8-64 support,
> +     * unless this platform only supports PMSAv8-64.
> +     */
> +    if ( !p2m_vmsa )
> +        vtcr_el2 &= VTCR_MSA_PMSA;
> +    else
> +        vtcr_el2 |= VTCR_MSA_VMSA;
> +
> +    /*
> +     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
> +     * are supporting it.
> +     */
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> +        max_vmid = MAX_VMID_16_BIT;
> +
> +    /* Set the VS bit only if 16 bit VMID is supported. */
> +    if ( MAX_VMID == MAX_VMID_16_BIT )
Instead of a macro, use max_vmid variable here

> +        vtcr_el2 |= VTCR_VS;
> +
> +    p2m_vmid_allocator_init();
> +
> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
Where do we set NSA bit?

> +
> +    /*
> +     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
> +     * To make sure that all stage 2 translations for the Secure PA space access
> +     * the Secure PA space, we keep SA bit as 0.
This says that we want to access secure PA space but not why.

> +     *
> +     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 NS
> +     * configuration is checked against stage 1 NS configuration in EL1&0
> +     * translation regime for the given address, and generates a fault if they
> +     * are different, we set SC bit 1.
> +     */
> +    vstcr_el2 = 1 << VSTCR_EL2_RES1_SHIFT;
Why are we setting the RES1 bit?

> +    vstcr_el2 &= VSTCR_EL2_SA;
This has no effect because you initialized it to 0.

> +    vstcr_el2 |= VSTCR_EL2_SC;
> +    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
> +
> +    return;
> +
> + fault:
> +    panic("Hardware with no PMSAv8-64 support in any translation regime\n");
>  }
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index 2cf0f8cbac..d565230f84 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -11,6 +11,8 @@
>   */
>  #define MPU_REGION_RES0       0x0
>  
> +#define VSCTLR_VMID_SHIFT     16
> +
>  /* Hypervisor Protection Region Base Address Register */
>  typedef union {
>      struct {
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 4f694190a8..8b86a03fee 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -7,6 +7,8 @@
>  
>  #define MPU_REGION_RES0        (0xFFFFULL << 48)
>  
> +#define VSCTLR_VMID_SHIFT      48
> +
>  /* Protection Region Base Address Register */
>  typedef union {
>      struct __packed {
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 19d409d3eb..4ed8ac0440 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,11 @@
>  #define ZCR_ELx_LEN_SIZE             9
>  #define ZCR_ELx_LEN_MASK             0x1ff
>  
> +/* Virtualization Secure Translation Control Register */
> +#define VSTCR_EL2_RES1_SHIFT         31
> +#define VSTCR_EL2_SA                 ~(_AC(0x1,UL)<<30)
> +#define VSTCR_EL2_SC                 (_AC(0x1,UL)<<20)
> +
>  #ifdef CONFIG_MPU
>  /*
>   * The Armv8-R AArch64 architecture always executes code in Secure
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 13353c8e1a..677cb2b96d 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -248,6 +248,12 @@ struct cpuinfo_arm {
>              unsigned long tgranule_16K:4;
>              unsigned long tgranule_64K:4;
>              unsigned long tgranule_4K:4;
> +#if !defined(CONFIG_MMU)
Why not #ifdef CONFIG_MPU here and elsewhere?

> +            unsigned long __res:16;
If there are multiple RES0 fields, we usually start from __res0 and iterate the
number with each occurence of RES0.

~Michal


