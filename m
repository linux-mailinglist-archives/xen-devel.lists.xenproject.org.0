Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36626806E14
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649143.1013557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAqBL-0004lX-E0; Wed, 06 Dec 2023 11:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649143.1013557; Wed, 06 Dec 2023 11:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAqBL-0004jo-Ap; Wed, 06 Dec 2023 11:35:11 +0000
Received: by outflank-mailman (input) for mailman id 649143;
 Wed, 06 Dec 2023 11:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQZO=HR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rAqBK-0004jg-C6
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:35:10 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81e7c826-942b-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 12:35:09 +0100 (CET)
Received: from BN9P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::9)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 11:35:05 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:408:13e::4) by BN9P220CA0004.outlook.office365.com
 (2603:10b6:408:13e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Wed, 6 Dec 2023 11:35:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 11:35:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:35:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:35:03 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 6 Dec 2023 05:35:01 -0600
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
X-Inumbo-ID: 81e7c826-942b-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTOpLn2pxbrsEigyr3ZARwkJ5a9fScBamm5qw9UVQRa8yYpMDWszSH5Pr9g/q2WUPBC/q0cKwCATvfrUnVV+HbAgUtzSka/5og7J13LrbTLS1z2RcrcPWxCgOnd9SFm5VHn9OgUWGu7klPJWA+J0OEWMiQiZasIr73mZmFwwIfo9VIEKM9lptbpwTzuZ8T4klT3IjD21qZEWNG0bw6Fo77+5ParK0sGyJZUblmt1BRb+S+DCbN5mIKGgXUzMU5gy54Al1YdwGWG+B53lPufWWrub9tPPRUfvlQcnGhMXe+sZ/byJkRh5WF0bfys/03GOKSmoE7IFZVOnsKWQMPr7Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VxlAYorZ6hx9bTDrrfqZmv9S+meKM/WoC3ZESJsK4M=;
 b=fgsQhFTdM7vnUc/HPylgFSoqwRa45YqlZ4m6OGp0viAYEe9TTq8nw5NKNanyEE3WCh+bfj48pArJ8IV1vMaOLW+wstd8m0cTljFrJDGlHp90gP2JwLvlDe+v9cOauR584JhcCqFwnuIEFyCIW/vyza4jiu4tYGL1EECdLoz/y//K8W4tP5tdxDUWThqQT7xx3j3esetLN2kR+xDeKdycdxZyyubxQs46aSE60IlDAsDUZwPtYg+mA11Kn9WQ7u4w9NWLESlo42Wgdf/as9MCvvoKqVgZxf0f/T22imuMTg0j0F2247Z+2IR63X3BojyINS2JlME7dM1W+LZ8RXad1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VxlAYorZ6hx9bTDrrfqZmv9S+meKM/WoC3ZESJsK4M=;
 b=pHe9610rQuvqI2dKDCiSj4bF1/jwUcANjLfNn00IO5sOJa4ZViScAqRjRatx7xE4fsNTBIe4jacSNTCkct248DbaBL98dFo5+V7jkX/tIeMVHtONn2fDGH712S7xYwZp0Gvf9KbnK967c/NoCrdr3zaPiFr6ozd8GOyLzLBvkvQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fed944e1-cb66-46a1-b327-d69ad280cc5f@amd.com>
Date: Wed, 6 Dec 2023 12:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] xen/arm: avoid repetitive checking in
 process_shm_node
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-3-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231206090623.1932275-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH2PR12MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: e852789f-a8e7-4b6d-2668-08dbf64f64a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CSAGW6u0IzcSE+gQ1VYd7+zSiL+ResttV5oNv/SbFKxa8XmEDVGoV0PG+rQ5Yb8sjaCJVZJ7mav/9zhdwTEN+sv5yc2tniQKmYKAmAJtjGuroXDMEhbw1Y7s184tfwZM5CroaUzDgj9IByaN4xel+NRVbJJq3WHJFmKX7BXZZQM+nAtgowe5UoOyP9ykK/DmM58kZGGUo3D+gyjN9/VQ2qRb2CqqNRXq/RJgq2R2ETG/wBKSpVdIj+FGYiCxHPKW79fy4ImzkX+22FnrXN2suYtMCNsRriIkUyu/uhjxR0jj40M9t+VdX0IQDvmH4buQxHah3MmrTa1UpbiPaHexZXhhXkH2aJADxgO4UJ8fYweSfAiCenfrUwx5kMRVR0eFV607ysndSYESPKfW4v58mguFflqmnnzFFf7zVyCotG/dY2E/fJ2zHm0O3akNioqzGp8mB63iAdEOr48tO9oHL8mF2lwlEXH7xybSmwY8yoedUv+YXihtpcevyXyaP2PpaU73BvyVjehzijb8bjwVBKebfWW5TOVAr30zEilvXE51lc7EKG++SU40SR04hDmglqDIU03NQvIdnxTo7J/kf/25oC4MEJ3THsHQ+kU1T3yb+CEFtJ50NoUD9Vc0PUrB8i8+fXYUZRioCxOSAln+VmytZvNpj0NPJgjAFuKzTcsZzh37bY43Imvp0FUhDxuB8LFbQL37FqDjr+LGALcfcIDjcuHbMkmT/HO97OiOowUE784wXthhs10HfuuXNYdLUChB3LTtHSaPdvFkByvuuD0Z6sgxrVHYLLPoji5+5WdW8ym2RabIsZgdDLXbkTyw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(84040400005)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82310400011)(46966006)(40470700004)(36840700001)(36860700001)(47076005)(356005)(81166007)(53546011)(26005)(336012)(426003)(40480700001)(54906003)(16576012)(70206006)(70586007)(31686004)(316002)(31696002)(110136005)(82740400003)(83380400001)(2616005)(478600001)(4326008)(8936002)(8676002)(86362001)(40460700003)(5660300002)(2906002)(36756003)(41300700001)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:35:05.4088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e852789f-a8e7-4b6d-2668-08dbf64f64a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279

