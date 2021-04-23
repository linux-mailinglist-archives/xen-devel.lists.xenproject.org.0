Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC07436935B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116351.222082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvtV-00067i-17; Fri, 23 Apr 2021 13:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116351.222082; Fri, 23 Apr 2021 13:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvtU-00067J-U8; Fri, 23 Apr 2021 13:30:52 +0000
Received: by outflank-mailman (input) for mailman id 116351;
 Fri, 23 Apr 2021 13:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfSa=JU=gmail.com=zaytsevgu@srs-us1.protection.inumbo.net>)
 id 1lZvtS-00067E-Id
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 13:30:50 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 864be813-29c8-400d-8190-250e47f8ced6;
 Fri, 23 Apr 2021 13:30:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g8so77613121lfv.12
 for <xen-devel@lists.xen.org>; Fri, 23 Apr 2021 06:30:49 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 864be813-29c8-400d-8190-250e47f8ced6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2diCxYQLzVRB2YkMNKUTd4ZRrUjQDrcMGT48yjVpfqI=;
        b=a3urx/0Dv2zccl4T7MohpfgvHRcm6y+VhuKEOyAXgQR5T9+biDEa1NYQqeEkEUYQEg
         zV2+wg2J+2u7TEZDQFooKbhbEzfy7xZzioZMUtPp/i1qS3BB/VWNwqbOlT1DgMPBUwHD
         dic3yvDzL6PpPJso9v0MSEtp0NkJw+iUAaRHUTl0wWRX++CBDBckN+NbFDY81TbD9XOV
         MDmXtpXyzm0CbY6VeOXIXW/VHVwhYJafSUuP8jTN3MHmR8xNoHJVfxMBUaUjXe0BO7Z2
         IODN+pT1jen8ezelxdwMYsakkxK+oc6lu8R3z8c6oClEhdHi7N8XKXscVmmb39hfwrQm
         HagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2diCxYQLzVRB2YkMNKUTd4ZRrUjQDrcMGT48yjVpfqI=;
        b=SAX6wrvJ159RxYRjA/WmFBtkB3As9G/HkcBhLNPLwH8nuoqRGMQryeEReFhr/jFLsJ
         PWH3q50k3a+tz3hi2HkcAeUilU07lHZYvct0hqx/FDvyn1EKBViFxgB5Glf8XR19dxNl
         dfjQNYgxraMray/zVllWVu3QsK8KCJYr2Y1ugPmL9Jdc8Mb01meIEb9awnWHHhiSOSo4
         ben5/O6FSH1Q6bkrX7HBUr6IDQqGaI3ufd1lqL/G9lVOkJRNLN0dFOO8eLMShVnetWlO
         dRdu5gnMSnRBspcAtxixO43bt6BwLgUGRfsOiG9lGBN4z9XczhBaeNN/dv5H9uVtuK9K
         MbuA==
X-Gm-Message-State: AOAM532eBbwVqL90/IrXU/Q4/j3u+UX7ihmzvwlpxd3d+WpUz4qpN80i
	/y/bhBUyfdVMN9bnjnmU+reIo9QeVODJ/qmCK6A=
X-Google-Smtp-Source: ABdhPJz77iI9FT3aGot4giC2mhkCuMZqFsERH98A0heoO8SBeZLkgkXmP3kdWnJ7woEWq9Ut4nRqCl7sTdpsk/4z89Q=
X-Received: by 2002:a05:6512:108a:: with SMTP id j10mr2801378lfg.559.1619184648102;
 Fri, 23 Apr 2021 06:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru> <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
 <57478641-ed64-32bd-a577-428a50c880e2@suse.com> <33f08c57-08f7-b6c3-02ed-2b66c35665f2@list.ru>
 <CADyHojEFuM8mrdyBpQCO+_OJsijfi6nR5YjbHxE3dkTqbAq23Q@mail.gmail.com> <3fa1051f-705c-fdf9-272d-69dd9e7dc01d@suse.com>
In-Reply-To: <3fa1051f-705c-fdf9-272d-69dd9e7dc01d@suse.com>
From: =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JfQsNC50YbQtdCy?= <zaytsevgu@gmail.com>
Date: Fri, 23 Apr 2021 16:30:37 +0300
Message-ID: <CADyHojFyzqRKHp4aWUFysnHbb3i0tMvM6wEAEd8Y1HHwGkncyQ@mail.gmail.com>
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org, Sergey Kovalev <valor@list.ru>
Content-Type: multipart/alternative; boundary="000000000000c6a87d05c0a3cd75"

