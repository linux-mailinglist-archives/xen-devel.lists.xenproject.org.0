Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A027932EA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595946.929641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgW0-0002d7-UV; Wed, 06 Sep 2023 00:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595946.929641; Wed, 06 Sep 2023 00:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgW0-0002bO-Rf; Wed, 06 Sep 2023 00:35:28 +0000
Received: by outflank-mailman (input) for mailman id 595946;
 Wed, 06 Sep 2023 00:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgVz-0002bI-Kf
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:35:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4440181f-4c4d-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 02:35:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBC1F60EB2;
 Wed,  6 Sep 2023 00:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04966C433C8;
 Wed,  6 Sep 2023 00:35:20 +0000 (UTC)
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
X-Inumbo-ID: 4440181f-4c4d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693960522;
	bh=n0mdlCk5d5mJrNIcJq8q6zBCzeM0MuXkx8QhLEshiXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jcZZGaWwZxeZnZ8d9k2w0h3m5wKv7uM1D5RF300C/7hIRqJaRa4Zd7io8u2Ulj/KN
	 MCBhWQXoPh7pc1C8f9bCMyte6l7apDCoYxn/9bieuI+3R1cuEuO34rFKwjIdr91+8d
	 B7YbtL5fohCQ2nl2pxqZU6uh8kMwLRrSToaVL2YEEvmnTc+mbtnW943GolzID4nL19
	 f0oau8l+BS32jl67ewV3fcKyGvTUP1kn6LfZt8skLL67q25iUAnu4e9QBAHXGkz6OL
	 g7y9Y2GvtPdgY0NlDPlYmGN3RsGnYta5CCbGDAmGtBBwe3wz5ZSPQ1fnaIzVIVDGAV
	 LeFbZSUW5Ea9w==
Date: Tue, 5 Sep 2023 17:35:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org, 
    julien@xen.org, sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN][PATCH v11 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
In-Reply-To: <0578e1fc-4999-b375-6805-5c980dad41c4@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051734560.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-12-vikram.garhwal@amd.com> <0578e1fc-4999-b375-6805-5c980dad41c4@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Sep 2023, Michal Orzel wrote:
> On 01/09/2023 06:59, Vikram Garhwal wrote:
> > Remove master device from the IOMMU. This will be helpful when removing the
> > overlay nodes using dynamic programming during run time.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v10:
> >     Add comment regarding return values of iommu_remove_dt_device().
> >     Add ASSERT to check if is_protected is removed or not.
> > Changes from v7:
> >     Add check if IOMMU is enabled.
> >     Fix indentation of fail.
> > ---
> > ---
> >  xen/drivers/passthrough/device_tree.c | 43 +++++++++++++++++++++++++++
> >  xen/include/xen/iommu.h               | 10 +++++++
> >  2 files changed, 53 insertions(+)
> > 
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 687c61e7da..80f6efc606 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -127,6 +127,49 @@ int iommu_release_dt_devices(struct domain *d)
> >      return 0;
> >  }
> >  
> > +int iommu_remove_dt_device(struct dt_device_node *np)
> > +{
> > +    const struct iommu_ops *ops = iommu_get_ops();
> > +    struct device *dev = dt_to_dev(np);
> > +    int rc;
> > +
> > +    if ( !iommu_enabled )
> > +        return 1;
> > +
> > +    if ( !ops )
> > +        return -EOPNOTSUPP;
> > +
> > +    spin_lock(&dtdevs_lock);
> > +
> > +    if ( iommu_dt_device_is_assigned_locked(np) )
> > +    {
> > +        rc = -EBUSY;
> > +        goto fail;
> > +    }
> > +
> > +    if ( !ops->remove_device )
> > +    {
> > +        rc = -EOPNOTSUPP;
> > +        goto fail;
> > +    }
> > +
> > +    /*
> > +     * De-register the device from the IOMMU driver.
> > +     * The driver is responsible for removing is_protected flag.
> > +     */
> > +    rc = ops->remove_device(0, dev);
> > +
> > +    if ( !rc )
> > +    {
> > +        ASSERT(!dt_device_is_protected(np));
> > +        iommu_fwspec_free(dev);
> > +    }
> > +
> > + fail:
> > +    spin_unlock(&dtdevs_lock);
> > +    return rc;
> > +}
> > +
> >  int iommu_add_dt_device(struct dt_device_node *np)
> >  {
> >      const struct iommu_ops *ops = iommu_get_ops();
> > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > index a18b68e247..84bd77395e 100644
> > --- a/xen/include/xen/iommu.h
> > +++ b/xen/include/xen/iommu.h
> > @@ -235,6 +235,16 @@ int iommu_add_dt_device(struct dt_device_node *np);
> >  int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
> >  
> > +/*
> > + * Helper to remove master device from the IOMMU.
> > + *
> > + * Return values:
> > + *  0 : device is de-registerd from IOMMU.
> s/registerd/registered/
> 
> > + * <0 : error while removing the device from IOMMU.
> > + * >0 : IOMMU is not enabled/present or device is not connected to it.
> The first part refers to "iommu_enabled" but I cannot see how you check for the second part
> (and return >0).

Yes I would remove "or device is not connected to it". It can be done on
commit.


> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

