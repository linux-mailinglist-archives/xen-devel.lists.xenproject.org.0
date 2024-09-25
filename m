Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A78986530
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804437.1215420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stVDE-0006bL-7q; Wed, 25 Sep 2024 16:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804437.1215420; Wed, 25 Sep 2024 16:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stVDE-0006Yp-51; Wed, 25 Sep 2024 16:50:00 +0000
Received: by outflank-mailman (input) for mailman id 804437;
 Wed, 25 Sep 2024 16:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QAn8=QX=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1stVDC-0006Yh-IG
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:49:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31a6d3be-7b5e-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 18:49:56 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8a837cec81so3934466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 09:49:56 -0700 (PDT)
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
X-Inumbo-ID: 31a6d3be-7b5e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727282996; x=1727887796; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/rfpXgaNP2p9v3LLpZBuP7kJPOVH75rsBoY1nhzPe68=;
        b=JvpQ8EQHm+7UjYLcCDztEozhnesVmdlWH0IWxv6OP33J/HLk2AL9VRtV6wCtWCgdV1
         v6qVZBE9m0zv5xJO71KfH8z3M7jU6+fSpY70/T9Mk5zRR6Yy34MtFXnNSCSvQdidcuHA
         TRuLKJDvGH6ulh1UTfYHfeJZac8hPvJ/CV4CqAmB5Xtf2DRhmQ14VypC35AbG12gyZfW
         95ydqYVZuNUOtRVwj+ccDhFPR8nCkT/25rgNCCMoNRyaB/JeVEI93GbDgg7bZFCAhbYu
         XiJ8OhT9HjTlHyO+SLwG35jpHb/Jo4t/5ebb2nR/NVUX10Gkti/9GVqzm+hUnrs7jIHn
         GqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727282996; x=1727887796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rfpXgaNP2p9v3LLpZBuP7kJPOVH75rsBoY1nhzPe68=;
        b=tJg8H6p8HaDNULq0O4xXtaU5EUJvWm1rNL2p4hdaOD5QAuEnaGyZ8jmKvnbu8CJ6H3
         teTJbjYW8ZBKoe5ZgS/pubepqM/wOqFJM5vSuvypSHxH5Xvjw+FCSvUC2JZQc5JN45lx
         YNe92wOJ0Qh2wYdfiQ+0SU3sYuuj5yUwo1OI4ckC7qDwMoZuYF0bFi+HYPTiCh0tnxom
         QHfklWOppzFVPXzWHUim2o1u4Kq2zBbJS00qJJ/D4u15GSO0qRxnhVf8GE+BjB3MX1Ld
         tcmtValwSrMf37JnOd4/yP3IeiFUkJAh/+S9fEc+sgxROHEhcWySpbzBZQ+H82cuQVqn
         TYrg==
X-Forwarded-Encrypted: i=1; AJvYcCXNnFilYQ7M/aYr6bDYe+yoMNCClVzu5fc9pVKSZhtbYyCCo/YX2Y8aiL8WBCHEaYL+28G8Zbpm07I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6Pv9HmWRXXgOMBFlzxpuqN+vKY0TEiXYX3EOxELiwKlD1lVeP
	bCnFtVqU5JEPZZrg2NhdCJMHG+KT3mhpB+aOki9LWyQxIXsLKREYByU0+J/fPyO2vmzkDkKa5CQ
	zpq+goJTq9PE4jdzC5HWAllRy0sA=
X-Google-Smtp-Source: AGHT+IFttu3G7q64SHOUN9FU0Kfj9lhNEmcKKC6XJ8gzWw+Bgx8Lu5wHalxrRMg3IQhyTUrU9rwnOWpgvp+/kt9QvB4=
X-Received: by 2002:a05:6402:2812:b0:5c5:b9bb:c341 with SMTP id
 4fb4d7f45d1cf-5c72074d13fmr3527340a12.26.1727282995478; Wed, 25 Sep 2024
 09:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com> <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org>
 <ZvQ7mf9MbmSyC6RB@zapote> <d897124b-29c7-4aac-86bf-f1bec1aeade4@xen.org> <ZvQ-AK--W7sWom7r@zapote>
