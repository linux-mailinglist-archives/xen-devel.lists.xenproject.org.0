Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFC6795D9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 11:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483472.749667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKGyl-0001CR-Lp; Tue, 24 Jan 2023 10:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483472.749667; Tue, 24 Jan 2023 10:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKGyl-00019A-I7; Tue, 24 Jan 2023 10:56:39 +0000
Received: by outflank-mailman (input) for mailman id 483472;
 Tue, 24 Jan 2023 10:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EcKj=5V=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pKGyk-000194-7c
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 10:56:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c34846f3-9bd5-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 11:56:33 +0100 (CET)
Received: from DM5PR07CA0058.namprd07.prod.outlook.com (2603:10b6:4:ad::23) by
 MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 10:56:30 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::6) by DM5PR07CA0058.outlook.office365.com
 (2603:10b6:4:ad::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 10:56:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 24 Jan 2023 10:56:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 04:56:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 02:56:28 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 24 Jan 2023 04:56:27 -0600
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
X-Inumbo-ID: c34846f3-9bd5-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/R/F+pW8fX8wj85ZnJDH9M88aIjyWJyx69+g4FrEPMs5wXKhyezBRwuQBeqoXk5/eNPqVNicYYbsbdIBxT+9uqNNMDYJd8Swryc1ECfWa37j2yXTp78rXPcY0XPFkrZd9mkCwWxJdQGfKTCxsHJq0pz0vcqIDa0dyOStfM4SdMCv5AZgC5d+IRDI9wvMAcyAMJrsSD63BUpv4f7h2+yRfuAt6iXWgEqr3abDWGk/cWZcEjZwVIpzij7gYvBnzdwAnwPPM1wX4n25PXmcYvXweJC16cU0k7mvJ4IZ/tcQ2fcoA79IPMWu/GqideOWI6R+02pMVrKkoEzZvr6L+b4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lNnU5d6266tgFlyfbx7geCpGMT6/ZXZjG5mtIs/Pq0=;
 b=WSRSwA51ev8o4rrTWumdwmcmLBHZPn3fUnJQUyUwck5SgvYks9ch2PFkUNOLyob4jOOFY3BH09ckoysdvEW/sqmbRBkWsVSQzAiMq9UviQn0nThqhEuG9xkJS6nPy3e//rXLXXCZF35rkXKqPHwsM4mh7F8xVBUcnXXbRtyETUppLekbVqQE0qy50pjndqGXtZjAcVdtJnHb9niXCSrghu+0UxhboiHYqzYliH+1jZbXj4Yr+K6rDTdij2sGQUcsuzrWz1Yc07DVk7O1EsLBH1gA5Az7VOXsEpLBNhMvkvpcNopqAAgaxvs/7AD2h4//HMsyWcNL2Umks8GIWAn5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lNnU5d6266tgFlyfbx7geCpGMT6/ZXZjG5mtIs/Pq0=;
 b=rU3okWx531iXm9Ba5pnBNSvwTSwXix5ao3WMLwNmv1GIOWthUmwrOzaa2L+PCWdhzOY1fw8ak4ZGmvYjcwjBnplaQEgb7ZtVAI4emLNWXfnIyO1bMHSNpSnnpZZssKSfyCivtncdyaKdXtQVjiIQlEnQEtdWZVnSHQWSvus/jpo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <678e765c-9ab7-14d8-ecbd-6edeb230c41d@amd.com>
Date: Tue, 24 Jan 2023 11:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 13/16] xen/arm: Implement device tree node
 addition functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <Luca.Fancellu@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-7-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061815.7404-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT099:EE_|MN0PR12MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ab540f-9338-49c1-ea0b-08dafdf9a5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BuueBnlFmZ/JstIG5n0pY6hl7s/jQ0rfSCUfJkiGec8g9WmQc2NvdFRR5TtvscjqhINz2CVxLGUYv2JJb/rDtjp6lQz1yx2HFPjd0fq9VE264dQJ03gT9TcqHpf8jvEiDeCMKS8mt3m0B7Fikh/A8wvbJ4IWPwpdA+ycA9z+PYY+iqTz4FHjd93+sLJS+d3O+QIypTrJUTn8GLQKOy5cuhjClC+jXhwbPPmelo7wdlUWI3HKeEfnEAeAzX0+70HoumqjlfLAuq5Rcru0W3O9SHnJdopHQ6VlATAIHyVjYa99ozBVXWfyRXAMi4c32N4P+VeKwLd3g/+BQdsRVeGoNQdx4I9K9aCosLuvgc1oq+wBnW1EQJ88i+ccbkrKibT0Xj/XsWt46/O1CUaAddco8CGM2U2fnCW3/l067Vp57O7/F+2JAQ88XXmXyXBP/f8HvgDfX4wCn7nWCwIh7MaxE417vVSvvKNVwhCl7NpRINX3r8AEkwVfsQnDxr6aNZ1APUpBPauPhHUcfjOaP5s8H0NHiwmugefj8/kWhTxtJPehx2E5TUTjAamo4f5nnM7+oWeALx5GChjpUl8CzQfI4//I6NyjRrcyMkja6ue0QQ598qycN0Wlw5QI85+yTvh3VNoLHEDL4N/Q0IvFqvw9Qmqhf0vCVGR7oWsLb80EBONfMicL3PTT/2QmaHSvoohT7uKE9GfUM3PoqMY3ISMWKTZtnlKBUBRUUAtRK+B2A3ykt00zel1V1iM4DypgU0IkfkvUO+JnSwEW0Y28f6Bg5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(31686004)(4326008)(8676002)(70206006)(2616005)(53546011)(70586007)(426003)(47076005)(8936002)(41300700001)(186003)(26005)(83380400001)(30864003)(44832011)(5660300002)(2906002)(36860700001)(16576012)(82740400003)(81166007)(110136005)(82310400005)(31696002)(478600001)(336012)(54906003)(316002)(86362001)(36756003)(40460700003)(356005)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 10:56:29.5984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ab540f-9338-49c1-ea0b-08dafdf9a5cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6004

