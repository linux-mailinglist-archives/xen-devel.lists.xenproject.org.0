Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F76B2F5DB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 13:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088504.1446250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up37F-0007sD-43; Thu, 21 Aug 2025 11:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088504.1446250; Thu, 21 Aug 2025 11:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up37F-0007ps-1A; Thu, 21 Aug 2025 11:05:57 +0000
Received: by outflank-mailman (input) for mailman id 1088504;
 Thu, 21 Aug 2025 11:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9ZH=3B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1up37D-0007oO-Vo
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 11:05:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2415::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce202014-7e7e-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 13:05:54 +0200 (CEST)
Received: from MN0P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::6)
 by SA5PPF6CDAEAF48.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 11:05:49 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::62) by MN0P221CA0003.outlook.office365.com
 (2603:10b6:208:52a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 11:05:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 11:05:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 06:05:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 21 Aug
 2025 04:06:15 -0700
Received: from [10.71.193.195] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 06:05:46 -0500
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
X-Inumbo-ID: ce202014-7e7e-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e//7Y3ATVjBKGTugUFJHlWQtq/s1nQCNEpWaFYZ6Exff9CXhJyUwv5vsy3MbYSScwEjwlLXWFgR0rCAhFl6DIYOJk6S7eaD9nQ4DaYOvXveT8WtQJkwtuYQEdsC+v8iZXIFf8fMSNeSRqRQBw3OAaoUer3nj+KLMpVurzrLGFDuJIeeYl0Uk2gMiw8sjsfw6Se39YsydAJMZvBmUYac7kOGhmq2asZ6GNRECES+oemi/ybK14TSU9CJ1NSW78KPUPc1JbxJ3Wh2cPmzJs74olBnZ5UkOkXxur/nBK+wOQIommWw4PdSeCI/oOSwFddTxSpK++JcmnFz8BLlXNTKrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRFdo1JZXljVnHB3s9XL3rh/UB5b1l9kzjQuaSOQ9So=;
 b=SPGDZXGGjsrvF0xyiWkhVlbDaas73Q9CHyVjOfw/YXIaVLpJd7ilcyOZ9lXkrbGf4NIREeclAueAa/lvuMMsnrpoCdawH2yKUvqnMEILyusbo9oCPBUQ//Wxr9WmkAqzuY9GJ0dE7je//z/Dv3/qBCpoudglLY+tU5k/7NWYsRABdtLNLpfwdu2ASbjlf8WUVBitOHlW8oVHN282OJNTw1lBeVeKreLlb/LogWKp8xkYu1ilhZUAQfsTBmT44OlTgBl3ivwN29ojieA/SmM4NmXmia+y1KSyb7Bts7c5aV96SN4PZ7g9GWu8vaDxXVTxK/k+X8rjqY8VpVaBxvv4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRFdo1JZXljVnHB3s9XL3rh/UB5b1l9kzjQuaSOQ9So=;
 b=ZTwJ2BBdKggS29DHvRk7+VbtOkqKtmRUtsTE3YeM3J61RBY/YYG+ADruRp19+jOQnrn5MOku3QThQ6otrqEgFmEdDfTF32P/SkaLmH++fOvxBQt/VHgH97XtVDQKZoYSXY+1dUmXQXVJmhsOIiC2xbjODA5JqbQVbtBU16xQ/Zg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bb1ed794-e63d-4d9f-94ea-a468f57a6eb2@amd.com>
Date: Thu, 21 Aug 2025 13:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm/mpu: Implement transient mapping
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <d6bd97094991a08fb5ffb48f2642b510b55693e8.1753864612.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d6bd97094991a08fb5ffb48f2642b510b55693e8.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|SA5PPF6CDAEAF48:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be484f1-6b79-485b-9f41-08dde0a2af88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWZjOFV6bSthNEgwb0ZlTFN5VnJXSzFGYkdyWHpscmhXZFlmYUh1TFY0Zis4?=
 =?utf-8?B?RjJ6R0h5cUYwTnlJMVJmdGdKaXhNU1ZQTGZIcmlzcWVDcUsrSnBPdWJpKzBV?=
 =?utf-8?B?eTVxY3pzQkdsdFk2a0cxVzZPSjlHOVk0VUZ0dDRzd2hydkpxYW1pYnlyZFBB?=
 =?utf-8?B?WStub1lSRGRoN1Roc01nbGhTT1l1b2V4a201OUUwelpCL0o2QlRhYXdGZVRE?=
 =?utf-8?B?eDlPY1BGRklDUkt5eEVydHdYZFFUTnU1VGMvY1BraWlhbE5zakxZSnc5Q1h2?=
 =?utf-8?B?RHI4SkxtNGN6N3JHZjFMWk0yc1lINXlnMUk1Y0VaeXRKU09UWHhmT3Fhblpn?=
 =?utf-8?B?UTQrcFNhR1NMNmVJeUpOUEp2QlRCT05Dd2R6cjVRTGh0VFFKYlhXM0RKeDBw?=
 =?utf-8?B?bTRUcW1lZjZnU2R2bm5yKzNtM2VWRDBjSi9jUFZMREZ5am1PeGY3enBQejlC?=
 =?utf-8?B?eTlqQk14R01BWUtuZ1ZSZ2V4bnlHMGwybmpROW5WUUhrWmptNnBBUzNwelBL?=
 =?utf-8?B?QTI4NENWL1hCUVRDZHlNWmxGQkZZNzZQL2ZCYzJSMkkrbnIvOVpncjkzNU9V?=
 =?utf-8?B?aWpPbTEwNWhMMVRVWjJJSUFCVmQzcGUrODUydTFNelpOTXFEUVhFSFlBZkdN?=
 =?utf-8?B?VVJoSEdBRWlXeGxSeXFLY2VxRWtyd3FxbmQ0RjFmYXJCZ1lhUUNqYTBhZlVa?=
 =?utf-8?B?M3p2TkJlSXNVekFCTUNtaSs0WXJCcVFZQk9XQ0RyTjl3WVlOUjFrM0tkSjlH?=
 =?utf-8?B?TElUR2x4TXR3OENkQ245TFpoeURtVWpicW1FY01tOG1XQWJ0SjdvQU51b3Vu?=
 =?utf-8?B?RElsVlhJS3dUcE9CYnZZZ2pGV21wWWtGZ0FGeEJWYkdLOThsOEkrREl5Zmpt?=
 =?utf-8?B?dzRoeWViUm5rcXE0c2V0cW5pN0IrS1J5UEFnTUp2NUdabTJmVHFZMDNQTWhQ?=
 =?utf-8?B?MGVpR0M1MWl3bG1xTUVSTjByUFQxNDNXQ2RPZTc0b3QyNlpENzBDVjRwUjBa?=
 =?utf-8?B?U0d3eksvcHc1TGYwQWxZMzd0RXVvaVYvamxVbHE3WW15N1NxZjhxWTBaTHRZ?=
 =?utf-8?B?S2p3dGhYSmU0ekFVdW5lZ2xoVW9Vc1BCQWxEMjJIeUVuRU9MNVk1TzF3U0h0?=
 =?utf-8?B?OE1RNzVHUk1DMjIvNGsrZ3pQOUR6Zm4zUURvN2ErSEpNMjNtMExDdzBJMU83?=
 =?utf-8?B?dVUvdEwraGdZYVlJQ0ZDTHlPVE1oOEZCZlJ3VW4wN1RETDRoamdaTGJRajgz?=
 =?utf-8?B?bG81QnlMcXkwdnhTclVyYVRsc2xsUlFMQ3d1VFlpODV5ZlBpNUgyQmlLWVRu?=
 =?utf-8?B?TGhvS2EvMVNHVUtrYzFHMUZUSGtpZXQ5OUc3bmxZb1pUK1dUN0gzeTB6U0xM?=
 =?utf-8?B?SUo2a01vK3BUUForK2QxUDVvamRBQ0xxTlFyS3BWeTN2NkpMcUY2L0tGbHd6?=
 =?utf-8?B?YnNISFFXMUJzYldvanhNRjUrNDdaRU1pdTlYaVc1K1lDbzZORmtRMDhtQWp3?=
 =?utf-8?B?VWJ1MmpZeEZmc1pNREJvSllOSFhQWHJaQlZBOCtScHMvak96ODFuZXhhUDIx?=
 =?utf-8?B?T0E5YjQwOHA3clQxU2IxZzRjeDVEWWorV1JiNUpZbm9YaWwzVW4yMGg5d1Bv?=
 =?utf-8?B?S016Ky9pVFNtWkJ0R2tpMVhTVmp2ZXJmSVhIcy8yeTVOVEJ0U2I5V2t1UXBC?=
 =?utf-8?B?ZE9SN3hLeG1xT05ydENpcm9yY0FNclZubVR1dWhnTlFSQVdFdkVmTVJjc0lW?=
 =?utf-8?B?cWI0ZnJDY1NOQUNjSnU0M1VkNCtrL1pCcUV2TTY1S1VIY1l0U0hhNUtadlBL?=
 =?utf-8?B?bFRqVGx3ZFVpb25qWGIwTTMrWTM1MGVsazQwazhPeEo0NXluYlZWWW9pTmor?=
 =?utf-8?B?YTFGZ1RXUnUyM2ZrWGdWK252ZS9rKy9pTGtJM1pYSnVUY1FrcXVYUHNGS1Qz?=
 =?utf-8?B?QnJIN1RxWWdSajdtN1hZK3QwTWdOeVNkbER2RUcvaERrcHlTWHM3VTdYWjRt?=
 =?utf-8?B?RUdIc0N3enhCRXZvWGhPbjRodWw1bWVncjdSRG1LQW1sa2p3U2xMSUZ4TDN4?=
 =?utf-8?Q?lTEbcE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 11:05:49.0316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be484f1-6b79-485b-9f41-08dde0a2af88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6CDAEAF48



On 30/07/2025 10:45, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Add a scheme to distinguish transient MPU regions, to identify MPU
> regions which will be mapped for a short period of time.
The commit msg lacks description why this is needed.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>  xen/arch/arm/include/asm/arm32/mpu.h     |  2 ++
>  xen/arch/arm/include/asm/arm64/mpu.h     |  2 ++
>  xen/arch/arm/include/asm/mpu/mm.h        | 14 +++++++++++++-
>  xen/arch/arm/include/asm/mpu/regions.inc | 19 +++++++++++++++++--
>  xen/arch/arm/mpu/mm.c                    | 23 ++++++++++++++---------
>  5 files changed, 48 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index 0a6930b3a0..9906d98809 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -39,6 +39,8 @@ typedef union {
>  typedef struct {
>      prbar_t prbar;
>      prlar_t prlar;
> +    bool transient;
> +    uint8_t pad[7]; /* Pad structure to 16 Bytes */
>  } pr_t;
>  
>  #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index f0ce344e78..1d1843eda0 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -38,6 +38,8 @@ typedef union {
>  typedef struct {
>      prbar_t prbar;
>      prlar_t prlar;
> +    bool transient;
> +    uint8_t pad[15]; /* Pad structure to 32 Bytes */
>  } pr_t;
>  
>  #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index c32fac8905..56ca411af4 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -60,6 +60,16 @@ static inline void context_sync_mpu(void)
>      isb();
>  }
>  
> +static inline bool region_is_transient(pr_t *pr)
As this is just a read helper, pr could be const?

~Michal



