Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1108CC272
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727700.1132328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mM9-0006cB-Ph; Wed, 22 May 2024 13:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727700.1132328; Wed, 22 May 2024 13:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mM9-0006Zg-N0; Wed, 22 May 2024 13:50:13 +0000
Received: by outflank-mailman (input) for mailman id 727700;
 Wed, 22 May 2024 13:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzQV=MZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s9mM8-0005ZK-PA
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:50:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e88::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3422bd5e-1842-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:50:10 +0200 (CEST)
Received: from SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::18)
 by IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 13:50:06 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::4a) by SJ0P220CA0027.outlook.office365.com
 (2603:10b6:a03:41b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 13:50:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 13:50:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:50:03 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 08:50:01 -0500
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
X-Inumbo-ID: 3422bd5e-1842-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amuv4wdsOd0sQpS08Rb1xjpPkiy2ChXfbTPI2Z+9am+dtdjwGD7h2S3xp22oQUOFeWb7GNbxSyW+ThABmS+lv/0vmfjqSRh/TFsThFUlSOSopq2Y7UCYc1CQE7rdrPAnAyDHGh6zgCc/C57KFeqcKzOFwXW/l6LhdShzEcX649OVs5L5x7X7mjoNJSFlk1AaltlI0KXCKR9cNOZN3VNWowpUZFjUYzBolIgtRju1nR5XE13vn0hQOSMxxofnNEO9s5O+1Hn4yecVDTeI8JyZkoy6cQ8BdmMQGwAa98dWKdtGGLQjY5B46MW9z6lQqJuRdChaMo5EhGRWnZa4QL7X7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpin80pWJf11sF4u2kqwI0Qs5OSeNVouPFEGB027mxw=;
 b=cjuNP/0yLYobKyTZ7DUaGHCnxJUinLiCu0ar5Ix5dQ/VhO71EqwFw7HMfH+Kx2zDRXBAhco4qvohnM6R8rq50HhAIrzBK8A+ZQWz3WCjS+Op1olXNUuwBh0Yq3Xdh6fssWVq9AVJj8yPGl0Ce8xOuZZyBWZDPfORo9Vecigr/tQ/lGIf96vKwl3sqIBOiz3AT1owbEJE8sTAy8YYlVBiPK/AMYVgmi6r43cK5Pb8onAT1QqO8yCDsS0k1o1L0UXqs94kTbFDo3SZ/snJjdq67G3xulbzOJ2DK2y33SUYJVbaNErGS4TmIehA2eeSd+hSwwhfVHBCOHjckkv6cpK34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpin80pWJf11sF4u2kqwI0Qs5OSeNVouPFEGB027mxw=;
 b=HaJpHjuxvlDW8mLazGpZqxtEjauTjyc5G+pbSGx4xXr1hTpzZymnR3djt/dfuZZp2o6uExNBMJkCFveFifZqJi0wRTnwUD3LBBPnwlUjDdYg9o0W/SVbVaSJNOAwr8OxXTM1RftcXVCG1V3GhFSkJCZXr1cxckv4jdDPhvW2xoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5a339b77-0ce6-4670-9e79-99be5ac48bb2@amd.com>
Date: Wed, 22 May 2024 15:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] xen/arm: Parse xen,shared-mem when host phys
 address is not provided
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
 <20240522075151.3373899-5-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240522075151.3373899-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|IA1PR12MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b2ef37-de84-4956-f930-08dc7a661659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU9jZFdhQ0wyc2h3cW1VbFJsYVB4eTdLdnZ4Y3ZadUtBRUh6M1NwQnpzZEZn?=
 =?utf-8?B?OUphQjdINUluSTBoTnFJSnJLWHIwSW1EdktYWFhMSUp1RUJJWkVUaGZBdjVZ?=
 =?utf-8?B?cWNORzgvdDZnQjB3SjQ0cmdQNzVMdENBeDJTMXRLU25wbzlVRVh5RzFEKzhW?=
 =?utf-8?B?QWdZdWhROGpZT0l4Zk5GYkNuWnNWYm9tUWJxT3BOZVN0eGM2VUIxSUlsK3hB?=
 =?utf-8?B?aVo3RlJMcXNrUGlaVkNVekNlbGZQWWZHNmxsbzhBakFNUnFLRFF2VzF2OERL?=
 =?utf-8?B?ajVUTE9jWElCMENGYzVTYWVNVnhEWjAyRExiRGkvK21vRnpQam1sb1NoaGQv?=
 =?utf-8?B?S0pHKzJJejhueHRCbXBVS3RiSG9YR1kweGpuQmdsdnNkaE84SmJJZytVU0tt?=
 =?utf-8?B?ZzJFVUZ2NFNVUHYwR3pSVW1hVkgzNHJuZlBzR25oNGFIZmE3bk9jb2ZjbFJp?=
 =?utf-8?B?dWVOb1hXUnM3a1MxM21NbHF6b0tsY2pCYVp5Y05lTDQ0cnZocDdNOTdieExa?=
 =?utf-8?B?dW11MFp6cFVlUHlmZWw4WjVSZUN5ZmRTZEk1U0pVZGU0UVMzd0M1VWkzaWhX?=
 =?utf-8?B?UXNlVUI3aUo4R0RyYkFrVzJFS0hVQmNxVW9rN0JmMVkxdndEdWFWeXpwdEV5?=
 =?utf-8?B?VElmaXV2MFhocDVScDBxV2ZqT01pYlhhdTZpK2ZMZHg4aTdKdWZDcFNWemkx?=
 =?utf-8?B?SjVFQS9YQ2cyVlVvVFVJemFFTXFtTi9FUzJTT3hGdXVacy9LSWkxS3J6V2xl?=
 =?utf-8?B?MVpOcG1OVEhIdnkrWEkvTEpxYU1uOC8yaGd2S0FLazY4VElsdkRtNVFod2Ja?=
 =?utf-8?B?QUlLMDFFc1hWdTRvNVkwVkprdGRZeU55OThFbmdubzFOY0hCcWNaTUJ6cG1v?=
 =?utf-8?B?V3o0anZZR2VobW00KzFFVnAyaUk4RGNUYmNHbEFFTVhBZm5ZMytiM1owYlFL?=
 =?utf-8?B?czg0VzlrQlVKdFQ1K2tBNlkxREdTWmNya0dPalRWcUw0VWNjS0hWNUtZSmNZ?=
 =?utf-8?B?ZXUydWtNaDdXblZCbHRBMzVIQkdWMGNyMGlZUEJtY3lDcllyOWdObmhyaVpP?=
 =?utf-8?B?RGhqYml1S1VCOFV2bnoxMDJyVXdwQW9GK01pMGp1ZVZZTCs5RWdGUWVjVjBU?=
 =?utf-8?B?amRhL05TL1hBYXMxNHQwOUxlK2lTRHk2V3E5UUdINE9ZakN0QnRzRWNKQlE5?=
 =?utf-8?B?eWNSUVdmSTNERUJpdWkydkZ5c3F6c2VuVXZSVVNFQnZRWGRUay8yRDNPUkla?=
 =?utf-8?B?bmdQbThDUzU0ZG9OWk10cllEaVJLV3lCOWRIaTIwS203VGtDaU1Ua0hrbURQ?=
 =?utf-8?B?dWd5amwxckw2MVZWbGkrWVJwNWtXOEV1Q1owaXRZbXVDeFlob3NsSlNVckJ4?=
 =?utf-8?B?ZXllY1R2SlY0UGUxa3hMN2kvYVFpYng0STBtRkM0clp1Z05LdlFFeU5TTEh5?=
 =?utf-8?B?b3FUdkFXLzBZMVJWSjQzNVdRY1VtOC8wQ1E2aW0zbEdaaHVGVWo4OXBnZ2ky?=
 =?utf-8?B?aE1SMVNjNmhNVHA1QmJDd0RZZ1NISlA3bkZYZU43QWtrdTIrSXRrZUpxMU0r?=
 =?utf-8?B?WkgvU3ZYL1lkRHFiSDE0WWRSa0RvRDFnY3RXYWprajBNMlpqREo4ZkFtdEpi?=
 =?utf-8?B?VDJXTDNqem5zVFYxaWlISW1JVXpTbjdsU0FQaFF3NnZiNHhZWDFhWWU3OHE1?=
 =?utf-8?B?NDNGdGpLaXBPTjZEN0RwbXVuWUFFWlZzcGp1Z05RSHY1QUJyU0R5dkc5OGJv?=
 =?utf-8?B?eWhmOUhzcGxwZ2RsQjdaSEs0VmJzSGZZMWhPS1VmalhtL2thU1FMT083clRO?=
 =?utf-8?B?dXp6ejh3S3JOemhhL0VQcGE0OTJlcGJxRjJqZ2M4UjJnenhxZ3huQXdxRHVq?=
 =?utf-8?Q?k/cZXylDZOx5b?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:50:05.8140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b2ef37-de84-4956-f930-08dc7a661659
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8467

