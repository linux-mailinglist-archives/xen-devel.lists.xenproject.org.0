Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C987F162D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636895.992595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55Z4-00038K-9B; Mon, 20 Nov 2023 14:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636895.992595; Mon, 20 Nov 2023 14:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55Z4-00035Q-6h; Mon, 20 Nov 2023 14:47:54 +0000
Received: by outflank-mailman (input) for mailman id 636895;
 Mon, 20 Nov 2023 14:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/O0h=HB=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r55Z2-00035K-Hw
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:47:52 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72b835b-87b3-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:47:50 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507a98517f3so5752922e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 06:47:50 -0800 (PST)
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
X-Inumbo-ID: c72b835b-87b3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700491670; x=1701096470; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LU1TF2jyQixtKVIQcFjXucjYSXPXjHPbsNTVK9wQpT8=;
        b=ZmJ0c4FU0MyW7BKobpnPkRAYsx2fRumq6Eyf2NVkFO/NVdz90RycUfmTOOWTfmMKjc
         DKSu9t9+fpuKbtIl/XWyYhXzIuZ84gWqS7XVpu7PYRiiMtyKcu8vFqJFHRxD31UIW+1n
         Te34JJ4HaaAqyPx05Q31okt1l8F48ytx7MLPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700491670; x=1701096470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LU1TF2jyQixtKVIQcFjXucjYSXPXjHPbsNTVK9wQpT8=;
        b=E0fZDQY9Cs8xKXBLO2mtYsVlLn2WjTqual6g33hxtFygYKrHhXGi8vQslTrzxOvgyq
         vIPZUPoLqbebjjuL4WoQL7ZkRHlvMzEHhAc0HjuXPr+a3TeaaQPsTQI4yBSlCwgCGOs8
         uw36LHZ+7yvKaRYXKsplTRevWJyDAqSH7pVDfiE7Wk/lDh2fZjuCImHnSo8SeekoVFzE
         LXa8I8bnMsX1s7E6v2z5xn8bXgcLpbT/x3N0P6rfaIpTCoQK/xmGKhIeK8gyaFlNmE9a
         rcrKsW34ponASFMlg31Qffs1U98QlrqhiaP5LR6hTUdyX0NBRvyFNZHpzDnJWB1CbZer
         S8RA==
X-Gm-Message-State: AOJu0Yw0X7ky4yXAqNbGy8oERF0PgkpcZKvm8gPg2ETJrvWBojE31Cc6
	BbZ/dUoLjVUphro+MKmLjW7S1jNjRjFE8kOBITH9Lg==
X-Google-Smtp-Source: AGHT+IE8rre+ePggvs8g2aUNhvjDXaUXqA09kBBeSFLZjdxseR1HfZVpiDzB5hMJPmeqBpAEThYwgPf7907ep28NJws=
X-Received: by 2002:ac2:5316:0:b0:50a:6fbe:fec4 with SMTP id
 c22-20020ac25316000000b0050a6fbefec4mr5703236lfh.33.1700491670105; Mon, 20
 Nov 2023 06:47:50 -0800 (PST)
MIME-Version: 1.0
References: <0cb1254f433536a9995c278c919372e226059934.camel@gmail.com>
In-Reply-To: <0cb1254f433536a9995c278c919372e226059934.camel@gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 20 Nov 2023 14:47:13 +0000
Message-ID: <CAO-mL=zGHTKraQANov-SNABvzLXTKCZzYk=UebacCW8pxV0yRg@mail.gmail.com>
Subject: Re: Interest in Release Manager Role
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
	marc.ungeschikts@vates.tech, olivier.lambert@vates.fr, 
	marc.ungeschikts@vates.fr
Content-Type: multipart/alternative; boundary="000000000000f0d52b060a969114"

--000000000000f0d52b060a969114
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksii,

Thanks for your email, and for volunteering to be the next release manager.
Don't forget to mention this on the next community call in December! I am
sure the community and myself will be happy to support you during this
process.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group


On Mon, Nov 20, 2023 at 2:06=E2=80=AFPM Oleksii <oleksii.kurochko@gmail.com=
> wrote:

> Dear Xen Community,
>
> I am keen on stepping into the role of a Release Manager for our next
> release. Despite not having direct experience yet, I am eager to learn,
> adapt, and grow into this role with your guidance and support.
>
> Have a nice week.
>
> Best regards,
>  Oleksii
>

--000000000000f0d52b060a969114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Oleksii,<div><br></div><div>Thanks for your email, and =
for volunteering to be the next release manager.=C2=A0</div><div>Don&#39;t =
forget to mention this on the next community call in December! I am sure th=
e community and myself will be happy to support you during this process.</d=
iv><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><=
div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136=
)">Open Source Community Manager</div><div style=3D"color:rgb(136,136,136)"=
>XenServer, Cloud Software Group</div></div></div></div></div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Nov 20, 2023 at 2:06=E2=80=AFPM Oleksii &lt;<a href=3D"mailto:oleksii.=
kurochko@gmail.com">oleksii.kurochko@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Dear Xen Community,<br>
<br>
I am keen on stepping into the role of a Release Manager for our next<br>
release. Despite not having direct experience yet, I am eager to learn,<br>
adapt, and grow into this role with your guidance and support.<br>
<br>
Have a nice week.<br>
<br>
Best regards,<br>
=C2=A0Oleksii<br>
</blockquote></div>

--000000000000f0d52b060a969114--

