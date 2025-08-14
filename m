Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D2B25D5D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080909.1441078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSQA-0000tX-MF; Thu, 14 Aug 2025 07:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080909.1441078; Thu, 14 Aug 2025 07:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSQA-0000s1-JA; Thu, 14 Aug 2025 07:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1080909;
 Thu, 14 Aug 2025 07:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGif=22=gmail.com=florian.heigl@srs-se1.protection.inumbo.net>)
 id 1umSQ8-0000rj-Oh
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:30:44 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 938788e1-78e0-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 09:30:40 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4b109912545so7601891cf.0; 
 Thu, 14 Aug 2025 00:30:39 -0700 (PDT)
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
X-Inumbo-ID: 938788e1-78e0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755156638; x=1755761438; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EjPfvm8P8nhJ3Rz6Mq1SB0p4rDkQmHdsC2mJIbarucc=;
        b=UAJopP7sKmS1otZiEc7U+yFhbpvreskwLYwcpHVPXAotadl3b73FWtr5l+oCZXyixY
         q6pd5QxzNebilZ2JfHH3X9fp4dYlQkSrdW+F84ovsBRtTdvFfRdquet83znjI34REseY
         1M/AZcTnmndfFNzzyA+LR3MLSjfQi7kGu3syeqIYyArZtFlHVE81s3W+uYdrk8A+luOw
         AJ6UT5LnbxclidP50IuV5/b9dUNw4f0iJDMqY3PvIyMDqRnux6Tvc6H7cxC2zyTZSnjL
         6XrsXai2GTxrCSj0ifVAZlBDPqtJy5ktiLkGcNmPFglYaW/2XK8hhsBNT3N+YT9BoNvZ
         GGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156638; x=1755761438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjPfvm8P8nhJ3Rz6Mq1SB0p4rDkQmHdsC2mJIbarucc=;
        b=CYtR+PTONDSJmicAlGr9iqPeaJrt/i1eqAXJ42+HaenstvrXfUMswhBLY0XMwC/otW
         jPa2c1ctxn/maLVTJtcr7XN5FN2vmkYAnvEfKSC3wr0pmeaOFAGpTqBD50nuoqYzgCJQ
         sGJjgaakDPdEs5MqMo8MHVrs12i867YHkgps/3p0N9WZhTCguj+u8Q06S2hv2kFlyfQ9
         l91dc1X9DGAt7XbXO5hR8F4hz+hjUooAUMlNfQqp0Cf4DF5lv3LhWZgPMWEDHPaEUnwT
         A5faJWj5oOln39g4ZItb47lIiNTqzaGgN4vJsByHL5lU4cO/ErUSbqCQPK9n8QpPf/P1
         mpuA==
X-Forwarded-Encrypted: i=1; AJvYcCVL9WcE1N4T7ZZBdiAIuPI0j/QljzflXqBO6ZO1nPkrre0vVVeRl9Swumf8VsuOlcghAIo6DAkztb57@lists.xenproject.org, AJvYcCWNO6NqGTRlZuw/BhP49chzozsszcYyNtq7Z+Yb6qLYHlaZ71OdWqpO0ilCYVLVlf1SpOojGaxMqC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztOwBv8pG5HxMkBWpefaO2QV1SPGMWLk7g45K/twjLKr4Tt+ts
	X+7SBxtfnTvIXsFAkweOZpLWRFlttYrJ2MsZ1FjTDZJ1hWGOWv7OijGfKt0kJIe8q9IWlEKMUuo
	Rg07sUf4Sz3FN0tb4uJAre/UgUi1qfFE=
X-Gm-Gg: ASbGncsi425VyvXlHQqaLUhEYHjEGM6l17FXRARZr2+msA+REVHvyU09fbDZiZpiJmB
	t/LFCe1Rjk7ei4z8OyfKtG9RDIj0Vhnq0Y0jfU/k9iIs2QKYICzewFMk+vIp+S7WGe86HeJsJC+
	hD1EftwRq0WN5eh45vSKdTm6zHi2OnVY3U5O5TcSYWOsknzFK+dtrPNkWkVNYv+/dBAoFXccsf6
	f2EPZo09u8U/HaHc0zxUCtu9cTGZ6btAXDmX85h
