Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE4401234
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 02:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179258.325496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN2DZ-0005qW-ND; Mon, 06 Sep 2021 00:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179258.325496; Mon, 06 Sep 2021 00:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN2DZ-0005oj-JR; Mon, 06 Sep 2021 00:10:33 +0000
Received: by outflank-mailman (input) for mailman id 179258;
 Mon, 06 Sep 2021 00:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZwUt=N4=unixindia.com=bhasker@srs-us1.protection.inumbo.net>)
 id 1mN2DX-0005ob-KC
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 00:10:31 +0000
Received: from mail-io1-xd2e.google.com (unknown [2607:f8b0:4864:20::d2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69973039-38c7-4729-a02f-b33b902cadbd;
 Mon, 06 Sep 2021 00:10:30 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id y18so6627259ioc.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Sep 2021 17:10:30 -0700 (PDT)
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
X-Inumbo-ID: 69973039-38c7-4729-a02f-b33b902cadbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unixindia.com; s=mail;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=GxF+ayA/gKbFEeVpCODk2PNYX4glvADmxV7Gx3ybgIU=;
        b=a8NpY+rVtH87EPNsbyAx0M6Um/29TPQMeYPdrsOjv/NqC1UYXo5ZP13tBiVQaI9Fee
         NRm5yL4TakS2hi/uhoP+BAthc2gxkEioNi+ANZjWV/jiLBMO/oqRDYiiIpnDVJ2gsxmQ
         9ToMF7Noge9u6nV/QysfeR25koGJKfRKYwyigATOyBjjmwEOtVHfIpRM294q7TjL01Og
         dUhSr2ZdosJlyqsPh+cjR3ZnkZz0Zs/iNko3hsVv3NTy5S7OOMQ8CqraDzpAK/3A3fDk
         xLDhB5QWPPKkX0U0RA+M091QxeE/45HCPVrNMK5RzqJP2KI3+vI4To9CpGYeqLqGWZwT
         tjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=GxF+ayA/gKbFEeVpCODk2PNYX4glvADmxV7Gx3ybgIU=;
        b=WnsZfxIig20zWd1H1pQakq5qoRlIv8BO/E26EboniMAOmNMw4ONumRCXo0nf5Yc4RK
         qW+iuUS9C8cUyg3gWSFWDhZW91v172/Ru0je7f9cTOgUrszkV/BHBwpw7Wfu6URa/u6f
         kX3Iw8eojbwKiVuEJJqy3QeHWD/Kt0PB4XbW2bQbn58U0s/zIxlZ+PvI/nHng0Kwt9+t
         Aph+3CAV0cTF8S5YLqLuGhD5zNlXdQUEu+V350/X5/mdPE5lkx5V5jQzB53zvSn1VR/l
         +l9kEeQBDFJ7N3tWjemDyiyl5kZ+x1CKwZ0N3JMQ0EbPZSBwhiSFcm5ClH43437l2Oz3
         TIFw==
X-Gm-Message-State: AOAM530cdVIvUbGhHmMIyBJhjcU6KoGC/pJPA5ECUd9GbRYaTGyx39P+
	QGz672a3Gu7yJeE18DDDeostCbcBLLQR04pTzLcKCQ==
X-Google-Smtp-Source: ABdhPJzmlGrjP9v8qzWH6l5kaYjSyu5HD1L9QeBkTQuvo0jy1HBRGTcHJYUOCBUpM+mCQagBFP/gvxx7+hS33W+ySPI=
X-Received: by 2002:a6b:f203:: with SMTP id q3mr7596862ioh.32.1630887030484;
 Sun, 05 Sep 2021 17:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPLCSGD9ZTaoMSqgo6EEdW4VYs9wrz+YvChR_Cx0Rkm8x5iq0w@mail.gmail.com>
In-Reply-To: <CAPLCSGD9ZTaoMSqgo6EEdW4VYs9wrz+YvChR_Cx0Rkm8x5iq0w@mail.gmail.com>
From: Bhasker C V <bhasker@unixindia.com>
Date: Mon, 6 Sep 2021 01:10:19 +0100
Message-ID: <CAPLCSGAsCi=WEy+=3Cit4_e_G=EfcN9TB4B1CkeVxyJvc7o7EQ@mail.gmail.com>
Subject: Re: DomU crashes when restored if it has pci passthrough
To: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000001f044005cb487a35"

--0000000000001f044005cb487a35
Content-Type: text/plain; charset="UTF-8"

Ignore me on this
https://wiki.xenproject.org/wiki/Xen_PCI_Passthrough
says it is not possible

On Mon, Sep 6, 2021 at 1:06 AM Bhasker C V <bhasker@unixindia.com> wrote:

> Hi,
>  I have a domU and that domU has network vf attached to it.
>  The save and restore leads to crash of the domU after restore.
>  Am I doing anything wrong?
>
> Regards
> Bhasker C V
>

--0000000000001f044005cb487a35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ignore me on this <br></div><div><a href=3D"https://w=
iki.xenproject.org/wiki/Xen_PCI_Passthrough">https://wiki.xenproject.org/wi=
ki/Xen_PCI_Passthrough</a></div><div>says it is not possible<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Sep 6, 2021 at 1:06 AM Bhasker C V &lt;<a href=3D"mailto:bhasker@unixind=
ia.com">bhasker@unixindia.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div>=C2=A0I ha=
ve a domU and that domU has network vf attached to it. <br></div><div>=C2=
=A0The save and restore leads to crash of the domU after restore. <br></div=
><div>=C2=A0Am I doing anything wrong?</div><div><br></div><div>Regards</di=
v><div>Bhasker C V<br></div></div>
</blockquote></div>

--0000000000001f044005cb487a35--