Hi Luca,

On 22/05/2024 09:51, Luca Fancellu wrote:
> 
> 
> Handle the parsing of the 'xen,shared-mem' property when the host physical
> address is not provided, this commit is introducing the logic to parse it,
> but the functionality is still not implemented and will be part of future
> commits.
> 
> Rework the logic inside process_shm_node to check the shm_id before doing
> the other checks, because it ease the logic itself, add more comment on
> the logic.
> Now when the host physical address is not provided, the value
> INVALID_PADDR is chosen to signal this condition and it is stored as
> start of the bank, due to that change also early_print_info_shmem and
> init_sharedmem_pages are changed, to not handle banks with start equal
> to INVALID_PADDR.
> 
> Another change is done inside meminfo_overlap_check, to skip banks that
> are starting with the start address INVALID_PADDR, that function is used
> to check banks from reserved memory, shared memory and ACPI and since
> the comment above the function states that wrapping around is not handled,
> it's unlikely for these bank to have the start address as INVALID_PADDR.
> Same change is done inside consider_modules, find_unallocated_memory and
> dt_unreserved_regions functions, in order to skip banks that starts with
> INVALID_PADDR from any computation.
> The changes above holds because of this consideration.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> v3 changes:
>  - fix typo in commit msg, add R-by Michal
> v2 changes:
>  - fix comments, add parenthesis to some conditions, remove unneeded
>    variables, remove else branch, increment counter in the for loop,
>    skip INVALID_PADDR start banks from also consider_modules,
>    find_unallocated_memory and dt_unreserved_regions. (Michal)
> ---
>  xen/arch/arm/arm32/mmu/mm.c |  11 +++-
>  xen/arch/arm/domain_build.c |   5 ++
>  xen/arch/arm/setup.c        |  14 +++-
>  xen/arch/arm/static-shmem.c | 125 +++++++++++++++++++++++++-----------
>  4 files changed, 111 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> index be480c31ea05..30a7aa1e8e51 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -101,8 +101,15 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
>      nr += reserved_mem->nr_banks;
>      for ( ; i - nr < shmem->nr_banks; i++ )
>      {
> -        paddr_t r_s = shmem->bank[i - nr].start;
> -        paddr_t r_e = r_s + shmem->bank[i - nr].size;
> +        paddr_t r_s, r_e;
> +
> +        r_s = shmem->bank[i - nr].start;
> +
> +        /* Shared memory banks can contain INVALID_PADDR as start */
> +        if ( INVALID_PADDR == r_s )
> +            continue;
> +
> +        r_e = r_s + shmem->bank[i - nr].size;
> 
>          if ( s < r_e && r_s < e )
>          {
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 968c497efc78..02e741685102 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -927,6 +927,11 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>          for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>          {
>              start = mem_banks[i]->bank[j].start;
> +
> +            /* Shared memory banks can contain INVALID_PADDR as start */
> +            if ( INVALID_PADDR == start )
> +                continue;
> +
>              end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
>              res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
>                                          PFN_DOWN(end - 1));
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index c4e5c19b11d6..0c2fdaceaf21 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -240,8 +240,15 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>      offset = reserved_mem->nr_banks;
>      for ( ; i - offset < shmem->nr_banks; i++ )
>      {
> -        paddr_t r_s = shmem->bank[i - offset].start;
> -        paddr_t r_e = r_s + shmem->bank[i - offset].size;
> +        paddr_t r_s, r_e;
> +
> +        r_s = shmem->bank[i - offset].start;
> +
> +        /* Shared memory banks can contain INVALID_PADDR as start */
> +        if ( INVALID_PADDR == r_s )
> +            continue;
> +
> +        r_e = r_s + shmem->bank[i - offset].size;
> 
>          if ( s < r_e && r_s < e )
>          {
> @@ -272,7 +279,8 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>          bank_start = mem->bank[i].start;
>          bank_end = bank_start + mem->bank[i].size;
> 
> -        if ( region_end <= bank_start || region_start >= bank_end )
> +        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
> +             region_start >= bank_end )
>              continue;
>          else
>          {
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index c15a65130659..74c81904b8a4 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -264,6 +264,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          pbase = boot_shm_bank->start;
>          psize = boot_shm_bank->size;
> 
> +        if ( INVALID_PADDR == pbase )
> +        {
> +            printk("%pd: host physical address must be chosen by users at the moment", d);
> +            return -EINVAL;
> +        }
> +
>          /*
>           * xen,shared-mem = <pbase, gbase, size>;
>           * TODO: pbase is optional.
> @@ -377,7 +383,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>  {
>      const struct fdt_property *prop, *prop_id, *prop_role;
>      const __be32 *cell;
> -    paddr_t paddr, gaddr, size, end;
> +    paddr_t paddr = INVALID_PADDR;
> +    paddr_t gaddr, size, end;
>      struct membanks *mem = bootinfo_get_shmem();
>      struct shmem_membank_extra *shmem_extra = bootinfo_get_shmem_extra();
>      unsigned int i;
> @@ -432,24 +439,37 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>      if ( !prop )
>          return -ENOENT;
> 
> +    cell = (const __be32 *)prop->data;
>      if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
>      {
> -        if ( len == dt_cells_to_size(size_cells + address_cells) )
> -            printk("fdt: host physical address must be chosen by users at the moment.\n");
> -
> -        printk("fdt: invalid `xen,shared-mem` property.\n");
> -        return -EINVAL;
> +        if ( len == dt_cells_to_size(address_cells + size_cells) )
> +            device_tree_get_reg(&cell, address_cells, size_cells, &gaddr,
> +                                &size);
> +        else
> +        {
> +            printk("fdt: invalid `xen,shared-mem` property.\n");
> +            return -EINVAL;
> +        }
>      }
> +    else
> +    {
> +        device_tree_get_reg(&cell, address_cells, address_cells, &paddr,
> +                            &gaddr);
> +        size = dt_next_cell(size_cells, &cell);
> 
> -    cell = (const __be32 *)prop->data;
> -    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
> -    size = dt_next_cell(size_cells, &cell);
> +        if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
> +        {
> +            printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
> +                paddr);
> +            return -EINVAL;
> +        }
> 
> -    if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
> -    {
> -        printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
> -               paddr);
> -        return -EINVAL;
> +        end = paddr + size;
> +        if ( end <= paddr )
> +        {
> +            printk("fdt: static shared memory region %s overflow\n", shm_id);
> +            return -EINVAL;
> +        }
>      }
> 
>      if ( !IS_ALIGNED(gaddr, PAGE_SIZE) )
> @@ -471,39 +491,64 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>          return -EINVAL;
>      }
> 
> -    end = paddr + size;
> -    if ( end <= paddr )
> -    {
> -        printk("fdt: static shared memory region %s overflow\n", shm_id);
> -        return -EINVAL;
> -    }
> -
>      for ( i = 0; i < mem->nr_banks; i++ )
>      {
>          /*
>           * Meet the following check:
> -         * 1) The shm ID matches and the region exactly match
> -         * 2) The shm ID doesn't match and the region doesn't overlap
> -         * with an existing one
> +         * - when host address is provided:
> +         *   1) The shm ID matches and the region exactly match
> +         *   2) The shm ID doesn't match and the region doesn't overlap
> +         *      with an existing one
> +         * - when host address is not provided:
> +         *   1) The shm ID matches and the region size exactly match
>           */
> -        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
> +        bool paddr_assigned = (INVALID_PADDR == paddr);
Shouldn't it be INVALID_PADDR != paddr to indicate that paddr was assigned? Otherwise, looking at the
code belowe you would allow a configuration where the shm_id matches but the phys addresses don't.

~Michal

