Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473A847343A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 19:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246275.424726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwqGp-0005LR-Jl; Mon, 13 Dec 2021 18:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246275.424726; Mon, 13 Dec 2021 18:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwqGp-0005Io-Gq; Mon, 13 Dec 2021 18:41:55 +0000
Received: by outflank-mailman (input) for mailman id 246275;
 Mon, 13 Dec 2021 18:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6XJ=Q6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mwqGo-0005Hw-Bg
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 18:41:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 563677cc-5c44-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 19:41:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08EAB6111F;
 Mon, 13 Dec 2021 18:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6E0C34600;
 Mon, 13 Dec 2021 18:41:50 +0000 (UTC)
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
X-Inumbo-ID: 563677cc-5c44-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639420910;
	bh=Sw7xlmG2qmtNlGOEIXu3rGHLUFCTwmkaMYWrFj13BQ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D2VwhDpctDjFEDwd/RWvL7dnbEMoJp73jOoWcrmU+JqjFvWJ4cfkE0Ye6aDRQ4w5P
	 76Q1m+8lZeL81eXHQJBrGJf4Ig/eh/lYJMNQ8LOIhcFW6CpxrUXtxPCfp16BII45bT
	 75wi/WUrH9KOLRZyFLixRt4mceUmlVquWbWK7YYAyV6oM8yqoojjQj8HPFgjefd3il
	 a9wFyfv9ox2tYXy+aS45AYnsr+a1roOzWWWPJDTEcadYqZiRMwgqPO7yPBDHKjOgy0
	 IGUViF9NL9t6RF47P6XU1QAzZQleU/QWR65CYEfffrVT9Ltd4k492DrfYuKQdzgj8c
	 zaOb0+QIqZiLQ==
Date: Mon, 13 Dec 2021 10:41:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
In-Reply-To: <078a2f3d-c188-0a28-6265-dceef41cd6f3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2112131040580.3376@ubuntu-linux-20-04-desktop>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com> <0b68ff3a-3c82-f800-4d20-17eded13163a@suse.com> <612735b2-8af6-782d-35cf-526841109170@epam.com> <078a2f3d-c188-0a28-6265-dceef41cd6f3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Dec 2021, Jan Beulich wrote:
> On 10.12.2021 15:10, Oleksandr Andrushchenko wrote:
> > On 10.12.21 11:40, Jan Beulich wrote:
> >> --- a/xen/arch/arm/mm.c
> >> +++ b/xen/arch/arm/mm.c
> >> @@ -1479,7 +1479,7 @@ int xenmem_add_to_physmap_one(
> >>           break;
> >>       }
> >>       case XENMAPSPACE_dev_mmio:
> >> -        rc = map_dev_mmio_region(d, gfn, 1, _mfn(idx));
> >> +        rc = map_dev_mmio_region(d, gfn, _mfn(idx));
> > Technically this is ok, but reads odd now: the function maps a single
> > page, but its name has "region" in it (which might also be ok, e.g.
> > for a region of a single page).
> > 
> > I think it is worth either implementing full mfn range check inside
> > map_dev_mmio_region or renaming it to something else:
> > with mfn check map_dev_mmio_region will indeed be able to map
> > a region consisting of multiple pages and perform required validation.
> 
> Well, I had no maintainer comments on v1 regarding the name. I'd be
> happy to rename to e.g. map_dev_mmio_page(), so long as there can be
> an agreed upon name before I submit a possible v3. Julien, Stefano?

I like map_dev_mmio_page

