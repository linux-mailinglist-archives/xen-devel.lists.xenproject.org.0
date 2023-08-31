Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD578E407
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 02:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593279.926248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbVfD-0002rc-DM; Thu, 31 Aug 2023 00:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593279.926248; Thu, 31 Aug 2023 00:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbVfD-0002oa-9a; Thu, 31 Aug 2023 00:35:59 +0000
Received: by outflank-mailman (input) for mailman id 593279;
 Thu, 31 Aug 2023 00:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFXE=EQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qbVfB-0002oU-7O
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 00:35:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5758a2d3-4796-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 02:35:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 610176255B;
 Thu, 31 Aug 2023 00:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8B7C433C7;
 Thu, 31 Aug 2023 00:35:50 +0000 (UTC)
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
X-Inumbo-ID: 5758a2d3-4796-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693442151;
	bh=bllm2LouzggmKEkGmGSO7zPjul+HAPjEdYC1RAPUEsA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M3T/oqNWpc17QGqOGkFhYKiEizCf4ye56jKPMOq34R6nWQT00m4AwsQymxV1CvBoU
	 C19PTVBc5lUFT5JdYkhVbNlDoYQo2+uCXUg7LLqGG9IgjFwZ3PF1yFkZNM68OgOogA
	 LjF2BZ8lgXnib4nBGHDB3htw5Q+f6S+z2Gk4Ak/6qzjwkdxAStv8AFg4BgApKt8ULc
	 kgiuzfFsQVk7uuewzsKR0VlMQQkwVAKzK94joP7ONehGXuyam7Ib8ru6TatDHGhrl2
	 vLR7gyXJ1COwTnQDLWhgRHGZA7AH4SgKczdSvQeJ5tdTHua7BSfG+a69rCcDuqX9mv
	 NoznZ5kJL4NUA==
