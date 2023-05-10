Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C96FDB7F
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 12:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532736.829023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwguW-0006FC-DI; Wed, 10 May 2023 10:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532736.829023; Wed, 10 May 2023 10:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwguW-0006D9-AJ; Wed, 10 May 2023 10:19:04 +0000
Received: by outflank-mailman (input) for mailman id 532736;
 Wed, 10 May 2023 10:19:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/7K=A7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pwguV-0006D1-6K
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 10:19:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eab::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1429ba99-ef1c-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 12:19:01 +0200 (CEST)
Received: from MN2PR17CA0011.namprd17.prod.outlook.com (2603:10b6:208:15e::24)
 by MN0PR12MB6296.namprd12.prod.outlook.com (2603:10b6:208:3d3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 10:18:56 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:15e:cafe::a5) by MN2PR17CA0011.outlook.office365.com
 (2603:10b6:208:15e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19 via Frontend
 Transport; Wed, 10 May 2023 10:18:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.20 via Frontend Transport; Wed, 10 May 2023 10:18:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 05:18:55 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 10 May 2023 05:18:54 -0500
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
X-Inumbo-ID: 1429ba99-ef1c-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhT0e1x9K15O2S7CyJ7WM5aWHxFp4KF7dDz92kDabvp8Xx+z7MUV1cIw8mNvEnbV1z4hYnfcY3567EE86JIQuTMTtuuDRqomHVMPqTk/+8KLyPh+NYow6g0DQoYTKMHmszu2wx51tmaDAN4AAPVVhGnBLUNst0q+KU2e1z89ONkfRW0iTzwfFNBd+iStTe/7HtTHDfl4GJXtDXRbQdCGyr/s6nWihvbMpJwxDKgMImlpxjBNT5JG9tICBqbw293yRQ/vcTSrvZJBDYt5XHLE+VGBOCmK1nkktNd8D2In42yW9zsQFDhCHOZMo9oljUeebKifyw0++CTDRLrF2BagQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnXPHUfI0sEPPBxhjrCV7hWahf6nzD+pQ8KhDpK7Si4=;
 b=mwGk97gPGSi1Ai6cPu2X3bR6UojF+6jXKlQSXLDQHwt4P/QYYtTNkQmuV1i4BcGMoGruCmF9UWwsoamxPxpHHcdOmHp2sEPIE3IS37MNSH1CjyN2T0jfp6w5vZmoxraZKfOjQYorrE5XQpDvmoHln5akSGVU2unIXb6me2GYqzdYz78bZbXpcL0kn+QpwRF4BmQWx8mxV4a7RJHYLPRjwqkb2UeBjT7ZnXWks59O/cioEy9slt7tdCTVp6sfMOSsAbrSN6SWxM2aUyObt5KR5AFB1N32VsgQ9+X9Guw9c71ED0D25GHUsVfYPadfZRUtr0gy8Z45yqoTkvIjy1pOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnXPHUfI0sEPPBxhjrCV7hWahf6nzD+pQ8KhDpK7Si4=;
 b=qAFkYWN9n+yWIdIB7H4CFq8woXRV1mvlcEWOjjDJTA7wPM10jSI2ofGUdQ0i9mSDifc7r0qUWqXEaCOGe+g11cEeqpi+FVIkd7XStzf3Jrwssr+d/uJhrchW9psr5mHwcK91EZi9tFJNGF+6+hNy6ZLnvECgdHy5ZuKl1RtVDr8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <27af742a-c8c2-006e-fcd8-bbad116e1908@amd.com>
Date: Wed, 10 May 2023 12:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 16/19] xen/arm: Implement device tree node
 addition functionalities
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-17-vikram.garhwal@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230502233650.20121-17-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|MN0PR12MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 13841552-47b9-41f6-39df-08db513ff67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JcoJgc3vsX+SKO3wHiAZbDOgkGZVmV+q+4rI7gk1wNJPHbOeGdO0cnX4o1AspOSLf+UcGfvx2NvcPxjDNWbwSQ23i/AG2HaYO5QFLlwznT4VpAR6x/c5CHxkohQ5Szk6eH3OEqtpb8J4vn6sA70IvsVAdV2jfCoeRZj0GmT3EATOXQW6qLiJE2AS8PrMtGFm5ljNzRpv/wHT/vSqVUsgci3BtnODNCyXP/yEq7favubP2cocp/kESziB5CZen73Go+fQXdKck8CLDtYSBl0ksyeGjCE0GIajldOXbYA/CLJAQrxvhZHMTzCfEWaUzIXYUONR0lQScU15TnIndNqGp0MECXOGEylyb+HsF7DkzsORvt2Xld44lGPBkp6ssk8nTsoJKSaEZ46OoANI0H0x7/QmKh6h0/ejlxQ/ec8u17OeoWXY1bL/vn/4ZHdJ9ci0iPDzXhdrlP27xXUcXF1psq+TzyDgaPhvc1UhlQTEZU6kUguuGb6nqQ6yxne0Qo3UKXXXrhG1v0YasH4raPYihOYGLBJaCXngN+ZTs6T02Jbq5fkJT/a6VV4DqytI/IUNdn6eRPSpxTaZudzmghpQ9CZnl2ngW8mfH7D44beKINhokirLiWVcEjiYeU3EkVUg+MjZugWFM16E38d1yTjgYMzW2fhDpajhq4Mb6m0Fz1pMp9JceTw4qOZ11grBiFI94RTjI93V4yxCYdHizTymCV0NFdJRKktEThGMTYSsEOd2z+Y7e5b9j3sTt8kxrD7KLOr8/bzIObLvDPW6Azg8Wg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(26005)(53546011)(40480700001)(47076005)(336012)(426003)(36860700001)(83380400001)(2616005)(81166007)(86362001)(31696002)(36756003)(82310400005)(186003)(356005)(82740400003)(40460700003)(16576012)(44832011)(54906003)(110136005)(316002)(41300700001)(8676002)(8936002)(478600001)(30864003)(70586007)(4326008)(70206006)(5660300002)(31686004)(2906002)(66899021)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 10:18:56.2910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13841552-47b9-41f6-39df-08db513ff67f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6296



