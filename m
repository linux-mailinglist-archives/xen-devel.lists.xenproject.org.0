Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF07FBC44
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 15:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643209.1003182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ymh-0002hB-UD; Tue, 28 Nov 2023 14:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643209.1003182; Tue, 28 Nov 2023 14:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ymh-0002et-Pf; Tue, 28 Nov 2023 14:09:55 +0000
Received: by outflank-mailman (input) for mailman id 643209;
 Tue, 28 Nov 2023 14:09:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ImyS=HJ=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r7ymg-0002dM-BK
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 14:09:54 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc87629b-8df7-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 15:09:52 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab11so7425778a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 06:09:52 -0800 (PST)
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
X-Inumbo-ID: cc87629b-8df7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701180592; x=1701785392; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PlrdFyGNurI44kKWdXyrbgiAqyzrPSoKNJZniOqbxKw=;
        b=Tdxe2JGDP31VhXml6/b/w17LjOvLB4lijWpVbVvfBCCLh9WlQE5UdB7fHlHgsV7GOq
         ucUsY1zqi0ibWAJH/rglcLwRbdjfCko1SPLex0PnQoJKY83RNj/KNW3rpeRJAep2Ih/E
         8EwATQXbKAx3hLLkNu2sg3cEpsMfKiE49KZOVIHV7hqtbQgbjtbEn4x47Kt7Ht9kX0N8
         4HMvY5qVQt/Uo3S+olJ39IDEZxEU+gevKITPV+34NF+43sAWTLSpQS6FxE7iUAqV9FLk
         q1GXe93DZzevOlkR1wa9On22ywGoedILVqsu2zpWm7k/UhIiUV+mLsvGktqppBE4VSxs
         jaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180592; x=1701785392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlrdFyGNurI44kKWdXyrbgiAqyzrPSoKNJZniOqbxKw=;
        b=tH+cuwyD4VvSstSlq/byb3O3BY2I8wsJr3VSxjljLF2vpkoW9Bld1jde6zEssPOvRz
         D5kGfPer5+Bkyr3v/EaldDYnNoBSy3JJMtonxcUVepFGoCUjBGRlZBNYQg3U5N9Gg7tX
         9PNtpB/25uaYKqyxKeM2vpQi7RbjsO+Dtc5xp1pvl4WT6U6qL0yBYe/Tytf5KE/PUO6a
         /XPIl2ViCBlWxa3LCdvPuYtr9Rw35j+faCG1r29kbpT8KvPT2MLyyXdK+6WQsIdKgPZo
         AoAldRWIqJI6g5UWrtLcvhJTTFudyW49KT8kAOpyP78Z8ZfKGATQynx5UYfpDnJ5iPcv
         j5Hg==
X-Gm-Message-State: AOJu0YyBDDz+wp2ggyzF78ua6dw4u1i66HuoyN3Gf3Jhn8kn9UFGBbka
	GnBYHvQ113MBROuwE14/3e1lMLNXMcbb0AM6k+k=
X-Google-Smtp-Source: AGHT+IHyEbMr4ubxy5b3vHZDq1v0O84MM5I7dgFR1+zZUzfVOj0RFT+K6gXKUORTfOuLHp48+R1vbTWCMP3gGO5FyM0=
X-Received: by 2002:a17:906:73d0:b0:a03:edf:ba1c with SMTP id
 n16-20020a17090673d000b00a030edfba1cmr10709792ejl.1.1701180591341; Tue, 28
 Nov 2023 06:09:51 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net> <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <ZWUgfkP4U5kOmQNj@mattapan.m5p.com> <ZWXvBMaRJ5Lbb5S9@macbook>
In-Reply-To: <ZWXvBMaRJ5Lbb5S9@macbook>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 28 Nov 2023 15:09:14 +0100
Message-ID: <CA+1FSii4WeKQBuzW9TS_AkHD2nbm=Q+iL9j3wkfu+ZsC0V_=1w@mail.gmail.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32 bit
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Elliott Mitchell <ehem+freebsd@m5p.com>, Chuck Zmudzinski <brchuckz@netscape.net>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: multipart/alternative; boundary="000000000000d885fe060b36f868"

--000000000000d885fe060b36f868
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For booting a FreeBSD kernel as a guest OS on XEN,should we install xen
4.18 from source ?

On Tue, Nov 28, 2023 at 2:45=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com>
wrote:

> On Mon, Nov 27, 2023 at 03:04:30PM -0800, Elliott Mitchell wrote:
> > BTW Roger Pau Monn=C3=A9, now that Xen 4.18 is out, take a look at the
> > "royger" branch?
>
> I've pushed a bunch of those, there are still some, I've made comments
> on the branch.
>
> I think there isn't much left after the swept I've done.
>
> If you can rebase and reply to the comments I will take a look at
> what's remaining.
>
> Regards, Roger.
>


--=20
Mario.

--000000000000d885fe060b36f868
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For booting a FreeBSD kernel as a guest OS on XEN,should w=
e install xen 4.18 from source ? <br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 28, 2023 at 2:45=E2=80=AFP=
M Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pa=
u@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Mon, Nov 27, 2023 at 03:04:30PM -0800, Elliott Mitchell wrot=
e:<br>
&gt; BTW Roger Pau Monn=C3=A9, now that Xen 4.18 is out, take a look at the=
<br>
&gt; &quot;royger&quot; branch?<br>
<br>
I&#39;ve pushed a bunch of those, there are still some, I&#39;ve made comme=
nts<br>
on the branch.<br>
<br>
I think there isn&#39;t much left after the swept I&#39;ve done.<br>
<br>
If you can rebase and reply to the comments I will take a look at<br>
what&#39;s remaining.<br>
<br>
Regards, Roger.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000d885fe060b36f868--

