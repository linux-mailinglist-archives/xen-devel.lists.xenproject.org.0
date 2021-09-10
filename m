Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD8B407308
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 23:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184808.333565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOoHd-0000eJ-D1; Fri, 10 Sep 2021 21:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184808.333565; Fri, 10 Sep 2021 21:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOoHd-0000bP-97; Fri, 10 Sep 2021 21:42:05 +0000
Received: by outflank-mailman (input) for mailman id 184808;
 Fri, 10 Sep 2021 21:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VIAe=OA=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mOoHc-0000bJ-6G
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 21:42:04 +0000
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ad851b2-c48d-47c6-b7e3-1883313dcaba;
 Fri, 10 Sep 2021 21:42:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i6so4465210edu.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Sep 2021 14:42:02 -0700 (PDT)
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
X-Inumbo-ID: 2ad851b2-c48d-47c6-b7e3-1883313dcaba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uxfgzMlBFAsHdhhTIbAJ202DoS4PD95dqeSuumClICc=;
        b=CDlVhSmKEkEpemhEEIUguzMtHEWu7Hew4ok5miKSF51mlWb545f9B2GCwSXDee/fHs
         Xa8idfAqsIAceYz/GnAekbIeS0G1rNycwqEFbYeDXhncp9sTKuH0SzW/HFG92Ruxs3QL
         4auIXFJcTIiE6wTd96MlzgdUFlZy7/Vn1pKoxN49RsDllefS8cK+7XuJcvyXRu97sxbh
         i764o9joy/hhbSfl80wLD01zeUBpyHIFTVSazl4QZb66QA0QDQJZXsQ4Ocd9dqsaxJyu
         /Gh/C2eOf1X1MXDjWGBGdH/J/HBGRXVxwJlPgHyt9BOCQNNlx6NhR++iie56v/In95HX
         fSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uxfgzMlBFAsHdhhTIbAJ202DoS4PD95dqeSuumClICc=;
        b=XO4+KtZQ2mUmZdJzm/Z405US40dBpSz/veHpeFbEIcBLcNZi7102L7mjEHS5WlAtW0
         nmO2bVEy9ZcC9w/1VWLUEgM3Z+ZojP6PBaN84tb9LsS3pQP+BpVxBMelxRRy43sgH7W0
         ozoevnnxaE/n0MRbrpa50dRwQc8NqEOAk2dzilnRqELtRiYNepBYtns5skcslKLJM3xk
         +YycA3wVF8FE6ISAppEWx2FrnP7cAvRhO3i0ilk6Z/gTkK6UsthUwoYF7/qHnzq4ciZC
         j6RHTlgn2vl69EZri4i/4MvTbMf22ZqOH5uZmHeOmNEHTZtg4nmlvshA014/QV44xdwW
         xaEA==
X-Gm-Message-State: AOAM531QtzJPiMEdz0ZWZvUFxcHruN5HlVvuLeMnQgUN6YsrnWF/j4vl
	mqG7URgqcIzTm1ahZM2Ue8kPbuJwghzppOGCvZo=
X-Google-Smtp-Source: ABdhPJyCdqe8GSTIHTaW1fwa31u0Mcm70AZKWMewBDoxVL/QCqLfLagQP6Q0tnGo5YEHm6msc3A7oivOfl/YHGTtYtE=
X-Received: by 2002:aa7:df92:: with SMTP id b18mr4863250edy.47.1631310121526;
 Fri, 10 Sep 2021 14:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org> <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org> <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <684b3534-40eb-add7-f46e-c6258904757b@xen.org> <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 10 Sep 2021 22:41:50 +0100
Message-ID: <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's p2m
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
	Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Content-Type: multipart/alternative; boundary="0000000000004fe6de05cbaafc09"

