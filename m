Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127822074F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 10:32:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvcpm-000519-6h; Wed, 15 Jul 2020 08:32:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJCN=A2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jvcpl-000514-BL
 for xen-devel@lists.xen.org; Wed, 15 Jul 2020 08:32:09 +0000
X-Inumbo-ID: ab8c5446-c675-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab8c5446-c675-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 08:32:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z13so1494940wrw.5
 for <xen-devel@lists.xen.org>; Wed, 15 Jul 2020 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oFaTic2J9aEhYOAcvU8ROjalBQdQEVEoC2cLZwlwnKU=;
 b=tBZf1pqm1aKtx68JMF1vWwJHNBf7SzgQOxCSWBuFsPT3ZSj88H8aVam0PXGtxWsK2p
 LPJu1Imph3yAZvVB7lDAdayNjtrjGbMFZjtffDSV6BR+bQTyimWT4txevBfCKReLlKUs
 H+Ew4lRbrfxQ3o442AN/PRzZgDD83DEkaGsWoZUCoIeWuQsOgxdhOZH5Q61QLj/nYChR
 fPz0iig3nwkRRPBiRugqWmszBvyhxu0zknvODsN/x+NcdSecGQuYWjOJ2WeA1P0ogI1v
 L/JwXmPR53fxbtuFWj1kEfHx1tVhWYRH+C9FJzIY2dJeEFD7heQASGi5YbujabQDcLJe
 TXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oFaTic2J9aEhYOAcvU8ROjalBQdQEVEoC2cLZwlwnKU=;
 b=ODM9YAXsyv4BIL7E+12vccpn/ZcQZbK9VhqHh6a2bWDSngbCXl9jbP8aGBev+FwloJ
 nXQzA9megKJCVT14aoG7uUnsRsdR4uC+/P+QibMKKBEdQMPVlBFf4691R0sS5tjRIPB/
 RtG1WL7B0uUy5Ss/eLMcFFdxRVJ7mERLQLhvYvj+kxz2uwJLuo91IwYStMC3G7gyETNC
 2m8VZkZu5CFiEwcq7G2fEeXBqzmz520O5g8awTN+ka00Gmg04S5DZ8LDajFqKDK40SBM
 Be8CSBycjjFhIRGOhPZMPzjk9RvvhFdn6xMjfq+9zLDCDsR0u0Cw9X0LumjLmgXYzxjC
 Dvzg==
X-Gm-Message-State: AOAM532QlWpjZEHo/a6ZotUn+yyPqWAVRb5Et48b8CI08vx12Ks90Igt
 5CLCu5hTjb+eQZCs5RxVqqJFSV4tN+Od5FbNX3I=
X-Google-Smtp-Source: ABdhPJy6RLGkDJvsLOl/Ba4wmCtrxHhI4uA34a7lWIKol4dLNNOYWcYi2fTzk34ryT+Z+vuD3nx/xjWrMRN7o+16jW4=
X-Received: by 2002:adf:f751:: with SMTP id z17mr10544307wrp.114.1594801927584; 
 Wed, 15 Jul 2020 01:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
 <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
 <67b4454424c4485fb59d542d052aaf2d@in.bosch.com>
 <CAPD2p-nZZpDBZ5yc=gVvVAW1oFdN0KZ2jMH-T59W_sntsENwxw@mail.gmail.com>
 <3f155a0b598745a3b2d158599dd992fd@in.bosch.com>
 <0AC5E91F-7C7A-4B5A-AE55-E48574AB04C5@arm.com>
In-Reply-To: <0AC5E91F-7C7A-4B5A-AE55-E48574AB04C5@arm.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 15 Jul 2020 11:31:55 +0300
Message-ID: <CAPD2p-kh7XoG+DGs08rjJQBOOPUDFOsc_yys+p6jTAqRBYyymg@mail.gmail.com>
Subject: Re: [BUG] Xen build for RCAR failing
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
Content-Type: multipart/alternative; boundary="0000000000006180a705aa76c2a0"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd <nd@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000006180a705aa76c2a0
Content-Type: text/plain; charset="UTF-8"

Hello all

[Sorry for the possible format issues]


> > Is there any document which I could refer to bring up Xen[DOM0] and have
> an hands on ? because am currently seeing no output after this
>

The actual document I am aware of [1]. *Although this is not exactly how to
bring up Xen Dom0*, this is about how to bring up the whole Xen based
system (based on v4.13 release) with thin generic ARMv8 Dom0 without H/W,
DomD with H/W (based on Renesas BSP v3.21.0) and DomU with set of PV
drivers, so contains a lot of probably an extra/unneeded information for
you, but you could refer to meta-xt-prod-devel/meta-xt-images Yocto layers
anyway in order to find information regarding various Xen bits
(including default chosen node for Host device tree).

[1]
https://github.com/xen-troops/meta-xt-prod-devel/blob/master/INSTALL.txt

-- 
Regards,

Oleksandr Tyshchenko

--0000000000006180a705aa76c2a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hello all</div><div><br></=
div><div>[Sorry for the possible format issues]<br></div><br><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; Is there any document which I could refer to bring up Xen[DOM0] and ha=
ve an hands on ? because am currently seeing no output after this<br></bloc=
kquote><div><br></div><div>The actual document I am aware of [1]. *Although=
 this is not exactly how to bring up Xen Dom0*, this is about how to bring =
up the whole Xen based system (based on v4.13 release) with thin generic AR=
Mv8 Dom0 without H/W, DomD with H/W (based on Renesas BSP v3.21.0) and DomU=
 with set of PV drivers, so contains a lot of probably an extra/unneeded in=
formation for you, but you could refer to=C2=A0meta-xt-prod-devel/meta-xt-i=
mages Yocto layers anyway in order to find information regarding various Xe=
n bits (including=C2=A0default chosen node for Host device tree).</div><div=
><br></div><div>[1]=C2=A0 <a href=3D"https://github.com/xen-troops/meta-xt-=
prod-devel/blob/master/INSTALL.txt">https://github.com/xen-troops/meta-xt-p=
rod-devel/blob/master/INSTALL.txt</a></div></div><div><br></div>-- <br><div=
 dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><=
span style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span sty=
le=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></fo=
nt></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span styl=
e=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchen=
ko</font></span></div></div></div></div></div></div></div></div>

--0000000000006180a705aa76c2a0--

