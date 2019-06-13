Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18643467
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 10:52:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbLQ4-0003af-FM; Thu, 13 Jun 2019 08:49:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okag=UM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbLQ3-0003aa-4C
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 08:49:15 +0000
X-Inumbo-ID: 1e8e6836-8db8-11e9-8980-bc764e045a96
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1e8e6836-8db8-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 08:49:13 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id j19so18219432otq.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 01:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zi6bdO+k+a/rhAW1K8M2lNRReKcW2EqTLDjt9VPhogE=;
 b=mwhc1yy/ovpTOxrbDjZ1RncST41JSnIbKWbv0VraVig539QWsEcQ7pdN29Hb5XDLJU
 5zEYWnwzlkEbRfJOjhgywx3yNmhgsPjc47k7HXg41F22qkzflJJNB4ImAoZKc6SiZoKu
 WQy8iobTHWXg2CQhGtBIL6LbnvIOhfPI7TUB99w6MtWzwoKPQ10GHOdvzKOh/RIq/Ct8
 ZlROuXPG5zQa/N/h4NEWd1rtaNAmxCFzR1caLKiZaR4xISlB5wO0MUMKTnGvr/OLUess
 OvUhUqSd0tURKvjM3YI7vviL8Ddarhfmgcjxn2fwq5odv/vw+lUsrNzcLv8K3o3LVWP/
 QWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zi6bdO+k+a/rhAW1K8M2lNRReKcW2EqTLDjt9VPhogE=;
 b=o0HITP8Assf8b00RlAXLPK1FeQTNQwQBuyzHEocpWkDx2xvb63Zd4rFx3NluSkj4kY
 W9wf1sffSLqxAfo3fchgQ34LPyo+hPx1hwekFwXmwfU0OakmLMtNZaBrVHrIBrlbWM7q
 8KDJcGgO6yW5fZ4L/f/kjC55p0HGrIYDDhcqBDkG5LB5rO4QActY7+nYrGkG8PCM6zCc
 TkAko/yyI25CwVb09gOj4Z7zABMIpMtChsiptBxcmBdNmdi8s3PUT++HJEJ1tJ6kfK//
 iCRtqzHaHYk2glD6VfB4qbKrfAZu60XX2ClCgLV4b+3wcBsBlh5Cg6M7jyLuJvH8ofFW
 vQ7w==
X-Gm-Message-State: APjAAAVpSscg1kKgF/MK0Ekq78UJfcuE4myfawz9Q2PWrnKuaM3Y63Y1
 NCvx4W10LJYGgl2DdY7Lwv9Kc+9uP5IXGMMCPrM=
X-Google-Smtp-Source: APXvYqw2Vd6ImMPEaO1Iz2XQbkkGx6ie3rNsHrhjgFQDnpFiOBpfPrBP0j7NHHDhI2OemVI2ie/q8pgHsW2UNweiWT4=
X-Received: by 2002:a9d:6f03:: with SMTP id n3mr760829otq.283.1560415753419;
 Thu, 13 Jun 2019 01:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-14-jgross@suse.com>
 <c2fcade8-8cad-9f02-0f1b-35e0b156ff72@gmail.com>
 <bdc2b540-3218-ffb2-04ce-ea1acdab25c2@suse.com>
 <e38e96d2-1de4-2ae0-e31a-adb96eaa07ce@gmail.com>
 <273df2ce-c7e5-6411-a030-2d7e4dcc7198@suse.com>
In-Reply-To: <273df2ce-c7e5-6411-a030-2d7e4dcc7198@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Date: Thu, 13 Jun 2019 11:49:02 +0300
Message-ID: <CAC1Wxdh-1dkCe9oBaWA9_GXbmkCYXpGpGiZNdpcevUE2s-bttQ@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5767531140528093846=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5767531140528093846==
Content-Type: multipart/alternative; boundary="000000000000af4187058b309a15"

--000000000000af4187058b309a15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 13 =D1=87=D0=B5=D1=80=D0=B2. 2019 =D0=BE 11:39 Juergen Gross =
<jgross@suse.com> =D0=BF=D0=B8=D1=88=D0=B5:

> github.com/jgross1/xen sched-v1-rebase
>
> Only compile tested on x86 up to now, but rebase was rather easy.
>

Cool, will take it and check for ARM.
Thank you.

Sincerely,
Andrii Anisov.

--000000000000af4187058b309a15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><br></div></div=
></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=
=87=D1=82, 13 =D1=87=D0=B5=D1=80=D0=B2. 2019 =D0=BE 11:39 Juergen Gross &lt=
;<a href=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; =D0=BF=D0=B8=D1=
=88=D0=B5:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<a href=3D"http://github.com/jgross1/xen" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/jgross1/xen</a> sched-v1-rebase<br>
<br>
Only compile tested on x86 up to now, but rebase was rather easy.<br></bloc=
kquote><div><br></div><div>Cool, will take it and check for ARM.</div><div>=
Thank you.</div><div><br></div>Sincerely,<div>Andrii Anisov.=C2=A0</div></d=
iv></div>

--000000000000af4187058b309a15--


--===============5767531140528093846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5767531140528093846==--