--0000000000004fe6de05cbaafc09
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Sep 2021, 21:30 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Fri, 10 Sep 2021, Julien Grall wrote:
> > On 10/09/2021 15:01, Oleksandr Andrushchenko wrote:
> > > On 10.09.21 16:18, Julien Grall wrote:
> > > > On 10/09/2021 13:37, Oleksandr Andrushchenko wrote:
> > > > > Hi, Julien!
> > > >
> > > > Hi Oleksandr,
> > > >
> > > > > On 09.09.21 20:58, Julien Grall wrote:
> > > > > > On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
> > > > > > > From: Oleksandr Andrushchenko <
> oleksandr_andrushchenko@epam.com>
> > > > > > >
> > > > > > > Host bridge controller's ECAM space is mapped into Domain-0's
> p2m,
> > > > > > > thus it is not possible to trap the same for vPCI via MMIO
> handlers.
> > > > > > > For this to work we need to not map those while constructing
> the
> > > > > > > domain.
> > > > > > >
> > > > > > > Note, that during Domain-0 creation there is no pci_dev yet
> > > > > > > allocated for
> > > > > > > host bridges, thus we cannot match PCI host and its associated
> > > > > > > bridge by SBDF. Use dt_device_node field for checks instead.
> > > > > > >
> > > > > > > Signed-off-by: Oleksandr Andrushchenko
> > > > > > > <oleksandr_andrushchenko@epam.com>
> > > > > > > ---
> > > > > > >     xen/arch/arm/domain_build.c        |  3 +++
> > > > > > >     xen/arch/arm/pci/ecam.c            | 17 +++++++++++++++++
> > > > > > >     xen/arch/arm/pci/pci-host-common.c | 22
> ++++++++++++++++++++++
> > > > > > >     xen/include/asm-arm/pci.h          | 12 ++++++++++++
> > > > > > >     4 files changed, 54 insertions(+)
> > > > > > >
> > > > > > > diff --git a/xen/arch/arm/domain_build.c
> > > > > > > b/xen/arch/arm/domain_build.c
> > > > > > > index da427f399711..76f5b513280c 100644
> > > > > > > --- a/xen/arch/arm/domain_build.c
> > > > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > > > @@ -1257,6 +1257,9 @@ static int __init
> map_range_to_domain(const
> > > > > > > struct dt_device_node *dev,
> > > > > > >             }
> > > > > > >         }
> > > > > > >     +    if ( need_mapping && (device_get_class(dev) ==
> DEVICE_PCI)
> > > > > > > ) > +        need_mapping =
> pci_host_bridge_need_p2m_mapping(d, dev,
> > > > > > addr, len);
> > > > > >
> > > > > > AFAICT, with device_get_class(dev), you know whether the
> hostbridge is
> > > > > > used by Xen. Therefore, I would expect that we don't want to map
> all
> > > > > > the regions of the hostbridges in dom0 (including the BARs).
> > > > > >
> > > > > > Can you clarify it?
> > > > > We only want to trap ECAM, not MMIOs and any other memory regions
> as the
> > > > > bridge is
> > > > >
> > > > > initialized and used by Domain-0 completely.
> > > >
> > > > What do you mean by "used by Domain-0 completely"? The hostbridge is
> owned
> > > > by Xen so I don't think we can let dom0 access any MMIO regions by
> > > > default.
> > >
> > > Now it's my time to ask why do you think Xen owns the bridge?
> > >
> > > All the bridges are passed to Domain-0, are fully visible to Domain-0,
> > > initialized in Domain-0.
> > >
> > > Enumeration etc. is done in Domain-0. So how comes that Xen owns the
> bridge?
> > > In what way it does?
> > >
> > > Xen just accesses the ECAM when it needs it, but that's it. Xen traps
> ECAM
> > > access - that is true.
> > >
> > > But it in no way uses MMIOs etc. of the bridge - those under direct
> control
> > > of Domain-0
> >
> > So I looked on the snipped of the design document you posted. I think
> you are
> > instead referring to a different part:
> >
> > " PCI-PCIe enumeration is a process of detecting devices connected to its
> > host.
> > It is the responsibility of the hardware domain or boot firmware to do
> the PCI
> > enumeration and configure the BAR, PCI capabilities, and MSI/MSI-X
> > configuration."
> >
> > But I still don't see why it means we have to map the MMIOs right now.
> Dom0
> > should not need to access the MMIOs (aside the hostbridge registers)
> until the
> > BARs are configured.
>
> This is true especially when we are going to assign a specific PCIe
> device to a DomU. In that case, the related MMIO regions are going to be
> mapped to the DomU and it would be a bad idea to also keep them mapped
> in Dom0. Once we do PCIe assignment, the MMIO region of the PCIe device
> being assigned should only be mapped in the DomU, right?
>

