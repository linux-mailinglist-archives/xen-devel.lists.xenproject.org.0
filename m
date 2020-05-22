Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF81DDF97
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 07:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc0i1-0001v4-LK; Fri, 22 May 2020 05:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXeb=7E=notk.org=asmadeus@srs-us1.protection.inumbo.net>)
 id 1jc0i0-0001uz-Tf
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 05:59:04 +0000
X-Inumbo-ID: 5689fc36-9bf1-11ea-ae69-bc764e2007e4
Received: from nautica.notk.org (unknown [2001:41d0:1:7a93::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5689fc36-9bf1-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 05:59:03 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 8C85FC009; Fri, 22 May 2020 07:59:02 +0200 (CEST)
Date: Fri, 22 May 2020 07:58:47 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] 9p/xen: increase XEN_9PFS_RING_ORDER
Message-ID: <20200522055847.GA2833@nautica>
References: <20200521193242.15953-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200521193242.15953-1-sstabellini@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: jgross@suse.com, lucho@ionkov.net, ericvh@gmail.com,
 linux-kernel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Stefano Stabellini wrote on Thu, May 21, 2020:
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
> Finally, modify p9_xen_trans.maxsize to be divided by 4 compared to the
> original value. We need to divide it by 2 because we have two rings
> coming off the same order allocation: the in and out rings. This was a
> mistake in the original code. Also divide it further by 2 because we
> don't want a single request/reply to fill up the entire ring. There can
> be multiple requests/replies outstanding at any given time and if we use
> the full ring with one, we risk forcing the backend to wait for the
> client to read back more replies before continuing, which is not
> performant.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

LGTM, I'll try to find some time to test this by the end of next week or
will trust you if I can't make it -- ping me around June 1st if I don't
reply again until then...

Cheers,
-- 
Dominique

