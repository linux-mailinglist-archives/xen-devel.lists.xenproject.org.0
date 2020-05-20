Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5F1DC64D
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 06:36:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbcvR-0002YL-Ok; Thu, 21 May 2020 04:35:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/tWO=7C=notk.org=asmadeus@srs-us1.protection.inumbo.net>)
 id 1jbUWX-0003bV-FF
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 19:37:05 +0000
X-Inumbo-ID: 47fa91e2-9ad1-11ea-aa85-12813bfff9fa
Received: from nautica.notk.org (unknown [91.121.71.147])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47fa91e2-9ad1-11ea-aa85-12813bfff9fa;
 Wed, 20 May 2020 19:37:04 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id C6D98C009; Wed, 20 May 2020 21:37:02 +0200 (CEST)
Date: Wed, 20 May 2020 21:36:47 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [V9fs-developer] [PATCH] 9p/xen: increase XEN_9PFS_RING_ORDER
Message-ID: <20200520193647.GA17565@nautica>
References: <20200520184113.24727-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200520184113.24727-1-sstabellini@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 21 May 2020 04:35:20 +0000
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
Cc: jgross@suse.com, lucho@ionkov.net, xen-devel@lists.xenproject.org,
 ericvh@gmail.com, linux-kernel@vger.kernel.org, rminnich@sandia.gov,
 v9fs-developer@lists.sourceforge.net, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Stefano Stabellini wrote on Wed, May 20, 2020:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Increase XEN_9PFS_RING_ORDER to 9 for performance reason. Order 9 is the
> max allowed by the protocol.
> 
> We can't assume that all backends will support order 9. The xenstore
> property max-ring-page-order specifies the max order supported by the
> backend. We'll use max-ring-page-order for the size of the ring.
> 
> This means that the size of the ring is not static
> (XEN_FLEX_RING_SIZE(9)) anymore. Change XEN_9PFS_RING_SIZE to take an
> argument and base the calculation on the order chosen at setup time.
> 
> 
> Finally, modify p9_xen_trans.maxsize to be divided by 4 compared to the
> original value. We need to divide it by 2 because we have two rings
> coming off the same order allocation: the in and out rings. This was a
> mistake in the original code. Also divide it further by 2 because we
> don't want a single request/reply to fill up the entire ring. There can
> be multiple requests/replies outstanding at any given time and if we use
> the full ring with one, we risk forcing the backend to wait for the
> client to read back more replies before continuing, which is not
> performant.

Sounds good to me overall. A couple of comments inline.
Also worth noting I need to rebuild myself a test setup so might take a
bit of time to actually run tests, but I might just trust you on this
one for now if it builds with no new warning... Looks like it would
probably work :p

> [...]
> @@ -264,7 +265,7 @@ static irqreturn_t xen_9pfs_front_event_handler(int irq, void *r)
>  
>  static struct p9_trans_module p9_xen_trans = {
>  	.name = "xen",
> -	.maxsize = 1 << (XEN_9PFS_RING_ORDER + XEN_PAGE_SHIFT),
> +	.maxsize = 1 << (XEN_9PFS_RING_ORDER + XEN_PAGE_SHIFT - 2),
>  	.def = 1,
>  	.create = p9_xen_create,
>  	.close = p9_xen_close,
> [...]
> @@ -401,8 +405,10 @@ static int xen_9pfs_front_probe(struct xenbus_device *dev,
>  		return -EINVAL;
>  	max_ring_order = xenbus_read_unsigned(dev->otherend,
>  					      "max-ring-page-order", 0);
> -	if (max_ring_order < XEN_9PFS_RING_ORDER)
> -		return -EINVAL;
> +	if (max_ring_order > XEN_9PFS_RING_ORDER)
> +		max_ring_order = XEN_9PFS_RING_ORDER;

(If there are backends with very small max_ring_orders, we no longer
error out when we encounter one, it might make sense to add a min
define? Although to be honest 9p works with pretty small maxsizes so I
don't see much reason to error out, and even order 0 will be one page
worth.. I hope there is no xenbus that small though :))

> +	if (p9_xen_trans.maxsize > XEN_FLEX_RING_SIZE(max_ring_order))
> +		p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order);

So base maxsize initial value is 1 << (order + page_shift - 2) ; but
this is 1 << (order + page_shift - 1) -- I agree with the logic you gave
in commit message so would think this needs to be shifted down one more
like the base value as well.
What do you think?

-- 
Dominique

