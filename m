Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1880A476
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 14:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650635.1016344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBavP-0004JU-P4; Fri, 08 Dec 2023 13:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650635.1016344; Fri, 08 Dec 2023 13:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBavP-0004Gn-JK; Fri, 08 Dec 2023 13:29:51 +0000
Received: by outflank-mailman (input) for mailman id 650635;
 Fri, 08 Dec 2023 13:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8K7=HT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBavO-0004Gh-7u
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 13:29:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe59::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d94fbc61-95cd-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 14:29:45 +0100 (CET)
Received: from MN2PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:c0::39)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 13:29:39 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::8d) by MN2PR05CA0026.outlook.office365.com
 (2603:10b6:208:c0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.17 via Frontend
 Transport; Fri, 8 Dec 2023 13:29:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 13:29:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 07:29:38 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 07:29:38 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 8 Dec 2023 07:29:37 -0600
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
X-Inumbo-ID: d94fbc61-95cd-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKY83LLXdnYMxXLMy1M7kwUEC8f3BZQPAzBxr8PMcgYhloFc/yl6QkRVeSGfK3m8Rtf5fYlP2LmlwDpJseyJMk4b8VIyFD9E88ehUMrVaQDR2Uc3GxKbN57UKw+b9gmNc9QHqSur9evuu5ZCOu/VEfA9s07TmLUqIqfuXAcsm8ibAj8/jHIHAX0Kjr3OMClDwLXehTwudFAnrvb1Lhqjuo35eHxUyrfRXKGLLZkw6/EARTmfstAAAA/6EhfmQSa1VQJKUGyLcEv2pN1wXOLe2CbLliRMIQ82FkuJFBp5iTy/n4DAwn/QMueHdESjlCxQDB0HjULLXZbT+IpYRBelwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9LnnVpSdd+kkHGAnPC1r6sBcRoIaHAHqT1YgUVl46s=;
 b=hJwXvXp9QLZsv1CHBAQGONQWW3Zjtm+VrvMnedeZ2bnVuZPRj0V1DUIVQE99ZfzWLtUybXSmEgK+g9ipI8VRwJ9o6Xkp7MboltzVH8QEk2eGRca5QhUjqNH3GbjZV+S1q5Y4rKIUSTCkfFkyEMUrB4VTRap6jauyz/taIc11el3xL7lKL90p4eIRyTFk7aRoZg2OgyOSy0fwjSJJpPzqT2lVkyozvu1GLmUKfXhBwfiPGsRiLbM2oMUKaoXap5RNn/CRt6HKLPng0Qez/T0x6XBnRm3tKWunOhNLTKpUMOsl33ROQiE9hCXKqQomHDuJQxV6/YF0sbAUvO54gEhh2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9LnnVpSdd+kkHGAnPC1r6sBcRoIaHAHqT1YgUVl46s=;
 b=3DQrSPKbBMwfLveV9Lm5A6iDDq0v78Ge+lWCO7yua2onDlxTrpNjXe6iIBqjLDoepkVfPNxdmgu+i0El/N7meTnISAjmNbjMSGUhPD9QExApKiqzBBac6WIGdjJrqL3svlL3Xqd10aIdQODr+jSQZ7jesBEAIUo8Dhp81b5FM/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <98e3f9ac-b176-46ba-b6d5-f0f2c74116b3@amd.com>
Date: Fri, 8 Dec 2023 14:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] xen/arm: use paddr_assigned to indicate whether
 host address is provided
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-6-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231206090623.1932275-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|DM6PR12MB4402:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3003dd-482d-42d0-558c-08dbf7f1ba88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PncatVHDomgznRVTOzGgH6h+CgDi3Lgv6x/VG1Wwyg+MsUjmqqK7xYhrd6K6T4F0nw7K/OqOox/tey/dxAhP1Fw56iYM6Vgibbf/JIyVCQQylXFtbLfKRYTiAPcGhycpDTcOaU6HLKzm5SR+g34pHGlAVt9uhJKmfUyFqUU0otV8UlLsmzUshex03qDvR8WyRaQpBVbYJYvhUYFcFfU3gLEJPE4ntAO1xMrkNdKw3sXBaL9/iwymrDgBzITwrDl4XWSGjJvNzmxxc824OruVvJbz2awW3Bc1XsTAOu5JzkuKCm4JfKLcQocKOZNGa9IHPcWDAUSnZJLOi2V/quuW9aeuM9dRQFqi1DeQ1hp0rA+M4MvvEqLbEjyyLmpZi/ngCJyd0FdQipdbCinHs/XuA2ZIRcwJ422eR1P8XXEcYNeWxHPUZb6IMlkLCyAXxbw2hlE36e1IIeVocY7ImGLsIUwvBDlZPZgPQjEsSMpyQOcLYK3vgj8LQLXi7tqiTYkxkfy6pGxVR9PQX1ZrNjG8j3nG0LrMwQj7yTbymZGOTc17zWn/EzQyFNerOFdyDney+faneMTfBfkAGESaPKk9QcGM4JjtkGNDNhyFxrX5CHI0TZ3DymWyUDlVRDAOWwmn6dw/BLeCaR87wkhoxZkrQsyf6FHkdZEn1AVUEUMGBC2SYkVLw5kKZ2d30AxpiZmctV3ZzHWbJklPM3Gik1PsknmKNeO2WF+BzhOWE675ktUcqRVRNbjZrcJ0XwBsVQv8iFeiK/4RqdDHWWb+AXIeaWj0PuEtyQ/+o6ryXA2iWX7sOHUlrcH5b3DQnZOIsZW9d6+jeYINVbHJcc15Bht7WHHCz3dtFFaDuA3DvBElIVU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230173577357003)(230922051799003)(230273577357003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(2906002)(47076005)(40460700003)(30864003)(36860700001)(86362001)(31696002)(36756003)(82740400003)(81166007)(356005)(41300700001)(316002)(40480700001)(16576012)(54906003)(110136005)(70206006)(70586007)(53546011)(26005)(4326008)(2616005)(8676002)(8936002)(478600001)(31686004)(5660300002)(83380400001)(426003)(44832011)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 13:29:39.1264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3003dd-482d-42d0-558c-08dbf7f1ba88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402

Hi Penny,

On 06/12/2023 10:06, Penny Zheng wrote:
> 
> 
> We use paddr_assigned to indicate whether host address is provided, by
> checking the length of "xen,shared-mem" property.
> 
> The shm matching criteria shall also be adapt to cover the new scenario, by
> adding when host address is not provided, if SHMID matches, the region size
> must exactly match too.
> 
> During domain creation, right now, a static shared memory node could be
> banked with a statically configured host memory bank, or arbitrary
> host memory of dedicated size, which will later be allocated from heap by Xen.
> To cover both scenarios, we create a new structure shm_meminfo. It is very
> alike meminfo, but with the maximum array size being a smaller number
> NR_SHM_BANKS(16).
> As "shm_meminfo" is also a new member of "enum meminfo_type", we shall implement
> its own callback "retrieve_shm_meminfo" to have access to all MACRO
> helpers, e.g. GET_MEMBANK(...).
Previous comments apply here as well and this patch depends on the decision of others
\wrt previous patch. I'll just add generic remarks.

> 
> Also, to make codes tidy and clear, we extract codes about parsing
> "xen,shared-mem" property from function "process_shm" and move them into
> a new helper "parse_shm_property".
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2
> - In order to get allocated banked host memory info during domain creat    ion,
> we create a new structure shm_meminfo. It is very alike meminfo, with
> the maximum array size being NR_SHM_BANKS. As shm_meminfo is a new
> member of type meminfo_type, we shall implement its own callback
> retrieve_shm_meminfo to have access to all MACRO helpers, e.g.
> GET_MEMBANK(...)
> - rename "acquire_shm_memnode" to "find_shm_memnode"
> ---
> v2 -> v3
> - rebase and no changes
> ---
> v3 -> v4:
> - rebase and no change
> ---
> v4 -> v5:
> - fix bugs of that tot_size and membank shall not be member of union,
> but struct, to differentiate two types of static shared memory node.
> ---
>  xen/arch/arm/domain_build.c             |   3 +
>  xen/arch/arm/include/asm/setup.h        |  14 +-
>  xen/arch/arm/include/asm/static-shmem.h |   3 +
>  xen/arch/arm/static-shmem.c             | 360 ++++++++++++++++++------
>  4 files changed, 293 insertions(+), 87 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index a8bc78baa5..c69d481d34 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -70,6 +70,9 @@ static void __init retrieve_meminfo(void *mem, unsigned int *max_mem_banks,
> 
>  retrieve_fn __initdata retrievers[MAX_MEMINFO_TYPE] = {
>      [NORMAL_MEMINFO] = retrieve_meminfo,
> +#ifdef CONFIG_STATIC_SHM
> +    [SHM_MEMINFO] = retrieve_shm_meminfo,
> +#endif
>  };
>  #endif
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index bc5f08be97..043588cd2d 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -59,6 +59,9 @@ struct meminfo {
> 
>  enum meminfo_type {
>      NORMAL_MEMINFO,
> +#ifdef CONFIG_STATIC_SHM
> +    SHM_MEMINFO,
> +#endif
>      MAX_MEMINFO_TYPE,
>  };
> 
> @@ -150,7 +153,16 @@ struct bootinfo {
>          unsigned int nr_nodes;
>          struct {
>              struct shm_node node;
> -            const struct membank *membank;
> +            /*
> +             * For a static shared memory node, it is either banked with
> +             * a statically configured host memory bank, or arbitrary host
> +             * memory which will be allocated by Xen with a specified total
> +             * size(tot_size).
> +             */
> +            struct {
> +                const struct membank *membank;
> +                paddr_t tot_size;
> +            };
>          } shm_nodes[NR_MEM_BANKS];
>      } shminfo;
>  #endif
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 66a3f4c146..a67445cec8 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -24,6 +24,9 @@ static inline int process_shm_chosen(struct domain *d,
>  int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>                       uint32_t size_cells);
> 
> +void retrieve_shm_meminfo(void *mem, unsigned int *max_mem_banks,
> +                          struct membank **bank,
> +                          unsigned int **nr_banks);
>  #else /* !CONFIG_STATIC_SHM */
> 
>  static inline int make_resv_memory_node(const struct domain *d, void *fdt,
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 6a3d8a54bd..a9eb26d543 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -6,6 +6,50 @@
>  #include <asm/domain_build.h>
>  #include <asm/static-shmem.h>
> 
> +#define NR_SHM_BANKS 16
> +
> +/*
> + * There are two types of static shared memory node:
> + * A static shared memory node could be banked with a statically
> + * configured host memory bank, or a set of arbitrary host memory
> + * banks allocated from heap by Xen on runtime.
> + */
> +struct shm_meminfo {
> +    unsigned int nr_banks;
> +    struct membank bank[NR_SHM_BANKS];
> +    paddr_t tot_size;
> +};
> +
> +/*
> + * struct shm_memnode holds banked host memory info for a static
> + * shared memory node
> + */
> +struct shm_memnode {
With the number of structures introduced in this series, the chosen naming does not help

> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    struct shm_meminfo meminfo;
> +};
> +
> +static __initdata struct {
> +    unsigned int nr_nodes;
> +    struct shm_memnode node[NR_MEM_BANKS];
> +} shm_memdata;
> +
> +void __init retrieve_shm_meminfo(void *mem, unsigned int *max_mem_banks,
> +                                 struct membank **bank,
> +                                 unsigned int **nr_banks)
> +{
> +    struct shm_meminfo *meminfo = (struct shm_meminfo *)mem;
> +
> +    if ( max_mem_banks )
> +        *max_mem_banks = NR_SHM_BANKS;
> +
> +    if ( nr_banks )
> +        *nr_banks = &(meminfo->nr_banks);
> +
> +    if ( bank )
> +        *bank = meminfo->bank;
> +}
> +
>  static int __init acquire_nr_borrower_domain(const char *shm_id,
>                                               unsigned long *nr_borrowers)
>  {
> @@ -172,6 +216,129 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
>      return 0;
>  }
> 
> +static struct shm_memnode * __init find_shm_memnode(const char *shm_id)
> +{
> +    unsigned int i;
> +    struct shm_memnode *shm_memnode;
> +
> +    for ( i = 0 ; i < shm_memdata.nr_nodes; i++ )
> +    {
> +        shm_memnode = &shm_memdata.node[i];
> +
> +        if ( strcmp(shm_id, shm_memnode->shm_id) == 0 )
> +            return shm_memnode;
> +    }
> +
> +    if ( i == NR_MEM_BANKS )
> +        return NULL;
> +
We can only be here if i == 0 i.e. no shm nodes?

> +    shm_memnode = &shm_memdata.node[i];
> +    safe_strcpy(shm_memnode->shm_id, shm_id);
> +    shm_memdata.nr_nodes++;
leave one empty line here, please

> +    return shm_memnode;
> +}
> +
> +/* Parse "xen,shared-mem" property in static shared memory node */
> +static struct shm_memnode * __init parse_shm_property(struct domain *d,
> +                                    const struct dt_device_node *dt_node,
> +                                    bool *paddr_assigned, paddr_t *gbase,
> +                                    const char *shm_id)
> +{
> +    uint32_t addr_cells, size_cells;
> +    const struct dt_property *prop;
> +    const __be32 *cells;
> +    uint32_t len;
> +    unsigned int i;
> +    paddr_t pbase, psize;
> +    struct shm_memnode *shm_memnode;
> +
> +    /* xen,shared-mem = <pbase, gbase, size>; And pbase could be optional. */
> +    prop = dt_find_property(dt_node, "xen,shared-mem", &len);
> +    BUG_ON(!prop);
> +    cells = (const __be32 *)prop->value;
> +
> +    addr_cells = dt_n_addr_cells(dt_node);
> +    size_cells = dt_n_size_cells(dt_node);
> +    if ( len != dt_cells_to_size(addr_cells + size_cells + addr_cells) )
> +    {
> +        /* pbase is not provided in "xen,shared-mem" */
> +        if ( len == dt_cells_to_size(size_cells + addr_cells) )
> +            *paddr_assigned = false;
what if paddr_assigned is NULL? Also, wouldn't pbase_provided be a better name?

> +        else
> +        {
> +            printk("fdt: invalid `xen,shared-mem` property.\n");
If you are modifying the code anyway, please drop '.' at the end of line. No need for that

> +            return NULL;
> +        }
> +    }
> +
> +    /*
> +     * If we firstly process the shared memory node with unique "xen,shm-id",
> +     * we allocate a new member "shm_memnode" for it in shm_memdata.
> +     */
> +    shm_memnode = find_shm_memnode(shm_id);
> +    BUG_ON(!shm_memnode);
> +    if ( !(*paddr_assigned) )
> +    {
> +        device_tree_get_reg(&cells, addr_cells, size_cells, gbase, &psize);
> +        /* Whether it is a new shm node? */
> +        if ( shm_memnode->meminfo.tot_size == 0 )
> +            goto out_early1;
> +        else
no need for this else

> +            goto out_early2;
> +    }
> +    else
no need for this else. You can be here only if pbase was specified

> +    {
> +        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, gbase);
> +        psize = dt_read_number(cells, size_cells);
> +
> +        /* Whether it is a new shm node? */
> +        if ( shm_memnode->meminfo.nr_banks != 0 )
In previous check with the same comment, you use tot_size to determine if it is a new shm mode

> +            goto out_early2;
> +    }
> +
> +    /*
> +     * The static shared memory node #dt_node is banked with a
> +     * statically configured host memory bank.
> +     */
> +    shm_memnode->meminfo.bank[0].start = pbase;
> +    shm_memnode->meminfo.bank[0].size = psize;
> +    shm_memnode->meminfo.nr_banks = 1;
You should be first checking for below error conditions before doing assignment?

> +
> +    if ( !IS_ALIGNED(pbase, PAGE_SIZE) )
> +    {
> +        printk("%pd: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
> +               d, pbase);
> +        return NULL;
> +    }
> +
> +    for ( i = 0; i < PFN_DOWN(psize); i++ )
> +        if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> +        {
> +            printk("%pd: invalid physical MFN 0x%"PRI_mfn"\n for static shared memory node\n",
> +                   d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
> +            return NULL;
> +        }
> +
> + out_early1:
not really informative. How about new_shm_node:?

> +    if ( !IS_ALIGNED(psize, PAGE_SIZE) )
> +    {
> +        printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
> +               d, psize);
> +        return NULL;
> +    }
> +    shm_memnode->meminfo.tot_size = psize;
> +
> + out_early2:
> +    if ( !IS_ALIGNED(*gbase, PAGE_SIZE) )
> +    {
> +        printk("%pd: guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> +               d, *gbase);
> +        return NULL;
> +    }
> +
> +    return shm_memnode;
> +}
> +
>  int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                         const struct dt_device_node *node)
>  {
> @@ -179,51 +346,17 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
> 
>      dt_for_each_child_node(node, shm_node)
>      {
> -        const struct dt_property *prop;
> -        const __be32 *cells;
> -        uint32_t addr_cells, size_cells;
>          paddr_t gbase, pbase, psize;
>          int ret = 0;
> -        unsigned int i;
>          const char *role_str;
>          const char *shm_id;
>          bool owner_dom_io = true;
> +        bool paddr_assigned = true;
wouldn't it be better if parse_shm_property was responsible for setting this to either false or true.
At the moment it only sets it to false.

> +        struct shm_memnode *shm_memnode;
> 
>          if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
>              continue;
> 
> -        /*
> -         * xen,shared-mem = <pbase, gbase, size>;
> -         * TODO: pbase is optional.
> -         */
> -        addr_cells = dt_n_addr_cells(shm_node);
> -        size_cells = dt_n_size_cells(shm_node);
> -        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
> -        BUG_ON(!prop);
> -        cells = (const __be32 *)prop->value;
> -        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
> -        psize = dt_read_paddr(cells, size_cells);
> -        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
> -        {
> -            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> -                   d, pbase, gbase);
> -            return -EINVAL;
> -        }
> -        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
> -        {
> -            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
> -                   d, psize);
> -            return -EINVAL;
> -        }
> -
> -        for ( i = 0; i < PFN_DOWN(psize); i++ )
> -            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
> -            {
> -                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
> -                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
> -                return -EINVAL;
> -            }
> -
>          /*
>           * "role" property is optional and if it is defined explicitly,
>           * then the owner domain is not the default "dom_io" domain.
> @@ -238,6 +371,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          }
>          BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
> 
> +        shm_memnode = parse_shm_property(d, shm_node, &paddr_assigned, &gbase,
> +                                         shm_id);
> +        if ( !shm_memnode )
> +            return -EINVAL;
empty line here please

> +        pbase = shm_memnode->meminfo.bank[0].start;
> +        psize = shm_memnode->meminfo.bank[0].size;
> +
>          /*
>           * DOMID_IO is a fake domain and is not described in the Device-Tree.
>           * Therefore when the owner of the shared region is DOMID_IO, we will
> @@ -349,10 +489,10 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>  {
>      const struct fdt_property *prop, *prop_id, *prop_role;
>      const __be32 *cell;
> -    paddr_t paddr, gaddr, size, end;
> +    paddr_t paddr, gaddr, size;
>      unsigned int i;
>      int len;
> -    bool owner = false;
> +    bool owner = false, paddr_assigned = true;
>      const char *shm_id;
> 
>      if ( address_cells < 1 || size_cells < 1 )
> @@ -404,96 +544,140 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
> 
>      if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
>      {
> +        /* paddr is not provided in "xen,shared-mem" */
>          if ( len == dt_cells_to_size(size_cells + address_cells) )
> -            printk("fdt: host physical address must be chosen by users at the moment.\n");
> -
> -        printk("fdt: invalid `xen,shared-mem` property.\n");
> -        return -EINVAL;
> +            paddr_assigned = false;
> +        else
> +        {
> +            printk("fdt: invalid `xen,shared-mem` property.\n");
> +            return -EINVAL;
> +        }
>      }
> 
>      cell = (const __be32 *)prop->data;
> -    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
> -    size = dt_next_cell(size_cells, &cell);
> -
> -    if ( !size )
> +    if ( !paddr_assigned )
> +        device_tree_get_reg(&cell, address_cells, size_cells, &gaddr, &size);
> +    else
>      {
> -        printk("fdt: the size for static shared memory region can not be zero\n");
> -        return -EINVAL;
> -    }
> +        paddr_t end;
> +
> +        device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
> +        size = dt_next_cell(size_cells, &cell);
> +
> +        if ( !size )
> +        {
> +            printk("fdt: the size for static shared memory region can not be zero\n");
> +            return -EINVAL;
> +        }
> +
> +        end = paddr + size;
> +        if ( end <= paddr )
> +        {
> +            printk("fdt: static shared memory region %s overflow\n", shm_id);
> +            return -EINVAL;
> +        }
> 
> -    end = paddr + size;
> -    if ( end <= paddr )
> -    {
> -        printk("fdt: static shared memory region %s overflow\n", shm_id);
> -        return -EINVAL;
>      }
> 
>      for ( i = 0; i < bootinfo.shminfo.nr_nodes; i++ )
>      {
> -        paddr_t bank_start = bootinfo.shminfo.shm_nodes[i].membank->start;
> -        paddr_t bank_size = bootinfo.shminfo.shm_nodes[i].membank->size;
>          const char *bank_id = bootinfo.shminfo.shm_nodes[i].node.shm_id;
> +        bool is_shmid_equal = strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 ?
> +                              true : false;
> 
>          /*
>           * Meet the following check:
> +         * when host address is provided:
>           * 1) The shm ID matches and the region exactly match
>           * 2) The shm ID doesn't match and the region doesn't overlap
>           * with an existing one
> +         * when host address is not provided:
> +         * 1) The shm ID matches and the region size exactly match
> +         */
> +        /*
> +         * For a static shared memory node, it is either banked with
> +         * a statically configured host memory bank(membank != NULL), or
> +         * arbitrary host memory which will later be allocated by Xen(
> +         * tot_size != 0).
>           */
> -        if ( paddr == bank_start && size == bank_size )
> +        if ( bootinfo.shminfo.shm_nodes[i].membank != NULL )
>          {
> -            if ( strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 )
> +            paddr_t bank_start = bootinfo.shminfo.shm_nodes[i].membank->start;
> +            paddr_t bank_size = bootinfo.shminfo.shm_nodes[i].membank->size;
both lines > 80 chars

> +            bool is_same_region = (paddr == bank_start) && (size == bank_size) ?
> +                                  true : false;
> +
> +            if ( is_same_region && is_shmid_equal )
>                  break;
> -            else
> +            else if ( is_same_region || is_shmid_equal )
>              {
>                  printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
>                         shm_id);
>                  return -EINVAL;
>              }
continue here and ...
>          }
> -        else if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
> -            continue;
>          else
no need for this else

>          {
> -            printk("fdt: different shared memory region could not share the same shm ID %s\n",
> -                   shm_id);
> -            return -EINVAL;
> +            paddr_t tot_size = bootinfo.shminfo.shm_nodes[i].tot_size;
> +            bool is_same_region = tot_size == size ? true : false;
> +
> +            if ( !paddr_assigned && is_same_region && is_shmid_equal )
> +                break;
> +            else if ( is_shmid_equal )
> +            {
> +                if ( paddr_assigned )
> +                {
> +                    printk("fdt: two different types of static shared memory region could not share the same shm-id %s\n",
> +                           shm_id);
> +                    return -EINVAL;
> +                }
> +
> +                printk("fdt: when host address is not provided, if xen,shm-id matches, size must stay the same too(%"PRIpaddr" -> %"PRIpaddr")\n",
> +                       size, tot_size);
> +                return -EINVAL;
> +            }
>          }
>      }
> 
>      if ( i == bootinfo.shminfo.nr_nodes )
>      {
> -        struct meminfo *mem = &bootinfo.reserved_mem;
> -
> -        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
> +        if ( i < NR_MEM_BANKS )
if ( i == NR_MEM_BANKS )
   goto fail;
this would reduce the number of if/else blocks

>          {
> -            struct membank *membank = &mem->bank[mem->nr_banks];
>              struct shm_node *shm_node = &bootinfo.shminfo.shm_nodes[i].node;
> -
> -            if ( check_reserved_regions_overlap(paddr, size) )
> -                return -EINVAL;
> -
> -            /* Static shared memory shall be reserved from any other use. */
> -            membank->start = paddr;
> -            membank->size = size;
> -            membank->type = MEMBANK_STATIC_DOMAIN;
> -            mem->nr_banks++;
> +            struct meminfo *mem = &bootinfo.reserved_mem;
> 
>              /* Record static shared memory node info in bootinfo.shminfo */
>              safe_strcpy(shm_node->shm_id, shm_id);
> -            /*
> -             * Reserved memory bank is recorded together to assist
> -             * doing shm node verification.
> -             */
> -            bootinfo.shminfo.shm_nodes[i].membank = membank;
>              bootinfo.shminfo.nr_nodes++;
> +
> +            if ( !paddr_assigned )
> +                bootinfo.shminfo.shm_nodes[i].tot_size = size;
> +            else if ( mem->nr_banks < NR_MEM_BANKS )
> +            {
> +                struct membank *membank = &mem->bank[mem->nr_banks];
> +
> +                if ( check_reserved_regions_overlap(paddr, size) )
> +                    return -EINVAL;
> +
> +                /* Static shared memory shall be reserved from any other use. */
> +                membank->start = paddr;
> +                membank->size = size;
> +                membank->type = MEMBANK_STATIC_DOMAIN;
> +                mem->nr_banks++;
> +
> +                /*
> +                 * Reserved memory bank is recorded together to assist
> +                 * doing shm node verification.
> +                 */
> +                bootinfo.shminfo.shm_nodes[i].membank = membank;
> +            }
> +            else
> +                goto fail;
>          }
>          else
> -        {
> -            printk("Warning: Max number of supported memory regions reached.\n");
> -            return -ENOSPC;
> -        }
> +            goto fail;
>      }
> +
>      /*
>       * keep a count of the number of borrowers, which later may be used
>       * to calculate the reference count.
> @@ -502,6 +686,10 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>          bootinfo.shminfo.shm_nodes[i].node.nr_shm_borrowers++;
> 
>      return 0;
> +
> + fail:
> +    printk("Warning: Max number of supported memory regions reached.\n");
> +    return -ENOSPC;
>  }
> 
>  int __init make_resv_memory_node(const struct domain *d, void *fdt,
> --
> 2.25.1
> 

~Michal

