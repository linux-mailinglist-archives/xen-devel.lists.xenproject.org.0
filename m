Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA06009DE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424222.671486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okM2Q-0003Cl-Lj; Mon, 17 Oct 2022 09:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424222.671486; Mon, 17 Oct 2022 09:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okM2Q-0003AB-I8; Mon, 17 Oct 2022 09:03:58 +0000
Received: by outflank-mailman (input) for mailman id 424222;
 Mon, 17 Oct 2022 09:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+MA=2S=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1okM2P-0003A5-Uk
 for xen-devel@lists.xen.org; Mon, 17 Oct 2022 09:03:58 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a136f446-4dfa-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 11:03:57 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so13633105pjg.1
 for <xen-devel@lists.xen.org>; Mon, 17 Oct 2022 02:03:56 -0700 (PDT)
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
X-Inumbo-ID: a136f446-4dfa-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nzj+jkiTKIXkymGOxQlOiKZpAMfEDnJH3v97ZK7JO2s=;
        b=PJ3Ulk4pXYm9AmwniJN//p76KuxnUvToHEdYLDq6AZA5uF6Yu6zOTN8wbGnfhJjUz5
         rXeFyJJSP50NUl27i6vWeyxGiGjHYJv1AexvsHtfOF7xTE2nymvLBv1GZYK8JBZXqMSv
         Kl21dI6Qci33WNG4lqdq2/7YCEurCLqvaRHb5M0QNO7e3PB6MyRAV/OXTJkOPQaogcHp
         GBER4pmEkvyTvDWmm73/AhqG2NRrC/cMMYuIhBcFycZNEjUzy/0tkJ41TdY3XnKIBoor
         2/Q973GIWIXmI6o20BlQ93Ga75u13kUoZzue6vb5FdFDFi+oI1Cd0FHzwuff5agwSjZ7
         GqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzj+jkiTKIXkymGOxQlOiKZpAMfEDnJH3v97ZK7JO2s=;
        b=qgnIjpJ+e8hdVN6p3WzZ9g3T4O+XwjTLpcPDUiiZFxMYRR8njhwW8gj/8nVjlt2FGv
         W6YdlM9h7jj5cHTLl3nI+YwhM8oUZ0eRCtx22gD38XAN4yZlvhEc80MNVIWwreXlThal
         jEvIypZklgx9yvgF6aJeXKejLzqzi6KybXe1k0O9yOJSGadKkG13nQCxYpNUiBMdt5x5
         cNLWXLE4o61Jit2DtZ0cft6BfHD3ObQRfvYAVdk4zC2Q8VdWzVoNDdCELs3L/pRDoD67
         YRNAeA82KTeEkz5QTwkzMpzCVPkR680SRAz0TPq389WVmed9r4+mC6AEUxHz7oC9672W
         ynmw==
X-Gm-Message-State: ACrzQf0kh3n5lUvibAxn0hbSODr4s1VCtRq7Ij4iO8E0dazzeksYoB24
	N8fPsExcnW+lKiAn6H2rra7xaSEclA08ZYZFNfM=
X-Google-Smtp-Source: AMsMyM64TM9ip8DJPS1IIfAf8ByjkhssmLsjTNIHSSS5ZUckOURygqgl1f2XxOoHz1v6loeWufop87bNIsO6F/Ai7t8=
X-Received: by 2002:a17:902:ef96:b0:17e:e7f3:31db with SMTP id
 iz22-20020a170902ef9600b0017ee7f331dbmr10916218plb.127.1665997435356; Mon, 17
 Oct 2022 02:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
 <e25a9c12-92f3-936b-82fd-cf7319592a6e@citrix.com>
In-Reply-To: <e25a9c12-92f3-936b-82fd-cf7319592a6e@citrix.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Mon, 17 Oct 2022 11:03:39 +0200
Message-ID: <CALUcmUnMX1gmaiw72Z9z3WNsQoB85-uhe03YUjTibZCOPQcZPA@mail.gmail.com>
Subject: Re: [BUG] Xen build error - undefined reference to bpf_program__set_socket_filter
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="00000000000054cbae05eb37412e"

--00000000000054cbae05eb37412e
Content-Type: text/plain; charset="UTF-8"

>
> So while this is a build of Xen, it's actually qemu which is failing.
>
> This can be fixed by changing the version of qemu, or dropping qemu
> entirely by using ./configure --with-system-qemu= to point at the main
> distro qemu package (so long as it is built with Xen support).
>

Thanks for the quick responses.
I will share this info with the Arch Linux package maintainer.

https://aur.archlinux.org/packages/xen

--00000000000054cbae05eb37412e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">So while this is a build of Xen, it&#39;s actually qemu =
which is failing.<br>
<br>
This can be fixed by changing the version of qemu, or dropping qemu<br>
entirely by using ./configure --with-system-qemu=3D to point at the main<br=
>
distro qemu package (so long as it is built with Xen support).<br></blockqu=
ote><div><br></div><div>Thanks for the quick responses.</div><div>I will sh=
are this info with the Arch Linux package maintainer.</div><div><br></div><=
div><a href=3D"https://aur.archlinux.org/packages/xen">https://aur.archlinu=
x.org/packages/xen</a>=C2=A0</div></div></div>

--00000000000054cbae05eb37412e--