X-Google-Smtp-Source: AGHT+IEOOnIR5xh0H/YVGTrI3HJpTxvCb14vAQo5pTVhgzJxEVqD1OVsD2nxr8wdBGwNBqGlu8P1r2AVJSVusyQtrTo=
X-Received: by 2002:a05:622a:cf:b0:4ab:9335:7af4 with SMTP id
 d75a77b69052e-4b10a9199admr25469131cf.2.1755156638478; Thu, 14 Aug 2025
 00:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de> <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
In-Reply-To: <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
From: Florian Heigl <florian.heigl@gmail.com>
Date: Thu, 14 Aug 2025 09:30:26 +0200
X-Gm-Features: Ac12FXw8v4wTQerYESma1v7aAuTHK6ARn31LZ-Lgjkv5RqFJq2mVFrE4hIu-kYU
Message-ID: <CAFivhPnfoDvZVh6i-=HOJCU6PwLEFyzAsdRJfqmzPq-L79hUEw@mail.gmail.com>
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
To: Jan Beulich <jbeulich@suse.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, Xen-users <xen-users@lists.xenproject.org>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Paul Leiber <paul@onlineschubla.de>
Content-Type: multipart/alternative; boundary="000000000000f63b05063c4e3f20"

--000000000000f63b05063c4e3f20
Content-Type: text/plain; charset="UTF-8"

Jan Beulich <jbeulich@suse.com> schrieb am Do., 14. Aug. 2025, 08:55:

> On 06.08.2025 06:30, Elliott Mitchell wrote:
> > On Tue, Jul 01, 2025 at 10:01:13PM +0200, Paul Leiber wrote:
> >>
> >> Unfortunately, I don't have a direct answer to the question (as is so
> often
> >> the case, due to my limited knowledge and experience). However, I am
> >> successfully running Xen on a RPi 4 (mostly, except for some VLAN
> related
> >> networking issues).
> >>
> >> I used instructions in [1] to install vanilla Debian on the RPi,
> including
> >> UEFI boot and grub. I then compiled Xen with expert options and ACPI
> >> enabled.
> >>
> >> I don't know if there are better solutions. For example, I suffer from
> the
> >> fact that I2C doesn't work when using UEFI boot on a RPi.
>

Snipped:
Xen panicking on a $100 platform that is the planet wide reference for
commodity/community SBC.
Reported by someone with just questions and an obvious suggestion to maybe
move things forward.

>>> I'm certain I'm missing something, but before I delve deeper, I just
> >>> wanted to ask if this is a known issue, and if so, are there any
> >>> workarounds or solutions available for this?
> >>>
> >>> Any help about this is highly appreciated!
> >>>
> >>> Thanks and Best regards,
> >>> Sumit.
> >>>
> >>> [1]:  https://github.com/raspberrypi/linux rpi-6.12.y branch
> >>> [2]: git://xenbits.xen.org/xen.git - main branch
> >>> [3] xen-troops https://github.com/xen-troops/xen - rpi5_dev branch
> >>> [4]: https://github.com/u-boot/u-boot.git master branch
> >
> > Ultimately Debian is choosing to leave most defaults alone.  So far
>
[...]

> > I'm unsure of the likelihood of getting the Debian maintainers to
> > override the default.  Yet due being by far the simplest way to install
> > Debian and Xen on a very common ARM64 platform, perhaps the Xen
> > developers should consider changing?
>
> In an open source project everyone is a developer. There is a
> significant amount of work someone needs to pick up to change this
> SUPPORT.md entry:
>
> ### Host ACPI (via Domain 0)
>
>     Status, x86 PV: Supported
>     Status, ARM: Experimental
>
> Parties interested in changing the support status of any component are the
> primary candidates to actually carry out the necessary work.
>
> Jan
>

