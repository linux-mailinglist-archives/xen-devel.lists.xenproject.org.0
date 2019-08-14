Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2550C8DDE4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 21:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxyu7-0004fU-2B; Wed, 14 Aug 2019 19:25:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hxyu5-0004fP-A8
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 19:25:49 +0000
X-Inumbo-ID: 51cba038-bec9-11e9-8b96-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51cba038-bec9-11e9-8b96-12813bfff9fa;
 Wed, 14 Aug 2019 19:25:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BBB9206C1;
 Wed, 14 Aug 2019 19:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565810747;
 bh=JtDXh928KMfedG9nf5hYRxtCu2Z7d3t5DegVUMgXrbo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZFYlyxSiXJ/9zO0Qk7qnrtwYD1RlMh+NsrRl2PzZUG8VWCLAt5lqQxaj2b+i5qvsZ
 7AhEYESeMGbJuigbrjhMRfScNXZumFadiDs8JuicI6zwwZYYdRxHi7M44COeCGVp6H
 DT7ucqet7wgfdlpfB6w6YJ62cXyzSFiKguh7I5+g=
Date: Wed, 14 Aug 2019 12:25:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <74e0b656-a6a1-d0c6-3cb2-e32d552d42c8@arm.com>
Message-ID: <alpine.DEB.2.21.1908141208300.8737@sstabellini-ThinkPad-T480s>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-3-git-send-email-olekstysh@gmail.com>
 <3c6d54f2-06ad-6bd1-447b-0e4cbef3d391@arm.com>
 <8626bea6-cec3-128a-3b7a-b4c1542a659a@gmail.com>
 <7101e744-784b-9b89-3a90-e748ff03a02d@arm.com>
 <6119cff5-b39a-3782-18d9-f6e51c57ac37@gmail.com>
 <74e0b656-a6a1-d0c6-3cb2-e32d552d42c8@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1009891569-1565810747=:8737"
