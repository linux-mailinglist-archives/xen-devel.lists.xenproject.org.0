Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0511FA55F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 03:06:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl03I-00009r-7c; Tue, 16 Jun 2020 01:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FxI/=75=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jl03G-00009m-FK
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 01:06:10 +0000
X-Inumbo-ID: 8f8c225e-af6d-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f8c225e-af6d-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 01:06:08 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j32so14241044qte.10
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 18:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wW+puVJHpMs7S9N79RyQRGtzBwwiwKyuY+x/s5I6TwI=;
 b=Jm1W/ZttYXDhfUgeO6GTfIZYh3cZAO4hDNXvNsiBDUNDL/5YfqFGCgpHvqfoMYfBc+
 ahH7bSRDv1pYbyyfBkMk3OEo/d01Ck10pKaBXu7JdKSVjz6l5T61HhsbWaKS0Vms7c81
 5fvj4oXlkJx9395lcyJH5cnY529Prg/SXJXno3KrI17Y+CwL9nhFrV/sCbvkELH2XzMy
 QJVgSNZXUJN0p9L4v19U7qe2HBQ8FLBgjR8K2TiT0gQPXEMZXdKSR4NWNrdEEr/EtvBv
 Q9Ji0T4qeXPQOYhWCfwMcOYhsCdRuOp2zLAP3YQwshJLWllp3XKsAiDvFw/Wfw3QwAnm
 qBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wW+puVJHpMs7S9N79RyQRGtzBwwiwKyuY+x/s5I6TwI=;
 b=kgac7WOogatnzfx/LnwgSghp68cJiXcBueowZKhP/oSOyPD6JpM8NCeJvzBReypWNn
 yiaMsFwZc+luFBI6yjSq239YodHNVx2fvuPniMizOwx4L2SXgFm6AG9OPJo/TeovcReW
 gAuByjoXFjJMZlRhGFTL+P5yLnSolW2hmsO+Y+W37i4udQOcyZFHg+MqdUy7FKrAODFA
 K7+llYx5wAozBZ82bHTn8OQoBh0rUykqYN7thRybFSwhGsVd7Wkmn7mgWI0PDsj3k7FQ
 Ic7Nuvk8FX1BP5Hao6512ZOU+J5i6YjvnYU34HHHLC57EgQGniBHxpkvAzsL2HqPakJk
 qOcA==
X-Gm-Message-State: AOAM533CFzE3rLUbh03fVUOXr5Fiyw9Kh1KHNAG0cPlhqd/VGR5cLVKw
 i6m2jALQEbkywZu2DR8idsHS5zPwfphxSxRZrkTfVg==
X-Google-Smtp-Source: ABdhPJyWm8F8DxS2nF03ETgrRohjHFE4DNQ0uwOftHEG6wzEQsRkUUAi6rFuDxhIzLh8zht7qdy+5OnrTvTx4dXL1sE=
X-Received: by 2002:ac8:4d0e:: with SMTP id w14mr18908099qtv.266.1592269567983; 
 Mon, 15 Jun 2020 18:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200610185415.GG7231@minyard.net>
 <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
 <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
 <alpine.DEB.2.21.2006151710280.9074@sstabellini-ThinkPad-T480s>
 <20200616010252.GC3113@minyard.net>
In-Reply-To: <20200616010252.GC3113@minyard.net>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 15 Jun 2020 18:05:57 -0700
Message-ID: <CAMmSBy_=tYFH+HtSnGdY90bkL9XPxQ6iJ20RVP3nQU0P0bHBpA@mail.gmail.com>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
To: Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>, tamas@tklengyel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 6:02 PM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Mon, Jun 15, 2020 at 05:14:21PM -0700, Stefano Stabellini wrote:
> > On Mon, 15 Jun 2020, Christopher Clark wrote:
> > > On Wed, Jun 10, 2020 at 7:21 PM Roman Shaposhnik <roman@zededa.com> wrote:
> > > >
> > > > On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> > > > >
> > > > > I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> > > > > existing sd cards, and this was working fine.  I finally got to a full
> > > > > yocto build of the system, and it didn't boot.
> > > > >
> > > > > In fact, Xen didn't print anything at all, and nothing happens that
> > > > > might suggest it's booting without any console output.
> > >
> > > I've reproduced this. Linux 4.19 from the Raspberry Pi kernel branch
> > > works fine, whereas I see no console output from the kernel once Xen
> > > tries to hand off to dom0 with either a 5.4 or 5.6 kernel.
> > >
> > > > > I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> > > > > else the same, the 4.19 version of that overlay works, and the 5.4
> > > > > version does not work.  It also didn't work if I completely removed the
> > > > > overlay.  The base device trees are the same between the two kernels.
> > > > >
> > > > > Looking at the overlay changes between the versions and Xen source, I
> > > > > can't trace down anything that would cause an issue.  Has anyone seen
> > > > > this issue of have any ideas?
> > >
> > > Seen it: yes, but no progress on resolving it to report at this point.
> > >
> > > > FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
> > > >     https://github.com/raspberrypi/linux/tree/rpi-5.6.y
> > > >
> > > > The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).
> > >
> > > Hi Roman - is there a specific commit in that rpi-5.6.y branch that
> > > you guys have working ok?
> > > It looks like the bcm2711_defconfig file wasn't included in the kernel
> > > source tree of that branch at the point the kernel version was bumped
> > > up to 5.6.14, so is there somewhere else to look for a matching kernel
> > > config?
> >
> > I don't know if that is the issue but beware that some device trees
> > invert serial0 with serial1. Make sure to use /soc/serial@7e215040. You
> > can do that by passing dtuart=/soc/serial@7e215040 to the Xen command
> > line.
>
> I already have that set as part of the boot process, but it still
> doesn't print anything out once Xen is started.
>
> I tried the 5.6 device tree, and no help there, eithers.  I'm wondering
> if everyone is still running with the 4.19 device trees.

As I pointed out in the EVE link above -- we're very happily running
with 5.6 device trees. They are, of course, taken from RPI kernel
tree.

Thanks,
Roman.

