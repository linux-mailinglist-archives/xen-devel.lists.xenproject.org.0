Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611E88710E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697018.1088314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhyM-0005Nx-6U; Fri, 22 Mar 2024 16:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697018.1088314; Fri, 22 Mar 2024 16:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhyM-0005LY-3n; Fri, 22 Mar 2024 16:42:26 +0000
Received: by outflank-mailman (input) for mailman id 697018;
 Fri, 22 Mar 2024 16:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3R3m=K4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rnhyK-0005LO-9F
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:42:24 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2798795b-e86b-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 17:42:21 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512b3b04995so1551807e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 09:42:21 -0700 (PDT)
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
X-Inumbo-ID: 2798795b-e86b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711125741; x=1711730541; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xTgT8zP2eQv5Wtx20Sndrdeyr3BrAAr5gt2PSwktbgA=;
        b=c5RHudcK03KkW3F9ETcpNIBhIOY5vVYAUEMmsEpm918Ze4cnKPhXh1T5oruoHackq+
         bBIGNH8Ks+upwpdJIpPqWBpY8goXpWDV5Zcc4aiV7Fs88dpivkH0rfWwTF4G3bIZcyi2
         fY6c+uwTYBAm8azf7kIfLiztsuCu+1rCvG1Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711125741; x=1711730541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTgT8zP2eQv5Wtx20Sndrdeyr3BrAAr5gt2PSwktbgA=;
        b=wb+UvnUeR5+vmCTg3JgpsdBQXE1H3HSNKuJmCNqpVty2UEXc1SQnlOn7cY3jSqdT+b
         +g5Ftv6qOjvsN7PVtnDxQm8AdeTp732E0t4ujsWNMqWJ7aIkSqPimYGbKqIcbjn4E1wG
         92Yz7JvS5t+DpGnuomS/h+NVxpVV1by0ayxCWWgWXgus2AlpLzrBKD3jLj2koBt+Jn+q
         sXLuIx2dipDMNvQ1gQmILjt6UJXNOIdsxznm+AjCeUHxsgxO47Q/hisZ595O6yIaiTUS
         VrHIRUr51OsU98Cfvk65rBOyF8dEDqx9OaQtotLJGwBzE1UVjYcNXx6cUpf9nmheKs23
         tBaA==
X-Gm-Message-State: AOJu0Yw38WFEcs8CtR69hovVY2yLzVXSxu+sr+VrciUV5Av0rotuWM/a
	YTRDDv6knjJxzRq0Gt0HgGfC942A5+yfAHQOcwnEmEoXs9d4OrM+kkh9DEa6CG5MevjhZ9bEWIs
	Y3xGKAgttlimfLdSz5gi1wkL4wPIhOmaxZlHD6g==
X-Google-Smtp-Source: AGHT+IGpXUrDjdbG7vxAAS7FIolkeW4/+cbNkjFUmdGHjl6DCIawvBDiii616A3W4fqh1srOxhMInNtFe5IhIk21BE4=
X-Received: by 2002:a19:ae05:0:b0:513:c4b8:388b with SMTP id
 f5-20020a19ae05000000b00513c4b8388bmr2060156lfc.27.1711125741182; Fri, 22 Mar
 2024 09:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com> <ZcqoVBnsgUJw8G0l@mattapan.m5p.com>
 <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
In-Reply-To: <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 22 Mar 2024 16:41:45 +0000
Message-ID: <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
Subject: Re: Serious AMD-Vi(?) issue
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="000000000000f847740614428159"

--000000000000f847740614428159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Elliott,

I hope you're well.

I'm Kelly, the community manager at the Xen Project.

I can see you've recently engaged with our community with some issues you'd
like help with.
We love the fact you are participating in our project, however, our
developers aren't able to help if you do not provide the specific details.

As an open-source project, our developers are committed to helping and
contributing as much as possible. We welcome you to continue participating,
however, please refrain from requesting help without providing the
necessary details as this takes up a lot of our community's time to analyze
what is possible and what assistance you might need.

I'd recommend providing logs or specific information so the community can
help you further.

If you'd like to chat more, let me know.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Mar 18, 2024 at 7:42=E2=80=AFPM Elliott Mitchell <ehem+xen@m5p.com>=
 wrote:

