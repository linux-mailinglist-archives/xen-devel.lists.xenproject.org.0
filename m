Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864841DC344
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:56:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYZR-0001SJ-Gg; Wed, 20 May 2020 23:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbYZQ-0001SE-Nl
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:56:20 +0000
X-Inumbo-ID: 8070b7da-9af5-11ea-b07b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8070b7da-9af5-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 23:56:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7773220708;
 Wed, 20 May 2020 23:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590018979;
 bh=b+7RuEJNy8D/QcJ0wriRra2UVUAspE2s+m1lbqHAsB0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=l2UoEQEzsRADKyvFaNG6S8GjntlJDaSWSTSicqkJe5Jzsc4y5ZqffdC9pc/WobvTJ
 XDhda7d9E/z8h6aUD/kiErxVMDFOwyqPxeOOewgJg/JGosWUhzo7V6kpi1O13U8R84
 6SGCtDLy2ymm24kRznYs+6GNzvx50a6okZAfHW6Q=
Date: Wed, 20 May 2020 16:56:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: [PATCH 00/10] fix swiotlb-xen for RPi4
In-Reply-To: <CAMmSBy9VBxjSCRcfyiZ-RY8eyYOooeNfCqrvirhWzfpSbAQyuw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2005201653310.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <CAMmSBy9VBxjSCRcfyiZ-RY8eyYOooeNfCqrvirhWzfpSbAQyuw@mail.gmail.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 tamas@tklengyel.com, Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 20 May 2020, Roman Shaposhnik wrote:
> On Wed, May 20, 2020 at 4:45 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > Hi all,
> >
> > This series is a collection of fixes to get Linux running on the RPi4 as
> > dom0.
> >
> > Conceptually there are only two significant changes:
> >
> > - make sure not to call virt_to_page on vmalloc virt addresses (patch
> >   #1)
> > - use phys_to_dma and dma_to_phys to translate phys to/from dma
> >   addresses (all other patches)
> >
> > In particular in regards to the second part, the RPi4 is the first
> > board where Xen can run that has the property that dma addresses are
> > different from physical addresses, and swiotlb-xen was written with the
> > assumption that phys addr == dma addr.
> >
> > This series adds the phys_to_dma and dma_to_phys calls to make it work.
> 
> Great to see this! Stefano, any chance you can put it in a branch some place
> so I can test the final version?

Here it is, but keep in mind that it is based on Linux master (because
it is meant to go upstream):

  git://git.kernel.org/pub/scm/linux/kernel/git/sstabellini/xen.git fix-rip4-v1

