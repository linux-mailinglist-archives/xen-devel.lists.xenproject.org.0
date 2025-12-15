Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9ABCBE1EE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 14:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187012.1508436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV8su-00068p-5k; Mon, 15 Dec 2025 13:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187012.1508436; Mon, 15 Dec 2025 13:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV8su-00067N-2g; Mon, 15 Dec 2025 13:45:08 +0000
Received: by outflank-mailman (input) for mailman id 1187012;
 Mon, 15 Dec 2025 13:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rAy=6V=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vV8ss-000679-2d
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 13:45:06 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41bd9432-d9bc-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 14:45:03 +0100 (CET)
Received: from CH0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:b0::9)
 by DS2PR12MB9800.namprd12.prod.outlook.com (2603:10b6:8:2b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:45:00 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::2b) by CH0PR03CA0004.outlook.office365.com
 (2603:10b6:610:b0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 13:45:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 13:44:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Dec
 2025 07:44:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Dec
 2025 07:44:59 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 07:44:57 -0600
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
X-Inumbo-ID: 41bd9432-d9bc-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ji/2chMew3h7Y8Vy6FOfcCxoAfDqpHNLYKC+RFEGYIokwi1v1AeWzq5k56XKd87M0xP6BW5lgiwcPt3fVqVY7BB4n+DiMk7KDpLSos+/Jroav7gQ0GXg1LcHzKushSXZFjX0qaDTGdAwOkIEBSmZFyzcWSek2xQqEbqETf1R+TYb+Ng0JS+rkTJZPq8+QjMfc23vYLi7AxmCuKkXd8w6lbQO4qUbpZFV2FNIUOhcyaICJOEE+t+KC8whl7lm6+cXXedn/8bcBeRxvyIUBL9QqvltRyZQ6jZkXjf2NRqK4TSEBpN6uJkML6YfGQV2lzgPNnvY8MPWLER+XYXaIU89IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPLzV0a4mDRe2usJmIZFfJD9N2c/94KRAVWb9iAi4yI=;
 b=hSilpwngvi8dp+N8hXz+nKG/ex/KxcU/wId9QQyQiAds1SJ2VHQxN9tp/uwHwSG3VGqSX57VMH7024H6aPF0JuYAXziHc2WkG+7milJLleEGYMsT1UmF+M5OGBhpYIMnAoie3hSTDiwv2a1bgDI6NDGO52wOZcxiJAJ69RThB0KFTo3B9+6ffX5sNgVO2eX5RQtfeBzCON7UMX9pvDlVD2Q3GkKGkT1eGcL2BYgPwiYJ42c5qdHdJyImiccKqjw5m33F9CGGkPKJxUIvHgb/kQNk/nmw6/5y5UT3ZZaiEf7CgESdDvEjpBX7SZ911HuZNQbGVuym+yPAlUZYYjedCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPLzV0a4mDRe2usJmIZFfJD9N2c/94KRAVWb9iAi4yI=;
 b=1b/heCFtG+iykOdR3COpKtoXkKPq/PxuOWTJD+3/EfnBmFtSUfWbua1ZZpBzlPqsVxp7vb/X9Y3i+OJDHGZdHmb8xt0JScNaTktfbpl+CIyawgs2Qc3YZJkzsp2n6nkEJsenn8CTpK/4yPwlZajztsYZycgabMZXHQz8xQ3f29I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d0460e29-153e-4fc2-9744-95a2183fb31b@amd.com>
Date: Mon, 15 Dec 2025 14:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm: Use secure hypervisor timer in MPU system
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-6-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128095859.11264-6-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DS2PR12MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: d7946584-59aa-460f-f782-08de3be0243d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2Uzb01iUDQzeFJpRTFwN2lwNVJCRUtaRmdSMWZvaExXbUQyQTkyNEF4NVVC?=
 =?utf-8?B?M3JZcGc1NEEwWjdnNVAxNzZDR29PdU14NHlXdzQwK2VMWkhweWJRS1RFUS9z?=
 =?utf-8?B?V2pKNmFzbWNPczVwOGhuRHZrc2dWcEYydThpcmw1aUlqekc2T2EwbHBmTWl2?=
 =?utf-8?B?ZEFadXQ1OWQxRi82K0Mwd3F3eFduajc2b1phRTVXblVKaU45SHk3VlptYzRa?=
 =?utf-8?B?L0t4SDA4NW9UTC8yM0RYbUQxSmRGczNoZEpqQlgwcEdwZGtKaTVmWnk3WlRK?=
 =?utf-8?B?NjRqSVhydElMTTVqV2FtSWhsUklPOTBkYm53NHY2eDA3TUh5eWtxK1EvQS9a?=
 =?utf-8?B?MHNtbDN0S0Q0VTRUMWpLQ1U3YWhqeE40MnM1YXk2MVUxNnB4bGxNRTJZZHdl?=
 =?utf-8?B?SkxwM2pWNFRESzR3L2diWW9FOUE3L1FjVGhVVEZjdlU3VUZYSDlZV0ZWY09q?=
 =?utf-8?B?bHc1TDJBcGRZbnB0QnEyY1dldXAwcGlZYWErQTVGeWpQWU02bzRjZDBlWHpD?=
 =?utf-8?B?RVFIZjNMa29iK1NwbmszM2UrbGNKZHZTTlh2cGhBM0lqenNmeW83NlpqTklY?=
 =?utf-8?B?cEtQaUNNWHhwc2JBbzBBWkhNd2JUQklzVnJsTk55d1praktkWGVtY3o5dXFw?=
 =?utf-8?B?WHVYS2YrL1ZiQ3hZN3JQS1dEUjg1UDJqVlFHSWNPc1hUTWlyWlVvb0VxQnAz?=
 =?utf-8?B?T01pOC83UnZyaE1QOW9GS3NBQ29xaFdRR2xLZHNOb3F3dHlMeVp0U1ZWN3Zq?=
 =?utf-8?B?SFRkSE9CaUs5cjNkWmhQWmMxR1QzUkdmUktxWlowSUdvYmV5WGUzT0lnckEx?=
 =?utf-8?B?K3VGR1RaYzRWQXBGb3phcm5CWTZzcXVnWDU3bDVmZGVucHh5bElpTTlHN2RE?=
 =?utf-8?B?UTMxVm5LWEFmVHYxWWF2ZHY1Q2dIRWdoK25qai9uL3ZhNm10cVNxdjBweVQ1?=
 =?utf-8?B?VzVxYW1IVXQwKy81UVJsQ0hTd2xQVTZJcldGOHR4N0EvaEtPL1hrSEM5bVMw?=
 =?utf-8?B?RU5PcStLeWJpZUtPYnNCVHpGa3BObHk2WDR4WDZNeUVyTXZBOVJpYm5IL3Fn?=
 =?utf-8?B?L0t2M1YyM2hwZW9heElGL1ROZlpqRENXYkFrOUtZelBMMWxRM3dGbnljU2Y0?=
 =?utf-8?B?UGxvNFV3NkZnTlA4YXprRVZiNk13L2R0MUgvbnlIdFVWbS9wRkdGTXpkME5I?=
 =?utf-8?B?akszZVltWnRocjFHSDJnNlR4WkhJSENGUWE3elRBamVLWmpUUm1kSkVtZStv?=
 =?utf-8?B?bmo5RkZXeklFRXdHOGc0MEdycFhvTFY5ZmlBM3FKVlJTVllzN3lZQUozNEd4?=
 =?utf-8?B?Skhnb1VZVGhxQlZLMElXQVJrcFY3VXlFa1M0bWdocVhFRHJ2TjVRWWZHQUFF?=
 =?utf-8?B?WEdnOHZrNWhQbUNZRXB2TStuK2RIOEYwSkhxSC9BUFpmLzZ3c005SUxpT2VL?=
 =?utf-8?B?WWF5a1huZjVyTEt0d1o2a2JkRzlsS1RHcDBacEhTb0t3eWYwKzB3RXhOam5h?=
 =?utf-8?B?djZvd0xJZGxFMEYrRWpTVXMrbU9pUXpad1hZY21ncjMwd0dqTllrVXRyWUhz?=
 =?utf-8?B?R1d1OWtnQ0hoQ2Y2VWFsZUJMODdCWkFkaHh4dnkzaitIZVZJQkFtVmlGR2tE?=
 =?utf-8?B?bURuS1c2WEtaZFYrLzB4VzUrNmhuWTN2bjBoc3pDakNnMENzZTFISkdnR0RI?=
 =?utf-8?B?NFA3Z0Q0NnhzWHNiSWtLRTVSN1NQdURxYTJZYTJjK1RKT1g4K1NncVVJdm1s?=
 =?utf-8?B?a2l3YzlVL2hKNE4waDMvaERIZytBbkFSNnNwQTE3cUg0eEwyMmFIS3IwK2dl?=
 =?utf-8?B?dWtGN3gyY1JkTTNBNldzcG5QcDBUTTVBSVdranR2R2grRFh1NFF0cWEwK0Jl?=
 =?utf-8?B?U1FXMFpsMFgzdG5DMkNJM1N5a1Z5T054NXdWdmxmS3orb3J3TnlDSmJsY3JE?=
 =?utf-8?B?OTRXcmlqa1VxUEJFRHZoNCs4dldSY0EwamY0Z2xza29Gb1Q3OFJ4bE9xQmo1?=
 =?utf-8?B?VzJZVThic2FKWEh5RitQVEJ1WXU4TzFTUjhrdzE3elBxUmQ2RWVvMlM0QXBl?=
 =?utf-8?B?cWRhWHV4Z29GY1Nhb09wZmhJTHJad3plc216aTYyMjQvc1ZiMURuRUd6L3A4?=
 =?utf-8?Q?G+5Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:44:59.9399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7946584-59aa-460f-f782-08de3be0243d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9800



On 28/11/2025 10:58, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> As MPU systems only have one secure state, we have to use secure EL2
> hypervisor timer for Xen in secure EL2.
> 
> In this patch, we introduce a new Kconfig option ARM_SECURE_STATE
> and a set of secure hypervisor timer registers CNTHPS_*_EL2.
> We alias CNTHP_*_EL2 to CNTHPS_*_EL2 to keep the timer code
> flow unchanged.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/Kconfig                     |  5 +++++
>  xen/arch/arm/include/asm/arm64/sysregs.h | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299..a5c111e08e 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -91,6 +91,7 @@ config MMU
>  
>  config MPU
>  	bool "MPU" if UNSUPPORTED
> +	select ARM_SECURE_STATE if ARM_64
>  	select STATIC_MEMORY
>  	help
>  	  Memory Protection Unit (MPU). Select if you plan to run Xen on ARMv8-R
> @@ -223,6 +224,10 @@ config HARDEN_BRANCH_PREDICTOR
>  
>  	  If unsure, say Y.
>  
> +config ARM_SECURE_STATE
> +	bool "Xen will run in Arm Secure State"
> +	default n
No need, n is a default. I don't think this should be a selectable option.

> +
>  config ARM64_PTR_AUTH
>  	def_bool n
>  	depends on ARM_64
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 7440d495e4..29caad7155 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,18 @@
>  #define ZCR_ELx_LEN_SIZE             9
>  #define ZCR_ELx_LEN_MASK             0x1ff
>  
> +#ifdef CONFIG_ARM_SECURE_STATE
> +/*
> + * The Armv8-R AArch64 architecture always executes code in Secure
> + * state with EL2 as the highest Exception.
s/Exception/exception level/

> + *
> + * Hypervisor timer registers for Secure EL2.
> + */
> +#define CNTHP_TVAL_EL2  CNTHPS_TVAL_EL2
TVAL is not used in Xen, so you can drop it

> +#define CNTHP_CTL_EL2   CNTHPS_CTL_EL2
> +#define CNTHP_CVAL_EL2  CNTHPS_CVAL_EL2
EL1 will still use the NS EL1 timer (CNTP)?

> +#endif
> +
>  #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>  #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>  #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */

~Michal


