Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CDB4DA991
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 06:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290965.493770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nULzk-0004e0-CO; Wed, 16 Mar 2022 05:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290965.493770; Wed, 16 Mar 2022 05:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nULzk-0004bE-8o; Wed, 16 Mar 2022 05:14:48 +0000
Received: by outflank-mailman (input) for mailman id 290965;
 Tue, 15 Mar 2022 22:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tvka=T2=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1nUFg1-0004Aw-Cw
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 22:30:01 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e83::45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e26543-a4af-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 23:29:58 +0100 (CET)
Received: from DM5PR21CA0006.namprd21.prod.outlook.com (2603:10b6:3:ac::16) by
 SJ0PR02MB8766.namprd02.prod.outlook.com (2603:10b6:a03:3d8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Tue, 15 Mar 2022 22:29:56 +0000
Received: from DM3NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::36) by DM5PR21CA0006.outlook.office365.com
 (2603:10b6:3:ac::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Tue, 15 Mar 2022 22:29:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT058.mail.protection.outlook.com (10.13.5.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 22:29:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 15 Mar 2022 15:29:51 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 15 Mar 2022 15:29:51 -0700
Received: from [172.19.2.115] (port=33390 helo=xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <vikram.garhwal@amd.com>)
 id 1nUFfr-00023D-4F; Tue, 15 Mar 2022 15:29:51 -0700
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
X-Inumbo-ID: 71e26543-a4af-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OauZIzfM02fl4GhLQk/xojHg2dYk/LRd8j0UNhdqbYVCIF9rk6NUGTNZREFXkpeelxrJm0CKzbDVX7gyCIApgmmoJw5rzc4wsusEqjVV+3bd442gxsRPSyC7Ft4YRGrGY3t4tgiQAP5Ibja2t3AxPv1eXpbvWHWugeCOAbYKoLn1Ovc/F/nV18CBTGJdN1eTHWEj2QCK6fDwAx8+8pFy8YnZSjWuReREjBqo46FS47VwjDvShTozejQ6yCSA7kSbIMfZO6lFrD/FLTLxPL/zDiOKQ+AKGLMWlsG88eTs+g7bP/tFQZic2J6d5Ly2jbJuEBwyRTcFbsNG23GWNBPYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUVNUAbPpfhC7PSf79ggsWAwd/dzcuMt9kx31RElC4w=;
 b=h4wSMvtKyxPitdGJrV3NiAwFFqgMQ543WdL2MiCMKM15RG/fwlgU93NsaacoUHALDVc1R01aG7tKVtjt14gngcapfcwDE2EqKl+8pLGijYV6vd5sgkFIruZ3kbbKG90aCAa7XyYEH1C5a409ob6zGTOs6HzNVK5tWjKUj7JzDDXfreAn7/BX0zlTDWYh3Qy+BiuSNo6t/+vJ99pNQU6USTxKxEHaEQrD8fqpYcAGEi/jruX/+DYGL2pgOMM/y2U0lry4+UDjm2Vwqrlc/HoQFrBCknl2KcSPvtFDfU1hpSJXuH/aKn6CTh5Ua62bIDn3eh/kACdHS4HnbT1dtHPqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUVNUAbPpfhC7PSf79ggsWAwd/dzcuMt9kx31RElC4w=;
 b=cccZDWo1duilI5MFJrXhzKdCaFUcOluJ/chqVDukennGwbAA7DT8SNh7dHNqQninAgdXgoDwNciPCwl6I41TNmxzpMJ9cIjxUfmxtQPjYP+3zS9pF3rTjCiQMMkAFBfi3yZaoMwyXe79hjhKaPQSq9/I98FdN/txevS2ttjqPrU=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Date: Tue, 15 Mar 2022 15:29:51 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 01/14] xen/arm/device: Remove __init from
 function type
Message-ID: <20220315222949.GA23054@xilinx.com>
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
X-MS-Office365-Filtering-Correlation-Id: 04a942af-d10f-4e4f-e32b-08da06d354c3
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8766:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB8766D2EBA3B2E75B707E1BD79F109@SJ0PR02MB8766.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F+LIM11GEbQQWt9LuRm8Tpex3MO5muA3s/tbkJGSgvt9hPtQqL/DUXY8Nyp9lUEi50pO9Xoqq3SqCunCj+Mb0LPRr0Xdf6MM9KIy0GsXyKoSQuKRk9sMPWXL8bdJ8ObxNrzJlqJBrtw/r8oYFFI09lCCdOtm09Hic4MNgqLCpICJB/ID3EQgJebzqroKQxORGXYCIVkoQGlDmKs5enik450UXdOJb4CRMUAYqc/J6bQNa3bdaniMX6bF4mWy2KPclG6EAqLnS4jbMTG8pU7WXG7g5u171R8MUSOfAr3KrduiUg806/gLtfBuBYbYm/VYunbA7o6EYLN4/fSE+Xs5HrrBFFZCUUTK4sqHIGFR1jCWoReecaCdBedIK8eAwN+FqC0URytMHVtQ8qb3Rm/YCtcNGfQQmbs5YL+iJlb48XCNNHCVIer0LiSlTN4lryNF1oC6bR2e2J1nhJzXRXAk8hgpP46y9yEPNa1Ll3tH3MlQXvwvwPBHkMM5JWjZHsmpWw7xW4rhKhmB51a7GplWAHIplqirlRGqJ6URLoh6XoWibNJkNk+kchzQ7K6zZautfoVkaS8Ebm7QsdRTSaxHnL5ovuzOqSuguGGGlipwGmsT/CngqtNj5Plfdt3zU55McFi39eiGkU0FzEft0+E2M1Y+VxBaeyh8WaL7k+k1Fxzpsf4KoxF4rpcqTIIUQZ0A
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(5660300002)(35950700001)(2906002)(83380400001)(1076003)(6916009)(40460700003)(54906003)(36756003)(8936002)(86362001)(336012)(316002)(9786002)(30864003)(7696005)(53546011)(47076005)(7636003)(508600001)(33656002)(356005)(26005)(9686003)(44832011)(82310400004)(8676002)(70586007)(70206006)(4326008);DIR:OUT;SFP:1022;
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 22:29:55.5399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a942af-d10f-4e4f-e32b-08da06d354c3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8766

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
Hi Luca,
Thanks for spotting this. Yeah, I messed this while porting the patches from 
internal to upstream Xen.
Will address this in v4!

> 
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

