Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5934A3728D
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 09:08:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888713.1298597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjZgS-0007q0-Sy; Sun, 16 Feb 2025 08:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888713.1298597; Sun, 16 Feb 2025 08:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjZgS-0007n4-QG; Sun, 16 Feb 2025 08:07:24 +0000
Received: by outflank-mailman (input) for mailman id 888713;
 Fri, 14 Feb 2025 10:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dhx7=VF=gmail.com=adam.qushenghui@srs-se1.protection.inumbo.net>)
 id 1titMM-000254-2T
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 10:55:50 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ff20d7d-eac2-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 11:55:49 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5deb956aa5eso2466183a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 02:55:49 -0800 (PST)
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
X-Inumbo-ID: 3ff20d7d-eac2-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739530548; x=1740135348; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pH6kCEfTESLgjmQrK1iqqnv7HKIidTwDbPpmtfCYHnQ=;
        b=S6DDli8D8vO86ZYSWOnskVTfq8IUjLk6F0yoAo35hiHDjJnItSsctPVlhQdUmWSR9p
         FEeUO+Kqrq8cBZOmT5Bz+ErT+nH664Bob8DGUUt9Q8bW44ljuUsoRK+8ZaALqzTY5Ntc
         sJPdwB5nyEtZnYJQ6W2MqhpuhwuzAxscWRCSec9UHKBfm9wY82C4POUfn5CNDXWZeyvB
         cU0AjjSojQyvKA47i8WjknV8gIHzp03QKprrpthaIPI1FbeGCZRqLpmUbyHyS/NGs0z6
         2tAj5X0U1M4pJ1oxV8/gSFOtlpL7j1UW1EIlt5FAM49pcumN8UXhacTSJo8kM004F91a
         O0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530548; x=1740135348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH6kCEfTESLgjmQrK1iqqnv7HKIidTwDbPpmtfCYHnQ=;
        b=K1BJ/WmWKHGD/puj8R3HaSajNkCU5Ul6vxlZfDjMdBZCJZRjihf7tFqy+S1pXFQOmz
         jZ4TULqA2cg1ajo5O8l30cgimZ8jsDwu3XTQkJvTq/ITBgVAkAhbBtWWcVpp2MOGCNkw
         jxYbm7m6pemdb4u0eU2qFH7RhxfEdODS3fjKCmEI83/pIVymo8VQvAIWW+KJlRnkeY6H
         abxDMuuVHrwkhvz2k69VDM2cOuiPpabEHx99Kr3HXCjPEgGswPIzqMyvkoHFV0o7mOlP
         Vx/7Z+0YepcueiEOE3sQbmkzDubDAqj0XaGO7zht6MN2ZcGqlI3IfYNtd1ZyNO+W7vUL
         prSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWFIkyxXNmo7x10/IFKEAEkbX8BwBlu+2Qw5nUkfLm+nO75ZPlW2e70BY0kyfQjXJ1UaOj1knmJC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3eH8nT+exgeouUi41zmmOz7GiDu3U6hYg9rsHhTwxmGMhckIA
	8rbPbJt990EGcs69q5lMQ2pKh0vCbVO4mDthsM/W6JU4vQgnnfJkDAtBTm1uqKyVtkYSvfW7gyq
	CyMYFqd/cSlG50QCnSqGjFKe5G4c=
X-Gm-Gg: ASbGncv0xUBURv+Q10u75LLFT+PIUvS3+4RpR99Xg/BoxRpRCbwaFcZZYhFwjDzXpVc
	s/IUdbtkahhIBDdtVs6hFsINdzH/zfgwkEv5jsi8CasBFz0obdjkEwyxTyXyxJnV+/lNJBLNj
X-Google-Smtp-Source: AGHT+IG0agN7fA0s1q9VxJDIlMRCLjNCjyXA84WBOpudkhFBuGpCeuwg6TrMqIzKj4krf7uGXxVyk8tI0NnxPY4lVuc=
X-Received: by 2002:a05:6402:40c9:b0:5de:a6a8:5ec6 with SMTP id
 4fb4d7f45d1cf-5dec9d393f8mr15895742a12.10.1739530548303; Fri, 14 Feb 2025
 02:55:48 -0800 (PST)
MIME-Version: 1.0
References: <CAHfJC1=gH7tm3V922+5Nqz76mB_iSeiTjU1rwKAVOzaj6B9LJw@mail.gmail.com>
 <alpine.DEB.2.22.394.2502131211100.619090@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2502131211100.619090@ubuntu-linux-20-04-desktop>
