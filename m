Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E9FA310
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 03:07:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUi1s-000840-Mk; Wed, 13 Nov 2019 02:05:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0j9=ZF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iUi1r-00083G-Cd
 for xen-devel@lists.xen.org; Wed, 13 Nov 2019 02:05:07 +0000
X-Inumbo-ID: 0276c23c-05ba-11ea-b678-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0276c23c-05ba-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 02:05:05 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b20so539105lfp.4
 for <xen-devel@lists.xen.org>; Tue, 12 Nov 2019 18:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HKhKPeQTB/s/lTFad7kNWt4/7y0GjH/e73SshJXfqo=;
 b=Ly8ubupvA7HSdJ96ThXpV65j/OW4/ZMGK9BU9MGSZAxi9O24zA2iNePtxDYlRmx3ez
 AccmpU0bUHRcohQ57bBfqGH78/4CyqNZqpUH64IEOcZsZXC9VoEsCJ8yxwU7rFk9fpcj
 1emuy2IqLwVmIIQloX0Ak/RXjUcXK4DF0wzJ+nu01NMYqmfbn6tSz/Fiymnbbbuuvm55
 YGDNmqkQjekkAhV7phqePdL5eniN8ZcrzC33VDcXCO93pw6cY7aXYmFEikrXb9idKeKZ
 eADmEhQMPHNVpU5okJ8r6JfH8kKqAxIjielz/RIx98FrLFaDlSUm0nt72GQ8aQDfAy4C
 9Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HKhKPeQTB/s/lTFad7kNWt4/7y0GjH/e73SshJXfqo=;
 b=FEJUsvP437AIqXA+vUD3b81IGCoUjqxpsc/KqYn3ig9YKCIBuRj7NVFh4cLPOnX0dk
 Ugm1nw2HAeg2K503JzcUeG/M5X/rQHAJvXzs0Z9M94BwfCpTwHav8fo30zNCBG3qxJGE
 RZRPfLPPqkb3nW8bpB6xLdZ6YpSGZSDi9HkLd0Kl1fcO6ZCgG8EQYgI+NT3nk/8ClV1h
 nNVAsObnObSyaINXoaPbjeOxT1+RVbAezm8oEcvzdekWPm8BQ09bFsCCU/WPAcrmqKFY
 b5SojnM/9rHCkC1JrSGhtyP+JuasMMNriWfkd9QgMbrMkQ5SjUoIqNfuYQUZwGCyYu1u
 xV0Q==
X-Gm-Message-State: APjAAAXqGCutgtP/8FP6z5zWzJKE0/Us6yvKFMl81RDSgMouw7Ux5sGb
 BUj3tLpY1uAicQHpo3jnzWYGR8hZSvklrQLWBNA=
X-Google-Smtp-Source: APXvYqwfF0Aa3P+EsmtDJdXE2RaKPJANq44dO5fn73EcqxUv/0YxSyCWqPVur20RVy56dezS272BpmsNTF1UF4K7JUc=
X-Received: by 2002:ac2:430d:: with SMTP id l13mr616520lfh.114.1573610704699; 
 Tue, 12 Nov 2019 18:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0TPPzSCMBHsR9e2A1Qvpsrk_K7tqfcKTUYYcTq84hA+Q@mail.gmail.com>
 <e9b952a3-a5af-c3a9-db95-4feb8cebe803@arm.com>
In-Reply-To: <e9b952a3-a5af-c3a9-db95-4feb8cebe803@arm.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 13 Nov 2019 11:03:42 +0900
Message-ID: <CAJ=z9a07O=z4a3zXSiVEN23js51XkiHq0ZHexEB3x=gUgdbp5Q@mail.gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============5446006481996285611=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5446006481996285611==
Content-Type: multipart/alternative; boundary="0000000000001187df059730cb5d"

--0000000000001187df059730cb5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Nov 2019, 10:55 Andr=C3=A9 Przywara, <andre.przywara@arm.com> wr=
ote:

> On 13/11/2019 01:08, Julien Grall wrote:
>
> Hi,
>
> > On Tue, 12 Nov 2019, 04:01 Stefano Stabellini, <sstabellini@kernel.org
> > <mailto:sstabellini@kernel.org>> wrote:
> >
> >     On Sat, 9 Nov 2019, Julien Grall wrote:
> >     > On Sat, 9 Nov 2019, 04:27 Stefano Stabellini,
> >     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> >     >       On Thu, 7 Nov 2019, Peng Fan wrote:
> >     >       > The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
> >     >       >
> >     >       > Signed-off-by: Peng Fan <peng.fan@nxp.com
> >     <mailto:peng.fan@nxp.com>>
> >     >
> >     >       Reviewed-by: Stefano Stabellini <sstabellini@kernel.org
> >     <mailto:sstabellini@kernel.org>>
> >     >
> >     >
> >     > To be honest, I am not sure the code is correct. A read to those
> >     registers should tell you the list of interrupts active. As we alwa=
ys
> >     > return 0, this will not return the correct state of the GIC.
> >     >
> >     > I know that returning the list of actives interrupts is
> >     complicated with the old vGIC, but I don't think silently ignoring
> >     it is a good
> >     > idea.
> >     > The question here is why the guest accessed those registers? What
> >     is it trying to figure out?
> >
> >     We are not going to solve the general problem at this stage. At the
> >     moment the code:
> >
> >     - ignore the first register only
> >     - print an error and return an IO_ABORT error for the other regs
> >
> >     For the inconsistency alone the second option is undesirable. Also =
it
> >     doesn't match the write implementation, which does the same thing f=
or
> >     all the GICD_ISACTIVER* regs instead of having a special treatment
> for
> >     the first one only. It looks like a typo in the original patch to m=
e.
> >
> >     The proposed patch switches the behavior to:
> >
> >     - silently ignore all the GICD_ISACTIVER* regs (as proposed)
> >
> >
> >     is an improvement.
> >
> >
> > Peng mentioned that Linux is accessing it, so the worst thing we can do
> > is lying to the guest (as you suggest here). I would definitely not cal=
l
> > that an improvement.
>
> The ISACTIVER range is wrong in the description, it covers only one
> register, not multiple. This is obviously a typo, since it's correct in
> both GICv2 and in the high level switch/case in GICv3. Reading from
> outside of any range will inject an abort into the guest, which runs in
> kernel space. This will probably result in a guest crash. I would
> consider not crashing an improvement.
>

It is not. Neither the current approach to silently doing it.


> About "lying" to the guest: Typically an IRQ is just active for a very
> short time, so 0 is a very good answer, actually.


So why does Linux is checking it? What will happen if there were actually
an active interrupt but don't report it?

The old VGIC in KVM
> did exactly the same:
>         vgic_reg_access(mmio, NULL, offset,
>                         ACCESS_READ_RAZ | ACCESS_WRITE_IGNORED);
>
> The proper solution would be:
> 1) Track the state of the active bit when we can observe it, so when the
> guest exits with an active IRQ. The new VGIC does that.
> 2) Kick out all VCPUs that have IRQs in that given rank, and sample the
> active bit from the LRs. Sounds pretty horrible, and chances are very
> high you will get all 0s there.
>
> So if I compare "fix those two typos and preserve the state that the Xen
> VGIC has been in for years" to "create a lot of racy code for a rare
> corner case", the first one surely wins.
> That doesn't mean we should never try it, but surely this fix needs to
> go in meanwhile.
>

I don't believe this patch to go in is the correct solution not from a
technical PoV but to get things properly fixed.


> > In the current state, it is a Nack. If there were a warning, then I
> > would be more inclined to see this patch going through.
>
> Do you mean a warning that we are about to lie to the guest? That sounds
> pretty useless, since nobody can do anything about it. Plus we have
> already those warnings on writing to these registers, and this always
> confuses people and triggered pointless bug reports.
>

Well, the warning has the benefits to annoy people. If we do it silently,
then we don't encourage to fix it.


> I think the old VGIC has bigger problems ;-)
>

I agree, but nobody seems to be willing to fix it... My only leverage here
is pushing for a warning to annoy the user.

So I maintain my request for a warning.

Cheers,


> Cheers,
> Andre
>

--0000000000001187df059730cb5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 13 Nov 2019, 10:55 Andr=C3=A9 Przywara, &lt;<a=
 href=3D"mailto:andre.przywara@arm.com">andre.przywara@arm.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On 13/11/2019 01:08, Julien Gral=
l wrote:<br>
<br>
Hi,<br>
<br>
&gt; On Tue, 12 Nov 2019, 04:01 Stefano Stabellini, &lt;<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@ker=
nel.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
 rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Sat, 9 Nov 2019, Julien Grall wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Sat, 9 Nov 2019, 04:27 Stefano Stabellini,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:sstabellini@kernel.org" targe=
t=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a> &lt;mailto:<a hr=
ef=3D"mailto:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer">s=
stabellini@kernel.org</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 7 Nov 2019, =
Peng Fan wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The end should =
be GICD_ISACTIVERN not GICD_ISACTIVER.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: =
Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=3D"_blank" rel=3D"n=
oreferrer">peng.fan@nxp.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:peng.fan@nxp.com" targ=
et=3D"_blank" rel=3D"noreferrer">peng.fan@nxp.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Reviewed-by: Stefano=
 Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
 rel=3D"noreferrer">sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; To be honest, I am not sure the code is correc=
