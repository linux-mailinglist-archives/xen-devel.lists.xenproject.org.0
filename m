Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DA22B65C1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29000.58155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf1WU-0005AH-Hu; Tue, 17 Nov 2020 13:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29000.58155; Tue, 17 Nov 2020 13:59:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf1WU-00059r-Dm; Tue, 17 Nov 2020 13:59:54 +0000
Received: by outflank-mailman (input) for mailman id 29000;
 Tue, 17 Nov 2020 13:59:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+iwA=EX=gmail.com=cheyenne.wills@srs-us1.protection.inumbo.net>)
 id 1kf1WS-00059l-6t
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 13:59:52 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5e28589-3ff6-4f1b-9a01-4ce72a185146;
 Tue, 17 Nov 2020 13:59:51 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r17so24348921ljg.5
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 05:59:50 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+iwA=EX=gmail.com=cheyenne.wills@srs-us1.protection.inumbo.net>)
	id 1kf1WS-00059l-6t
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 13:59:52 +0000
X-Inumbo-ID: d5e28589-3ff6-4f1b-9a01-4ce72a185146
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5e28589-3ff6-4f1b-9a01-4ce72a185146;
	Tue, 17 Nov 2020 13:59:51 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r17so24348921ljg.5
        for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLxTs81IMFYS+U+UnWAMUUJ68TsI2YJnY5VDUgFiRp4=;
        b=E6ko0QC/vUOhYYS3XdqNiGCgMUephFjKk5AoFMfgVk6wDTyWIBmqqe0kjwNDE7EFCq
         rYCXjj91RB4scOkummpLfb0KFEaFHhrM/nOWCXM3/YV2vk4eRspJTmAxMwIj03x/ojjv
         iv6d0elpEWxm976Uw6/CQWW51udnsdd12ecA23GZy8O/tvJ/wraSj1TjXhmht1x4AlfJ
         4/MStOWiJcIJoArg1thepPFJL0rgqmJtZal+7aXIIMvTO3pCzZ2AUxGe1UmgUrmlK4JP
         jduuPmToqbANvPAEFCHVjKNsMhPEI9qiJ0mJQJCIkQ+3tRCPMZGlJMAnyt5gjzR9d7xw
         FfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLxTs81IMFYS+U+UnWAMUUJ68TsI2YJnY5VDUgFiRp4=;
        b=oaoMQkRXumaAwdKusYlU8J7cXoNUAXn+4Px+xEkolsOC3xklr6sNJoWOC2OLBWuV54
         e0gC6GI7WZGz2n+ptJpIABulmwPhMByn9VeeMNX0oLSsVfnbYmJX/4HvcqlZHgMYNVah
         vjtzB84RH/PACZ1bOI7A/3Xx2Jd9dZ6nsRmr0vbPftbnJbx4cb7DFHhb5h6BH6AFNie0
         AAy9DTfYrk/7M3oV/DZQf/jd60P/U6l6UK2TvppYcGCnf+FEsjxu7NK4y1TOzXb0LtpY
         f9r9LFle8K5u6qkTY+xwSy5Z7p0LagA8a9iFRGOSzErLsy4f0EPRRxTM8Cog4DHzYu66
         gqiQ==
X-Gm-Message-State: AOAM531AHOHDjk3LWD1TtBANfHI2wYNasagQZGhzlrJfcWCxaROn0o4h
	EYbZ72KUJFrCZMziMnCvK8Yx+wLKt4zm4omc3CQ=
X-Google-Smtp-Source: ABdhPJxqDhrmluXbeB0n7wHzje+Yewx5nqXEoRWHRhOHPvShvQL4VaUZLHsqb43XYvBEZnSGbfE6stYmN0g/itTS9YQ=
X-Received: by 2002:a2e:9005:: with SMTP id h5mr1756200ljg.59.1605621589775;
 Tue, 17 Nov 2020 05:59:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <20201117105039.mpfrnwvojpmfaopx@Air-de-Roger> <20201117125407.66xb3uuil3g4t6ek@Air-de-Roger>
