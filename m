Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5D4DA58A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 23:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290968.493639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUFse-0005xk-ME; Tue, 15 Mar 2022 22:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290968.493639; Tue, 15 Mar 2022 22:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUFse-0005vP-Ic; Tue, 15 Mar 2022 22:43:04 +0000
Received: by outflank-mailman (input) for mailman id 290968;
 Tue, 15 Mar 2022 22:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tvka=T2=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1nUFsd-0005vJ-5u
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 22:43:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe59::4c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 437f8f06-a4b1-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 23:43:00 +0100 (CET)
Received: from BN9PR03CA0303.namprd03.prod.outlook.com (2603:10b6:408:112::8)
 by BL0PR02MB5459.namprd02.prod.outlook.com (2603:10b6:208:89::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 22:42:56 +0000
Received: from BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::82) by BN9PR03CA0303.outlook.office365.com
 (2603:10b6:408:112::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Tue, 15 Mar 2022 22:42:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT010.mail.protection.outlook.com (10.13.2.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Tue, 15 Mar 2022 22:42:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 15 Mar 2022 15:42:55 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 15 Mar 2022 15:42:55 -0700
Received: from [172.19.2.115] (port=33400 helo=xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <vikram.garhwal@amd.com>)
 id 1nUFsV-0001B8-EH; Tue, 15 Mar 2022 15:42:55 -0700
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
X-Inumbo-ID: 437f8f06-a4b1-11ec-853b-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeR1IaIdFH9uWaFnfYyP57gNeYduRg5eEc4vLQnTFlWledSfTjGbheLuSSX5P4OkFRv/TKcTOjfRycuuJ0i/N9vS8QHntP0YCDH7KT9mOSmoLajfmEgGxqd2ZB6wdxd1rkYS1F++FBRa2qoELNHsAnXQedH4653PUXY4/nuYPUWvwjPfKiYYw0PiWeRKHOGI7D8NK9FAwVRC4cWD0cLBW67d4fijwIT3mB8QdxoQUpn+1HOhQK6i6lZu3eSmWZJXDDltln7GPNXEpuU+237i7PtC9zi4Qa/CaToDhFyOv5ximYOTKBXpYGY2q8SjIU4xTaGj36v4qM7nKtxr4A6MzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+U0W1Iu6BxPOkDWEESgLC37DUIsqQ5OriJDWMOsc4Fg=;
 b=b7ucYfpMtoI+1xQPFD50tXOsnnQFzkBe1T5sejq/ZUerVVCAM9uwJNOc1v6M14rJjtffTNty04mRViSg+smqIqQteNPLT4n+ZD53R9y/oOtth9sTpirewXiiLgGj5xghjJei8fi47YQlqoOTtCBPAya77vi3u4/ba+LVcQeP+JGxUtx1P1IAImxYvjsAv/+y0Uhw3u8Ej66N46ZY/WA6AAh0QuNaOA161JgKswRrUBu+Gkv9wWCAl4KK7XYKb1O8cHIUGpImm0t4HWrcrb9Prkinj3wxDkhLJhPSvZ9h/hOUiRo0jV6rtITRdigWlLuxuliJggHYV8GIvKrMxW+ZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+U0W1Iu6BxPOkDWEESgLC37DUIsqQ5OriJDWMOsc4Fg=;
 b=jrRV+LtBoctIzN/DffHSc3YzyhwM8j1SyicEwjAVQ5aIdCUFYfl+uIvF8bZPXaxVeQxYG1AsLtcfQN3ueEtu8xQlFZ0DPvsrxGUV12nEaOhHbQtTH3BrfeZN1jb3A802zZYGg2sbvyR9Gbr8N8oW08oxUovnI+5374OaS0fPGAg=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Date: Tue, 15 Mar 2022 15:42:55 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 01/14] xen/arm/device: Remove __init from
 function type
Message-ID: <20220315224252.GB23054@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-2-fnu.vikram@xilinx.com>
 <337CEFA8-895C-4B5D-810A-3D4E2927CE01@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <337CEFA8-895C-4B5D-810A-3D4E2927CE01@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb4219e-eff6-4ab2-80f6-08da06d52636
X-MS-TrafficTypeDiagnostic: BL0PR02MB5459:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR02MB545963B9F4BD268AA7DE2A589F109@BL0PR02MB5459.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gLhO0a7rE2fzZ/bSXvlLWbVqJc5OemLxC1kH0FqUr2kmbR4k/q0g4MtVv9J7csIJSSxm06HiVj88LhCsUmnO6BOh0WsoWjoLm7x3F7FsFmuG2GVVmOg/er+MbDGdoDsghgf9kP8FZQ05wUsHU/oJrdLgHnBEYnhhV2jVNYOZre5puM/C9IwelpX3c1WH0+CQTri9Z3jcrmMqqyECVCOPiqm+hCGx+l0ks6hk3UNtf9DqPuQxA5eX8q7hdwUTCFaP1TSWlAU1uV+Eb1Abtk7VnN51WpAdq2a04/30GKlMfVZz0CWxZ/VAkfW0K7ECsGpfg/j5ELweNNl3j+cSupZ7rnm2Yf53RNGd3WSMLzDfykjR2IoNabSJHDO7aHckO6n1LgX6jlJNKLPYuxSMcYTDaU9NQOTbu9qzX4/ShXjb97z5xrGl7P5dHMXdxjiYmjl2/XYrR60yh47a1Ct5wb40b++TEFz9MSViyt2K1sg+QJxAREYXUfDKbeptalkGWyJ+4umKn+5O3/fhStf/nb7jiMQhFssFINDGMfsSqMIOC1KMNUk9Y7zeKGapbpZWHbycP71ycb4LtcAErdPPEYNezG+CVdd8yEYksYyjoBQuSNRHiAn/X3jsoj+s+xwHVDe+ka9HpH4LV+ris0CYcgfVVSPoz+7xYyLyYEdulEC9b3/jDuaQGye6HiCYCRLrDuWx
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(47076005)(86362001)(83380400001)(40460700003)(82310400004)(356005)(9786002)(8936002)(7636003)(5660300002)(508600001)(8676002)(35950700001)(4326008)(2906002)(70206006)(70586007)(44832011)(30864003)(1076003)(53546011)(336012)(36756003)(26005)(316002)(33656002)(9686003)(6916009)(7696005)(54906003);DIR:OUT;SFP:1022;
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 22:42:56.3847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb4219e-eff6-4ab2-80f6-08da06d52636
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5459

On Mon, Mar 14, 2022 at 12:31:06PM +0000, Luca Fancellu wrote:
> 
> 
> > On 8 Mar 2022, at 19:46, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
> > 
> > Change function type of following function to access during runtime:
> >    1. map_irq_to_domain()
> >    2. handle_device_interrupt()
> >    3. map_range_to_domain()
> >    4. unflatten_dt_node()
> >    5. unflatten_device_tree()
> > 
> > Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_domain() to
> > device.c.
> > 
> > These changes are done to support the dynamic programming of a nodes where an
> > overlay node will be added to fdt and unflattened node will be added to dt_host.
> > Furthermore, IRQ and mmio mapping will be done for the added node.
> > 
> > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > ---
> > xen/arch/arm/device.c            | 136 +++++++++++++++++++++++++++++
> > xen/arch/arm/domain_build.c      | 142 -------------------------------
> > xen/arch/arm/include/asm/setup.h |   3 +
> > xen/common/device_tree.c         |  20 ++---
> > xen/include/xen/device_tree.h    |   5 ++
> > 5 files changed, 154 insertions(+), 152 deletions(-)
> > 
> > diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> > index 70cd6c1a19..0dfd33b33e 100644
> > --- a/xen/arch/arm/device.c
> > +++ b/xen/arch/arm/device.c
> > @@ -21,6 +21,9 @@
> > #include <xen/errno.h>
> > #include <xen/init.h>
> > #include <xen/lib.h>
> > +#include <xen/iocap.h>
> > +#include <asm/domain_build.h>
> > +#include <asm/setup.h>
> > 
> > extern const struct device_desc _sdevice[], _edevice[];
> > extern const struct acpi_device_desc _asdevice[], _aedevice[];
> > @@ -84,6 +87,139 @@ enum device_class device_get_class(const struct dt_device_node *dev)
> >     return DEVICE_UNKNOWN;
> > }
> > 
> > +int map_irq_to_domain(struct domain *d, unsigned int irq,
> > +                      bool need_mapping, const char *devname)
> > +{
> > +    int res;
> > +
> > +    res = irq_permit_access(d, irq);
> > +    if ( res )
> > +    {
> > +        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
> > +               d->domain_id, irq);
> > +        return res;
> > +    }
> > +
> > +    if ( need_mapping )
> > +    {
> > +        /*
> > +         * Checking the return of vgic_reserve_virq is not
> > +         * necessary. It should not fail except when we try to map
> > +         * the IRQ twice. This can legitimately happen if the IRQ is shared
> > +         */
> > +        vgic_reserve_virq(d, irq);
> > +
> > +        res = route_irq_to_guest(d, irq, irq, devname);
> > +        if ( res < 0 )
> > +        {
> > +            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> > +                   irq, d->domain_id);
> > +            return res;
> > +        }
> > +    }
> > +
> > +    dt_dprintk("  - IRQ: %u\n", irq);
> > +    return 0;
> > +}
> > +
> > +int map_range_to_domain(const struct dt_device_node *dev,
> > +                        u64 addr, u64 len, void *data)
> > +{
> > +    struct map_range_data *mr_data = data;
> > +    struct domain *d = mr_data->d;
> > +    int res;
> > +
> > +    res = iomem_permit_access(d, paddr_to_pfn(addr),
> > +            paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> 
> Hi Vikram,
> 
> Why the if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> strlen("/reserved-memory/")) != 0 ) was dropped?
> 
> 
Hi Luca,
Thanks for spotting this. Yeah, I messed this while porting the patches from
internal to upstream Xen.
Will address this in v4!

