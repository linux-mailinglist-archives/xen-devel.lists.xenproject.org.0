Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268DB8CC95B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 01:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727943.1132658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9v10-0003If-QW; Wed, 22 May 2024 23:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727943.1132658; Wed, 22 May 2024 23:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9v10-0003Fr-Nk; Wed, 22 May 2024 23:04:58 +0000
Received: by outflank-mailman (input) for mailman id 727943;
 Wed, 22 May 2024 23:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31Ro=MZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s9v0y-0003Fk-EN
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 23:04:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2f73331-188f-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 01:04:54 +0200 (CEST)
Received: from BL0PR1501CA0001.namprd15.prod.outlook.com
 (2603:10b6:207:17::14) by DS7PR12MB6240.namprd12.prod.outlook.com
 (2603:10b6:8:94::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 23:04:51 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::26) by BL0PR1501CA0001.outlook.office365.com
 (2603:10b6:207:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 23:04:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 23:04:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 18:04:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 18:04:49 -0500
Received: from [172.30.116.145] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 18:04:48 -0500
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
X-Inumbo-ID: b2f73331-188f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItF2QukBqKduBfq5POk2PKKhD/mdapQ2ocl+HtQ7ymO0PBrNpSdgUcyFByEtATmCtOGKJDvaWh8cOlxrUf/BOcbshR1rC3bd6laeuhkk3jHZWNO2kS9qgMSFUag1rBHrP/5aXLYFMRWsYlIV0NhG3tv65B8pWF58LYCyz/EL6UMcyv2Yf7RmgMubvo/h0YD0IpAhkdunJFaH7GNmoiSIkvFnN8nRfcnHetFr2zencNAzdc3U1BrXWJ68LM6ygOu9X1bwf4hN3fcSxPqf3t+WU6wWHrPy2i8Du90iRWHhD9tJAOcUjYwI/WhxPZGXGljHTb82+DIPN6S1czYm4AlEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsUpyP7kn8eJLu3oRss/4HmR2ID1rVQETHF+4Cg0ngM=;
 b=P43QVttNmWrJtAYcft59UTzzubcoirQvHunvU/I7kY26475AGWUMiRheUuStv9SzOIV3jIdrrO2jPUhylWXYLr3dQv3isid9XLN5f/ObifxoKAXCFxVAlBz7MfJ1BvnOnx9IlbGYCqn9QUdzzRgOB8gHqFE+7mq8Nq5pi6eBnONED6mCTFT88Sb25hPP0lFQJNJRSeAXyIWkOX9VV+l+mv0tACBFnmh1B3bYZ8Qs1vE6aQiqpaqdyIeY4CuHpgr7d9E6tddUX9XiH583DyOtfjkXWO/DxIT5AkH+9XkFWQkVs+/38u9JKXrWWxhTNBr9fX8bBYfLGLuAxMXPL3Mciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsUpyP7kn8eJLu3oRss/4HmR2ID1rVQETHF+4Cg0ngM=;
 b=YZvObtKJ6VucK0PzBJvJyYEvenI6ugR1ilrjZZmDsdz9V2LjMGuOVPOY+83iPioCgeuX+afxuRicl8jdk9aUNq9DMzF9B3jguBkGyNHev9jHYDYoiTOrW1udwPLogPWEu4f8LUZ/jgRQgwv6T3E2uNnf8LTjiqS6QAnxeI7KaJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7072184a-20bd-4ce4-956e-c7c424eb097e@amd.com>
Date: Wed, 22 May 2024 19:04:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] arm/vpci: honor access size when returning an
 error
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-2-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240522225927.77398-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d1e53f-6abb-43ec-1c9f-08dc7ab39580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmlFZXVFRFhET3JIdC9RSHFrOWV0b0hKWDNlTEhoSnFPVTJqdE45UFV3M2xQ?=
 =?utf-8?B?Yk5jQU96bXRDVHR3cHFYMFE1Rks2SlBZWlVET1I3K25OaWtkM2dTejk2QkFl?=
 =?utf-8?B?S1FxUUMxQkpiRWxnMkFxRVNpUkpMVWt0eUcxcUJ6Yi9RSHR1TFZwdUxNMHZq?=
 =?utf-8?B?aUVSMjN3UzJzcVd6UWM0OWRnOHhrM0k5VFBEMzJTZXJtdE5rWXBXN2t5S0E3?=
 =?utf-8?B?dHBxd1hNKzlRS1h3eUV0dW56YzlqbTZRd0c4aC9yZ1dBVGxnVGo1cjJzZDEy?=
 =?utf-8?B?Q3I3OFc5SklpMGZsQUlSSkM2cDB0SVZHNXkzSDM4ZktONklFNXBGKzJRcXFU?=
 =?utf-8?B?K3gvZUhTS2RIcEJHRkxWN25wS1FYN2JJeVJLUTRaUU5NTllMR3VzVTYzTy9z?=
 =?utf-8?B?b0F6VGcxNmtvMVp2K3ZSUGZpeTMrVE5KTjR6aTYxMmh4bHNEVWdnaGVRa0lq?=
 =?utf-8?B?MWIwZEhmZEEzd1hYTm9uaHl0bnR3d2NvZGJySDlNV0hIbFpBN3JDVEMyaHdo?=
 =?utf-8?B?YXF2KzI5ZDdNRkdreXRHVjhsZ0hrcXA0dlFWTFVSSHg5U3o5YjU3dUtWZm1Q?=
 =?utf-8?B?cVdCWTlSWFN5Smo2Mm9xWkZjczgwMVBldUxBTmkvVnFncDJTd3NqT1N4ZGIx?=
 =?utf-8?B?Rm9HS0ZwOFUzY3ZTUysrL2pDdkVvZVZ3SzhWWkgrMTVkTXZSQ2pCUm1KUDQw?=
 =?utf-8?B?cmZqN0lseVFQNlNCU0tJNXF2ZnowYU5tTkF6b2RQd0NXcVhSU1VaemJUQnB2?=
 =?utf-8?B?WlE3NU5qZnpWNE8wbm9EQ1J3aGNCNHUyUHFSL2dlSmIvVzkxQzYxZHFPNkti?=
 =?utf-8?B?TXRqb3ZrVTRWTDFOMzNmYk9FYUltekdaVFRUN1NGY050ZmVYWC9kY0syZ2Fy?=
 =?utf-8?B?ZFZsZ3N0ajFTYzRDZW0ranNIVEJDWDQ3bkQwRlFjSFN4SGFialNEVEVTSHBq?=
 =?utf-8?B?bnBZd2NlWTU3Q1hJcVFQM0d2MFJpTVBxZWJoZ0NWR2J0UU93QnhpeVBYeGt5?=
 =?utf-8?B?dDJpK09RQzZNTGFBbnc3aFRLMklPc25kWTVpQWd0NHh3L2JRZ2lmR3diS3lj?=
 =?utf-8?B?M3AyK29naitrRHgxSWx4MjZkU0piU1o4MGtYMEYwNU52UDhlL2psYXB2QUVY?=
 =?utf-8?B?dUF3bVF6SlFZbkZnYUd2WkVOOWozaTFjQ1BRZ3NTVHpvU3ZERUpHNlhxRHh6?=
 =?utf-8?B?NkxYYjlsSVo4S2ZIcC9DUEJmMUgwbmxjc3lBTXNJSDRxUkQ0M01ydkVrSTV4?=
 =?utf-8?B?NUlCODBrS1dGR0FPL094dlAzNk04YTlPbjBwbEtzb0hvNEpCNlRsUGEvRGxX?=
 =?utf-8?B?Z3BTWmNxeXd1Q2dkNnZWUWg2dy9aY1FXMUJIbHdRQVRUUHpkL08wNVhwWnB0?=
 =?utf-8?B?MEtpdHBadWhHYmFXd3JyREpiSzZ3bWJYOWE0RldxVTl3dm55VlppREhHV0pu?=
 =?utf-8?B?dFFUUmJmaEZaWmppckhucTROS3RJZ1JNRURYMzQva08zTEpQTVZ4aXdiVXlX?=
 =?utf-8?B?MGgxcVAxKzRjSE4vcmwrREE4SVhsYUJMN0txakJWQkt5WWFMTXBlNHk0d3ZC?=
 =?utf-8?B?dkVmM3kxOU5ZT2YzOE1iQ1Mrb0k3N3lsUFFQK2JVb0orL1dIdW1zUmdiampB?=
 =?utf-8?B?U0xpU3E0SkVGMlhkckhWMTlibkF5UjJuZXhMSitkUk5Jc3Y1Sks4Z1hjNkJ6?=
 =?utf-8?B?amF4aU9lL3J2ek11V1V0NUhpQThZSHFXeVhYYWFOdG41MlBnaGowclJULzdw?=
 =?utf-8?Q?Gy3Z72v6L7ucB34mzhmHpM/UNCy63ilQiuPaCCP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 23:04:50.5234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d1e53f-6abb-43ec-1c9f-08dc7ab39580
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240