The wording matters, experimental tells a different story of status and
ownership and activity.
It implies someone has brought it that far and wishes for experimenting and
feedback.
It implies that the experiment is ongoing.
It implies that good results would be noted and then it's likely that its
brought to a supported state.
It implies someone is looking at the results.

It's not sufficient to just tell someone "yeah if you care you're in the
best position to change that support status".
That status was written there and summarised based on certain criteria
which are historically a problem. How many xen/arm versions were there?
Mips? How many IB implementations, how many FT clones, how many versions of
whatever piece in the project.
Many parties have cared and contributed stuff that didn't ever get anywhere
because they were never told what other steps they need to take or that
there's simply not enough people around to review those 100k lines of
whatever.

As long as theres no better insight than experimental no experimenting
party can know if someone else is working on their issue other than them
asking here.
Telling them hey, actually that's YOU and your BEST approach is to be or
wait for someone with the resources to change this, oh BTW, really massive
tasks situation.

Some examples for what we could have named things over the last 20 years
Experimental with no HCL or near term roadmap. Experimental drop with no
current activity
Experimental, stale
Experimental with assumption to later integrate
Experimental and tentative, will be proceed only with other partes
involvement
Experimental, waiting for feedback
Experimental, lacking hw support

Be honest and be kind to people that try to fix one little piece when
you're sitting on a pile of broken castles. If everyone is a developer we
ought to enable everyone to help.

I'm gonna unsubscribe at last. I'm old and it gets too repetitive.

Flo


--

>


the purpose of libvirt is to provide an abstraction layer hiding all xen
features added since 2006 until they were finally understood and copied by
the kvm devs.

>

--000000000000f63b05063c4e3f20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div><br></div><div><br></div><div data-smartmail=3D=
"gmail_signature"><br></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">Jan Beulich &lt;<a href=3D"mail=
to:jbeulich@suse.com">jbeulich@suse.com</a>&gt; schrieb am Do., 14. Aug. 20=
25, 08:55:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 06=
.08.2025 06:30, Elliott Mitchell wrote:<br>
&gt; On Tue, Jul 01, 2025 at 10:01:13PM +0200, Paul Leiber wrote:<br>
&gt;&gt;<br>
&gt;&gt; Unfortunately, I don&#39;t have a direct answer to the question (a=
s is so often<br>
&gt;&gt; the case, due to my limited knowledge and experience). However, I =
am<br>
&gt;&gt; successfully running Xen on a RPi 4 (mostly, except for some VLAN =
related<br>
&gt;&gt; networking issues).<br>
&gt;&gt;<br>
&gt;&gt; I used instructions in [1] to install vanilla Debian on the RPi, i=
ncluding<br>
&gt;&gt; UEFI boot and grub. I then compiled Xen with expert options and AC=
PI<br>
&gt;&gt; enabled.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t know if there are better solutions. For example, I suf=
fer from the<br>
&gt;&gt; fact that I2C doesn&#39;t work when using UEFI boot on a RPi.=C2=
=A0<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Snipped:</div><div dir=3D"auto"></div><div dir=3D"auto">Xen panicking on=
 a $100 platform that is the planet wide reference for commodity/community =
