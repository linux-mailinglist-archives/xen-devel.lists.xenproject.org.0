Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BDFA022
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 02:29:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUhQC-0004DF-Nw; Wed, 13 Nov 2019 01:26:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0j9=ZF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iUhQB-0004DA-1v
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 01:26:11 +0000
X-Inumbo-ID: 924e42a0-05b4-11ea-b678-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 924e42a0-05b4-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 01:26:10 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q28so472893lfa.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 17:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DddW5obqnL+hviTFYtYs29banFroDCZ7edn0AlidUA4=;
 b=MvTvEWhNuvsy84Y9Jc+cwKsS1XWEGt6avPv0C1RCFEAEKZQdwlfXeENScRkLDZwO8w
 KBS1Kv42UPKCb064DM6Eb5GA9gzZYuFTVo+R2p2eetvhCGKrwS68ndQdoJCVFe5Ew9zY
 lzFUzbHn9HwMVomnTLptiq5tuy+fU6/bWy7YkGl87va6Ae6DlsTJpG4chvv7LgqaivrZ
 6v4K2Vj6BA3mZb42qHiOR1yoAuj5/xljRofCzG3kEGtqTXsXZr8a3Xaj1GFxijj8l8Sv
 YwFN4xXgE0hgbBjn7tQ+pAZchRRCQ3xObomRK7ZAJ5EyqqohIcPye3/N5UsQrlB1shPi
 ehAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DddW5obqnL+hviTFYtYs29banFroDCZ7edn0AlidUA4=;
 b=kImoN2JtfA9CGmVQBNn8Bp0nKHb+urIisEJ/WVuiCm1E3Z9wNm6rcEovOF1B/+02FI
 AjkFGd3vpdYafFnPwOgpD30pqvsLTha1i4Uu1MmDdLJVcmCOR/YsZkbxDNyzk/Jzsqsa
 FML2EfhqYcJkKIztgIoqwa9MUrNYZRc2PTW4YKQ5QJoD99ImQhLGeQIwcQpVNN6w735h
 dTmrFT9q8fJcgHT8ba+qMwLZKsJYCFlqjw4jjGGKzc46nODSXI8L4TNXCxRHxDkQA6sz
 /94xB3ekwdfiIIq1AoRbsKgztiRFojHJis9KEQFMjcQocVrwQO9z7TM3v6UPnQVNrKQo
 C5Zg==
X-Gm-Message-State: APjAAAVcQSjlryOmFt7ocC5nnU7XLLvwz920AA2PQcg9If3fpGX4voPC
 ajobMsnn2msMuFSCXyNyC18N0wPaiY/P57AzC5k=
X-Google-Smtp-Source: APXvYqznreALwl2eK8G3kYRAc30BeJAOI4ijl1+4TnWrhNgD/tlc7NuFhqEKg1FOwXkoAd2vp/4pIMg3EdjGFEwtMXk=
X-Received: by 2002:ac2:5967:: with SMTP id h7mr478176lfp.119.1573608369180;
 Tue, 12 Nov 2019 17:26:09 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-8-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111258060.2677@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911111258060.2677@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 13 Nov 2019 10:25:56 +0900
Message-ID: <CAJ=z9a0hddNaygJGtOmcRJbSq3OAtt5VyAfsawrp1U7pxQ051Q@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [RFC 7/7] arm/gic-v3: add GIC version suffix to
 iomem range variables
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: multipart/mixed; boundary="===============5117778692926178058=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5117778692926178058==
Content-Type: multipart/alternative; boundary="000000000000dc54930597303f59"

--000000000000dc54930597303f59
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2019, 05:59 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 6 Nov 2019, Andrii Anisov wrote:
> > From: Andrii Anisov <andrii_anisov@epam.com>
> >
> > ARM Compiler 6.6 has a proven bug: static data symbols, moved to an init
> > section, becomes global. Thus these symbols clash with ones defined in
> > gic-v2.c. The straight forward way to resolve the issue is to add the GIC
> > version suffix, at least for one of the conflicting side.
> >
> > Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
> The patch is acceptable but this seems a very serious compiler bug.
>

I am a bit worried this is not going to prevent introducing any similar bug
in the future. I think, we have a way to enforce uniq symbols (see
CONFIG_UNIQUE_SYMBOLS). Would it work for you here?


This, together with the other bug described in the previous patch, makes
> me think the ARMCC is not quite ready for showtime. Do you know if there
> are any later version of the compiler that don't have these problems?
>

Related to this as this been reported to Arm?

Cheers,

-- 
Julien Grall

--000000000000dc54930597303f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Nov 2019, 05:59 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, 6 Nov 2019, Andrii Anisov=
 wrote:<br>
&gt; From: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" targ=
et=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br>
&gt; <br>
&gt; ARM Compiler 6.6 has a proven bug: static data symbols, moved to an in=
it<br>
&gt; section, becomes global. Thus these symbols clash with ones defined in=
<br>
&gt; gic-v2.c. The straight forward way to resolve the issue is to add the =
GIC<br>
&gt; version suffix, at least for one of the conflicting side.<br>
&gt; <br>
&gt; Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.=
com" target=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br=
>
<br>
The patch is acceptable but this seems a very serious compiler bug.<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I am a b=
it worried this is not going to prevent introducing any similar bug in the =
future. I think, we have a way to enforce uniq symbols (see CONFIG_UNIQUE_S=
YMBOLS). Would it work for you here?</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
This, together with the other bug described in the previous patch, makes<br=
>
me think the ARMCC is not quite ready for showtime. Do you know if there<br=
>
are any later version of the compiler that don&#39;t have these problems?<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Re=
lated to this as this been reported to Arm?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">--=C2=A0</div><div dir=3D"auto">Julien Grall</div></div>

--000000000000dc54930597303f59--


--===============5117778692926178058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5117778692926178058==--

