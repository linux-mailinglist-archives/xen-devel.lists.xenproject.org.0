Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6991DA5C0
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:44:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBuC-000095-TK; Tue, 19 May 2020 23:44:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TpIb=7B=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbBuB-000090-No
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:44:15 +0000
X-Inumbo-ID: a581e150-9a2a-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a581e150-9a2a-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 23:44:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e16so1244439wra.7
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 16:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9o2XJvwUYUJOqQdC3ryt4U9cktrO55WZ4SLWOL1Z3nc=;
 b=hbyd/+95r8CtUveK8j7x3zpT3qrPbaCISfL6gphoitrGFMNvZ6kThS/rC0cQNt2vHS
 PwbpLCe/xvnWms5evzaBg95biY5ASAX1oj1u0/4Lce7WRAynHXTb0MZVygk8/EsMumxa
 p+7jArN8O3vpBt/FKe1INHgyFx5h3AElRuGBNt/zlxpaA5VwwgX8Fz9bsxAbzTHZ9YRH
 HoO+DpTWRAOfURwurhDLugz7Y7J3INqCkplygtc3S5RHdzdWutdUrPLUUCoVrpdppght
 vKmnunJiqWHuOWJ8IYpleTvFVmOjBT/CbVM+ZawKx+cx22pkr548uOzA+JlDsGCd0zH0
 ECdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9o2XJvwUYUJOqQdC3ryt4U9cktrO55WZ4SLWOL1Z3nc=;
 b=EGjCbPzEszDsIafw2asaju+lf16//BpJ0iFKgSRGa3JEQQGURsFTH4vzgYU/QtLl+g
 gE9Zcd18ag7HaKrWtE+9XyHeCIuxEo0hKz5avBZoYoWX2VDgwjPOrJcy7UMsxB9sBFGC
 AyQPUExIyD1Gbci6Arg9Z6YNgPH+dSWkntD8jHrKfA2nBk/+kxjWCpusG4sUYsZDh3MU
 8OLO6xh6bmAs6bz6dGNwmbZaC+aPR1MdrhHrVzBGq+sn1rElSGN9Rbwz11BFCQ5qXInw
 WX3M+mDfpWSBkUfG9xHGuU1dobgAH1BLbeE66V4djX9WEwNX1P59IGvCxnzclLdlV707
 MKsQ==
X-Gm-Message-State: AOAM533rECezEdBLVX9XhmJ/9xwZtYQLFEC9JPdozzeJogCZrUTWF7NC
 1uQwtWqRn2CChIhTFXZ3oCTuklzKTnoUtZz/JBM=
X-Google-Smtp-Source: ABdhPJz3nXqPjVWdJbf38GAVHIB1bg4qnN3gaLv55SJkMvYDTO4F4UJV0ecKgf/Dt1N4f7bhQvBCwbAuf/KAYwloXRM=
X-Received: by 2002:adf:fccd:: with SMTP id f13mr1375325wrs.386.1589931853949; 
 Tue, 19 May 2020 16:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113008.15422-1-julien@xen.org>
 <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
 <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
In-Reply-To: <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 19 May 2020 17:43:37 -0600
Message-ID: <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
To: Julien Grall <julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, minyard@acm.org,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, roman@zededa.com,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 11:23 AM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 19/05/2020 04:08, Tamas K Lengyel wrote:
> > On Mon, May 18, 2020 at 5:32 AM Julien Grall <julien@xen.org> wrote:
> >>
> >> From: Julien Grall <jgrall@amazon.com>
> >>
> >> Hi all,
> >>
> >> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
> >> only use the first GB of memory.
> >>
> >> This is because several devices cannot DMA above 1GB but Xen doesn't
> >> necessarily allocate memory for Dom0 below 1GB.
> >>
> >> This small series is trying to address the problem by allowing a
> >> platform to restrict where Dom0 banks are allocated.
> >>
> >> This is also a candidate for Xen 4.14. Without it, a user will not be
> >> able to use all the RAM on the Raspberry Pi 4.
> >>
> >> This series has only be slighlty tested. I would appreciate more test on
> >> the Rasbperry Pi 4 to confirm this removing the restriction.
> >
> > Hi Julien,
>
> Hi,
>
> > could you post a git branch somewhere? I can try this on my rpi4 that
> > already runs 4.13.
>
> I have pushed a branch based on unstable and the v2 of the series:
>
> git://xenbits.xen.org/people/julieng/xen-unstable.git
>
> branch arm-dma/v2
>

I've updated my image I built with
https://github.com/tklengyel/xen-rpi4-builder a while ago and I've
defined 2048m as total_mem and Xen seems to be booting fine and passes
execution to dom0. With 512m being set as the Xen cmdline for dom0_mem
it was working. When I increased the mem for dom0 the boot is now
stuck at:

[    1.427788] of_cfs_init
[    1.429667] of_cfs_init: OK
[    1.432561] clk: Not disabling unused clocks
[    1.437239] Waiting for root device /dev/mmcblk0p2...
[    1.451599] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
[    1.458156] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.464729] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.472804] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
[    1.479370] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.546902] random: fast init done
[    1.564590] mmc1: new high speed SDIO card at address 0001

Could this be because the DTB I compiled from a fresh checkout of
https://github.com/raspberrypi/linux.git branch rpi-4.19.y whereas the
kernel itself is from a checkout ~5 months ago? I guess that must be
the cause because even if I decrease the dom0_mem to 512m it still
gets stuck at the same spot whereas it was booting fine before.

Tamas

