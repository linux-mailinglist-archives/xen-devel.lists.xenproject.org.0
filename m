Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A5A3F239
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 11:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894370.1303092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlQPr-0004Be-8j; Fri, 21 Feb 2025 10:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894370.1303092; Fri, 21 Feb 2025 10:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlQPr-00049y-4B; Fri, 21 Feb 2025 10:37:55 +0000
Received: by outflank-mailman (input) for mailman id 894370;
 Fri, 21 Feb 2025 10:37:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ijj0=VM=gmail.com=adam.qushenghui@srs-se1.protection.inumbo.net>)
 id 1tlQPp-00049s-1w
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 10:37:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5fc67c3-f03f-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 11:37:50 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e04861e7a6so3692601a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 02:37:50 -0800 (PST)
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
X-Inumbo-ID: e5fc67c3-f03f-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740134270; x=1740739070; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gceX4oWOJfrj6yOXMXg7U7IQM22/hfBNd290onKA0GY=;
        b=b6JHwwEoz8EbY+Je6uMy4YncIq5jf/LNQVzTot/6iXeMCCXZE9jk2fxqa8A3l/0GLD
         Ts4jKw35SVE44s39e+lSUwKOZ43SG570GkFiUFeyvrzldHCBYXRFlueaKHsNWWdqh1dP
         H5jj9HnR6bR1pX92E9lDmAMEfUT7Fb26AFdfmMPRXfRVFr4G4mj9CeI9+17fOpjLISQJ
         KnKxisNyivnhW7aFWj8dG/pWKzCaEOjtx+m1DZx1aBhq+dT7W7LOBRAVisV0uojfcOEo
         HaW2ibOTocoDQJqGlKzT8gX4RXZZltlAsw0SnCYWfSinnWC1sdP8eXUAB7D6SYtkBw+l
         GblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740134270; x=1740739070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gceX4oWOJfrj6yOXMXg7U7IQM22/hfBNd290onKA0GY=;
        b=BGqcN47OZiA8poj3VPYnUdGgiywEMT7JfC9/WejdEBNaVXO0miwnSbbXlTD1A3L2Od
         k4MfIeBbpCfc9N9bkN/cK0hudTsbfi84cAblfqB9BwfuDVzoDtu6PW5PNyq97UYzZBK/
         I/bdUWHtuVGntZTQ0ZqNffGaD5s1YYk6VMUKoPhqSngq/sNSysLhNgZRCQ0lcbApur6n
         /KAAJEkOwI15qL2UKbRMRFo8y9Thaxgd7a335Cscr7j0jhIHtIzld7iWZPCFd6t9OCk9
         rYESg6Cdh9GRV/3oMQw1288m9X4YTbRWL8arGQRwEWfTNfRxlInutcNlwtH2lLR0k6MH
         4FhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFvW+BexUMEqETSw3D1DU6nlFWLXL8YlqzoZqvO/ce8VtD0jftiSS7Cb8Jya4SJofHz2QK6O69rd8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSzHGzPm27BEH7GxoX1YZAiqk6h9PG+7eSp6aHcMS+/50TQdCH
	3YRgG9LYaMwhq9VDxmjGGLKxWIrfow+UrZ5fXD5BRbE0UH/UKP3Ahgu6pmdH670I4PVzYC3V643
	0+IbUFHTim//59d8LkCh7RXZdhF8=
X-Gm-Gg: ASbGnct+zm+F9SdoY/0g39Cllb270lL+raA1F2/pycll85PMXngAHHD6ZVQItSbPCEO
	ayoWUHHg6q0kGfxay1jpvoUDbfQLCatXpSWuScvD7XNqhV74yFrjEZBbjDMAz/oX0nu1v00ngeI
	ZfA9CHZs0=
X-Google-Smtp-Source: AGHT+IGXmaCdvhbDIlL3m+gMtqfUe3XPOxEyH0aLgyFq4tESbDX/GJF7m0/AbaNo5irs+h7vmQGaooVRqY8dS+zD+ZA=
X-Received: by 2002:a05:6402:34c6:b0:5dc:74f1:8a32 with SMTP id
 4fb4d7f45d1cf-5e0b7257af9mr2095375a12.28.1740134269586; Fri, 21 Feb 2025
 02:37:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHfJC1=gH7tm3V922+5Nqz76mB_iSeiTjU1rwKAVOzaj6B9LJw@mail.gmail.com>
 <alpine.DEB.2.22.394.2502131211100.619090@ubuntu-linux-20-04-desktop>
 <CAHfJC1mW7UXeuSyRFB6TpJctS8g5wgX35FnAa3D0jaB1NhW2dA@mail.gmail.com> <9c9b7ca8-e09c-4568-b24a-8026da5fd7a5@epam.com>
