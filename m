Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B96679399
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 10:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483450.749630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKFBX-0005JJ-QL; Tue, 24 Jan 2023 09:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483450.749630; Tue, 24 Jan 2023 09:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKFBX-0005Gt-Mk; Tue, 24 Jan 2023 09:01:43 +0000
Received: by outflank-mailman (input) for mailman id 483450;
 Tue, 24 Jan 2023 09:01:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EcKj=5V=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pKFBV-0005Gn-PJ
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 09:01:42 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b50c4a59-9bc5-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 10:01:38 +0100 (CET)
Received: from BN0PR02CA0010.namprd02.prod.outlook.com (2603:10b6:408:e4::15)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 09:01:31 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::a8) by BN0PR02CA0010.outlook.office365.com
 (2603:10b6:408:e4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 09:01:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Tue, 24 Jan 2023 09:01:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 03:01:29 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 24 Jan 2023 03:01:28 -0600
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
X-Inumbo-ID: b50c4a59-9bc5-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBr2KAz/voljD6QjDriOFZkiEkediHHshpRX4uSLipiZmRSvn+HgHJv4wzadfSZ1EuHMXIgezmUNeiA2iAqA/HyuHKC2OKktN87/CMD//SWAaQwxiWNxYiFdzcANWLWWQeY3vMOm3J3Mf7ANgGRwOiy8/vSB3B0mRoJys6W/sT5gedcfXm8n9P69O67q2UXUeCmW2WSfTDI76dq069XwfIjhNgeTi07Qk3/k5u0pgfsagJouHEd5SDZBSJkslCTf3Slbck/FoQ/fwXZVjey3YtztKVeXjnD36agRRpbpYxDNgqqQrzF1Ri7ziRyO69oVTF/rFpkfFVzab1ce/OfG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRfejNFoZUA/jlfQt5W4e+msRg1J+ZD0CGXcB6NZgqs=;
 b=FSQB30GnzZCC7YqnHFUaOW5ULS++Vlx5ouIs3y9nOzTzfCLjQGrnXeH5tOcYPZPgXDe7fbxemqAyKaOXHDsxVKAN6IE6lJux9X9R6NHB+lAlGeULXjQVi6doA4xTOsLnLt0CFu6XBl8Cj3slYlpJBdGkopcje6/7UA3WMI3cZe0JYam2o+jcvCBUOrClwq+H1P+/Q4fu8rbUcNszlbjuJUzBiCtpKcmN5gem1OHinUX/F3kPOlNp9a9teyxPLksIHxqfU8sOAHbuampIJbFEiP65i0T6QwIoUymH/UPJTz63kXPrddnvG8KGc6kfFPnM7+0H03D1wedn9C0lS+pEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRfejNFoZUA/jlfQt5W4e+msRg1J+ZD0CGXcB6NZgqs=;
 b=QdZrCTPAezxXYNqlIeRxSBdlw0smgnrn7NTnjRS6FCGue5PxlvVFA+vIBQ6rDb2QUmsh2gJ1R/AJ3bEcoJQMg7+CkOoo/FqT/zqQgNTeLwNPnKIXQauo0MOwt9RTXIS/qUJITSwGnSh8yA3N8bGI44qC2ldnLdxfA2vJR/D26m8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b1b5c81a-733d-6bf3-c711-0af5b68009db@amd.com>
Date: Tue, 24 Jan 2023 10:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 12/16] xen/arm: Implement device tree node
 removal functionalities
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <Luca.Fancellu@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-6-vikram.garhwal@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061815.7404-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT005:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ca2281-5f83-4a09-39bb-08dafde995ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UAZPQPm4xsGzMbmlULmq5IiRDrN9BUf6yD6TaN4d/WUNG4Krj6dcmy78JtTugRyv7vcuuDb7J4rl1M3k0VfmiZHHbxeYCY40w49M8eays9qXSoGoax6Ji+zlj2auWQAKY/CL/mLCyzD1ht5rlPwRCaotiRDb5Ej1J/naDqVH6agA53KcWT+EscBe5vTEZbpsIrQq80oY2D3haDA0acy9QB134EhnMrjkS+jqJGPnriR+rnARiSVhwZeb5mbjdAXJPbf6HPp1O5qzCD/Y+nH8icnSIYs8nI7otILSS4FJknhKsH6WK9zvvvxARZ+otuHxZ8J3jzorEIQvajk/n3s3fYabwOdo+Gjz2IpaYtLd3Eyl9l4pynlEXwGYT4n/Tv6B8Gwa8+P7QPB+u8h9fAXi4cMCs7gOnJ8CD4anM0gdSsb7lU0Yuipm1s3LohgvWjGsKpy8l7ZPm2OSKunzlSDfhd2IQ6VWEEBRCYEcZ+XUrUoku/jZpNI/TObWs5cg74z14I/pftA7TlLgSERHtYr5eW0vDU3WgII5CkcdlGu5qBo5vc2E4kNTZm9hjh2VFYE/VR6fFQH9BKF//M8QdpLQgLT7IkmhPe58Za3JtiO/qEjpnzIf7UxO/vkN/4A/1mQ4Fgm56V1s4jET6fx6uyoi1bn4JkOn6/5XNSRcieCw7ZiTwRO5SRgSJzhiYwNrOMFmVdV/GxSQNt/UpCGKi8GLmNF4hPlWYdYSWeyuMeZeYYkx91aioJxEM2TRqwnUpwuSHpYKBmAgFUYSweFTri8daHaUwW1s98Rj+8fwTy0IVU3y9j43hCYFr8AvmGerLlwX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(47076005)(426003)(336012)(83380400001)(2616005)(31696002)(40480700001)(86362001)(40460700003)(36860700001)(81166007)(82310400005)(356005)(82740400003)(36756003)(31686004)(4326008)(8676002)(70586007)(70206006)(30864003)(5660300002)(2906002)(44832011)(8936002)(41300700001)(478600001)(53546011)(26005)(186003)(54906003)(110136005)(316002)(16576012)(403724002)(2004002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 09:01:30.6399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ca2281-5f83-4a09-39bb-08dafde995ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507