SBC.</div><div dir=3D"auto">Reported by someone with just questions and an =
obvious suggestion to maybe move things forward.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;&gt; I&#39;m certain I&#39;m missing something, but before I delve =
deeper, I just<br>
&gt;&gt;&gt; wanted to ask if this is a known issue, and if so, are there a=
ny<br>
&gt;&gt;&gt; workarounds or solutions available for this?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Any help about this is highly appreciated!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks and Best regards,<br>
&gt;&gt;&gt; Sumit.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1]:=C2=A0 <a href=3D"https://github.com/raspberrypi/linux" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/raspberryp=
i/linux</a> rpi-6.12.y branch<br>
&gt;&gt;&gt; [2]: git://<a href=3D"http://xenbits.xen.org/xen.git" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">xenbits.xen.org/xen.git</a> - main =
branch<br>
&gt;&gt;&gt; [3] xen-troops <a href=3D"https://github.com/xen-troops/xen" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/xen-troop=
s/xen</a> - rpi5_dev branch<br>
&gt;&gt;&gt; [4]: <a href=3D"https://github.com/u-boot/u-boot.git" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://github.com/u-boot/u-boot.gi=
t</a> master branch<br>
&gt; <br>
&gt; Ultimately Debian is choosing to leave most defaults alone.=C2=A0 So f=
ar=C2=A0<br></blockquote></div></div><div dir=3D"auto">[...]</div><div dir=
=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; I&#39;m unsure of the likelihood of getting the Debian maintainers to<=
br>
&gt; override the default.=C2=A0 Yet due being by far the simplest way to i=
nstall<br>
&gt; Debian and Xen on a very common ARM64 platform, perhaps the Xen<br>
&gt; developers should consider changing?<br>
<br>
In an open source project everyone is a developer. There is a<br>
significant amount of work someone needs to pick up to change this<br>
SUPPORT.md entry:<br>
<br>
### Host ACPI (via Domain 0)<br>
<br>
=C2=A0 =C2=A0 Status, x86 PV: Supported<br>
=C2=A0 =C2=A0 Status, ARM: Experimental<br>
<br>
Parties interested in changing the support status of any component are the<=
br>
primary candidates to actually carry out the necessary work.<br>
<br>
Jan<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">The wording matters, experimental tells a different story of status and =
ownership and activity.</div><div dir=3D"auto">It implies someone has broug=
ht it that far and wishes for experimenting and feedback.</div><div dir=3D"=
auto">It implies that the experiment is ongoing.</div><div dir=3D"auto">It =
implies that good results would be noted and then it&#39;s likely that its =
brought to a supported state.</div><div dir=3D"auto">It implies someone is =
looking at the results.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
It&#39;s not sufficient to just tell someone &quot;yeah if you care you&#39=
;re in the best position to change that support status&quot;.</div><div dir=
=3D"auto">That status was written there and summarised based on certain cri=
teria which are historically a problem. How many xen/arm versions were ther=
e? Mips? How many IB implementations, how many FT clones, how many versions=
 of whatever piece in the project.</div><div dir=3D"auto">Many parties have=
 cared and contributed stuff that didn&#39;t ever get anywhere because they=
 were never told what other steps they need to take or that there&#39;s sim=
ply not enough people around to review those 100k lines of whatever.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">As long as theres no better in=
sight than experimental no experimenting party can know if someone else is =
working on their issue other than them asking here.</div><div dir=3D"auto">=
Telling them hey, actually that&#39;s YOU and your BEST approach is to be o=
r wait for someone with the resources to change this, oh BTW, really massiv=
e tasks situation.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Some examples for what we could have named things over the last 20 years</=
div><div dir=3D"auto">Experimental with no HCL or near term roadmap. Experi=
mental drop with no current activity=C2=A0</div><div dir=3D"auto">Experimen=
tal, stale</div><div dir=3D"auto">Experimental with assumption to later int=
egrate</div><div dir=3D"auto">Experimental and tentative, will be proceed o=
nly with other partes involvement=C2=A0</div><div dir=3D"auto">Experimental=
, waiting for feedback</div><div dir=3D"auto">Experimental, lacking hw supp=
ort</div><div dir=3D"auto"><br></div><div dir=3D"auto">Be honest and be kin=
d to people that try to fix one little piece when you&#39;re sitting on a p=
ile of broken castles. If everyone is a developer we ought to enable everyo=
ne to help.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m gonn=
a unsubscribe at last. I&#39;m old and it gets too repetitive.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Flo</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">--</div><div dir=3D"auto"><d=
iv class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">t=
he purpose of libvirt is to provide an abstraction layer hiding all xen fea=
tures added since 2006 until they were finally understood and copied by the=
 kvm devs.</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_con=
tainer"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></di=
v></div></div>

--000000000000f63b05063c4e3f20--