In-Reply-To: <ZvQ-AK--W7sWom7r@zapote>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 25 Sep 2024 10:49:42 -0600
Message-ID: <CAJy5ezpLVciE0ENGYtC4cwJ7U4rPTR4E68M+vq=2jBgK2it3zg@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
	dpsmith@apertussolutions.com, Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: multipart/alternative; boundary="0000000000005f499b0622f4690e"

--0000000000005f499b0622f4690e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:44=E2=80=AFAM Edgar E. Iglesias <edgar.iglesias@=
amd.com>
wrote:

> On Wed, Sep 25, 2024 at 05:38:13PM +0100, Julien Grall wrote:
> > Hi Edgar,
> >
> > On 25/09/2024 17:34, Edgar E. Iglesias wrote:
> > > On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:
> > > > Hi,
> > > > On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > > > > From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > >
> > > > > When virtio-pci is specified in the dom0less domU properties,
> create a
> > > > > virtio-pci node in the guest's device tree. Set up an mmio handle=
r
> with
> > > > > a register for the guest to poll when the backend has connected a=
nd
> > > > > virtio-pci bus is ready to be probed. Grant tables may be used by
> > > > > specifying virtio-pci =3D "grants";.
> > > > >
> > > > > [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
> > > > >    Make grants iommu-map cover the entire PCI bus.
> > > > >    Add virtio-pci-ranges to specify memory-map for direct-mapped
> guests.
> > > > >    Document virtio-pci dom0less fdt bindings.]
> > > > > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > > ---
> > > > >    docs/misc/arm/device-tree/booting.txt |  21 +++
> > > > >    xen/arch/arm/dom0less-build.c         | 238
> ++++++++++++++++++++++++++
> > > > >    xen/arch/arm/include/asm/kernel.h     |  15 ++
> > > > >    3 files changed, 274 insertions(+)
> > > > >
> > > > > diff --git a/docs/misc/arm/device-tree/booting.txt
> b/docs/misc/arm/device-tree/booting.txt
> > > > > index 3a04f5c57f..82f3bd7026 100644
> > > > > --- a/docs/misc/arm/device-tree/booting.txt
> > > > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > > > @@ -276,6 +276,27 @@ with the following properties:
> > > > >        passed through. This option is the default if this propert=
y
> is missing
> > > > >        and the user does not provide the device partial device
> tree for the domain.
> > > > > +- virtio-pci
> > > >
> > > > Similar question to the other patches, why is this specific to
> virtio PCI?
> > > > QEMU (or another device module) is free to emulate whatever it want=
s
> behind
> > > > the PCI hosbtridge.
> > >
> > > There's no hard limitatino to only virtio-pci devices it's more of a
> > > recommendation that PVH guests should not use "emulated" devices but
> > > there's nothing stopping it.
> >
> > Could you provide a bit more details where this requirement is coming
> from?
> > For instance, I would expect we would need to do some emulation to boot
> > Windows on Arm.
> >
>
> I see. I guess it just came from my mental model, I thought part of the
> philosophy behind PVH was to avoid emulated devices and use
> paravirualized (virtio or something else) or passthrough whereever
> possible (except for the basic set of devices needed like vGIC, vuart,
> MMU).
>

For  example, we would recommend users to use virtio-net in favor of an
emulated eepro1000 or whatever other NIC models available in QEMU.
But there is no hard requirement nor limitation, a user can connect any
available PCI device from the QEMU set.

Another thing we're looking to do is to minimize the QEMU build (Kconfig +
configure flags) to create a small build with only the stuff needed for
virtio-pci.

Best regards,
Edgar