Hi Vikram,

You received extensive feedback for v3 from others, so I will limit my review to just coding
and general comments.

On 07/12/2022 07:18, Vikram Garhwal wrote:
> 
> 
> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> device tree overlay.
> 
> xl dt_overlay remove file.dtbo:
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
>  xen/common/Makefile          |   1 +
>  xen/common/dt_overlay.c      | 411 +++++++++++++++++++++++++++++++++++
>  xen/common/sysctl.c          |   5 +
>  xen/include/public/sysctl.h  |  19 ++
>  xen/include/xen/dt_overlay.h |  55 +++++
>  5 files changed, 491 insertions(+)
>  create mode 100644 xen/common/dt_overlay.c
>  create mode 100644 xen/include/xen/dt_overlay.h
> 
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 3baf83d527..58a35f55b2 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-$(CONFIG_OVERLAY_DTB) += dt_overlay.o
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-y += event_fifo.o
> diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
> new file mode 100644
> index 0000000000..477341f0aa
> --- /dev/null
> +++ b/xen/common/dt_overlay.c
> @@ -0,0 +1,411 @@
> +/*
> + * xen/common/dt_overlay.c
New files should start with SPDX comment expressing license.

> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (c) 2022 AMD Inc.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms and conditions of the GNU General Public
> + * License, version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <xen/iocap.h>
> +#include <xen/xmalloc.h>
> +#include <asm/domain_build.h>
> +#include <xen/dt_overlay.h>
> +#include <xen/guest_access.h>
> +
> +static LIST_HEAD(overlay_tracker);
> +static DEFINE_SPINLOCK(overlay_lock);
> +
> +/* Find last descendants of the device_node. */
> +static struct dt_device_node *find_last_descendants_node(
> +                                            struct dt_device_node *device_node)
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
Please add a blank line here.

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
> +    domid_t domid = 0;
No need for this assignment.

> +    unsigned int naddr, len;
> +    unsigned int i, nirq;
> +    u64 addr, size;
We should not be using types like these anymore. Use uint64_t.

