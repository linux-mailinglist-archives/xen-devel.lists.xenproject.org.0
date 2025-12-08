Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1871CACC2C
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180335.1503534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXwU-00042y-EN; Mon, 08 Dec 2025 09:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180335.1503534; Mon, 08 Dec 2025 09:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXwU-00040t-BQ; Mon, 08 Dec 2025 09:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1180335;
 Mon, 08 Dec 2025 09:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwXn=6O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vSXwS-00040n-R6
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:54:05 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0a2991a-d41b-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 10:53:58 +0100 (CET)
Received: from CYZPR02CA0007.namprd02.prod.outlook.com (2603:10b6:930:a1::24)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Mon, 8 Dec
 2025 09:53:53 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:a1:cafe::c6) by CYZPR02CA0007.outlook.office365.com
 (2603:10b6:930:a1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 09:53:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 09:53:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 03:53:52 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 01:53:51 -0800
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
X-Inumbo-ID: d0a2991a-d41b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgVYs79N73VVxczyWayq0wY2wfPU3ap2vNN/xrr2CF9fUbBOGt+PJ1gU6hxjbav7qnp9uUjwdYRYZKOCg4W4hEvnJTPhVAiqfIWY9akVc0sxlHeZJqJBXGRPBMhZf2QtgVHO20MwRAuaCzbneyiTlqkkba2Br+M0PzkvTzI5Ra7eRVNS80X69oWd1nv2SPoqBbzbbATcnSMtt0dvUg7Z2UIEl3mJunvZ1lakX134wqYQHDt0gCoKCwNYA6ejsj2epcaoFUzetZCu8GZmSmCWagaQGV6mfg5/PiNuuTuBJeaAJkUXb0CdUkKle1izk15gQO2b0kmzZk0/W4W/RhJBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqAGyUqismXMR9zFHdltjS6gLfxdmQoggg+u9lhVEoc=;
 b=JUUpIT9WhUBusKmM+gzpzH/tsXzyTLYQgISfP6CkZ/ohntMPDsnv8LMVNNST4SI9QuerP/BGTy+Y+lC3LCWMMMPrLryFef7XYR9izAfyZx8R+POkMbGVZLq2ezu/BqDQ10ZcN9uO7E46RNMo1oz8h1ZA1jTtM2X77jBfHf8rYjEsjq2y06/nWWC79H1whkoIRxIXA0EtbzRWuqliZIV9WwybJWdFuyw1mpp26C2+NR3+TrhYHsqSjwMU6EU7LWGPrQ4KnYEcL69OUFYQgKi8xfe9L6j8O2GPVgR3YSNm4n/6bPvqXiipUfy8CE15kjxFJJ5oVafbPy4JkXDrv+5GRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqAGyUqismXMR9zFHdltjS6gLfxdmQoggg+u9lhVEoc=;
 b=EMsJZtHS8lV0uZm7KwAqSeOCQYD8n9WvIpB8bV+wkOWQ85BxzuMQm72lapPUHXdLEpHNuIlFQLTq3VlS3d16hnNp6tnI7cUj9p74Tiyjkq/X1q/GEjJUX6qTZPyw+bUDmcXhHeRn7qLdM6DQrCYvPQ7LT1iGCNxmUCnFhzfSzeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <3c0a4987-81ef-4cf1-a1ad-bd8872a0dd67@amd.com>
Date: Mon, 8 Dec 2025 10:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm/mpu: Implement vmap functions for MPU
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128095859.11264-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e57eced-eb57-42f8-a975-08de363fb207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDJGWlk5TXpqMWJVT0hEQkVjL20wL0JJa0M2MEJmeXdsbDF5QUdoenVzUTg1?=
 =?utf-8?B?RFBpR0ZDN3lvclNmQzBhSHlVekhLM1FzRDZCMHRZdmM0VEF0UjAvOEdYd3Zq?=
 =?utf-8?B?enQxbHJHWUh2TU1NS2Z1Q3Zja1BkWHE1amg5Q0RkNFVubC9sOGNYMHVLTzVm?=
 =?utf-8?B?YmxrVVRkZzdNQ2FBbGlGN1VmT3BpT3ArMGZVSGVyV3dPdExyM2hFbHhoMSts?=
 =?utf-8?B?dVg2TWUrc2J3Uk9vd2RTc0s2ZHdSM08zM0ZMT0lmUThJblk2Q1FMM2kxc2dn?=
 =?utf-8?B?L0FqZjVDUFcvOGN0NFoxOVRMYW9OTVZiSmF4OVY0NndhNmRlSGY0M0tRVjJG?=
 =?utf-8?B?YnlQZFRPTG5iWEhoR1VvZENuNUxtSDlPdVFSRHJHRHV2V2VPcFI0Wnh0Vys4?=
 =?utf-8?B?SlNmajIzak5CbmJIeXVxZ0tYSnV0UDJNS04zeW95S3BoV3F5QVF4bFQvdjBx?=
 =?utf-8?B?R2puRlQ1VFc4djE1TGluSy9TQWIzTWptbjIxM0N6NG1RRi9WSTdSUE13WGxa?=
 =?utf-8?B?QzVqd3FaWHZsQXUwR1hieFpsUDgzWDk4OElremFFUW1aRXRVSXk1WkszbkJF?=
 =?utf-8?B?YmlxdlJ0dnliRTI4T2wxdXcraTRUMHpjc3dpcGpjeERmTVBJSGpwVTF5Q2ht?=
 =?utf-8?B?UW52UVBaK2dVS0QrQnRsczBLbHpIV1BKZy9ZY1ZtSUhSWCsyQmxycHFuZEZM?=
 =?utf-8?B?MEJWK2FpRURXdmc5R0Zab0Q5cEZVQXZXUFVBWnZIdCtFNHc1cEFNcjM4Uk5S?=
 =?utf-8?B?L0JjdjVpU2JpWjRia2I2L085bDdieEFQc0xtbS9leFBRbEZHckdlRU5KcWI1?=
 =?utf-8?B?eWJFWTJxc0dOYlBLWXZsNVpGN1hXeTUrY0RJVzBhKysraWhkY1hvUkVUQXQx?=
 =?utf-8?B?MHlLUXM0WVI1Q3ZTM29NNnJ5K3ZGc09lOVNDa2pTUjIyYnNvZWtXZE9KOVpa?=
 =?utf-8?B?ZkxBdlVzem9tQmJPQitrcUQvS05NUlpLeWl2ODNvSk1RRVduQWl0cnlrYnhJ?=
 =?utf-8?B?eXVGcHFud01GZ05USWtsSlE0VnVpUDdtTHoxUDEzODk3NzZkZTJGSXQzSlQ5?=
 =?utf-8?B?emVtQVBWc3N4WWQ0eTczR1ZwRTk3Y2VTMXNuU21kd0hZb0xQNFBpVTRER0Fh?=
 =?utf-8?B?TEtWKytxSzJOWjBXam9wS1lqTUtXb0dDV05tMWpFK1Y3TUhMWEErODFGZVNP?=
 =?utf-8?B?UjF5UnZzK01SY0FLOEtnckJDalJoWU91MmplZllGU2h5blRyV3F4azd4eTJu?=
 =?utf-8?B?amlIZ29iUmFxclo2eWtuT09yNCtEMGVGSUQvVWppZmpLRXhNUVZQeW55WVlR?=
 =?utf-8?B?dTJpdnZuWTA5SEVZU3ZtS2w5ejc1Z0gxQWNDNUx1cmtkOGt6VE15TURZbldu?=
 =?utf-8?B?Ujd0SVFYSS9mZnl5WkVJL25OYXZ2NXRFdWYxemFJZUw2Sko5ckZHOGlPUDQ4?=
 =?utf-8?B?NlkwUU1QOHJpT3ZTVWVzWmN3SHQ0cTRPb3ZJRUczK0g2aitTMy9MRDBOS1N1?=
 =?utf-8?B?bjBqUi9xUkx6RnlZOStqTm43cDdFWlgzUnhHQTR1Ulp1MVdMMlMybUVRa2xC?=
 =?utf-8?B?RExXM1BDQUtHRHUwNnluWkphWHRpZmZ1RWV0bC92YWNZdGk2TkM5eXJ5eGJr?=
 =?utf-8?B?SmpzNk4wU2d2dklOR20xd2xjckJIWGpDQXROMlJyVWl0cUZHcmlWbG1iTzVF?=
 =?utf-8?B?SmRVMlZ4T0VnRDJ5M2NmUjYzM29CK2pLYkY3QWMvUW5nRnZjQTEvSVZrRjNK?=
 =?utf-8?B?Q1pQcERwKzh0eVF4STU5NUlZdnV3UFdOMUM0S0lvWVlWNWpIV1pVVlB2Y29w?=
 =?utf-8?B?UmhpSENjRDRYY05YaEtXcVNYWWhnSGsxZXIxM1NheU1EazJiOFIwR0ZGeDZo?=
 =?utf-8?B?YVpHUjNBVWxQbE5jTEw2QzhXZWlER1ZrbDJXckJsWXJYOEhQdkRDWmdaRlkr?=
 =?utf-8?B?U3hZZ1Ryd21Pc0Z5aHAyVE1CdlA3OXpmaGR1bXJKQUlESEd3TnJFc01LWXc5?=
 =?utf-8?B?amJnT3pTZDY3b29SLzE4NmJCK2p0Yk4vVlZIUDZzeGlXdVFvTXVYVk5PYVVP?=
 =?utf-8?B?TTBldzJ2aDcwWFlpdVpEYWxmRnJ4dEtuamxnTFpwTUp4dkVmaUViYk16R0Ra?=
 =?utf-8?Q?+gbU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:53:53.0008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e57eced-eb57-42f8-a975-08de363fb207
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002



On 28/11/2025 10:58, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
Just as a reminder, we don't intend to support VMAP on MPU? Asking because it
would otherwise be a duplicate effort to implement only these two helpers.

> in places across common code. In order to keep the existing code and
> maintain correct functionality, implement the `vmap_contig` and `vunmap`
> functions for MPU systems.
> 
> Introduce a helper function `destroy_entire_xen_mapping` to aid with
> unmapping an entire region when only the start address is known.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  xen/arch/arm/include/asm/mpu/mm.h | 11 +++++
>  xen/arch/arm/mpu/mm.c             | 67 +++++++++++++++++++++++++------
>  xen/arch/arm/mpu/vmap.c           | 14 +++++--
>  3 files changed, 77 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index e1ded6521d..83ee0e59ca 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -111,6 +111,17 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>  int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>                             paddr_t limit, uint8_t *index);
>  
> +
> +/*
> + * Destroys and frees (if reference count is 0) an entire xen mapping on MPU
> + * systems where only the start address is known.
> + *
> + * @param s     Start address of memory region to be destroyed.
> + *
> + * @return:     0 on success, negative on error.
> + */
> +int destroy_entire_xen_mapping(paddr_t s);
NIT: I read it as all the mappings which is a bit misleading :)
Maybe something like: destroy_mapping_containing or alike?

> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 687dec3bc6..29d8e7ff11 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -290,6 +290,35 @@ static void disable_mpu_region_from_index(uint8_t index)
>          write_protection_region(&xen_mpumap[index], index);
>  }
>  
> +/*
> + * Free a xen_mpumap entry given the index. A mpu region is actually disabled
> + * when the refcount is 0 and the region type is MPUMAP_REGION_FOUND.
> + *
> + * @param idx                   Index of the mpumap entry.
> + * @param region_found_type     Either MPUMAP_REGION_FOUND or MPUMAP_REGION_INCLUSIVE.
Both of these are unsigned, so why the parameter is int?

> + * @return                      0 on success, otherwise negative on error.
> + */
> +static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +    ASSERT(idx != INVALID_REGION_IDX);
> +
> +    if ( xen_mpumap[idx].refcount == 0 )
> +    {
> +        if ( MPUMAP_REGION_FOUND == region_found_type )
> +            disable_mpu_region_from_index(idx);
> +        else
> +        {
> +            printk(XENLOG_ERR "Cannot remove a partial region\n");
> +            return -EINVAL;
> +        }
> +    }
> +    else
> +        xen_mpumap[idx].refcount -= 1;
You could avoid nesting if/else by doing:
    if ( xen_mpumap[idx].refcount )
    {
        xen_mpumap[idx].refcount -= 1;
        return 0;
    }

    if ( MPUMAP_REGION_FOUND == region_found_type )
        disable_mpu_region_from_index(idx);
    else
    {
        printk(XENLOG_ERR "Cannot remove a partial region\n");
        return -EINVAL;
    }

