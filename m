Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BEF8547E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 22:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvSYm-0007Xb-II; Wed, 07 Aug 2019 20:29:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lq+z=WD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvSYl-0007XW-Om
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 20:29:23 +0000
X-Inumbo-ID: 0a26ba8b-b952-11e9-8980-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0a26ba8b-b952-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 20:29:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v15so173777wml.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XSgOaQCXduP4OXzPFC/tzsScani4KjMPEuFNDVoPHfk=;
 b=TshCcTaay76SrR+HbaITF1kw7wU2L6/3Z7ursujm40l/4TEGG7Nu22ktXQAW95IRrc
 Adfx4XP1cGHBalU3KtIBbeIaHbGNfFHhBl6JdjrAXa07XZMden2gyr2cvKpqwISQ9fPz
 Zhi1p/RVTxe3EApwtCmuJ8gtrDaI/nVXTWXszutFJDxz1m8NlLby8YjJ32yX9H0I3Vv/
 h+oEEmFzN64c9WEVNLRrXNw0iAqaKXpQ8PknT7RS9ytjKSNHNPAOImyhi8GeoOBEZZQn
 uNARjs2ZfI1YXZbm3Of2Mv65hptMvmoYwT5BrNHTFeAbq/7n4Q3OcNTRZqlwhDwjZvQ3
 azqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSgOaQCXduP4OXzPFC/tzsScani4KjMPEuFNDVoPHfk=;
 b=BKxa5LUo+GTm4iMFUJUPbXghnfKPFYyJbfHmKz8JUMEJ8bbO/Skn9WX1PL9uXQi8Xc
 aE6Lddwd7qPOPvyRPElpYnFePCHXdAupyj1h4ER4XStsMJGGNzhKDBkejV+/fcGhRyNq
 F/vzQE6xyRMsCMWSURt959Vfs4Isj0xQgS6gODqpoVy1LsKfkjhfPZM1/OQrpoDEkWuz
 I4ZimDxW8K+7LOHcSuSW+3O8oTUoa1Da8i47zWw7L0WE/VKXJViKJ3+NkWNZ7cp5xUA1
 Ur4xfy8gbbg28UdM1fWgcuTgq/MbKsZxBEj9r7y0ywM7lypnJ1yl2nNi73w6GkoYjY6u
 jogg==
X-Gm-Message-State: APjAAAWa66ThAoV4lEkxzX2XgalMrGbOYX0cuCBhZ/Ey1l23gMByg+lL
 Mpb4x0ajRwXgL1l2C6KsPhytNkf2z2rOUjGy2Xo=
X-Google-Smtp-Source: APXvYqxNZK6vqYGH09/B6C2F0da4yJfnUFkvoxNrCoGlm8ZyDUzTgSSKgNqBUuyYH2btk2cceKZeJl3+m+vHnbqjVZM=
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr139556wma.37.1565209761251;
 Wed, 07 Aug 2019 13:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
 <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
In-Reply-To: <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 7 Aug 2019 23:28:48 +0300
Message-ID: <CAPD2p-kJe6=YZ_rPrdDpay-u+r3GDPp58LpxqLpBg0oN_3W1-g@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: multipart/mixed; boundary="===============2940975209694114562=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2940975209694114562==
Content-Type: multipart/alternative; boundary="000000000000d188ab058f8ccb43"

--000000000000d188ab058f8ccb43
Content-Type: text/plain; charset="UTF-8"

Hi, Julien.
Sorry for the possible format issues.


> > No, it is not disabled. But, ipmmu_irq() uses another mmu->lock. So, I
> > think, there won't be a deadlock.
> >
> > Or I really missed something?
> >
> > If we worry about ipmmu_tlb_invalidate() which is called here (to
> > perform a flush by request from P2M code, which manages a page table)
> > and from the irq handler (to perform a flush to resume address
> > translation), I could use a tasklet to schedule ipmmu_tlb_invalidate()
> > from the irq handler then. This way we would get this serialized. What
> > do you think?
>
> I am afraid a tasklet is not an option. You need to perform the TLB
> flush when requested otherwise you are introducing a security issue.
>
> This is because as soon as a region is unmapped in the page table, we
> remove the drop the reference on any page backing that region. When the
> reference is dropped to zero, the page can be reallocated to another
> domain or even Xen. If the TLB flush happen after, then the guest may
> still be able to access the page for a short time if the translation has
> been cached by the any TLB (IOMMU, Processor).
>

>
I understand this. I am not proposing to delay a requested by P2M code TLB
flush in any case. I just propose to issue TLB flush (which we have to
perform in case of page faults, to resolve error condition and resume
translations) from a tasklet rather than from interrupt handler directly.
This is the TLB flush I am speaking about:

https://github.com/otyshchenko1/xen/blob/ipmmu_upstream2/xen/drivers/passthrough/arm/ipmmu-vmsa.c#L598

Sorry if I was unclear.

--000000000000d188ab058f8ccb43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-family:sans-serif">Hi, Julien.=C2=A0<=
/span><div dir=3D"auto"><span style=3D"font-family:sans-serif">Sorry for th=
e possible format issues.</span><div dir=3D"auto"><font face=3D"sans-serif"=
><br></font><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; No, it is not disabled. But, ipmmu_irq() uses another mmu-&gt;lock. So=
, I <br>
&gt; think, there won&#39;t be a deadlock.<br>
&gt; <br>
&gt; Or I really missed something?<br>
&gt; <br>
&gt; If we worry about ipmmu_tlb_invalidate() which is called here (to <br>
&gt; perform a flush by request from P2M code, which manages a page table) =
<br>
&gt; and from the irq handler (to perform a flush to resume address <br>
&gt; translation), I could use a tasklet to schedule ipmmu_tlb_invalidate()=
 <br>
&gt; from the irq handler then. This way we would get this serialized. What=
 <br>
&gt; do you think?<br>
<br>
I am afraid a tasklet is not an option. You need to perform the TLB <br>
flush when requested otherwise you are introducing a security issue.<br>
<br>
This is because as soon as a region is unmapped in the page table, we <br>
remove the drop the reference on any page backing that region. When the <br=
>
reference is dropped to zero, the page can be reallocated to another <br>
domain or even Xen. If the TLB flush happen after, then the guest may <br>
still be able to access the page for a short time if the translation has <b=
r>
been cached by the any TLB (IOMMU, Processor).<br></blockquote></div><div c=
lass=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></bl=
ockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto"><span style=3D=
"font-family:sans-serif">I understand this. I=C2=A0am not proposing to dela=
y a requested by P2M code TLB flush in any case. I just propose to issue TL=
B flush (which we have to perform in case of page faults, to resolve error =
condition and resume translations) from a tasklet rather than from interrup=
t handler directly. This is the TLB flush I am speaking about:</span><br></=
div><div dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"></d=
iv><div dir=3D"auto"><a href=3D"https://github.com/otyshchenko1/xen/blob/ip=
mmu_upstream2/xen/drivers/passthrough/arm/ipmmu-vmsa.c#L598">https://github=
.com/otyshchenko1/xen/blob/ipmmu_upstream2/xen/drivers/passthrough/arm/ipmm=
u-vmsa.c#L598</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">So=
rry if I was unclear.</div><div class=3D"gmail_quote" dir=3D"auto"></div></=
div></div></div>

--000000000000d188ab058f8ccb43--


--===============2940975209694114562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2940975209694114562==--

