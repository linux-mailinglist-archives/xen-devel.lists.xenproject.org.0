Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2AC6E4C5D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 17:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522243.811467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQQx-0008JM-5P; Mon, 17 Apr 2023 15:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522243.811467; Mon, 17 Apr 2023 15:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQQx-0008GQ-2F; Mon, 17 Apr 2023 15:06:23 +0000
Received: by outflank-mailman (input) for mailman id 522243;
 Mon, 17 Apr 2023 15:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poQQv-0008GK-In
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 15:06:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e89::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66d544df-dd31-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 17:06:18 +0200 (CEST)
Received: from BN0PR04CA0106.namprd04.prod.outlook.com (2603:10b6:408:ec::21)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 17 Apr
 2023 15:06:12 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::d8) by BN0PR04CA0106.outlook.office365.com
 (2603:10b6:408:ec::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 15:06:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Mon, 17 Apr 2023 15:06:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 10:06:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 08:06:10 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 10:06:08 -0500
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
X-Inumbo-ID: 66d544df-dd31-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jV4mAzLlAtvyfjSX+cvfIgl8p/8SJVeNaUy8n3VC69rm8xlA43GNJZrgLUcm23z0J6HNnTrvW/IPGFuAnLFOgyovk46SO4B6je0ZM1yi5Dka9TNDGyzZshl+NWBlqgM6o2ooS+lpU2VXssSq8iN/KJuC2rXfItvaVBUD4IFtMEzygTWU9XMh62PaqdXjXP8usAsDjPl7PAZRxicZqlM3n8GjlYpdAH4UdnkmvqH52qmUbjbgIwsYeZ0nTu58zjJtOiaN2dtU+IBiXsBIGHomObWd34+qm80Kqbsx+3OvnJX8DvLDMbcXqTa/m27QqHYsXsB8ol+KmVCgKJ+1la9Nug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl1EUnjKckzVE+mHGFs2owfDy7i9e5SX6+iIAxhiaUA=;
 b=Eazcf2EMTEJUgIPl65KBWh+an7kt2310HF+Azt4xNzE8OitdS2HVE01NZ0TQAl3AhOSKRv2OppHYbWcbcSOzsa+S0ncGGr+vrqBs63R84be4ench1QA5t4NSmQfLAMRoptpzeqne7GK8rvc8jXE0B7OTrnNeTEc3nvVdUuhGX1icNpaygqrF+FGf/Y6rSAl375PJrm15+aLwkmx3O+d4iPJf5YbsMIxju5WspQvolBg4yTgQaUvWcdw3sppuqbAW2mFutb58HGp1OML1nJFVBNDp/FeMn5Ba5zwgL0Cy1Lu/uY33gsJZLzhV+x265smmqolt7MNQb5PbgvizGDp/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl1EUnjKckzVE+mHGFs2owfDy7i9e5SX6+iIAxhiaUA=;
 b=gb5EJxZFHoh6vfa6ANOq23wV524lkpe+NzesrBYRu0Jo9vkqanaM0otc4gjJ+mHwHh8clPB61YIUe76PrQdu/mx4P5J9eSwM+spgI7T9gEGgcOZAwrr2bxdE9YAYwhk6/+0pt9j6UqS8pCGHpZIId34hz1Ljd2Vsu4/mH69bc5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6e6ee0c8-7cc8-13ab-3cf9-ea1b1147efc2@amd.com>
Date: Mon, 17 Apr 2023 17:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 13/17] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-14-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-14-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT011:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe2e688-eb18-4f6c-bade-08db3f55482d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gy3ljCiVk9hDOoPvicFz5fXtBMyGMMNP4/tcjg+nsHvYaYoKdJJsPgbuIyx7HBeaZGrkIr8qRyyC3Ug4QqCYyYbP8PDwZkJjXOfDLqS7CoHcGoKM0SzeYvu8f9Zo6Gs/N+nQQxQKCRxW3DE1uc9/l7rK4lTEvYg8hwUh4It/pcT6P3XuhEL8B2IHWEcmAy8VzlujlfW7OLB0miXt318mPSOtw0qll7XL2BI7f9QMG5HkGv/W58Ao+W0BSDyFgpLDSprG8pkdWdHPPrtHPISnEp+wrEDJIt+ti7+gRJ+qkUjt4leuTN+C0j7WhOSIuSf5B/flRjcMYyR2oqjHJYYSkgr2WBjnxIFmrHnxPTbYr+7EdreuISlOMcL9PToGzICVLGw1wStpi74ZTMEAnPGsY+ClYED+aI4ZH0tBWZlQgqpy+WdTzWi9x2z7mrF1rYVaniVja3riS5EZpczJaAJsjSJ77rZ9HU3HMwr/35zW7+pZH48S733irWAkGNh+B5BfMCav6ExluifP9qZOkWZnD59q4Si/Gx8vPKOzVUcpxHlg3rclAUOFAa2ZMAtbFJxjf9lQeawKFZXWiiwpGm2eo/IvhK7m0xKXybCwsrdMBXcYDiOBTOf6TcjB8dkpy1/JeLuPG2EPq1Gq8OBo8K3XGcVnPOany1/vuGZtaJc2/BE48fM/NhMiSqoLEb+KQt8lGzirzN9+LIJ4jUBlNKcIy+dj7Skg6+x3HAyKCZmZ1tXMQzT0YXGKyBmtY+xjGl0SJvjz5coigFC/vnkZ7vjXAQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(47076005)(40460700003)(31686004)(36756003)(4326008)(41300700001)(54906003)(8676002)(70206006)(16576012)(110136005)(70586007)(316002)(81166007)(478600001)(86362001)(31696002)(336012)(2616005)(83380400001)(26005)(53546011)(426003)(5660300002)(82310400005)(2906002)(36860700001)(40480700001)(44832011)(30864003)(8936002)(82740400003)(356005)(186003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 15:06:11.8314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe2e688-eb18-4f6c-bade-08db3f55482d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> device tree overlay.
> 
> xl dt-overlay remove file.dtbo:
>     Removes all the nodes in a given dtbo.
>     First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
>     in dt_host and delete the device node entries from dt_host.
> 
>     The nodes get removed only if it is not used by any of dom0 or domio.
> 
> Also, added overlay_track struct to keep the track of added node through device
> tree overlay. overlay_track has dt_host_new which is unflattened form of updated
> fdt and name of overlay nodes. When a node is removed, we also free the memory
> used by overlay_track for the particular overlay node.
> 
> Nested overlay removal is supported in sequential manner only i.e. if
> overlay_child nests under overlay_parent, it is assumed that user first removes
> overlay_child and then removes overlay_parent.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/sysctl.c        |  16 +-
>  xen/common/Makefile          |   1 +
>  xen/common/dt_overlay.c      | 415 +++++++++++++++++++++++++++++++++++
>  xen/include/public/sysctl.h  |  24 ++
>  xen/include/xen/dt_overlay.h |  59 +++++
>  5 files changed, 514 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/dt_overlay.c
>  create mode 100644 xen/include/xen/dt_overlay.h
> 
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index b0a78a8b10..672db61650 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,6 +12,7 @@
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
>  #include <public/sysctl.h>
> +#include <xen/dt_overlay.h>
xen/ headers should be grouped together so this should be moved before public/.

> 
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
> @@ -21,7 +22,20 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
> -    return -ENOSYS;
> +    long ret = 0;
> +
> +    switch ( sysctl->cmd )
> +    {
> +    case XEN_SYSCTL_dt_overlay:
> +        ret = dt_sysctl(&sysctl->u.dt_overlay);
> +        break;
> +
> +    default:
> +        ret = -ENOSYS;
> +        break;
> +    }
> +
> +    return ret;
>  }
> 
>  /*
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 46049eac35..be78c9a8c2 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-$(CONFIG_OVERLAY_DTB) += dt_overlay.o
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-y += event_fifo.o
> diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
> new file mode 100644
> index 0000000000..516e8010c5
> --- /dev/null
> +++ b/xen/common/dt_overlay.c
> @@ -0,0 +1,415 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0
Our CODING_STYLE states that SPDX tag should be a single line comment at the top of the file.

> + *
> + * xen/common/dt_overlay.c
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
The copyright year as well as company name is different here than in the header dt_overlay.h

> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#include <xen/iocap.h>
> +#include <xen/xmalloc.h>
> +#include <asm/domain_build.h>
> +#include <xen/dt_overlay.h>
> +#include <xen/guest_access.h>
Sort headers alphabetically and group them depending on xen/ or asm/.

> +
> +static LIST_HEAD(overlay_tracker);
> +static DEFINE_SPINLOCK(overlay_lock);
> +
> +/* Find last descendants of the device_node. */
> +static struct dt_device_node *find_last_descendants_node(
> +                                            struct dt_device_node *device_node)
To correctly split arguments this should be:
static struct dt_device_node *
find_last_descendants_node(struct dt_device_node *device_node)

