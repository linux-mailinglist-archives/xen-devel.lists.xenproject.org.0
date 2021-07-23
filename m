Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1F3D4162
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 22:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160372.294849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71aV-00033Y-Ug; Fri, 23 Jul 2021 20:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160372.294849; Fri, 23 Jul 2021 20:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71aV-00031i-Rg; Fri, 23 Jul 2021 20:16:03 +0000
Received: by outflank-mailman (input) for mailman id 160372;
 Fri, 23 Jul 2021 20:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvTO=MP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m71aU-00031c-R9
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 20:16:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc830516-ebf2-11eb-94be-12813bfff9fa;
 Fri, 23 Jul 2021 20:16:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 886A560200;
 Fri, 23 Jul 2021 20:16:00 +0000 (UTC)
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
X-Inumbo-ID: cc830516-ebf2-11eb-94be-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627071360;
	bh=hX1ooOzu7GnWK2TXwEbiDWFHIfBpJpVsqrksZ5Ef/F8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qdTP+bmq2GK8W/+hjGCZrf31GjJwAqchMZf6jn4io0ttMdjGY3xqwzceJRuNx1e/A
	 tr3ARedE37LMNqDo0BVoYQJbRb/SmDkokVGGFtclj+F0jq2hCS3zuBSfErhcTfYmRC
	 vJU2yfXhuer4z4K57QluGxYbtdrgV4xH2AhTPrPw422SbppC0uyCwQbUuGl129FQ+F
	 Dt/7oY+LOFMuIAuAURok9X1T9HZkulBxm0J6VLu/HsSMOkRMYwHRke3mbbsqMuIxC/
	 P/F6y0cj687YD8XVmxU7Cv9H8W0dwi+GGokVeXQPVTIUcXJy63wWUeYHNooUgLD8mD
	 3YI/oEnfJL4ug==
Date: Fri, 23 Jul 2021 13:16:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
In-Reply-To: <acd7e7b6-7c2b-24d5-da80-042396aee5e8@xen.org>
Message-ID: <alpine.DEB.2.21.2107231043230.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s> <20210722233642.22515-2-sstabellini@kernel.org> <acd7e7b6-7c2b-24d5-da80-042396aee5e8@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/07/2021 00:36, Stefano Stabellini wrote:
> > If both legacy IOMMU bindings and generic bindings are present,
> > iommu_add_dt_device can be called twice. Do not return error in that
> > case, that way there is no need to check for -EEXIST at the call sites.
> > Remove the one existing -EEXIT check, now unneeded.
> 
> The commit message implies that we already support both legacy and generic
> bindings. However, this is not yet implemented.
> 
> So how about:
> 
> "
> iommu_add_dt_device() will returns -EEXIST if the device was already
> registered.
> 
> At the moment, this can only happen if the device was already assigned to a
> domain (either dom0 at boot or via XEN_DOMCTL_assign_device).
> 
> In a follow-up patch, we will convert the SMMU driver to use the FW spec. When
> the legacy bindings are used, all the devices will be registered at probe.
> Therefore, iommu_add_dt_device() will always returns -EEXIST.
> 
> Currently, one caller (XEN_DOMCTL_assign_device) will check the return and
> ignore -EEXIST. All the other will fail because it was technically a
> programming error.
> 
> However, there is no harm to call iommu_add_dt_device() twice, so we can
> simply return 0.
> 
> With that in place the caller doesn't need to check -EEXIST anymore, so remove
> the check.
> "

This is a lot better, thank you!


> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > Changes in v5:
> > - new patch
> > ---
> >   xen/drivers/passthrough/device_tree.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/drivers/passthrough/device_tree.c
> > b/xen/drivers/passthrough/device_tree.c
> > index 999b831d90..32526ecabb 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
> >       if ( !ops )
> >           return -EINVAL;
> >   +    /*
> > +     * Some Device Trees may expose both legacy SMMU and generic
> > +     * IOMMU bindings together. If both are present, the device
> > +     * can be already added.
> 
> Wouldn't this also happen when there is just generic bindings? If so,
> shouldn't this patch be first in the series to avoid breaking bisection?

No, both need to be present; if there is just the generic bindings we
don't need this change. I can still move it to the beginning of the
series anyway if you prefer. 


> > +     */
> 
> My point on the previous version is this is not the only reasons why
> dev_iommu_fwspec_get(). So either we want to write all the reasons (AFAICT,
> there is only two) or we want to write a generic message.

I see. Maybe:

  * In some circumstances iommu_add_dt_device() can genuinly be called
  * twice. As there is no harm in it just return success early.


> >       if ( dev_iommu_fwspec_get(dev) )
> > -        return -EEXIST;
> > +        return 0;
> >         /*
> >        * According to the Documentation/devicetree/bindings/iommu/iommu.txt
> > @@ -254,7 +259,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct
> > domain *d,
> >            * already added to the IOMMU (positive result). Such happens
> > after
> >            * re-creating guest domain.
> >            */
> 
> This comment on top is now stale.

I missed it somehow; yes definitely it should be removed. I can do it in
the next version of this patch.


> > -        if ( ret < 0 && ret != -EEXIST )
> > +        if ( ret < 0 )
> >           {
> >               printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
> >                      dt_node_full_name(dev));

