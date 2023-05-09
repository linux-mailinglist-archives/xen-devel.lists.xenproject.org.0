Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE26FC906
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532251.828354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOMU-000380-RJ; Tue, 09 May 2023 14:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532251.828354; Tue, 09 May 2023 14:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOMU-00035Z-NU; Tue, 09 May 2023 14:30:42 +0000
Received: by outflank-mailman (input) for mailman id 532251;
 Tue, 09 May 2023 14:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PO4B=A6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pwOMS-00035T-OC
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:30:40 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 117723fb-ee76-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 16:30:38 +0200 (CEST)
Received: from BN9PR03CA0965.namprd03.prod.outlook.com (2603:10b6:408:109::10)
 by CH2PR12MB4874.namprd12.prod.outlook.com (2603:10b6:610:64::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 14:30:35 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::86) by BN9PR03CA0965.outlook.office365.com
 (2603:10b6:408:109::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Tue, 9 May 2023 14:30:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 14:30:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 09:30:34 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 9 May 2023 09:30:32 -0500
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
X-Inumbo-ID: 117723fb-ee76-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHVyrXlDsAhjFYpne/JeSxDxMpRuE/FAv1/eT2nccDsX+xseqm7VXo4aJFLBiIl1Ezma00+57eeRFQZwxvlbUUq2UGRrhmv9KSDEkp2X2AV5oJIZXW1KoYwHoBLZ4ZSX+RzZvW56Pzh/yM7Vazf5ul6yP+TQl4dT2qXrUhQ0Qp5KC24rsEmilzfjxA50HU9o5Tbn52qK6bSye0Ku90cCtTB6jkmfq99q+24d8BYrbSn6VtpZsS1mFzUykB35NVgxe6F73UpBWv8w3+GYBk6e79HholmceDOo0eROduD/tIPme4+TwZF4gWh/CXk2nMQcvrR885BVOIN+a2cm4OKelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC85YpkY8sd1brOOSAgibYc0mheybciXTgrou8/dKUs=;
 b=KtzM1f8LOZOGjcPre2jz/gaJRTLdR3p7+FK56AXzjkwjYzoNfj0hNXHlo2dm+A4VNVvZVV1SjxRnMAY6dQIkdpv54nCXy8I0+GCZX3kduqY+vCJlW1O3+1yMexppwVQnW7S1IJqVFkoJherimY3msbRMaKKeFFBptdqAQNBx2DbA3EVIaDqtYTr7lpFd6cbdKjNTYLYQtJkZUp/XmnCh9AgVCQsaB2XD812u5u9PuIGuVWtWrIdzIYClMFYLB3b2pohLEnpwV66f/g9f2Ry4TpXulCXu79wIsf6+94qjjZq6pdIFk8ZSMdhtlUn+6xSDZ/SaEsr+YuC82tn1Wbykmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC85YpkY8sd1brOOSAgibYc0mheybciXTgrou8/dKUs=;
 b=T0sSqf8aQV8fMXlUNyaHJi6MPLW034cut0SfHdIzz2P1vBa0o2x+hG9r7npSpdrUKMfvCZWQ6PRPUYCmK0WFY+RchFqOtfMst26p+cAVJtXfpZ5RPb10g43ObvpuIjfeCuhqtYmoRPZAoyCDv12YJxjee3jAC/yek3x4VzalMCw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8c96d009-bd81-66c7-fd23-1f11bc07e72f@amd.com>
Date: Tue, 9 May 2023 16:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 15/19] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-16-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230502233650.20121-16-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT003:EE_|CH2PR12MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e5bfef-cc36-4ba5-39cd-08db5099f381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RN35gLrYA0uYv5e/1KgvMcoecH4Bn/gN5/4a/RLv0xjDWFDp10oz6rNpDduJN7BNKhOOt7eBRygQNeg65jROKNmUGTaEuKZMAl7WaTOIb56b/b1nfrTn32I/HmkDw5rT6X7h+Z23eYssZfxU9TcaZqxOzIC9icx+brbFfFaKZ8qyHoya8Szgy2HStyOj/AeOeQg0DV/CKlGFLKAaix5Yn/yBiBlN9VdxLK9geAfLfavUTKPsAUR/OIC3Sucqs2qp5pZ2eMetOautkAhpmOdc75/Glt7REdSqmovE9pRktSoXzS6+RHSYxxo0AVNnWB1lPUAFA/yMil+Xxqpb9dnwLRjuaudcXEa7Sw7fDCupIardJ6dSaAvVAQjtZx5VEDSzZ3XaBA3VcKxu/I69LyPhQw/W5t6wGVcmlIzT1qqxafLzi4n1jxgAFmWAi0MoX7TWCbi8h+05KfZFTHXvgd+8fhDYvyR5CUYY/1sbWWKLb6GjXPc2Ti96mHgrQUVGI0gtPEEwi0QbukTZiIXG+eRKaY7ZbMYNPxu7TB0Rrc8tl4QXt8Rxqcno0XQAVLJLuwLJnGX2l2/Jaok2Jpy9lm1IrJze0jpHlydeFXmg2utB9pGvjfdp3UFRae2lKWj+Z5GOoo5d7fL6iJ52ltCGrw0K/1qqnuRgWWoam0i2ERM1Sxmue/VjoWQ9ek25tUsl1whTcDWLVye6BaEKRo8VwOAyxQnvTW9gG7S4ng/0vQD1+osMffkyV+VOFlxCCI21dDeThrrdX35SzJ1/+ynujfDWqZpkudD3MEkHeEwAWoTuSiY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(26005)(53546011)(40480700001)(336012)(426003)(2616005)(36756003)(36860700001)(81166007)(31696002)(86362001)(356005)(82310400005)(82740400003)(186003)(40460700003)(47076005)(83380400001)(110136005)(41300700001)(16576012)(54906003)(4326008)(2906002)(31686004)(30864003)(5660300002)(8676002)(478600001)(8936002)(316002)(44832011)(70586007)(70206006)(403724002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:30:34.8139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e5bfef-cc36-4ba5-39cd-08db5099f381
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4874



On 03/05/2023 01:36, Vikram Garhwal wrote:
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
>  xen/common/dt-overlay.c      | 419 +++++++++++++++++++++++++++++++++++
>  xen/include/public/sysctl.h  |  23 ++
>  xen/include/xen/dt-overlay.h |  58 +++++
>  5 files changed, 516 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/dt-overlay.c
>  create mode 100644 xen/include/xen/dt-overlay.h
> 
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index b0a78a8b10..456358166c 100644
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
> index 0000000000..b89cceab84
> --- /dev/null
> +++ b/xen/common/dt-overlay.c
> @@ -0,0 +1,419 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
GPL-2.0-only according to the latest series from Andrew (GPL-2.0 is a depracated tag)

[...]

> +
> +    /* Remove mmio access. */
> +    for ( i = 0; i < naddr; i++ )
> +    {
> +        uint64_t addr, size;
> +
> +        rc = dt_device_get_address(device_node, i, &addr, &size);
Given that Ayan's 32-bit series might be merged first, this will have to be changed (to use paddr_t for addr,size, etc.)

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
as always, please do not initialize variables if it is not required (this applies to all the patches)

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
> +               " Removing nodes is supported for only prior added dtbo. Please"
> +               " provide a valid dtbo which was used to add the nodes.\n");
This will be a quite large single line. Maybe some split?

> +        goto out;
> +
> +    }
> +
> +    rc = remove_nodes(entry);
> +
remove this line so that a check follows assignment

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
this xfree and ...
> +
> +        break;
> +
> +    default:
> +        xfree(overlay_fdt);
this one can be removed by adding a single xfree before final return

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
> index 2b24d6bfd0..28f7fba98b 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1057,6 +1057,24 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
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
> +};
> +#endif
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1087,6 +1105,7 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_dt_overlay                    30
>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1117,6 +1136,10 @@ struct xen_sysctl {
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
> index 0000000000..5b369f8eb7
> --- /dev/null
> +++ b/xen/include/xen/dt-overlay.h
> @@ -0,0 +1,58 @@
> + /* SPDX-License-Identifier: GPL-2.0 */
GPL-2.0-only according to the latest series from Andrew (GPL-2.0 is a depracated tag)

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
> +
> +/*
> + * overlay_node_track describes information about added nodes through dtbo.
structure is called overlay_track

> + * @entry: List pointer.
> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
This reads strange, would you mind to fix it?

> + * @fdt: Stores the fdt.
From here ...

> + * @nodes_fullname: Stores the full name of nodes.
> + * @nodes_irq: Stores the IRQ added from overlay dtb.
> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
... to here these params do not reflect the struct members. Please fix. Also, you can omit "Stores" word
and just write e.g. "total number of ..."

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
no xen/errno.h included results in a compilation error on my side.

> +}
> +#endif
add empty line here

> +#endif
add /* __XEN_DT_OVERLAY_H__ */ next to last #endif

> +
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

