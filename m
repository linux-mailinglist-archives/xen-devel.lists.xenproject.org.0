Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5B8894D1
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 09:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697603.1088498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofOi-0000Rv-Qc; Mon, 25 Mar 2024 08:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697603.1088498; Mon, 25 Mar 2024 08:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofOi-0000P4-Ll; Mon, 25 Mar 2024 08:09:36 +0000
Received: by outflank-mailman (input) for mailman id 697603;
 Mon, 25 Mar 2024 08:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuX/=K7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rofOg-0000NX-Tv
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 08:09:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0337cad9-ea7f-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 09:09:33 +0100 (CET)
Received: from DM6PR18CA0034.namprd18.prod.outlook.com (2603:10b6:5:15b::47)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 08:09:29 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::1c) by DM6PR18CA0034.outlook.office365.com
 (2603:10b6:5:15b::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 08:09:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 08:09:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 03:09:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 03:09:26 -0500
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
X-Inumbo-ID: 0337cad9-ea7f-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN1pE6z/OX8Kc5m1SX3UsIIbW9pMZ3oi76ysGWe2+1yOUwDo3n6hY6JD0HLwmTpYcFOq746Qn3iW5txEObiwtedmltX6nN3Dcx0Dh+9mt+4cPv7JekV21k1v5Gdtpjtloc44Hn5guB9Qr/Xin/q6HNaK6q3LzO1RSyEcK3ndyrmqzZd2IeqGS9JLFFOzD5FLUKBUPf06vCY6MdmOqgV8a15XOeuO1r8sVmxoZZwmSXpyOZLLKQmxIp4UEyKrbye1628wi5XimhYoU08/c+CCzQEyaP4ZdQRXIaC+9Aa+qMy51VjDz00sKUAE6ABHlKn4dqPSZfir/shWehtzGXm//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qqCeHiGxcnKtEmwLOpaSsREI/g5oQTNBqhU0BNwswI=;
 b=DIIaC8F27Vfet681OAWpNQQidzI16LKbCEM7muWJ6TN2iSSS+q0zX2BNv59E3mnmkLe9Ws+qoM9Ifn7kyTAAq8O59+8ddcb9545YPWd25S9SfUO34Zpd3VasXYsBXF1wp3OysXBoauD6/wdnZzgOt68PNYKh9veief6UW7JekqE1mpn5tv431PQwaR94BHlPkZ8cPK9f1aZOzbdkoOXj4TRtrxz5jCo+/Br8kr4FMX/Jcsd/U8fE6AoGy0WYfg1bf6V/1f+QpgFFOWyq5pWuZHvZQzm6RpAmBSut6vaB+Z9pMaI0SGti2lxTsQji7Fds5pkkAI+YjV7Se08gr4c2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qqCeHiGxcnKtEmwLOpaSsREI/g5oQTNBqhU0BNwswI=;
 b=y5LxeBu+66Gd+fDF/iKhdnYj7oEflcBZKoSXRex+r/wIiKWOoW1FmH8FS4AOQUN4YWztzpAKOgXrwjqrTGXq9mdwRwPiuioAIdczaiPznIEs25opMRgWRfpCHLiJSuaKRAx7ymaclAo+fRhNcCbZWy/GF896InuSgRZkIXedEEk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <48ac6c83-a907-4442-ad3d-15653caaf64a@amd.com>
Date: Mon, 25 Mar 2024 09:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] xen/arm: fix duplicate /reserved-memory node in
 Dom0
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-11-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-11-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|DS7PR12MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 976408e8-a81a-4f97-f9a9-08dc4ca2e52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I5IgkQQCinrGcH+sxAQrVBUA8ZmT9zkGXVEXf8X6Xuar56CeI7nvXblXoOE3+Xvjmzkoic8aDLBcHXXpUL9Hf9OZHsJBYEgK8GyEMjkp6CtBcwe+cxypyhEWioGx5tPrJvpyde9pM0RpTNcWdzWrueX6rCpPjXAkdj5Y5RGN7scM3NFIrBWH6rtMxgffUSD8r1jhjgXUan9bybk+8I21QPfEt4n0PGuRtMr8tDuEC+fkLAEm4AGIF09Lzw/cRocUtexWK/yMSIGFl4frUpKMofwQ4u01tcf6GzeYhgtwJ6URRboi93PZMf6fr6ZuskLd5kxzQPi2H6AVObcx6FTuNJePim3zpHwbDIipmEXnz1mYEDhxfFC9c92HVmtaLER5f/jJGNpYJGJNwkYnnynRz0rdgwiQ7mkpe9fWWHfQ3tK5GIfu2DGl/uoqB8agtKvyH+/+5V7nAPLcWMNiiEYaCP8FP/nuTGw19DQY7GXVhm8VsssLMYbOBU0poWIFNYM8ulBAQmCn74AS3paKWjhMhyavBOYNS2BUC9cKatXa8L63tqrxEsDVT2TE8Mtv8XgXhtaYmNwmcey6uFok437NUOk3N8yLDp60odq2rIg9WJ79t/D4Vs6Z4Kyo01YyrT/ODr51oa+fOk0DIL/fzglegegNCVhBBT7ZEZ4iD3wkQ/vQ7THXubvF/v0AwMcYhp0nNJbl8q1pYdjUx7TE0Af/7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 08:09:28.7057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 976408e8-a81a-4f97-f9a9-08dc4ca2e52f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In case there is a /reserved-memory node already present in the host dtb,
> current Xen codes would create yet another /reserved-memory node when
> the static shared memory feature is enabled and static shared memory
> region are present, this would result in an incorrect device tree
s/region/regions, please add full stop after present.

