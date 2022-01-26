Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899149CFB6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261021.451498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCl9x-0005bj-MS; Wed, 26 Jan 2022 16:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261021.451498; Wed, 26 Jan 2022 16:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCl9x-0005Yd-Ig; Wed, 26 Jan 2022 16:28:37 +0000
Received: by outflank-mailman (input) for mailman id 261021;
 Wed, 26 Jan 2022 16:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agIW=SK=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nCl9v-0005YX-Le
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:28:35 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01a365e2-7ec5-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 17:28:34 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so4084813wms.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jan 2022 08:28:34 -0800 (PST)
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
X-Inumbo-ID: 01a365e2-7ec5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PiQxkHFJA+LS6OgxUkbc65jmrHHRZ4Q7GQDTHOCuXY0=;
        b=SfSTcWnpS5Mdt+uzRCjqkcg8QXwp19zakyRRySIQzCkq81WYkW2ThwdCAa2lnSEM4k
         dDcFpfIZ2Q8ImAN/fGzOOwwvBgzVLWwHRz0buGCQY0AlO7UEcNYoa080klMOxNevQjvm
         lrwQC6T3GAjwHPWOfs3tLPuTrBGCtdMV6EC0Xg5G5nu3/ZtSFLUOPH2W4FLFkjPEHb80
         8eiaUM13xAkN01gbfa4P9lKQ8UpTF2QcUGQy7DgV11UZIKc5wX3ER/BtKQVKySAtgE/z
         D8pDwPJQpC3Jc3v/LX5PBP2qHYDKKpXOPSSoItGnXhMaiT2if2/yNmgAzzNuScNjGrCu
         4E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PiQxkHFJA+LS6OgxUkbc65jmrHHRZ4Q7GQDTHOCuXY0=;
        b=lt5q5WNjKcktrTWkPI95edoyuVG6pe16WrSznw/1uyiUpv8A9QlGsCcT0jF1c90sya
         bsPCVy9tAoq1YGVh9DzNVHuCTyYPVNtOA7ZqWWJiKR4alRHrSyTaKwStT+56sgI2A2Cq
         OXNkg+HO0ubrBO0LGEEAZTd7BDeJXZAhRk7Qj0rsnHtOVQVti18AhQJR1Go2MvZil7YM
         twj0nVpFqtfa9+O15dExQqbRGWtQr6MMnCq2RgOPDz46kPG04x3JKk/V/TvLe5e6I9OK
         igKrbwv53svYBmFZ/xD185/CGusZ/5pz/u2l4BOGJ0GN3tGRtip+lX29BK1yXnzLYbqg
         eJEA==
X-Gm-Message-State: AOAM531zJEZg0s/EbZ2ZTnN0foT1XuF/LggoWdKNP1T8xRmYfklC2PVx
	VCp7N2itnWMoaMajHngCjt9jES400N21JoBI464=
X-Google-Smtp-Source: ABdhPJyMysI5+h6qPq8UAeX9oypKn3HKvh3S+nw7GtCcnB8og/yWUx7AbWol5eaDlCK37pFjeRCWtsB2jOwGAc7nZ5k=
X-Received: by 2002:a05:600c:a47:: with SMTP id c7mr8141807wmq.23.1643214513783;
 Wed, 26 Jan 2022 08:28:33 -0800 (PST)
MIME-Version: 1.0
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com> <e2c94aba-8636-cebe-b90a-bcc19affd061@xen.org>
In-Reply-To: <e2c94aba-8636-cebe-b90a-bcc19affd061@xen.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 26 Jan 2022 18:28:22 +0200
Message-ID: <CAPD2p-kLksv1SWGB5GHZvgVVRKZp_qf-dbSQsvw-X3TZyxn5UA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Rahul Singh <rahul.singh@arm.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: multipart/alternative; boundary="0000000000006249eb05d67eb172"

--0000000000006249eb05d67eb172
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 6:20 PM Julien Grall <julien@xen.org> wrote:

> Hi Oleksandr,
>

Hi Julien,

[Sorry for the possible format issues]


