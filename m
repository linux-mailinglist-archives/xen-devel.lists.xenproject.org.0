Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7848070EB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 14:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649267.1013661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rArzA-0006Ue-9B; Wed, 06 Dec 2023 13:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649267.1013661; Wed, 06 Dec 2023 13:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rArzA-0006SB-6V; Wed, 06 Dec 2023 13:30:44 +0000
Received: by outflank-mailman (input) for mailman id 649267;
 Wed, 06 Dec 2023 13:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQZO=HR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rArz8-0006S3-58
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 13:30:42 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a517db88-943b-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 14:30:39 +0100 (CET)
Received: from DM6PR18CA0022.namprd18.prod.outlook.com (2603:10b6:5:15b::35)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 13:30:27 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::7a) by DM6PR18CA0022.outlook.office365.com
 (2603:10b6:5:15b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Wed, 6 Dec 2023 13:30:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.24 via Frontend Transport; Wed, 6 Dec 2023 13:30:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 07:30:25 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 6 Dec 2023 07:30:23 -0600
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
X-Inumbo-ID: a517db88-943b-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZC/QRpzQ5fkI3VGFo/zuO0AgiCyeFJBBfSIwX+q+YU0V/cBAEPYx928YK5tiwCl5XqbXS1Ho0EdrZ6Q98d1ubfLRdtmodpZa6J9EQStBUjhhHtbMLOWsVMArV2rLo4cyCoZf0NL39ooTWddv0qb5k0yHRJiqyWFVWR/F4anUl0fB8f8GW4R5YwHPe3kgIWwplLN7HZghnNlVWy1ht/wUny2xVEJKmMpUDpzrx3d5Qwot6G5l5WROH0l/49px+LPCVunzGi3TNxb16xrFA/lnTu0Sdp6d4D8aAD59cB2TOJr5J8dxemvDlw8ieSHbNnjeF/j1YNTuagvt8hJR34zJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQR77DEwrNmtfoSYhrM/aepD1XnoLXJobuLCJzllS8M=;
 b=ee/bt0V7KGHbLaKhL2rLTmE5aBCJTNHuN5f8G9VgrLL6zqiEPbcb8+V+s19S0Sdu3tk/VaptQt2LB7LCojQXXSk2Dfg+vzbgeqsLtzKeS+TcyCYnCkCFt0ZUZ+aLOYbLhJiGMQQUjzvWcpT17ubDWn83de6BZPRttXZdsbyP2+cvEX/zLCZAY8MzAcm9syUEX9/9H87LXNh6HJk4NzTY0OC8+IlFubNAyGrywMt3+47MR18RpG7awveZCTJrYKyAgL3OgG+5D0zAvW2WJ82O2pgOKpHGZ0INH+tP+Zq3VX117GOw5+dagHlv5kIYpigLrkhi6ul1710fAiDblGvrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQR77DEwrNmtfoSYhrM/aepD1XnoLXJobuLCJzllS8M=;
 b=MKNdU8Gbd7XH8t8mEOM9lcXRsd3Z990eQk5+DCrb9vv61PGwjnNH7we9tIQ7HBTiFPJLDIFNiDijRSvLRasRbTHZO0N14rKfMSbj4f1MT8c4sVJ3EfjJVM38swnpS2gOp9jhDVPBjdupMu7iXzKcjfmz+ltzqcwDNSzX23IKic8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <eea5111e-95d1-4b98-beea-94a1f095e5e2@amd.com>
Date: Wed, 6 Dec 2023 14:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] xen/arm: re-define a set of data structures for
 static shared memory region
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-4-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231206090623.1932275-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d048fa-94a3-48e7-40d9-08dbf65f823e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i75/45Q/48jN66Is2/ng1VVWsDjREiMKHxogLKIlwHkf3pSb9K3W/CmjftPdhB2X/wQvShIRJxtCnmW4ejNbNxTInbOAUpD4dX/vfhKz0xfdEgh61lv4MBwPjlG6NwAlry2UUax+iN1zRWDXWr3BexZ755fyVtw90Qs73plj3YnsGGjCQIa/TJPwWhIFnIQWPKE5m/O5LwyYq8TgS8BdolSMtxqNSRdtU39B0OfTjqOnHKjmzRHt5f4EvGMcyML3aAzZeMHX0LfH4wnt4+foF8aKeST4w1jG/zS3AKIiYO/krrtrHNsl9jxYiuRBMArqzpC6ADVs/wkvKX5Zo9Wl3Y8DeaZr1rNdambyINIDDUcAQIs2uNL5dXy3zh10X9EUEFBA7Xm1GDzEAetz1M6DftOEyMyUcg8Bcy638/CrX5bKB9TjlABuVuSNZ2Go6MhDO6kpeUTIi3m+xzfBBIYRPEqW2FLVfPfDHPaBUZrWmqcHhPZ3RH4UKsTk2XBh8OOdcSaWH1Q+o6k1HPsl9fM/JkuuMgxYGilz6qoVbtlS6w/4J3mPTU6m617hmNO5VDGo3eRKWMxDMhUFL/J6dy9tLWYHGbAQ/Y0R/484OVYF+lAUEekNUUPw368B4aUUhwJV/z2bHgcyTTN32rU5srszmvw+dNVD8dQr7s9IY0MU17kIadL0kyJ3Is/wuQgyoe8MfNPvsj8CIdV4fQGqX7gd4vS5mUBRT/iaRPV5UjkgRIO1Xxu50lDdS9SbHLdJyHY6q267bkhts8mLRcdz3sZOetLepPoq0XONfANqyZvPU0n2lEi3LWmEyUq3ymURuFWw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(36860700001)(40480700001)(53546011)(6666004)(478600001)(110136005)(54906003)(16576012)(81166007)(70586007)(70206006)(356005)(316002)(26005)(2616005)(47076005)(83380400001)(4326008)(8676002)(8936002)(31686004)(426003)(336012)(82740400003)(44832011)(5660300002)(2906002)(66899024)(31696002)(40460700003)(41300700001)(86362001)(30864003)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 13:30:26.9407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d048fa-94a3-48e7-40d9-08dbf65f823e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653