--000000000000c6a87d05c0a3cd75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, but now I'll need to understand what your quoted "frozen" and
> "unfrozen" mean. Plus obviously comparators and main counter are also
> different, and it's there where I suspect the issue is

"frozen" - this is initial snapshot which takes about from 30 seconds to 1
minute after restore to start dispatching timer interrupts to windows guest
"unfrozen" - this is state which taken after restoring "frozen" one and
waiting 90 seconds when guest start receiving interrupts and starts working
as expected

we also made some another snapshots (again after restoring from initial
"frozen" one) when system still in 'freezed" state (about ~20-30 seconds
from start of restore process) and in this snapshots HPET state stays the
same as in initial "frozen" state except mc64 field:
capabiliy: f424008086a201
res0: 0
config: 3
res1: 0
isr: 0
res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0]
mc64: 9bafb6e4e
res3: 0
timer0:
        config: f0000000002934
        cmp: fd4aa84c
        fsb: 0
        res4: 0
timer1:
        config: f0000000000130
        cmp: ffffffff
        fsb: 0
        res4: 0
timer2:
        config: f0000000000130
        cmp: ffffffff
        fsb: 0
        res4: 0
period[0] =3D ee6b2
period[1] =3D 0
period[2] =3D 0

=D0=BF=D1=82, 23 =D0=B0=D0=BF=D1=80. 2021 =D0=B3. =D0=B2 16:21, Jan Beulich=
 <jbeulich@suse.com>:

> On 23.04.2021 15:10, =D0=93=D0=B5=D0=BE=D1=80=D0=B3=D0=B8=D0=B9 =D0=97=D0=
=B0=D0=B9=D1=86=D0=B5=D0=B2 wrote:
> >>
> >> Since
> >> you've taken apart saved state, could you supply the full set of
> >> values (ideally multiple ones, if you happen to have them, plus
> >> ones where the problem didn't occur, to allow someone perhaps
> >> spot a pattern)?
> >>
> >
> > Here is full HPET state from "frozen" snapshot according to hvm_hw_hpet
> > structure:
> >
> > capabiliy: f424008086a201
> > res0: 0
> > config: 3
> > res1: 0
> > isr: 0
> > res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
,
> 0,
> > 0, 0]
> > mc64: 97b90bc74
> > res3: 0
> > timer0:
> >         config: f0000000002934
> >         cmp: fd4aa84c
> >         fsb: 0
> >         res4: 0
> > timer1:
> >         config: f0000000000130
> >         cmp: ffffffff
> >         fsb: 0
> >         res4: 0
> > timer2:
> >         config: f0000000000130
> >         cmp: ffffffff
> >         fsb: 0
> >         res4: 0
> > period[0] =3D ee6b2
> > period[1] =3D 0
> > period[2] =3D 0
> >
> > This one taken from snapshot of "unfrozen" one:
> >
> > capabiliy: f424008086a201
> > res0: 0
> > config: 3
> > res1: 0
> > isr: 0
> > res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0=
,
> 0,
> > 0, 0]
> > mc64: acbd23c57
> > res3: 0
> > timer0:
> >         config: f000000000293c
> >         cmp: acbd3761b
> >         fsb: 0
> >         res4: 0
> > timer1:
> >         config: f0000000000130
> >         cmp: ffffffff
> >         fsb: 0
> >         res4: 0
> > timer2:
> >         config: f0000000000130
> >         cmp: ffffffff
> >         fsb: 0
> >         res4: 0
> > period[0] =3D ee6b2
> > period[1] =3D 0
> > period[2] =3D 0
> >
> > The only difference is HPET_TN_PERIODIC flag for timers[0].config value
>
> Thanks, but now I'll need to understand what your quoted "frozen" and
> "unfrozen" mean. Plus obviously comparators and main counter are also
> different, and it's there where I suspect the issue is.
>
> Jan
>

--000000000000c6a87d05c0a3cd75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><br></div></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Thanks, but now I&#39;ll need to understand what your quoted &quot;frozen&q=
uot; and<br>
&quot;unfrozen&quot; mean. Plus obviously comparators and main counter are =
also<br>
different, and it&#39;s there where I suspect the issue is

</blockquote><div>&quot;frozen&quot; - this is initial snapshot which takes=
 about from 30 seconds to 1 minute after restore to start dispatching timer=
 interrupts to windows guest</div><div>&quot;unfrozen&quot; - this is state=
 which taken after restoring &quot;frozen&quot; one and waiting 90 seconds =
