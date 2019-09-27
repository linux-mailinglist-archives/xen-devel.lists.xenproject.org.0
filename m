Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C27DC0EC7
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 01:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iE02r-0006Dc-4r; Fri, 27 Sep 2019 23:53:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1rL=XW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iE02p-0006DW-Bx
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 23:53:03 +0000
X-Inumbo-ID: f0ccad28-e181-11e9-97fb-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by localhost (Halon) with ESMTPS
 id f0ccad28-e181-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 23:53:02 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i1so4944103wro.4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 16:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/EaV+lrZH9oQtKF42PAHDOPKCZjHWDkH7UqnwJvKAc8=;
 b=jp5WbLIK7lDavNT/W0ZFdGp24cUQ2hmF38WFAlJOqUDKuviC8VHTRgSs7vHOHQ2Wf4
 zz6nPif3QOBE+rOOOnSPxINDehoHAav8twdqXS9EHTrG0zpi9u719oHy8UiTOhwYExrw
 dz7VFsdytYarL512/W0XztZYQE4XYij+1XCHFognHSu+KGJpHdMMxtwT/8qCTonNfX5R
 YZD9o1UTyu7QULQh+hwo+HfMn3pEHp8PQD2vhywgbwjRQRDucHSBTU4+/ub70SU9LuI7
 RoTU42g8eqbiS1a9N789wSZCc+JoBGMQfXmrRCWmqcn9FOSkz+5AJMtXpOaH1d9w35cG
 fzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/EaV+lrZH9oQtKF42PAHDOPKCZjHWDkH7UqnwJvKAc8=;
 b=WT0Q5zD0r2dmedwBfgmtVcUfk/IE420m2c722NRNYzouWZukfq30E7I0gbohZBGxaB
 Ns6oJ7PnBY8rmAmbE6iq+oUPP7P30Vl22I04vUeGe873qd9Fa0TZWdntliBQfNxAkeZG
 ZRCfEBlLpA2cZjNj5GqAYL+swwy0wStKCIO6h0byPko4U5OMj+TLOIwfaMHtxFfgTsOf
 OdavW1GMK1ZajE5F5SLA6K7J3Ip8m4LQF2wXj1LoSt+VGkf3kztZbaezZA++3BM+3c9E
 eEgIr1GgRBojF+guNmvLGSkXr0FXTbC3J/VLmVfy0gktwVu0XmjXnK8bOwHdTBrZEIVj
 RbFg==
X-Gm-Message-State: APjAAAX28qHY8toFOGwTbwkRItSRsXy8PLtGXXompwlk2uZ9aTtXurYH
 EICoLFS+0QdI5gHFZmyfNy+M9Lmgy6qm3CXmqBs=
X-Google-Smtp-Source: APXvYqxBjGk4bx5gn6TetfNOIgXnpHgRzbgAws8t3Z+wJ/lh3MJI7TefmcUfnnUWy/eSAse7j41l6q4fWW5htow4fLU=
X-Received: by 2002:adf:ed88:: with SMTP id c8mr5062660wro.329.1569628381437; 
 Fri, 27 Sep 2019 16:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
 <71f1a62c-551c-97e1-2e1a-94339ab6e7d9@gmail.com>
 <alpine.DEB.2.21.1909271544030.2594@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1909271544030.2594@sstabellini-ThinkPad-T480s>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Sat, 28 Sep 2019 02:52:49 +0300
Message-ID: <CAPD2p-mO7msJexqbmnmGX7z5SmN00KKQCN7pVZc-+H6OjLcUqw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 volodymyr_babchuk@epam.com,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: multipart/mixed; boundary="===============5969595994462494130=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5969595994462494130==
Content-Type: multipart/alternative; boundary="0000000000001ae1d00593919624"

--0000000000001ae1d00593919624
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano

Sorry for the possible format issues.


=D1=81=D0=B1, 28 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3., 01:50 Stefano Stab=
ellini <sstabellini@kernel.org>:

> On Thu, 26 Sep 2019, Oleksandr wrote:
> > On 26.09.19 17:56, Julien Grall wrote:
> > > Hi,
> >
> > Hi Julien
> >
> >
> > >
> > > On 9/26/19 12:20 PM, Oleksandr Tyshchenko wrote:
> > > > Oleksandr Tyshchenko (8):
> > > >    iommu/arm: Add iommu_helpers.c file to keep common for IOMMUs
> stuff
> > > >    iommu/arm: Add ability to handle deferred probing request
> > > >    xen/common: Introduce _xrealloc function
> > > >    xen/common: Introduce xrealloc_flex_struct() helper macros
> > > >    iommu/arm: Add lightweight iommu_fwspec support
> > > >    iommu: Order the headers alphabetically in device_tree.c
> > > >    iommu/arm: Introduce iommu_add_dt_device API
> > > >    iommu/arm: Add Renesas IPMMU-VMSA support
> > >
> > > This series is now merged.
> >
> > Thank you!
>
> I just wanted to provide early feedback that this series causes problems
> with the legacy mmu-masters binding:
>

This series was developed in a way to add new functionality, but not to
brake existing (legacy bindings). Probably, I missed something
important. iommu_add_dt_device() could return an error (I assume, this is
what you are facing) if the device node in DT contains "iommus" property (I
mean, uses new bindings), but the IOMMU driver doesn't implement required
callbacks yet. Do the device nodes in your DT contain "iommus" property?
And to which domain these devices (in your log) are going to be assigned
(dom0 or other domains?).


