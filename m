Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABF72201F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 09:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543523.848581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q650e-0003k0-B5; Mon, 05 Jun 2023 07:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543523.848581; Mon, 05 Jun 2023 07:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q650e-0003iD-7O; Mon, 05 Jun 2023 07:52:12 +0000
Received: by outflank-mailman (input) for mailman id 543523;
 Mon, 05 Jun 2023 07:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPmL=BZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q650d-0003i4-3z
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 07:52:11 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe59::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dec66c6d-0375-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 09:52:09 +0200 (CEST)
Received: from SJ0PR13CA0065.namprd13.prod.outlook.com (2603:10b6:a03:2c4::10)
 by SA1PR12MB8700.namprd12.prod.outlook.com (2603:10b6:806:388::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Mon, 5 Jun
 2023 07:52:05 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c4:cafe::48) by SJ0PR13CA0065.outlook.office365.com
 (2603:10b6:a03:2c4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Mon, 5 Jun 2023 07:52:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.32 via Frontend Transport; Mon, 5 Jun 2023 07:52:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 02:52:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 00:52:03 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Jun 2023 02:52:01 -0500
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
X-Inumbo-ID: dec66c6d-0375-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XciT/aLfvwWAH8P6K885nx9mQUHpEPV7tGczueIU8jELk9RdxVDxG0QBYWiBF9ye+JzHr/99wx3fASkr2YeetNVbu5h0GYUSqdw2ATFCE6CJTwMDwi6Pu0aiu5gquMlK5oAWLwmsyIkukotEIm99GSxN2IIYGGuRNhSR0s9CwszfEbvTubzomeG5DaGM9iwJFnrHQk4sc9N2YcqijGZd8y2UwPfL6BFX0tjeOi6XLcVEYTCt22FoYfChsUw6g5IRsc5MlLensWlIhPNaK8SSP+mYYsZmMbL/bRZbym+k1xJvDpc+xA6Gw4t8zneCSr+mdYU9LjKwa+8Gyzpn2s1MnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzJTBnEPceJ8lQFpAoNXhBVptBXnXa6NZujWJQwLPao=;
 b=O8c4QASTJoY181M07luVEtPYFpRnfnrt1A5fjj4oNZKO/ccU7MFmIiRydakKe48nBikmw4j/fjV9yvNxYAeeFSO/ddQKxzSOcbTTSqsyJmKEH6inlEC/96203IMv/uePatezTdkJLaNLEqvV+4WJzzaQlKOzYArj5bwFQrDY29k+fF93oQ1fmwFB6xrwIUwOgyWjvEK8oEPVT6XuB1pZp+EsoI9zxOCq245u7OZzUwXC6sf7EgZ3hVPX47jt8j98RyjsDjiIcZKNoY4wG9ZlQKSTcWBLQHqc8MiJxG/iNVsMQ2DowW68+NwF+Anf8m21G5FO58+g5Xkdg79xXfQ6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzJTBnEPceJ8lQFpAoNXhBVptBXnXa6NZujWJQwLPao=;
 b=VuXhgrkAy66HTP1MOVfuc1Cckh8HZLgE/QXJOcEsAu9Yx4KJ+B7tGFP8573jiKVd/EdlDCeqOq+K9URIjQL6Nb8tGiYFGQMPPi+VEuK3hBc1A7BbWznR68Nkt3HQRoVh42hfgqbYraNnffHM3sowb3ZjIuz6X7WYlme7RhjpkoM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a1779144-0a50-cdd8-2f90-6147dce04c88@amd.com>
Date: Mon, 5 Jun 2023 09:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 15/19] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-16-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-16-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|SA1PR12MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 35aaab0c-82bc-4c09-7561-08db6599c0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbFAMJbFH2MpcGJFJesyspqHpWdDXmJN8MwswbhsmQbdDiaMxxQ8zOQUkgfMsJMkqZSlGuEholInpPSrBhC4/3W4IlJ3Dqu4o1APY7TJ+7WvtFm5I697KYE1G64dGGbOrZZGyQ48o8w+a17Y8cIyl7XE+o19lXt2Wu1sF9JxmY4DQ6OzpSzTntTTYDVPQ+i2RIYif51yY7D63lr+LVTSNydaLQiIfWvfBedRxCM3J9nA6P60oYjQmu52mb8dT6JicqlwaAfSjZv16c1/cyfALbdDv3kPxCBBFfpfe3ApY+jhQWtUYfznS3SUOCnG9eRAH1tZ23RPclB5kozVn1bFWHVFUj7O3bd8IveAped3dx0kwpbJXiFd9yZ3uXz6rDCWRwhG6CgJ441NNQmdpS/Ydw27dDbEMAA1fh5/m1Y6kCKz5Vr6CEuSSwwFSaFEfDASdcIIsyEa/PItEHV4b6q0RqJAyZb2sGy0IEd58wl5jamm0+kMKm1eLTQssz/Q1bLBbnlx+5Vh3KtDFKPj92sYV5Ijo97TD17VT3T1Gh5cE3ArBYlo6u+LwklWDhHggZuUpEuLc54AGmVegPOLvVvSP7SNc2jsPB/iN6dHKrsjGrmWS5iOeENCutN1VfFxoX8E8NOH4Fx2TMGKvG76zqjUk4t0WAPMZvUQQGC5HBeyXbptTG8g5DVq4JCoX6qWCRe7sSrT3CeqFK9cZlLnQLCXyadKEpZg+SqvnyprBJ/sYLDUerZiFlDphnszOYveCWZh2d+o0kwVN+bh9oD13HULv5xSPwGmYlpRdnySevAAChNekDur8PjO2y2wJSRXuouo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(44832011)(8936002)(31686004)(8676002)(5660300002)(41300700001)(2906002)(30864003)(316002)(4326008)(40460700003)(70586007)(70206006)(31696002)(36860700001)(82740400003)(2616005)(356005)(26005)(47076005)(40480700001)(86362001)(83380400001)(478600001)(426003)(336012)(81166007)(186003)(53546011)(16576012)(54906003)(36756003)(110136005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 07:52:04.1892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aaab0c-82bc-4c09-7561-08db6599c0d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8700

Hi Vikram,

On 02/06/2023 02:48, Vikram Garhwal wrote:
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
> 
> ---
> Changes from v6:
>     Add explicit padding for xen_system_dt_overlay{}
>     Update license.
>     Rearrange xfree in dt_sysctl()
>     Update overlay_track struct comment with relevant message.
>     Fix missing xen/errno.h for builds without CONFIG_OVERLAY_DTB cases.
>     Fix header formatting.
> ---
>  xen/arch/arm/sysctl.c        |  16 +-
>  xen/common/Makefile          |   1 +
>  xen/common/dt-overlay.c      | 420 +++++++++++++++++++++++++++++++++++
>  xen/include/public/sysctl.h  |  24 ++
>  xen/include/xen/dt-overlay.h |  59 +++++
>  5 files changed, 519 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/dt-overlay.c
>  create mode 100644 xen/include/xen/dt-overlay.h
> 
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index b0a78a8b10..8b813c970f 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -9,6 +9,7 @@
>  
>  #include <xen/types.h>
>  #include <xen/lib.h>
> +#include <xen/dt-overlay.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
>  #include <public/sysctl.h>
> @@ -21,7 +22,20 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
> -    return -ENOSYS;
> +    long ret;
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
> index 46049eac35..e7e96b1087 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-y += event_fifo.o
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> new file mode 100644
> index 0000000000..b2a7e441df
> --- /dev/null
> +++ b/xen/common/dt-overlay.c
> @@ -0,0 +1,420 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/common/dt-overlay.c
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#include <asm/domain_build.h>
> +#include <xen/dt-overlay.h>
> +#include <xen/guest_access.h>
> +#include <xen/iocap.h>
> +#include <xen/xmalloc.h>
> +
> +static LIST_HEAD(overlay_tracker);
> +static DEFINE_SPINLOCK(overlay_lock);
> +
> +/* Find last descendants of the device_node. */
> +static struct dt_device_node *
> +                find_last_descendants_node(struct dt_device_node *device_node)
I make this remark at every single revision. Please do the indentation correctly, i.e.:
static struct dt_device_node *
find_last_descendants_node(struct dt_device_node *device_node)

Also, I think device_node can be const.

> +{
> +    struct dt_device_node *child_node;
> +
> +    for ( child_node = device_node->child; child_node->sibling != NULL;
> +          child_node = child_node->sibling );
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
> +static unsigned int overlay_node_count(const void *overlay_fdt)
> +{
> +    unsigned int num_overlay_nodes = 0;
> +    int fragment;
> +
> +    fdt_for_each_subnode(fragment, overlay_fdt, 0)
> +    {
> +        int subnode;
> +        int overlay;
> +
> +        overlay = fdt_subnode_offset(overlay_fdt, fragment, "__overlay__");
> +
> +        /*
> +         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> +         * overlay >= 0. So, no need for a overlay>=0 check here.
> +         */
> +        fdt_for_each_subnode(subnode, overlay_fdt, overlay)
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
> +
> +    domid = dt_device_used_by(device_node);
> +
> +    dt_dprintk("Checking if node %s is used by any domain\n",
> +               device_node->full_name);
> +
> +    /* Remove the node if only it's assigned to domain 0 or domain io. */
> +    if ( domid != 0 && domid != DOMID_IO )
> +    {
> +        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
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
> +        rc = platform_get_irq(device_node, i);
> +        if ( rc < 0 )
> +        {
> +            printk(XENLOG_ERR "Failed to get IRQ num for device node %s\n",
> +                   device_node->full_name);
> +            return -EINVAL;
> +        }
> +
> +        if ( irq_access_permitted(d, rc) == false )
> +        {
> +            printk(XENLOG_ERR "IRQ %d is not routed to domain %u\n", rc,
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
> +        uint64_t addr, size;
Take a look at recent patches from Ayan that were merged. These shall be paddr_t and ...

> +
> +        rc = dt_device_get_address(device_node, i, &addr, &size);
... here you should use dt_device_get_paddr().

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
device_node can be const I think

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
Why are you not checking rc for an error?

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
remove this empty line

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
overlay_fdt can be const I think

> +                                        uint32_t overlay_fdt_size)
> +{
> +    int rc;
> +    struct overlay_track *entry, *temp, *track;
> +    bool found_entry = false;
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( overlay_node_count(overlay_fdt) == 0 )
> +        return -EINVAL;
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
> +               " Removing nodes is supported only for prior added dtbo.\n");
> +        goto out;
> +
> +    }
> +
> +    rc = remove_nodes(entry);
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
> +    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
It would be nice to enclose the expressions in parentheses

> +        return -EINVAL;
> +
> +    if ( op->pad[0] || op->pad[1] || op->pad[2] )
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
> +
remove empty line

> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    xfree(overlay_fdt);
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
> index 2b24d6bfd0..ff54607617 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1057,6 +1057,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +#if defined(__arm__) || defined (__aarch64__)
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;  /* IN: overlay fdt. */
> +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +    uint8_t overlay_op;                     /* IN: Add or remove. */
> +    uint8_t pad[3];                         /* IN: Must be zero. */
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
> diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
> new file mode 100644
> index 0000000000..43fa5a02a0
> --- /dev/null
> +++ b/xen/include/xen/dt-overlay.h
> @@ -0,0 +1,59 @@
> + /* SPDX-License-Identifier: GPL-2.0-only */
> + /*
> + * xen/dt-overlay.h
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#ifndef __XEN_DT_OVERLAY_H__
> +#define __XEN_DT_OVERLAY_H__
> +
> +#include <xen/list.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/rangeset.h>
Sort alphabetically please

> +
> +/*
> + * overlay_track describes information about added nodes through dtbo.
> + * @entry: List pointer.
> + * @dt_host_new: Pointer to the updated dt_host_new which is unflattened from
> +    the 'updated fdt'.
> + * @fdt: Stores the fdt.
> + * @overlay_fdt: Stores a copy of input overlay_fdt.
> + * @nodes_address: Stores each overlay_node's address.
> + * @num_nodes: Total number of nodes in overlay dtb.
> + */
> +struct overlay_track {
> +    struct list_head entry;
> +    struct dt_device_node *dt_host_new;
> +    void *fdt;
> +    void *overlay_fdt;
> +    unsigned long *nodes_address;
> +    unsigned int num_nodes;
> +};
> +
> +struct xen_sysctl_dt_overlay;
> +
> +#ifdef CONFIG_OVERLAY_DTB
> +long dt_sysctl(struct xen_sysctl_dt_overlay *op);
> +#else
> +#include <xen/errno.h>
> +static inline long dt_sysctl(struct xen_sysctl_dt_overlay *op)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
> +
> +#endif /* __XEN_DT_OVERLAY_H__ */
empty line here

> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

~Michal

