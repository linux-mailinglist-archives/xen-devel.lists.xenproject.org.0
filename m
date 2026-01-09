Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EE7D0A876
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 15:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198857.1515667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veD2j-00005p-Ln; Fri, 09 Jan 2026 14:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198857.1515667; Fri, 09 Jan 2026 14:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veD2j-0008Vj-J7; Fri, 09 Jan 2026 14:00:45 +0000
Received: by outflank-mailman (input) for mailman id 1198857;
 Fri, 09 Jan 2026 14:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1veD2i-0008Vd-9Z
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 14:00:44 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95910fd9-ed63-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 15:00:42 +0100 (CET)
Received: from SN1PR12CA0107.namprd12.prod.outlook.com (2603:10b6:802:21::42)
 by SJ1PR12MB6170.namprd12.prod.outlook.com (2603:10b6:a03:45b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 14:00:34 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::60) by SN1PR12CA0107.outlook.office365.com
 (2603:10b6:802:21::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 14:00:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 14:00:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 08:00:33 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 08:00:33 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 06:00:32 -0800
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
X-Inumbo-ID: 95910fd9-ed63-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1Ca1uYZt3W73jRCaU6BovtPc9dXvrps6QdK0rhgsW5rtDKRNKBBD25gpJLHpxRoXWKk6wfr4bZOkEcFKA/6rcXtUML96U/xYA9UqnoYSewLSJbanr2NsuKeJ3NoctOKt22haIjsy0P4yCm7Th/+j50Lrx/20j/Qd1KIEVpslWx1cJ9VcqiGoGnEx0IL4LX7pndlvMzGyemnGxNI2bsT/57mMcqhOwsjI475P3qs8X2HiarbCIps9Bt95gtgQjbNSk0hTUqdtjWz4YosuWy4eOv4GTPudOWT0u5CZChxvj1V+Wi8z5OrXrIX36RCF9ApvJwnEhSJNWcLTHB6/1UPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoh4EwKW9YxCQ33jFSp1dJ7kfjtLB/Zxu3IDJVm1oqk=;
 b=eZl8noODiMxvdTMnvII8peUTRfongVdTXAY87cF1EHuAp4my1iXgTcsORWqrbM7CUHO7EYGMmJiMcc1XjhvGX2X8tvH+RPStW21G98tEeve5DMq89nNttev/7Tj2/EYKVmO44NUoRnepugkhrucWyIj/fZef5QffGPUuCEGyAUndsgfbftBbMGQKq6EyvTVyRPWM8j4cng4fObVHsghqcR9t4dprfRjUSjbgTL/vsGqEqRENNnVExWByejsg8i6U8kBNhWrNKbWDRqID2PddN3fC/lWxoJPann3nwZL/VcM2pe5mu9fg2JuOkak1FDC6XVH0WXKlCWn6koaXsKkIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoh4EwKW9YxCQ33jFSp1dJ7kfjtLB/Zxu3IDJVm1oqk=;
 b=Fzxtjv6SNKbmH90dZDFjAsQ2S/fcCIoQ/vnHIfFOGolwQj47reZp/p2HdonNchTMfimqu94Ig2gHzdR4Hz0MkFXMxPE30sN1Wq7kIv3Jh2A1wAlI+u6BkXL1ZCgSJdVIPlWA3toL5jB70p0buvceSdAhr9v/3xzpoUEvAH1075M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <40677f79-8e3a-4c0c-876d-d57e9b230eca@amd.com>
Date: Fri, 9 Jan 2026 15:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm/mpu: Implement vmap functions for MPU
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260105113503.2674777-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|SJ1PR12MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f8c597-0b9e-49a8-e4e6-08de4f87756a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1JuS0JHNjB2emVEWWVjZitCbkMwVzh6dEdpZEdDemFBVEZlRzBLNTdMaWQ0?=
 =?utf-8?B?S29CbEhmZWFLYjJHSzhDcm9PRVQ4OE9UanYvbS9jTVljMWxBcDVCUVBRc3dz?=
 =?utf-8?B?K3VNVHk5VUt4Zm02Lzg1Z0o3MDVLUVBSMTIwZm1TbEoxTU9Ob01qaFNHSGRt?=
 =?utf-8?B?dUE0b0k4NU80ZHYvRERFWDhxQ3FxcFpkVUFyWGxxZ2x5Nk5jZnI1Nm1mYW5i?=
 =?utf-8?B?L1o0SnF5SUcraEFrZlpPNXAyVnRER1VjMjJsK1ZGaldWcGJ2Yml4MTk2YmhK?=
 =?utf-8?B?WGtLbjJGaDFTRHlUWEJzMEZWdGlsNFo1V2xtZ0NTQTZtNUduN3ZONHdDSlVW?=
 =?utf-8?B?Nis0VzJSNWJtWjMvN2xMSE5EbjZRT0p0aUZjSnNLNTdVMjcyV3ZTZHpuRFkv?=
 =?utf-8?B?cklJK1hOdnFoN3U0WENreDBsTlZJOXE0Mmxlc213NG5OS0ZnZmFBV1JPSUEx?=
 =?utf-8?B?dnlzd2plQTNScWt3UytWZmtKMm8xOFZ0VUJCSzNsdWRqMWdrbjczNzU2R3ZZ?=
 =?utf-8?B?STY5Y1lERmZlL041a0gvRklHdjdhWWJKNHE1d3JlcUE5TVhxVG9jSUg0UEJ5?=
 =?utf-8?B?TjFRWVFBR29zTDY3b3BoTkVhRGVoNVl6dGFFdE1UZnhPYjlBd2pQWGdBc2Rv?=
 =?utf-8?B?bmZjT3UzamVKWkk1U0VZK2ZaMXk4aE05MnVsZ0xjQWhPSGE3cWoxS2hTeXo3?=
 =?utf-8?B?bmlSVlJjQmh2bCt3ZFJxOGswb1oycGM0S2xvdXYxdXhFY053YmdqQUV2NDRQ?=
 =?utf-8?B?eVkyNkNyVmxaN1RybitzcVBMWTFYaGtJODhPZW9HeHRqQnlUWGwydHc1c0Qv?=
 =?utf-8?B?OUZFcHRZb0R6MG02VCtpNnNEQ1lRWVpKUlRzM2Jja0h6SG9KeVFEbTJGUmdQ?=
 =?utf-8?B?SEFOdDNhUmhOakk5V3cvWGg3ajkxQUxMdjNUaEtHaS8xTHBZQ1RXK1hhT1lW?=
 =?utf-8?B?bmVpWEZkTGExa3NmcUV6TGxTRVlFeEU2VXc1Y3NBMW85b3UwK0VrZmJuZ04w?=
 =?utf-8?B?c2VtODRXTTkrN2QvN0s3SHQvdE1MY1JpUlRRNlV0WVNZN0did256UStBQ0RI?=
 =?utf-8?B?eDV3VGg5Q0tMVDVrendEMGxpZFQvYkRVblZNK0lXRStiYi9KVERVOS9kOTRx?=
 =?utf-8?B?c0FDNVc0eU02d0NEYnd5Y3dsNEtPR0RQVW9aNCtpaEpsOVErdG9xREFLa2dm?=
 =?utf-8?B?b1F5ZCtycjhzTm9KbjV4RFd2K21YWUNydXplSDZSZ2lwelJvZUpsNFU3dE52?=
 =?utf-8?B?K3RDSENWNWprczRUNjFQNk9Va0RpdTlvK0F0UFhlSzZoZksvVUFKd1h1Tncz?=
 =?utf-8?B?U29FR2xScW43clFxSTZlUDIrcGRTNGVramJFMFJNSFdkTEdINEtSM0FZMzFj?=
 =?utf-8?B?eTl4OGZLNVltSDluRlNaZXJXMVlEelBldFFvMnlmUjV5eTBKQ2NkMHdWNldj?=
 =?utf-8?B?YlpZRlp1cUd2QTNwRWtnQkRYeWJUckpHeld4cytmTzluUEY3VDhVVTdtT1Nl?=
 =?utf-8?B?N3ZiN2ppNFJqSUZySEdEcElYSFBpS25DSDRvd09zQy9JRVlRbS9DamE3RkdM?=
 =?utf-8?B?MzI0QTB0dmJNcVFHb0dXNURweUxROG4vdDdNNnFiMGptNHp0SlVxQ1NIWm16?=
 =?utf-8?B?Y3RwV1d4RUthTGF0VStsTlVFSk9vMUdOY1Q1QnNJUVFQWk92ejg1NXVaVTY1?=
 =?utf-8?B?ZXByZFp6dUZGTlcvZ2dMcmJWY3REbS9HbU41TUJWNXNWU1NhK0g3M09wVjZp?=
 =?utf-8?B?L3NNNitIUE1SSVVrd005NHdPZjZ1NCtocUFHNlFPY0dBYjBDUG9RS3MzQzAw?=
 =?utf-8?B?ZENEQzFvU1JRTnp1QzkxZHlTTnFMVk5tY0JGS1BvMXhxZlUyQXdkNVlPd0s0?=
 =?utf-8?B?NS9KNGhwUCsydWZ3U2x6WFJLZ0F4UkNsRUE2SkYwMENOZVBWR240dHU1RzVW?=
 =?utf-8?B?Q1FWcGh5QnY0QmJYS24wWWgxNEhsQkpPM21OUEkweTkyNHdGTVpwd3gwL0VE?=
 =?utf-8?B?YndIaE8xS0Q5cEhzZzg2VFZjUGUveEw1eUxlQUxxd0pTdkZkcGNNelV5WnlJ?=
 =?utf-8?B?Q3NhcitXODcyT1haK0l4K2VTMG1VS1RwcUlnNk05WXhyTXl4QTJFM3RzeURS?=
 =?utf-8?Q?gqvY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:00:34.1684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f8c597-0b9e-49a8-e4e6-08de4f87756a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6170



On 05/01/2026 12:34, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
> in places across common code. In order to keep the existing code and
> maintain correct functionality, implement the `vmap_contig` and `vunmap`
> functions for MPU systems.
> 
> Introduce a helper function `destroy_xen_mapping_containing` to aid with
> unmapping an entire region when only the start address is known.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> v2:
> - Rename `destroy_entire_xen_mapping` to `destroy_xen_mapping_containing`
> - Improve code documentation.
> - Refactor nested code.
> - Fix ignored rc error code in `destroy_xen_mapping_containing`.
> ---
>  xen/arch/arm/include/asm/mpu/mm.h | 10 +++++
>  xen/arch/arm/mpu/mm.c             | 74 ++++++++++++++++++++++++++-----
>  xen/arch/arm/mpu/vmap.c           | 14 ++++--
>  3 files changed, 83 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index e1ded6521d..1b5ffa5b64 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -111,6 +111,16 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>  int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>                             paddr_t limit, uint8_t *index);
>  
> +
> +/*
> + * Destroys and frees (if reference count is 0) an entire xen mapping on MPU
> + * systems where only the start address is known.
> + *
> + * @param s     Start address of memory region to be destroyed.
> + * @return:     0 on success, negative on error.
> + */
> +int destroy_xen_mapping_containing(paddr_t s);
> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 687dec3bc6..207e8d2d91 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -290,6 +290,42 @@ static void disable_mpu_region_from_index(uint8_t index)
>          write_protection_region(&xen_mpumap[index], index);
>  }
>  
> +/*
> + * Free a xen_mpumap entry given the index. A mpu region is actually disabled
> + * when the refcount is 0 and the region type is MPUMAP_REGION_FOUND.
> + *
> + * @param idx                   Index of the mpumap entry.
> + * @param region_found_type     MPUMAP_REGION_* value.
> + * @return                      0 on success, otherwise negative on error.
> + */
> +static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +    ASSERT(idx != INVALID_REGION_IDX);
> +
> +    if ( MPUMAP_REGION_OVERLAP == region_found_type )
> +    {
> +        printk(XENLOG_ERR "Cannot remove an overlapping region\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( xen_mpumap[idx].refcount )
> +    {
> +        xen_mpumap[idx].refcount -= 1;
> +        return 0;
> +    }
> +
> +    if ( MPUMAP_REGION_FOUND == region_found_type )
> +        disable_mpu_region_from_index(idx);
> +    else
> +    {
> +        printk(XENLOG_ERR "Cannot remove a partial region\n");
Shouldn't this be moved above refcount checking? Do we expect this function to
be called with region_found_type being MPUMAP_REGION_INCLUSIVE?

> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>   * given memory range and flags, creating one if none exists.
> @@ -357,18 +393,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>              return -EINVAL;
>          }
>  
> -        if ( xen_mpumap[idx].refcount == 0 )
> -        {
> -            if ( MPUMAP_REGION_FOUND == rc )
> -                disable_mpu_region_from_index(idx);
> -            else
> -            {
> -                printk("Cannot remove a partial region\n");
> -                return -EINVAL;
> -            }
> -        }
> -        else
> -            xen_mpumap[idx].refcount -= 1;
> +        return xen_mpumap_free_entry(idx, rc);
>      }
>  
>      return 0;
> @@ -418,6 +443,31 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>      return xen_mpumap_update(s, e, 0);
>  }
>  
> +int destroy_xen_mapping_containing(paddr_t s)
> +{
> +    int rc;
> +    uint8_t idx;
> +
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, s, s + PAGE_SIZE,
> +                                &idx);
> +    if ( rc == MPUMAP_REGION_NOTFOUND )
> +    {
> +        printk(XENLOG_ERR "Cannot remove entry that does not exist");
Why do we split sanity checking between this and xen_mpumap_free_entry?
What are the possible region types that xen_mpumap_free_entry is expected to
work with? I thought that it should only be MPUMAP_REGION_FOUND.

~Michal


