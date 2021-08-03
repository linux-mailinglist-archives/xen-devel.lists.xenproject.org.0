Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EEE3DE379
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 02:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163196.299001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAi8X-0007tC-Nr; Tue, 03 Aug 2021 00:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163196.299001; Tue, 03 Aug 2021 00:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAi8X-0007qW-KM; Tue, 03 Aug 2021 00:18:25 +0000
Received: by outflank-mailman (input) for mailman id 163196;
 Tue, 03 Aug 2021 00:18:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mAi8V-0007qQ-MC
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 00:18:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fa5255a-f3f0-11eb-9a7d-12813bfff9fa;
 Tue, 03 Aug 2021 00:18:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 386686023E;
 Tue,  3 Aug 2021 00:18:21 +0000 (UTC)
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
X-Inumbo-ID: 4fa5255a-f3f0-11eb-9a7d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627949901;
	bh=BY3wL+1bVshmk/ns2Uv3wP3qYZ0vBq5Kz+8TEOVYR1w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CrHWlPZsQizUjiodAIMEI9bi3ABljC+Z8kqKn5XHcHK8LOXU1nuhALJUxQteorB0A
	 reBUQqRSYXjbeL9UAvttc/fplPfQg/P1txOgn88XnhUWo0SF3FHxwAhQ7FNUzH8JvZ
	 G/01NN6Kh2YZfrSwT/cKgGKnRTGAbjOzkZl12XHFDCOG6MFic16aLCDwktwwlMKk/F
	 PZbww68M+m7tDwvFPqZZGWJX8e2qVA88vrBYJ3h2PmOZA3oKEb8e7li2W+jFy5RbT2
	 OWHYAPugFJa0tiSybK4EFIXGpVI2ZcOxhSjKKlEglFbPJUDuqYjuUvtiKLzKXyYJuf
	 SYPCoZOadjCpw==
Date: Mon, 2 Aug 2021 17:18:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
In-Reply-To: <427e6a82-7480-2cb6-9e83-f848f9caa218@xen.org>
Message-ID: <alpine.DEB.2.21.2108021718100.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s> <20210722233642.22515-2-sstabellini@kernel.org> <acd7e7b6-7c2b-24d5-da80-042396aee5e8@xen.org> <alpine.DEB.2.21.2107231043230.10122@sstabellini-ThinkPad-T480s>
 <aa7be3ad-8cbe-a187-3ebc-e1c5d2d11091@xen.org> <alpine.DEB.2.21.2107301444100.10122@sstabellini-ThinkPad-T480s> <427e6a82-7480-2cb6-9e83-f848f9caa218@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Aug 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 30/07/2021 22:57, Stefano Stabellini wrote:
> > On Mon, 26 Jul 2021, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 23/07/2021 21:16, Stefano Stabellini wrote:
> > > > On Fri, 23 Jul 2021, Julien Grall wrote:
> > > > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > > > ---
> > > > > > Changes in v5:
> > > > > > - new patch
> > > > > > ---
> > > > > >     xen/drivers/passthrough/device_tree.c | 9 +++++++--
> > > > > >     1 file changed, 7 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/xen/drivers/passthrough/device_tree.c
> > > > > > b/xen/drivers/passthrough/device_tree.c
> > > > > > index 999b831d90..32526ecabb 100644
> > > > > > --- a/xen/drivers/passthrough/device_tree.c
> > > > > > +++ b/xen/drivers/passthrough/device_tree.c
> > > > > > @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node
> > > > > > *np)
> > > > > >         if ( !ops )
> > > > > >             return -EINVAL;
> > > > > >     +    /*
> > > > > > +     * Some Device Trees may expose both legacy SMMU and generic
> > > > > > +     * IOMMU bindings together. If both are present, the device
> > > > > > +     * can be already added.
> > > > > 
> > > > > Wouldn't this also happen when there is just generic bindings? If so,
> > > > > shouldn't this patch be first in the series to avoid breaking
> > > > > bisection?
> > > > 
> > > > No, both need to be present; if there is just the generic bindings we
> > > > don't need this change. I can still move it to the beginning of the
> > > > series anyway if you prefer.
> > > 
> > > Sorry but I am having some trouble to understand why this is not a problem
> > > for
> > > just the legacy binding.
> > > 
> > > If I look at patch #1, the dev->iommu_fspec will be allocated in
> > > register_smmu_master(). If I am not mistaken, this is called when the SMMU
> > > is
> > > initialized.
> > > 
> > > So the call to iommu_add_dt_device() in handle_device() should return
> > > -EEXIST
> > > (dev_iommu_fwspec_get() will return a non-NULL pointer).
> > > 
> > > What did I miss?
> > 
> > I checked. It is true that we need this check with the legacy bindings,
> > even when alone.
> > 
> > Like you said, dev->iommu_fspec is allocated early by
> > register_smmu_master. Then, handle_device, or handle_passthrough_prop
> > for dom0less guests, calls iommu_add_dt_device a second time.
> > 
> > On the other hand with only the generic bindings register_smmu_master
> > doesn't call iommu_add_dt_device, so iommu_add_dt_device is called only
> > once by handle_device or handle_passthrough_prop. >
> > 
> > The comment I proposed is not correct. What about this one?
> > 
> >      /*
> >       * In case of legacy SMMU bindings, register_smmu_master might have
> >       * already initialized struct iommu_fwspec for this device.
> >       */
> As I may have mentionned in a previous version of the series, this check is
> not specific to the SMMU. We also need it for other cases (e.g. when the
> device is (re-)assigned to a guest).
> 
> So I think a specialized comment is unsuitable here. Instead, we should
> provide a generic comment. Something like:
> 
> /*
>  * The device may already have been registered. As there is no harm in
>  * it just return success early.
>  */

Thanks, I'll use it in the next version

