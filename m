Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC66808BC8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 16:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650001.1015178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGIO-0001Id-Fr; Thu, 07 Dec 2023 15:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650001.1015178; Thu, 07 Dec 2023 15:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGIO-0001GR-CE; Thu, 07 Dec 2023 15:28:12 +0000
Received: by outflank-mailman (input) for mailman id 650001;
 Thu, 07 Dec 2023 15:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3y0a=HS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBGIM-0001FA-KB
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 15:28:10 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389de1f1-9515-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 16:28:08 +0100 (CET)
Received: from DM6PR01CA0021.prod.exchangelabs.com (2603:10b6:5:296::26) by
 PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Thu, 7 Dec 2023 15:28:04 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:296:cafe::b7) by DM6PR01CA0021.outlook.office365.com
 (2603:10b6:5:296::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 15:28:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 15:28:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 09:28:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 09:28:03 -0600
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 7 Dec 2023 09:28:01 -0600
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
X-Inumbo-ID: 389de1f1-9515-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+CHjTPBCYvmJeCLDzc1kKPRuwSzlFHQSTT1TCogrNgW9EHaePyylY0kkAG70NP/N/k7/RJz+C22yxvzuGdQltCJZ49GDaJfBK3ioB+fsCwqA1xDf0Vu5/wrVqcf28H6EgRKvB+3/qUxgsOyXErn5ZSHCby+Wlu/88PBcrrLMiQMXtY6nVBIow6VKHSNxH6KJOxB/vinPSU4ToDUToqEKBKNlWx84Ox8P8XB1K4NLXCsmouF/WowQdT8lBOwqTjKH9Bqfe9pRVcOyRZdT+lRkfq/wNfpcpBsqVMUcuI4YWaWfuICGG7athktZJMBSxUMIONE+3ZPb3Eu81+MjiZLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpMG63mrgN/tJWzH5iLAK5Euh3C5zliYN2vIz1Zx/nc=;
 b=jVy82q6xwN7wNmbbQJ+2gm+Ww7pAfJ4xWHOxMx/YXP8xavIllwCNuMHkqXtdjyC4tthe92L39AM4bw2DrunzmsfL9LlWzFDFuTSdObFjos82xY9EP0Dcjjboq45Fj70KPgwjpD48wmu0rHPu7IB7BnB+DLe391ji4iBrohQCX4GElJrQehazG2LsggjZ6782Nq2OTKLICLkd1Zqf4J7ickx2nppYPQcdP/L0Ty4Z8Gj4OcHlZvnB1u0BTHh19LEOns3sYLCCKRKhPN+GnPVVE2BPpEdmJG3WyslUQJ2Ps813ESbOvfgsAkIm9yTVZDqAdQDJKuxLRaR8w2ygKR4uUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpMG63mrgN/tJWzH5iLAK5Euh3C5zliYN2vIz1Zx/nc=;
 b=X0Yc/XzaCuFqgbthVe98kCHuJ3seagq8M65r2qivTJQIxs4VU2wtCc/9TvzfpnebcyxOIG+2eXKQKJePggXGWvQaJ3wXHVaP94IuPO8Qn2ScpFpv3ec+/pjHABhwZyuyo+mSJYBPvzLzArQXDCk8eyxpfGinTHdGI204OIafOs0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9f4fc7b3-805b-4adb-a482-4bdbaa0f2aff@amd.com>
Date: Thu, 7 Dec 2023 16:28:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] xen/arm: create another /memory node for static
 shm
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-12-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231206090623.1932275-12-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: 9603446d-bede-4016-75f6-08dbf7391ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	brEJh3zTWo+efe5STKJK/uK055VjaeRx0MMf6xyHQEbeVmmnhSCDYLJ7z7GHRvlKe1AwG0AdxSKEt/2CCGTd6qhUxdkVrNfeuEPjGiiKda7JV+gfoAF/UCm86SAoPm71iuGNaSFk6USFL40JiXDCJ+zcB31hKbqzIVH49TYSkPKnm+Cuvh7isgTtfO8ooWmgGXkQnDGD2cGVAVXSOJfz0EJYGJoufxy5LrPa2mj1xF1JeaR/50tEMQgTOPM++izCKxD6+qWL1JWD29hPJY5J615IIfO/a+fvV5Iy9KgHA4dt3p6G0XqDdvuZi8UbIv6mGY6x2xWL0s9rkl30BvNiUhf8oJhUPLIX4y0+bBA2CKAceA6pc//CgySFJT+/YZQsW1uGj4PGcV8+UzXyhdxBdkcAUGv+vB3JMUtuuQGHu83+Nwadvar8bVJ8HQoRmYxHs+QnEXA1Ucs2FYtLeYwYxUvYwZ+1fY5G7SKfNsu/wU/C89jm1d6KzgoOWFtcpCU5lE6bJ8pS8hZ/dObmPvSuGKcIS1928GAcgtRn/d174CMgWS894A0XfAH7E7Y+gdehilw5utdIvofKc3cwRFKnQfvNhh/Loq4/LIbsXJKEv35NXmrCp6qIHWiAKlnPJEMwVVC7ruk+egy9MN6DyKifmHPW5muTAnnO/rHcPk8qF++dnKZ29/zRO31RUArUicUPtpPH47B6Zvz2sk8LyC5rWVWLyeO1HSlqUx9xQ/5j+LYDcZxiFCKgz3UUJiNVNkWkrTYkAlr1N9Eu1rKmQqiiftgaDPiejtvFjKizmkKwf1aBVQfm8ADjUTQfi17o7YQS
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799012)(82310400011)(64100799003)(451199024)(186009)(36840700001)(40470700004)(46966006)(40480700001)(31686004)(40460700003)(36860700001)(41300700001)(5660300002)(2906002)(36756003)(16576012)(8676002)(316002)(4326008)(336012)(81166007)(110136005)(356005)(426003)(478600001)(53546011)(2616005)(54906003)(86362001)(70586007)(31696002)(82740400003)(26005)(70206006)(8936002)(44832011)(47076005)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 15:28:03.8093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9603446d-bede-4016-75f6-08dbf7391ae5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688

