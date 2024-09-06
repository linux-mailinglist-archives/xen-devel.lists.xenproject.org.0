Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D496F4C0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 14:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791798.1201810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smYUK-0001gD-LA; Fri, 06 Sep 2024 12:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791798.1201810; Fri, 06 Sep 2024 12:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smYUK-0001e0-IQ; Fri, 06 Sep 2024 12:54:56 +0000
Received: by outflank-mailman (input) for mailman id 791798;
 Fri, 06 Sep 2024 12:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+W1S=QE=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1smYUJ-0001dt-9O
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 12:54:55 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346d5b3d-6c4f-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 14:54:54 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso2552112e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 05:54:51 -0700 (PDT)
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
X-Inumbo-ID: 346d5b3d-6c4f-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725627290; x=1726232090; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nNfEK8pm+594x2hpaMklSKQTwRetTOXibCXrR2MK7AA=;
        b=PSxQDKHC7A1ARpLZKHGuZbPWgmFR9A5DEjA8YhuB6mOIkzOtP3DIdvSxk/38I+v8HS
         68BEX3hRHnMVlPwFoF+d0lost2oH/2OKnCQb4WBT/YcNQ2eOHB3zUADgjHf0DkRyPIFq
         m/fNjB//qNNEnl3FTOvJ0NyYgYtAjIudCX4+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725627290; x=1726232090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNfEK8pm+594x2hpaMklSKQTwRetTOXibCXrR2MK7AA=;
        b=YcpkWeZh9U8jQyUfJEaneRvqyLcEfULR0ZiueJYr8+KbbotV6qgbcF7cOTrDwpu6HF
         1bkjkbkO69MPmpFcI7QA+XTvIxXdgZgnRCPg2pRW5sY3wKSZ6c+aseKWKCL1/YMD7c/J
         mTJrD08RybfosSFMYUVweQjBP9FZoARpDArwv6bSzpd4dmoGZx15BwvECchnMQW2YVLB
         WXMt2GkvjV5oPml4WbH/N02321nEpF5w/QdI94TA6Z/t1VJ7Lx4/EhkUjj1T/2YN3Pua
         9SZ8kHhAu+v5b0fcroVn6CKHJIu5ys1aA7fioJ8GYJNGWCLMnphoPbOqopUoxXcOyr9v
         astw==
X-Gm-Message-State: AOJu0Yyxg9/vFPP4oyPXgioqUc38jR6w0NmuGcFlVc7gtbH7WRXneeMk
	Tc4B56Y/Asdg7ywumYbWCKLamCDYa5xBCMQjAoVg/ptQlUWVjAIgB6NED+o21HCdGWud9tZiUt4
	K0ac/aRNCYg6oZpn7Mm6sLdFQMUOnavB4wE+qO8OspfYERySW
X-Google-Smtp-Source: AGHT+IFPzi0XaRxFV7vL49EcobRmoDdntRqiQHBDxSUt1loVmha4U+0qyGBNwJzqa4DrDdfVsz6E3+QTllFBkbB5IXE=
X-Received: by 2002:a05:6512:ac4:b0:52c:e1cd:39be with SMTP id
 2adb3069b0e04-536587a67e8mr1723376e87.8.1725627289237; Fri, 06 Sep 2024
 05:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <e56ff82c1a1d7398a5b38784fc84a7adf51ec918.camel@vates.tech>
 <PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2@PH8PR12MB7326.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2408210916300.3871186@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2408210916300.3871186@ubuntu-linux-20-04-desktop>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 6 Sep 2024 13:54:13 +0100
Message-ID: <CAO-mL=yH=jdFb+cZffJLNw=wU2DZj7JR0LEJJM3e1bsPVxyABQ@mail.gmail.com>
Subject: Re: Setting up the Xen Communications Team
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "Halder, Ayan Kumar" <ayan.kumar.halder@amd.com>, 
	"Charles-H. Schulz" <charles.schulz@vates.tech>, 
	Xen Project Advisory Board <advisory-board@lists.xenproject.org>, 
	Stefano Stabellini <stefano.stabellini@amd.com>
Content-Type: multipart/alternative; boundary="000000000000972c66062172e90b"

--000000000000972c66062172e90b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Thank you for your interest, we'll look into setting up a new Xen
PR/communications group.
If anyone else in the community would like to join, please reply directly
to this email.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Wed, Aug 21, 2024 at 5:16=E2=80=AFPM Stefano Stabellini <
stefano.stabellini@amd.com> wrote:

