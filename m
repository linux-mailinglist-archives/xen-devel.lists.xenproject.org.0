Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3022B3981E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097935.1452106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYq0-00082A-3L; Thu, 28 Aug 2025 09:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097935.1452106; Thu, 28 Aug 2025 09:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYq0-0007yo-0D; Thu, 28 Aug 2025 09:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1097935;
 Thu, 28 Aug 2025 09:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urYpy-00075k-9h
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:22:30 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2407::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83d5b6e2-83f0-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:22:28 +0200 (CEST)
Received: from BL0PR05CA0023.namprd05.prod.outlook.com (2603:10b6:208:91::33)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 09:22:19 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::60) by BL0PR05CA0023.outlook.office365.com
 (2603:10b6:208:91::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.6 via Frontend Transport; Thu,
 28 Aug 2025 09:22:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 09:22:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 03:20:49 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 03:20:48 -0500
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
X-Inumbo-ID: 83d5b6e2-83f0-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5054ixvzRJXYVLuTyyDN5UjMpXii+K3fY69Nux+3gYiNA4Su0YuIUFlUM21wmSWfwyDkNpih+OetknMDcOryiTsfBXul+YsW6Ukb3uvd1JT95yqmr02KJ7f4ESrY4klXDcnrcEO7I28qWggm6mso8PfBZaIApIVwKeBWx1+0T1OsFTX3JhTd5pIV5Gi1QKMGKGH+DvCsk8SgrzLKC9gmI3KV9YMA46LuLRFOsKjaroVg2X0tih+37xcJyAAbrmPyt6s2UE54uP9C+eRsRtTxQx5G93niWiUoVslNmvuawYtlzPI8ek+WGGKdZ4aIo84eEiRdvtA+AYD4Tr+7vv4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN9WxuNeVeFM020pOXHfTK99mFiHauGuY5Rz0z1jXsc=;
 b=xO1UFHrqo1LAaMi6wqM8/P4nL2VhtvxD6F7sRSBaKV1gcUIFy3fSSVCU4d13rlbS6KPLFhBGsOd/G3Ni9zI7GRB2QNsKvyUByjHZpoYq2K0t9wTtw0k9dqstnDZ+5Gbx1dUjSwTq4bQf4g1p0UZKO7c8nls2FT5cKgTXbfvLycZ8oFaT/8QpO0xYi4z1rZ9rW9mc6gSqStURrZBol2ZtBcrDtVvIfegIlKLNESCX895oN/MLEsHSV3NxhBVuyLdxuksp9xu3N9rnyMF8BnUBBZtL5OYwrjLqzjXDObkkunsDr3oWbLjM2zYDy7yKnUcgEZDCyLSBOOCRKZ0D4X4wrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN9WxuNeVeFM020pOXHfTK99mFiHauGuY5Rz0z1jXsc=;
 b=NExReYyY8pQbOhSpi6U69EWfCKnZyR7SJrrTP2lNY8JzZvEYTKKrG7Et0cYRj0QKUVEgu0hJk5ygLyjay/DaAg4MlygS9mb96iuj5QxTdx5v6b/Z02Cf1Da93UCr+XcnWjZ0dvBDn3oZnOMIF893jGYu352FPEiS2LkBMPuCeIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b9e9a44b-c718-468b-993b-419658c44667@amd.com>
Date: Thu, 28 Aug 2025 10:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm/mpu: Implement transient mapping
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
 <80b0b3f84ae73f7d92d1b1cfe057ffc438882725.1756312498.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <80b0b3f84ae73f7d92d1b1cfe057ffc438882725.1756312498.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f34ad4c-3f28-4ce1-6d9c-08dde61462ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEhBeTNOTUNNekVSdmRnR3kwUFByZ3hxSlU0TWt1ai9FbGNxZVROQjJVRHVQ?=
 =?utf-8?B?QU5wRnZBTmFGc1hvRURkVlppSGVKNmJJdGN5eHZxZGFHYkpGT0w3c0RPeTZt?=
 =?utf-8?B?MDh4RndLSGg4Wk0zOGFSSTFNL1NHR0kwUkJCMHBMbEh5NHdqNldKWDU5UHJ5?=
 =?utf-8?B?bFZlRkVyWk5ncWNydml4ZUtxeXFWMWczb3B3RDB5VTdkblNidC9IVEU5UUV2?=
 =?utf-8?B?RUMzQUJwS211ZkJmb0lxQUhocHNBN2k5RXRiTmNsajZHT2FnSnhGcUlSOURV?=
 =?utf-8?B?TXlHS3h0dC82SlVoMjliVEhBWUExMzdjdmFWVmdPYU0wWU9GYXQ4OVkyVldI?=
 =?utf-8?B?US9HTXZkckVSK3Q5a1ZpcFdoc20xYlZOKzR6WklUeEpRMEVYaDJOaEYyNTlr?=
 =?utf-8?B?RHJIUzZDd3ZWdVlOQTZwa25oMEJMcEpjakt5SGl2TGhJbGM4T3U0QjZGZW01?=
 =?utf-8?B?Vy9UQUJYVDFkRmtURWsraE56VFRHYnBMbUplLzRyTmNFcExNMUpzeHRTaTZu?=
 =?utf-8?B?MUxTNE1HTzR5Y1VkL2pxRzUzMmRFU2M1Q1k5djlnd1JiTVY0ZnA2QUU5VEhi?=
 =?utf-8?B?Qzkrdy9mN2pHaUdlcVBabkJRVzhJVENNTk1lZXlhYlduYWEyS3pKVTRYZDZE?=
 =?utf-8?B?MzB2TnE4a3g2WEMwMUtsR2lhUm0vbzRmYnFMVmlXUDRiNlFaNUppVkRkempR?=
 =?utf-8?B?SDNoRDQrSDdidStyRGNmNmlIZlVnYWQ3U2tBZ3IxOUo5RDZBR3hCdW0vVHox?=
 =?utf-8?B?dmFYTUVBc3FQUTQ3ZWJpM25VNFQwaGp0SXB2c1JMUzRzYUd5eFNWZk8wQlE2?=
 =?utf-8?B?MUZPOWM2L0RHVkx3eml2YU1Ha3JQcVVKTFo4L3duSHZUd0MxUG8vREpiUUp3?=
 =?utf-8?B?emx3eWZTcTBCczN0WklYWXVTK1U5VkdnLzExbXpEbUtXMWI3SkJtT2VDcWVh?=
 =?utf-8?B?Rk56K1YxLzRlNXVPMW8ybHV1emhvQmJHQXVRQ0NxNzE2WnppZllDM1ZCSWJW?=
 =?utf-8?B?bnNYbHNKVXFzVGNrSnYzOXVCblZpb0VyMVRYOU0xMGZpSXVNai9rNmNKZ3g4?=
 =?utf-8?B?U0p2QS9OQlBBMHhiMWtNOEJCcUR4ZDgrKzV5aGJNbzZTZ0VObFkwZmdEZWxq?=
 =?utf-8?B?TkY1Nytod29pTDBpT0tjMkFycUJRNmo1TVNzT0ZOYnFVZWZkTWd0TktHZjdv?=
 =?utf-8?B?Z0dlbHdXaEd5NjlnUjlEMGk4RXEzS2FhMlR4enU4NDAzekV3MzFsb0creEdL?=
 =?utf-8?B?M1p2NW1OVjJxVzBjK3JRdXo5RTJQSUdhaDMxNEVraW9Wb2hYSTRoUVhGVFBL?=
 =?utf-8?B?aUJQdm5ua3JYbXVMRU5sQXFrMytUYmVodGNQdUhhUzFYbTcydmRNYVVxSlVs?=
 =?utf-8?B?aG4vYkowREZkMkMxemRpZXcrR3orSFFOWDJaaDhhTVJ1UWRKekNjOVhKYjN1?=
 =?utf-8?B?K01tVUsvQlpKdFZkK2pZbmJRTHpCTFRGcnBSdkdKZWVuSTZRWEFvaDNQSldC?=
 =?utf-8?B?Q1ZybUpXRFp4LzhSdnhCZWltaHJxeDlDRnl1WjZocWNybkd1MWRPMEpEY1RK?=
 =?utf-8?B?b1BxSVpZTytvS20rRXpDUXZtTktyNDRVaGllVXRPcGZZam9xWlN4YUJzdVUy?=
 =?utf-8?B?dVI1T0RPMERFa0ZhWHJtUU9jeEJJVjJ4dThmK0o1ekNYQWVyVG13elVTMEpz?=
 =?utf-8?B?S2tjSHN3RXBoSHZOenpWM2JONjFtMTlOUzNidW04MVpuSU52VkQrRGVlVDRi?=
 =?utf-8?B?VnZoeGhwNVZWOFBoZlcxL1poSFdieG43dUdqKzZGdkhSK2ZNblY1QWo1SllS?=
 =?utf-8?B?eXhIaGZ5c005a3NLS1Z0T2hVYitEV3JlZGJhcmJ0ZXFLSUQ0Tm5pVWRxVDlT?=
 =?utf-8?B?M2pTYytXdkpWWmJwQ01HanhwS1BoSzE2VTYxY2pXQjYxdjBkWVAyZ1dpV0dT?=
 =?utf-8?B?WW85RkxUZk5VcVlLMlhLY2ZtU3k3TVVUaWU4UDloNEgzTlpwT01wZXpmNjFh?=
 =?utf-8?B?QklKb3VOemdFa3dLYlJYMStINnpIRXJkaGJDUkoxamNHWWNDSksraURiZWFv?=
 =?utf-8?Q?tbzmC7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:22:18.9621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f34ad4c-3f28-4ce1-6d9c-08dde61462ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095



On 27/08/2025 18:35, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Add a scheme to distinguish transient MPU regions, to identify MPU
> regions which will be mapped for a short period of time. This is needed
> for the functions which transiently map and unmap memory ranges on
> demand which will be introduced in a future commit.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Improve commit message
> - Mark parameter in read helper as const
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
Do we expect to have any other flags? If so, it could make sense to use a
bitfield right away.

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
> index e1ded6521d..566d338986 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -55,6 +55,16 @@ static inline void context_sync_mpu(void)
>      isb();
>  }
>  
> +static inline bool region_is_transient(const pr_t *pr)
> +{
> +    return pr->transient;
> +}
> +
> +static inline void region_set_transient(pr_t *pr, bool transient)
> +{
> +    pr->transient = transient;
> +}
> +
>  /*
>   * The following API requires context_sync_mpu() after being used to modify MPU
>   * regions:
> @@ -75,9 +85,11 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
>   * @param base      Base address of the range to map (inclusive).
>   * @param limit     Limit address of the range to map (exclusive).
>   * @param flags     Flags for the memory range to map.
> + * @param transient True for a transient mapping, otherwise False.
>   * @return          0 on success, negative on error.
>   */
> -int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
> +                      bool transient);
>  
>  /*
>   * Creates a pr_t structure describing a protection region.
> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
> index 23fead3b21..f9892fe3d8 100644
> --- a/xen/arch/arm/include/asm/mpu/regions.inc
> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
> @@ -14,19 +14,31 @@
>  #define PRLAR_ELx_EN            0x1
>  
>  #ifdef CONFIG_ARM_64
> -#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
> +#define XEN_MPUMAP_ENTRY_SHIFT        0x5   /* 32 byte structure */
> +#define XEN_MPUMAP_ENTRY_ZERO_OFFSET  0x10  /* {PRBAR, PRLAR} is 16 bytes  */
To avoid having to update this over and over again, maybe define a macro using
OFFSET?

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

