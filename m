Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA51FA558
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 03:03:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl00B-0008Lg-BQ; Tue, 16 Jun 2020 01:02:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thra=75=mvista.com=cminyard@srs-us1.protection.inumbo.net>)
 id 1jl009-0008Ku-3C
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 01:02:57 +0000
X-Inumbo-ID: 1c3d052a-af6d-11ea-bb8b-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c3d052a-af6d-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 01:02:55 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id g5so14677402otg.6
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 18:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iHDnNoDNU+c8dgUsqW6znGAfHjIobB34mz6wlM7mql8=;
 b=tyfkuskeAzZYSr1IbuTYE/gHpEoCylSi6Xe1DUFczTb8/fmC/PsWy3hu330GCqw8yu
 +9ZTgWhlkze+xl0mUTEdvoy3Tj3Slg5to0zz0QgbJDnbYV/96pQfOqg9nDZ8duFmF6Je
 tWhQzahdByWJXkCn193EbXYkgXKwjafm3Y8oOxluw9hCqjhRctkFYt9j1+VX7KxOCe/i
 WOeD3Uh15QEePcWQRuicTfLbYhe4NuAkby24G20BGl85eAgeIQhLHDUMHc5hXvt22SJr
 Lf8Hr+S5rGKzY3movz/e9k4Qduqf8DklgRQqK2NdQmLXxLqBJbC2GlOZ2n+pJnynfH2v
 fuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=iHDnNoDNU+c8dgUsqW6znGAfHjIobB34mz6wlM7mql8=;
 b=l/Tijj2sumlkjCefzciJcJaF86TAhAq9c3vhgbdqVa9barqnGegp2o6tdxsDrcuFNK
 hl/OA4aoZNyMVF2I5qEnzkgk7X+RAURCZK/wk6JHnqX8946n7xVNM41ToYDWGEv2FXHV
 jChchTEH1ZYccx5hu2bvdBl/C66J39rTatuO49fVr7hKeJy5qXEQkLOigZYVbeOwAiWs
 SiunitZPhplRcDNwFt6IX57wR1rC4gglFX4Kqv/9Os+Cc3QIwn8FChkvzeE3Es9Zwe7k
 UBVR5/cJ+vI4dUNvZ+kXSxMIyWto3MIKJqSoMf7fasuvOKF0um9K2m7DvKAi1WIqV0i9
 kf+g==
X-Gm-Message-State: AOAM5331bfG6N/baQMMaeiFnAR3u2s8+DG1wfcx2ZWkt1eAOBTCg9m5u
 suerJrTbRRwuTJ0ooDBTDhYgVw==
X-Google-Smtp-Source: ABdhPJw4cXoS8imzdZdUWhFtJ4chsI2NYqqaRsdqfgcLFN2tA3B+OAmosjSSgsWiq6H3f/z8UvsAKA==
X-Received: by 2002:a05:6830:1d76:: with SMTP id
 l22mr514892oti.177.1592269374414; 
 Mon, 15 Jun 2020 18:02:54 -0700 (PDT)
Received: from minyard.net ([47.184.146.204])
 by smtp.gmail.com with ESMTPSA id q10sm3680268otl.40.2020.06.15.18.02.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 18:02:54 -0700 (PDT)
Date: Mon, 15 Jun 2020 20:02:52 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
Message-ID: <20200616010252.GC3113@minyard.net>
References: <20200610185415.GG7231@minyard.net>
 <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
 <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
 <alpine.DEB.2.21.2006151710280.9074@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006151710280.9074@sstabellini-ThinkPad-T480s>
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
 Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>, tamas@tklengyel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 05:14:21PM -0700, Stefano Stabellini wrote:
> On Mon, 15 Jun 2020, Christopher Clark wrote:
> > On Wed, Jun 10, 2020 at 7:21 PM Roman Shaposhnik <roman@zededa.com> wrote:
> > >
> > > On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> > > >
> > > > I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> > > > existing sd cards, and this was working fine.  I finally got to a full
> > > > yocto build of the system, and it didn't boot.
> > > >
> > > > In fact, Xen didn't print anything at all, and nothing happens that
> > > > might suggest it's booting without any console output.
> > 
> > I've reproduced this. Linux 4.19 from the Raspberry Pi kernel branch
> > works fine, whereas I see no console output from the kernel once Xen
> > tries to hand off to dom0 with either a 5.4 or 5.6 kernel.
> > 
> > > > I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> > > > else the same, the 4.19 version of that overlay works, and the 5.4
> > > > version does not work.  It also didn't work if I completely removed the
> > > > overlay.  The base device trees are the same between the two kernels.
> > > >
> > > > Looking at the overlay changes between the versions and Xen source, I
> > > > can't trace down anything that would cause an issue.  Has anyone seen
> > > > this issue of have any ideas?
> > 
> > Seen it: yes, but no progress on resolving it to report at this point.
> > 
> > > FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
> > >     https://github.com/raspberrypi/linux/tree/rpi-5.6.y
> > >
> > > The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).
> > 
> > Hi Roman - is there a specific commit in that rpi-5.6.y branch that
> > you guys have working ok?
> > It looks like the bcm2711_defconfig file wasn't included in the kernel
> > source tree of that branch at the point the kernel version was bumped
> > up to 5.6.14, so is there somewhere else to look for a matching kernel
> > config?
> 
> I don't know if that is the issue but beware that some device trees
> invert serial0 with serial1. Make sure to use /soc/serial@7e215040. You
> can do that by passing dtuart=/soc/serial@7e215040 to the Xen command
> line.

I already have that set as part of the boot process, but it still
doesn't print anything out once Xen is started.

I tried the 5.6 device tree, and no help there, eithers.  I'm wondering
if everyone is still running with the 4.19 device trees.

The device tree differences between 4.19 and 5.4 are rather large,
unfortunately.

-corey