>
> On 27/11/2021 17:51, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > The R-Car S4 is an automotive System-on-Chip (SoC) for Car
> Server/Communication
> > Gateway and is one of the first products in Renesas=E2=80=99 4th-genera=
tion
> R-Car Family.
> >
> > The integrated IOMMU HW is also VMSA-compatible and supports stage 2
> translation
> > table format, therefore can be used with current R-Car Gen3 driver with
> slight
> > modifications.
> >
> > In the context of Xen driver the main differences between Gen3 and S4 a=
re
> > the following:
> >   - HW capacity was enlarged to support up to 16 IPMMU contexts (sets o=
f
> page table)
> >     and up to 64 micro-TLBs per IPMMU device
> >   - the memory mapped registers have different bases and offset
> >
> > The first part (commits #1-6) is a non-verbatim port of Linux upstream
> commits
> > needed to add support for S4 series easily (prereq work).
> > The second part (commits #7-8) is based on the code from the Renesas BS=
P
> and
> > actually introduces support for R-Car S4 IPMMU.
> > The third part (commits #9-10) is misc changes I have locally.
> >
> > The patch series is based on 4.16.0-rc4 branch and also available at [1=
].
> >
> > Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and Renesas
> Spider
> > board with S4 SoC.
> >
> > [1] https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml1
> >
> > Oleksandr Tyshchenko (10):
> >    iommu/ipmmu-vmsa: Remove all unused register definitions
> >    iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
> >    iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
> >    iommu/ipmmu-vmsa: Add light version of Linux's ipmmu_features
> >    iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
> >      macro
> >    iommu/ipmmu-vmsa: Add utlb_offset_base
> >    iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
> >    iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
> >    iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
> >    iommu/arm: Remove code duplication in all IOMMU drivers
>
> Skimming through the series, it looks like patch #1 - #6 are fully
> acked. The rest would need a respin.
>
> Can I commit the first part (i.e. #1 - #6)?
>

Please note, this is V1. But V2 [1] was pushed a couple of weeks ago and
all patches are already reviewed)

[1]
https://lore.kernel.org/xen-devel/1640034957-19764-1-git-send-email-oleksty=
sh@gmail.com/


> Cheers,
>
> >
> >   xen/drivers/passthrough/Kconfig          |   6 +-
> >   xen/drivers/passthrough/arm/iommu.c      |   7 +
> >   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 278
> +++++++++++++++++++------------
> >   xen/drivers/passthrough/arm/smmu-v3.c    |  10 --
> >   xen/drivers/passthrough/arm/smmu.c       |  10 --
> >   5 files changed, 178 insertions(+), 133 deletions(-)
> >
>
> --
> Julien Grall
>


--=20
Regards,

Oleksandr Tyshchenko

--0000000000006249eb05d67eb172
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 26, 2022 at 6:20 PM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Oleksandr,<b=
r></blockquote><div><br></div><div>Hi Julien,</div><div><br></div><div>[Sor=
ry for the possible format issues]</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
On 27/11/2021 17:51, Oleksandr Tyshchenko wrote:<br>
&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@=
epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; <br>
&gt; The R-Car S4 is an automotive System-on-Chip (SoC) for Car Server/Comm=
unication<br>
&gt; Gateway and is one of the first products in Renesas=E2=80=99 4th-gener=
ation R-Car Family.<br>
&gt; <br>
&gt; The integrated IOMMU HW is also VMSA-compatible and supports stage 2 t=
ranslation<br>
&gt; table format, therefore can be used with current R-Car Gen3 driver wit=
h slight<br>
&gt; modifications.<br>
&gt; <br>
&gt; In the context of Xen driver the main differences between Gen3 and S4 =
are<br>
&gt; the following:<br>
&gt;=C2=A0 =C2=A0- HW capacity was enlarged to support up to 16 IPMMU conte=
xts (sets of page table)<br>
&gt;=C2=A0 =C2=A0 =C2=A0and up to 64 micro-TLBs per IPMMU device<br>
&gt;=C2=A0 =C2=A0- the memory mapped registers have different bases and off=
set<br>
&gt; <br>
&gt; The first part (commits #1-6) is a non-verbatim port of Linux upstream=
 commits<br>
&gt; needed to add support for S4 series easily (prereq work).<br>
&gt; The second part (commits #7-8) is based on the code from the Renesas B=
SP and<br>
&gt; actually introduces support for R-Car S4 IPMMU.<br>
&gt; The third part (commits #9-10) is misc changes I have locally.<br>
&gt; <br>
&gt; The patch series is based on 4.16.0-rc4 branch and also available at [=
1].<br>
&gt; <br>
&gt; Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and Renesa=
s Spider<br>
&gt; board with S4 SoC.<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml=
1" rel=3D"noreferrer" target=3D"_blank">https://github.com/otyshchenko1/xen=
/commits/s4_ipmmu_ml1</a><br>
&gt; <br>
&gt; Oleksandr Tyshchenko (10):<br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Remove all unused register definitions<=
br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Add helper functions for MMU &quot;cont=
ext&quot; registers<br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Add helper functions for &quot;uTLB&quo=
t; registers<br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Add light version of Linux&#39;s ipmmu_=
features<br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Calculate context registers&#39; offset=
 instead of a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 macro<br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Add utlb_offset_base<br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support=
<br>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0<b=
r>
&gt;=C2=A0 =C2=A0 iommu/ipmmu-vmsa: Use refcount for the micro-TLBs<br>
&gt;=C2=A0 =C2=A0 iommu/arm: Remove code duplication in all IOMMU drivers<b=
r>
<br>
Skimming through the series, it looks like patch #1 - #6 are fully <br>
acked. The rest would need a respin.<br>
<br>
Can I commit the first part (i.e. #1 - #6)?<br></blockquote><div><br></div>=
<div>Please note, this is V1. But V2 [1] was pushed a couple of weeks ago a=
nd all patches are already reviewed)=C2=A0</div><div>=C2=A0</div><div>[1]=
=C2=A0<a href=3D"https://lore.kernel.org/xen-devel/1640034957-19764-1-git-s=
end-email-olekstysh@gmail.com/">https://lore.kernel.org/xen-devel/164003495=
7-19764-1-git-send-email-olekstysh@gmail.com/</a></div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0xen/drivers/passthrough/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0xen/drivers/passthrough/arm/iommu.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 =C2=A0xen/drivers/passthrough/arm/ipmmu-vmsa.c | 278 +++++++++++=
++++++++------------<br>
&gt;=C2=A0 =C2=A0xen/drivers/passthrough/arm/smmu-v3.c=C2=A0 =C2=A0 |=C2=A0=
 10 --<br>
&gt;=C2=A0 =C2=A0xen/drivers/passthrough/arm/smmu.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 --<br>
&gt;=C2=A0 =C2=A05 files changed, 178 insertions(+), 133 deletions(-)<br>
&gt; <br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--0000000000006249eb05d67eb172--