In-Reply-To: <9c9b7ca8-e09c-4568-b24a-8026da5fd7a5@epam.com>
From: shenghui qu <adam.qushenghui@gmail.com>
Date: Fri, 21 Feb 2025 18:37:39 +0800
X-Gm-Features: AWEUYZnSzwdNf8xA7ulCiIndnp4n-HXW0G4g2YQ3pgU6756nOzN57ZP2sIq6ktY
Message-ID: <CAHfJC1kYY=uP5LehwLJeDa4aiqrgjcmj4oX5+9+Ljmcqvpkvgw@mail.gmail.com>
Subject: Re: Inquiry About PCI Passthrough Development and Testing Patches on ARM
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: multipart/alternative; boundary="000000000000001892062ea49557"

--000000000000001892062ea49557
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mykyta,

Thank you so much for your reply. The information you provided is extremely
useful to me.

I will test the PCI passthrough function according to the  WIP branches. I
will also promptly provide feedback on related issues. I hope that this can
offer some help in the development of the PCI passthrough function.

Best regards,
Shenghui Qu

Mykyta Poturai <Mykyta_Poturai@epam.com> =E4=BA=8E2025=E5=B9=B42=E6=9C=8820=
=E6=97=A5=E5=91=A8=E5=9B=9B 16:19=E5=86=99=E9=81=93=EF=BC=9A

> Hi Shenghui,
> I have somewhat taken over the upstreaming effort for now, here is our
> plan:
> - 2025 Q1
>         1. Send "xen/arm: platform: Add support for R-Car Gen4" - Done
>         2. Revive "SMMU handling for PCIe Passthrough on ARM" - Done
>         3. Send "Add support for R-Car Gen4 PCIE Host"
>         4. Revive "PCI devices passthrough on Arm, part 3"
> - 2025 Q2
>         1. Send "IPMMU handling for PCIe Passthrough"
>         2. Send "Enable the existing MSI-X and MSI handlers support for
> ARM"
>         3. Revive  "Kconfig for PCI passthrough on ARM"
>         4. Send "PCI devices passthrough on Arm, part 4(pci scan support)=
"
>
> Please note that most Q2 patches depend on Q1 patches in some way, so it
> may require waiting some more time if the review process takes a long tim=
e.
>
> There are downstream WIP branches
> https://github.com/Deedone/xen/tree/pci_passthrough_wip (based on
> 4.20-rc3),
>
> https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/=
pci-passthrough
> (based on 4.17-unstable) that currently have PCI passthrough working on
> Arm, but on upstream it is not yet functional. There is also work done
> on moving PCI host from hardware domain to a separate driver domain, but
> it is very WIP and not yet ready to be upstreamed.
>
> --
> Mykyta
>
> On 14.02.25 12:55, shenghui qu wrote:
> > Dear Stewart
> >
> > Thank you for being looped into this discussion.
> > Following Stefano=E2=80=99s guidance, I=E2=80=99d like to seek further =
clarity on the
> > current development of PCI Passthrough support for Xen/ARM.
> > Specifically, I have two questions:
> > 1.Roadmap: Are there clear milestones or a timeline for completing PCI
> > Passthrough support on ARM? For instance, is this feature targeted for
> > inclusion in Xen 4.20 or later releases=EF=BC=9F
> > 2.Current Status: Could you elaborate on the technical progress so far?
> >
> > Looking forward to your insights.
> >
> > Best regards,
> > Shenghui Qu
> >
> > Stefano Stabellini <sstabellini@kernel.org
> > <mailto:sstabellini@kernel.org>> =E4=BA=8E2025=E5=B9=B42=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=94 04:14=E5=86=99=E9=81=93=EF=BC=9A
> >
> >     Hi Shenghui,
> >
> >     Thank you for your interest in Xen! Let me add Stewart, who can
> provide
> >     you with an overview of the latest status of PCI Passthrough on ARM=
.
> >
> >     Among the various items in progress, I would like to highlight this
> >     series from Mykyta, which is currently under review:
> >
> >     https://marc.info/?l=3Dxen-devel&m=3D173918318831281
> >
> >     Cheers,
> >
> >     Stefano
> >
> >     On Thu, 13 Feb 2025, shenghui qu wrote:
> >      > Dear Maintainers,
> >      >
> >      > I hope this email finds you well.
> >      >
> >      > I recently came across the Xen Project 4.19 Feature List, which
> >     mentions that PCI passthrough work on ARM is ongoing, including som=
e
> >      > refactoring and improvements of the existing code. It also state=
s
> >     that this work will be included in the next few releases.
> >      > I am very interested in the current development plan and progres=
s
> >     of PCI passthrough on ARM. Could you kindly provide an update on
> this?
> >      >
> >      > Additionally, I would like to know how I can access any availabl=
e
> >     testing patches related to this work.
> >      >
> >      > I appreciate your time and effort in maintaining and improving
> >     the Xen Project. Looking forward to your response.
> >      >
> >      > Best regards,Shenghui Qu
> >      >
> >      >
>

--000000000000001892062ea49557
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Mykyta,<div><br>Thank you so much for your reply. The=
 information you provided is extremely useful to me.</div><div><br>I will t=
