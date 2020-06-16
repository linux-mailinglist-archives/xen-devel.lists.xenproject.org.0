Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB51FA4F5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 02:15:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkzFA-0003Dr-Ad; Tue, 16 Jun 2020 00:14:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jkzF9-0003Dm-SW
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 00:14:23 +0000
X-Inumbo-ID: 54a4e9a2-af66-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54a4e9a2-af66-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 00:14:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B75320739;
 Tue, 16 Jun 2020 00:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592266462;
 bh=7/yhqzP4Yy86x9ThskDqDIa70wOp4qNlGxxo6hhx8Cc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=aurJiGTEKZy/D/DHIDQGG+4uJqcnWHrVUiGTN/NqdqUdKCVnEtHVCRAmGpVyeWv8X
 Gf27lrtcVanDG1rapSAdcvbEIcLN+x0olEVi12FIb/WIu2kQY1AjEJVTPN6ZHSN3uY
 xbMueF+Hl6kenf5oIXi04wGMni5baaS7DunmtXYE=
Date: Mon, 15 Jun 2020 17:14:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi
 5.4 kernel
In-Reply-To: <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2006151710280.9074@sstabellini-ThinkPad-T480s>
References: <20200610185415.GG7231@minyard.net>
 <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
 <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Roman Shaposhnik <roman@zededa.com>, tamas@tklengyel.com,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 15 Jun 2020, Christopher Clark wrote:
> On Wed, Jun 10, 2020 at 7:21 PM Roman Shaposhnik <roman@zededa.com> wrote:
> >
> > On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> > >
> > > I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> > > existing sd cards, and this was working fine.  I finally got to a full
> > > yocto build of the system, and it didn't boot.
> > >
> > > In fact, Xen didn't print anything at all, and nothing happens that
> > > might suggest it's booting without any console output.
> 
> I've reproduced this. Linux 4.19 from the Raspberry Pi kernel branch
> works fine, whereas I see no console output from the kernel once Xen
> tries to hand off to dom0 with either a 5.4 or 5.6 kernel.
> 
> > > I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> > > else the same, the 4.19 version of that overlay works, and the 5.4
> > > version does not work.  It also didn't work if I completely removed the
> > > overlay.  The base device trees are the same between the two kernels.
> > >
> > > Looking at the overlay changes between the versions and Xen source, I
> > > can't trace down anything that would cause an issue.  Has anyone seen
> > > this issue of have any ideas?
> 
> Seen it: yes, but no progress on resolving it to report at this point.
> 
> > FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
> >     https://github.com/raspberrypi/linux/tree/rpi-5.6.y
> >
> > The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).
> 
> Hi Roman - is there a specific commit in that rpi-5.6.y branch that
> you guys have working ok?
> It looks like the bcm2711_defconfig file wasn't included in the kernel
> source tree of that branch at the point the kernel version was bumped
> up to 5.6.14, so is there somewhere else to look for a matching kernel
> config?

I don't know if that is the issue but beware that some device trees
invert serial0 with serial1. Make sure to use /soc/serial@7e215040. You
can do that by passing dtuart=/soc/serial@7e215040 to the Xen command
line.