That's actually a good point. This is a recipe for disaster because dom0
and the domU may map the BARs with conflicting caching attributes.

So we ought to unmap the BAR from dom0. When the device is assigned to the
domU


> If so, it would be better if the MMIO region in question was never
> mapped into Dom0 at all rather having to unmap it.
>
> With the current approach, given that the entire PCIe aperture is mapped
> to Dom0 since boot, we would have to identify the relevant subset region
> and unmap it from Dom0 when doing assignment.

--0000000000004fe6de05cbaafc09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 10 Sep 2021, 21:30 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Fri, 10 Sep 2021, Julien Grall=
 wrote:<br>
&gt; On 10/09/2021 15:01, Oleksandr Andrushchenko wrote:<br>
&gt; &gt; On 10.09.21 16:18, Julien Grall wrote:<br>
&gt; &gt; &gt; On 10/09/2021 13:37, Oleksandr Andrushchenko wrote:<br>
&gt; &gt; &gt; &gt; Hi, Julien!<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hi Oleksandr,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 09.09.21 20:58, Julien Grall wrote:<br>
&gt; &gt; &gt; &gt; &gt; On 03/09/2021 09:33, Oleksandr Andrushchenko wrote=
:<br>
&gt; &gt; &gt; &gt; &gt; &gt; From: Oleksandr Andrushchenko &lt;<a href=3D"=
mailto:oleksandr_andrushchenko@epam.com" target=3D"_blank" rel=3D"noreferre=
r">oleksandr_andrushchenko@epam.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Host bridge controller&#39;s ECAM space is ma=
pped into Domain-0&#39;s p2m,<br>
&gt; &gt; &gt; &gt; &gt; &gt; thus it is not possible to trap the same for =
vPCI via MMIO handlers.<br>
&gt; &gt; &gt; &gt; &gt; &gt; For this to work we need to not map those whi=
le constructing the<br>
&gt; &gt; &gt; &gt; &gt; &gt; domain.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Note, that during Domain-0 creation there is =
no pci_dev yet<br>
&gt; &gt; &gt; &gt; &gt; &gt; allocated for<br>
&gt; &gt; &gt; &gt; &gt; &gt; host bridges, thus we cannot match PCI host a=
nd its associated<br>
&gt; &gt; &gt; &gt; &gt; &gt; bridge by SBDF. Use dt_device_node field for =
checks instead.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Oleksandr Andrushchenko<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:oleksandr_andrushchenko=
@epam.com" target=3D"_blank" rel=3D"noreferrer">oleksandr_andrushchenko@epa=
m.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0 xen/arch/arm/domain_build.=
c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0 xen/arch/arm/pci/ecam.c=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 ++++++=
+++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0 xen/arch/arm/pci/pci-host-=
common.c | 22 ++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0 xen/include/asm-arm/pci.h=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++++<br=
>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0 4 files changed, 54 insert=
ions(+)<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/xen/arch/arm/domain_build.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; b/xen/arch/arm/domain_build.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; index da427f399711..76f5b513280c 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/xen/arch/arm/domain_build.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/xen/arch/arm/domain_build.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -1257,6 +1257,9 @@ static int __init map_r=
ange_to_domain(const<br>
&gt; &gt; &gt; &gt; &gt; &gt; struct dt_device_node *dev,<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<=
br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 if ( n=
eed_mapping &amp;&amp; (device_get_class(dev) =3D=3D DEVICE_PCI)<br>
&gt; &gt; &gt; &gt; &gt; &gt; ) &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 need_mapping =3D pci_host_bridge_need_p2m_mapping(d, dev,<br>
&gt; &gt; &gt; &gt; &gt; addr, len);<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; AFAICT, with device_get_class(dev), you know wheth=
er the hostbridge is<br>
&gt; &gt; &gt; &gt; &gt; used by Xen. Therefore, I would expect that we don=
&#39;t want to map all<br>
&gt; &gt; &gt; &gt; &gt; the regions of the hostbridges in dom0 (including =
the BARs).<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Can you clarify it?<br>
&gt; &gt; &gt; &gt; We only want to trap ECAM, not MMIOs and any other memo=
ry regions as the<br>
&gt; &gt; &gt; &gt; bridge is<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; initialized and used by Domain-0 completely.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; What do you mean by &quot;used by Domain-0 completely&quot;?=
 The hostbridge is owned<br>
&gt; &gt; &gt; by Xen so I don&#39;t think we can let dom0 access any MMIO =
regions by<br>
&gt; &gt; &gt; default.<br>
&gt; &gt; <br>
&gt; &gt; Now it&#39;s my time to ask why do you think Xen owns the bridge?=
<br>
&gt; &gt; <br>
&gt; &gt; All the bridges are passed to Domain-0, are fully visible to Doma=
in-0,<br>
&gt; &gt; initialized in Domain-0.<br>
&gt; &gt; <br>
&gt; &gt; Enumeration etc. is done in Domain-0. So how comes that Xen owns =
the bridge?<br>
&gt; &gt; In what way it does?<br>
&gt; &gt; <br>
&gt; &gt; Xen just accesses the ECAM when it needs it, but that&#39;s it. X=
en traps ECAM<br>
&gt; &gt; access - that is true.<br>
&gt; &gt; <br>
&gt; &gt; But it in no way uses MMIOs etc. of the bridge - those under dire=
ct control<br>
&gt; &gt; of Domain-0<br>
&gt; <br>
&gt; So I looked on the snipped of the design document you posted. I think =
you are<br>
&gt; instead referring to a different part:<br>
&gt; <br>
&gt; &quot; PCI-PCIe enumeration is a process of detecting devices connecte=
d to its<br>
&gt; host.<br>
&gt; It is the responsibility of the hardware domain or boot firmware to do=
 the PCI<br>
&gt; enumeration and configure the BAR, PCI capabilities, and MSI/MSI-X<br>
&gt; configuration.&quot;<br>
&gt; <br>
&gt; But I still don&#39;t see why it means we have to map the MMIOs right =
now. Dom0<br>
&gt; should not need to access the MMIOs (aside the hostbridge registers) u=
ntil the<br>
&gt; BARs are configured.<br>
<br>
This is true especially when we are going to assign a specific PCIe<br>
device to a DomU. In that case, the related MMIO regions are going to be<br=
>
mapped to the DomU and it would be a bad idea to also keep them mapped<br>
in Dom0. Once we do PCIe assignment, the MMIO region of the PCIe device<br>
being assigned should only be mapped in the DomU, right?<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">That&#39;s actually=
 a good point. This is a recipe for disaster because dom0 and the domU may =
map the BARs with conflicting caching attributes.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">So we ought to unmap the BAR from dom0. When the =
device is assigned to the domU=C2=A0</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
If so, it would be better if the MMIO region in question was never<br>
mapped into Dom0 at all rather having to unmap it.<br>
<br>
With the current approach, given that the entire PCIe aperture is mapped<br=
>
to Dom0 since boot, we would have to identify the relevant subset region<br=
>
and unmap it from Dom0 when doing assignment.</blockquote></div></div></div=
>

--0000000000004fe6de05cbaafc09--