In-Reply-To: <20201117125407.66xb3uuil3g4t6ek@Air-de-Roger>
From: Cheyenne Wills <cheyenne.wills@gmail.com>
Date: Tue, 17 Nov 2020 06:59:39 -0700
Message-ID: <CAHpsFVdSRr=R1dP2Gn_Efr5ijvoUV44Rcjgz6eOfSZVrkYxbOg@mail.gmail.com>
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000008098a405b44de831"

--0000000000008098a405b44de831
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. I will have to re-upgrade my xen system to collect the additional info
from the panic, so it will be later today before I can reply with all the
info.

On Tue, Nov 17, 2020, 5:54 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:

> On Tue, Nov 17, 2020 at 11:50:39AM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Nov 16, 2020 at 02:57:14PM -0700, Cheyenne Wills wrote:
> > > Running Xen with XSA-351 is causing Solaris 11 systems to panic durin=
g
> > > boot.  The panic screen is showing the failure to be coming from
> > > "unix:rdmsr".  The panic occurs with existing guests (booting off a
> disk)
> > > and the  booting from an install ISO image.
> > >
> > > I discussed the problem with "andyhhp__" in the "#xen" IRC channel an=
d
> he
> > > requested that I report it here.
> > >
> > > This was failing on a Xen 4.13 and a Xen 4.14 system built via gentoo=
.
> > >
> > > I understand that ultimately this is a bug in Solaris.  However it do=
es
> > > impact existing guests that were functional before applying the XSA-3=
51
> > > security patches.
> >
> > I seem to have some issues getting the Solaris 11.4 ISO to boot, which =
I
> > think are unrelated to the MSR changes. I get what seems to be a panic
> > just after the Copyright message, but there's no reason printed at all
> > about the panic. The message just reads (transcript):
> >
> > SunOS Release 5.11 Version 11.4.0.15.0 64-bit
> > Copyright (c) 1983, 2018, Oracle and/or it's affiliates. All right
> reserved.
> > System would not fast reboot because:
> >  newkernel not valid
> >  fastreboot_onpanic is not set
> >  ...
> >
> > The config file I'm using is:
> >
> > memory=3D1024
> > vcpus=3D4
> > name=3D"solaris"
> >
> > builder=3D"hvm"
> >
> > disk =3D [
> >
>  'format=3Draw,vdev=3Dhdc,access=3Dro,devtype=3Dcdrom,target=3D/root/sol-=
11_4-text-x86.iso',
> >   'format=3Draw,vdev=3Dhda,access=3Drw,target=3D/root/solaris.img',
> > ]
> >
> > vif =3D [
> >  'mac=3D00:16:3E:74:3d:88,bridge=3Dbridge0',
> > ]
> >
> > vnc=3D1
> > vnclisten=3D"0.0.0.0"
> >
> > serial=3D'pty'
> >
> > on_crash=3D"preserve"
> >
> > Is there anything I'm missing?
>
> OK, it seems like Solaris requires more than 1GB of memory in order to
> boot. I've increased it to 4GB and I've been able to boot successfully
> up to the installer.
>
> I'm however able to boot up to the installer screen without any
> crashes, so I guess the version I'm using (11.4.0.15.0) is already
> fixed?
>
> Can you paste which version of Solaris you are using and if possible
> where I can find the installer media to reproduce?
>
> Thanks, Roger.
>