> +
> +    return 0;
> +}
> +
>  /*
>   * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>   * given memory range and flags, creating one if none exists.
> @@ -357,18 +386,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
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
> @@ -418,6 +436,31 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>      return xen_mpumap_update(s, e, 0);
>  }
>  
> +int destroy_entire_xen_mapping(paddr_t s)
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
So here you are searching for a region that includes at least s + PAGE_SIZE.

> +    if ( rc == MPUMAP_REGION_NOTFOUND )
> +    {
> +        printk(XENLOG_ERR "Cannot remove entry that does not exist");
> +        rc = -EINVAL;
Here you assing rc but ...

> +    }
> +
> +    /* As we are unmapping entire region use MPUMAP_REGION_FOUND instead */
> +    rc = xen_mpumap_free_entry(idx, MPUMAP_REGION_FOUND);
here you would redefine it.

> +
> +    spin_unlock(&xen_mpumap_lock);
> +
> +    return rc;
> +}
> +
>  int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>                       unsigned int flags)
>  {
> diff --git a/xen/arch/arm/mpu/vmap.c b/xen/arch/arm/mpu/vmap.c
> index f977b79cd4..d3037ae98a 100644
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
> +    if ( destroy_entire_xen_mapping(base) )
> +        panic("Failed to vunmap region\n");
Looking at common vunmap() we ignore the return code from
destroy_xen_mappings(). Is it ok to diverge?

~Michal

>  }
>  
>  /*


