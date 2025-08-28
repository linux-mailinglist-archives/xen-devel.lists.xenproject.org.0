Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79AB397FE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097887.1452054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYlI-0004If-Eh; Thu, 28 Aug 2025 09:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097887.1452054; Thu, 28 Aug 2025 09:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYlI-0004GW-C1; Thu, 28 Aug 2025 09:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1097887;
 Thu, 28 Aug 2025 09:17:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urYlG-0004GO-SE
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:17:39 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2417::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d63713e4-83ef-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:17:37 +0200 (CEST)
Received: from CH5P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::28)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 09:17:30 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::b6) by CH5P221CA0010.outlook.office365.com
 (2603:10b6:610:1f2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.18 via Frontend Transport; Thu,
 28 Aug 2025 09:17:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 09:17:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 03:35:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 01:35:49 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 03:35:47 -0500
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
X-Inumbo-ID: d63713e4-83ef-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHIODNYLkhJE248MQuMesoGiiK9w268QDqKiymtfULxFFevf56SLsVdnIFBXwZIv1HYOlGPJHn6RwLwk4VaDD3vGdSL255IflXZwxLA63M3IqFGpr8CDvI4JQAO+lUnw7qGcEmzVQ9JmSDBtUxxG6aEf5/WVNEr6BDPke1nPjIvJd8BJjykJPk2FJaSaZiNupnWhlMp3FElIvT0DwURuaRAY5/S9Ti3aRn65JUyf76V/LjTUwQg7z0Q3iFINhqN4AXqqAa+Cxq21t5+uQF7OCMZoc3bRDD7lUpgRquoRc6/7TNftaC0W6gIvAc8V+iAdEVOETzSb0bR7S+NboKKY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+SLfARXbkKOK8PKGRKXE0ANDWtDGwvSC4XkgK5PmFA=;
 b=rtuIJGPATxpN0KvUY8MeiOIOmMvIA1RbdtXR8yeo3nS+DxbRQcbJTH9idPEj+sNmqzzCCQ5sjhZrUrijMmL9DeNEqabJtZuOaZvNvhFhcwTVTrnk/1AQIKMSFnppeCMZlSSlSX+JQuB+LTNY/i9it80v5GfdB8FuI6LptnBzP4WVX4hdhu/y2/mrIRkppB009p05YH15MSdxzdnR7EujfdGKlr9Y7lkcXzoKjJxFjKTjF4a5xZi/AmgC8tFlqCxQw3qjgMOL4khc8FXCq/uLIbFVefqz1OWOaDlu/wbBfx7va3joVJC7EjuAzYFoKWfYbbHqjMsE/dyfMyia+BZbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+SLfARXbkKOK8PKGRKXE0ANDWtDGwvSC4XkgK5PmFA=;
 b=h/DEs0bacwDb+WtUWFskwy6pi0RLdGhQTo42fFdNV6Q+LPIOFjF7jIc/6nBef5pYt5iY6qzemjtkY0sM2xzOSvtq53+XC9am+hnASQbHWxEd4PyfvGYfHTwsePPuwDQf2lWyFdw1pSVi1Q+csrx8VtcqBHsOixUdRLXw0NCcUn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3f59b4ff-31f0-4801-96ba-83df139af081@amd.com>
Date: Thu, 28 Aug 2025 10:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm/mpu: Implement ioremap_attr for MPU
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
 <d2287756e1cd2e7f1cf4ac1bc5de775840c0b0ce.1756312498.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d2287756e1cd2e7f1cf4ac1bc5de775840c0b0ce.1756312498.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1d2b8d-f160-4196-a66d-08dde613b6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anFUcmoxQzNaQXozdDFYZlc3Q245MkZmdnFDUENIV2NMVkx4dUdWMDY4cEp3?=
 =?utf-8?B?V25iRE43UTN4ZE5DYWRqeGw5Nys1NTcxMW1CTllUOWphS2dSSUwyNDhJd2RR?=
 =?utf-8?B?ZUU3ZWZDZ3pwaWVJS3RnamV2b05uUWZQYy9xWFBESWp4d2p3YklQaEN2TTNB?=
 =?utf-8?B?UmdTTzhCOGNFemsxbmtubGloSlhZbE9wZmFsZEFwU1dXYXRTUU1FbUpXcG01?=
 =?utf-8?B?NlFkSEdramVPVGg1eXYzMGZGcHVQaHdxMitEZjdXRUI0NHhDVTA4OEtodGo5?=
 =?utf-8?B?ZG5POUxESmd3VUVTZktyY09nMzhDcW42NE5rbng4OUc3WGdRdTFvRDFtRTB4?=
 =?utf-8?B?aE1NalNxODRwd29pOUJZRmZTOEYrdDZSS284YlRKOFpsWGJhckRGNzN3TU9Z?=
 =?utf-8?B?NW5NSUFaZEl6aUpqdUU4WHhxRXdDSkg0VmxpRmwyODZuVkZZYk43eTlYcERq?=
 =?utf-8?B?WS9zQ2RNbDFiS29lVFplTkhncytaWDlZVUl4M2pyVlFRNEY2b1RhZ1JCajFt?=
 =?utf-8?B?RGw4Z3Zzck1VdXVMQXJualZ4R2NmUm9rbFpVQ2pWYlFuUDUwMHhIMHh6OUYw?=
 =?utf-8?B?TEZQT2IzbEY4ZTBlVDBFZVpYdnVYYkYvTDcxOUc4Q0NwVXdzaUJ1a3krWFF3?=
 =?utf-8?B?YTVtWnhPOENKTC9tS1NvQmNnUVRudGxXSDdycEFPLzZWbkl1T05JcVdZcmpO?=
 =?utf-8?B?S3IxMno1Y016MWd2ZWtBeEZxK2FwWUsxVHpJL1FtbkRHbnMycDlMTUVXV2Ez?=
 =?utf-8?B?ZVM5ZXJPN1p5b0x1TGFpQi9qRnpNcW8ySElFNDlxbVNzc0FQaHJYMzlYL1hM?=
 =?utf-8?B?Qm96N0FJRWQrOFpYZFVzOEYwc2RIbTdiSWRQK3NnWVlwQnY4Tm4rdUlTV21a?=
 =?utf-8?B?WTF1aW1YNzdhRzgwMXpldEVYVm12bDFiUSsySnNLQWFlSVVoUUlOZVFkSEQy?=
 =?utf-8?B?QU9XdHlQRU9nMFcyVTEzdm1oVzhDUzdRcGlWRWtJbSs5UEEwTFNaeEFKZzNo?=
 =?utf-8?B?Y25sbGl0Z0RXUE9DOCtSUVlnNXkyMFBwbGg5TTF2ZVlMVmozdmlvV3MwQ2VR?=
 =?utf-8?B?bkhsdTZnaVhmMlZJMWtVUytLemdQSzVkRHlROThYdHdwN051b2gxYUZ5ZjZv?=
 =?utf-8?B?TUcxRUFwQU4zbDBHM1ZDTktuK2MrTzMvRDZ0MW91S0lRdnlMRWRwaTlNSFJr?=
 =?utf-8?B?N0txcEUxNXlDWTRKRE1aYVBueExsS2xIUHc2aTJta29WbWZXUURlM1RuRTEx?=
 =?utf-8?B?OFM3MnZuZmNuVFF3a0lnNzhURldaYmdqWUhsZXgreGZ1TlhpM3Z2QW9wYXdx?=
 =?utf-8?B?TnhBUE9lWmt5Rmp6TDZhSG5IYVRYQU5LdkFxeFRNbDZ3UzF6aVdqZUxBcXZy?=
 =?utf-8?B?ZXVJVVBKeVFicTM2cXBDQ1BGZ0J4eWZGQkRsQ3c0ZWppMHR3ZG1ickdWU0Vh?=
 =?utf-8?B?SUtVNGtpWWhISmQvU3hSY2tkcW5TSDhVSmFhZzJxNUhpVFhRc1RacjRpUEM3?=
 =?utf-8?B?cjVQaXByUkNGeXFLSVNmMTVjbXU0dTdCa0xWUWhYRnN6QzJxeThJcFFyYmwr?=
 =?utf-8?B?MUdhZ0ZTT3FCWEZyTklyeFVDbHhBTVFYNHpmRFNQOHJLV0Z0MlQ2Rmx2LzZD?=
 =?utf-8?B?a0pDU3JaK2svSTlRUEcrTnNxZkNGRHdVRTRLSHdWTnhLYzZNQTJFWlFldmtX?=
 =?utf-8?B?R1NpWWZDQnFwbWFkcElyRElMazVBY25NcW9Manh5d0YwTmZJN3FLdlNnOGJ0?=
 =?utf-8?B?Z1JWVEFTRDlSckVTNEhMQWJHL2lhNGg0V0pnTEQ0RVI5TFlGcG5xK3pta0Er?=
 =?utf-8?B?eFYyUm1xbEZNRVdHTjczRy9YRWtEcjhjakNoRmlSa3FCRGhvNzhmVEtBK1NR?=
 =?utf-8?B?VWpGUExzc1FrWmV1ZGx3QU0zSWo3YVNJSUhPRXdlMm9jeDdlaFdiVHk5QzVH?=
 =?utf-8?B?N2x3ZURPTHFvOSt1cUY4NEpvand5em5aaHdZcTdadU05UkdpWEwwbklmZlJp?=
 =?utf-8?B?TmZvM0hoWDRUTWNOMkVKVjdpVndPWlcwWEdEcDZPQ0ZLZDBhMUxkOVJUK0Jv?=
 =?utf-8?Q?j0rpRT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:17:30.0383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1d2b8d-f160-4196-a66d-08dde613b6b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134



On 27/08/2025 18:35, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Introduce helpers (un)map_mm_range() in order to allow the transient
> mapping of a range of memory, and use these to implement the function
> `ioremap_attr` for MPU systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Use transient instead of temporary, and improve wording of comments
>   regarding transient mapping
> - Rename start, end -> base, limit
> ---
>  xen/arch/arm/include/asm/mpu/mm.h |  22 +++++
>  xen/arch/arm/mpu/mm.c             | 150 ++++++++++++++++++++++++++++--
>  2 files changed, 163 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 566d338986..efb0680e39 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -101,6 +101,28 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
>   */
>  pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>  
> +/*
> + * Maps transiently a range of memory with attributes `flags`; if the range is
> + * already mapped with the same attributes, including an inclusive match, the
> + * existing mapping is returned. This API is intended for mappings that exist
> + * transiently for a short period between calls to this function and
> + * `unmap_mm_range`.
> + *
> + * @param base      Base address of the range to map (inclusive).
> + * @param limit     Limit address of the range to map (exclusive).
> + * @param flags     Flags for the memory range to map.
> + * @return          Pointer to base of region on success, NULL on error.
> + */
> +void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags);
> +
> +/*
> + * Unmaps a range of memory if it was previously mapped by map_mm_range,
> + * otherwise it does not remove the mapping.
> + *
> + * @param base     Base address of the range to map (inclusive).
> + */
> +void unmap_mm_range(paddr_t base);
> +
>  /*
>   * Checks whether a given memory range is present in the provided table of
>   * MPU protection regions.
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 33333181d5..52c4c43827 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -332,31 +332,39 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>      return 0;
>  }
>  
> -int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
> -                      bool transient)
> +static bool check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags)
>  {
> -    int rc;
> -
>      if ( flags_has_rwx(flags) )
>      {
>          printk("Mappings should not be both Writeable and Executable\n");
> -        return -EINVAL;
> +        return false;
>      }
>  
>      if ( base >= limit )
>      {
>          printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
>                 base, limit);
> -        return -EINVAL;
> +        return false;
>      }
>  
>      if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
>      {
>          printk("base address %#"PRIpaddr", or limit address %#"PRIpaddr" is not page aligned\n",
>                 base, limit);
> -        return -EINVAL;
> +        return false;
>      }
>  
> +    return true;
> +}
> +
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
> +                      bool transient)
> +{
> +    int rc;
> +
> +    if ( !check_mpu_mapping(base, limit, flags) )
> +        return -EINVAL;
> +
>      spin_lock(&xen_mpumap_lock);
>  
>      rc = xen_mpumap_update_entry(base, limit, flags, transient);
> @@ -465,10 +473,134 @@ void free_init_memory(void)
>      BUG_ON("unimplemented");
>  }
>  
> +static uint8_t is_mm_range_mapped(paddr_t start, paddr_t end)
> +{
> +    int rc;
> +    uint8_t idx;
> +
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, start, end, &idx);
> +    if ( rc < 0 )
> +         panic("Cannot handle overlapping MPU memory protection regions\n");
Why panic? This function is not used only at boot time and should propagate
error to the caller, it's also within a spin lock.

> +
> +    /*
> +     * 'idx' will be INVALID_REGION_IDX for rc == MPUMAP_REGION_NOTFOUND and
> +     * it will be a proper region index when rc >= MPUMAP_REGION_FOUND.
> +     */
> +    return idx;
> +}
> +
> +static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
> +{
> +    bool ret = true;
> +
> +    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Access Permission attributes (%#x0 instead of %#x0)\n",
> +               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
> +               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
> +               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
> +        ret = false;
> +    }
> +
> +    return ret;
> +}
> +
> +void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags)
> +{
> +    paddr_t start_pg = round_pgdown(base);
> +    paddr_t end_pg = round_pgup(limit);
> +    void *ret = NULL;
> +    uint8_t idx;
> +
> +    if ( !check_mpu_mapping(start_pg, end_pg, flags) )
> +        return NULL;
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    idx = is_mm_range_mapped(start_pg, end_pg);
> +    if ( idx != INVALID_REGION_IDX )
> +    {
> +        /* Already mapped with different attributes */
> +        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "Range %#"PRIpaddr"-%#"PRIpaddr" already mapped with different flags\n",
> +                   start_pg, end_pg);
> +            goto out;
> +        }
> +
> +        /* Already mapped with same attributes */
> +        ret = maddr_to_virt(base);
> +        goto out;
> +    }
> +
> +    if ( !xen_mpumap_update_entry(start_pg, end_pg, flags, true) )
> +    {
> +        context_sync_mpu();
> +        ret = maddr_to_virt(base);
> +    }
> +
> + out:
> +    spin_unlock(&xen_mpumap_lock);
> +
> +    return ret;
> +}
> +
> +void unmap_mm_range(paddr_t base)
> +{
> +    uint8_t idx;
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    /*
> +     * Mappings created via map_mm_range are at least PAGE_SIZE. Find the idx
> +     * of the MPU memory region containing `start` mapped through map_mm_range.
> +     */
> +    idx = is_mm_range_mapped(base, base + PAGE_SIZE);
> +    if ( idx == INVALID_REGION_IDX )
> +    {
> +        printk(XENLOG_ERR
> +               "Failed to unmap_mm_range MPU memory region at %#"PRIpaddr"\n",
> +               base);
> +        goto out;
> +    }
> +
> +    /* This API is only meant to unmap transient regions */
> +    if ( !region_is_transient(&xen_mpumap[idx]) )
So is this the only purpose of the transient flag? To check that unmap_mm_range
is used on the range that was mapped with map_mm_range? What would happen
without introducing this flag? You already check for the matching attributes.

~Michal