est the PCI passthrough function according to the =C2=A0WIP branches. I wil=
l also promptly provide feedback on related issues. I hope that this can of=
fer some help in the development of the PCI passthrough function.<br><br>Be=
st regards,<br></div><div><span style=3D"color:rgb(80,0,80)">Shenghui Qu</s=
pan></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">Mykyta Poturai &lt;<a href=3D"mailto:Mykyta=
_Poturai@epam.com">Mykyta_Poturai@epam.com</a>&gt; =E4=BA=8E2025=E5=B9=B42=
=E6=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B 16:19=E5=86=99=E9=81=93=EF=BC=9A<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Shenghui,<br>
I have somewhat taken over the upstreaming effort for now, here is our plan=
:<br>
- 2025 Q1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. Send &quot;xen/arm: platform: Add support fo=
r R-Car Gen4&quot; - Done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. Revive &quot;SMMU handling for PCIe Passthro=
ugh on ARM&quot; - Done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3. Send &quot;Add support for R-Car Gen4 PCIE H=
ost&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 4. Revive &quot;PCI devices passthrough on Arm,=
 part 3&quot;<br>
- 2025 Q2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. Send &quot;IPMMU handling for PCIe Passthrou=
gh&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. Send &quot;Enable the existing MSI-X and MSI=
 handlers support for ARM&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3. Revive=C2=A0 &quot;Kconfig for PCI passthrou=
gh on ARM&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 4. Send &quot;PCI devices passthrough on Arm, p=
art 4(pci scan support)&quot;<br>
<br>
Please note that most Q2 patches depend on Q1 patches in some way, so it <b=
r>
may require waiting some more time if the review process takes a long time.=
<br>
<br>
There are downstream WIP branches <br>
<a href=3D"https://github.com/Deedone/xen/tree/pci_passthrough_wip" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/Deedone/xen/tree/pci_passt=
hrough_wip</a> (based on <br>
4.20-rc3), <br>
<a href=3D"https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/com=
mits/poc/pci-passthrough" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/pci-passthroug=
h</a> <br>
(based on 4.17-unstable) that currently have PCI passthrough working on <br=
>
Arm, but on upstream it is not yet functional. There is also work done <br>
on moving PCI host from hardware domain to a separate driver domain, but <b=
r>
it is very WIP and not yet ready to be upstreamed.<br>
<br>
-- <br>
Mykyta<br>
<br>
On 14.02.25 12:55, shenghui qu wrote:<br>
&gt; Dear Stewart<br>
&gt; <br>
&gt; Thank you for being looped into this discussion.<br>
&gt; Following Stefano=E2=80=99s guidance, I=E2=80=99d like to seek further=
 clarity on the <br>
&gt; current development of PCI Passthrough support for Xen/ARM.<br>
&gt; Specifically, I have two questions:<br>
&gt; 1.Roadmap: Are there clear milestones or a timeline for completing PCI=
 <br>
&gt; Passthrough support on ARM? For instance, is this feature targeted for=
 <br>
&gt; inclusion in Xen 4.20 or later releases=EF=BC=9F<br>
&gt; 2.Current Status: Could you elaborate on the technical progress so far=
?<br>
&gt; <br>
&gt; Looking forward to your insights.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; Shenghui Qu<br>
&gt; <br>
&gt; Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" targe=
t=3D"_blank">sstabellini@kernel.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt;&gt; =E4=BA=8E2025=E5=B9=B42=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=94 04:14=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Shenghui,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank you for your interest in Xen! Let me add Stew=
art, who can provide<br>
&gt;=C2=A0 =C2=A0 =C2=A0you with an overview of the latest status of PCI Pa=
ssthrough on ARM.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Among the various items in progress, I would like t=
o highlight this<br>
&gt;=C2=A0 =C2=A0 =C2=A0series from Mykyta, which is currently under review=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=
=3D173918318831281" rel=3D"noreferrer" target=3D"_blank">https://marc.info/=
?l=3Dxen-devel&amp;m=3D173918318831281</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, 13 Feb 2025, shenghui qu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Dear Maintainers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I hope this email finds you well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I recently came across the Xen Project 4.19 F=
eature List, which<br>
&gt;=C2=A0 =C2=A0 =C2=A0mentions that PCI passthrough work on ARM is ongoin=
g, including some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; refactoring and improvements of the existing =
code. It also states<br>
&gt;=C2=A0 =C2=A0 =C2=A0that this work will be included in the next few rel=
eases.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I am very interested in the current developme=
nt plan and progress<br>
&gt;=C2=A0 =C2=A0 =C2=A0of PCI passthrough on ARM. Could you kindly provide=
 an update on this?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Additionally, I would like to know how I can =
access any available<br>
&gt;=C2=A0 =C2=A0 =C2=A0testing patches related to this work.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I appreciate your time and effort in maintain=
ing and improving<br>
&gt;=C2=A0 =C2=A0 =C2=A0the Xen Project. Looking forward to your response.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Best regards,Shenghui Qu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <br>
</blockquote></div>

--000000000000001892062ea49557--