t. A read to those<br>
&gt;=C2=A0 =C2=A0 =C2=A0registers should tell you the list of interrupts ac=
tive. As we always<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; return 0, this will not return the correct sta=
te of the GIC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I know that returning the list of actives inte=
rrupts is<br>
&gt;=C2=A0 =C2=A0 =C2=A0complicated with the old vGIC, but I don&#39;t thin=
k silently ignoring<br>
&gt;=C2=A0 =C2=A0 =C2=A0it is a good<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; idea.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The question here is why the guest accessed th=
ose registers? What<br>
&gt;=C2=A0 =C2=A0 =C2=A0is it trying to figure out?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We are not going to solve the general problem at th=
is stage. At the<br>
&gt;=C2=A0 =C2=A0 =C2=A0moment the code:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- ignore the first register only<br>
&gt;=C2=A0 =C2=A0 =C2=A0- print an error and return an IO_ABORT error for t=
he other regs<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For the inconsistency alone the second option is un=
desirable. Also it<br>
&gt;=C2=A0 =C2=A0 =C2=A0doesn&#39;t match the write implementation, which d=
oes the same thing for<br>
&gt;=C2=A0 =C2=A0 =C2=A0all the GICD_ISACTIVER* regs instead of having a sp=
ecial treatment for<br>
&gt;=C2=A0 =C2=A0 =C2=A0the first one only. It looks like a typo in the ori=
ginal patch to me.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The proposed patch switches the behavior to:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- silently ignore all the GICD_ISACTIVER* regs (as =
proposed)<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0is an improvement.<br>
&gt; <br>
&gt; <br>
&gt; Peng mentioned that Linux is accessing it, so the worst thing we can d=
o<br>
&gt; is lying to the guest (as you suggest here). I would definitely not ca=
ll<br>
&gt; that an improvement.<br>
<br>
The ISACTIVER range is wrong in the description, it covers only one<br>
register, not multiple. This is obviously a typo, since it&#39;s correct in=
<br>
both GICv2 and in the high level switch/case in GICv3. Reading from<br>
outside of any range will inject an abort into the guest, which runs in<br>
kernel space. This will probably result in a guest crash. I would<br>
consider not crashing an improvement.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It is not. Neither the current approa=
ch to silently doing it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
About &quot;lying&quot; to the guest: Typically an IRQ is just active for a=
 very<br>
short time, so 0 is a very good answer, actually. </blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">So why does Linux is checking=
 it? What will happen if there were actually an active interrupt but don&#3=
9;t report it?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">The old VGIC in KVM<br>
did exactly the same:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vgic_reg_access(mmio, NULL, offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ACCESS_READ_RAZ | ACCESS_WRITE_IGNORED);<br>
<br>
The proper solution would be:<br>
1) Track the state of the active bit when we can observe it, so when the<br=
>
guest exits with an active IRQ. The new VGIC does that.<br>
2) Kick out all VCPUs that have IRQs in that given rank, and sample the<br>
active bit from the LRs. Sounds pretty horrible, and chances are very<br>
high you will get all 0s there.<br>
<br>
So if I compare &quot;fix those two typos and preserve the state that the X=
en<br>
VGIC has been in for years&quot; to &quot;create a lot of racy code for a r=
are<br>
corner case&quot;, the first one surely wins.<br>
That doesn&#39;t mean we should never try it, but surely this fix needs to<=
br>
go in meanwhile.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I don&#39;t believe this patch to go in is the correct solu=
tion not from a technical PoV but to get things properly fixed.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
&gt; In the current state, it is a Nack. If there were a warning, then I<br=
>
&gt; would be more inclined to see this patch going through.<br>
<br>
Do you mean a warning that we are about to lie to the guest? That sounds<br=
>
pretty useless, since nobody can do anything about it. Plus we have<br>
already those warnings on writing to these registers, and this always<br>
confuses people and triggered pointless bug reports.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Well, the warning has t=
he benefits to annoy people. If we do it silently, then we don&#39;t encour=
age to fix it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I think the old VGIC has bigger problems ;-)<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I agree, but nobody seems to be=
 willing to fix it... My only leverage here is pushing for a warning to ann=
oy the user.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So I mainta=
in my request for a warning.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
Andre<br>
</blockquote></div></div></div>

--0000000000001187df059730cb5d--


--===============5446006481996285611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5446006481996285611==--