when guest start receiving interrupts and starts working as expected<br></d=
iv><div><br></div><div>we also made some another snapshots (again after res=
toring from initial &quot;frozen&quot; one) when system still in &#39;freez=
ed&quot; state (about ~20-30 seconds from start of restore process) and in =
this snapshots HPET state stays the same as in initial &quot;frozen&quot; s=
tate except mc64 field:</div><div style=3D"margin-left:40px">capabiliy: f42=
4008086a201<br>res0: 0<br>config: 3<br>res1: 0<br>isr: 0<br>res2: [0, 0, 0,=
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]<br>mc64:=
 9bafb6e4e<br>res3: 0<br>timer0:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 config: f00=
00000002934<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp: fd4aa84c<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fsb: 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 res4: 0<br>timer1:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config: f0000000000130<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cmp: ffffffff<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb: 0<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 res4: 0<br>timer2:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 config: f0=
000000000130<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp: ffffffff<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fsb: 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 res4: 0<br>period[0] =
=3D ee6b2<br>period[1] =3D 0<br>period[2] =3D 0</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 23 =D0=
=B0=D0=BF=D1=80. 2021 =D0=B3. =D0=B2 16:21, Jan Beulich &lt;<a href=3D"mail=
to:jbeulich@suse.com">jbeulich@suse.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 23.04.2021 15:10, =D0=93=D0=B5=D0=BE=D1=
=80=D0=B3=D0=B8=D0=B9 =D0=97=D0=B0=D0=B9=D1=86=D0=B5=D0=B2 wrote:<br>
&gt;&gt;<br>
&gt;&gt; Since<br>
&gt;&gt; you&#39;ve taken apart saved state, could you supply the full set =
of<br>
&gt;&gt; values (ideally multiple ones, if you happen to have them, plus<br=
>
&gt;&gt; ones where the problem didn&#39;t occur, to allow someone perhaps<=
br>
&gt;&gt; spot a pattern)?<br>
&gt;&gt;<br>
&gt; <br>
&gt; Here is full HPET state from &quot;frozen&quot; snapshot according to =
hvm_hw_hpet<br>
&gt; structure:<br>
&gt; <br>
&gt; capabiliy: f424008086a201<br>
&gt; res0: 0<br>
&gt; config: 3<br>
&gt; res1: 0<br>
&gt; isr: 0<br>
&gt; res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, =
0, 0,<br>
&gt; 0, 0]<br>
&gt; mc64: 97b90bc74<br>
&gt; res3: 0<br>
&gt; timer0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config: f0000000002934<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp: fd4aa84c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res4: 0<br>
&gt; timer1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config: f0000000000130<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp: ffffffff<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res4: 0<br>
&gt; timer2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config: f0000000000130<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp: ffffffff<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res4: 0<br>
&gt; period[0] =3D ee6b2<br>
&gt; period[1] =3D 0<br>
&gt; period[2] =3D 0<br>
&gt; <br>
&gt; This one taken from snapshot of &quot;unfrozen&quot; one:<br>
&gt; <br>
&gt; capabiliy: f424008086a201<br>
&gt; res0: 0<br>
&gt; config: 3<br>
&gt; res1: 0<br>
&gt; isr: 0<br>
&gt; res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, =
0, 0,<br>
&gt; 0, 0]<br>
&gt; mc64: acbd23c57<br>
&gt; res3: 0<br>
&gt; timer0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config: f000000000293c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp: acbd3761b<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res4: 0<br>
&gt; timer1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config: f0000000000130<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp: ffffffff<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res4: 0<br>
&gt; timer2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config: f0000000000130<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp: ffffffff<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsb: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res4: 0<br>
&gt; period[0] =3D ee6b2<br>
&gt; period[1] =3D 0<br>
&gt; period[2] =3D 0<br>
&gt; <br>
&gt; The only difference is HPET_TN_PERIODIC flag for timers[0].config valu=
e<br>
<br>
Thanks, but now I&#39;ll need to understand what your quoted &quot;frozen&q=
uot; and<br>
&quot;unfrozen&quot; mean. Plus obviously comparators and main counter are =
also<br>
different, and it&#39;s there where I suspect the issue is.<br>
<br>
Jan<br>
</blockquote></div>

--000000000000c6a87d05c0a3cd75--