Hi Penny,

On 06/12/2023 10:06, Penny Zheng wrote:
> 
> 
> Static shared memory region shall be described both under /memory and
> /reserved-memory.
> 
> We introduce export_shm_memory_node() to create another /memory node to
> contain the static shared memory ranges.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> 
> ---
> v3 -> v4:
> new commit
> ---
> v4 -> v5:
> rebase and no changes
> ---
>  xen/arch/arm/dom0less-build.c           |  8 ++++++++
>  xen/arch/arm/domain_build.c             |  8 ++++++++
>  xen/arch/arm/include/asm/static-shmem.h | 10 ++++++++++
>  xen/arch/arm/static-shmem.c             | 19 +++++++++++++++++++
>  4 files changed, 45 insertions(+)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index ac096fa3fa..870b8a553f 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -645,6 +645,14 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
> 
> +    /* Create a memory node to store the static shared memory regions */
> +    if ( kinfo->shminfo.nr_banks != 0 )
There is no need for this check to be repeated every time export_shm_memory_node is used.
When the feature is disabled, export_shm_memory_node will return 0 anyway.
Furthermore, there is no need for kinfo->shminfo exposure. Please move the check to the function itself.

Also, I think both this and previous patch could be moved towards the beginning of the series.
They are not related to other things you do in the series.


> +    {
> +        ret = export_shm_memory_node(d, kinfo, addrcells, sizecells);
> +        if ( ret )
> +            goto err;
> +    }
> +
>      ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
>      if ( ret )
>          goto err;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f098678ea3..4e450cb4c7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1873,6 +1873,14 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                  return res;
>          }
> 
> +        /* Create a memory node to store the static shared memory regions */
> +        if ( kinfo->shminfo.nr_banks != 0 )
> +        {
> +            res = export_shm_memory_node(d, kinfo, addrcells, sizecells);
> +            if ( res )
> +                return res;
> +        }
> +
>          /* Avoid duplicate /reserved-memory nodes in Device Tree */
>          if ( !kinfo->resv_mem )
>          {
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 6cb4ef9646..385fd24c17 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -38,6 +38,10 @@ int make_shm_memory_node(const struct domain *d,
>                           void *fdt,
>                           int addrcells, int sizecells,
>                           const struct kernel_info *kinfo);
> +
> +int export_shm_memory_node(const struct domain *d,
> +                           const struct kernel_info *kinfo,
> +                           int addrcells, int sizecells);
>  #else /* !CONFIG_STATIC_SHM */
> 
>  static inline int make_resv_memory_node(const struct domain *d, void *fdt,
> @@ -86,6 +90,12 @@ static inline int make_shm_memory_node(const struct domain *d,
>      return 0;
>  }
> 
> +static inline int export_shm_memory_node(const struct domain *d,
> +                                         const struct kernel_info *kinfo,
> +                                         int addrcells, int sizecells)
> +{
> +    return 0;
> +}
>  #endif /* CONFIG_STATIC_SHM */
> 
>  #endif /* __ASM_STATIC_SHMEM_H_ */
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index bfce5bbad0..e583aae685 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -505,6 +505,25 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>      return 0;
>  }
> 
> +int __init export_shm_memory_node(const struct domain *d,
> +                                  const struct kernel_info *kinfo,
> +                                  int addrcells, int sizecells)
> +{
> +    unsigned int i = 0;
> +    struct meminfo shm_meminfo;
> +
> +    /* Extract meminfo from kinfo.shminfo */
> +    for ( ; i < kinfo->shminfo.nr_banks; i++ )
> +    {
> +        shm_meminfo.bank[i].start = kinfo->shminfo.bank[i].membank.start;
> +        shm_meminfo.bank[i].size = kinfo->shminfo.bank[i].membank.size;
> +        shm_meminfo.bank[i].type = MEMBANK_DEFAULT;
Is all of this really needed? This series introduces so many structures to avoid using
meminfo but at the end we still need to use it. The amount of meminfo like structures copying
done in this series worries me a bit.

~Michal


