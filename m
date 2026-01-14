Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B5D1D851
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:29:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202751.1518193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxBp-0001R3-8v; Wed, 14 Jan 2026 09:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202751.1518193; Wed, 14 Jan 2026 09:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxBp-0001OG-3f; Wed, 14 Jan 2026 09:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1202751;
 Wed, 14 Jan 2026 09:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX2Z=7T=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfxBn-0001OA-4b
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:29:19 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e002d17-f12b-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:29:15 +0100 (CET)
Received: from MN0P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::26)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 09:29:10 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:52b:cafe::63) by MN0P223CA0014.outlook.office365.com
 (2603:10b6:208:52b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 09:28:54 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 09:29:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 03:29:09 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 01:29:08 -0800
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
X-Inumbo-ID: 7e002d17-f12b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPoRQ/ukFhwWAQLeR7E4Vy2EkTt3nXuhhMiQpXCLcM9+PWtX11JSm8R4v0ZveoGmOoaicbQawmmt1UaIUr37r4ea1OYc0SaGEXhEtNTbE2akafB97K8wtTzVUXIfLkeWb/AXQCn9N9iffAMafuKd7PKqMesVuG4KubU/OQHzS8EBucoL4sU05ZDJlPkvx0JHOWBNh+0L2W4stuPHjVD/bupzCsw4W9b8TvjXk9jDtSdAEyC1lxw2bo2VLnptFX9NfnweIqOsmOeh1xc7lfKZOafQSWqU1NsI/Snf93m6i+0DG4piXVci71KjA37BdKkp0B29fAEsS423H8k0s5DAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nOXHkvU6Jz/z5QykMx8MulO4e5olXB2Ki7KhX/hvwA=;
 b=rltQ/o/MlwXBS6zTrxB/MTE1k3/NGvnvexvK4l7hHwZzIU8RV6XYGNtzHtGn/94pjvC0jlVLyQYqrgph7KSZXBeSdWEdeWwU2YGCrI8Tmchnof9Ws8tE/XhqIaBZwZNUdV4gwYLvNnMfJ/UhYP9qlDECkPPn3sB/rzzmwcQQad0LzjKYwApcSrr0WqsLVwkrGaalg6FwZ8/0tuV4NmCIm+926XcYD7TwQv5T2qpN2RgnW+KjKi4lvMMrrvjvaIXLyeTs86IKosqOdab2gXj7/N4Zv5VH3hvPMXsAx2rHSAXmXjr//cAgUL/6B9PdvaRrgnDK8uiYY7f+MXjPRWb5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nOXHkvU6Jz/z5QykMx8MulO4e5olXB2Ki7KhX/hvwA=;
 b=cdDnSoxHtOW7up0zEQC6bfPbUzqpjmrPnrusdiMk+a9dgdZsO6PmmGOkGujb8zPidekNzcf22eqOFSHSYRKUwZ1z8YTKKur4iumn7XGJLwAsXQ/YfThoIlgwCDrtAdfk4zVcpyc3tokvBSPp1IDlWTFX9gxf2MWMRrI1hSYrI0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1cb6fc36-fd16-499b-a616-4d321ae83572@amd.com>
Date: Wed, 14 Jan 2026 10:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm/mpu: Implement vmap functions for MPU
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260113162309.6766-1-harry.ramsey@arm.com>
 <20260113162309.6766-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260113162309.6766-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3a3590-839e-410d-5ac7-08de534f5f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2pPOFdDNTYyQTJ6MDRza0NENGg2T1hBakVDRGgyOEdOOEhSL1VOZGZIY0NC?=
 =?utf-8?B?QkVrUXMwUlAwcC91THo1U0FlWmhiUEhXZWcyd1RxMnhZekNOdXNybWRQeUZi?=
 =?utf-8?B?a2pqUWljUkdlMGk2Nmk1cmpJNGZNVzh4L1FyMFU2UTdqMHR6VkVVd003dlBa?=
 =?utf-8?B?YXc1U1FJNW0xQzRwYlhYT25JY0hUR05YQlg0d0lRRUNjZ3VuU2x2UnNxaDlk?=
 =?utf-8?B?M1NnTXVEK1VxQXNQQ1pqYUU3K0U5dnNsTSt0QXg0azc3YjNnWFZLNXFqbGtP?=
 =?utf-8?B?RFNNbUY2a3k3ak1PQXRNSEJBdXhUU2FTMVB5MFJ1L05QdGN1cU9UcS9nTDVQ?=
 =?utf-8?B?MmNZUGJtMm5jRkxHeHdvUnJXdVE2SzJROEx6VjB1SkVlTlBaeWdBajJsU2pL?=
 =?utf-8?B?ajB4WTZLTHRrSHJXSkdTc0ZaeVFOZHM3ZjdUTDA3UGFjSnNuaWxxM0JRQ3ZR?=
 =?utf-8?B?Rzd5aXUvVkc2dEZ3Q1l2ODZtbmp5cXM5QkhTMjdNYXR1SytaK2ZZQ3pydUtI?=
 =?utf-8?B?WDJVY0JmMmRsdnBiYlJkRmE5aHhqbnllaGV6RTdwa1J3UERKL3VnR2tWOU8y?=
 =?utf-8?B?SlMweTA3YVhsSmRQT1VYeU12SGZ6aURGUE1rS2wxUVYrVXdBQzZxRmpWRXdP?=
 =?utf-8?B?S2hnaSszQ2tNVzR6aDBhR0hUcFg0Y1hUSWVYbXdrSXdTNVNlNDRueW16TDkx?=
 =?utf-8?B?WmpaVjBkNTZRY3R0a3cyYjJseWVyMERhMmVoaXRlaFFDYkI3UVMzamhzUTRB?=
 =?utf-8?B?RVJ5SHFkSWorN2NwQzBVRHRwdkhYSXArZnZMQjM0d204TkNOaVAxaFd1SU0v?=
 =?utf-8?B?d3JsN1lDM0JhdUMrSmZ6Mmp0ekpDVHY5RVRRa0xxREJLSzU0dTZ1eFZ5aXRV?=
 =?utf-8?B?Um95S3F6OGpDZ0VJS21ieVVYdnc4QzBnTFRNaWlXRFhkQzUralZkZ3J0Y1Rn?=
 =?utf-8?B?cXJ5cHorZGpsNk9OeWkzelVZUXYxbDAwN2owaG9kUlNKSlVtUFBCYTNsL29Z?=
 =?utf-8?B?aEJIeWtBYjdMRVZBK1BKQWJSR09iMkNDYUJweTRVQjIzSjRyRDhiVVpsUENQ?=
 =?utf-8?B?eit0SGh3Yi9zQ2pYVkRZcUpxN1BqZG5jZlBIcEk0RjNSdGFIZjJLT0x6YTA4?=
 =?utf-8?B?dnJhUFlDT1J1dVo4SnBQVUdMVzM1amZORk5CSTVsK3RBZHl3eHVBOFM1TExH?=
 =?utf-8?B?c3ZqeHA5MmFkUXhRT21CMFQ4TW5NV0pCZkdjQWQxYU9SK1Z2Ykh0cUh1VmpQ?=
 =?utf-8?B?cWhBMXhzUENuTG41WFR1SzdoTWZPdFRIRDRhYmY3MFBmbEtXRmphNDVTaEdu?=
 =?utf-8?B?aGUyeGFLV1JaTElVTldNZngzZG1LaTlveWd3UlVGUEpoL0hjVHRzV3JOR3ZV?=
 =?utf-8?B?ZzNzNjYxNithZWJmRVlna1V6SENFWSsxZ1J6c2p2MUdaMk9RWFJOc0RkR01w?=
 =?utf-8?B?VWt4WDZjVWg1cGdRWXM5VmJKRzRDSDlrOEJmcUdMNUpLRlFKa2h4NHEzYjJE?=
 =?utf-8?B?SXk4bFBaM2puVGFMdDFQWmpTTW5EV2lYQ3JoYzVHY2E5ZnRwTlkremNZM3FS?=
 =?utf-8?B?NlBqNElEbDl6bytBT0dOdDJ6UVdFclg5MU5udHcvU2g4enZ2N1R3WXNjN0x4?=
 =?utf-8?B?WlIvaE9scHp0d1pLdXlWeGJVVTN6N01lZ01rSzZNTGY3K2U2Z3VubWhrOW1W?=
 =?utf-8?B?SW5WWUQyVzVwL3V3UHBNN3hJN29pQVRHTW5GSDZKVXU0V0x3Y0RobXc1bFRi?=
 =?utf-8?B?QVg5K3ZyMnlFUHNoOE9ON011c0J1SDFwR2MxTWtRa3lnWnRQV25yS3JUTzM5?=
 =?utf-8?B?Slc2Y3VxdHpZSFBjVjhiK0JqeU1aSUdxSW9FQ1NLOWZZdVVzWm90RWtVbm9z?=
 =?utf-8?B?bEh4UzM1Ni9icnFUUlBmd3pOcE5ZdzdMSkRWY3QxZVprL2RCaVRkR2o1dmRl?=
 =?utf-8?B?N3o2L0tvNzQyNWphbVRXa3F2V0gySWxybjRJRkZveGpCNVZ1M2x4ZE1pNTF0?=
 =?utf-8?B?eUlqLzlXbElVbzBZZUNIQS90SGsweU1XNktXRXFIajF5Y2RXOUc5aERIRWlD?=
 =?utf-8?B?aS91dUV3TVBlOEptSVF0a0ZTVzJJZ3E5Q1g3c3ZtcU9ueWRNZEdaRmQ2OGJk?=
 =?utf-8?Q?lI2M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:29:09.8445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3a3590-839e-410d-5ac7-08de534f5f42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013



On 13/01/2026 17:23, Harry Ramsey wrote:
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
> v3:
> - Add additional comments for clarity regarding MPUMAP_REGION checks
> - Ensure `context_sync_mpu` occurs after `destroy_entire_xen_mapping`
> - Fix deadlock if `destroy_entire_xen_mapping` is called with an address
>   that does not belong to a region
> v2:
> - Rename `destroy_entire_xen_mapping` to `destroy_xen_mapping_containing`
> - Improve code documentation
> - Refactor nested code
> - Fix ignored rc error code in `destroy_xen_mapping_containing`
> ---
>  xen/arch/arm/include/asm/mpu/mm.h | 10 ++++
>  xen/arch/arm/mpu/mm.c             | 82 ++++++++++++++++++++++++++-----
>  xen/arch/arm/mpu/vmap.c           | 14 ++++--
>  3 files changed, 91 insertions(+), 15 deletions(-)
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
> index 687dec3bc6..14a988ea0c 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -290,6 +290,43 @@ static void disable_mpu_region_from_index(uint8_t index)
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
> +    ASSERT(MPUMAP_REGION_OVERLAP != region_found_type);
> +
> +    if ( MPUMAP_REGION_NOTFOUND == region_found_type )
> +    {
> +        printk(XENLOG_ERR "Cannot remove entry that does not exist\n");
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
> +        return -EINVAL;
> +    }
NIT: Try to limit the number of if/else blocks to make the code read better.
Here you could do the following to remove one else:
    if ( MPUMAP_REGION_FOUND != region_found_type )
    {
        printk(XENLOG_ERR "Cannot remove a partial region\n");
        return -EINVAL;
    }

    disable_mpu_region_from_index(idx);

    return 0;

> +
> +    return 0;
> +}
> +
>  /*
>   * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>   * given memory range and flags, creating one if none exists.
> @@ -357,18 +394,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
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
> @@ -418,6 +444,38 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
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
> +
> +    /*
> +     * Since only entire regions can be freed using `xen_mpumap_free_entry` we
> +     * must first check the region exists.
> +     */
> +    if ( MPUMAP_REGION_NOTFOUND == rc ) {
Bracket should be placed on its own line.

> +        printk(XENLOG_ERR "Cannot remove entry that does not exist");
> +        rc = -EINVAL;
> +        goto out;
> +    }
> +
> +    /* As we are unmapping entire region use MPUMAP_REGION_FOUND instead */
> +    rc = xen_mpumap_free_entry(idx, MPUMAP_REGION_FOUND);
> +    if ( !rc )
> +        context_sync_mpu();
> + out:
> +    spin_unlock(&xen_mpumap_lock);
> +
> +    return rc;
> +}
> +
>  int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>                       unsigned int flags)
>  {
> diff --git a/xen/arch/arm/mpu/vmap.c b/xen/arch/arm/mpu/vmap.c
> index f977b79cd4..54d949e7ce 100644
> --- a/xen/arch/arm/mpu/vmap.c
> +++ b/xen/arch/arm/mpu/vmap.c
> @@ -1,19 +1,27 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
>  #include <xen/bug.h>
> +#include <xen/mm.h>
>  #include <xen/mm-frame.h>
>  #include <xen/types.h>
>  #include <xen/vmap.h>
>  
>  void *vmap_contig(mfn_t mfn, unsigned int nr)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    paddr_t base = mfn_to_maddr(mfn);
> +
> +    if ( map_pages_to_xen(base, mfn, nr, PAGE_HYPERVISOR ) )
> +        return NULL;
> +
> +    return maddr_to_virt(base);
>  }
>  
>  void vunmap(const void *va)
>  {
> -    BUG_ON("unimplemented");
> +    paddr_t base = virt_to_maddr(va);
> +
> +    if ( destroy_xen_mapping_containing(base) )
> +        panic("Failed to vunmap region\n");
>  }
Looking at this series as a whole, at the end we will end up with
vmap_contig/vunmap to contain the same implementation as map_domain_page and
alike from the last patch. Shouldn't we define ones using the others?

~Michal


