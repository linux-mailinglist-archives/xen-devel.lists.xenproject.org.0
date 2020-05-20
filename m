Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89471DA7FA
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 04:29:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbETa-0007oh-Hm; Wed, 20 May 2020 02:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eu2h=7C=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jbETY-0007oc-K5
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 02:28:56 +0000
X-Inumbo-ID: a7210b3c-9a41-11ea-b07b-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7210b3c-9a41-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 02:28:55 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i14so2109660qka.10
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WGOOkDJsScw7s5V+9RdisLqP/Tk+LGbdqMPrItt2fl4=;
 b=LQGR0USgPmirv0ZmSovlpHX7FcGiV4vlQdS9Yw/5drsGXKk7IZYsgcrxwjqHosQpEC
 2mtBjK7z2MVmYZFMOVkdLCXJFe+ST6/pMNhpIcrBAqo4k6fO/HzeCVFMvMioMWUnPLpR
 p4UXA5y8zDtGm1DbIM+CfTjCbR9zyWAsHBgXf7OKKQZ1Ol1KFGcriNQ2CHFF/OvfmiIl
 nuPaOtEQvngUIYnGc8rOE8RfhJ/EggSU5u/CV/rO5qRJM4ryAxjrMZ3ybsXte2YI8mSg
 B83T75SzaLgL7usdy52fQfMQWl809SXBbw00hElvWbDt5ApnvzcPFNWHOG6oNk13j5qa
 +GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WGOOkDJsScw7s5V+9RdisLqP/Tk+LGbdqMPrItt2fl4=;
 b=BjOgUQ66Tp8hjJ7Xt2J8BWR2JPVjbgGYz5UKAvVlblaggtLjaa85DKn7CYabRUz0WO
 VQAeXhuFr17Yp75JHrqJ7RmZMwFiUiR31/LgvR/A8eF0UQ9OGFoDuaAxliGiLXbGZ50e
 RZgCq5aCgGO+GPULcniSNaOQahJIh6JPcFDIv98I4IlKh20PqZXgKCr19DEK3MDfrc/Y
 h1k+//mECr24LWZncfqlikE7mB5nqnA8zW69lZywJPlcBQcCIuMHxrtwVwltEvumawUH
 Xv4vxJwP6xv9V+fZPBaWsXc4bNsUu1PPh/OBClgiqKzMEYdNHoHmr36UupspiyyPgIm6
 TJAA==
X-Gm-Message-State: AOAM5308bU4I1/djMcrWYXRrcneH1rr8Dn7QRw0ogS1vKPeqdFlprQug
 fOEfxSGh6FyBjPBtDrhsYSdYRgQcpoEZhBGncteZvQ==
X-Google-Smtp-Source: ABdhPJxCXhDxAh7AefgL873OGWdFwOMWlURpaRs5ogyGVpXBqsVkzyPHmtuW/Y9Ns+X/7PkatZcAsuXb9JjRanZVNy4=
X-Received: by 2002:a37:4017:: with SMTP id n23mr2388775qka.291.1589941735312; 
 Tue, 19 May 2020 19:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113008.15422-1-julien@xen.org>
 <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
 <297448b7-7837-cbe5-dee4-da80ca03cd29@xen.org>
 <CABfawhkMEu0kMH7dac6OrUxpif8v+m7MeWePRg8UYL7MstJNFA@mail.gmail.com>
 <CAMmSBy9QQ4RPZnX6d4Mf6OqQjmN0+jLXL9nGMOQjnTt1axn4fQ@mail.gmail.com>
 <CABfawh=nsM9kz0i2+NmCwapWXqL5k+gzaJLLnfGv06e5bZUvyA@mail.gmail.com>
In-Reply-To: <CABfawh=nsM9kz0i2+NmCwapWXqL5k+gzaJLLnfGv06e5bZUvyA@mail.gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 19 May 2020 19:28:43 -0700
Message-ID: <CAMmSBy-372BGtHGDsx6SHTwj7sZV4Qvq1XF+kbenkEcwboZF5w@mail.gmail.com>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000058d77105a60b28fc"
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
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000058d77105a60b28fc
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020, 7:15 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com>
wrote:

> On Tue, May 19, 2020 at 5:50 PM Roman Shaposhnik <roman@zededa.com> wrote:
> >
> > On Tue, May 19, 2020 at 4:44 PM Tamas K Lengyel
> > <tamas.k.lengyel@gmail.com> wrote:
> > >
> > > On Tue, May 19, 2020 at 11:23 AM Julien Grall <julien@xen.org> wrote:
> > > >
> > > >
> > > >
> > > > On 19/05/2020 04:08, Tamas K Lengyel wrote:
> > > > > On Mon, May 18, 2020 at 5:32 AM Julien Grall <julien@xen.org>
> wrote:
> > > > >>
> > > > >> From: Julien Grall <jgrall@amazon.com>
> > > > >>
> > > > >> Hi all,
> > > > >>
> > > > >> At the moment, a user who wants to boot Xen on the Raspberry Pi 4
> can
> > > > >> only use the first GB of memory.
> > > > >>
> > > > >> This is because several devices cannot DMA above 1GB but Xen
> doesn't
> > > > >> necessarily allocate memory for Dom0 below 1GB.
> > > > >>
> > > > >> This small series is trying to address the problem by allowing a
> > > > >> platform to restrict where Dom0 banks are allocated.
> > > > >>
> > > > >> This is also a candidate for Xen 4.14. Without it, a user will
> not be
> > > > >> able to use all the RAM on the Raspberry Pi 4.
> > > > >>
> > > > >> This series has only be slighlty tested. I would appreciate more
> test on
> > > > >> the Rasbperry Pi 4 to confirm this removing the restriction.
> > > > >
> > > > > Hi Julien,
> > > >
> > > > Hi,
> > > >
> > > > > could you post a git branch somewhere? I can try this on my rpi4
> that
> > > > > already runs 4.13.
> > > >
> > > > I have pushed a branch based on unstable and the v2 of the series:
> > > >
> > > > git://xenbits.xen.org/people/julieng/xen-unstable.git
> > > >
> > > > branch arm-dma/v2
> > > >
> > >
> > > I've updated my image I built with
> > > https://github.com/tklengyel/xen-rpi4-builder a while ago and I've
> > > defined 2048m as total_mem and Xen seems to be booting fine and passes
> > > execution to dom0. With 512m being set as the Xen cmdline for dom0_mem
> > > it was working. When I increased the mem for dom0 the boot is now
> > > stuck at:
> > >
> > > [    1.427788] of_cfs_init
> > > [    1.429667] of_cfs_init: OK
> > > [    1.432561] clk: Not disabling unused clocks
> > > [    1.437239] Waiting for root device /dev/mmcblk0p2...
> > > [    1.451599] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
> > > [    1.458156] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> > > [    1.464729] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> > > [    1.472804] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
> > > [    1.479370] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
> > > [    1.546902] random: fast init done
> > > [    1.564590] mmc1: new high speed SDIO card at address 0001
> > >
> > > Could this be because the DTB I compiled from a fresh checkout of
> > > https://github.com/raspberrypi/linux.git branch rpi-4.19.y whereas the
> > > kernel itself is from a checkout ~5 months ago? I guess that must be
> > > the cause because even if I decrease the dom0_mem to 512m it still
> > > gets stuck at the same spot whereas it was booting fine before.
> >
> > Stefano and I are testing the fix right now -- for now just set your
> > Dom0 mem to less than 512m.
>
> Actually seems to work after I recompiled the kernel and reinstalled
> all kernel modules. Xen boots with 4gb RAM and dom0 boots with 2g:
>
> xl info:
> ...
> total_memory           : 3956
> free_memory            : 1842
>
> cat /proc/meminfo
> MemTotal:        1963844 kB
>
> I get an emergency shell during boot on the console complaining about
> xenbr0 not coming up but if I just hit continue it boots fine and the
> network is up. So AFAICT things are good.
>

What exact version of the kernel are you using and what did you build it
from?

FWIW: 5.6.x clearly has an issue with DMA.

Thanks,
Roman.

>