@everyone, apologies for resending the same email. Previous one didn't make to
xen-devel due to change in my email ID.

Regards,
Vikram
> > +    if ( res )
> > +    {
> > +        printk(XENLOG_ERR "Unable to permit to dom%d access to"
> > +                " 0x%"PRIx64" - 0x%"PRIx64"\n",
> > +                d->domain_id,
> > +                addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> > +        return res;
> > +    }
> > +
> > +    if ( !mr_data->skip_mapping )
> > +    {
> > +        res = map_regions_p2mt(d,
> > +                               gaddr_to_gfn(addr),
> > +                               PFN_UP(len),
> > +                               maddr_to_mfn(addr),
> > +                               mr_data->p2mt);
> > +
> > +        if ( res < 0 )
> > +        {
> > +            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> > +                   " - 0x%"PRIx64" in domain %d\n",
> > +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> > +                   d->domain_id);
> > +            return res;
> > +        }
> > +    }
> > +
> > +    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> > +               addr, addr + len, mr_data->p2mt);
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * handle_device_interrupts retrieves the interrupts configuration from
> > + * a device tree node and maps those interrupts to the target domain.
> > + *
> > + * Returns:
> > + *   < 0 error
> > + *   0   success
> > + */
> > +int handle_device_interrupts(struct domain *d,
> > +                             struct dt_device_node *dev,
> > +                             bool need_mapping)
> > +{
> > +    unsigned int i, nirq;
> > +    int res;
> > +    struct dt_raw_irq rirq;
> > +
> > +    nirq = dt_number_of_irq(dev);
> > +
> > +    /* Give permission and map IRQs */
> > +    for ( i = 0; i < nirq; i++ )
> > +    {
> > +        res = dt_device_get_raw_irq(dev, i, &rirq);
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> > +                   i, dt_node_full_name(dev));
> > +            return res;
> > +        }
> > +
> > +        /*
> > +         * Don't map IRQ that have no physical meaning
> > +         * ie: IRQ whose controller is not the GIC
> > +         */
> > +        if ( rirq.controller != dt_interrupt_controller )
> > +        {
> > +            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
> > +                      i, dt_node_full_name(rirq.controller));
> > +            continue;
> > +        }
> > +
> > +        res = platform_get_irq(dev, i);
> > +        if ( res < 0 )
> > +        {
> > +            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> > +                   i, dt_node_full_name(dev));
> > +            return res;
> > +        }
> > +
> > +        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> > +        if ( res )
> > +            return res;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > /*
> >  * Local variables:
> >  * mode: C
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 8be01678de..b06770a2af 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1794,41 +1794,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
> >     return res;
> > }
> > 
> > -int __init map_irq_to_domain(struct domain *d, unsigned int irq,
> > -                             bool need_mapping, const char *devname)
> > -{
> > -    int res;
> > -
> > -    res = irq_permit_access(d, irq);
> > -    if ( res )
> > -    {
> > -        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
> > -               d->domain_id, irq);
> > -        return res;
> > -    }
> > -
> > -    if ( need_mapping )
> > -    {
> > -        /*
> > -         * Checking the return of vgic_reserve_virq is not
> > -         * necessary. It should not fail except when we try to map
> > -         * the IRQ twice. This can legitimately happen if the IRQ is shared
> > -         */
> > -        vgic_reserve_virq(d, irq);
> > -
> > -        res = route_irq_to_guest(d, irq, irq, devname);
> > -        if ( res < 0 )
> > -        {
> > -            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> > -                   irq, d->domain_id);
> > -            return res;
> > -        }
> > -    }
> > -
> > -    dt_dprintk("  - IRQ: %u\n", irq);
> > -    return 0;
> > -}
> > -
> > static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
> >                                        const struct dt_irq *dt_irq,
> >                                        void *data)
> > @@ -1860,57 +1825,6 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
> >     return 0;
> > }
> > 
> > -int __init map_range_to_domain(const struct dt_device_node *dev,
> > -                               u64 addr, u64 len, void *data)
> > -{
> > -    struct map_range_data *mr_data = data;
> > -    struct domain *d = mr_data->d;
> > -    int res;
> > -
> > -    /*
> > -     * reserved-memory regions are RAM carved out for a special purpose.
> > -     * They are not MMIO and therefore a domain should not be able to
> > -     * manage them via the IOMEM interface.
> > -     */
> > -    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> > -                     strlen("/reserved-memory/")) != 0 )
> > -    {
> > -        res = iomem_permit_access(d, paddr_to_pfn(addr),
> > -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> > -        if ( res )
> > -        {
> > -            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> > -                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
> > -                    d->domain_id,
> > -                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> > -            return res;
> > -        }
> > -    }
> > -
> > -    if ( !mr_data->skip_mapping )
> > -    {
> > -        res = map_regions_p2mt(d,
> > -                               gaddr_to_gfn(addr),
> > -                               PFN_UP(len),
> > -                               maddr_to_mfn(addr),
> > -                               mr_data->p2mt);
> > -
> > -        if ( res < 0 )
> > -        {
> > -            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> > -                   " - 0x%"PRIx64" in domain %d\n",
> > -                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> > -                   d->domain_id);
> > -            return res;
> > -        }
> > -    }
> > -
> > -    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> > -               addr, addr + len, mr_data->p2mt);
> > -
> > -    return 0;
> > -}
> > -
> > /*
> >  * For a node which describes a discoverable bus (such as a PCI bus)
> >  * then we may need to perform additional mappings in order to make
> > @@ -1938,62 +1852,6 @@ static int __init map_device_children(const struct dt_device_node *dev,
> >     return 0;
> > }
> > 
> > -/*
> > - * handle_device_interrupts retrieves the interrupts configuration from
> > - * a device tree node and maps those interrupts to the target domain.
> > - *
> > - * Returns:
> > - *   < 0 error
> > - *   0   success
> > - */
> > -static int __init handle_device_interrupts(struct domain *d,
> > -                                           struct dt_device_node *dev,
> > -                                           bool need_mapping)
> > -{
> > -    unsigned int i, nirq;
> > -    int res;
> > -    struct dt_raw_irq rirq;
> > -
> > -    nirq = dt_number_of_irq(dev);
> > -
> > -    /* Give permission and map IRQs */
> > -    for ( i = 0; i < nirq; i++ )
> > -    {
> > -        res = dt_device_get_raw_irq(dev, i, &rirq);
> > -        if ( res )
> > -        {
> > -            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> > -                   i, dt_node_full_name(dev));
> > -            return res;
> > -        }
> > -
> > -        /*
> > -         * Don't map IRQ that have no physical meaning
> > -         * ie: IRQ whose controller is not the GIC
> > -         */
> > -        if ( rirq.controller != dt_interrupt_controller )
> > -        {
> > -            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
> > -                      i, dt_node_full_name(rirq.controller));
> > -            continue;
> > -        }
> > -
> > -        res = platform_get_irq(dev, i);
> > -        if ( res < 0 )
> > -        {
> > -            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> > -                   i, dt_node_full_name(dev));
> > -            return res;
> > -        }
> > -
> > -        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> > -        if ( res )
> > -            return res;
> > -    }
> > -
> > -    return 0;
> > -}
> > -
> > /*
> >  * For a given device node:
> >  *  - Give permission to the guest to manage IRQ and MMIO range
> > diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> > index 7a1e1d6798..8a26f1845c 100644
> > --- a/xen/arch/arm/include/asm/setup.h
> > +++ b/xen/arch/arm/include/asm/setup.h
> > @@ -134,6 +134,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
> > u32 device_tree_get_u32(const void *fdt, int node,
> >                         const char *prop_name, u32 dflt);
> > 
> > +int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
> > +                             bool need_mapping);
> > +
> > int map_range_to_domain(const struct dt_device_node *dev,
> >                         u64 addr, u64 len, void *data);
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index 4aae281e89..f43d66a501 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -1811,12 +1811,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
> >  * @allnextpp: pointer to ->allnext from last allocated device_node
> >  * @fpsize: Size of the node path up at the current depth.
> >  */
> > -static unsigned long __init unflatten_dt_node(const void *fdt,
> > -                                              unsigned long mem,
> > -                                              unsigned long *p,
> > -                                              struct dt_device_node *dad,
> > -                                              struct dt_device_node ***allnextpp,
> > -                                              unsigned long fpsize)
> > +static unsigned long unflatten_dt_node(const void *fdt,
> > +                                       unsigned long mem,
> > +                                       unsigned long *p,
> > +                                       struct dt_device_node *dad,
> > +                                       struct dt_device_node ***allnextpp,
> > +                                       unsigned long fpsize)
> > {
> >     struct dt_device_node *np;
> >     struct dt_property *pp, **prev_pp = NULL;
> > @@ -2047,7 +2047,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
> > }
> > 
> > /**
> > - * __unflatten_device_tree - create tree of device_nodes from flat blob
> > + * unflatten_device_tree - create tree of device_nodes from flat blob
> >  *
> >  * unflattens a device-tree, creating the
> >  * tree of struct device_node. It also fills the "name" and "type"
> > @@ -2056,8 +2056,8 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
> >  * @fdt: The fdt to expand
> >  * @mynodes: The device_node tree created by the call
> >  */
> > -static void __init __unflatten_device_tree(const void *fdt,
> > -                                           struct dt_device_node **mynodes)
> > +void unflatten_device_tree(const void *fdt,
> > +                           struct dt_device_node **mynodes)
> > {
> >     unsigned long start, mem, size;
> >     struct dt_device_node **allnextp = mynodes;
> > @@ -2179,7 +2179,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
> > 
> > void __init dt_unflatten_host_device_tree(void)
> > {
> > -    __unflatten_device_tree(device_tree_flattened, &dt_host);
> > +    unflatten_device_tree(device_tree_flattened, &dt_host);
> >     dt_alias_scan();
> > }
> > 
> > diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> > index fd6cd00b43..06d7866c10 100644
> > --- a/xen/include/xen/device_tree.h
> > +++ b/xen/include/xen/device_tree.h
> > @@ -177,6 +177,11 @@ int device_tree_for_each_node(const void *fdt, int node,
> >  */
> > void dt_unflatten_host_device_tree(void);
> > 
> > +/*
> > + * unflatten any device tree.
> > + */
> > +void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
> > +
> > /**
> >  * IRQ translation callback
> >  * TODO: For the moment we assume that we only have ONE
> 
> NIT: there are some minor code style issues, like indentation that could be fixed
> 
> Cheers,
> Luca
> 