Date: Wed, 30 Aug 2023 17:35:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, julien@xen.org, Jan Beulich <jbeulich@suse.com>, 
    Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN][PATCH v10 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
In-Reply-To: <ZO-A7ZERxISru9Ug@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308301730210.6458@ubuntu-linux-20-04-desktop>
References: <20230825080222.14247-1-vikram.garhwal@amd.com> <20230825080222.14247-12-vikram.garhwal@amd.com> <079c831a-bf1e-5489-562b-01cf4e3e6b02@amd.com> <ZO-A7ZERxISru9Ug@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Aug 2023, Vikram Garhwal wrote:
> Hi Michal,
> On Tue, Aug 29, 2023 at 10:23:30AM +0200, Michal Orzel wrote:
> > 
> > 
> > On 25/08/2023 10:02, Vikram Garhwal wrote:
> > > Remove master device from the IOMMU. This will be helpful when removing the
> > > overlay nodes using dynamic programming during run time.
> > > 
> > > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > 
> > You don't seem to handle Julien remarks for this patch made in v9.
> > I will forward them here to avoid answering to old version, but for the future, do not carry the exact same patch
> > if you haven't yet addressed someone's remarks.
> This got skipped as I cannot find direct email from Julien. The only email reply
> on this patch is can find is from: xen-devel-bounces@lists.xenproject.org and
> this got messed up with other larger set of email xen-devel sends.
> 
> Did you get direct email?
> > 
> > > 
> > > ---
> > > Changes from v7:
> > >     Add check if IOMMU is enabled.
> > >     Fix indentation of fail.
> > > ---
> > > ---
> > >  xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
> > >  xen/include/xen/iommu.h               |  1 +
> > >  2 files changed, 45 insertions(+)
> > > 
> > > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > > index 1202eac625..3fad65fb69 100644
> > > --- a/xen/drivers/passthrough/device_tree.c
> > > +++ b/xen/drivers/passthrough/device_tree.c
> > > @@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
> > >      return 0;
> > >  }
> > >  
> > > +int iommu_remove_dt_device(struct dt_device_node *np)
> > > +{
> > > +    const struct iommu_ops *ops = iommu_get_ops();
> > > +    struct device *dev = dt_to_dev(np);
> > > +    int rc;
> > > +
> > > +    if ( !iommu_enabled )
> > > +        return 1;
> > J:
> > The caller doesn't seem to check if the error code is > 0. So can we 
> > instead return a -ERRNO?
> Will change the check in caller. I want to keep this as it as so it looks
> similar to iommu_add_dt_device().

That is OK to me as long as the check on the return value is done


> > If you want to continue to return a value > 0 then I think it should be 
> > documented in a comment like we did for iommu_add_dt_device().
> >
> Will add comment before iommu_remove_dt_device().
> > > +
> > > +    if ( !ops )
> > > +        return -EOPNOTSUPP;
> > > +
> > > +    spin_lock(&dtdevs_lock);
> > > +
> > > +    if ( iommu_dt_device_is_assigned_locked(np) )
> > > +    {
> > > +        rc = -EBUSY;
> > > +        goto fail;
> > > +    }
> > > +
> > > +    /*
> > > +     * The driver which supports generic IOMMU DT bindings must have this
> > > +     * callback implemented.
> > > +     */
> > J:
> > I have questioned this message in v7 and I still question it. I guess 
> > you copied the comment on top of add_device(), this was add there 
> > because we have a different way to add legacy device.
> > 
> > But here there are no such requirement. In fact, you are not adding the 
> > the callback to all the IOMMU drivers... Yet all of them support the 
> > generic IOMMU DT bindings.
> Will change this.
> > 
> > > +    if ( !ops->remove_device )
> > > +    {
> > > +        rc = -EOPNOTSUPP;
> > > +        goto fail;
> > > +    }
> > > +
> > > +    /*
> > > +     * Remove master device from the IOMMU if latter is present and available.
> > J:
> > I read this as this will not return an error if the device is protected. 
> > However, AFAICT, the implement in the SMMU driver provided in this 
> > series will return an error. So I would suggest to replace this sentence 
> > with:
> > 
> > de-register the device from the IOMMU driver.
> Will change the comment.
> > 
> > > +     * The driver is responsible for removing is_protected flag.
> > J:
> > Can you add an assert in the 'if ( !rc )' block to confirm that 
> > is_protected was effectively removed. Something like:
> > 
> > ASSERT(!dt_device_is_protected(dev));
> Is ASSERT really required here. remove callback can return before setting is_protected as false.

But if ops->remove_device didn't actually set is_protected to false,
then it should return an error (rc != 0). What Julien is suggesting is
the following:

    rc = ops->remove_device(0, dev);

    if ( !rc )
    {
        ASSERT(!dt_device_is_protected(dev));
        iommu_fwspec_free(dev);
    }

Every time remove_device returns rc == 0 then is_protected should be
false, right?


> > 
> > This would help to confirm the driver is respecting what you expect.
> > 
> > > +     */
> > > +    rc = ops->remove_device(0, dev);
> > > +
> > > +    if ( !rc )
> > > +        iommu_fwspec_free(dev);
> > > +
> > > + fail:
> > > +    spin_unlock(&dtdevs_lock);
> > > +    return rc;
> > > +}
> > > +
> > >  int iommu_add_dt_device(struct dt_device_node *np)
> > >  {
> > >      const struct iommu_ops *ops = iommu_get_ops();
> > > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > > index 110693c59f..a8e9bc9a2d 100644
> > > --- a/xen/include/xen/iommu.h
> > > +++ b/xen/include/xen/iommu.h
> > > @@ -233,6 +233,7 @@ int iommu_add_dt_device(struct dt_device_node *np);
> > >  
> > >  int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> > >                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
> > > +int iommu_remove_dt_device(struct dt_device_node *np);
> > >  
> > >  #endif /* HAS_DEVICE_TREE */
> > >  
> > 
> > ~Michal
> 