> (XEN) Failed to add /amba/dma@fd500000 to the IOMMU
> (XEN) Failed to add /amba/dma@fd510000 to the IOMMU
> (XEN) Failed to add /amba/dma@fd520000 to the IOMMU
> (XEN) Failed to add /amba/dma@fd530000 to the IOMMU
> (XEN) Failed to add /amba/dma@fd540000 to the IOMMU
> (XEN) Failed to add /amba/dma@fd550000 to the IOMMU
> (XEN) Failed to add /amba/dma@fd560000 to the IOMMU
> (XEN) Failed to add /amba/dma@fd570000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffa80000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffa90000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffaa0000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffab0000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffac0000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffad0000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffae0000 to the IOMMU
> (XEN) Failed to add /amba/dma@ffaf0000 to the IOMMU
> (XEN) Failed to add /amba/nand@ff100000 to the IOMMU
> (XEN) Failed to add /amba/ethernet@ff0b0000 to the IOMMU
> (XEN) Failed to add /amba/ethernet@ff0c0000 to the IOMMU
> (XEN) Failed to add /amba/ethernet@ff0d0000 to the IOMMU
> (XEN) Failed to add /amba/spi@ff0f0000 to the IOMMU
> (XEN) Failed to add /amba/sdhci@ff160000 to the IOMMU
> (XEN) Failed to add /amba/sdhci@ff170000 to the IOMMU
> (XEN) Failed to add /amba/usb@fe200000 to the IOMMU
> (XEN) Failed to add /amba/usb@fe300000 to the IOMMU
>
> Booting fails and also even forcing to continue devices are unusable. I
> haven't managed to investigate further.

--0000000000001ae1d00593919624
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefano<div dir=3D"auto"><br></div><div dir=3D"au=
to">Sorry for the possible format issues.</div><br><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D0=B1, 28 =D1=81=D0=B5=
=D0=BD=D1=82. 2019 =D0=B3., 01:50 Stefano Stabellini &lt;<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@ke=
rnel.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 26 Sep 20=
19, Oleksandr wrote:<br>
&gt; On 26.09.19 17:56, Julien Grall wrote:<br>
&gt; &gt; Hi,<br>
&gt; <br>
&gt; Hi Julien<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; On 9/26/19 12:20 PM, Oleksandr Tyshchenko wrote:<br>
&gt; &gt; &gt; Oleksandr Tyshchenko (8):<br>
&gt; &gt; &gt; =C2=A0=C2=A0 iommu/arm: Add iommu_helpers.c file to keep com=
mon for IOMMUs stuff<br>
&gt; &gt; &gt; =C2=A0=C2=A0 iommu/arm: Add ability to handle deferred probi=
ng request<br>
&gt; &gt; &gt; =C2=A0=C2=A0 xen/common: Introduce _xrealloc function<br>
&gt; &gt; &gt; =C2=A0=C2=A0 xen/common: Introduce xrealloc_flex_struct() he=
lper macros<br>
&gt; &gt; &gt; =C2=A0=C2=A0 iommu/arm: Add lightweight iommu_fwspec support=
<br>
&gt; &gt; &gt; =C2=A0=C2=A0 iommu: Order the headers alphabetically in devi=
ce_tree.c<br>
&gt; &gt; &gt; =C2=A0=C2=A0 iommu/arm: Introduce iommu_add_dt_device API<br=
>
&gt; &gt; &gt; =C2=A0=C2=A0 iommu/arm: Add Renesas IPMMU-VMSA support<br>
&gt; &gt; <br>
&gt; &gt; This series is now merged.<br>
&gt; <br>
&gt; Thank you!<br>
<br>
I just wanted to provide early feedback that this series causes problems<br=
>
with the legacy mmu-masters binding:<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"></blockquote></div></div><div dir=3D"auto">This series=
 was developed in a way to add new functionality, but not to brake existing=
 (legacy bindings). Probably, I missed something important.=C2=A0iommu_add_=
dt_device() could return an error (I assume, this is what you are facing) i=
f the device node in DT contains &quot;iommus&quot; property (I mean, uses =
new bindings), but the IOMMU driver doesn&#39;t implement required callback=
s yet. Do the device nodes in your DT contain &quot;iommus&quot; property? =
And to which domain these devices (in your log) are going to be assigned (d=
om0 or other domains?).</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
(XEN) Failed to add /amba/dma@fd500000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@fd510000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@fd520000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@fd530000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@fd540000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@fd550000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@fd560000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@fd570000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffa80000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffa90000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffaa0000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffab0000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffac0000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffad0000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffae0000 to the IOMMU<br>
(XEN) Failed to add /amba/dma@ffaf0000 to the IOMMU<br>
(XEN) Failed to add /amba/nand@ff100000 to the IOMMU<br>
(XEN) Failed to add /amba/ethernet@ff0b0000 to the IOMMU<br>
(XEN) Failed to add /amba/ethernet@ff0c0000 to the IOMMU<br>
(XEN) Failed to add /amba/ethernet@ff0d0000 to the IOMMU<br>
(XEN) Failed to add /amba/spi@ff0f0000 to the IOMMU<br>
(XEN) Failed to add /amba/sdhci@ff160000 to the IOMMU<br>
(XEN) Failed to add /amba/sdhci@ff170000 to the IOMMU<br>
(XEN) Failed to add /amba/usb@fe200000 to the IOMMU<br>
(XEN) Failed to add /amba/usb@fe300000 to the IOMMU<br>
<br>
Booting fails and also even forcing to continue devices are unusable. I<br>
haven&#39;t managed to investigate further.</blockquote></div></div></div>

--0000000000001ae1d00593919624--


--===============5969595994462494130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5969595994462494130==--

