Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DBD2AA214
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 02:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21236.47542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbDJe-0005ut-8c; Sat, 07 Nov 2020 01:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21236.47542; Sat, 07 Nov 2020 01:46:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbDJe-0005ub-4b; Sat, 07 Nov 2020 01:46:54 +0000
Received: by outflank-mailman (input) for mailman id 21236;
 Sat, 07 Nov 2020 01:46:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kbDJc-0005uW-JG
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 01:46:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9584305-562f-4080-903a-dca4f5546d69;
 Sat, 07 Nov 2020 01:46:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B2F32078B;
 Sat,  7 Nov 2020 01:46:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yBR3=EN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kbDJc-0005uW-JG
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 01:46:52 +0000
X-Inumbo-ID: b9584305-562f-4080-903a-dca4f5546d69
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b9584305-562f-4080-903a-dca4f5546d69;
	Sat, 07 Nov 2020 01:46:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9B2F32078B;
	Sat,  7 Nov 2020 01:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604713611;
	bh=XpQerVOIJQI3cZ9WFTK1QdqEleg6Fb7R8S+b6FbnleQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S9A4oiJGlXfR3eWOe/h8pTXhjB/tAajXZxViRQz8PcqePJLfs6TO4PYPuOjniA61O
	 sRTianwcS9cWtBDjKgvu6582HWO3/nyEUqRouCOYGxOiSZfgWwYFdWP/K9saxePGqt
	 Zh/j3khmT2mS5SLx7xWKUUzAlv9lhbqgbA2G/tjM=
Date: Fri, 6 Nov 2020 17:46:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
cc: Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, takahiro.akashi@linaro.org, 
    alex.bennee@linaro.org, masami.hiramatsu@linaro.org, 
    ian.jackson@eu.citrix.com
Subject: Re: [PATCH] libxl: set vuart_gfn in libxl__build_hvm
In-Reply-To: <20201106161724.5hot2tzamqhhycck@liuwe-devbox-debian-v2>
Message-ID: <alpine.DEB.2.21.2011061746340.21307@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011051312120.2323@sstabellini-ThinkPad-T480s> <20201106151146.GM2214@perard.uk.xensource.com> <20201106161724.5hot2tzamqhhycck@liuwe-devbox-debian-v2>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Nov 2020, Wei Liu wrote:
> On Fri, Nov 06, 2020 at 03:11:46PM +0000, Anthony PERARD wrote:
> > On Thu, Nov 05, 2020 at 01:15:05PM -0800, Stefano Stabellini wrote:
> > > libxl: set vuart_gfn in libxl__build_hvm
> > 
> > The subject is written two times ;-)
> > 
> > > Setting vuart_gfn was missed when switching ARM guests to the PVH build.
> > > Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
> > > dom->vuart_gfn.
> > > 
> > > Without this change, xl console cannot connect to the vuart console (-t
> > > vuart), see https://marc.info/?l=xen-devel&m=160402342101366.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > 
> > > diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
> > > index f8661e90d4..36fe8915e7 100644
> > > --- a/tools/libxl/libxl_dom.c
> > > +++ b/tools/libxl/libxl_dom.c
> > > @@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
> > >          LOG(ERROR, "hvm build set params failed");
> > >          goto out;
> > >      }
> > > +    state->vuart_gfn = dom->vuart_gfn;
> > >  
> > >      rc = hvm_build_set_xs_values(gc, domid, dom, info);
> > >      if (rc != 0) {
> > 
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> This patch is based on an old tree. I have ported it to staging. Please
> check the code and shout if it is not done correctly.

all good, thanks!