> +
> +    domid = dt_device_used_by(device_node);
> +
> +    dt_dprintk("Checking if node %s is used by any domain\n",
> +               device_node->full_name);
> +
> +    /* Remove the node iff it's assigned to domain 0 or domain io. */
> +    if ( domid != 0 && domid != DOMID_IO )
> +    {
> +        printk(XENLOG_ERR "Device %s as it is being used by domain %d. Removing nodes failed\n",
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
> +
> +        if ( irq_access_permitted(d, rc) == false )
> +        {
> +            printk(XENLOG_ERR "IRQ %d is not routed to domain %d\n", rc,
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
> +
Remove extra line.

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
What about removing p2m mappings (comment from Julien on v3)?

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
> +    long ret = 0;
No need for assignign a value that will be reassigned anyway.

> +    void *overlay_fdt;
> +
> +    if ( op->overlay_fdt_size <= 0 || op->overlay_fdt_size > 500000 )
FWICS, you want to limit the fdt size to 500KB which should be 512000.
Also, it would be clearer to use KB(500). Otherwise such value is a bit ambiguous.
Also overlay_fdt_size cannot be < 0.

> +        return -EINVAL;
> +
> +    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
If you alloc the bytes here and the op will not be XEN_SYSCTL_DT_OVERLAY_REMOVE,
then you will end up without freeing it.

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
> +        break;
> +    }
> +
> +    return ret;
> +}
Don't you want to put EMACS comments block here?

> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 02505ab044..bb338b7c27 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -28,6 +28,7 @@
>  #include <xen/pmstat.h>
>  #include <xen/livepatch.h>
>  #include <xen/coverage.h>
> +#include <xen/dt_overlay.h>
> 
>  long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
> @@ -482,6 +483,10 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>              copyback = 1;
>          break;
> 
> +    case XEN_SYSCTL_dt_overlay:
If you protect xen_sysctl_dt_overlay with ARM ifdefery as Jan suggested,
then you should move this handling to arch_do_sysctl.

> +        ret = dt_sysctl(&op->u.dt_overlay);
> +        break;
> +
>      default:
>          ret = arch_do_sysctl(op, u_sysctl);
>          copyback = 0;
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 5672906729..4bc76bbe27 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1079,6 +1079,23 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
> 
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
I'm not sure whether the ADD macro should be added in this patch.

> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;
FWICS, this is the output variable and it would be beneficial to add a comment.
Also, usually IN variables appear first.

> +    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
> +    uint8_t overlay_op; /* Add or remove. */
These are the input variables, so the comment should be e.g. /* IN: Overlay dtb size */

> +};
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1109,6 +1126,7 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_dt_overlay                    30
>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1139,6 +1157,7 @@ struct xen_sysctl {
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
>  #endif
> +        struct xen_sysctl_dt_overlay        dt_overlay;
>          uint8_t                             pad[128];
>      } u;
>  };
> diff --git a/xen/include/xen/dt_overlay.h b/xen/include/xen/dt_overlay.h
> new file mode 100644
> index 0000000000..30f4b86586
> --- /dev/null
> +++ b/xen/include/xen/dt_overlay.h
> @@ -0,0 +1,55 @@
> +/*
Missing SPDX comment at the top of the files.

> + * xen/common/dt_overlay.h
Incorrect path.

> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (c) 2022 AMD Inc.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms and conditions of the GNU General Public
> + * License, version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#ifndef __XEN_DT_SYSCTL_H__
> +#define __XEN_DT_SYSCTL_H__
> +
> +#include <xen/list.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/rangeset.h>
> +
> +/*
> + * overlay_node_track describes information about added nodes through dtbo.
> + * @entry: List pointer.
> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
> + * @fdt: Stores the fdt.
> + * @nodes_fullname: Stores the full name of nodes.
> + * @nodes_irq: Stores the IRQ added from overlay dtb.
> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
> + * @num_nodes: Stores total number of nodes in overlay dtb.
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
> +static inline long dt_sysctl(struct xen_sysctl_dt_overlay *op)
> +{
> +    return -ENOSYS;
> +}
> +#endif
> +#endif
Don't you want to put EMACS comments block here?

> --
> 2.17.1
> 
> 

~Michal

