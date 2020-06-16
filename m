Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E21FA5B7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 03:46:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl0fA-0003mf-CY; Tue, 16 Jun 2020 01:45:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thra=75=mvista.com=cminyard@srs-us1.protection.inumbo.net>)
 id 1jl0f8-0003ma-Ul
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 01:45:18 +0000
X-Inumbo-ID: 06c51dbc-af73-11ea-8496-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06c51dbc-af73-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 01:45:15 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id n70so14745818ota.5
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 18:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kMi+jR3horvu1aylPf21nfSU/GNPdB0SU9oDs45H9fU=;
 b=nX+gSTTHhzZR1vuKJRqxVX5NMt/lsFovrjYbpyUeNJQdepET/yaqUo283csBqVYdBW
 uSbDQAskrjL9x4J+QfGWRPKH5P9ViTuJ4EWLvIq8ycKNRTySkqTpnJ0qHweT+kbYOkzo
 VygcXV5uOk7SwC1OKBqRb9/4vRM+gRhq9yxcfUl4FJuI4rZ5zEobaCQB3Ts7zqMRW/CI
 nacdVNOt9mGhTBMRNLZXz5TN6U1KvCidmOpPG51nHEskJF6BbUoOGc2TF3RMQXlZYfwm
 Q7496B+JUbJ2e+TFePcsMg2ee1She7NhKInoP9L+WFy85nel5vlmR3fp5pag6nYhywKe
 M1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=kMi+jR3horvu1aylPf21nfSU/GNPdB0SU9oDs45H9fU=;
 b=ZLENUd7HzJ71JyGo6cxCRhd2KhEivrqeXaKuuiIkGV77U0Ga/DCV5kMnHhzhQQQk/N
 z4KCAub2mV76jouL2ouaBxk6vT9gfGnq8mHX4gUXaxtZ72diq6IfuoufSKRjZe1RFi7K
 2PaQ1pKrdRZ43lNaOcnZFKQYO4i8iE1/TqIkApzIiXgJpiyzC2IfeD6bSc3cGIueB4AW
 tqowKnZxuQ+W8HgdgR0jLdCj77Dv4k/AikGlU3t/mAlUcNEnIAkTDfjG+FlxIjhlXAxn
 4FO3AlTomW2HtvhIxJc8/p6/mHMsSLGhax86yr8A5tv8+67KNWwAg9UuE33DKtzZv+C5
 AcMg==
X-Gm-Message-State: AOAM533Bti6g9KrF2X/SRqCvymKA55CF59q/LuD421LFLNzUVIcRrl8Y
 CDuZiG44FyZjQZwW13aQsPxOuQ==
X-Google-Smtp-Source: ABdhPJxr206Qo4tFc4ns8F2nRl5uHV2WeyGlEDTa6GqDf5bkdnVcTyJg99CyrrIJbxLCCAS7aA+tjQ==
X-Received: by 2002:a9d:6048:: with SMTP id v8mr723177otj.231.1592271915436;
 Mon, 15 Jun 2020 18:45:15 -0700 (PDT)
Received: from minyard.net ([47.184.146.204])
 by smtp.gmail.com with ESMTPSA id t22sm3730736oth.53.2020.06.15.18.45.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 18:45:14 -0700 (PDT)
Date: Mon, 15 Jun 2020 20:45:13 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
Message-ID: <20200616014513.GD3113@minyard.net>
References: <20200610185415.GG7231@minyard.net>
 <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
 <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
 <alpine.DEB.2.21.2006151710280.9074@sstabellini-ThinkPad-T480s>
 <20200616010252.GC3113@minyard.net>
 <CAMmSBy_=tYFH+HtSnGdY90bkL9XPxQ6iJ20RVP3nQU0P0bHBpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy_=tYFH+HtSnGdY90bkL9XPxQ6iJ20RVP3nQU0P0bHBpA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: cminyard@mvista.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>, tamas@tklengyel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 06:05:57PM -0700, Roman Shaposhnik wrote:
> On Mon, Jun 15, 2020 at 6:02 PM Corey Minyard <cminyard@mvista.com> wrote:
> >
> > On Mon, Jun 15, 2020 at 05:14:21PM -0700, Stefano Stabellini wrote:
> > > On Mon, 15 Jun 2020, Christopher Clark wrote:
> > > > On Wed, Jun 10, 2020 at 7:21 PM Roman Shaposhnik <roman@zededa.com> wrote:
> > > > >
> > > > > On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> > > > > >
> > > > > > I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> > > > > > existing sd cards, and this was working fine.  I finally got to a full
> > > > > > yocto build of the system, and it didn't boot.
> > > > > >
> > > > > > In fact, Xen didn't print anything at all, and nothing happens that
> > > > > > might suggest it's booting without any console output.
> > > >
> > > > I've reproduced this. Linux 4.19 from the Raspberry Pi kernel branch
> > > > works fine, whereas I see no console output from the kernel once Xen
> > > > tries to hand off to dom0 with either a 5.4 or 5.6 kernel.
> > > >
> > > > > > I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> > > > > > else the same, the 4.19 version of that overlay works, and the 5.4
> > > > > > version does not work.  It also didn't work if I completely removed the
> > > > > > overlay.  The base device trees are the same between the two kernels.
> > > > > >
> > > > > > Looking at the overlay changes between the versions and Xen source, I
> > > > > > can't trace down anything that would cause an issue.  Has anyone seen
> > > > > > this issue of have any ideas?
> > > >
> > > > Seen it: yes, but no progress on resolving it to report at this point.
> > > >
> > > > > FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
> > > > >     https://github.com/raspberrypi/linux/tree/rpi-5.6.y
> > > > >
> > > > > The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).
> > > >
> > > > Hi Roman - is there a specific commit in that rpi-5.6.y branch that
> > > > you guys have working ok?
> > > > It looks like the bcm2711_defconfig file wasn't included in the kernel
> > > > source tree of that branch at the point the kernel version was bumped
> > > > up to 5.6.14, so is there somewhere else to look for a matching kernel
> > > > config?
> > >
> > > I don't know if that is the issue but beware that some device trees
> > > invert serial0 with serial1. Make sure to use /soc/serial@7e215040. You
> > > can do that by passing dtuart=/soc/serial@7e215040 to the Xen command
> > > line.
> >
> > I already have that set as part of the boot process, but it still
> > doesn't print anything out once Xen is started.
> >
> > I tried the 5.6 device tree, and no help there, eithers.  I'm wondering
> > if everyone is still running with the 4.19 device trees.
> 
> As I pointed out in the EVE link above -- we're very happily running
> with 5.6 device trees. They are, of course, taken from RPI kernel
> tree.

Ok, what version of Xen are you running?  I'm using 4.13 with the Pi
patches, but I have not tried the master branch.

-corey

> 
> Thanks,
> Roman.