Hi Vikram,

On 07/12/2022 07:18, Vikram Garhwal wrote:
> 
> 
> Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
> using device tree overlay.
> 
> xl dt_overlay add file.dtbo:
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
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/common/dt_overlay.c | 465 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 465 insertions(+)
> 
> diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
> index 477341f0aa..f5426b9dab 100644
> --- a/xen/common/dt_overlay.c
> +++ b/xen/common/dt_overlay.c
> @@ -38,9 +38,29 @@ static struct dt_device_node *find_last_descendants_node(
>      /* If last child_node also have children. */
>      if ( child_node->child )
>          child_node = find_last_descendants_node(child_node);
> +
This should be done in a previous patch as I pointed out in patch 12.

>      return child_node;
>  }
> 
> +/*
> + * Returns next node to the input node. If node has children then return
> + * last descendant's next node.
> +*/
> +static struct dt_device_node *dt_find_next_node(struct dt_device_node *dt,
> +                                                struct dt_device_node *node)
I think the node should be const.

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
> @@ -114,6 +134,74 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
>      return 0;
>  }
> 
> +static int dt_overlay_add_node(struct dt_device_node *device_node,
> +                               const char *parent_node_path)
> +{
> +    struct dt_device_node *parent_node;
> +    struct dt_device_node *np, *np_last_descendant;
> +    struct dt_device_node *next_node;
> +    struct dt_device_node *device_node_last_descendant;
> +
> +    parent_node = dt_find_node_by_path(parent_node_path);
> +
> +    if ( parent_node == NULL )
> +    {
> +        dt_dprintk("Node not found. Overlay node will not be added\n");
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
> +        /* If parent has at least one child node.
> +         * Iterate to the last child node of parent.
> +         */
> +        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> +        {
> +        }
Instead of {} you could just put ; at the end of for statement.

> +
> +        /* Iterate over all child nodes of np node. */
> +        if ( np->child )
> +        {
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
> +        device_node_last_descendant = find_last_descendants_node(device_node);
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
> @@ -153,6 +241,79 @@ static unsigned int overlay_node_count(void *fdto)
>      return num_overlay_nodes;
>  }
> 
> +/*
> + * overlay_get_nodes_info will get full name with path for all the nodes which
> + * are in one level of __overlay__ tag. This is useful when checking node for
> + * duplication i.e. dtbo tries to add nodes which already exists in device tree.
> + */
> +static int overlay_get_nodes_info(const void *fdto, char ***nodes_full_path,
> +                                  unsigned int num_overlay_nodes)
> +{
> +    int fragment;
> +    unsigned int node_num = 0;
node_num should be moved under the second for loop.

> +
> +    *nodes_full_path = xzalloc_bytes(num_overlay_nodes * sizeof(char *));
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
> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +
> +        /*
> +         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> +         * overlay >= 0. So, no need for a overlay>=0 check here.
> +         */
> +        fdt_for_each_subnode(subnode, fdto, overlay)
> +        {
> +            const char *node_name = NULL;
> +            int node_name_len = 0;
No need for assignment.

> +            unsigned int target_path_len = strlen(target_path);
> +            unsigned int node_full_name_len = 0;
No need for assignment.
> +
> +            node_name = fdt_get_name(fdto, subnode, &node_name_len);
> +
> +            if ( node_name == NULL )
> +                return -EINVAL;
In case of node_name being NULL, the error code is stored in node_name_len, so
don't you want to return it instead of -EINVAL?

> +
> +            /*
> +             * Magic number 2 is for adding '/'. This is done to keep the
> +             * node_full_name in the correct full node name format.
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
> @@ -373,6 +534,302 @@ out:
>      return rc;
>  }
> 
> +/*
> + * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
> + * overlay_nodes.
> + */
> +static int handle_add_irq_iommu(struct domain *d,
> +                                struct dt_device_node *overlay_node)
> +{
> +    int rc = 0;
No need for assignment.

> +    unsigned int naddr, i, len;
> +    u64 addr, size;
Should be uint64_t.

> +    struct dt_device_node *np;
> +
> +    /* First let's handle the interrupts. */
> +    rc = handle_device_interrupts(d, overlay_node, false);
> +    if ( rc )
To match the handle_device_interrupts behavior on failure, you should check ( rc < 0 )

> +    {
> +        printk(XENLOG_ERR "Interrupt failed\n");
> +        return rc;
> +    }
> +
> +    /* Check if iommu property exists. */
> +    if ( dt_get_property(overlay_node, "iommus", &len) )
> +    {
> +
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
> +    dt_dprintk("%s passthrough = %d naddr = %u\n",
> +               dt_node_full_name(overlay_node), false, naddr);
> +
> +    /* Give permission for map MMIOs */
> +    for ( i = 0; i < naddr; i++ )
> +    {
> +        struct map_range_data mr_data = { .d = d,
> +                                          .p2mt = p2m_mmio_direct_c,
> +                                          .skip_mapping = true };
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
> +    for ( np = overlay_node->child; np != NULL; np = np->sibling)
> +    {
> +        rc = handle_add_irq_iommu(d, np);
Shouldn't you stop looping if rc not zero?

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
> +    int rc = 0, j = 0, i;
No need for assignments.

> +    struct dt_device_node *overlay_node, *prev_node, *next_node;
> +    struct domain *d = hardware_domain;
> +    struct overlay_track *tr = NULL;
> +    char **nodes_full_path = NULL;
> +    unsigned int new_fdt_size;
> +
> +    tr = xzalloc(struct overlay_track);
> +    if ( tr == NULL )
> +    {
No need for braces.

> +        return -ENOMEM;
> +    }
> +
> +    new_fdt_size = fdt_totalsize(device_tree_flattened) +
> +                                 fdt_totalsize(overlay_fdt);
> +
> +    tr->fdt = xzalloc_bytes(new_fdt_size);
> +    if ( tr->fdt == NULL )
What about allocated tr? Shouldn't you free it? Also this applies to ...

> +        return -ENOMEM;
> +
> +    tr->num_nodes = overlay_node_count(overlay_fdt);
> +    if ( tr->num_nodes == 0 )
> +    {
> +        xfree(tr->fdt);
here and ...

> +        return -ENOMEM;
> +    }
> +
> +    tr->nodes_address = xzalloc_bytes(tr->num_nodes * sizeof(unsigned long));
> +    if ( tr->nodes_address == NULL )
> +    {
> +        xfree(tr->fdt);
here and ...

> +        return -ENOMEM;
> +    }
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> +    if ( rc )
> +    {
> +        xfree(tr->fdt);
here and ...

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
> +        xfree(tr->fdt);
here.

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
> +    fdt_open_into(tr->fdt, tr->fdt, new_fdt_size);
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
> +    if ( rc < 0 )
> +        goto err;
> +
> +    for ( j = 0; j < tr->num_nodes; j++ )
> +    {
> +        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
> +
> +        /* Find the newly added node in tr->dt_host_new by it's full path. */
> +        overlay_node = device_tree_find_node_by_path(tr->dt_host_new,
> +                                                     nodes_full_path[j]);
> +        if ( overlay_node == NULL )
> +        {
> +            dt_dprintk("%s node not found\n", nodes_full_path[j]);
> +            rc = -EFAULT;
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
> +        rc = handle_add_irq_iommu(d, overlay_node);
Shouldn't you check rc and exit the loop earlier in case of failure?

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
> +        /* If removing node fails, this may cause memory leaks. */
> +        printk(XENLOG_ERR "Removing node failed.\n");
> +        spin_unlock(&overlay_lock);
> +        return rc;
> +    }
> +
> +err:
> +    spin_unlock(&overlay_lock);
> +
> +    xfree(tr->dt_host_new);
> +    xfree(tr->fdt);
> +    xfree(tr->overlay_fdt);
> +    xfree(tr->nodes_address);
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
>      long ret = 0;
> @@ -397,6 +854,14 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
> 
>      switch ( op->overlay_op )
>      {
> +    case XEN_SYSCTL_DT_OVERLAY_ADD:
> +        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
> +
> +        if ( ret )
> +            xfree(overlay_fdt);
> +
> +        break;
> +
>      case XEN_SYSCTL_DT_OVERLAY_REMOVE:
>          ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
>          xfree(overlay_fdt);
> --
> 2.17.1
> 
> 

~Michal