Hi Penny,

On 06/12/2023 10:06, Penny Zheng wrote:
> 
> 
> Putting overlap and overflow checking in the loop is causing repetitive
> operation, so this commit extracts both checking outside the loop.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
In general the patch looks good to me:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

That said, there are 2 things I realized during review.

> ---
> v6:
> new commit
> ---
>  xen/arch/arm/static-shmem.c | 39 +++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index cb268cd2ed..1a1a9386e4 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -349,7 +349,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>  {
>      const struct fdt_property *prop, *prop_id, *prop_role;
>      const __be32 *cell;
> -    paddr_t paddr, gaddr, size;
> +    paddr_t paddr, gaddr, size, end;
>      struct meminfo *mem = &bootinfo.reserved_mem;
>      unsigned int i;
>      int len;
> @@ -422,6 +422,13 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>          return -EINVAL;
>      }
> 
> +    end = paddr + size;
> +    if ( end <= paddr )
> +    {
> +        printk("fdt: static shared memory region %s overflow\n", shm_id);
> +        return -EINVAL;
> +    }
> +
>      for ( i = 0; i < mem->nr_banks; i++ )
>      {
>          /*
> @@ -441,30 +448,13 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>                  return -EINVAL;
>              }
>          }
> +        else if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
> +            continue;
>          else
>          {
> -            paddr_t end = paddr + size;
> -            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
> -
> -            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
You are iterating over reserved memory regions in general, so apart from shmem regions there might be truly /reserved ones.
It appears that we don't have overflow check in device_tree_get_meminfo, so this second check was the only place to detect that
(protected by a feature, so not very useful) :) This is just an observation and I agree to drop it. We should be checking for an
overflow in device_tree_get_meminfo.

The second observation I made is that we don't seem to assign and check the return code from device_tree_for_each_node.
This means, that any error while parsing the early fdt (e.g. static shm issues) does not stop Xen from booting, which might result in strange behavior later on.
If others agree, I'm ok to send a fix for that.

~Michal