> +{
> +    struct dt_device_node *child_node;
> +
> +    for ( child_node = device_node->child; child_node->sibling != NULL;
> +          child_node = child_node->sibling )
> +    {
> +    }
> +
> +    /* If last child_node also have children. */
> +    if ( child_node->child )
> +        child_node = find_last_descendants_node(child_node);
> +
> +    return child_node;
> +}
> +
> +static int dt_overlay_remove_node(struct dt_device_node *device_node)
> +{
> +    struct dt_device_node *np;
> +    struct dt_device_node *parent_node;
> +    struct dt_device_node *device_node_last_descendant = device_node->child;
> +
> +    parent_node = device_node->parent;
> +
> +    if ( parent_node == NULL )
> +    {
> +        dt_dprintk("%s's parent node not found\n", device_node->name);
> +        return -EFAULT;
> +    }
> +
> +    np = parent_node->child;
> +
> +    if ( np == NULL )
> +    {
> +        dt_dprintk("parent node %s's not found\n", parent_node->name);
> +        return -EFAULT;
> +    }
> +
> +    /* If node to be removed is only child node or first child. */
> +    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
> +    {
> +        parent_node->child = np->sibling;
> +
> +        /*
> +         * Iterate over all child nodes of device_node. Given that we are
> +         * removing parent node, we need to remove all it's descendants too.
> +         */
> +        if ( device_node_last_descendant )
> +        {
> +            device_node_last_descendant =
> +                                        find_last_descendants_node(device_node);
> +            parent_node->allnext = device_node_last_descendant->allnext;
> +        }
> +        else
> +            parent_node->allnext = np->allnext;
> +
> +        return 0;
> +    }
> +
> +    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> +    {
> +        if ( !dt_node_cmp(np->sibling->full_name, device_node->full_name) )
> +        {
> +            /* Found the node. Now we remove it. */
> +            np->sibling = np->sibling->sibling;
> +
> +            if ( np->child )
> +                np = find_last_descendants_node(np);
> +
> +            /*
> +             * Iterate over all child nodes of device_node. Given that we are
> +             * removing parent node, we need to remove all it's descendants too.
> +             */
> +            if ( device_node_last_descendant )
> +                device_node_last_descendant =
> +                                        find_last_descendants_node(device_node);
> +
> +            if ( device_node_last_descendant )
> +                np->allnext = device_node_last_descendant->allnext;
> +            else
> +                np->allnext = np->allnext->allnext;
> +
> +            break;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/* Basic sanity check for the dtbo tool stack provided to Xen. */
> +static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
> +{
> +    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
> +          fdt_check_header(overlay_fdt) )
> +    {
> +        printk(XENLOG_ERR "The overlay FDT is not a valid Flat Device Tree\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +/* Count number of nodes till one level of __overlay__ tag. */
> +static unsigned int overlay_node_count(void *fdto)
fdto can be const. Also in other function you name the same parameter as overlay_fdt
so it would be best to stick to one naming scheme.

> +{
> +    unsigned int num_overlay_nodes = 0;
> +    int fragment;
> +
> +    fdt_for_each_subnode(fragment, fdto, 0)
> +    {
> +        int subnode;
> +        int overlay;
> +
> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +
> +        /*
> +         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> +         * overlay >= 0. So, no need for a overlay>=0 check here.
> +         */
> +        fdt_for_each_subnode(subnode, fdto, overlay)
> +        {
> +            num_overlay_nodes++;
> +        }
> +    }
> +
> +    return num_overlay_nodes;
> +}
> +
> +static int handle_remove_irq_iommu(struct dt_device_node *device_node)
> +{
> +    int rc = 0;
> +    struct domain *d = hardware_domain;
> +    domid_t domid;
> +    unsigned int naddr, len;
> +    unsigned int i, nirq;
> +    uint64_t addr, size;
You could limit the scope of addr and size by moving them to for loop.

> +
> +    domid = dt_device_used_by(device_node);
> +
> +    dt_dprintk("Checking if node %s is used by any domain\n",
> +               device_node->full_name);
> +
> +    /* Remove the node iff it's assigned to domain 0 or domain io. */
s/iff/if

> +    if ( domid != 0 && domid != DOMID_IO )
> +    {
> +        printk(XENLOG_ERR "Device %s as it is being used by domain %d. Removing nodes failed\n",
Use %u to print domid. Also s/as it is/is/

> +               device_node->full_name, domid);
> +        return -EINVAL;
> +    }
> +
> +    dt_dprintk("Removing node: %s\n", device_node->full_name);
> +
> +    nirq = dt_number_of_irq(device_node);
> +
> +    /* Remove IRQ permission */
> +    for ( i = 0; i < nirq; i++ )
> +    {
> +        rc = platform_get_irq(device_node, i);;
remove extra ; at the end of line.
Also, shouldn't you first make sure that rc is >= 0 before checking access?

> +
> +        if ( irq_access_permitted(d, rc) == false )
Instead of d which points to hwdom, can't you use just domid?
> +        {
> +            printk(XENLOG_ERR "IRQ %d is not routed to domain %d\n", rc,
%u for domid

> +                   domid);
> +            return -EINVAL;
> +        }
> +        /*
> +         * TODO: We don't handle shared IRQs for now. So, it is assumed that
> +         * the IRQs was not shared with another devices.
> +         */
> +        rc = irq_deny_access(d, rc);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
> +                   i, device_node->full_name);
> +            return rc;
> +        }
> +    }
> +
> +    /* Check if iommu property exists. */
> +    if ( dt_get_property(device_node, "iommus", &len) )
> +    {
> +        rc = iommu_remove_dt_device(device_node);
> +        if ( rc != 0 && rc != -ENXIO )
> +            return rc;
> +    }
> +
> +    naddr = dt_number_of_address(device_node);
> +
> +    /* Remove mmio access. */
> +    for ( i = 0; i < naddr; i++ )
> +    {
> +        rc = dt_device_get_address(device_node, i, &addr, &size);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> +                   i, dt_node_full_name(device_node));
> +            return rc;
> +        }
> +
> +        rc = iomem_deny_access(d, paddr_to_pfn(addr),
> +                               paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Unable to remove dom%d access to"
> +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                   d->domain_id,
> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
> +            return rc;
> +        }
> +
> +    }
> +
> +    return rc;
> +}
> +
> +/* Removes all descendants of the given node. */
> +static int remove_all_descendant_nodes(struct dt_device_node *device_node)
> +{
> +    int rc = 0;
> +    struct dt_device_node *child_node;
> +
> +    for ( child_node = device_node->child; child_node != NULL;
> +         child_node = child_node->sibling )
> +    {
> +        if ( child_node->child )
> +            remove_all_descendant_nodes(child_node);
> +
> +        rc = handle_remove_irq_iommu(child_node);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
> +/* Remove nodes from dt_host. */
> +static int remove_nodes(const struct overlay_track *tracker)
> +{
> +    int rc = 0;
> +    struct dt_device_node *overlay_node;
> +    unsigned int j;
> +
> +    for ( j = 0; j < tracker->num_nodes; j++ )
> +    {
> +        overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
> +        if ( overlay_node == NULL )
> +        {
> +            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
> +                   overlay_node->full_name);
> +            return -EINVAL;
> +        }
> +
> +        rc = remove_all_descendant_nodes(overlay_node);
> +
> +        /* All children nodes are unmapped. Now remove the node itself. */
> +        rc = handle_remove_irq_iommu(overlay_node);
> +        if ( rc )
> +            return rc;
> +
> +        read_lock(&dt_host->lock);
> +
> +        rc = dt_overlay_remove_node(overlay_node);
> +        if ( rc )
> +        {
> +            read_unlock(&dt_host->lock);
> +
> +            return rc;
> +        }
> +
> +        read_unlock(&dt_host->lock);
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * First finds the device node to remove. Check if the device is being used by
> + * any dom and finally remove it from dt_host. IOMMU is already being taken care
> + * while destroying the domain.
> + */
> +static long handle_remove_overlay_nodes(void *overlay_fdt,
> +                                        uint32_t overlay_fdt_size)
> +{
> +    int rc = 0;
> +    struct overlay_track *entry, *temp, *track;
> +    bool found_entry = false;
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( overlay_node_count(overlay_fdt) == 0 )
> +        return -ENOMEM;
Why ENOMEM if there was no allocation attempt?

> +
> +    spin_lock(&overlay_lock);
> +
> +    /*
> +     * First check if dtbo is correct i.e. it should one of the dtbo which was
> +     * used when dynamically adding the node.
> +     * Limitation: Cases with same node names but different property are not
> +     * supported currently. We are relying on user to provide the same dtbo
> +     * as it was used when adding the nodes.
> +     */
> +    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
> +    {
> +        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
> +        {
> +            track = entry;
> +            found_entry = true;
> +            break;
> +        }
> +    }
> +
> +    if ( found_entry == false )
> +    {
> +        rc = -EINVAL;
> +
> +        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
> +               " Removing nodes is supported for only prior added dtbo. Please"
> +               " provide a valid dtbo which was used to add the nodes.\n");
> +        goto out;
> +
> +    }
> +
> +    rc = remove_nodes(entry);
> +
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Removing node failed\n");
> +        goto out;
> +    }
> +
> +    list_del(&entry->entry);
> +
> +    xfree(entry->dt_host_new);
> +    xfree(entry->fdt);
> +    xfree(entry->overlay_fdt);
> +
> +    xfree(entry->nodes_address);
> +
> +    xfree(entry);
> +
> +out:
> +    spin_unlock(&overlay_lock);
> +    return rc;
> +}
> +
> +long dt_sysctl(struct xen_sysctl_dt_overlay *op)
> +{
> +    long ret;
> +    void *overlay_fdt;
> +
> +    if ( op->overlay_fdt_size <= 0 || op->overlay_fdt_size > KB(500) )
overlay_fdt_size is uint32_t so it cannot be < 0.

> +        return -EINVAL;
> +
> +    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
> +
> +    if ( overlay_fdt == NULL )
> +        return -ENOMEM;
> +
> +    ret = copy_from_guest(overlay_fdt, op->overlay_fdt, op->overlay_fdt_size);
> +    if ( ret )
> +    {
> +        gprintk(XENLOG_ERR, "copy from guest failed\n");
> +        xfree(overlay_fdt);
> +
> +        return -EFAULT;
> +    }
> +
> +    switch ( op->overlay_op )
> +    {
> +    case XEN_SYSCTL_DT_OVERLAY_REMOVE:
> +        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
> +        xfree(overlay_fdt);
> +
> +        break;
> +
> +    default:
> +        xfree(overlay_fdt);
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 2b24d6bfd0..1158c1efb3 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1057,6 +1057,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
> 
> +#if defined(__arm__) || defined (__aarch64__)
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
This is done... would read better.

> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt; /* IN: overlay fdt. */
> +    uint32_t overlay_fdt_size;  /* IN: Overlay dtb size. */
> +    uint8_t overlay_op; /* IN: Add or remove. */
Please align comments.
Also you could move the command macros right before overlay_op to improve
readability (just an idea to consider, not a request).

> +};
> +#endif
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1087,6 +1106,7 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_dt_overlay                    30
Did you check if you need to bump XEN_SYSCTL_INTERFACE_VERSION ?

>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1117,6 +1137,10 @@ struct xen_sysctl {
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
>  #endif
> +
> +#if defined(__arm__) || defined (__aarch64__)
> +        struct xen_sysctl_dt_overlay        dt_overlay;
> +#endif
>          uint8_t                             pad[128];
>      } u;
>  };
> diff --git a/xen/include/xen/dt_overlay.h b/xen/include/xen/dt_overlay.h
> new file mode 100644
> index 0000000000..2cd975a070
> --- /dev/null
> +++ b/xen/include/xen/dt_overlay.h
> @@ -0,0 +1,59 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0
> + *
> + * xen/dt_overlay.h
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (c) 2022 AMD Inc.
Different copyright info in comparison to source file.

> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#ifndef __XEN_DT_SYSCTL_H__
SYSCTL? I think you want __XEN_DT_OVERLAY_H__

~Michal