Subject: Re: [Xen-devel] [PATCH V2 2/6] iommu/arm: Add ability to handle
 deferred probing request
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1009891569-1565810747=:8737
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 14 Aug 2019, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 13/08/2019 13:35, Oleksandr wrote:
> > 
> > On 12.08.19 22:46, Julien Grall wrote:
> > > Hi Oleksandr,
> > 
> > Hi, Julien
> > 
> > 
> > > 
> > > On 8/12/19 1:01 PM, Oleksandr wrote:
> > > > On 12.08.19 14:11, Julien Grall wrote:
> > > > > On 02/08/2019 17:39, Oleksandr Tyshchenko wrote:
> > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > > 
> > > > > > This patch adds minimal required support to General IOMMU framework
> > > > > > to be able to handle a case when IOMMU driver requesting deferred
> > > > > > probing for a device.
> > > > > > 
> > > > > > In order not to pull Linux's error code (-EPROBE_DEFER) to Xen
> > > > > > we have chosen -EAGAIN to be used for indicating that device
> > > > > > probing is deferred.
> > > > > > 
> > > > > > This is needed for the upcoming IPMMU driver which may request
> > > > > > deferred probing depending on what device will be probed the first
> > > > > > (there is some dependency between these devices, Root device must be
> > > > > > registered before Cache devices. If not the case, driver will deny
> > > > > > further Cache device probes until Root device is registered).
> > > > > > As we can't guarantee a fixed pre-defined order for the device nodes
> > > > > > in DT, we need to be ready for the situation where devices being
> > > > > > probed in "any" order.
> > > > > > 
> > > > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > > ---
> > > > > >   xen/common/device_tree.c            |  1 +
> > > > > >   xen/drivers/passthrough/arm/iommu.c | 35
> > > > > > ++++++++++++++++++++++++++++++++++-
> > > > > >   xen/include/asm-arm/device.h        |  6 +++++-
> > > > > >   xen/include/xen/device_tree.h       |  1 +
> > > > > >   4 files changed, 41 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > > > > > index e107c6f..6f37448 100644
> > > > > > --- a/xen/common/device_tree.c
> > > > > > +++ b/xen/common/device_tree.c
> > > > > > @@ -1774,6 +1774,7 @@ static unsigned long __init
> > > > > > unflatten_dt_node(const void *fdt,
> > > > > >           /* By default the device is not protected */
> > > > > >           np->is_protected = false;
> > > > > >           INIT_LIST_HEAD(&np->domain_list);
> > > > > > +        INIT_LIST_HEAD(&np->deferred_probe);
> > > > > 
> > > > > I am not entirely happy to add a new list_head field per node just for
> > > > > the benefits of boot code. Could we re-use domain_list (with a comment
> > > > > in the code and appropriate ASSERT)?
> > > > 
> > > > Agree that only boot code uses deferred_probe field. I will consider
> > > > re-using domain_list. Could you please clarify regarding ASSERT (where
> > > > to put and what to check).
> > > 
> > > What I meant is adding an ASSERT to check that np->domain_list is at empty
> > > at least before trying to add in the list. This would help to debug any
> > > potential issue if we end up to use domain_list earlier in the future. I
> > > can't see why it would as iommu is called earlier, but who knows :).
> > 
> > Got it. Thank you for clarification.
> > 
> > 
> > > > > > +
> > > > > >   static const struct iommu_ops *iommu_ops;
> > > > > >     const struct iommu_ops *iommu_get_ops(void)
> > > > > > @@ -42,7 +48,7 @@ void __init iommu_set_ops(const struct iommu_ops
> > > > > > *ops)
> > > > > >     int __init iommu_hardware_setup(void)
> > > > > >   {
> > > > > > -    struct dt_device_node *np;
> > > > > > +    struct dt_device_node *np, *tmp;
> > > > > >       int rc;
> > > > > >       unsigned int num_iommus = 0;
> > > > > >   @@ -51,6 +57,33 @@ int __init iommu_hardware_setup(void)
> > > > > >           rc = device_init(np, DEVICE_IOMMU, NULL);
> > > > > >           if ( !rc )
> > > > > >               num_iommus++;
> > > > > > +        else if (rc == -EAGAIN)
> > > > > > +            /*
> > > > > > +             * Driver requested deferred probing, so add this
> > > > > > device to
> > > > > > +             * the deferred list for further processing.
> > > > > > +             */
> > > > > > +            list_add(&np->deferred_probe, &deferred_probe_list);
> > > > > > +    }
> > > > > > +
> > > > > > +    /*
> > > > > > +     * Process devices in the deferred list if at least one
> > > > > > successfully
> > > > > > +     * probed device is present.
> > > > > > +     */
> > > > > 
> > > > > I think this can turn into an infinite loop if all device in
> > > > > deferred_probe_list still return -EDEFER_PROBE and num_iommus is a
> > > > > non-zero.
> > > > 
> > > > Agree.
> > > > 
> > > > 
> > > > > 
> > > > > A better condition would be to check that at least one IOMMU is added
> > > > > at each loop. If not, then we should bail with an error because it
> > > > > likely means something is buggy.
> > > > 
> > > > Sounds reasonable. Will do.
> > > > 
> > > > 
> > > > Just to clarify:
> > > > 
> > > >  >>> A better condition would be to check that at least one IOMMU is
> > > > added at each loop.
> > > > 
> > > > Maybe, not only added (rc == 0), but driver didn't request deferred
> > > > probe (rc != -EAGAIN).
> > > 
> > > I think adding an IOMMU is enough. If you return an error other than
> > > -EAGAIN here after deferring probing, then you are likely going to fail at
> > > the next loop. So better to stop early.
> > 
> > It makes sense.
> > 
> > 
> > > 
> > > 
> > > I realize this not what the current code is doing (I know I wrote it ;)).
> > > But I am not sure it is sane to continue if only part of the IOMMUs are
> > > initialized. Most likely you will see an error much later that may be not
> > > trivial to find out.
> > > 
> > > Imagine you want to passthrough you network card to a guest but the IOMMU
> > > initialization failed...
> > 
> > Oh, agree.
> > 
> > As I understand, the new strict logic would be the following:
> > 
> > If initialization for at least one IOMMU device failed (device_init returns
> > an error other than -EAGAIN), we should stop and return an error to upper
> > layer (even if num_iommus > 0). No matter whether it is during the first
> > attempt or after deferring probe. We don't allow the "I/O virtualisation" to
> > be enabled (iommu_enabled == true) with only part of the IOMMU devices being
> > initialized. Is my understanding correct?
> 
> Let me summarize the discussion we had on IRC :). Without your patch, Xen may
> initialize only half the IOMMUs. If the device is behind an IOMMU that wasn't
> initialized, then we have two possibility:
>    1) The device was already mark as protected (if using the old binding in
> the SMMU). Xen will not be able to assign the device to Dom0 and therefore Xen
> will crash (not able to build dom0). For domU, it will depend whether the
> configuration contain the options 'dtdev'. If the option is specified, then
> guest will fail to build. On the contrary if the option isn't specified then
> the guest will boot and this could either lead to transaction failure (if the
> IOMMU was already reset) or bypassing the IOMMU. Note that the latter can
> today happen if your IOMMU was disabled. But we can't do much against it.
>    2) The device is not marked as protected. Xen will not be able to "assign"
> the device to Dom0 and this could either lead to the device bypassing the
> IOMMU or a transaction failure. For domU, the problem is similar to 1).
> 
> In the case of the SMMU driver, we only support old bindings. So devices are
> marked as protected during SMMU initialization. This is done before the SMMU
> is reset. Before reset the SMMU will bypassed.
> 
> So the risk is to have an half secure system and may be unnoticed until later.
> I realize this is the current behavior, so not very ideal.
> 
> It feels to me if the user requested to use IOMMU then if we should panic if
> any of the available IOMMU are not initialized correctly. This will save a lot
> of debug afterwards.
> 
> @Stefano, any opinions?

I agree that we should enable all IOMMUs or none. I don't think we want
to deal with partially initialized IOMMUs systems.

Failure to enable all IOMMUs should lead to returning an error from the
relevant function (arch_iommu_populate_page_table?) which should
translate into Xen failing to boot and crashing. Which I think it is
what you are suggesting, right?

(I wouldn't call panic() inside the IOMMU specific initializer, because
there might be iommu= command line options for Xen that specify a
different desired outcome. I would deal with this case the same way we
would deal with an error during initialization of a single IOMMU.)
--8323329-1009891569-1565810747=:8737
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1009891569-1565810747=:8737--

