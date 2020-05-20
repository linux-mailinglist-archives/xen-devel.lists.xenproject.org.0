Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEC51DC083
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 22:49:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbVd0-00014U-SM; Wed, 20 May 2020 20:47:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbVcz-00014P-0j
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 20:47:49 +0000
X-Inumbo-ID: 29a4b20e-9adb-11ea-aa8a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29a4b20e-9adb-11ea-aa8a-12813bfff9fa;
 Wed, 20 May 2020 20:47:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4752207D8;
 Wed, 20 May 2020 20:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590007667;
 bh=pFgqAYPdTivuUZr14bc7fno90C0BiU2RfDO4wiHaAio=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tLct13YcQQztlMgsWhfmqelxdPnoUXZr/8o7FXEJqbxcId6ab55//VCBCeRv3xOsE
 IEHdIuSxaCxcYqNmrqzhljKujCvKPuf5zACGA996C9MtZjcsZi/CuYgbC3hhdkW2xv
 wOQc/tokPdONm0NXR+9SOL0nuB9ZnWw3R+azUk4Y=
Date: Wed, 20 May 2020 13:47:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [V9fs-developer] [PATCH] 9p/xen: increase XEN_9PFS_RING_ORDER
In-Reply-To: <20200520193647.GA17565@nautica>
Message-ID: <alpine.DEB.2.21.2005201340310.27502@sstabellini-ThinkPad-T480s>
References: <20200520184113.24727-1-sstabellini@kernel.org>
 <20200520193647.GA17565@nautica>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, lucho@ionkov.net,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 ericvh@gmail.com, linux-kernel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, rminnich@sandia.gov,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 20 May 2020, Dominique Martinet wrote:
> Stefano Stabellini wrote on Wed, May 20, 2020:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Increase XEN_9PFS_RING_ORDER to 9 for performance reason. Order 9 is the
> > max allowed by the protocol.
> > 
> > We can't assume that all backends will support order 9. The xenstore
> > property max-ring-page-order specifies the max order supported by the
> > backend. We'll use max-ring-page-order for the size of the ring.
> > 
> > This means that the size of the ring is not static
> > (XEN_FLEX_RING_SIZE(9)) anymore. Change XEN_9PFS_RING_SIZE to take an
> > argument and base the calculation on the order chosen at setup time.
> > 
> > 
> > Finally, modify p9_xen_trans.maxsize to be divided by 4 compared to the
> > original value. We need to divide it by 2 because we have two rings
> > coming off the same order allocation: the in and out rings. This was a
> > mistake in the original code. Also divide it further by 2 because we
> > don't want a single request/reply to fill up the entire ring. There can
> > be multiple requests/replies outstanding at any given time and if we use
> > the full ring with one, we risk forcing the backend to wait for the
> > client to read back more replies before continuing, which is not
> > performant.
> 
> Sounds good to me overall. A couple of comments inline.
> Also worth noting I need to rebuild myself a test setup so might take a
> bit of time to actually run tests, but I might just trust you on this
> one for now if it builds with no new warning... Looks like it would
> probably work :p
> 
> > [...]
> > @@ -264,7 +265,7 @@ static irqreturn_t xen_9pfs_front_event_handler(int irq, void *r)
> >  
> >  static struct p9_trans_module p9_xen_trans = {
> >  	.name = "xen",
> > -	.maxsize = 1 << (XEN_9PFS_RING_ORDER + XEN_PAGE_SHIFT),
> > +	.maxsize = 1 << (XEN_9PFS_RING_ORDER + XEN_PAGE_SHIFT - 2),
> >  	.def = 1,
> >  	.create = p9_xen_create,
> >  	.close = p9_xen_close,
> > [...]
> > @@ -401,8 +405,10 @@ static int xen_9pfs_front_probe(struct xenbus_device *dev,
> >  		return -EINVAL;
> >  	max_ring_order = xenbus_read_unsigned(dev->otherend,
> >  					      "max-ring-page-order", 0);
> > -	if (max_ring_order < XEN_9PFS_RING_ORDER)
> > -		return -EINVAL;
> > +	if (max_ring_order > XEN_9PFS_RING_ORDER)
> > +		max_ring_order = XEN_9PFS_RING_ORDER;
> 
> (If there are backends with very small max_ring_orders, we no longer
> error out when we encounter one, it might make sense to add a min
> define? Although to be honest 9p works with pretty small maxsizes so I
> don't see much reason to error out, and even order 0 will be one page
> worth.. I hope there is no xenbus that small though :))

Your point is valid but the size calculation (XEN_FLEX_RING_SIZE) should
work correctly even with order 0:

    (1UL << ((0) + XEN_PAGE_SHIFT - 1)) = 1 << (12 - 1) = 2048

So I am thinking that the protocol should still work correctly, although
the performance might be undesirable.

FYI The smallest backend I know of has order 6.


> > +	if (p9_xen_trans.maxsize > XEN_FLEX_RING_SIZE(max_ring_order))
> > +		p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order);
> 
> So base maxsize initial value is 1 << (order + page_shift - 2) ; but
> this is 1 << (order + page_shift - 1) -- I agree with the logic you gave
> in commit message so would think this needs to be shifted down one more
> like the base value as well.
> What do you think?

Yes, you are right, thanks for noticing this! I meant to do that here
too but somehow forgot. This should be:

   p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order) / 2;

