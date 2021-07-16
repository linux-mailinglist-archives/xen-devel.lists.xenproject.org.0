Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767C3CBFE1
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jul 2021 01:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157756.290588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Xf7-0003st-4P; Fri, 16 Jul 2021 23:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157756.290588; Fri, 16 Jul 2021 23:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Xf7-0003qZ-1I; Fri, 16 Jul 2021 23:54:33 +0000
Received: by outflank-mailman (input) for mailman id 157756;
 Fri, 16 Jul 2021 23:54:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kgq4=MI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m4Xf4-0003pz-W7
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 23:54:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 513d4f7f-8184-4cbd-a1e5-98399ff7873a;
 Fri, 16 Jul 2021 23:54:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27037611BE;
 Fri, 16 Jul 2021 23:54:29 +0000 (UTC)
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
X-Inumbo-ID: 513d4f7f-8184-4cbd-a1e5-98399ff7873a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626479669;
	bh=ZlF8lEcQuuVd8GbKTDE4p5+l9XEBMFtBkjFOjMli7nM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QupsdcVuu4JXn7g0gPNknP9x7V3Lo0x10Bq9V0HQb388JcaRDApLk8tassGvSZGVi
	 kL5Dku0qBhiUzwmmNnc4n+DzcAaSfpJjAyNcdBHaJpxm/UnkPCREMrkxWHWfCa1dEd
	 Gl0A5QsccQWKocjIbREdc/7muOGGXr2lx7irCWoghgHqHiE/so0M91KIHwxWi//Od9
	 Pr/ioaJ2Fe558BwXXJA70HGyDHk4xWnW5MAklZOpnm6F1J8GKU3BBcTbEksRiDA3oC
	 ksZu4624/PnlhLFy4SyPL/XrLVb3cZ/x0fK7aUdbHBYjOj2uEKwXIfBd1kfqiCljx8
	 +mJ+WUEviEbBQ==
Date: Fri, 16 Jul 2021 16:54:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH RESEND v3 3/3] arm,smmu: add support for generic DT
 bindings. Implement add_device and dt_xlate.
In-Reply-To: <a9802e45-9405-5b19-3d21-9c4b56374f23@xen.org>
Message-ID: <alpine.DEB.2.21.2107161627120.3916@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s> <20210413175905.15123-3-sstabellini@kernel.org> <a9802e45-9405-5b19-3d21-9c4b56374f23@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Apr 2021, Julien Grall wrote:
> On 13/04/2021 18:59, Stefano Stabellini wrote:
> > From: Brian Woods <brian.woods@xilinx.com>
> > 
> > Now that all arm iommu drivers support generic bindings we can remove
> > the workaround from iommu_add_dt_device().
> 
> Well, it was just added in a different place in patch #1. ;) I have commented
> about it in patch #1.

That is a different workaround. This is removing the one introduced by
cf4af9d6d6c (xen/arm: boot with device trees with "mmu-masters" and
"iommus").

I'll add a note to the commit message.

> 
> > Note that if both legacy bindings and generic bindings are present in
> > device tree, the legacy bindings are the ones that are used
> Can you oultine what guarantee that? Also what happen if some of devices are
> using the generic bindings while other are using the legacy one?

If both legacy bindings and generic bindings are present in device tree,
the legacy bindings are the ones that are used because mmu-masters is
parsed by xen/drivers/passthrough/arm/smmu.c:arm_smmu_device_dt_probe
which is called by arm_smmu_dt_init. It happens very early. iommus is
parsed by xen/drivers/passthrough/device_tree.c:iommu_add_dt_device
which is called by xen/arch/arm/domain_build.c:handle_device and happens
afterwards.

I'll add a note to the commit message.


