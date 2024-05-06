Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD68BCF3A
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 15:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717667.1120100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yZH-000449-Sb; Mon, 06 May 2024 13:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717667.1120100; Mon, 06 May 2024 13:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yZH-00042B-Ob; Mon, 06 May 2024 13:39:47 +0000
Received: by outflank-mailman (input) for mailman id 717667;
 Mon, 06 May 2024 13:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lkt3=MJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s3yZG-00040r-4a
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 13:39:46 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20631.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 183db192-0bae-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 15:39:44 +0200 (CEST)
Received: from CH2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:610:57::21)
 by PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 13:39:40 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::3c) by CH2PR12CA0011.outlook.office365.com
 (2603:10b6:610:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 13:39:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 13:39:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 08:39:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 08:39:39 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 08:39:38 -0500
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
X-Inumbo-ID: 183db192-0bae-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg6Hfu5OFqGX7zrph32luwwCrT8EyX9QlgWhU325e44az7w7JCvxLnXMZbhb2D4fdSnB8ToNmawpHUPZgN0LGN2kBe3BqUp/qJ4/60u4Zpbs6t4+LQJ/rvts6WLaTVWs05A9ey7NXrD+YrAn71J/pp7ArjvYR8cue+N3JNWkGz7XpNGutcKGZ5ahka2m7wRqVLwzRf8/WR/CBISI6Dnmb8b+ITFPPYMYmDJe1U5aCow1aFh04AfATRDn0V2fRaWnYIANXylfp2eSPy03V3+ggw78w2YOTsuoTrb8jgV2FX95gxVHEnAxvB6YzLggYKNYC+4fOWswu5KpsENlmCNhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPCkmmAp+IGVKzc9GL8irMKVoCZzCPhBnUM5yusPrno=;
 b=AmZUISqzX2I4tBekxW071qfFlZZVrwiPIKII2By/RmaJyEQGUirciE7EC+sxmYHyY9sn5GkJAKsFw0QveZsfW+5fIwusi4Ah4KZqrZ4C6P0sZhb9WRC3MJn+xd/3bQlZHzr5+kellUl2w0iei0gvQpizSGuafaxR9Mr6WAY+p8yBp4shJwsGFZFyhimzDAVLy3lds5ZK2LXImehg2ngo5+j7/EpS+pL8a7Q97dDrjafPmIujYKq804+Wyh+zvZdCUYONoMgEe5m7fmqhIws1oRMj8xHbXPc800YA/DabLMldPj7HdMRwykd6XoEw2uylZiJy5nsOHIQN+6qFBMuOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPCkmmAp+IGVKzc9GL8irMKVoCZzCPhBnUM5yusPrno=;
 b=HvsSahIalLb4ew6aTMp4IjdT1N/+yUPpgMXRGCtPfUqAbkM/WVep73w7lSiUK9Z2pSqP/vxXFdy0udmda3DaOC1n7Iy/uA4wseJl26D6oKtxSigXP9yEVE1ncDDUB9vmljtiJOcop4t1n4smt7dp/IlnM9noMOpE2BPzEiawI6I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ef9b0a4d-134c-4eea-927d-5cce0b330aff@amd.com>
Date: Mon, 6 May 2024 15:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one
 function
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-3-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240423082532.776623-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|PH7PR12MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc2a445-0d63-4d5c-6000-08dc6dd1fabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDZjYVNpbmhwZ1dYcXRCZm1JV3pjQUZXNmlLOHMvRFZyZFRkK3hLcHZDTUtE?=
 =?utf-8?B?UkQzbXhCTHk2dytYMEgwek5yM3Q1Ni9aWHF5VWRoQ2FjanEyMlljR2gzNU1U?=
 =?utf-8?B?ZVdNeFhVd1JNWjZaT1piOEJ4eHVWZTNoSlFLVlk3Nm15VG90SWN0S2FsTVVW?=
 =?utf-8?B?Y2dTenFiSDZOY1JFSW1CcjdFSFp3RUhJN1JTTEhWZzdMZkxKZzFnbG9yNXhj?=
 =?utf-8?B?UW1wVldwbCtheEdJT3FxeDVnSm9kZXdsd2hXdDNJTVZWRmxyVTdQOVJqdm5j?=
 =?utf-8?B?cHk3SXlBTkdSQkMrT2ZWRG1pdk9jQWFiL1pReVVkT1hqLzhLQVZ3a2YwRE1V?=
 =?utf-8?B?enF6ek9mUTd0T3BDRkNma3lMSURoeCsybGE0OXNHVXVyU0ZyUTAzWU9BZEJC?=
 =?utf-8?B?LzdwSDhpeGZiREYzNkVxMHczbWVSWGMxRkdTSjJpMERlS3N1aWtWQXFlMTNF?=
 =?utf-8?B?TjlkVmRXRE1uVmpyemdOSzRoSlgwZ0MwT2N6WmoraEhiUzA5STA4VklUaEdK?=
 =?utf-8?B?UldkTTVaSFNRS3dkUkxPRU1XSnJidjk2MEZuam9jMGkrQWowT0hraXhvZEtQ?=
 =?utf-8?B?UFN2KzM1TUkwazVEU0RQa2FJcHpjcEZFeHp4S3BrMUlQZEZFQnRReVA3aVVX?=
 =?utf-8?B?ZGxHb2NOUEhhWjZwL05tNlllWnJ3YWkyRnpyQ3RBSEVOcHNPc0FYRmFXZ3A3?=
 =?utf-8?B?Y2dnUFZFRkNaNUREY1hHOVpNYU50ejFSdEJER3JjM2cvaGFrdy92dTFMUGxG?=
 =?utf-8?B?dTloVUhRZklhbURNY1IrSUU5dXU3T21PMzJmc2cxSGRCa2owbU5HM1QvOW9w?=
 =?utf-8?B?YXNFY0tBZWduVEx2VVhHZTk4c0Rlbitxd2FrODNoWFd1eXBkMyt4Wk8yK3I1?=
 =?utf-8?B?V0MvcTltTXNpcVNSVkhiM1l2Q0VBS2NIRGtZeXdKVXdNK09zVVZlVVIwc0dZ?=
 =?utf-8?B?Q1pxM1p2c1NtR1k1ck1qVHZtRk9RRjRCQU1NTjBJem9aYXBidnorMmg0cDFP?=
 =?utf-8?B?OXlmTWtzNjVYWml6ODhOWGN0c0syd3hNb3dzVGJQU1NLSlplSUVYZkRDVk1D?=
 =?utf-8?B?SHRKV1M3eE9QMWVFM3o4SjNjVnlPQkU3ZmdOZzhidkdmUXNpOS93VHFjVG1w?=
 =?utf-8?B?bUk4LzJoaWFKOGQrR2tnUU4zNnVtYWVCOEFMNW9WaHp1YS9tZXBvRlh5MkZ4?=
 =?utf-8?B?OGxUQzVQS1NWa2laMWl5elpKZ2JoaW03WkxuMG5ZQjhUUFhTdk5tSUcybnBj?=
 =?utf-8?B?MkRUVWRFK1ZPQ0YvT3FWRFhjYVlpSTBMSWJsc2N0WVcrZ1NydVpKS2x2QWxM?=
 =?utf-8?B?NXYwVkxEaGM0cnltak5DdVM5eUpqdkFrR3dPR096ZllxUUZkMlRJdmdUV0FT?=
 =?utf-8?B?bjVsaDc1dHdDcHFGZ1Jabk9VTTFrazFCNFhiL3JHcGs0NWZGL2VNODhLVUNW?=
 =?utf-8?B?R2xHbHVhVW5QSnhkakRoQXVBQ284elUzSDVZeXk4VTNwRlhiblpPYkFSODM0?=
 =?utf-8?B?VHRQQlhjbEJpT29PY0wxak4yNFM5VlBFTW5vVWtrbTZXSWVzcVhWaUp2dllS?=
 =?utf-8?B?amZUd3MwbGtybFU4Vm1sNnFFNHRuSTRnMDBRMitjZnBtME42VFpCa1huU2hl?=
 =?utf-8?B?azFIK09qKzNrSFVSZHBUVS94amFhMnUrVmhlaUZsMVdKb0krQk5nSmYxa3NP?=
 =?utf-8?B?WjVqdW83NDJoQTZmZUttMFdRR2htUVR2bzJZd2l3YXJ4VUNrZG1od1B6S1VX?=
 =?utf-8?B?eWNteXpGQjN4TjRqT0lucTRWSmFKYWxtdkNtcGxZaDBtYVBLTGJIUzIwZ0x6?=
 =?utf-8?B?UE1yb3lzRmEvTFMxSnFDYmtueFVrTVpqN3ZNSlNzY05RcStZcHk4VjEzY2ZK?=
 =?utf-8?Q?my8TH13qm4ZPd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 13:39:40.1450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc2a445-0d63-4d5c-6000-08dc6dd1fabd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5854

Hi Luca,

On 23/04/2024 10:25, Luca Fancellu wrote:
> 
> 
> Wrap the code and logic that is calling assign_shared_memory
> and map_regions_p2mt into a new function 'handle_shared_mem_bank',
> it will become useful later when the code will allow the user to
> don't pass the host physical address.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/static-shmem.c | 71 +++++++++++++++++++++++--------------
>  1 file changed, 45 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index f6cf74e58a83..24e40495a481 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -185,6 +185,47 @@ append_shm_bank_to_domain(struct shared_meminfo *kinfo_shm_mem, paddr_t start,
>      return 0;
>  }
> 
> +static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
> +                                         bool owner_dom_io,
> +                                         const char *role_str,
> +                                         const struct membank *shm_bank)
> +{
> +    paddr_t pbase, psize;
> +    int ret;
> +
> +    BUG_ON(!shm_bank);
not needed

> +
> +    pbase = shm_bank->start;
> +    psize = shm_bank->size;
please add empty line here

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
> @@ -249,32 +290,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
>              owner_dom_io = false;
Looking at owner_dom_io, why don't you move parsing role and setting owner_dom_io accordingly to handle_shared_mem_bank()?

~Michal

