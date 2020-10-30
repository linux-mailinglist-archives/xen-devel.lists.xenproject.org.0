Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BC29FF61
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 09:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15456.38470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYPPm-0004jh-U5; Fri, 30 Oct 2020 08:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15456.38470; Fri, 30 Oct 2020 08:05:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYPPm-0004jI-Qe; Fri, 30 Oct 2020 08:05:38 +0000
Received: by outflank-mailman (input) for mailman id 15456;
 Fri, 30 Oct 2020 08:05:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXzT=EF=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1kYPPk-0004jD-H8
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:05:36 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e054684-22f0-4b32-b28d-76acc7bf1673;
 Fri, 30 Oct 2020 08:05:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id dg9so5617000edb.12
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 01:05:35 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=AXzT=EF=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
	id 1kYPPk-0004jD-H8
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:05:36 +0000
X-Inumbo-ID: 0e054684-22f0-4b32-b28d-76acc7bf1673
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0e054684-22f0-4b32-b28d-76acc7bf1673;
	Fri, 30 Oct 2020 08:05:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id dg9so5617000edb.12
        for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+W8Syh9vDrLxoDxx3JbwPAyYgekK9oE44RncrvpEX1E=;
        b=H7Kvgh4A71Iou9ViSAqjmbvaEh2Xohe1FbjT8oYVIfSr+/2jhwib63AROFHMJVi36w
         H1e7hfNXNmvLqKP0FLoU0nXpKcbP58eKa6f+H+q/VHJi1SgMqyEbTEQXu9db9zlx49Xw
         3QYWg4zRtHnp0JXW6512Byo71YUBZMxZQb7SpdZZtoX2QhC0F/fx4jvGO6JZtbn/tdb8
         UOa2y5jmBV9zi6nmpMAT/8h1/DRWFtAcTcArGS1zob97KEbwC7uoc4j2q0uhTwADbT3w
         Kd2fVAfoS/KtDBRJvhHBvTjspS5Kd63/0RMsb+dCCtkRlD3e98V4CSm5wpr5YJKoNbAh
         u/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+W8Syh9vDrLxoDxx3JbwPAyYgekK9oE44RncrvpEX1E=;
        b=Ull6y97MGKr2T/k1WdUDdnmVae0lB6z7NO2rdjh1Aa5yoR/ArJMHUiCYFcg7DxuN2F
         7AfZulfBhi3OTtzMSEhSvXkah0H6OAOE6U1H79s3odM+EYtQZ5YOj0S6X1v3kPee0Wmm
         cu2Zq3z7A54CX0q83BbVbdquKJ+TYu1vQK8ztwin/HHLqNu3Wg7yuukBB6paLXaCUvn4
         x3mlWp1jt2PJEC2h9FhUo2KkA+2LQc0sjJ107CvZFNA1WGbDbW0Jjmf3hQ0jUvU3UZFC
         Q2M6HjbU8nBDINwJTVmVpNKbC1yoG8CqkC+dgBmdcBfEpl8C0Amw7MV70+0JoNJsvPvf
         AeSQ==
X-Gm-Message-State: AOAM533m6NGCURsbxUvSC7n9KGVjGW/lQg3nvlVw8mNK4OyLjfCx1UTR
	fiy0nJcP2HP3ycN8upTLWo15Y7XYS5b+TZv1nvc=
X-Google-Smtp-Source: ABdhPJwAzHJL/B15MxhX4Scz95CdufOBBB/pgX/hI7IUh5HrGvbAVvyFTs9OP8Zyv5YfMRK7pRXf/vq+wy4ae/8OsKY=
X-Received: by 2002:aa7:dd42:: with SMTP id o2mr998428edw.53.1604045134553;
 Fri, 30 Oct 2020 01:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201029220246.472693-1-ehabkost@redhat.com> <20201029220246.472693-15-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-15-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Oct 2020 12:05:23 +0400
Message-ID: <CAJ+F1CKZD5V8BJ1GHvt_GZ53Ytdtz-6Ja4h+L_wWZ_YW_x6dcQ@mail.gmail.com>
Subject: Re: [PATCH 14/36] qdev: Move dev->realized check to qdev_property_set()
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Paul Durrant <paul@xen.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	"open list:Block layer core" <qemu-block@nongnu.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, 
	"Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
	Qemu-s390x list <qemu-s390x@nongnu.org>, Max Reitz <mreitz@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000072e65e05b2dedc08"

--00000000000072e65e05b2dedc08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 2:10 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Every single qdev property setter function manually checks
> dev->realized.  We can just check dev->realized inside
> qdev_property_set() instead.
>
> The check is being added as a separate function
> (qdev_prop_allow_set()) because it will become a callback later.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

nice
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000072e65e05b2dedc08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 2:10 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ev=
ery single qdev property setter function manually checks<br>
dev-&gt;realized.=C2=A0 We can just check dev-&gt;realized inside<br>
qdev_property_set() instead.<br>
<br>
The check is being added as a separate function<br>
(qdev_prop_allow_set()) because it will become a callback later.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>nice<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D=
"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=
=A0 <br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">M=
arc-Andr=C3=A9 Lureau<br></div></div>

--00000000000072e65e05b2dedc08--

