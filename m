Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27562B9F3D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 01:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31488.61893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfuGj-00008Q-IM; Fri, 20 Nov 2020 00:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31488.61893; Fri, 20 Nov 2020 00:27:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfuGj-000080-EY; Fri, 20 Nov 2020 00:27:17 +0000
Received: by outflank-mailman (input) for mailman id 31488;
 Fri, 20 Nov 2020 00:27:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfuGi-00007v-8G
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 00:27:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83b038f4-0cb1-4dfc-a735-01efe496ab29;
 Fri, 20 Nov 2020 00:27:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3F8422242;
 Fri, 20 Nov 2020 00:27:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfuGi-00007v-8G
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 00:27:16 +0000
X-Inumbo-ID: 83b038f4-0cb1-4dfc-a735-01efe496ab29
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 83b038f4-0cb1-4dfc-a735-01efe496ab29;
	Fri, 20 Nov 2020 00:27:14 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A3F8422242;
	Fri, 20 Nov 2020 00:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605832033;
	bh=ymS3RouGEHQH32BozXjMWnkiw4MP9yjGz+uxF9BSF50=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qLDEMC+r1OICRjXrbQLRMf+IuZnvhxRuAIMrvBWHGwPUVxjkjqaWaECRzYsDx+Xq9
	 ng/LNhp9kCpS5IUTfA7afHjwSH+bg0C7mAea4S++29dTFlVjVAM/q7pYcA1zRmtPcS
	 d7M/uRNmESvPPlVzkSycZX430Y0v9CzBAxM3T7Ts=
Date: Thu, 19 Nov 2020 16:27:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "open list:X86" <xen-devel@lists.xenproject.org>, 
    "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4 1/3] xen/arm: gic: acpi: Guard helpers to build the
 MADT with CONFIG_ACPI