> I sent a ping on this about 2 weeks ago.  Since the plan is to move x86
> IOMMU under general x86, the other x86 maintainers should be aware of
> this:
>
> On Mon, Feb 12, 2024 at 03:23:00PM -0800, Elliott Mitchell wrote:
> > On Thu, Jan 25, 2024 at 12:24:53PM -0800, Elliott Mitchell wrote:
> > > Apparently this was first noticed with 4.14, but more recently I've
> been
> > > able to reproduce the issue:
> > >
> > > https://bugs.debian.org/988477
> > >
> > > The original observation features MD-RAID1 using a pair of Samsung
> > > SATA-attached flash devices.  The main line shows up in `xl dmesg`:
> > >
> > > (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000
> flags 0x8 I
> > >
> > > Where the device points at the SATA controller.  I've ended up
> > > reproducing this with some noticable differences.
> > >
> > > A major goal of RAID is to have different devices fail at different
> > > times.  Hence my initial run had a Samsung device plus a device from
> > > another reputable flash manufacturer.
> > >
> > > I initially noticed this due to messages in domain 0's dmesg about
> > > errors from the SATA device.  Wasn't until rather later that I notice=
d
> > > the IOMMU warnings in Xen's dmesg (perhaps post-domain 0 messages
> should
> > > be duplicated into domain 0's dmesg?).
> > >
> > > All of the failures consistently pointed at the Samsung device.  Due =
to
> > > the expectation it would fail first (lower quality offering with
> > > lesser guarantees), I proceeded to replace it with a NVMe device.
> > >
> > > With some monitoring I discovered the NVMe device was now triggering
> > > IOMMU errors, though not nearly as many as the Samsung SATA device di=
d.
> > > As such looks like AMD-Vi plus MD-RAID1 appears to be exposing some
> sort
> > > of IOMMU issue with Xen.
> > >
> > >
> > > All I can do is offer speculation about the underlying cause.  There
> > > does seem to be a pattern of higher-performance flash storage devices
> > > being more severely effected.
> > >
> > > I was speculating about the issue being the MD-RAID1 driver abusing
> > > Linux's DMA infrastructure in some fashion.
> > >
> > > Upon further consideration, I'm wondering if this is perhaps a latenc=
y
> > > issue.  I imagine there is some sort of flush after the IOMMU tables
> are
> > > modified.  Perhaps the Samsung SATA (and all NVMe) devices were tryin=
g
> to
> > > execute commands before reloading the IOMMU tables is complete.
> >
> > Ping!
> >
> > The recipe seems to be Linux MD RAID1, plus Samsung SATA or any NVMe.
> >
> > To make it explicit, when I tried Crucial SATA + Samsung SATA.  IOMMU
> > errors matched the Samsung SATA (a number of times the SATA driver
> > complained).
> >
> > As stated, I'm speculating lower latency devices starting to execute
> > commands before IOMMU tables have finished reloading.  When originally
> > implemented fast flash devices were rare.
>
> Both reproductions of this issue I'm aware of were on systems with AMD
> processors.  I'm doubtul suspicion of flash storage hardware is unique
> to owners of AMD systems.  As a result while this /could/ also effect
> Intel systems, the lack of reports /suggests/ otherwise.
>
> I've noticed two things when glancing at the original report.  LVM is not
> in use here, so that doesn't seem to effect the problem.  The Phenom II
> the original reporter tested as not having the issue might have lacked
> proper BIOS support, hence IOMMU not being functional.
>
> This being a latency issue is *speculation*, but would explain the
> pattern of devices being effected.
>
> This is rather serious as it can lead to data loss (phew!  glad I just
> barely dodged this outcome).
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
>

--000000000000f847740614428159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0<span class=3D"gmail-il">Elliott<=
/span>,<div><br></div><div>I hope you&#39;re well.=C2=A0</div><div><br></di=
v><div>I&#39;m Kelly, the community manager at the Xen Project.=C2=A0</div>=
<div><br></div><div>I can see you&#39;ve recently engaged with our communit=
y with some issues you&#39;d like help with.</div><div>We love the fact you=
 are participating in our project, however, our developers aren&#39;t able =
to help if you do not provide the specific details.=C2=A0</div><div><br></d=
iv><div>As an open-source project, our developers are committed to helping =
and contributing as much as possible. We welcome you to continue participat=
ing, however, please refrain from requesting help without providing the nec=
essary details as this takes up a lot of our community&#39;s time to analyz=
e what is possible and what assistance you might need.=C2=A0</div><div><br>=
</div><div>I&#39;d recommend providing logs or specific information so the =
community can help you further.</div><div><br></div><div>If you&#39;d like =
to chat more, let me know.</div><div><br></div><div><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Cho=
i</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community =
Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></d=
iv></div></div></div></div><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Mar 18, 2024 at 7:42=E2=80=AFPM Elli=
ott Mitchell &lt;<a href=3D"mailto:ehem%2Bxen@m5p.com">ehem+xen@m5p.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I se=
nt a ping on this about 2 weeks ago.=C2=A0 Since the plan is to move x86<br=
>
IOMMU under general x86, the other x86 maintainers should be aware of<br>
this:<br>
<br>
On Mon, Feb 12, 2024 at 03:23:00PM -0800, Elliott Mitchell wrote:<br>
&gt; On Thu, Jan 25, 2024 at 12:24:53PM -0800, Elliott Mitchell wrote:<br>
&gt; &gt; Apparently this was first noticed with 4.14, but more recently I&=
#39;ve been<br>
&gt; &gt; able to reproduce the issue:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://bugs.debian.org/988477" rel=3D"noreferrer" tar=
get=3D"_blank">https://bugs.debian.org/988477</a><br>
&gt; &gt; <br>
&gt; &gt; The original observation features MD-RAID1 using a pair of Samsun=
g<br>
&gt; &gt; SATA-attached flash devices.=C2=A0 The main line shows up in `xl =
dmesg`:<br>
&gt; &gt; <br>
&gt; &gt; (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????00=
0 flags 0x8 I<br>
&gt; &gt; <br>
&gt; &gt; Where the device points at the SATA controller.=C2=A0 I&#39;ve en=
ded up<br>
&gt; &gt; reproducing this with some noticable differences.<br>
&gt; &gt; <br>
&gt; &gt; A major goal of RAID is to have different devices fail at differe=
nt<br>
&gt; &gt; times.=C2=A0 Hence my initial run had a Samsung device plus a dev=
ice from<br>
&gt; &gt; another reputable flash manufacturer.<br>
&gt; &gt; <br>
&gt; &gt; I initially noticed this due to messages in domain 0&#39;s dmesg =
about<br>
&gt; &gt; errors from the SATA device.=C2=A0 Wasn&#39;t until rather later =
that I noticed<br>
&gt; &gt; the IOMMU warnings in Xen&#39;s dmesg (perhaps post-domain 0 mess=
ages should<br>
&gt; &gt; be duplicated into domain 0&#39;s dmesg?).<br>
&gt; &gt; <br>
&gt; &gt; All of the failures consistently pointed at the Samsung device.=
=C2=A0 Due to<br>
&gt; &gt; the expectation it would fail first (lower quality offering with<=
br>
&gt; &gt; lesser guarantees), I proceeded to replace it with a NVMe device.=
<br>
&gt; &gt; <br>
&gt; &gt; With some monitoring I discovered the NVMe device was now trigger=
ing<br>
&gt; &gt; IOMMU errors, though not nearly as many as the Samsung SATA devic=
e did.<br>
&gt; &gt; As such looks like AMD-Vi plus MD-RAID1 appears to be exposing so=
me sort<br>
&gt; &gt; of IOMMU issue with Xen.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; All I can do is offer speculation about the underlying cause.=C2=
=A0 There<br>
&gt; &gt; does seem to be a pattern of higher-performance flash storage dev=
ices<br>
&gt; &gt; being more severely effected.<br>
&gt; &gt; <br>
&gt; &gt; I was speculating about the issue being the MD-RAID1 driver abusi=
ng<br>
&gt; &gt; Linux&#39;s DMA infrastructure in some fashion.<br>
&gt; &gt; <br>
&gt; &gt; Upon further consideration, I&#39;m wondering if this is perhaps =
a latency<br>
&gt; &gt; issue.=C2=A0 I imagine there is some sort of flush after the IOMM=
U tables are<br>
&gt; &gt; modified.=C2=A0 Perhaps the Samsung SATA (and all NVMe) devices w=
ere trying to<br>
&gt; &gt; execute commands before reloading the IOMMU tables is complete.<b=
r>
&gt; <br>
&gt; Ping!<br>
&gt; <br>
&gt; The recipe seems to be Linux MD RAID1, plus Samsung SATA or any NVMe.<=
br>
&gt; <br>
&gt; To make it explicit, when I tried Crucial SATA + Samsung SATA.=C2=A0 I=
OMMU<br>
&gt; errors matched the Samsung SATA (a number of times the SATA driver<br>
&gt; complained).<br>
&gt; <br>
&gt; As stated, I&#39;m speculating lower latency devices starting to execu=
te<br>
&gt; commands before IOMMU tables have finished reloading.=C2=A0 When origi=
nally<br>
&gt; implemented fast flash devices were rare.<br>
<br>
Both reproductions of this issue I&#39;m aware of were on systems with AMD<=
br>
processors.=C2=A0 I&#39;m doubtul suspicion of flash storage hardware is un=
ique<br>
to owners of AMD systems.=C2=A0 As a result while this /could/ also effect<=
br>
Intel systems, the lack of reports /suggests/ otherwise.<br>
<br>
I&#39;ve noticed two things when glancing at the original report.=C2=A0 LVM=
 is not<br>
in use here, so that doesn&#39;t seem to effect the problem.=C2=A0 The Phen=
om II<br>
the original reporter tested as not having the issue might have lacked<br>
proper BIOS support, hence IOMMU not being functional.<br>
<br>
This being a latency issue is *speculation*, but would explain the<br>
pattern of devices being effected.<br>
<br>
This is rather serious as it can lead to data loss (phew!=C2=A0 glad I just=
<br>
barely dodged this outcome).<br>
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
<br>
</blockquote></div></div>

--000000000000f847740614428159--

