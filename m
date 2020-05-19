Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A31DA5CB
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:49:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbByU-0000LW-J3; Tue, 19 May 2020 23:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2w/r=7B=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbByS-0000LO-Vq
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:48:41 +0000
X-Inumbo-ID: 43e532de-9a2b-11ea-ae69-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43e532de-9a2b-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 23:48:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E3E220674;
 Tue, 19 May 2020 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589932119;
 bh=hx4rmMhuqqP1pu0djhl9/fSl/R6fQ24MUbPbLgsY9LA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=djCUAKaVo/WbJYUGCQ5k34+gsaO40u5NWCm0QD4cgYVzDIeh4VKID8fzB9xYBvaig
 VTslOiFWJ+e7tE2OGDjmXLkNp0uU9VmzZLYYZjB+3ZT5muEs59w25ciz1QF++8MI1F
 pZMmmbvGd8f4rCK2yLx6v+S4eFbujGJsyeCWGrDo=
Date: Tue, 19 May 2020 16:48:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi
 4
In-Reply-To: <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2005191645400.27502@sstabellini-ThinkPad-T480s>
References: <20200518113008.15422-1-julien@xen.org>
 <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
 <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
 <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 minyard@acm.org, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 roman@zededa.com, George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 19 May 2020, Tamas K Lengyel wrote:
> On Tue, May 19, 2020 at 11:23 AM Julien Grall <julien@xen.org> wrote:
> >
> >
> >
> > On 19/05/2020 04:08, Tamas K Lengyel wrote:
> > > On Mon, May 18, 2020 at 5:32 AM Julien Grall <julien@xen.org> wrote:
> > >>
> > >> From: Julien Grall <jgrall@amazon.com>
> > >>
> > >> Hi all,
> > >>
> > >> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
> > >> only use the first GB of memory.
> > >>
> > >> This is because several devices cannot DMA above 1GB but Xen doesn't
> > >> necessarily allocate memory for Dom0 below 1GB.
> > >>
> > >> This small series is trying to address the problem by allowing a
> > >> platform to restrict where Dom0 banks are allocated.
> > >>
> > >> This is also a candidate for Xen 4.14. Without it, a user will not be
> > >> able to use all the RAM on the Raspberry Pi 4.
> > >>
> > >> This series has only be slighlty tested. I would appreciate more test on
> > >> the Rasbperry Pi 4 to confirm this removing the restriction.
> > >
> > > Hi Julien,
> >
> > Hi,
> >
> > > could you post a git branch somewhere? I can try this on my rpi4 that
> > > already runs 4.13.
> >
> > I have pushed a branch based on unstable and the v2 of the series:
> >
> > git://xenbits.xen.org/people/julieng/xen-unstable.git
> >
> > branch arm-dma/v2
> >
> 
> I've updated my image I built with
> https://github.com/tklengyel/xen-rpi4-builder a while ago and I've
> defined 2048m as total_mem and Xen seems to be booting fine and passes
> execution to dom0. With 512m being set as the Xen cmdline for dom0_mem
> it was working. When I increased the mem for dom0 the boot is now
> stuck at:
> 
> [    1.427788] of_cfs_init
> [    1.429667] of_cfs_init: OK
> [    1.432561] clk: Not disabling unused clocks
> [    1.437239] Waiting for root device /dev/mmcblk0p2...
> [    1.451599] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
> [    1.458156] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.464729] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.472804] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
> [    1.479370] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.546902] random: fast init done
> [    1.564590] mmc1: new high speed SDIO card at address 0001
> 
> Could this be because the DTB I compiled from a fresh checkout of
> https://github.com/raspberrypi/linux.git branch rpi-4.19.y whereas the
> kernel itself is from a checkout ~5 months ago? I guess that must be
> the cause because even if I decrease the dom0_mem to 512m it still
> gets stuck at the same spot whereas it was booting fine before.

Just so that you are aware, there is a known issue with setting dom0_mem
greater than 512M. I have a WIP patch to fix it in Linux that I plan to
send to the list soon.

