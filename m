Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E12B5413
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 23:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28634.57700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kemdO-0000lm-K9; Mon, 16 Nov 2020 22:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28634.57700; Mon, 16 Nov 2020 22:06:02 +0000
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
	id 1kemdO-0000lN-Gr; Mon, 16 Nov 2020 22:06:02 +0000
Received: by outflank-mailman (input) for mailman id 28634;
 Mon, 16 Nov 2020 21:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5R5=EW=gmail.com=cheyenne.wills@srs-us1.protection.inumbo.net>)
 id 1kemV5-0008Gt-Av
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 21:57:27 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9dfdd29-918d-47b5-8f0f-665a0b259f77;
 Mon, 16 Nov 2020 21:57:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w142so27239972lff.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 13:57:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=s5R5=EW=gmail.com=cheyenne.wills@srs-us1.protection.inumbo.net>)
	id 1kemV5-0008Gt-Av
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 21:57:27 +0000
X-Inumbo-ID: b9dfdd29-918d-47b5-8f0f-665a0b259f77
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b9dfdd29-918d-47b5-8f0f-665a0b259f77;
	Mon, 16 Nov 2020 21:57:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w142so27239972lff.8
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 13:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=HlIbb1shyvkY+uIlBeMbS0LuUPpKa9ZgUjImKSNfQGE=;
        b=ZMDKu+9Izug6eJI9uJ+0I1A6fvrCuGTXbaDO6Op9NoD5UKmq98fyzSGzbUNhmG7GQw
         +3BXGXxgTvlvUyn8w8vIK574HxZFpov5G6pvTGPWtTEjZNXhpazidgoHxm4MagCGWzRo
         FvzbX1VAzclmLvGl6vNrwWd+py0KGBeTinJgV8QxitkCMSyA9JTU89GMS4pQIvws5hTJ
         7n0z3CnzDkBYf2NF4MlR679zeBD/iBai0haOGuqTgAx/bxDvFwgpfJK0xT/mANCQS8Ex
         5QzlLzHF0HsPswQ55rnjbUmiW3dX8JsF58xIVIeqEklz+CgxEe+0IlFQCZTrSQkZnFHz
         UA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=HlIbb1shyvkY+uIlBeMbS0LuUPpKa9ZgUjImKSNfQGE=;
        b=aGyIx0EB6wo9hC/E0lM++P7Cg6lxWaZ535Auvi8aZaSoVZ9ha6OYcSFSzO9LgoBhW3
         zrn3k7VHuqmP/P+qQdQ41emsid/S87Q+YgLnB7smPFanbm5ObKLE5FRVTUjF+JiAT/0n
         65SgBQTbbn6EXEHD6u/kYfOqRZaeV8fx45+0JsYAmPHvVuQUBQB2RzU2jW5YwHSJvu0f
         S5E7FSI8c5UQzSoKdhTjuFJtLtsuV+QS5lB5225/wrA9iOp5uNzhT/mapy9XzcJuq/zR
         tQZ6a1EKZH0ozZHlLs0Ann0Y8jLcGW4toUnZtWsGRWX9sFtJaF+9xzmGTeNn0sY3Lklg
         VDew==
X-Gm-Message-State: AOAM532yUTkQpi/UV/E46Ihj22y9aPqzK4lugjUcWPqX3kok10eHpG+R
	jHBjF+aKOi/7mFIdx09BVG52h6SpY5QgWlw8y8o/nVr9FFU=
X-Google-Smtp-Source: ABdhPJzSzC7gthH+PuQcAeHEMnR+a9R5GF9IgyKhKC6j1OhBM/CZ+oowKzPF6Knvb6j75jt1ybv8+avBuMlpBPDrGwk=
X-Received: by 2002:a19:c8ca:: with SMTP id y193mr493116lff.150.1605563845035;
 Mon, 16 Nov 2020 13:57:25 -0800 (PST)
MIME-Version: 1.0
From: Cheyenne Wills <cheyenne.wills@gmail.com>
Date: Mon, 16 Nov 2020 14:57:14 -0700
Message-ID: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
Subject: XSA-351 causing Solaris-11 systems to panic during boot.
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a5c9d505b4407665"

--000000000000a5c9d505b4407665
Content-Type: text/plain; charset="UTF-8"

Running Xen with XSA-351 is causing Solaris 11 systems to panic during
boot.  The panic screen is showing the failure to be coming from
"unix:rdmsr".  The panic occurs with existing guests (booting off a disk)
and the  booting from an install ISO image.

I discussed the problem with "andyhhp__" in the "#xen" IRC channel and he
requested that I report it here.

This was failing on a Xen 4.13 and a Xen 4.14 system built via gentoo.

I understand that ultimately this is a bug in Solaris.  However it does
impact existing guests that were functional before applying the XSA-351
security patches.

--000000000000a5c9d505b4407665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Running Xen with XSA-351 is causing Solaris 11 systems to =
panic during boot.=C2=A0 The panic screen is showing the failure to be comi=
ng from &quot;unix:rdmsr&quot;.=C2=A0 The panic occurs with existing guests=
 (booting off a disk) and the=C2=A0 booting from an install ISO image.=C2=
=A0<br><br>I discussed the problem with &quot;andyhhp__&quot; in the &quot;=
#xen&quot; IRC channel and he requested that I report it here.<br><br>This =
was failing on a Xen 4.13 and a Xen 4.14 system built via gentoo.<br><br>I =
understand that ultimately this is a bug in Solaris.=C2=A0 However it does =
impact existing guests that were functional before applying the XSA-351 sec=
urity patches.</div>

--000000000000a5c9d505b4407665--