In-Reply-To: <4F6A86BB-EA0B-4F7A-A1D9-5C5C469FB220@arm.com>
Message-ID: <alpine.DEB.2.21.2011191627030.7979@sstabellini-ThinkPad-T480s>
References: <20201119170829.9923-1-julien@xen.org> <20201119170829.9923-2-julien@xen.org> <4F6A86BB-EA0B-4F7A-A1D9-5C5C469FB220@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2020, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 19 Nov 2020, at 17:08, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > gic_make_hwdom_madt() and gic_get_hwdom_madt_size() are ACPI specific.
> > 
> > While they build fine today, this will change in a follow-up patch.
> > Rather than trying to fix the build on ACPI, it is best to avoid
> > compiling the helpers and the associated callbacks when CONFIG_ACPI=n.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I also tested the serie on FVP without ACPI and Xen is still booting properly Dom0.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >    Changes in v4:
> >        - Patch added
> > ---
> > xen/arch/arm/gic-v2.c     |  8 +++-----
> > xen/arch/arm/gic-v3.c     | 11 ++---------
> > xen/arch/arm/gic.c        |  2 ++
> > xen/include/asm-arm/gic.h | 10 ++++++++--
> > 4 files changed, 15 insertions(+), 16 deletions(-)
> > 
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index 0f747538dbcd..581ea5ba6b2c 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -1114,12 +1114,12 @@ static int gicv2_iomem_deny_access(const struct domain *d)
> >     return iomem_deny_access(d, mfn, mfn + nr);
> > }
> > 
> > +#ifdef CONFIG_ACPI
> > static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
> > {
> >     return 0;
> > }
> > 
> > -#ifdef CONFIG_ACPI
> > static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
> > {
> >     struct acpi_subtable_header *header;
> > @@ -1248,10 +1248,6 @@ static void __init gicv2_acpi_init(void)
> > }
> > #else
> > static void __init gicv2_acpi_init(void) { }
> > -static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
> > -{
> > -    return 0;
> > -}
> > #endif
> > 
> > static int __init gicv2_init(void)
> > @@ -1357,8 +1353,10 @@ const static struct gic_hw_operations gicv2_ops = {
> >     .read_apr            = gicv2_read_apr,
> >     .read_pending_state  = gicv2_read_pending_state,
> >     .make_hwdom_dt_node  = gicv2_make_hwdom_dt_node,
> > +#ifdef CONFIG_ACPI
> >     .make_hwdom_madt     = gicv2_make_hwdom_madt,
> >     .get_hwdom_extra_madt_size = gicv2_get_hwdom_extra_madt_size,
> > +#endif
> >     .map_hwdom_extra_mappings = gicv2_map_hwdown_extra_mappings,
> >     .iomem_deny_access   = gicv2_iomem_deny_access,
> >     .do_LPI              = gicv2_do_LPI,
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index 0f6cbf6224e9..2a344393a0e4 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -1735,15 +1735,6 @@ static void __init gicv3_acpi_init(void)
> > }
> > #else
> > static void __init gicv3_acpi_init(void) { }
> > -static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
> > -{
> > -    return 0;
> > -}
> > -
> > -static unsigned long gicv3_get_hwdom_extra_madt_size(const struct domain *d)
> > -{
> > -    return 0;
> > -}
> > #endif
> > 
> > static bool gic_dist_supports_lpis(void)
> > @@ -1858,8 +1849,10 @@ static const struct gic_hw_operations gicv3_ops = {
> >     .read_pending_state  = gicv3_read_pending_state,
> >     .secondary_init      = gicv3_secondary_cpu_init,
> >     .make_hwdom_dt_node  = gicv3_make_hwdom_dt_node,
> > +#ifdef CONFIG_ACPI
> >     .make_hwdom_madt     = gicv3_make_hwdom_madt,
> >     .get_hwdom_extra_madt_size = gicv3_get_hwdom_extra_madt_size,
> > +#endif
> >     .iomem_deny_access   = gicv3_iomem_deny_access,
> >     .do_LPI              = gicv3_do_LPI,
> > };
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index d623c57cb9fa..fe60619e99cf 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -443,6 +443,7 @@ int gic_make_hwdom_dt_node(const struct domain *d,
> >     return gic_hw_ops->make_hwdom_dt_node(d, gic, fdt);
> > }
> > 
> > +#ifdef CONFIG_ACPI
> > int gic_make_hwdom_madt(const struct domain *d, u32 offset)
> > {
> >     return gic_hw_ops->make_hwdom_madt(d, offset);
> > @@ -459,6 +460,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
> > 
> >     return madt_size;
> > }
> > +#endif
> > 
> > int gic_iomem_deny_access(const struct domain *d)
> > {
> > diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
> > index ba870523bb2a..ad0f7452d005 100644
> > --- a/xen/include/asm-arm/gic.h
> > +++ b/xen/include/asm-arm/gic.h
> > @@ -378,12 +378,14 @@ struct gic_hw_operations {
> >     /* Create GIC node for the hardware domain */
> >     int (*make_hwdom_dt_node)(const struct domain *d,
> >                               const struct dt_device_node *gic, void *fdt);
> > +#ifdef CONFIG_ACPI
> >     /* Create MADT table for the hardware domain */
> >     int (*make_hwdom_madt)(const struct domain *d, u32 offset);
> > -    /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware domain. */
> > -    int (*map_hwdom_extra_mappings)(struct domain *d);
> >     /* Query the size of hardware domain madt table */
> >     unsigned long (*get_hwdom_extra_madt_size)(const struct domain *d);
> > +#endif
> > +    /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware domain. */
> > +    int (*map_hwdom_extra_mappings)(struct domain *d);
> >     /* Deny access to GIC regions */
> >     int (*iomem_deny_access)(const struct domain *d);
> >     /* Handle LPIs, which require special handling */
> > @@ -435,8 +437,12 @@ void register_gic_ops(const struct gic_hw_operations *ops);
> > int gic_make_hwdom_dt_node(const struct domain *d,
> >                            const struct dt_device_node *gic,
> >                            void *fdt);
> > +
> > +#ifdef CONFIG_ACPI
> > int gic_make_hwdom_madt(const struct domain *d, u32 offset);
> > unsigned long gic_get_hwdom_madt_size(const struct domain *d);
> > +#endif
> > +
> > int gic_map_hwdom_extra_mappings(struct domain *d);
> > int gic_iomem_deny_access(const struct domain *d);
> > 
> > -- 
> > 2.17.1
> > 
> 
> 

