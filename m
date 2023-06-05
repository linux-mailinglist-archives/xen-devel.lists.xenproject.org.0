Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D761072211F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 10:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543562.848641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65gJ-0003Au-BB; Mon, 05 Jun 2023 08:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543562.848641; Mon, 05 Jun 2023 08:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65gJ-00038y-6w; Mon, 05 Jun 2023 08:35:15 +0000
Received: by outflank-mailman (input) for mailman id 543562;
 Mon, 05 Jun 2023 08:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPmL=BZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q65gH-00038s-Lh
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 08:35:13 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c216de-037b-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 10:35:11 +0200 (CEST)
Received: from MW3PR05CA0020.namprd05.prod.outlook.com (2603:10b6:303:2b::25)
 by IA0PR12MB8932.namprd12.prod.outlook.com (2603:10b6:208:492::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 08:35:06 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::ab) by MW3PR05CA0020.outlook.office365.com
 (2603:10b6:303:2b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Mon, 5 Jun 2023 08:35:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Mon, 5 Jun 2023 08:35:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 03:35:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 03:35:04 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Jun 2023 03:35:03 -0500
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
X-Inumbo-ID: e1c216de-037b-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkbZ2inCedZaj5dt7y9boZtQTGy8NG1m6I2OQhoen/qLvfEtpPJgX8ryAc4pXdsfykP72FcbzsuZ1Xr8bHIvKEZ7Ai14Pa76DEZg6sY02+8VbYC9/iYvXds8+tT009PVzjQwgMSMLweRmcXmxY78l3+tajxOB3grWilzkbPGFU03aPxN6CzHa7yy2i+mHord8LrplBVFEGitwDRCZye8k60DZsaXhedh1UP2VvLZ0L7bLp7xM7KHTMwIAH3JGKZny8vSxUw/8pnDfxBjgvFrMUsNn+9nxmLnDEVSfWTK0jRuJzymmDLSTmfpsQ+bDy1SMU4bjTgLkxs5woU9nAptgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpYlCU7xIRM186ElE/JtnmsqO6Gv6vRzCEjjapELA/0=;
 b=jFdaJDpANaGV5c3cK9JYZhIp0BAQ0CxYgOVNBGfLSbVYJ9uTwxONcKw1zv5CQuc19a3VK5e0tiU82KoqG3H4J+LzT7kRNCWzIl4LJSTps8omVGITABF6T2vaKznNnMAcQ88VUsU0WUf/7tUB7c7OcLXhedYusOFs1hgQTfeTM2mCBhY4cFgPdxyzNK52Cnjb5kFei0FYm30zRyyxesHsb3ByL2WnM/PFctEH3I4+1OBakJ17DRsN55l+65tYfj5ozzAcZzPg7vRQIi+towYcR5DzQqH52FS9O8FWEXEBijVywoNlhlnh5iLU2VtJfPcVsRrYii3qnPDt38COvzSxrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpYlCU7xIRM186ElE/JtnmsqO6Gv6vRzCEjjapELA/0=;
 b=Kxd5LTSztpgKtMENi9Y+4EIkVafXDLRujJ6XpIWsKGnPyG3NqNASrLfuFxSYwPrRvht9hTX/MTBRUWlvz5X7Iz42bY7yUe7TPg3FixmKY7j3/Hp81yUi7UgAOd4qCPtaygC9Qy5CV5reqrVRCfOjUMLp3l2+yWShejC2xmE0/XU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <68ea453f-cf6e-a5dd-a061-a576cebe2d92@amd.com>
Date: Mon, 5 Jun 2023 10:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 16/19] xen/arm: Implement device tree node
 addition functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-17-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-17-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT040:EE_|IA0PR12MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0cfc04-ff63-4c9a-5445-08db659fc37d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6N9y9gpnMOunioqMxGdVAvgfnxNiJuW/DxEFtorcD1WlwalH2/vVdgqKZfybF+bEOQ7MnSy/hEKzDTbdwoq5w+Ox2sNeAe9DUX1WPZZ6ekZskMsqiaj2q7r+k9Y30kX71KDmOy4EfqLnOZVTapAQoj7Vw8OvNk6KgoyBHBf7GaA5vScQPr5mxKffoeVYk09p8Mc+eSnH9D2xQuEZcCSKAXj1k0Ch9tjJbinFass7/1wSHxVLhk9Z/y7L0g1aBdce8S9j3F9UOeFyTwnVc/RtxEdeqB+Vb9jF/KZKlg/RFF3SOQfmXxfjzxGQCXM65SCF7lwhFnBv8TQZBuhFnikHc2HUtv/vjR9kdMB22Fynjmxf2wPmFpIAfa0sXP/Mg/erNaHbl2XMOcFmNu+JAzi+5NmIdhdwVK+KwQuOmYZ/CuOcnohCDL+qb3kDxjqJdXTBTx89vFq+5sNGrr7VLcFTBr6MOO8iklCF3tA9alyvH13N/brG4c253AvE+7DmAegJCUUBIV6RkaaUojDUUIX9zgUHVBgGBqK6lNj5PBGBNnH3VnNdnPSQ7h/DLcu9OdfncJ/PHZKDW1PAmrdN6b4j9Fg38g/+zCa/NBTMbJ36aRW8V0YVveG7zwbq7oiF96CCK5XezsGw23GDTZaDWMyx4uLZmYdlPLcjCWZ5wDwOlhCET0QoHtt2ZYL1tllV7rYr8/NfLqqQRxcliv20asf8Z6jjTf9bFf4XEmrWNUs7OW4aSWvYPVmwDCr6EcPzHEHkFTWwz/DAWT+DHiOHOdkLEWILSHNBHkxN3TxcK5ZDEShNTi6llUX6VyE4/GrNaLRJ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(53546011)(2616005)(41300700001)(31686004)(336012)(426003)(47076005)(36860700001)(186003)(26005)(83380400001)(82310400005)(40460700003)(66899021)(478600001)(40480700001)(110136005)(16576012)(54906003)(4326008)(81166007)(82740400003)(356005)(70586007)(70206006)(316002)(8936002)(8676002)(5660300002)(44832011)(2906002)(30864003)(31696002)(86362001)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 08:35:05.5470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0cfc04-ff63-4c9a-5445-08db659fc37d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8932