On 03/05/2023 01:36, Vikram Garhwal wrote:
> Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
> using device tree overlay.
> 
> xl dt-overlay add file.dtbo:
>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>     device_tree_flattened) is created and updated with overlay nodes. This
>     updated fdt is further unflattened to a dt_host_new. Next, it checks if any
>     of the overlay nodes already exists in the dt_host. If overlay nodes doesn't
>     exist then find the overlay nodes in dt_host_new, find the overlay node's
>     parent in dt_host and add the nodes as child under their parent in the
>     dt_host. The node is attached as the last node under target parent.
> 
>     Finally, add IRQs, add device to IOMMUs, set permissions and map MMIO for the
>     overlay node.
> 
> When a node is added using overlay, a new entry is allocated in the
> overlay_track to keep the track of memory allocation due to addition of overlay
> node. This is helpful for freeing the memory allocated when a device tree node
> is removed.
> 
> The main purpose of this to address first part of dynamic programming i.e.
> making xen aware of new device tree node which means updating the dt_host with
> overlay node information. Here we are adding/removing node from dt_host, and
> checking/setting IOMMU and IRQ permission but never mapping them to any domain.
> Right now, mapping/Un-mapping will happen only when a new domU is
> created/destroyed using "xl create".
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/common/dt-overlay.c | 510 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 510 insertions(+)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index b89cceab84..09ea46111b 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -33,6 +33,25 @@ static struct dt_device_node *
>      return child_node;
>  }
>  
> +/*
> + * Returns next node to the input node. If node has children then return
> + * last descendant's next node.
> +*/
> +static struct dt_device_node *
> +dt_find_next_node(struct dt_device_node *dt, const struct dt_device_node *node)
> +{
> +    struct dt_device_node *np;
> +
> +    dt_for_each_device_node(dt, np)
> +        if ( np == node )
> +            break;
> +
> +    if ( np->child )
> +        np = find_last_descendants_node(np);
> +
> +    return np->allnext;
> +}
> +
>  static int dt_overlay_remove_node(struct dt_device_node *device_node)
>  {
>      struct dt_device_node *np;
> @@ -106,6 +125,76 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
>      return 0;
>  }
>  
> +static int dt_overlay_add_node(struct dt_device_node *device_node,
> +                               const char *parent_node_path)
> +{
> +    struct dt_device_node *parent_node;
> +    struct dt_device_node *next_node;
> +
> +    parent_node = dt_find_node_by_path(parent_node_path);
> +
> +    if ( parent_node == NULL )
> +    {
> +        dt_dprintk("Parent node %s not found. Overlay node will not be added\n",
> +                   parent_node_path);
> +        return -EINVAL;
> +    }
> +
> +    /* If parent has no child. */
> +    if ( parent_node->child == NULL )
> +    {
> +        next_node = parent_node->allnext;
> +        device_node->parent = parent_node;
> +        parent_node->allnext = device_node;
> +        parent_node->child = device_node;
> +    }
> +    else
> +    {
> +        struct dt_device_node *np;
> +        /* If parent has at least one child node.
incorrect comment style, should be:
/*
 *
 */

> +         * Iterate to the last child node of parent.
> +         */
> +        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling );
> +
> +        /* Iterate over all child nodes of np node. */
> +        if ( np->child )
> +        {
> +            struct dt_device_node *np_last_descendant;
> +
> +            np_last_descendant = find_last_descendants_node(np);
> +
> +            next_node = np_last_descendant->allnext;
> +            np_last_descendant->allnext = device_node;
> +        }
> +        else
> +        {
> +            next_node = np->allnext;
> +            np->allnext = device_node;
> +        }
> +
> +        device_node->parent = parent_node;
> +        np->sibling = device_node;
> +        np->sibling->sibling = NULL;
> +    }
> +
> +    /* Iterate over all child nodes of device_node to add children too. */
> +    if ( device_node->child )
> +    {
> +        struct dt_device_node *device_node_last_descendant;
> +
> +        device_node_last_descendant = find_last_descendants_node(device_node);
empty line

> +        /* Plug next_node at the end of last children of device_node. */
> +        device_node_last_descendant->allnext = next_node;
> +    }
> +    else
> +    {
> +        /* Now plug next_node at the end of device_node. */
> +        device_node->allnext = next_node;
> +    }
> +
> +    return 0;
> +}
> +
>  /* Basic sanity check for the dtbo tool stack provided to Xen. */
>  static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
>  {
> @@ -145,6 +234,82 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
>      return num_overlay_nodes;
>  }
>  
> +/*
> + * overlay_get_nodes_info gets full name with path for all the nodes which
> + * are in one level of __overlay__ tag. This is useful when checking node for
> + * duplication i.e. dtbo tries to add nodes which already exists in device tree.
> + */
> +static int overlay_get_nodes_info(const void *fdto, char ***nodes_full_path,
> +                                  unsigned int num_overlay_nodes)
> +{
> +    int fragment;
> +
> +    *nodes_full_path = xzalloc_bytes(num_overlay_nodes * sizeof(char *));
You are not freeing memory in this function in case of an error and rely on a caller
to free the memory allocated by this function. Wouldn't it be better to allocate this
from handle_add_overlay_nodes()?

> +
> +    if ( *nodes_full_path == NULL )
> +        return -ENOMEM;
> +
> +    fdt_for_each_subnode(fragment, fdto, 0)
> +    {
> +        int target;
> +        int overlay;
> +        int subnode;
> +        const char *target_path;
> +
> +        target = fdt_overlay_target_offset(device_tree_flattened, fdto,
> +                                           fragment, &target_path);
> +        if ( target < 0 )
> +            return target;
> +
> +        if ( target_path == NULL )
> +            return -EINVAL;
> +
> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +
> +        /*
> +         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> +         * overlay >= 0. So, no need for a overlay>=0 check here.
> +         */
> +        fdt_for_each_subnode(subnode, fdto, overlay)
> +        {
> +            const char *node_name = NULL;
> +            int node_name_len;
> +            unsigned int target_path_len = strlen(target_path);
> +            unsigned int node_full_name_len;
> +            unsigned int node_num = 0;
How this is supposed to work given that on each iteration you are setting this to 0
and at the end of the iteration you increment it? It will then always be 0.

> +
> +            node_name = fdt_get_name(fdto, subnode, &node_name_len);
> +
> +            if ( node_name == NULL )
> +                return node_name_len;
> +
> +            /*
> +             * Magic number 2 is for adding '/' and '\0'. This is done to keep
> +             * the node_full_path in the correct full node name format.
> +             */
> +            node_full_name_len = target_path_len + node_name_len + 2;
> +
> +            (*nodes_full_path)[node_num] = xmalloc_bytes(node_full_name_len);
> +
> +            if ( (*nodes_full_path)[node_num] == NULL )
> +                return -ENOMEM;
> +
> +            memcpy((*nodes_full_path)[node_num], target_path, target_path_len);
> +
> +            (*nodes_full_path)[node_num][target_path_len] = '/';
> +
> +            memcpy((*nodes_full_path)[node_num] + target_path_len + 1,
> +                    node_name, node_name_len);
> +
> +            (*nodes_full_path)[node_num][node_full_name_len - 1] = '\0';
> +
> +            node_num++;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int handle_remove_irq_iommu(struct dt_device_node *device_node)
>  {
>      int rc = 0;
> @@ -371,6 +536,344 @@ out:
>      return rc;
>  }
>  
> +/*
> + * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
> + * overlay_node.
> + */
> +static int handle_add_irq_iommu(struct domain *d,
If you only allow adding nodes to hwdom, what's the point of this parameter?
This is not consitent with function that does removing.

> +                                struct dt_device_node *overlay_node)
> +{
> +    int rc;
> +    unsigned int naddr, i, len;
> +    struct dt_device_node *np;
> +
> +    /* First let's handle the interrupts. */
> +    rc = handle_device_interrupts(d, overlay_node, false);
Similarily to your comment about skip_mapping, it would be welcome to explain why false here.

> +    if ( rc < 0 )
> +    {
> +        printk(XENLOG_ERR "Failed to retrieve interrupts configuration\n");
> +        return rc;
> +    }
> +
> +    /* Check if iommu property exists. */
> +    if ( dt_get_property(overlay_node, "iommus", &len) )
> +    {
> +        /* Add device to IOMMUs. */
> +        rc = iommu_add_dt_device(overlay_node);
> +        if ( rc < 0 )
> +        {
> +            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
> +                   dt_node_full_name(overlay_node));
> +            return rc;
> +        }
> +    }
> +
> +    /* Set permissions. */
> +    naddr = dt_number_of_address(overlay_node);
> +
> +    dt_dprintk("%s naddr = %u\n", dt_node_full_name(overlay_node), naddr);
> +
> +    /* Give permission to map MMIOs */
> +    for ( i = 0; i < naddr; i++ )
> +    {
> +        uint64_t addr, size;
Make sure to check Ayan's 32-bit paddr series status as it impacts parts of your code.

> +
> +        /*
> +         * For now, we skip_mapping which means it will only permit iomem access
> +         * to hardware_domain using iomem_permit_access() but will never map as
> +         * map_range_p2mt() will not be called.
> +         */
> +        struct map_range_data mr_data = { .d = d,
> +                                          .p2mt = p2m_mmio_direct_c,
> +                                          .skip_mapping = true
> +                                        };
> +
> +        rc = dt_device_get_address(overlay_node, i, &addr, &size);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> +                   i, dt_node_full_name(overlay_node));
> +            return rc;
> +        }
> +
> +        rc = map_range_to_domain(overlay_node, addr, size, &mr_data);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    /* Map IRQ and IOMMU for overlay_node's children. */
> +    for ( np = overlay_node->child; np != NULL; np = np->sibling )
> +    {
> +        rc = handle_add_irq_iommu(d, np);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
> +            return rc;
> +        }
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * Adds device tree nodes under target node.
> + * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
> + * is done to avoid the removal of device_tree generation, iomem regions mapping
> + * to hardware domain done by handle_node().
> + */
> +static long handle_add_overlay_nodes(void *overlay_fdt,
> +                                     uint32_t overlay_fdt_size)
> +{
> +    int rc, j, i;
> +    struct dt_device_node *overlay_node;
> +    struct overlay_track *tr = NULL;
> +    char **nodes_full_path = NULL;
> +    unsigned int new_fdt_size;
> +
> +    tr = xzalloc(struct overlay_track);
> +    if ( tr == NULL )
> +        return -ENOMEM;
> +
> +    new_fdt_size = fdt_totalsize(device_tree_flattened) +
> +                                 fdt_totalsize(overlay_fdt);
> +
> +    tr->fdt = xzalloc_bytes(new_fdt_size);
> +    if ( tr->fdt == NULL )
> +    {
> +        xfree(tr);
> +        return -ENOMEM;
> +    }
> +
> +    tr->num_nodes = overlay_node_count(overlay_fdt);
> +    if ( tr->num_nodes == 0 )
> +    {
> +        xfree(tr->fdt);
> +        xfree(tr);
> +        return -ENOMEM;
> +    }
> +
> +    tr->nodes_address = xzalloc_bytes(tr->num_nodes * sizeof(unsigned long));
> +    if ( tr->nodes_address == NULL )
> +    {
> +        xfree(tr->fdt);
> +        xfree(tr);
> +        return -ENOMEM;
> +    }
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> +    if ( rc )
> +    {
> +        xfree(tr->nodes_address);
> +        xfree(tr->fdt);
> +        xfree(tr);
> +        return rc;
> +    }
> +
> +    /*
> +     * Keep a copy of overlay_fdt as fdt_overlay_apply will change the input
> +     * overlay's content(magic) when applying overlay.
> +     */
> +    tr->overlay_fdt = xzalloc_bytes(overlay_fdt_size);
> +    if ( tr->overlay_fdt == NULL )
> +    {
> +        xfree(tr->nodes_address);
> +        xfree(tr->fdt);
> +        xfree(tr);
> +        return -ENOMEM;
> +    }
> +
> +    memcpy(tr->overlay_fdt, overlay_fdt, overlay_fdt_size);
> +
> +    spin_lock(&overlay_lock);
> +
> +    memcpy(tr->fdt, device_tree_flattened,
> +           fdt_totalsize(device_tree_flattened));
> +
> +    /* Open tr->fdt with more space to accommodate the overlay_fdt. */
> +    rc = fdt_open_into(tr->fdt, tr->fdt, new_fdt_size);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Increasing tr->fdt size failed with error %d\n",
User does not know what tr->fdt is and it's better to be more user friendly.

> +               rc);
> +        goto err;
> +    }
> +
> +    /*
> +     * overlay_get_nodes_info is called to get the node information from dtbo.
> +     * This is done before fdt_overlay_apply() because the overlay apply will
> +     * erase the magic of overlay_fdt.
> +     */
> +    rc = overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
> +                                tr->num_nodes);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Getting nodes information failed with error %d\n",
> +               rc);
> +        goto err;
> +    }
> +
> +    rc = fdt_overlay_apply(tr->fdt, overlay_fdt);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Adding overlay node failed with error %d\n", rc);
> +        goto err;
> +    }
> +
> +    /*
> +     * Check if any of the node already exists in dt_host. If node already exits
> +     * we can return here as this overlay_fdt is not suitable for overlay ops.
> +     */
> +    for ( j = 0; j < tr->num_nodes; j++ )
> +    {
> +        overlay_node = dt_find_node_by_path(nodes_full_path[j]);
> +        if ( overlay_node != NULL )
> +        {
> +            printk(XENLOG_ERR "node %s exists in device tree\n",
> +                   nodes_full_path[j]);
> +            rc = -EINVAL;
> +            goto err;
> +        }
> +    }
> +
> +    /* Unflatten the tr->fdt into a new dt_host. */
> +    rc = unflatten_device_tree(tr->fdt, &tr->dt_host_new);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "unflatten_device_tree failed with error %d\n", rc);
> +        goto err;
> +    }
> +
> +    for ( j = 0; j < tr->num_nodes; j++ )
> +    {
> +        struct dt_device_node *prev_node, *next_node;
> +
> +        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
> +
> +        /* Find the newly added node in tr->dt_host_new by it's full path. */
> +        overlay_node = device_tree_find_node_by_path(tr->dt_host_new,
> +                                                     nodes_full_path[j]);
> +        if ( overlay_node == NULL )
> +        {
> +            /* Sanity check. But code will never come here. */
> +            ASSERT_UNREACHABLE();
> +            goto remove_node;
> +        }
> +
> +        /*
> +         * Find previous and next node to overlay_node in dt_host_new. We will
> +         * need these nodes to fix the dt_host_new mapping. When overlay_node is
> +         * take out of dt_host_new tree and added to dt_host, link between
> +         * previous node and next_node is broken. We will need to refresh
> +         * dt_host_new with correct linking for any other overlay nodes
> +         * extraction in future.
> +         */
> +        dt_for_each_device_node(tr->dt_host_new, prev_node)
> +            if ( prev_node->allnext == overlay_node )
> +                break;
> +
> +        next_node = dt_find_next_node(tr->dt_host_new, overlay_node);
> +
> +        read_lock(&dt_host->lock);
> +
> +        /* Add the node to dt_host. */
> +        rc = dt_overlay_add_node(overlay_node, overlay_node->parent->full_name);
> +        if ( rc )
> +        {
> +            read_unlock(&dt_host->lock);
> +
> +            /* Node not added in dt_host. */
> +            goto remove_node;
> +        }
> +
> +        read_unlock(&dt_host->lock);
> +
> +        prev_node->allnext = next_node;
> +
> +        overlay_node = dt_find_node_by_path(overlay_node->full_name);
> +        if ( overlay_node == NULL )
> +        {
> +            /* Sanity check. But code will never come here. */
> +            ASSERT_UNREACHABLE();
> +            goto remove_node;
> +        }
> +
> +        rc = handle_add_irq_iommu(hardware_domain, overlay_node);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
> +            return rc;
This is definitely wrong as you will return with spinlock held and memory not freed.

> +        }
> +
> +        /* Keep overlay_node address in tracker. */
> +        tr->nodes_address[j] = (unsigned long)overlay_node;
> +    }
> +
> +    INIT_LIST_HEAD(&tr->entry);
> +    list_add_tail(&tr->entry, &overlay_tracker);
> +
> +    spin_unlock(&overlay_lock);
> +
> +    if ( nodes_full_path != NULL )
> +    {
> +        for ( i = 0; i < tr->num_nodes && nodes_full_path[i] != NULL;
> +              i++ )
> +        {
> +            xfree(nodes_full_path[i]);
> +        }
> +        xfree(nodes_full_path);
> +    }
This block of code is identical to the one at the end so some cleanup is necessary.

