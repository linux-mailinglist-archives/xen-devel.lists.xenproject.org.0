Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72720301634
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 16:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73321.132175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3KfA-00039v-As; Sat, 23 Jan 2021 15:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73321.132175; Sat, 23 Jan 2021 15:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3KfA-00039K-5v; Sat, 23 Jan 2021 15:17:20 +0000
Received: by outflank-mailman (input) for mailman id 73321;
 Sat, 23 Jan 2021 14:34:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KE1E=G2=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l3JzL-0007cP-3e
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 14:34:07 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 696fc18a-729d-4c0a-9e54-cba26cdc7e1e;
 Sat, 23 Jan 2021 14:34:06 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m22so11593993lfg.5
 for <xen-devel@lists.xenproject.org>; Sat, 23 Jan 2021 06:34:06 -0800 (PST)
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
X-Inumbo-ID: 696fc18a-729d-4c0a-9e54-cba26cdc7e1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vq6kPYlikt5c54dPlfFz69BtcD4+1/xpcEkQHIf81pg=;
        b=qvE6tSH3+dLTeFMQqYvmEGUbngTVIojZ2NDgvm4iphj/cb+jeeR243B+/ib2NsOuVP
         OBjJOuqid1EE6cWb7u9ilbjlltN183Qba2cdoNZ4zeA5F7N6UFWA+BHqX8RVpP5qNU2c
         uIaK3o4m+WeszBsMeqbt6tpOMAWdkw0qWzJAnh9D2Nxfg8rIs2Y1J9ctgpePk5JHLFr5
         jJ4JZ7qNmvv3y/Man5Q0MjIlYavNOJIBHLqetp1nmjhn1v7B3b+nngzRfSeTidKIwT25
         kE7OEuyX5fSShS25rR0DQ5wl9btJHEE4uHXYjJeErIn5Lqeuzp6xG726Dt6z/+Bf9aF5
         8Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vq6kPYlikt5c54dPlfFz69BtcD4+1/xpcEkQHIf81pg=;
        b=ZvOWpJGD+DT4/8n1EoM/ZDGaGrr7/sOpX5+urr9gV/h5rk7hxvW3ZYWqJzz1D8X44+
         8UyuwmN8Hgv4RF4iu8Zje2gOIcDl7I7LIy2OLEHgwSQwFkteytCmueCL/117e2vvqQ2K
         0GPdzxxVkrfTMPGcDeR72FfhGu68ItpYzN0pXEyc7p2+8/DnqQkVVJZxRgMzm8KcU3p3
         K5omNC3ovpuFy2oXl2+1vRU3kMrYnA8tXYO9MYwSuzS3bLaBHPP3JeDbbtufD2JXYRM7
         mf2kQpN7U29dVKVa4CyEx/+QpXPlmfLC++pyLaavg0yLz5mTA9+k8eX5p6w6WJclOnpS
         0t3A==
X-Gm-Message-State: AOAM533Xb81PhBcIt30IWhXnBH+K0JEguxgkYLv8uT4hQpQ9e+igv85q
	GRRUrYHEFnb7M//drxAUggzAV102t/0wmm3Nfx2qD50btNriKM1s
X-Google-Smtp-Source: ABdhPJxLntw8eL48mWNfCrlXiArOnxKJS581hyjn+KCd5jnQW9D3CJGBjI3vUZ+7HTxn69UZnyw4dC4ywxsn+1aafd0=
X-Received: by 2002:a19:d611:: with SMTP id n17mr344578lfg.494.1611412444871;
 Sat, 23 Jan 2021 06:34:04 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAMmSBy9i7Ci98zd-NHs_KSRPwQq4mweBLOd__t=jQncXVYA5sw@mail.gmail.com>
In-Reply-To: <CAMmSBy9i7Ci98zd-NHs_KSRPwQq4mweBLOd__t=jQncXVYA5sw@mail.gmail.com>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Date: Sat, 23 Jan 2021 16:33:54 +0200
Message-ID: <CAFnJQOo_o+zN-A=Wx1mOiCso3Lc6zY-GKiuxUpe5Ey567Eb7=w@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="0000000000005d117e05b99232cd"

--0000000000005d117e05b99232cd
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 23, 2021 at 3:00 AM Roman Shaposhnik <roman@zededa.com> wrote:

> On Fri, Jan 22, 2021 at 4:27 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > + xen-devel, Roman,
> >
> >
> > On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> > > Hi Stefano,
> > > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on
> mobile platforms. One of our HW that we use on development is
> > > Raspberry Pi 4B. I wonder if you could help me a bit :).
> > >
> > > I'm trying to enable the GPU with Xen + Raspberry Pi for dom0.
> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> > >
> > > I got so far that GPU drivers are loaded (v3d & vc4) without errors.
> But now Xen returns error when X is starting:
> > > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70
> gva=0x7f7f817000 gpa=0x0000401315d000
> > >  I tried to debug what causes this and looks like find_mmio_handler
> cannot find handler.
> > > (See more here:
> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
> )
> > >
> > > Any ideas why the handler is not found?
> >
> >
> > Hi Jukka,
> >
> > I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
> > haven't tried the GPU yet, I have been using the serial only.
> > Roman, did you ever get the GPU working?
>
> I've never tested it with X -- sorry. But I have to ask what kernel is
> being
> used? It made a lot of difference for me to actually STOP using RPi
> supplied kernels and switch directly to 5.10.7.
>
I'm using rpi-5.9.y -branch from https://github.com/raspberrypi/linux.
I tried to use rpi-5.10.y but with that raspberry is not booting up.

-- 
Br,
Jukka Kaartinen

--0000000000005d117e05b99232cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 23, 2021 at 3:00 AM Roman=
 Shaposhnik &lt;<a href=3D"mailto:roman@zededa.com">roman@zededa.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri,=
 Jan 22, 2021 at 4:27 PM Stefano Stabellini<br>
&lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a>&gt; wrote:<br>
&gt;<br>
&gt; + xen-devel, Roman,<br>
&gt;<br>
&gt;<br>
&gt; On Fri, 22 Jan 2021, Jukka Kaartinen wrote:<br>
&gt; &gt; Hi Stefano,<br>
&gt; &gt; I&#39;m Jukka Kaartinen a SW developer working on enabling hyperv=
isors on mobile platforms. One of our HW that we use on development is<br>
&gt; &gt; Raspberry Pi 4B. I wonder if you could help me a bit :).<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m trying to enable the GPU with Xen + Raspberry Pi for dom0=
. <a href=3D"https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&amp;t=
=3D232323#p1797605" rel=3D"noreferrer" target=3D"_blank">https://www.raspbe=
rrypi.org/forums/viewtopic.php?f=3D63&amp;t=3D232323#p1797605</a><br>
&gt; &gt;<br>
&gt; &gt; I got so far that GPU drivers are loaded (v3d &amp; vc4) without =
errors. But now Xen returns error when X is starting:<br>
&gt; &gt; (XEN) traps.c:1986:d0v1 HSR=3D0x93880045 pc=3D0x00007f97b14e70 gv=
a=3D0x7f7f817000 gpa=3D0x0000401315d000<br>
&gt; &gt;=C2=A0 I tried to debug what causes this and looks like find_mmio_=
handler cannot find handler.<br>
&gt; &gt; (See more here: <a href=3D"https://www.raspberrypi.org/forums/vie=
wtopic.php?f=3D63&amp;t=3D232323&amp;start=3D25#p1801691" rel=3D"noreferrer=
" target=3D"_blank">https://www.raspberrypi.org/forums/viewtopic.php?f=3D63=
&amp;t=3D232323&amp;start=3D25#p1801691</a> )<br>
&gt; &gt;<br>
&gt; &gt; Any ideas why the handler is not found?<br>
&gt;<br>
&gt;<br>
&gt; Hi Jukka,<br>
&gt;<br>
&gt; I am glad to hear that you are interested in Xen on RaspberryPi :-)=C2=
=A0 I<br>
&gt; haven&#39;t tried the GPU yet, I have been using the serial only.<br>
&gt; Roman, did you ever get the GPU working?<br>
<br>
I&#39;ve never tested it with X -- sorry. But I have to ask what kernel is =
being<br>
used? It made a lot of difference for me to actually STOP using RPi<br>
supplied kernels and switch directly to 5.10.7.<br></blockquote><div>I&#39;=
m using=C2=A0rpi-5.9.y -branch from=C2=A0<a href=3D"https://github.com/rasp=
berrypi/linux">https://github.com/raspberrypi/linux</a>.</div><div>I tried =
to use rpi-5.10.y but with that raspberry is not booting up.</div><div><br>=
</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Br,</div><div>Jukka Kaartinen</div></div></div></div>

--0000000000005d117e05b99232cd--

