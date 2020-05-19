Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F91DA5CF
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:50:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbC0M-000160-VF; Tue, 19 May 2020 23:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F61s=7B=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jbC0L-00015t-L6
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:50:37 +0000
X-Inumbo-ID: 89514c90-9a2b-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89514c90-9a2b-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 23:50:36 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id m44so1187672qtm.8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 16:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+2zeIx8NpuvSM61jzGrcp2yiL758KDce2BV7V9SnAs=;
 b=cWZNOkxiU1cJ3ZLqrs88LJ/NaB6HF+6TeDsc9heDqXrKI0WK2G4MJ4byP+EEcJ7qNc
 7znYEpaCmyYwigXj2B2YV+F13WCyHptPx3WD9I9l17A4MPEq9ymfgACBdA7kkO7cHby2
 lr8ysHh9mam6oYfR0yH66hK+lxfYKa7s0lutbh9Nt+pcUokl61nf2LDyuXi7OQVPU7PA
 XPcJJzMnHoQyK94+SgN98AQIlGNlcwY83xmv+V/uYdU9ApQ/zgZAP7HKO7FZdl2l5WSO
 F6CD0+N+Az6T8zD8vmoi0E7UhOCnqJZ+e+1ZUd3R/0Lyiq+ONkyCPCO5VAhVEbzD0Un9
 v/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+2zeIx8NpuvSM61jzGrcp2yiL758KDce2BV7V9SnAs=;
 b=BrlzyZLJuDNCEiJgzoNINmltiUSOet7Nf6t1/ACUChJhBlcxhkfTEcTdlWd2jI8Qx6
 Uwd+P560dyK6lbxepbyfz0KlRj23Mzzg2WkM9zZbokn5129pir06UfmFVksTHKc9tbne
 V2aA0f3e+tQW54seSCfxsRdj4xGqZsHG7GMCENtGEwnhKVrThx4fo6Nq2Y9qlrQbvBxH
 PHblrBQIyiasO0vCG2nt0+/q9XAuRMWqoMK+ENEoXd+F9YEdmVN0U/7xUSBHoA6DRLFu
 TicSfYLIHQW1dWV7XDRT0c41x5DgVGK0GdSynAXdAbuu5mL2Z6ZhNJRgjJn4Aw9eIUoN
 2mdQ==
X-Gm-Message-State: AOAM533hodpQuBO91UuCmx++PqE2x/u8GlnVhnT17fMz4DAXUwci81NY
 r2A1HXovW2hlvqkH09WbxMtqjzYikzozT7jweJqb7A==
X-Google-Smtp-Source: ABdhPJyjR2Oq07MldvBp147h4gGXZeuUd6NDFAPgZDjAN1D+JPIRKvIlTLYth6u8TKPBWFTPneDHogLqME8K7U3NgMo=
X-Received: by 2002:ac8:1bd2:: with SMTP id m18mr2577310qtk.77.1589932236323; 
 Tue, 19 May 2020 16:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113008.15422-1-julien@xen.org>
 <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
 <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
 <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
In-Reply-To: <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 19 May 2020 16:50:25 -0700
Message-ID: <CAMmSBy9QQ4RPZnX6d4Mf6OqQjmN0+jLXL9nGMOQjnTt1axn4fQ@mail.gmail.com>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
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

On Tue, May 19, 2020 at 4:44 PM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
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

Stefano and I are testing the fix right now -- for now just set your
Dom0 mem to less than 512m.

Thanks,
Roman.