> +
> +    return rc;
> +
> +/*
> + * Failure case. We need to remove the nodes, free tracker(if tr exists) and
> + * tr->dt_host_new.
> + */
> +remove_node:
> +    tr->num_nodes = j;
> +    rc = remove_nodes(tr);
> +
> +    if ( rc )
> +    {
> +        /*
> +         * User needs to provide right overlay. Incorrect node information
> +         * example parent node doesn't exist in dt_host etc can cause memory
> +         * leaks as removing_nodes() will fail and this means nodes memory is
> +         * not freed from tracker. Which may cause memory leaks. Ideally, these
> +         * device tree related mistakes will be caught by fdt_overlay_apply()
> +         * but given that we don't manage that code keeping this warning message
> +         * is better here.
> +         */
> +        printk(XENLOG_ERR "Removing node failed.\n");
> +        spin_unlock(&overlay_lock);
> +        return rc;
> +    }
> +
> +err:
> +    spin_unlock(&overlay_lock);
> +
> +    if ( tr->dt_host_new )
> +        xfree(tr->dt_host_new);
> +
> +    xfree(tr->overlay_fdt);
> +    xfree(tr->nodes_address);
> +    xfree(tr->fdt);
> +
> +    if ( nodes_full_path != NULL )
> +    {
> +        for ( i = 0; i < tr->num_nodes && nodes_full_path[i] != NULL;
> +              i++ )
> +        {
> +            xfree(nodes_full_path[i]);
> +        }
> +        xfree(nodes_full_path);
> +    }
> +
> +    xfree(tr);
> +
> +    return rc;
> +}
> +
>  long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>  {
>      long ret;
> @@ -395,6 +898,13 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>  
>      switch ( op->overlay_op )
>      {
> +    case XEN_SYSCTL_DT_OVERLAY_ADD:
> +        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
> +        if ( ret )
> +            xfree(overlay_fdt);
See my comment about xfree in previous patch

> +
> +        break;
> +
>      case XEN_SYSCTL_DT_OVERLAY_REMOVE:
>          ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
>          xfree(overlay_fdt);

~Michal