--0000000000008098a405b44de831
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes. I will have to re-upgrade my xen system to collect t=
he additional info from the panic, so it will be later today before I can r=
eply with all the info.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Nov 17, 2020, 5:54 AM Roger Pau Monn=C3=A9 &=
lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Tue, Nov 17, 2020 at 11:50:3=
9AM +0100, Roger Pau Monn=C3=A9 wrote:<br>
&gt; On Mon, Nov 16, 2020 at 02:57:14PM -0700, Cheyenne Wills wrote:<br>
&gt; &gt; Running Xen with XSA-351 is causing Solaris 11 systems to panic d=
uring<br>
&gt; &gt; boot.=C2=A0 The panic screen is showing the failure to be coming =
from<br>
&gt; &gt; &quot;unix:rdmsr&quot;.=C2=A0 The panic occurs with existing gues=
ts (booting off a disk)<br>
&gt; &gt; and the=C2=A0 booting from an install ISO image.<br>
&gt; &gt; <br>
&gt; &gt; I discussed the problem with &quot;andyhhp__&quot; in the &quot;#=
xen&quot; IRC channel and he<br>
&gt; &gt; requested that I report it here.<br>
&gt; &gt; <br>
&gt; &gt; This was failing on a Xen 4.13 and a Xen 4.14 system built via ge=
ntoo.<br>
&gt; &gt; <br>
&gt; &gt; I understand that ultimately this is a bug in Solaris.=C2=A0 Howe=
ver it does<br>
&gt; &gt; impact existing guests that were functional before applying the X=
SA-351<br>
&gt; &gt; security patches.<br>
&gt; <br>
&gt; I seem to have some issues getting the Solaris 11.4 ISO to boot, which=
 I<br>
&gt; think are unrelated to the MSR changes. I get what seems to be a panic=
<br>
&gt; just after the Copyright message, but there&#39;s no reason printed at=
 all<br>
&gt; about the panic. The message just reads (transcript):<br>
&gt; <br>
&gt; SunOS Release 5.11 Version 11.4.0.15.0 64-bit<br>
&gt; Copyright (c) 1983, 2018, Oracle and/or it&#39;s affiliates. All right=
 reserved.<br>
&gt; System would not fast reboot because:<br>
&gt;=C2=A0 newkernel not valid<br>
&gt;=C2=A0 fastreboot_onpanic is not set<br>
&gt;=C2=A0 ...<br>
&gt; <br>
&gt; The config file I&#39;m using is:<br>
&gt; <br>
&gt; memory=3D1024<br>
&gt; vcpus=3D4<br>
&gt; name=3D&quot;solaris&quot;<br>
&gt; <br>
&gt; builder=3D&quot;hvm&quot;<br>
&gt; <br>
&gt; disk =3D [<br>
&gt;=C2=A0 =C2=A0&#39;format=3Draw,vdev=3Dhdc,access=3Dro,devtype=3Dcdrom,t=
arget=3D/root/sol-11_4-text-x86.iso&#39;,<br>
&gt;=C2=A0 =C2=A0&#39;format=3Draw,vdev=3Dhda,access=3Drw,target=3D/root/so=
laris.img&#39;,<br>
&gt; ]<br>
&gt; <br>
&gt; vif =3D [<br>
&gt;=C2=A0 &#39;mac=3D00:16:3E:74:3d:88,bridge=3Dbridge0&#39;,<br>
&gt; ]<br>
&gt; <br>
&gt; vnc=3D1<br>
&gt; vnclisten=3D&quot;0.0.0.0&quot;<br>
&gt; <br>
&gt; serial=3D&#39;pty&#39;<br>
&gt; <br>
&gt; on_crash=3D&quot;preserve&quot;<br>
&gt; <br>
&gt; Is there anything I&#39;m missing?<br>
<br>
OK, it seems like Solaris requires more than 1GB of memory in order to<br>
boot. I&#39;ve increased it to 4GB and I&#39;ve been able to boot successfu=
lly<br>
up to the installer.<br>
<br>
I&#39;m however able to boot up to the installer screen without any<br>
crashes, so I guess the version I&#39;m using (11.4.0.15.0) is already<br>
fixed?<br>
<br>
Can you paste which version of Solaris you are using and if possible<br>
where I can find the installer media to reproduce?<br>
<br>
Thanks, Roger.<br>
</blockquote></div>

--0000000000008098a405b44de831--