--00000000000058d77105a60b28fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, May 19, 2020, 7:15 PM Tamas K Lengyel &lt;<a href=3D"m=
ailto:tamas.k.lengyel@gmail.com">tamas.k.lengyel@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Tue, May 19, 2020 at 5:50 PM Roma=
n Shaposhnik &lt;<a href=3D"mailto:roman@zededa.com" target=3D"_blank" rel=
=3D"noreferrer">roman@zededa.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, May 19, 2020 at 4:44 PM Tamas K Lengyel<br>
&gt; &lt;<a href=3D"mailto:tamas.k.lengyel@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">tamas.k.lengyel@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, May 19, 2020 at 11:23 AM Julien Grall &lt;<a href=3D"mail=
to:julien@xen.org" target=3D"_blank" rel=3D"noreferrer">julien@xen.org</a>&=
gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 19/05/2020 04:08, Tamas K Lengyel wrote:<br>
&gt; &gt; &gt; &gt; On Mon, May 18, 2020 at 5:32 AM Julien Grall &lt;<a hre=
f=3D"mailto:julien@xen.org" target=3D"_blank" rel=3D"noreferrer">julien@xen=
.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; From: Julien Grall &lt;<a href=3D"mailto:jgrall@ama=
zon.com" target=3D"_blank" rel=3D"noreferrer">jgrall@amazon.com</a>&gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Hi all,<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; At the moment, a user who wants to boot Xen on the =
Raspberry Pi 4 can<br>
&gt; &gt; &gt; &gt;&gt; only use the first GB of memory.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; This is because several devices cannot DMA above 1G=
B but Xen doesn&#39;t<br>
&gt; &gt; &gt; &gt;&gt; necessarily allocate memory for Dom0 below 1GB.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; This small series is trying to address the problem =
by allowing a<br>
&gt; &gt; &gt; &gt;&gt; platform to restrict where Dom0 banks are allocated=
.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; This is also a candidate for Xen 4.14. Without it, =
a user will not be<br>
&gt; &gt; &gt; &gt;&gt; able to use all the RAM on the Raspberry Pi 4.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; This series has only be slighlty tested. I would ap=
preciate more test on<br>
&gt; &gt; &gt; &gt;&gt; the Rasbperry Pi 4 to confirm this removing the res=
triction.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Julien,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; could you post a git branch somewhere? I can try this o=
n my rpi4 that<br>
&gt; &gt; &gt; &gt; already runs 4.13.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have pushed a branch based on unstable and the v2 of the s=
eries:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; git://<a href=3D"http://xenbits.xen.org/people/julieng/xen-u=
nstable.git" rel=3D"noreferrer noreferrer" target=3D"_blank">xenbits.xen.or=
g/people/julieng/xen-unstable.git</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; branch arm-dma/v2<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve updated my image I built with<br>
&gt; &gt; <a href=3D"https://github.com/tklengyel/xen-rpi4-builder" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://github.com/tklengyel/xen-r=
pi4-builder</a> a while ago and I&#39;ve<br>
&gt; &gt; defined 2048m as total_mem and Xen seems to be booting fine and p=
asses<br>
&gt; &gt; execution to dom0. With 512m being set as the Xen cmdline for dom=
0_mem<br>
&gt; &gt; it was working. When I increased the mem for dom0 the boot is now=
<br>
&gt; &gt; stuck at:<br>
&gt; &gt;<br>
&gt; &gt; [=C2=A0 =C2=A0 1.427788] of_cfs_init<br>
&gt; &gt; [=C2=A0 =C2=A0 1.429667] of_cfs_init: OK<br>
&gt; &gt; [=C2=A0 =C2=A0 1.432561] clk: Not disabling unused clocks<br>
&gt; &gt; [=C2=A0 =C2=A0 1.437239] Waiting for root device /dev/mmcblk0p2..=
.<br>
&gt; &gt; [=C2=A0 =C2=A0 1.451599] mmc1: queuing unknown CIS tuple 0x80 (2 =
bytes)<br>
&gt; &gt; [=C2=A0 =C2=A0 1.458156] mmc1: queuing unknown CIS tuple 0x80 (3 =
bytes)<br>
&gt; &gt; [=C2=A0 =C2=A0 1.464729] mmc1: queuing unknown CIS tuple 0x80 (3 =
bytes)<br>
&gt; &gt; [=C2=A0 =C2=A0 1.472804] mmc1: queuing unknown CIS tuple 0x80 (7 =
bytes)<br>
&gt; &gt; [=C2=A0 =C2=A0 1.479370] mmc1: queuing unknown CIS tuple 0x80 (3 =
bytes)<br>
&gt; &gt; [=C2=A0 =C2=A0 1.546902] random: fast init done<br>
&gt; &gt; [=C2=A0 =C2=A0 1.564590] mmc1: new high speed SDIO card at addres=
s 0001<br>
&gt; &gt;<br>
&gt; &gt; Could this be because the DTB I compiled from a fresh checkout of=
<br>
&gt; &gt; <a href=3D"https://github.com/raspberrypi/linux.git" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/raspberrypi/linux.gi=
t</a> branch rpi-4.19.y whereas the<br>
&gt; &gt; kernel itself is from a checkout ~5 months ago? I guess that must=
 be<br>
&gt; &gt; the cause because even if I decrease the dom0_mem to 512m it stil=
l<br>
&gt; &gt; gets stuck at the same spot whereas it was booting fine before.<b=
r>
&gt;<br>
&gt; Stefano and I are testing the fix right now -- for now just set your<b=
r>
&gt; Dom0 mem to less than 512m.<br>
<br>
Actually seems to work after I recompiled the kernel and reinstalled<br>
all kernel modules. Xen boots with 4gb RAM and dom0 boots with 2g:<br>
<br>
xl info:<br>
...<br>
total_memory=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 3956<br>
free_memory=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 1842<br>
<br>
cat /proc/meminfo<br>
MemTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A0 1963844 kB<br>
<br>
I get an emergency shell during boot on the console complaining about<br>
xenbr0 not coming up but if I just hit continue it boots fine and the<br>
network is up. So AFAICT things are good.<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">What exact version of the kernel a=
re you using and what did you build it from?</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">FWIW: 5.6.x clearly has an issue with DMA.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Roma=
n.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
</blockquote></div></div></div>

--00000000000058d77105a60b28fc--

