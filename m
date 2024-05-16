Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F264A8C777B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723316.1128060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7b1t-0002Ma-2O; Thu, 16 May 2024 13:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723316.1128060; Thu, 16 May 2024 13:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7b1s-0002Ji-Un; Thu, 16 May 2024 13:20:16 +0000
Received: by outflank-mailman (input) for mailman id 723316;
 Thu, 16 May 2024 13:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yDT=MT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s7b1r-0002Jc-6b
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:20:15 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06e02175-1387-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:20:13 +0200 (CEST)
Received: from PH0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:510:5::9) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.30; Thu, 16 May 2024 13:20:06 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::be) by PH0PR07CA0004.outlook.office365.com
 (2603:10b6:510:5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 13:20:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 13:20:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 08:20:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 08:20:05 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 08:20:04 -0500
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
X-Inumbo-ID: 06e02175-1387-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YweDm7nwuT1PqW36+eplneGvOibIh+WnWhiccyWRsrKEI3gfdzKYPmLQLSl1Tsa/K8Aci61wbVm7824isAu1L6gnnRuJZmUaXb7L0jQ6pQNJHj3A6L3Tq8PoNCdc1hsNVcZdg0IIn63c8hOwMrWYc0edQ8W/HF1ISFf+Eccxv5syj44A8/H/s/9ghPZq0oWlNZ+B5X/d/FcdySD6SJAaBROKxjaeaHwfKV1c6kHVPOL3JiIGBF1bkeXRDykIcLr+CfJCrFF4Fp6nMAKmGJWRICvsjeWI7SzgMxJdmFjk180NpuMd17PXxszOmllRORrAVotFvzF7rvL4YMrMrAB1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQNxe9XW3c06hYbC2BOFWXBtWoD/EIj0yaL3VUHYHVM=;
 b=JqNJlkE3zoDKL7q6/zr4cls9nUtoE3zPZrEoAZaUqw1/glsw3N7+VUv5PypJx+GfHGLbZ3nPXQKZ7iwPBL8I1gq7CQRv3KSWIpS3UXelB4PDNzdJ/19fVc6+V6T5+a0qYp+S4YMWX4dkdAn/DQ+kZhPUnNs7ekIP7MJ9RNNyIvkpY/ZxTUdBynSps/FCZg7siLW55jdpSPv9Vj2wbmVrPL5F3o5ZRN8ayL4nRjZdUu62NNOEQ8KFDXwG4WC35QHI3UHA9ZuGsKJGGerWOcsVS0oLO2jkeQapipiw6Fk2ZT/sdhM8ESe2ifCjO1PKKEmt5dn/JJbr5qeDn1HblR1NoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQNxe9XW3c06hYbC2BOFWXBtWoD/EIj0yaL3VUHYHVM=;
 b=Sr5mt5a34+BZITsmo2ezOplNwyH/UhNInulMkRdkHFVQ/gPMk/Z3lssu/07ltGl3U4C2y/SAgptBCdkRIxlsD8I9tSPNTyYz5cLETyYB6qd440vJZowqv1X+gmEfEXJDUhiLDnCoPXSvUxajaZlupr89B0yd4e2UuFf9ARTgOz8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <854f4353-6a02-48a1-99f3-0ce65950e790@amd.com>
Date: Thu, 16 May 2024 15:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/arm: Wrap shared memory mapping code in one
 function
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-3-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240515142626.3480640-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 6391f37d-94f1-4428-26bc-08dc75aae702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDlMYjlYUysvUjNZNXRaMXVqSVBOQ2J5Q2x5eU52cFJQWEF0aHVEZktjbW4v?=
 =?utf-8?B?VE5SOFFTdUsxVkJtUEd3NVBwOTQ3YVpLaTBaSU52Zzg0dTl2T0hXVkRLb0FF?=
 =?utf-8?B?WUhONnNLNUZSSGdUWHhzL1lnM0NiS1lIODkxYWQyUnFGSjRUM2FsU0ZSQU9M?=
 =?utf-8?B?SGlBdUhMaXFPUEkzS0pCRG1pMzdxRGZ1MXpvUEhIWWkzUDk5Nkt5Wk44QnFD?=
 =?utf-8?B?a0swaDk3VGswaWhaSDkwMVNYMFdwaGN4R1hpcWhRbmVYUDk4emZLSTlCYTU2?=
 =?utf-8?B?OXZCaXJ2aHJsK1hOSFh0TlN2Z0RtemcxcFFDK1FLZy9VZkZkcjNEeEgzMkZY?=
 =?utf-8?B?UUZZdGpNVFlzczlkY0xCMTFRZkhGV2k5ZmVUUlR2em94RjNGR1BOMHBmYlJO?=
 =?utf-8?B?SW9rTDVGTjhIR0RuQXNTVm80UmpJN3MySHpEQ0tOV0Zxdm9uK3B5NncrMmpl?=
 =?utf-8?B?UGdUS0Q4SjdtWWF6eStxcXpUUXRmY0ZTYUtxVGRIck5VRmsxeHpGOWd1bndP?=
 =?utf-8?B?Uy9YMGpIN0lEeWNZMkZVUkhDM1ZqeHlIUmVoaUk5NTBSc2tHeVNvRzl3NmNm?=
 =?utf-8?B?VTFBVHVDa2lOZHp1SXlVbzBXWmRjZnVuVzVoT2Q3c0p5SDZBU2NMV3g0L1hx?=
 =?utf-8?B?SEZvZmpnNlZxRFplaVltQjdjMjBtMlRzTEp3NUg1R3NYbTZONzRUa3dUM0FR?=
 =?utf-8?B?cCtHdFJ4a1JaSmFXZGZRS0xvM2t5Nkp3Z3ZKV1lRNlZGSUdzRldGUWUybzc2?=
 =?utf-8?B?OTNUcnlEWC93NUxSN3ZDT1V4ZHFaL3lJWk1KSHIwT1RnV3U1RUJPNm44dUZw?=
 =?utf-8?B?RmpML1AzbDZMMTVwSXkyQTl3dlIwWW5mWWI2K1BDSWQzZ3NwM0FkY1RmNUkv?=
 =?utf-8?B?ekVSWUdIWHA5ejViY3VwTnRhbEJpZW5WZXFjZDQ2MEJCZjBNeThvUHB3WlZn?=
 =?utf-8?B?Y1hDTTIwbU8xblpHWnNZcm13RjJDTGc1SUp5WENEMm1Td3NmbXNPMmx0UjVy?=
 =?utf-8?B?RDAwYmdoaXM5WDdIMFVGb3o1VXRSdVhiUU15U0NGSlI1b2NsZko4YmxhNUtk?=
 =?utf-8?B?dGtLNzAyUnF6OTJqSk9DQndBd1VKV0h1aGVHVlFYczI2b0JrQlZEZzJFRjBB?=
 =?utf-8?B?ZzdiTlBZeHJBbTFYRU1OMFRyR2xqZDc2dGdseGpGMW9Fdjc5dVk0bjZyYUhX?=
 =?utf-8?B?TVNqdW5PM0ltTmdDZTMrYzVGZ0tSbytocHNTSUdYY3o1aHZOUTZReDBDa2U5?=
 =?utf-8?B?alJTejFWUzZoUjNvbGpBKzJEWXVTQVdJNmZMd0FmaDhOZjlzZTBtVVNhTHRG?=
 =?utf-8?B?clN1a0krcWx4d0hQREwyZEdUZkJmSzU2VzIzUG9wWEJpaHBlTlZtZlRZRmpD?=
 =?utf-8?B?RXFCMng3NUdnMkJpcDFxZVJJTzEwaFc0dkp3b0NiNEV2NTBFYUNhL3cwbmlO?=
 =?utf-8?B?cUFWZ1MrbVJVODdhc0dTdEQzNTRrMDZhaVNFcGREM0QzSUdRRk01VWpKZlJC?=
 =?utf-8?B?NDI1YWRCSEVJMit0bXB5SUp6L2xBMHVhKzNjQUlqdUc3WVNKbkZ1eEVCQ0xh?=
 =?utf-8?B?V1ZwUFBIRzNDdWpvbFVVNTh5a09zWXhwbTIxU3JFZmtYUEQ3VzJuRHZHYzcx?=
 =?utf-8?B?RjJCaDFtRjk1QUVxclNqRC9vVnZlc0w3V3dBbCs3bEpSdEN1dnREUGhOdXlH?=
 =?utf-8?B?d0xoT0w3bFU4YnYzMzU0K3VTbHhqWDlyYWcwUHpHaE5qeGo1UWE1Rjk3UVl3?=
 =?utf-8?B?L2orRElLVW03VzZGQ1JjNmw4eE1zNjdVOFRrZlV3R1BiWGFLZ3BaNU54cTQ4?=
 =?utf-8?B?MXdlTHhEb2JyckZoNHQ4YVEzWEFLZkZwV3lsdWZkUUt6NU1VQ3Y3NE1TRmps?=
 =?utf-8?Q?6qieWnCCz+3u1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 13:20:05.9710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6391f37d-94f1-4428-26bc-08dc75aae702
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071

Hi Luca,

On 15/05/2024 16:26, Luca Fancellu wrote:
> 
> 
> Wrap the code and logic that is calling assign_shared_memory
> and map_regions_p2mt into a new function 'handle_shared_mem_bank',
> it will become useful later when the code will allow the user to
> don't pass the host physical address.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2 changes:
>  - add blank line, move owner_dom_io computation inside
>    handle_shared_mem_bank in order to reduce args count, remove
>    not needed BUGON(). (Michal)
> ---
>  xen/arch/arm/static-shmem.c | 87 ++++++++++++++++++++++---------------
>  1 file changed, 53 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 0afc86c43f85..8a14d120690c 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -181,6 +181,53 @@ append_shm_bank_to_domain(struct kernel_info *kinfo, paddr_t start,
>      return 0;
>  }
> 
> +static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
> +                                         const char *role_str,
> +                                         const struct membank *shm_bank)
> +{
> +    bool owner_dom_io = true;
> +    paddr_t pbase, psize;
> +    int ret;
> +
> +    pbase = shm_bank->start;
> +    psize = shm_bank->size;
> +
> +    /*
> +     * "role" property is optional and if it is defined explicitly,
> +     * then the owner domain is not the default "dom_io" domain.
> +     */
> +    if ( role_str != NULL )
> +        owner_dom_io = false;
> +
> +    /*
> +     * DOMID_IO is a fake domain and is not described in the Device-Tree.
> +     * Therefore when the owner of the shared region is DOMID_IO, we will
> +     * only find the borrowers.
> +     */
> +    if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
> +         (!owner_dom_io && strcmp(role_str, "owner") == 0) )
> +    {
> +        /*
> +         * We found the first borrower of the region, the owner was not
> +         * specified, so they should be assigned to dom_io.
> +         */
> +        ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase, shm_bank);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
> +    {
> +        /* Set up P2M foreign mapping for borrower domain. */
> +        ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
> +                               _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                         const struct dt_device_node *node)
>  {
> @@ -195,9 +242,8 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          paddr_t gbase, pbase, psize;
>          int ret = 0;
>          unsigned int i;
> -        const char *role_str;
> +        const char *role_str = NULL;
>          const char *shm_id;
> -        bool owner_dom_io = true;
> 
>          if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
>              continue;
> @@ -238,39 +284,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                  return -EINVAL;
>              }
> 
> -        /*
> -         * "role" property is optional and if it is defined explicitly,
> -         * then the owner domain is not the default "dom_io" domain.
> -         */
> -        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
> -            owner_dom_io = false;
> +        /* "role" property is optional */
> +        dt_property_read_string(shm_node, "role", &role_str);
This now violates a MISRA rule saying that if a function returns a value, this value needs to be checked.
I think you should check if return value is non zero and if such, assign role_str NULL (thus removing such
assignment from a definition).

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

