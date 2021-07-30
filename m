Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6963DC0A2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 23:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162695.298274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9aVe-0005o6-JH; Fri, 30 Jul 2021 21:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162695.298274; Fri, 30 Jul 2021 21:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9aVe-0005ls-F1; Fri, 30 Jul 2021 21:57:38 +0000
Received: by outflank-mailman (input) for mailman id 162695;
 Fri, 30 Jul 2021 21:57:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WNqw=MW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m9aVc-0005lm-UL
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 21:57:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38a2ca86-71ec-4c52-aa20-07191ec017d8;
 Fri, 30 Jul 2021 21:57:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D23266024A;
 Fri, 30 Jul 2021 21:57:34 +0000 (UTC)
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
X-Inumbo-ID: 38a2ca86-71ec-4c52-aa20-07191ec017d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627682255;
	bh=L2xyPq87TdCgrci+htpYYA1yS572R1bCkaCegW7mmwY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TjdNYO6iE93SRe5ikXahJoN6eNvx0z7kgUIMkag9GOo8c1q9y0pWP4Vsn69tk0meg
	 tq3OwGhOynVnmFAh5NAewfWRs09KeVs51QoAzQ/mfyQSVwiCh9bBoK0qkauEt3QMQQ
	 MTlYonpZZonl4oDFxUzEt8usYGu36jdAn516WzqByJKCd+6KN4hb3b3nzhr78IVAWp
	 ZA6sxCOilglCACmGQI95NvqXbS38QqiOG0eO9Lfkiyd9xIfY0o712dyY6f78yNqPoS
	 Qq/pUMjLO10iVyFvp+Dd2kpf85yVEbNGQzRYFV95TTYOPN6pLA76J8rvbWlotkJ4Gr
	 WSrEKwG/05EcQ==
Date: Fri, 30 Jul 2021 14:57:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
In-Reply-To: <aa7be3ad-8cbe-a187-3ebc-e1c5d2d11091@xen.org>
Message-ID: <alpine.DEB.2.21.2107301444100.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s> <20210722233642.22515-2-sstabellini@kernel.org> <acd7e7b6-7c2b-24d5-da80-042396aee5e8@xen.org> <alpine.DEB.2.21.2107231043230.10122@sstabellini-ThinkPad-T480s>
 <aa7be3ad-8cbe-a187-3ebc-e1c5d2d11091@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/07/2021 21:16, Stefano Stabellini wrote:
> > On Fri, 23 Jul 2021, Julien Grall wrote:
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > ---
> > > > Changes in v5:
> > > > - new patch
> > > > ---
> > > >    xen/drivers/passthrough/device_tree.c | 9 +++++++--
> > > >    1 file changed, 7 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/xen/drivers/passthrough/device_tree.c
> > > > b/xen/drivers/passthrough/device_tree.c
> > > > index 999b831d90..32526ecabb 100644
> > > > --- a/xen/drivers/passthrough/device_tree.c
> > > > +++ b/xen/drivers/passthrough/device_tree.c
> > > > @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
> > > >        if ( !ops )
> > > >            return -EINVAL;
> > > >    +    /*
> > > > +     * Some Device Trees may expose both legacy SMMU and generic
> > > > +     * IOMMU bindings together. If both are present, the device
> > > > +     * can be already added.
> > > 
> > > Wouldn't this also happen when there is just generic bindings? If so,
> > > shouldn't this patch be first in the series to avoid breaking bisection?
> > 
> > No, both need to be present; if there is just the generic bindings we
> > don't need this change. I can still move it to the beginning of the
> > series anyway if you prefer.
> 
> Sorry but I am having some trouble to understand why this is not a problem for
> just the legacy binding.
> 
> If I look at patch #1, the dev->iommu_fspec will be allocated in
> register_smmu_master(). If I am not mistaken, this is called when the SMMU is
> initialized.
> 
> So the call to iommu_add_dt_device() in handle_device() should return -EEXIST
> (dev_iommu_fwspec_get() will return a non-NULL pointer).
> 
> What did I miss?

I checked. It is true that we need this check with the legacy bindings,
even when alone.

Like you said, dev->iommu_fspec is allocated early by
register_smmu_master. Then, handle_device, or handle_passthrough_prop
for dom0less guests, calls iommu_add_dt_device a second time.

On the other hand with only the generic bindings register_smmu_master
doesn't call iommu_add_dt_device, so iommu_add_dt_device is called only
once by handle_device or handle_passthrough_prop.


The comment I proposed is not correct. What about this one?

    /*
     * In case of legacy SMMU bindings, register_smmu_master might have
     * already initialized struct iommu_fwspec for this device.
     */

