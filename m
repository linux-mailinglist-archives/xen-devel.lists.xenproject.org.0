Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FA317273
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 22:37:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83728.156556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9x9o-0003n7-UV; Wed, 10 Feb 2021 21:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83728.156556; Wed, 10 Feb 2021 21:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9x9o-0003mk-RY; Wed, 10 Feb 2021 21:36:20 +0000
Received: by outflank-mailman (input) for mailman id 83728;
 Wed, 10 Feb 2021 21:36:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9x9o-0003mf-5B
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 21:36:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01642790-1880-4238-bf5d-25bf859f3387;
 Wed, 10 Feb 2021 21:36:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F374A64DD6;
 Wed, 10 Feb 2021 21:36:17 +0000 (UTC)
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
X-Inumbo-ID: 01642790-1880-4238-bf5d-25bf859f3387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612992978;
	bh=8/iQqCFp3uQ57lkielDRJ0nDpWhNDeLQmdENd46C96w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F836RUntz0IBDKngDQbq6aGEQziWb/MAEhkCht/Gs3AfcWs9QpJkpcpu53XnqB76L
	 26FFqUSFoVsm8s6oxtIMezKKdXHeSnYV5S+0VpaGOOzlckdja727xfnz9yYK9sxraD
	 XYawRZLigDxevf/m9gUmB710mGxhIT8kfHLFfSkySNkfjdxjR97Wq+mMKMGjw6MT1v
	 M6rUbgSmP1guhdUywccceiXEVQ5Gas/RR6CBDjZK3i7pwjL2CPpeWTBRwCUmbSuxm+
	 uVDXTzIs/zdj4f9sECXYyjcBVZwsgfnRJCQ03JlBNwTRX+XGCUgOugvP2l5Dm/ha1W
	 l7ilAWpbCkwXg==
Date: Wed, 10 Feb 2021 13:36:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Woodhouse, David" <dwmw@amazon.co.uk>
cc: "julien@xen.org" <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "jgross@suse.com" <jgross@suse.com>, 
    "stable@vger.kernel.org" <stable@vger.kernel.org>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    "Grall, Julien" <jgrall@amazon.co.uk>
Subject: Re: [PATCH] arm/xen: Don't probe xenbus as part of an early
 initcall
In-Reply-To: <7858866d099732baf56e395a627f610968d24a7d.camel@amazon.co.uk>
Message-ID: <alpine.DEB.2.21.2102101335590.7114@sstabellini-ThinkPad-T480s>
References: <20210210170654.5377-1-julien@xen.org> <7858866d099732baf56e395a627f610968d24a7d.camel@amazon.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Feb 2021, Woodhouse, David wrote:
> On Wed, 2021-02-10 at 17:06 +0000, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > After Commit 3499ba8198cad ("xen: Fix event channel callback via
> > INTX/GSI"), xenbus_probe() will be called too early on Arm. This will
> > recent to a guest hang during boot.
> > 
> > If there hang wasn't there, we would have ended up to call
> > xenbus_probe() twice (the second time is in xenbus_probe_initcall()).
> > 
> > We don't need to initialize xenbus_probe() early for Arm guest.
> > Therefore, the call in xen_guest_init() is now removed.
> > 
> > After this change, there is no more external caller for xenbus_probe().
> > So the function is turned to a static one. Interestingly there were two
> > prototypes for it.
> > 
> > Fixes: 3499ba8198cad ("xen: Fix event channel callback via INTX/GSI")
> > Reported-by: Ian Jackson <iwj@xenproject.org>
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Cc: stable@vger.kernel.org

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