Hi Vikram,

On 02/06/2023 02:48, Vikram Garhwal wrote:
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
> 
> ---
> Changes from v6:
>     Fix comment style and add comment regarding false flag in irq mapping.
>     Move malloc for nodes_full_path to handle_add_overlay_nodes.
>     Move node_num define to start of overlay_get_nodes_info().
>     Remove "domain *d" from handle_add_irq_iommu().
>     Fix error handling for handle_add_irq_iommu().
>     Split handle_add_overlay_nodes to two functions.
>     Create a separate function for freeing nodes_full_path.
>     Fix xfree for dt_sysctl.
> ---
>  xen/common/dt-overlay.c | 533 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 533 insertions(+)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index b2a7e441df..12b6b010ef 100644
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
> @@ -106,6 +125,78 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
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
> +        /*
> +         * If parent has at least one child node.
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
> +
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
> @@ -145,6 +236,76 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
>      return num_overlay_nodes;
>  }
>  
> +/*
> + * overlay_get_nodes_info gets full name with path for all the nodes which
> + * are in one level of __overlay__ tag. This is useful when checking node for
> + * duplication i.e. dtbo tries to add nodes which already exists in device tree.
> + */
> +static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
> +{
> +    int fragment;
> +    unsigned int node_num = 0;
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
> +            nodes_full_path[node_num] = xmalloc_bytes(node_full_name_len);
> +
> +            if ( nodes_full_path[node_num] == NULL )
> +                return -ENOMEM;
> +
> +            memcpy(nodes_full_path[node_num], target_path, target_path_len);
> +
> +            nodes_full_path[node_num][target_path_len] = '/';
> +
> +            memcpy(nodes_full_path[node_num] + target_path_len + 1,
> +                    node_name, node_name_len);
> +
> +            nodes_full_path[node_num][node_full_name_len - 1] = '\0';
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
> @@ -369,6 +530,373 @@ out:
>      return rc;
>  }
>  
> +/*
> + * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
> + * overlay_node.
> + */
> +static int handle_add_irq_iommu(struct dt_device_node *overlay_node)
> +{
> +    int rc;
> +    unsigned int naddr, i, len;
> +    struct dt_device_node *np;
> +
> +    /*
> +     * First let's handle the interrupts.
> +     * For now, need_mapping is set to false which means it will only permit IRQ
> +     * access to hardware_domain using irq_permit_access() but will never route
> +     * as route_irq_to_guest() will not be called with false flag.
> +     */
> +    rc = handle_device_interrupts(hardware_domain, overlay_node, false);
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
These shall be paddr_t and ...

> +
> +        /*
> +         * For now, we skip_mapping which means it will only permit iomem access
> +         * to hardware_domain using iomem_permit_access() but will never map as
> +         * map_range_p2mt() will not be called.
> +         */
> +        struct map_range_data mr_data = { .d = hardware_domain,
> +                                          .p2mt = p2m_mmio_direct_c,
> +                                          .skip_mapping = true
> +                                        };
> +
> +        rc = dt_device_get_address(overlay_node, i, &addr, &size);
... here you should use dt_device_get_paddr()

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
> +        rc = handle_add_irq_iommu(np);
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
> +static void free_nodes_full_path(int num_nodes, char **nodes_full_path)
num_nodes shall be unsigned

> +{
> +    int i;
unsigned

> +
> +    if ( nodes_full_path != NULL )
> +    {
> +        for ( i = 0; i < num_nodes && nodes_full_path[i] != NULL;
> +              i++ )
> +        {
> +            xfree(nodes_full_path[i]);
> +        }
> +        xfree(nodes_full_path);
> +    }
> +
> +    return;
Why explicit return from void function?
Also, you could get rid of the {} by doing:
    if ( nodes_full_path == NULL )
        return;

    for ( i = 0; i < num_nodes && nodes_full_path[i] != NULL; i++ )
        xfree(nodes_full_path[i]);

    xfree(nodes_full_path);

> +}
> +
> +static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
> +
> +{
> +    int j, rc;
j shall be unsigned as you use it as an index to nodes_full_path and num_nodes of overlay_track is unsigned.

> +    struct dt_device_node *overlay_node;
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
> +            return -EFAULT;
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
> +            return rc;
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
> +            return -EFAULT;
> +        }
> +
> +        rc = handle_add_irq_iommu(overlay_node);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
> +            return rc;
> +        }
> +
> +        /* Keep overlay_node address in tracker. */
> +        tr->nodes_address[j] = (unsigned long)overlay_node;
> +    }
> +
> +    return 0;
> +}
> +/*
> + * Adds device tree nodes under target node.
> + * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
> + * is done to avoid the removal of device_tree generation, iomem regions mapping
> + * to hardware domain done by handle_node().
> + */
> +static long handle_add_overlay_nodes(void *overlay_fdt,
> +                                     uint32_t overlay_fdt_size)
> +{
> +    int rc, j;
j shall be unsigned

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
> +        printk(XENLOG_ERR "Increasing fdt size to accommodate overlay_fdt failed with error %d\n",
> +               rc);
> +        goto err;
> +    }
> +
> +    nodes_full_path = xzalloc_bytes(tr->num_nodes * sizeof(char *));
> +    if ( nodes_full_path == NULL )
> +    {
> +        rc = -ENOMEM;
> +        goto err;
> +    }
> +
> +    /*
> +     * overlay_get_nodes_info is called to get the node information from dtbo.
> +     * This is done before fdt_overlay_apply() because the overlay apply will
> +     * erase the magic of overlay_fdt.
> +     */
> +    rc = overlay_get_nodes_info(overlay_fdt, nodes_full_path);
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
> +    rc = add_nodes(tr, nodes_full_path);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Adding nodes failed. Removing the partially added nodes.\n");
> +        goto remove_node;
> +    }
> +
> +    INIT_LIST_HEAD(&tr->entry);
> +    list_add_tail(&tr->entry, &overlay_tracker);
> +
> +    spin_unlock(&overlay_lock);
> +
> +    free_nodes_full_path(tr->num_nodes, nodes_full_path);
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
> +
> +        free_nodes_full_path(tr->num_nodes, nodes_full_path);
> +
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
> +    free_nodes_full_path(tr->num_nodes, nodes_full_path);
This should be moved after freeing dt_host_new to keep reverse order

> +
> +    xfree(tr);
> +
> +    return rc;
> +}
> +
>  long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>  {
>      long ret;
> @@ -396,6 +924,11 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>  
>      switch ( op->overlay_op )
>      {
> +    case XEN_SYSCTL_DT_OVERLAY_ADD:
> +        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
> +
remove empty line

> +        break;
> +
>      case XEN_SYSCTL_DT_OVERLAY_REMOVE:
>          ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
>  

~Michal