Hi Penny,

On 06/12/2023 10:06, Penny Zheng wrote:
> 
> 
> This commit introduces a set of separate data structures to deal with
> static shared memory at different stages.
> 
> In boot-time host device tree parsing, we introduce a new structure
> "struct shm_node" and a new field "shminfo" in bootinfo to describe and
> store parsed shm info.
> 
> In acquire_nr_borrower_domain, it is better to use SHMID as unique identifier
> to iterate "shminfo", other than address and size.
> 
> In the last, a new anonymized structure "shminfo", which is a array of
> compound structure that contains SHMID and a "struct membank membank"
> describing shared memory regions in guest address space, is created in "kinfo"
> when dealing with domain information.

This commit msg describes what the patch does but not why.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> - As the original "struct shm_membank" was making reserving memory more
> complex and actually memory information could be still got from host Device\
> Tree when dealing with domain construction, we introduce a new simple structure
> "struct shm_node" in bootinfo to only store SHMID and "nr_borrowers"
> - Further restrict the scope of the local variable
> "struct meminfo *mem = &bootinfo.reserved_mem"
> - Introduce a new local global data "shm_data" in bootfdt.c. In which, reserved
> memory bank is recorded together with the shm node, to assist doing shm node
> verification.
> - Define a set of local variables that point to
> "shm_data.shm_nodes[i].membank->start", etc, to make the code more readable.
> - Use SHMID to iterate "shminfo" to find requested shm node, as we no
> longer store host memory bank info in shm node.
> - A new anonymized structure, which is a array of compound structure that
> contains SHMID and a "struct membank membank", describing shared memory region
> in guest, is introduced in "kinfo".
> ---
> v2 -> v3:
> - rebase and no changes
> ---
> v3 -> v4:
> rebase and no change
> ---
> v4 -> v5:
> - With all shm-related functions classified into static-shmem.c, there
> is no need to import local global data "shm_data".
> ---
>  xen/arch/arm/dom0less-build.c           |   3 +-
>  xen/arch/arm/domain_build.c             |   3 +-
>  xen/arch/arm/include/asm/kernel.h       |   9 +-
>  xen/arch/arm/include/asm/setup.h        |  24 +++++-
>  xen/arch/arm/include/asm/static-shmem.h |   4 +-
>  xen/arch/arm/static-shmem.c             | 104 ++++++++++++++----------
>  6 files changed, 92 insertions(+), 55 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fb63ec6fd1..ac096fa3fa 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -645,8 +645,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
> 
> -    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
> -                                &kinfo->shm_mem);
> +    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
>      if ( ret )
>          goto err;
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 613b2885ce..64ae944431 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1767,8 +1767,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                  return res;
>          }
> 
> -        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
> -                                    &kinfo->shm_mem);
> +        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
>          if ( res )
>              return res;
>      }
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 0a23e86c2d..db3d8232fa 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -39,7 +39,14 @@ struct kernel_info {
>      void *fdt; /* flat device tree */
>      paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>      struct meminfo mem;
> -    struct meminfo shm_mem;
> +    /* Static shared memory banks */
> +    struct {
> +        unsigned int nr_banks;
> +        struct {
> +            char shm_id[MAX_SHM_ID_LENGTH];
> +            struct membank membank;
> +        } bank[NR_MEM_BANKS];
> +    } shminfo;
AFAICT, the only user of this structure is static-shmem.c so why not protecting it with #ifdef?

> 
>      /* kernel entry point */
>      paddr_t entry;
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index d15a88d2e0..3a2b35ea46 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -50,10 +50,6 @@ struct membank {
>      paddr_t start;
>      paddr_t size;
>      enum membank_type type;
> -#ifdef CONFIG_STATIC_SHM
> -    char shm_id[MAX_SHM_ID_LENGTH];
> -    unsigned int nr_shm_borrowers;
> -#endif
>  };
> 
>  struct meminfo {
> @@ -95,6 +91,17 @@ struct bootcmdlines {
>      struct bootcmdline cmdline[MAX_MODULES];
>  };
> 
> +#ifdef CONFIG_STATIC_SHM
> +/*
> + * struct shm_node represents a static shared memory node shared between
> + * multiple domains, identified by the unique SHMID("xen,shm-id").
> + */
> +struct shm_node {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +};
> +#endif
> +
>  struct bootinfo {
>      struct meminfo mem;
>      /* The reserved regions are only used when booting using Device-Tree */
> @@ -105,6 +112,15 @@ struct bootinfo {
>      struct meminfo acpi;
>  #endif
>      bool static_heap;
> +#ifdef CONFIG_STATIC_SHM
> +    struct {
> +        unsigned int nr_nodes;
> +        struct {
> +            struct shm_node node;
> +            const struct membank *membank;
> +        } shm_nodes[NR_MEM_BANKS];
> +    } shminfo;
I find it a bit confusing to have 2 structures named exactly the same (here and in kinfo).
Something like shminfo_nodes would be better.

Also, correct me if I'm wrong. The reason for this structure is to avoid keeping membank growing?

> +#endif
>  };
> 
>  struct map_range_data
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 1536ff18b8..66a3f4c146 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -8,7 +8,7 @@
>  #ifdef CONFIG_STATIC_SHM
> 
>  int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
> -                          int sizecells, const struct meminfo *mem);
> +                          int sizecells, const struct kernel_info *kinfo);
> 
>  int process_shm(struct domain *d, struct kernel_info *kinfo,
>                  const struct dt_device_node *node);
> @@ -28,7 +28,7 @@ int process_shm_node(const void *fdt, int node, uint32_t address_cells,
> 
>  static inline int make_resv_memory_node(const struct domain *d, void *fdt,
>                                          int addrcells, int sizecells,
> -                                        const struct meminfo *mem)
> +                                        const struct kernel_info *kinfo)
>  {
>      return 0;
>  }
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 1a1a9386e4..6a3d8a54bd 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -6,28 +6,25 @@
>  #include <asm/domain_build.h>
>  #include <asm/static-shmem.h>
> 
> -static int __init acquire_nr_borrower_domain(struct domain *d,
> -                                             paddr_t pbase, paddr_t psize,
> +static int __init acquire_nr_borrower_domain(const char *shm_id,
>                                               unsigned long *nr_borrowers)
Why is nr_borrowers unsigned long but nr_shm_borrowers is unsigned int?

>  {
> -    unsigned int bank;
> +    struct shm_node *shm_node;
Can be const

> +    unsigned int i;
> 
> -    /* Iterate reserved memory to find requested shm bank. */
> -    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
> +    /* Iterate to find requested static shared memory node. */
> +    for ( i = 0; i < bootinfo.shminfo.nr_nodes; i++ )
>      {
> -        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
> -        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
> +        shm_node = &bootinfo.shminfo.shm_nodes[i].node;
> 
> -        if ( (pbase == bank_start) && (psize == bank_size) )
> -            break;
> +        if ( strcmp(shm_id, shm_node->shm_id) == 0 )
> +        {
> +            *nr_borrowers = shm_node->nr_shm_borrowers;
> +            return 0;
> +        }
>      }
> 
> -    if ( bank == bootinfo.reserved_mem.nr_banks )
> -        return -ENOENT;
> -
> -    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
> -
> -    return 0;
> +    return -ENOENT;
>  }
> 
>  /*
> @@ -91,7 +88,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
> 
>  static int __init assign_shared_memory(struct domain *d,
>                                         paddr_t pbase, paddr_t psize,
> -                                       paddr_t gbase)
> +                                       paddr_t gbase, const char *shm_id)
>  {
>      mfn_t smfn;
>      int ret = 0;
> @@ -125,7 +122,7 @@ static int __init assign_shared_memory(struct domain *d,
>       * Get the right amount of references per page, which is the number of
>       * borrower domains.
>       */
> -    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
> +    ret = acquire_nr_borrower_domain(shm_id, &nr_borrowers);
>      if ( ret )
>          return ret;
> 
> @@ -161,13 +158,16 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
>                                              paddr_t start, paddr_t size,
>                                              const char *shm_id)
>  {
> -    if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
> +    unsigned int nr_banks = kinfo->shminfo.nr_banks;
> +    struct membank *membank = &kinfo->shminfo.bank[nr_banks].membank;
> +
> +    if ( nr_banks >= NR_MEM_BANKS )
>          return -ENOMEM;
> 
> -    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> -    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> -    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
> -    kinfo->shm_mem.nr_banks++;
> +    membank->start = start;
> +    membank->size = size;
> +    safe_strcpy(kinfo->shminfo.bank[nr_banks].shm_id, shm_id);
> +    kinfo->shminfo.nr_banks++;
> 
>      return 0;
>  }
> @@ -251,7 +251,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>               * specified, so they should be assigned to dom_io.
>               */
>              ret = assign_shared_memory(owner_dom_io ? dom_io : d,
> -                                       pbase, psize, gbase);
> +                                       pbase, psize, gbase, shm_id);
>              if ( ret )
>                  return ret;
>          }
> @@ -279,12 +279,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
> 
>  static int __init make_shm_memory_node(const struct domain *d, void *fdt,
>                                         int addrcells, int sizecells,
> -                                       const struct meminfo *mem)
> +                                       const struct kernel_info *kinfo)
>  {
>      unsigned int i = 0;
>      int res = 0;
> 
> -    if ( mem->nr_banks == 0 )
> +    if ( kinfo->shminfo.nr_banks == 0 )
>          return -ENOENT;
> 
>      /*
> @@ -294,17 +294,17 @@ static int __init make_shm_memory_node(const struct domain *d, void *fdt,
>       */
>      dt_dprintk("Create xen-shmem node\n");
> 
> -    for ( ; i < mem->nr_banks; i++ )
> +    for ( ; i < kinfo->shminfo.nr_banks; i++ )
>      {
> -        uint64_t start = mem->bank[i].start;
> -        uint64_t size = mem->bank[i].size;
> +        uint64_t start = kinfo->shminfo.bank[i].membank.start;
> +        uint64_t size = kinfo->shminfo.bank[i].membank.size;
>          const char compat[] = "xen,shared-memory-v1";
>          /* Worst case addrcells + sizecells */
>          __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>          __be32 *cells;
>          unsigned int len = (addrcells + sizecells) * sizeof(__be32);
> 
> -        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
> +        res = domain_fdt_begin_node(fdt, "xen-shmem", start);
>          if ( res )
>              return res;
> 
> @@ -322,7 +322,7 @@ static int __init make_shm_memory_node(const struct domain *d, void *fdt,
>          dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
>                     i, start, start + size);
> 
> -        res = fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id);
> +        res = fdt_property_string(fdt, "xen,id", kinfo->shminfo.bank[i].shm_id);
>          if ( res )
>              return res;
> 
> @@ -350,7 +350,6 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>      const struct fdt_property *prop, *prop_id, *prop_role;
>      const __be32 *cell;
>      paddr_t paddr, gaddr, size, end;
> -    struct meminfo *mem = &bootinfo.reserved_mem;
>      unsigned int i;
>      int len;
>      bool owner = false;
> @@ -429,17 +428,21 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>          return -EINVAL;
>      }
> 
> -    for ( i = 0; i < mem->nr_banks; i++ )
> +    for ( i = 0; i < bootinfo.shminfo.nr_nodes; i++ )
>      {
> +        paddr_t bank_start = bootinfo.shminfo.shm_nodes[i].membank->start;
> +        paddr_t bank_size = bootinfo.shminfo.shm_nodes[i].membank->size;
> +        const char *bank_id = bootinfo.shminfo.shm_nodes[i].node.shm_id;
> +
>          /*
>           * Meet the following check:
>           * 1) The shm ID matches and the region exactly match
>           * 2) The shm ID doesn't match and the region doesn't overlap
>           * with an existing one
>           */
> -        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
> +        if ( paddr == bank_start && size == bank_size )
>          {
> -            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
> +            if ( strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 )
In following else if you still use mem->bank[i].shm_id which results in a build failure.
You should use bank_id there as well.

~Michal

