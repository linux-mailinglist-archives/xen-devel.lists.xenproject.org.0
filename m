Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04B31EB0AF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 23:06:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfrdc-0001Ur-UV; Mon, 01 Jun 2020 21:06:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T30I=7O=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jfrdb-0001Um-1a
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 21:06:27 +0000
X-Inumbo-ID: c1495186-a44b-11ea-ab5b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1495186-a44b-11ea-ab5b-12813bfff9fa;
 Mon, 01 Jun 2020 21:06:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 563D32073B;
 Mon,  1 Jun 2020 21:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591045585;
 bh=JKKCcPSQ16JBYHZKrRYFmH1gNliKgP1BlndNb+gssBE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=uCJYQiXodj60WSq0CnVF3iKVwa43WprWs1BZN9WRewFczGAqrs7i+Q3E8PaleOJyx
 HCN1p+zAxD9n38xJHpHaRnuIh13HMwwwprOxYhBIBOB2rAeU5sh0m29J2LC39rmfQQ
 CH8NGKE3y5IS9mlEOa72REboICezVZJ3c/cVcrxA=
Date: Mon, 1 Jun 2020 14:06:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [PATCH v2] 9p/xen: increase XEN_9PFS_RING_ORDER
In-Reply-To: <20200522055847.GA2833@nautica>
Message-ID: <alpine.DEB.2.21.2006011406100.12801@sstabellini-ThinkPad-T480s>
References: <20200521193242.15953-1-sstabellini@kernel.org>
 <20200522055847.GA2833@nautica>
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
 Stefano Stabellini <sstabellini@kernel.org>, ericvh@gmail.com,
 linux-kernel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

n Fri, 22 May 2020, Dominique Martinet wrote:
> Stefano Stabellini wrote on Thu, May 21, 2020:
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
> > Finally, modify p9_xen_trans.maxsize to be divided by 4 compared to the
> > original value. We need to divide it by 2 because we have two rings
> > coming off the same order allocation: the in and out rings. This was a
> > mistake in the original code. Also divide it further by 2 because we
> > don't want a single request/reply to fill up the entire ring. There can
> > be multiple requests/replies outstanding at any given time and if we use
> > the full ring with one, we risk forcing the backend to wait for the
> > client to read back more replies before continuing, which is not
> > performant.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> LGTM, I'll try to find some time to test this by the end of next week or
> will trust you if I can't make it -- ping me around June 1st if I don't
> reply again until then...

Ping :-)