On 5/22/24 18:59, Stewart Hildebrand wrote:
> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> 
> Guest can try to read config space using different access sizes: 8,
> 16, 32, 64 bits. We need to take this into account when we are
> returning an error back to MMIO handler, otherwise it is possible to
> provide more data than requested: i.e. guest issues LDRB instruction
> to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
> register.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I forgot to pick up Julien's ack [0].

[0] https://lore.kernel.org/xen-devel/8fa02e06-d8dc-4e73-a58e-e4d84b090ea8@xen.org/

> ---
> v14->v15:
> * re-order so this patch comes before ("xen/arm: translate virtual PCI
>   bus topology for guests")
> * s/access_mask/invalid/
> * add U suffix to 1
> * s/uint8_t/unsigned int/
> * s/uint64_t/register_t/
> * although Julien gave an Acked-by on v14, I omitted it due to the
>   changes made in v15
> 
> v9->10:
> * New patch in v10.
> ---
>  xen/arch/arm/vpci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 3bc4bb55082a..b63a356bb4a8 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -29,6 +29,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>  {
>      struct pci_host_bridge *bridge = p;
>      pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    const unsigned int access_size = (1U << info->dabt.size) * 8;
> +    const register_t invalid = GENMASK_ULL(access_size - 1, 0);
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> @@ -39,7 +41,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>          return 1;
>      }
>  
> -    *r = ~0ul;
> +    *r = invalid;
>  
>      return 0;
>  }


