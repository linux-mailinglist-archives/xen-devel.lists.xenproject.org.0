Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9B882F259
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 17:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667857.1039539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmDg-0003rx-5C; Tue, 16 Jan 2024 16:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667857.1039539; Tue, 16 Jan 2024 16:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmDg-0003pa-1K; Tue, 16 Jan 2024 16:23:20 +0000
Received: by outflank-mailman (input) for mailman id 667857;
 Tue, 16 Jan 2024 16:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Syk=I2=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rPmDe-0003pK-Du
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 16:23:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cb14a9f-b48b-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 17:23:15 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-559c0bfcd59so473354a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 08:23:15 -0800 (PST)
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
X-Inumbo-ID: 8cb14a9f-b48b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705422194; x=1706026994; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SgRxYqdXM1quSO/y9E/+N6LzCx+oDdi1r5uEP/2Mp+Y=;
        b=OPTL1GM+MemHILSVQOhbrkYegO7UB5gZHcjckgn/kJm1Gvtvb3pI6xFZALpMcOMKvl
         JF8zFtJ+HVIUwdUUaKaJ8z/+RZHFBtcN/pgVFRHUZkD4Fd7NMFUxttEg8xFuRrR7yh61
         inEqpXdHnsofgn/8kYt43/m7ti/cjGk653+fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705422194; x=1706026994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgRxYqdXM1quSO/y9E/+N6LzCx+oDdi1r5uEP/2Mp+Y=;
        b=VXRb8PGE1/tJeUYoEX0M6KkdZ9GDU8RGMpB1OCTnPDTCX8KZfjJBymNC17cl34OVb+
         WIf0qefotnvLDnlK91Jy8mUpvdMsMeaY/ltrUtUjBCckmEpo+tN2lCspYUswKsbqKeO9
         AXIxJYOhbQ1HE7jaty8qzLcxo7vPBc4IEklGFPAdwI9qA/swUsBYYZO6J8JLH+C97m7u
         Z3k4Sbm7kp4uDjwWODt476dHeUpb5H5M6oIODG3QVltcVp6JCas0nGkGyZSjuC+0IUwT
         B2gNlevEUxYJzheyrkKb1P5YatsiBzJF0dz6ajhivwBvFbjWO/MuuhOopIA1deuSQw4/
         8peQ==
X-Gm-Message-State: AOJu0YzSQjcy02Q7/xIrBxIm5fj2h3QfNWL3FcwUGdrr8u2Xv0MSuJuk
	q3BoIQUA0QoEjs91fgAj0tyi95lInQH+O+2dIkSJ8gMttgLegWvz/Ad/A/zGmPY=
X-Google-Smtp-Source: AGHT+IF1QkuGs5oiDkLHFp8ZGVNuSTiS7B04bR+CONEBR7EBSbyivLCu7+dAx8ZdXsvzDWDBWKTgRTGDRxBA/9XmsYc=
X-Received: by 2002:a05:6402:27c8:b0:558:fbad:f98c with SMTP id
 c8-20020a05640227c800b00558fbadf98cmr2713872ede.80.1705422194329; Tue, 16 Jan
 2024 08:23:14 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=yuK+t344CBL+KLFKUFc1kLfyj-eJxtHQ4t5Ltw777vFA@mail.gmail.com>
In-Reply-To: <CAO-mL=yuK+t344CBL+KLFKUFc1kLfyj-eJxtHQ4t5Ltw777vFA@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 16 Jan 2024 16:22:38 +0000
Message-ID: <CAO-mL=ypHd_wAMYXz+x+YPRdPENiocC2f0reM5NMjzW0Tk+sUA@mail.gmail.com>
Subject: Re: Xen Project Annual Survey
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="00000000000015e5fe060f128c70"

--00000000000015e5fe060f128c70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

A reminder to fill out the Xen Project Annual survey!

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Tue, Jan 9, 2024 at 1:21=E2=80=AFPM Kelly Choi <kelly.choi@cloud.com> wr=
ote:

> Happy New Year Xen Community,
>
> As we start the New Year, I'd like to ask you to reflect on how the
> project went in 2023. This will help us track the health of the community
> and also give you a chance to express your ideas and feedback.
>
> The survey can be answered anonymously and should take less than 10
> minutes.
>
> *Link: https://cryptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINK=
MZRpuWh2c58bhBYI/
> <https://cryptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuW=
h2c58bhBYI/> *
> *Deadline: 31st January 2024. *
>
> Many thanks,
> Kelly Choi
>
> Community Manager
> Xen Project
>

--00000000000015e5fe060f128c70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,</div><div dir=3D"ltr"><br></div><=
div dir=3D"ltr">A reminder to fill out the Xen Project Annual survey!=C2=A0=
</div><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div>=
<div><br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager=
</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></di=
v></div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jan 9, 2024 at 1:21=E2=80=AFPM Kelly Choi &=
lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.choi@cloud.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr">Happy New Year Xen Community,<div><br></div><div>As we start the New Y=
ear, I&#39;d like to ask you to reflect on how the project went in 2023. Th=
is will help us track the health of the community and also give you a chanc=
e to express your ideas and feedback.=C2=A0</div><div><br></div><div>The su=
rvey can be answered anonymously and should take less than 10 minutes.</div=
><div><br></div><div><b>Link:=C2=A0<a href=3D"https://cryptpad.fr/form/#/2/=
form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c58bhBYI/" target=3D"_blank">h=
ttps://cryptpad.fr/form/#/2/form/view/uG22fJfe8UILyP9+jJ-YesXsINKMZRpuWh2c5=
8bhBYI/</a>=C2=A0</b></div><div><b>Deadline: 31st January 2024.=C2=A0</b></=
div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><d=
iv><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=
=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></=
div></div></div>
</blockquote></div></div>

--00000000000015e5fe060f128c70--

