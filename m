Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9361DA87A
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 05:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbF44-0002p2-Hy; Wed, 20 May 2020 03:06:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qY6k=7C=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbF43-0002ox-5H
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 03:06:39 +0000
X-Inumbo-ID: eb8f88c0-9a46-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb8f88c0-9a46-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 03:06:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h17so1552195wrc.8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYK8pxeuvYkc7dUqt9jiTMrBHW3ldfKsgEdhuG4PKwM=;
 b=d9fIn91SQl4bmafn9AJdfRZJZEzlyq9uDbZc12EykUShyJcVWDDTEIoWeUMxT+eyM/
 h2kjsezgemmj3jF+AgncG4qAbIEGoiRDwlqgm7K56xDM1/KFw2E1oAJRpq+LB72kMdZG
 ST/UBup+yolyeXT3RH5ijxvRuw9nd9U1AFT8tqU0LKZVjSRz9B3zm7UDG62PbmoaR//L
 mmpJJKk5SQ13Che/uvMnPOItZexUCf6/PIEw+l4Yk5WCKMAZ8Vw0vFxZp3BMsQvnDFq4
 vBxF7/tPojkSz6WSqmefeYqY+x5YO0LvxBQ7La2ZS34oOzwLUVQEMzhJmkpIv+3I3qHX
 ik0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYK8pxeuvYkc7dUqt9jiTMrBHW3ldfKsgEdhuG4PKwM=;
 b=Mo5aSe1tGbn3hZimrimc81PYljlFQ6GvKpa5Yzr0K0hrN/sHUc15hrDHQi2/k/YxzB
 WMxUd38Ev5BsLxIVUJpeAUEQnK6B4qEBySnjrCeImWUgWrVxH0O9+RJhXeqn3crXImme
 Ld8hJLSljFZot74wmn9P2bY+2maW3aUsd39D13KHYMMiJPSTlv+HJvlsukNZnYSKcQ+q
 05WPGihQi80TjMoFsEX9A5N2BvpAMkhHhmrNDcfyipsDp6gCpOuw6vZkm8kdnwt9xypx
 npQTxsHoSAsrltOJ8b65ThuNthakOo0y9cA88c5vMUhVCHooaDC5QNSwOKzy0X7LeQhQ
 J3RQ==
X-Gm-Message-State: AOAM531polzO6EMCwzC7DAGdIRKwQtQxGvrZoKtrpjrZG2zpfaQ2vQpD
 c80IwKpze1qm5KXlaL8oiqMBmzF5Z/BqILZmHWA=
X-Google-Smtp-Source: ABdhPJzECXQUiAT17g95E9FFT5vYtu7Prc/1GDOlxSKSwejnuQtTncu/0Dvq2fx1uH3D3mkFaEyObhJMriVMT8Mto0U=
X-Received: by 2002:adf:a3c5:: with SMTP id m5mr2075527wrb.390.1589943997423; 
 Tue, 19 May 2020 20:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113008.15422-1-julien@xen.org>
 <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
 <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
 <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
 <CAMmSBy9QQ4RPZnX6d4Mf6OqQjmN0+jLXL9nGMOQjnTt1axn4fQ@mail.gmail.com>
 <CABfawh=nsM9kz0i2+NmCwapWXqL5k+gzaJLLnfGv06e5bZUvyA@mail.gmail.com>
 <CAMmSBy-372BGtHGDsx6SHTwj7sZV4Qvq1XF+kbenkEcwboZF5w@mail.gmail.com>
In-Reply-To: <CAMmSBy-372BGtHGDsx6SHTwj7sZV4Qvq1XF+kbenkEcwboZF5w@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 19 May 2020 21:06:01 -0600
Message-ID: <CABfawhkoSz-zSdyuFvu=p7pPE=uG1QN1E0XawjRbLa47Cx3Nww@mail.gmail.com>
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

