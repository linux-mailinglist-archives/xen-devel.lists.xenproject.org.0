Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3F48127D2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 07:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654296.1021051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDf1D-0006bD-9i; Thu, 14 Dec 2023 06:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654296.1021051; Thu, 14 Dec 2023 06:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDf1D-0006Yi-70; Thu, 14 Dec 2023 06:16:23 +0000
Received: by outflank-mailman (input) for mailman id 654296;
 Thu, 14 Dec 2023 06:16:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6sbk=HZ=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1rDf1C-0006YX-0U
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 06:16:22 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c3d2aef-9a48-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 07:16:20 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-551f9ca15b4so1948520a12.1; 
 Wed, 13 Dec 2023 22:16:20 -0800 (PST)
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
X-Inumbo-ID: 4c3d2aef-9a48-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702534580; x=1703139380; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gD7tgxieDWSt+YW9XTmJUznY3tyvy/E6VKbPWapcg5o=;
        b=O48vzIag6zmZKgF8U0+qNCkp9DzP3rBKb4IaclFFqE4wWOvCriq0Mmr8N+OWz8CBNX
         QBC0F0Jr/MzSbHtL9xdN7M23G4L9LHGyrt/jT+ltuI+AuBBML+Qmag3eON66Js9lY2Sh
         9bLA8oHUREUSQ0XoT9lYseIursAXX//82OlCqar+Z1l039fvCJZT8CWcpLQtf6F+Cgcy
         vW5yuZ1/h5NftShw0nUDsxXHGoUeuZIHB6aULUYquHEvB/fuePAjSO0k5g/ikdeTt3CP
         p0EJx/jy14/U7rC2oUI1jDpQ+luNPkkrdNqdrc878VrC09h+ApCUvIlGWPc4uNDHLFzb
         e67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702534580; x=1703139380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gD7tgxieDWSt+YW9XTmJUznY3tyvy/E6VKbPWapcg5o=;
        b=h+MNt4/e1kjyEiWWs4vEaIV/0xO3ZvknaIL0p1zWypri96OUqGsTvT2DeYQv3h2KnZ
         klici9dDy2OeXTrdIQWzTDWb+M5+Cmo4QNiNlyO15w9zRAPYHN57LZViDouMDLgUg9HD
         ogS3nBUWk4WOAx0lhz8b1jHjgVyFWSwVg+WskCNbgj6uWWPnveXIfy6L1WcHRhPnZIzU
         MR07oV+Qi+Ct2cO25+mHEXpqwMjryCbdjtqI2Br7cd1q+FLg2vc9zBYqqd0Vh6oc3Hk5
         bqtwxGZFitWgJwpM0Q1o3yrEHh3pvhW7UNLIbX5f7pSeN+PCGNp9lNCbHbnukfXd3Lkh
         waIw==
X-Gm-Message-State: AOJu0Yzufc6uiRB9EqSfUvOLrtG/R4JLSz/LmMIAZhsKpQy3nT63eiAF
	yO8uJuE35fDEYYgIqKqHrHJsia3EaccTuMFI+Vc=
X-Google-Smtp-Source: AGHT+IGp3ZrTN7VXz2ByAqHrggKslDSNkeVMphZYr2XmgXifM8Z7MvQXaInYTbJhF2W+en/rvsdUAaCOIzRmsnBHArE=
X-Received: by 2002:a17:906:212:b0:a1b:e1bc:73e3 with SMTP id
 18-20020a170906021200b00a1be1bc73e3mr5024862ejd.24.1702534579570; Wed, 13 Dec
 2023 22:16:19 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
 <300b7e2b-068a-4cac-a617-ae41caa6d3b9@netscape.net> <CA+1FSiiuWz_91Wg3Az440nFKaLY_raoUy=3nGj4Zca8viKAT=Q@mail.gmail.com>
 <0bf311bb-435a-4c5d-a36c-8cfe95f92f98@netscape.net> <ZXoboEVx1jzIgrvJ@mattapan.m5p.com>
In-Reply-To: <ZXoboEVx1jzIgrvJ@mattapan.m5p.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 14 Dec 2023 07:15:45 +0100
Message-ID: <CA+1FSihCUR2Sh9T+Kfw2LWHHiHVkmy1ohWZuFQPcNtcfzOVt6A@mail.gmail.com>
Subject: Re: xc_dom_guest_type: image not capable of booting inside a HV M
 container: Invalid kernel
To: Elliott Mitchell <ehem+freebsd@m5p.com>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>, Anthony Perard <anthony.perard@citrix.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, xen-users-request@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="000000000000d54ba6060c723821"

--000000000000d54ba6060c723821
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Elliott.

In my experiment I've used FreeBSD 13.2-RELEASE. Do you think that it will
work if I use a previous version,let's say 12.04 ?

On Wed, Dec 13, 2023 at 10:01=E2=80=AFPM Elliott Mitchell <ehem+freebsd@m5p=
.com>
wrote:

> On Mon, Dec 11, 2023 at 01:41:21PM -0500, Chuck Zmudzinski wrote:
> > On 12/11/2023 12:59 PM, Mario Marietto wrote:
> > > root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-=
xen/kernel
> # file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel
> > >
> > > ELF 32-bit LSB executable,ARM, EABI5 version 1 (FreeBSD), dynamically
> linked, interpreter /red/herring,
> BuildID[sha1]=3D5e6982c9cb67d9c94571b76419142a8c495388d0, for FreeBSD 13.=
2,
> not stripped
> > >
> > > root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-=
xen/kernel
> # file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.=
bin
> > >
> > > kernel.bin: data
> >
> > This needs to be :
> >
> > kernel.bin: Linux kernel ARM boot executable zImage (little-endian)
> >
> > >
> > > It does not boot from the kernel.bin file.
> >
> > I suggest not trying to direct boot a kernel in Xen on arm unless the
> file command reports the kernel image is a Linux kernel ARM boot executab=
le
> zImage (little endian).
> >
> > Did you try applying Julien's patch (link is in my earlier message) to
> add zImage support to FreeBSD? Maybe after applying the patch the
> kernel.bin file will be in the correct zImage format.
> >
> > The patch I linked in the earlier
>
> Appears FreeBSD-CURRENT removed the last step converting the kernel file
> to kernel.bin.  The patch can be readily rebased, but without kernel.bin
> that doesn't do too much.  (hmm, see if that can be tracked down...)
>
>
> A bigger issue is this approach is a maintenance nightmare.  Updating
> the kernel requires action from outside the VM.
>
> As such, Anthony Perard would there be any hope for Tianocore/EDK2
> gaining support for ARMv6/v7?  The delta should be pretty small.
>
>
> --
> (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)_=
__/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>
>
>

--=20
Mario.

--000000000000d54ba6060c723821
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Elliott.</div><div><br></div><div></div><div>In=
 my experiment I&#39;ve used FreeBSD 13.2-RELEASE. Do you think that it wil=
l work if I use a previous version,let&#39;s say 12.04 ?<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, D=
ec 13, 2023 at 10:01=E2=80=AFPM Elliott Mitchell &lt;<a href=3D"mailto:ehem=
%2Bfreebsd@m5p.com">ehem+freebsd@m5p.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, Dec 11, 2023 at 01:41:21PM =
-0500, Chuck Zmudzinski wrote:<br>
&gt; On 12/11/2023 12:59 PM, Mario Marietto wrote:<br>
&gt; &gt; root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/b=
oot-xen/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boo=
t-xen/kernel/kernel<br>
&gt; &gt; <br>
&gt; &gt; ELF 32-bit LSB executable,ARM, EABI5 version 1 (FreeBSD), dynamic=
ally linked, interpreter /red/herring, BuildID[sha1]=3D5e6982c9cb67d9c94571=
b76419142a8c495388d0, for FreeBSD 13.2, not stripped<br>
&gt; &gt; <br>
&gt; &gt; root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/b=
oot-xen/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boo=
t-xen/kernel/kernel.bin<br>
&gt; &gt; <br>
&gt; &gt; kernel.bin: data=C2=A0<br>
&gt; <br>
&gt; This needs to be :<br>
&gt; <br>
&gt; kernel.bin: Linux kernel ARM boot executable zImage (little-endian)<br=
>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; It does not boot from the kernel.bin file.<br>
&gt; <br>
&gt; I suggest not trying to direct boot a kernel in Xen on arm unless the =
file command reports the kernel image is a Linux kernel ARM boot executable=
 zImage (little endian).<br>
&gt; <br>
&gt; Did you try applying Julien&#39;s patch (link is in my earlier message=
) to add zImage support to FreeBSD? Maybe after applying the patch the kern=
el.bin file will be in the correct zImage format.<br>
&gt; <br>
&gt; The patch I linked in the earlier <br>
<br>
Appears FreeBSD-CURRENT removed the last step converting the kernel file<br=
>
to kernel.bin.=C2=A0 The patch can be readily rebased, but without kernel.b=
in<br>
that doesn&#39;t do too much.=C2=A0 (hmm, see if that can be tracked down..=
.)<br>
<br>
<br>
A bigger issue is this approach is a maintenance nightmare.=C2=A0 Updating<=
br>
the kernel requires action from outside the VM.<br>
<br>
As such, Anthony Perard would there be any hope for Tianocore/EDK2<br>
gaining support for ARMv6/v7?=C2=A0 The delta should be pretty small.<br>
<br>
<br>
-- <br>
(\___(\___(\______=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --=3D&gt; 8-) EHM &lt;=
=3D--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ______/)___/)___/)<br>
=C2=A0\BS (=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mail=
to:ehem%2Bsigmsg@m5p.com" target=3D"_blank">ehem+sigmsg@m5p.com</a>=C2=A0 P=
GP 87145445=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 )=C2=A0 =C2=A0/=
<br>
=C2=A0 \_CS\=C2=A0 =C2=A0|=C2=A0 _____=C2=A0 -O #include &lt;stddisclaimer.=
h&gt; O-=C2=A0 =C2=A0_____=C2=A0 |=C2=A0 =C2=A0/=C2=A0 _/<br>
8A19\___\_|_/58D2 7E3D DDF4 7BA6 &lt;-PGP-&gt; 41D1 B375 37D0 8714\_|_/___/=
5445<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000d54ba6060c723821--

