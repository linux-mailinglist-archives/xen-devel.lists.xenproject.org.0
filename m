Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBiKG57pkmlSzwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:55:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6A142240
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233859.1537214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvJQ-00089l-LI; Mon, 16 Feb 2026 09:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233859.1537214; Mon, 16 Feb 2026 09:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvJQ-00087d-I9; Mon, 16 Feb 2026 09:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1233859;
 Mon, 16 Feb 2026 09:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRIP=AU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vrvJO-00087X-Vv
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 09:54:38 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc1373b-0b1d-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 10:54:36 +0100 (CET)
Received: from BN9PR03CA0341.namprd03.prod.outlook.com (2603:10b6:408:f6::16)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:54:31 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::3a) by BN9PR03CA0341.outlook.office365.com
 (2603:10b6:408:f6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 09:54:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 09:54:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 03:54:30 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Feb 2026 03:54:29 -0600
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
X-Inumbo-ID: 7fc1373b-0b1d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhrVsrbzPN6VzzY00gbKSM51GzSxy7JTHm3fxbCN4SxsVUmCGRg64dLsmel0UWU4dEKreNQWz0Fe6g0LuCYmDpz8M1y/GXrEK92/NnKjuknUYHkb3VXBl4vXH6/Si/CSCWp7Bk5U0+lNYouT7B2Lk/e6uFUwSt7ETpNi7PfMKlTig9HXdTYRe3tqFbyOO+g3pg1TFZznQtb+P1umUn3o8f3tUj1dIoaa6S7NXS5k5gsLnSvD8gzItvO8sFREfmWq/YovnbH0KsqjjdlvsPpPOgMEFe2MKGN/AGibNnZA0KZKrqdbr1KMJOQqDUqxq4UZRfQzAlbF87JLPyvXPDxPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOEkKY7O4kDty90WtlMhZOeCTuXBczRlaaEvEXF0fcs=;
 b=keWrcTBqXRu4nMORemDAXaIBJMoOiiVjRNkAPEywCZxufwg2iX/8b9vMu5H6vBwtZkAup62MXKTRoP/QTVNIeiMPTvIuIrVc39W65GNtnhBDh/dKRjkjA6Rfka+1sNVX7N5gy4aiID/UAFlUp3rKaApoSi+C0ufmgKs787fZlGsp220BxDQAA1t+dvTrwOiAmRIpP2tYIkQEZwAFLE9wkvo8OFiJbCpklLA3BTyHJL2coTlePKIgXJirJRY7RB9gsyWCC4IMCUyf+6Up8B5h1QfG6zCuA3tnR346fMQzjMP09nW3TVCsa8Ll11wgOVrp5lken5TqJrT4Q8xH24QgBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOEkKY7O4kDty90WtlMhZOeCTuXBczRlaaEvEXF0fcs=;
 b=RAOYxX7KeBNPvghe2EaJCSC2WhBN+ol0QuKxQpHcdjEdbWNQgSSyXNIoVA+BKxMD8ij3PFFO81sQPVwHbsfvVvwSFHByn1V7xBzl7GyznQxJVH349MlrSwUttgee1FefRMozURcWcrxdwBjz7sL/QuI5VPxltyYtihPvsbpjet8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <25d4cf76-a71a-481c-8278-db400e4ae5d0@amd.com>
Date: Mon, 16 Feb 2026 10:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm/mpu: Implement p2m tables
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-4-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260206090155.68466-4-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|SA3PR12MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 8349255f-e68c-4ffb-6a65-08de6d4161bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGluWUtTZk0vWDVscWdKSFVLYm92ampQcnYwU2ZVVm8xTGlpWkh6K1VkdWtm?=
 =?utf-8?B?WVlwNU9SL2hXWjVMSHpIOUJIQzZuT3ROazRGRWxwQ3lYQjFRM2JZY3grVnZy?=
 =?utf-8?B?cEhDd1ZQekFUb1lsVDNIWUpORWptaTF2NXB1d3lQSjJ5SWw5V3Jlc3ovMUFZ?=
 =?utf-8?B?Wk9QMFlFbzFZb1dYRjRjZXZ4TUYyU1pOblVLMFM4eWZGYy9qeDJtcWtvWCtW?=
 =?utf-8?B?R0h6L0V1QkVjVnl6bEFMWVdvckN4cmNCTUNyMk9lU0xsalhNWThEeEl1cHZ3?=
 =?utf-8?B?TW5SaE40SFlDMmJHVUJzWHowOVZOQ3h3MlJ6cTQvODUzREFTSWJ1QnRFbjJj?=
 =?utf-8?B?WFRBT3R3bjh6STI0c0lWOWNKZGQ3NnJuTXlaWjVFdU5HZFh1YVlPMVNTcmVj?=
 =?utf-8?B?cVdYdkg3a3FteEJKb2RSSHh2d2xvOWI5ZGZxak1aU2tFajJWcXc1OXBJenVx?=
 =?utf-8?B?VnBUTEZGdzR1dUIvTjM5eUNCS1F5dlpWZGdmTEJ4TmVSSkErWStJNnV4ME5B?=
 =?utf-8?B?V3NUcjJla1ZmUnhRK0Vtblhhc1JwRjNmVWo5a0dJYmx2RURLem15dmtid05j?=
 =?utf-8?B?MGk4b3NFUENlcTZyMDZwN2x3KytBUXJ3WGJEN0dvRldNMUtNSG1UdTEraXdP?=
 =?utf-8?B?NlZQTTk0NmxtNGR0eGtiYjZpNENJUWhHZ2l1VTQyb2k2Ykhmc0c0WGQrRFpv?=
 =?utf-8?B?UDNoT1BWRnp1NWxhZzZjMFprRkpPTmM4RnBIVjViQm5vODFacFlmVTc5YkdQ?=
 =?utf-8?B?Y0pGRTVoNG5oMWlCZC9XYlhRTlNkV3RFUndzSGJnZHBaY1JKa3ZrSkhpem9T?=
 =?utf-8?B?ZDlGUHJNRDcwZEZxK1g5UDhBekcxQ3dPc2lQcHVwN2hSZTA1d0Y3dDlQV2xK?=
 =?utf-8?B?aEZoV0RGN1hIN2hmSGhOZ3JKc1FyK29mTWtsdCszMm0wZUF1bjY0MnZwSFp6?=
 =?utf-8?B?TTB0M2VFSHNJdE81Y3NUajM4dEhnaDFkVnRCV0VISm51Z25Wc0pWNkNPd3oz?=
 =?utf-8?B?MjVERU5DRWRXZUZqQ2Q2c3ViOEFIOTFWMVczQmNtSW5SdEdGbWFHSDZOTExz?=
 =?utf-8?B?UkJpZ2srK3c5TXI5S2wzQVRXN2NnSEtoWHRhV3VNSVFIaVBMdGJaRGJUNjlJ?=
 =?utf-8?B?dFlmaE9xMlFPUXVDQUZxWUZYMVluV0ZiRDJWRUNWR0hScEhEUDZyZHJDWEt6?=
 =?utf-8?B?WXdoWWE3bVVKanpZTE05U09qSjg0M2FSczRwR0ZWYkdoL0FtRnFhbDVQMDNu?=
 =?utf-8?B?d1V4dlN3VHBxUWtEaHIzZ1ZpUlZGSStPWGRkUStkNXErc05NR0VOcHdGa25Z?=
 =?utf-8?B?U1h5VHZaOWRrQ3pjWUVTZUdIL0JqbHRUdzJPVWxKc211UTBUSHMrbmVXa1RX?=
 =?utf-8?B?NVRBN3lwSkhxb0VTTDB2L2RZTmJDWXJKN3VaZ1E0M2FES2VFU0hpekxqcXZj?=
 =?utf-8?B?eTcwbmRhMUtuK0NoMkVBK2F3NHE5WENENW9jbHF6VjM5MmptQnlRM1NmK0Y5?=
 =?utf-8?B?T2cvczF3S1FwdFlSNm9sVXVMc3VsQ0FzVTY4WUpNMkxQSjMwUFU4d0c2elFL?=
 =?utf-8?B?WjNFUkg3NHNSNkpPQ21vTWlsUzNUb1ZqVVUwditNbmVwQkVoeDFDVFJ5K2k4?=
 =?utf-8?B?U014YnVaR1U1czl6TkRhTEcrNXdyVElrMWErSUFta2pCM2VkOU0yYmhjUFNP?=
 =?utf-8?B?eWR4dHdsYnp1dUdPekpVUW1idi8wblBmWkRDK1ZJNFNQcWhMQmNUVUh3YXZD?=
 =?utf-8?B?R1M2NnhodlpMK1FmbTFESEVsS2NoZS8yeXBrSnYxSzZ1NTdWc1pSVkUvTmV3?=
 =?utf-8?B?cythQ2N1R1NiSzE1c2dNakRoSGtiblhwSWRJNm5zQmU1STFqRnBaanVXSFNW?=
 =?utf-8?B?NmJtOEFwRzA1Wk9vd0h0RVJ2RVJwRXFzRGZGMkVKbElsdm9jT1hxUjlrVXBN?=
 =?utf-8?B?ek50dzhOQjJzNXN6aFlvaE5FQWlMSmdwTy94K3RyTHIxeU5LMWdDWWJZNGdK?=
 =?utf-8?B?ckVsTS8vOFNxRkZsOWNISjE5YzE0eFRFbjFKUXBOdFBUK2dVMVRLSVR1M0VO?=
 =?utf-8?B?UTk3bW5aYzcycnFJVHRBYXRmbVRPb2xmckVoSTYyNElCOWlZT0thR2FXcW5B?=
 =?utf-8?B?SzJZL01qbms0Y1Btd0FscFJGTnBRc0srRlhEYmNVSFBoMjhJYlEvRHQ3Qm9j?=
 =?utf-8?B?ZmNaaHRZTHBLc2ZselpIUnlRa1kyMUpodnVUYk1RMXNiejlwbDVsN3pJWWtU?=
 =?utf-8?B?elozNFR3TnRQcldkd1ZoRmd0VHlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vFJfX9kkr2vmHgYuNjrqY9avieSjuWzLZEsXXm3FNd9KuUsSCu5axOzCKmK8jG+FonxGArtAcDa0tZ8YoAJWLiD0/zfcDtQElFoq9v97Trve2m857sW7ZpcAL5meaF06EFoHSAlZEwhGfRLTYOV4I1iTzuQLOq0uKLLHDLScBVhpJT6cfBlvy8nk7hrJiCL4oONRvJZpOjem+WXta6eMC7aK54Jg36r0vJlG730o6wkDy9K/v3SMmNfXTgZgHw9oHaAdng0VbKg6J7Lza76SXVyE7cX9FA/2ebvmvzWafxEeD8I4cYdV9DJsVuVsM2VGMRZwOdxB1QrWQ132Z6PHv9eDAC0EJN3nnpl+cADSwPlWSEmBib8gOUlcasTPldNA4j1Pp9RUG/rLgeCjys9JX7ugF+ZkknU9FDThI6JJUKfEOKnn6vpw9PelxOS9dEo9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:54:31.2740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8349255f-e68c-4ffb-6a65-08de6d4161bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:mid,amd.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:harry.ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C5F6A142240
X-Rspamd-Action: no action



On 06/02/2026 10:01, Harry Ramsey wrote:
> Implement `p2m_alloc_table`, `p2m_init` and `p2m_final_teardown` for MPU
> systems. Additionally implement a helper function `generate_vsctlr` for
> p2m initalization.
This means you know you will call it more than once in the future?

> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/include/asm/arm32/mpu.h |  2 +
>  xen/arch/arm/include/asm/arm64/mpu.h |  2 +
>  xen/arch/arm/include/asm/mpu.h       |  5 ++
>  xen/arch/arm/mpu/p2m.c               | 71 ++++++++++++++++++++++++++--
>  4 files changed, 77 insertions(+), 3 deletions(-)
> 
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
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 72fa5b00b8..4ae583a7e9 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -87,6 +87,11 @@ static inline bool region_is_valid(const pr_t *pr)
>      return pr->prlar.reg.en;
>  }
>  
> +static inline register_t generate_vsctlr(uint16_t vmid)
> +{
> +    return ((register_t)vmid << VSCTLR_VMID_SHIFT);
> +}
> +
>  #endif /* __ASSEMBLER__ */
>  
>  #endif /* __ARM_MPU_H__ */
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index f7fb58ab6a..1598f9ab64 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -28,10 +28,62 @@ void p2m_dump_info(struct domain *d)
>      BUG_ON("unimplemented");
>  }
>  
> +static int __init p2m_alloc_table(struct domain *d)
Why __init?

> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    pr_t* p2m_map;
> +
> +    p2m_map = alloc_xenheap_pages(P2M_ROOT_ORDER, 0);
Why not assigning to p2m->root right away?

> +    if ( !p2m_map )
> +    {
> +        printk(XENLOG_G_ERR "DOM%pd: p2m: unable to allocate P2M MPU mapping table\n", d);
No need for DOM. %pd already gives d prefix like d0

> +        return -ENOMEM;
> +    }
> +    clear_page(p2m_map);
P2M_ROOT_ORDER can be 1, meaning 2 pages. Here you only clear one.

> +
> +    p2m->root = virt_to_page((const void *)p2m_map);
> +
> +    return 0;
> +}
> +
>  int p2m_init(struct domain *d)
>  {
> -    BUG_ON("unimplemented");
> -    return -EINVAL;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    int rc = 0;
> +    unsigned int cpu;
> +
> +    rwlock_init(&p2m->lock);
> +
> +    p2m->vmid = INVALID_VMID;
> +    p2m->max_mapped_gfn = _gfn(0);
> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
> +
> +    p2m->default_access = p2m_access_rwx;
> +    /* mem_access is NOT supported in MPU system. */
> +    p2m->mem_access_enabled = false;
> +
> +    /* Ensure that the type chosen is large enough for MAX_VIRT_CPUS. */
> +    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < MAX_VIRT_CPUS);
Why there is no check for INVALID_VCPU_ID?