From: shenghui qu <adam.qushenghui@gmail.com>
Date: Fri, 14 Feb 2025 18:55:37 +0800
X-Gm-Features: AWEUYZk4cZSKvVJmJJ8ikeXKPDAGkDzpRdtNt7MEwwCPgpkpnRqaZqX29LXi-FU
Message-ID: <CAHfJC1mW7UXeuSyRFB6TpJctS8g5wgX35FnAa3D0jaB1NhW2dA@mail.gmail.com>
Subject: Re: Inquiry About PCI Passthrough Development and Testing Patches on ARM
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org, 
	Stewart.Hildebrand@amd.com, Mykyta_Poturai@epam.com
Content-Type: multipart/alternative; boundary="000000000000685f5d062e1804dd"

--000000000000685f5d062e1804dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Stewart

Thank you for being looped into this discussion.
Following Stefano=E2=80=99s guidance, I=E2=80=99d like to seek further clar=
ity on the
current development of PCI Passthrough support for Xen/ARM.
Specifically, I have two questions:
1.Roadmap: Are there clear milestones or a timeline for completing PCI
Passthrough support on ARM? For instance, is this feature targeted for
inclusion in Xen 4.20 or later releases=EF=BC=9F
2.Current Status: Could you elaborate on the technical progress so far?

Looking forward to your insights.

Best regards,
Shenghui Qu

Stefano Stabellini <sstabellini@kernel.org> =E4=BA=8E2025=E5=B9=B42=E6=9C=
=8814=E6=97=A5=E5=91=A8=E4=BA=94 04:14=E5=86=99=E9=81=93=EF=BC=9A

> Hi Shenghui,
>
> Thank you for your interest in Xen! Let me add Stewart, who can provide
> you with an overview of the latest status of PCI Passthrough on ARM.
>
> Among the various items in progress, I would like to highlight this
> series from Mykyta, which is currently under review:
>
> https://marc.info/?l=3Dxen-devel&m=3D173918318831281
>
> Cheers,
>
> Stefano
>
> On Thu, 13 Feb 2025, shenghui qu wrote:
> > Dear Maintainers,
> >
> > I hope this email finds you well.
> >
> > I recently came across the Xen Project 4.19 Feature List, which mention=
s
> that PCI passthrough work on ARM is ongoing, including some
> > refactoring and improvements of the existing code. It also states that
> this work will be included in the next few releases.
> > I am very interested in the current development plan and progress of PC=
I
> passthrough on ARM. Could you kindly provide an update on this?
> >
> > Additionally, I would like to know how I can access any available
> testing patches related to this work.
> >
> > I appreciate your time and effort in maintaining and improving the Xen
> Project. Looking forward to your response.
> >
> > Best regards,Shenghui Qu
> >
> >

--000000000000685f5d062e1804dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Stewart<br><br>Thank you for being looped into this d=
iscussion. <br>Following Stefano=E2=80=99s guidance, I=E2=80=99d like to se=
ek further clarity on the current development of PCI Passthrough support fo=
r Xen/ARM. <br>Specifically, I have two questions:<br>1.Roadmap: Are there =
clear milestones or a timeline for completing PCI Passthrough support on AR=
M? For instance, is this feature targeted for inclusion in Xen 4.20 or late=
r releases=EF=BC=9F<br>2.Current Status: Could you elaborate on the technic=
al progress so far? <br><br><span style=3D"white-space:pre">Looking forward=
 to your insights.</span><div><span style=3D"white-space:pre"><br></span>Be=
st regards,<br>Shenghui Qu<br></div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Stefano Stabellin=
i &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&=
gt; =E4=BA=8E2025=E5=B9=B42=E6=9C=8814=E6=97=A5=E5=91=A8=E4=BA=94 04:14=E5=
=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Shenghui,<br>
<br>
Thank you for your interest in Xen! Let me add Stewart, who can provide<br>
you with an overview of the latest status of PCI Passthrough on ARM. <br>
<br>
Among the various items in progress, I would like to highlight this<br>
series from Mykyta, which is currently under review:<br>
<br>
<a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D173918318831281" rel=3D=
"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-devel&amp;m=3D173=
918318831281</a><br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
On Thu, 13 Feb 2025, shenghui qu wrote:<br>
&gt; Dear Maintainers,<br>
&gt; <br>
&gt; I hope this email finds you well.<br>
&gt; <br>
&gt; I recently came across the Xen Project 4.19 Feature List, which mentio=
ns that PCI passthrough work on ARM is ongoing, including some<br>
&gt; refactoring and improvements of the existing code. It also states that=
 this work will be included in the next few releases.<br>
&gt; I am very interested in the current development plan and progress of P=
CI passthrough on ARM. Could you kindly provide an update on this?=C2=A0<br=
>
&gt; <br>
&gt; Additionally, I would like to know how I can access any available test=
ing patches related to this work.<br>
&gt; <br>
&gt; I appreciate your time and effort in maintaining and improving the Xen=
 Project. Looking forward to your response.<br>
&gt; <br>
&gt; Best regards,Shenghui Qu<br>
&gt; <br>
&gt; </blockquote></div>

--000000000000685f5d062e1804dd--

