Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB491DA7DA
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 04:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbEGr-0006pg-Ce; Wed, 20 May 2020 02:15:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qY6k=7C=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbEGp-0006pb-8n
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 02:15:47 +0000
X-Inumbo-ID: d025439c-9a3f-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d025439c-9a3f-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 02:15:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m185so1264337wme.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 19:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1NQF7JEWHycCKE/MRXEY/iLaS0F6TnWPG8a7PHW3xk=;
 b=J0MQ9WFmvALZb0neoUTra1JD4abEfV+HLIRdr4HECIC3h4nwMZtsqjVHIlv2S5f5Dy
 kVFfkTbu+0QK8uw+qxG1ft6kxloVHnUGN+wMXxfhDR4beqJuDKJBRenDCs3xqbrJrITr
 uTRxWFvBwvEczCfWlW3siCBn1D480EE9YFDHTmQBX4wEzSh7K39LIAe41aElJXU7U9wI
 celgRCY8FW18mbwlsGwGvVoUB/z/q7+JGnXVS6zpnrKwu/TYj+PvUmR2bm5ylk3dC6wm
 RNMcHxumfaxYl5UeDdkhQglpMVsv0P+/akQjkV1m5zLpzb51AKxbBK4ISkanj8/rTXU2
 3EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1NQF7JEWHycCKE/MRXEY/iLaS0F6TnWPG8a7PHW3xk=;
 b=f7pbmOyz/kGpt8sMwoPx0iW+o88Pru6iIbVYzuzjwTrb38JlR9AtVGPwo67G2yFysV
 meHpovZ9FvXIUqleyIcJ1bd+PS2y4tkhb2jv8G3hN840jpqcIm88eYEs0PvF7s4tsX8p
 cF4Q/N81jAxHkAHUzyfwvU331l0iLGzqWxzXgnXHL7VrQGUZCFaFKapgcHJ4caVXGAZH
 tVem9g+5Ab6rp3HSb+S6T1IBZUkmanxHbEHb833Ar550oyLkgBba6zkFQpLRjApRECXy
 3SgGytaqW5FC/8nbP4u4g5uDaQwEYYgg6uidPhimKhd7+LToOYiOHQSPKgDg25jpDKHW
 l+8A==
X-Gm-Message-State: AOAM532pAX6ITRnMDmxKGlnoBaCpSuK1LkU8LMtVD7ypiJ1vfRYnbyuu
 eBxYco+Hrc37/CIa/ntK7Pkxxoso7aqwfUbA1eU=
X-Google-Smtp-Source: ABdhPJxX9lRGUJsYId/9jlkmY3fKEUvTvhX8/NnJr65CrvQMwKiIrXksf4qU/VLEShSW7XRhrQUFxHggic3Tsh/e9J4=
X-Received: by 2002:a7b:c959:: with SMTP id i25mr2253112wml.84.1589940944975; 
 Tue, 19 May 2020 19:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113008.15422-1-julien@xen.org>
 <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
 <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
 <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
 <CAMmSBy9QQ4RPZnX6d4Mf6OqQjmN0+jLXL9nGMOQjnTt1axn4fQ@mail.gmail.com>
In-Reply-To: <CAMmSBy9QQ4RPZnX6d4Mf6OqQjmN0+jLXL9nGMOQjnTt1axn4fQ@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 19 May 2020 20:15:08 -0600
Message-ID: <CABfawh=nsM9kz0i2+NmCwapWXqL5k+gzaJLLnfGv06e5bZUvyA@mail.gmail.com>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
To: Roman Shaposhnik <roman@zededa.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 minyard@acm.org, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 5:50 PM Roman Shaposhnik <roman@zededa.com> wrote:
>
> On Tue, May 19, 2020 at 4:44 PM Tamas K Lengyel
> <tamas.k.lengyel@gmail.com> wrote:
> >
> > On Tue, May 19, 2020 at 11:23 AM Julien Grall <julien@xen.org> wrote:
> > >
> > >
> > >
> > > On 19/05/2020 04:08, Tamas K Lengyel wrote:
> > > > On Mon, May 18, 2020 at 5:32 AM Julien Grall <julien@xen.org> wrote:
> > > >>
> > > >> From: Julien Grall <jgrall@amazon.com>
> > > >>
> > > >> Hi all,
> > > >>
> > > >> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
> > > >> only use the first GB of memory.
> > > >>
> > > >> This is because several devices cannot DMA above 1GB but Xen doesn't
> > > >> necessarily allocate memory for Dom0 below 1GB.
> > > >>
> > > >> This small series is trying to address the problem by allowing a
> > > >> platform to restrict where Dom0 banks are allocated.
> > > >>
> > > >> This is also a candidate for Xen 4.14. Without it, a user will not be
> > > >> able to use all the RAM on the Raspberry Pi 4.
> > > >>
> > > >> This series has only be slighlty tested. I would appreciate more test on
> > > >> the Rasbperry Pi 4 to confirm this removing the restriction.
> > > >
> > > > Hi Julien,
> > >
> > > Hi,
> > >
> > > > could you post a git branch somewhere? I can try this on my rpi4 that
> > > > already runs 4.13.
> > >
> > > I have pushed a branch based on unstable and the v2 of the series:
> > >
> > > git://xenbits.xen.org/people/julieng/xen-unstable.git
> > >
> > > branch arm-dma/v2
> > >
> >
> > I've updated my image I built with
> > https://github.com/tklengyel/xen-rpi4-builder a while ago and I've
> > defined 2048m as total_mem and Xen seems to be booting fine and passes
> > execution to dom0. With 512m being set as the Xen cmdline for dom0_mem
> > it was working. When I increased the mem for dom0 the boot is now
> > stuck at:
> >
> > [    1.427788] of_cfs_init
> > [    1.429667] of_cfs_init: OK
> > [    1.432561] clk: Not disabling unused clocks
> > [    1.437239] Waiting for root device /dev/mmcblk0p2...
> > [    1.451599] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
> > [    1.458156] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.464729] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.472804] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
> > [    1.479370] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.546902] random: fast init done
> > [    1.564590] mmc1: new high speed SDIO card at address 0001
> >
> > Could this be because the DTB I compiled from a fresh checkout of
> > https://github.com/raspberrypi/linux.git branch rpi-4.19.y whereas the
> > kernel itself is from a checkout ~5 months ago? I guess that must be
> > the cause because even if I decrease the dom0_mem to 512m it still
> > gets stuck at the same spot whereas it was booting fine before.
>
> Stefano and I are testing the fix right now -- for now just set your
> Dom0 mem to less than 512m.

Actually seems to work after I recompiled the kernel and reinstalled
all kernel modules. Xen boots with 4gb RAM and dom0 boots with 2g:

xl info:
...
total_memory           : 3956
free_memory            : 1842

cat /proc/meminfo
MemTotal:        1963844 kB

I get an emergency shell during boot on the console complaining about
xenbr0 not coming up but if I just hit continue it boots fine and the
network is up. So AFAICT things are good.

Cheers,
Tamas