> Me too
>
> Cheers,
>
> Stefano
>
>
> On Wed, 21 Aug 2024, Halder, Ayan Kumar wrote:
> > Hi Charles,
> >
> >
> >
> > Thanks for taking the initiative. =F0=9F=98=8A
> >
> > I will be interested to join.
> >
> >
> >
> > Kind regards,
> >
> > Ayan
> >
> >
> >
> > From: Advisory-board <advisory-board-bounces@lists.xenproject.org> on
> behalf of Charles-H. Schulz <charles.schulz@vates.tech>
> > Date: Monday, 19 August 2024 at 10:46
> > To: xen-devel <xen-devel@lists.xenproject.org>, Xen Project Advisory
> Board <advisory-board@lists.xenproject.org>
> > Cc: Kelly Choi <kelly.choi@cloud.com>
> > Subject: Setting up the Xen Communications Team
> >
> > Hello everyone,
> >
> > Just like any major FOSS project, Xen needs to take care of its
> > messaging and communication. We are usually focused on software
> > development, however we'd like to take the opportunity to call on
> > whoever is interested here to join the small team in charge of
> > Communications.
> >
> > We do not expect this to involve a large additional workload. If you
> > are interested in joining, please send a message to Kelly or reply to
> > this email.
> >
> > Thank you,
> >
> > --
> > Charles-H. Schulz
> > Chief Strategy Officer
> > Vates SAS - +33 (0)6 98 65 54 24
> >
> >
> >

--000000000000972c66062172e90b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>Thank you for your intere=
st, we&#39;ll look into setting up a new Xen PR/communications group.</div>=
<div>If anyone else in the community would like to join, please reply direc=
tly to this email.</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D=
"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136=
,136,136)">Xen Project=C2=A0<br></div></div></div></div></div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Aug 21, 2024 at 5:16=E2=80=AFPM Stefano Stabellini &lt;<a href=3D"mail=
to:stefano.stabellini@amd.com">stefano.stabellini@amd.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Me too<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
On Wed, 21 Aug 2024, Halder, Ayan Kumar wrote:<br>
&gt; Hi Charles,<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; <br>
&gt; Thanks for taking the initiative. =F0=9F=98=8A<br>
&gt; <br>
&gt; I will be interested to join.<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; <br>
&gt; Kind regards,<br>
&gt; <br>
&gt; Ayan<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; <br>
&gt; From: Advisory-board &lt;<a href=3D"mailto:advisory-board-bounces@list=
s.xenproject.org" target=3D"_blank">advisory-board-bounces@lists.xenproject=
.org</a>&gt; on behalf of Charles-H. Schulz &lt;charles.schulz@vates.tech&g=
t;<br>
&gt; Date: Monday, 19 August 2024 at 10:46<br>
&gt; To: xen-devel &lt;<a href=3D"mailto:xen-devel@lists.xenproject.org" ta=
rget=3D"_blank">xen-devel@lists.xenproject.org</a>&gt;, Xen Project Advisor=
y Board &lt;<a href=3D"mailto:advisory-board@lists.xenproject.org" target=
=3D"_blank">advisory-board@lists.xenproject.org</a>&gt;<br>
&gt; Cc: Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com" target=3D"_=
blank">kelly.choi@cloud.com</a>&gt;<br>
&gt; Subject: Setting up the Xen Communications Team<br>
&gt; <br>
&gt; Hello everyone,<br>
&gt; <br>
&gt; Just like any major FOSS project, Xen needs to take care of its<br>
&gt; messaging and communication. We are usually focused on software<br>
&gt; development, however we&#39;d like to take the opportunity to call on<=
br>
&gt; whoever is interested here to join the small team in charge of<br>
&gt; Communications.=C2=A0<br>
&gt; <br>
&gt; We do not expect this to involve a large additional workload. If you<b=
r>
&gt; are interested in joining, please send a message to Kelly or reply to<=
br>
&gt; this email.<br>
&gt; <br>
&gt; Thank you,<br>
&gt; <br>
&gt; --<br>
&gt; Charles-H. Schulz<br>
&gt; Chief Strategy Officer<br>
&gt; Vates SAS - +33 (0)6 98 65 54 24<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>

--000000000000972c66062172e90b--