> generation and guest would not be able to detect the static shared memory
s/guest/hwdom to make it clear when the issue can be observed

> region.
> 
> Avoid this issue checking the presence of the /reserved-memory node and
by checking

> appending the nodes instead of generating a duplicate /reserved-memory.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v1:
>  - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-11-Penny.Zheng@arm.com/
> ---
>  xen/arch/arm/domain_build.c             | 23 ++++++++++++++++++++---
>  xen/arch/arm/include/asm/static-shmem.h | 11 +++++++++++
>  xen/arch/arm/static-shmem.c             | 12 +++++++-----
>  3 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 740c483ea2db..575e906d81a6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1620,6 +1620,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>          DT_MATCH_PATH("/hypervisor"),
>          { /* sentinel */ },
>      };
> +    static __initdata bool res_mem_node_found = false;
>      struct dt_device_node *child;
>      int res, i, nirq, irq_id;
>      const char *name;
> @@ -1714,6 +1715,19 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>      if ( res )
>          return res;
> 
> +    if ( dt_node_path_is_equal(node, "/reserved-memory") )
> +    {
> +        res_mem_node_found = true;
> +        /*
> +         * Avoid duplicate /reserved-memory nodes in Device Tree, so list the
s/list/add

> +         * static shared memory nodes there.
> +         */
> +        res = make_shm_memory_node(d, kinfo, dt_n_addr_cells(node),
> +                                   dt_n_size_cells(node));
> +        if ( res )
> +            return res;
> +    }
> +
>      for ( child = node->child; child != NULL; child = child->sibling )
>      {
>          res = handle_node(d, kinfo, child, p2mt);
> @@ -1766,9 +1780,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                  return res;
>          }
> 
> -        res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
> -        if ( res )
> -            return res;
> +        if ( !res_mem_node_found )
> +        {
> +            res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
> +            if ( res )
> +                return res;
> +        }
>      }
> 
>      res = fdt_end_node(kinfo->fdt);
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 2f70aed53ac7..d28b9540d49b 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -35,6 +35,10 @@ int remove_shm_from_rangeset(const struct kernel_info *kinfo,
>  int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
>                                struct membanks *ext_regions);
> 
> +int make_shm_memory_node(const struct domain *d,
> +                         const struct kernel_info *kinfo, int addrcells,
> +                         int sizecells);
> +
>  #else /* !CONFIG_STATIC_SHM */
> 
>  static inline int make_resv_memory_node(const struct domain *d,
> @@ -79,6 +83,13 @@ static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
>      return 0;
>  }
> 
> +static inline int make_shm_memory_node(const struct domain *d,
> +                                       const struct kernel_info *kinfo,
> +                                       int addrcells, int sizecells)
> +{
> +    return 0;
> +}
> +
>  #endif /* CONFIG_STATIC_SHM */
> 
>  #endif /* __ASM_STATIC_SHMEM_H_ */
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index b3e2105dd3f2..67d5fa3b5d25 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -287,15 +287,17 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>      return 0;
>  }
> 
> -static int __init make_shm_memory_node(const struct domain *d, void *fdt,
> -                                       int addrcells, int sizecells,
> -                                       const struct membanks *mem)
> +int __init make_shm_memory_node(const struct domain *d,
> +                                const struct kernel_info *kinfo, int addrcells,
> +                                int sizecells)
Strictly speaking, changing the function signature is not mandatory for this change, so I would
at least mention it in the commit msg.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