--0000000000005f499b0622f4690e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Sep 25, 2024 at 10:44=E2=80=AFAM =
Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@amd.com">edgar.igles=
ias@amd.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, Sep 25, 2024 at 05:38:13PM +0=
100, Julien Grall wrote:<br>
&gt; Hi Edgar,<br>
&gt; <br>
&gt; On 25/09/2024 17:34, Edgar E. Iglesias wrote:<br>
&gt; &gt; On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; On 24/09/2024 17:23, Edgar E. Iglesias wrote:<br>
&gt; &gt; &gt; &gt; From: Stewart Hildebrand &lt;<a href=3D"mailto:stewart.=
hildebrand@amd.com" target=3D"_blank">stewart.hildebrand@amd.com</a>&gt;<br=
>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; When virtio-pci is specified in the dom0less domU prope=
rties, create a<br>
&gt; &gt; &gt; &gt; virtio-pci node in the guest&#39;s device tree. Set up =
an mmio handler with<br>
&gt; &gt; &gt; &gt; a register for the guest to poll when the backend has c=
onnected and<br>
&gt; &gt; &gt; &gt; virtio-pci bus is ready to be probed. Grant tables may =
be used by<br>
&gt; &gt; &gt; &gt; specifying virtio-pci =3D &quot;grants&quot;;.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI=
 specs).<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 Make grants iommu-map cover the entire PCI=
 bus.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 Add virtio-pci-ranges to specify memory-ma=
p for direct-mapped guests.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 Document virtio-pci dom0less fdt bindings.=
]<br>
&gt; &gt; &gt; &gt; Signed-off-by: Stewart Hildebrand &lt;<a href=3D"mailto=
:stewart.hildebrand@amd.com" target=3D"_blank">stewart.hildebrand@amd.com</=
a>&gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:=
edgar.iglesias@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br=
>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 docs/misc/arm/device-tree/booting.txt |=C2=
=A0 21 +++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 xen/arch/arm/dom0less-build.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 238 ++++++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 xen/arch/arm/include/asm/kernel.h=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 ++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 3 files changed, 274 insertions(+)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/docs/misc/arm/device-tree/booting.txt b/do=
cs/misc/arm/device-tree/booting.txt<br>
&gt; &gt; &gt; &gt; index 3a04f5c57f..82f3bd7026 100644<br>
&gt; &gt; &gt; &gt; --- a/docs/misc/arm/device-tree/booting.txt<br>
&gt; &gt; &gt; &gt; +++ b/docs/misc/arm/device-tree/booting.txt<br>
&gt; &gt; &gt; &gt; @@ -276,6 +276,27 @@ with the following properties:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 passed through. This option =
is the default if this property is missing<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 and the user does not provid=
e the device partial device tree for the domain.<br>
&gt; &gt; &gt; &gt; +- virtio-pci<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Similar question to the other patches, why is this specific =
to virtio PCI?<br>
&gt; &gt; &gt; QEMU (or another device module) is free to emulate whatever =
it wants behind<br>
&gt; &gt; &gt; the PCI hosbtridge.<br>
&gt; &gt; <br>
&gt; &gt; There&#39;s no hard limitatino to only virtio-pci devices it&#39;=
s more of a<br>
&gt; &gt; recommendation that PVH guests should not use &quot;emulated&quot=
; devices but<br>
&gt; &gt; there&#39;s nothing stopping it.<br>
&gt; <br>
&gt; Could you provide a bit more details where this requirement is coming =
from?<br>
&gt; For instance, I would expect we would need to do some emulation to boo=
t<br>
&gt; Windows on Arm.<br>
&gt;<br>
<br>
I see. I guess it just came from my mental model, I thought part of the<br>
philosophy behind PVH was to avoid emulated devices and use<br>
paravirualized (virtio or something else) or passthrough whereever<br>
possible (except for the basic set of devices needed like vGIC, vuart,<br>
MMU).<br></blockquote><div><br></div><div>For=C2=A0 example, we would recom=
mend users to use virtio-net in favor of an emulated eepro1000=C2=A0or what=
ever other NIC models available in QEMU.</div><div>But there is no=C2=A0har=
d requirement nor limitation, a user can connect any available PCI device f=
rom the QEMU set.</div><div><br></div><div>Another thing we&#39;re looking =
to do is to minimize the QEMU build (Kconfig=C2=A0+ configure flags) to cre=
ate a small build with only the stuff needed for virtio-pci.</div><div><br>=
</div><div>Best regards,</div><div>Edgar</div></div></div>

--0000000000005f499b0622f4690e--