On Tue, May 19, 2020 at 8:28 PM Roman Shaposhnik <roman@zededa.com> wrote:
>
> On Tue, May 19, 2020, 7:15 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com> wrote:
>>
>> On Tue, May 19, 2020 at 5:50 PM Roman Shaposhnik <roman@zededa.com> wrote:
>> >
>> > On Tue, May 19, 2020 at 4:44 PM Tamas K Lengyel
>> > <tamas.k.lengyel@gmail.com> wrote:
>> > >
>> > > On Tue, May 19, 2020 at 11:23 AM Julien Grall <julien@xen.org> wrote:
>> > > >
>> > > >
>> > > >
>> > > > On 19/05/2020 04:08, Tamas K Lengyel wrote:
>> > > > > On Mon, May 18, 2020 at 5:32 AM Julien Grall <julien@xen.org> wrote:
>> > > > >>
>> > > > >> From: Julien Grall <jgrall@amazon.com>
>> > > > >>
>> > > > >> Hi all,
>> > > > >>
>> > > > >> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
>> > > > >> only use the first GB of memory.
>> > > > >>
>> > > > >> This is because several devices cannot DMA above 1GB but Xen doesn't
>> > > > >> necessarily allocate memory for Dom0 below 1GB.
>> > > > >>
>> > > > >> This small series is trying to address the problem by allowing a
>> > > > >> platform to restrict where Dom0 banks are allocated.
>> > > > >>
>> > > > >> This is also a candidate for Xen 4.14. Without it, a user will not be
>> > > > >> able to use all the RAM on the Raspberry Pi 4.
>> > > > >>
>> > > > >> This series has only be slighlty tested. I would appreciate more test on
>> > > > >> the Rasbperry Pi 4 to confirm this removing the restriction.
>> > > > >
>> > > > > Hi Julien,
>> > > >
>> > > > Hi,
>> > > >
>> > > > > could you post a git branch somewhere? I can try this on my rpi4 that
>> > > > > already runs 4.13.
>> > > >
>> > > > I have pushed a branch based on unstable and the v2 of the series:
>> > > >
>> > > > git://xenbits.xen.org/people/julieng/xen-unstable.git
>> > > >
>> > > > branch arm-dma/v2
>> > > >
>> > >
>> > > I've updated my image I built with
>> > > https://github.com/tklengyel/xen-rpi4-builder a while ago and I've
>> > > defined 2048m as total_mem and Xen seems to be booting fine and passes
>> > > execution to dom0. With 512m being set as the Xen cmdline for dom0_mem
>> > > it was working. When I increased the mem for dom0 the boot is now
>> > > stuck at:
>> > >
>> > > [    1.427788] of_cfs_init
>> > > [    1.429667] of_cfs_init: OK
>> > > [    1.432561] clk: Not disabling unused clocks
>> > > [    1.437239] Waiting for root device /dev/mmcblk0p2...
>> > > [    1.451599] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
>> > > [    1.458156] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
>> > > [    1.464729] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
>> > > [    1.472804] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
>> > > [    1.479370] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
>> > > [    1.546902] random: fast init done
>> > > [    1.564590] mmc1: new high speed SDIO card at address 0001
>> > >
>> > > Could this be because the DTB I compiled from a fresh checkout of
>> > > https://github.com/raspberrypi/linux.git branch rpi-4.19.y whereas the
>> > > kernel itself is from a checkout ~5 months ago? I guess that must be
>> > > the cause because even if I decrease the dom0_mem to 512m it still
>> > > gets stuck at the same spot whereas it was booting fine before.
>> >
>> > Stefano and I are testing the fix right now -- for now just set your
>> > Dom0 mem to less than 512m.
>>
>> Actually seems to work after I recompiled the kernel and reinstalled
>> all kernel modules. Xen boots with 4gb RAM and dom0 boots with 2g:
>>
>> xl info:
>> ...
>> total_memory           : 3956
>> free_memory            : 1842
>>
>> cat /proc/meminfo
>> MemTotal:        1963844 kB
>>
>> I get an emergency shell during boot on the console complaining about
>> xenbr0 not coming up but if I just hit continue it boots fine and the
>> network is up. So AFAICT things are good.
>
>
> What exact version of the kernel are you using and what did you build it from?
>
> FWIW: 5.6.x clearly has an issue with DMA.

As I said above: https://github.com/raspberrypi/linux.git branch
rpi-4.19.y, I applied the Linux patches from the xen-rpi4-builder
repo, just changing the dom0_mem option in patch 1. I reverted the
xen-rpi4-builder a couple revisions as to not build using the DTB
overlay.

Tamas