> > 
> > Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> > ---
> >   xen/drivers/passthrough/arm/smmu.c    | 42 ++++++++++++++++++++++++++-
> >   xen/drivers/passthrough/device_tree.c | 17 +----------
> >   2 files changed, 42 insertions(+), 17 deletions(-)
> > 
> > diff --git a/xen/drivers/passthrough/arm/smmu.c
> > b/xen/drivers/passthrough/arm/smmu.c
> > index f949c110ad..b564851a56 100644
> > --- a/xen/drivers/passthrough/arm/smmu.c
> > +++ b/xen/drivers/passthrough/arm/smmu.c
> > @@ -254,6 +254,8 @@ struct iommu_group
> >   	atomic_t ref;
> >   };
> >   +static struct arm_smmu_device *find_smmu(const struct device *dev);
> > +
> >   static struct iommu_group *iommu_group_alloc(void)
> >   {
> >   	struct iommu_group *group = xzalloc(struct iommu_group);
> > @@ -442,6 +444,8 @@ static struct iommu_group *iommu_group_get(struct device
> > *dev)
> >   #define SMR_VALID			(1U << 31)
> >   #define SMR_MASK_SHIFT			16
> >   #define SMR_ID_SHIFT			0
> > +#define SMR_ID_MASK			0x7fff
> > +#define SMR_MASK_MASK			0x7fff
> >     #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
> >   #define S2CR_CBNDX_SHIFT		0
> > @@ -872,6 +876,40 @@ static int register_smmu_master(struct arm_smmu_device
> > *smmu,
> >   					     fwspec);
> >   }
> >   +static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
> > +{
> > +	struct arm_smmu_device *smmu;
> > +	struct iommu_fwspec *fwspec;
> > +
> > +	fwspec = dev_iommu_fwspec_get(dev);
> > +	if (fwspec == NULL)
> > +		return -ENXIO;
> > +
> > +	smmu = find_smmu(fwspec->iommu_dev);
> > +	if (smmu == NULL)
> > +		return -ENXIO;
> > +
> > +	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
> 
> Patch #2 seems to imply the code was reworked to have distinct path between
> legacy and generic. But now, you are calling the legacy code from the generic
> helper. This is pretty confusing, can you explain what's going on?

For the legacy path, arm_smmu_dt_add_device_legacy is called by
register_smmu_master scanning mmu-masters (a fwspec entry is also
created.) For the generic path, arm_smmu_dt_add_device_generic gets
called instead. Then, arm_smmu_dt_add_device_generic calls
arm_smmu_dt_add_device_legacy afterwards, shared with the legacy path.
This way most of the low level implementation is shared between the two
paths although the way they are called is distinct.

I'll add a note to the commit message.


> > +}
> > +
> > +static int arm_smmu_dt_xlate_generic(struct device *dev,
> > +				    const struct dt_phandle_args *spec)
> 
> This seems to be a verbatim copy from Linux. It would be good to mention it in
> the commit message. This would make easier to track any change.

Yes, I'll add a note to the commit message.


> > +{
> > +	uint32_t mask, fwid = 0;
> > +
> > +	if (spec->args_count > 0)
> > +		fwid |= (SMR_ID_MASK & spec->args[0]) << SMR_ID_SHIFT;
> > +
> > +	if (spec->args_count > 1)
> > +		fwid |= (SMR_MASK_MASK & spec->args[1]) << SMR_MASK_SHIFT;
> > +	else if (!of_property_read_u32(spec->np, "stream-match-mask", &mask))
> > +		fwid |= (SMR_MASK_MASK & mask) << SMR_MASK_SHIFT;
> > +
> > +	return iommu_fwspec_add_ids(dev,
> > +				    &fwid,
> > +				    1);
> 
> NIT: This feels a bit odd to read. Can't they be defined on the same line?

Fixed


> > +}
> > +
> >   static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
> >   {
> >   	struct arm_smmu_device *smmu;
> > @@ -2836,6 +2874,7 @@ static void arm_smmu_iommu_domain_teardown(struct
> > domain *d)
> >   static const struct iommu_ops arm_smmu_iommu_ops = {
> >       .init = arm_smmu_iommu_domain_init,
> >       .hwdom_init = arm_smmu_iommu_hwdom_init,
> > +    .add_device = arm_smmu_dt_add_device_generic,
> >       .teardown = arm_smmu_iommu_domain_teardown,
> >       .iotlb_flush = arm_smmu_iotlb_flush,
> >       .iotlb_flush_all = arm_smmu_iotlb_flush_all,
> > @@ -2843,9 +2882,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
> >       .reassign_device = arm_smmu_reassign_dev,
> >       .map_page = arm_iommu_map_page,
> >       .unmap_page = arm_iommu_unmap_page,
> > +    .dt_xlate = arm_smmu_dt_xlate_generic,
> >   };
> >   -static __init const struct arm_smmu_device *find_smmu(const struct device
> > *dev)
> > +static struct arm_smmu_device *find_smmu(const struct device *dev)
> >   {
> >   	struct arm_smmu_device *smmu;
> >   	bool found = false;
> > diff --git a/xen/drivers/passthrough/device_tree.c
> > b/xen/drivers/passthrough/device_tree.c
> > index a51ae3c9c3..ae07f272e1 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -162,22 +162,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
> >            * these callback implemented.
> >            */
> >           if ( !ops->add_device || !ops->dt_xlate )
> > -        {
> > -            /*
> > -             * Some Device Trees may expose both legacy SMMU and generic
> > -             * IOMMU bindings together. However, the SMMU driver is only
> > -             * supporting the former and will protect them during the
> > -             * initialization. So we need to skip them and not return
> > -             * error here.
> > -             *
> > -             * XXX: This can be dropped when the SMMU is able to deal
> > -             * with generic bindings.
> > -             */
> > -            if ( dt_device_is_protected(np) )
> > -                return 0;
> > -            else
> > -                return -EINVAL;
> > -        }
> > +            return -EINVAL;
> >             if ( !dt_device_is_available(iommu_spec.np) )
> >               break;