> +
> +    for_each_possible_cpu(cpu)
> +       p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
Fix indentation - 4 spaces, not 3

> +
> +    /*
> +     * "Trivial" initialization is now complete. Set the backpointer so that
> +     * p2m_teardown() and related functions know to do something.
> +     */
> +    p2m->domain = d;
> +
> +    rc = p2m_alloc_vmid(d);
> +    if ( rc )
> +        return rc;
Please add empty line here

> +    p2m->vsctlr = generate_vsctlr(p2m->vmid);
> +
> +    rc = p2m_alloc_table(d);
> +    if ( rc )
> +        return rc;
> +
> +    return rc;
Please, simplify return:
return p2m_alloc_table(d);

>  }
>  
>  void p2m_save_state(struct vcpu *p)
> @@ -46,7 +98,20 @@ void p2m_restore_state(struct vcpu *n)
>  
>  void p2m_final_teardown(struct domain *d)
>  {
> -    BUG_ON("unimplemented");
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    /* p2m not actually initialized */
> +    if ( !p2m->domain )
> +        return;
> +
> +    if ( p2m->root )
> +        free_xenheap_pages(p2m->root, P2M_ROOT_ORDER);
free_xenheap_pages as oppose to free_domheap_pages expects vaddr, not page pointer.

> +
> +    p2m->root = NULL;
> +
> +    p2m_free_vmid(d);
> +
> +    p2m->domain = NULL;
>  }
>  
>  bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)

~Michal


