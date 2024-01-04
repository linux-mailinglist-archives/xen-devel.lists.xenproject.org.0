Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E686F82408B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661564.1031296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLqh-0000xS-6o; Thu, 04 Jan 2024 11:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661564.1031296; Thu, 04 Jan 2024 11:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLqh-0000ux-3c; Thu, 04 Jan 2024 11:25:19 +0000
Received: by outflank-mailman (input) for mailman id 661564;
 Thu, 04 Jan 2024 11:25:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEXr=IO=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rLLqf-0000VA-Ia
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:25:17 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee88e1cc-aaf3-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 12:25:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a28ec136715so32976466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 03:25:15 -0800 (PST)
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
X-Inumbo-ID: ee88e1cc-aaf3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704367514; x=1704972314; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vr5LTPD2hgRo9UjfVUgLpIporLeIsxAWnW5IHdFgINs=;
        b=i3JCY7zqOi0DtKn+2u66mifgh1wEXOsnG2ct1Ox65iuPA7qCaD93ZNyoLLeGSTqzQA
         AJoNO9eNCNFVbGe2Ed7ZZ6fLGVHU4BW2cuqxFOeUoyuDWpKhqTEEIXjfVe0BVtw7IbBB
         iLieA4aZcV4cad+7Z74ZECoiNOiJt1UQHNP4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704367514; x=1704972314;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vr5LTPD2hgRo9UjfVUgLpIporLeIsxAWnW5IHdFgINs=;
        b=HkHgGtGSjG8Fnv58wUgaFqJpO+NS/UCpACMxLUkTTJBck5Ag2IyOR1uh8rlOsRoeTc
         0yDYFHRKKoigNQqHwjGKiHApffQfSttFXvkjSBLHA76BauXHP9MzJI1Q2HqPm4AVvM6g
         24u++sdiN3vDhIh6dIu+CQSMIfnIcwisQ2dOrOZIfuL/P260EsRkuBIsI65vQ9h/QoHq
         C/U8TF3pZP3w/kpunqhND0kCfR3j9gpwI5Fl5NNOmZTG+J3uNKoaVaLMXjYwBaPzn9S5
         itInCSV8AJyi0DCj0h4FkO6L9igU9rdvNREcu+eC3l6xd0XUtbqomALMQJJ0lZH9aZUE
         TDBw==
X-Gm-Message-State: AOJu0YwgYaVgZ38X6PWrlksy4bsISMAkYYPgfJNjHeNIOKhjBSy8Wyy6
	hdog4vuh+s9fEwiOY80EeSV5PVPBFPf1Eeds+t4tcB9Nzx3hQ/hMYvSVDgrPHT6XXw==
X-Google-Smtp-Source: AGHT+IGECgkUbvJd+4n98sGgXBcQ3tJe4iK+c+vjLDrHPSyOTbi3dfBXxA9PDxAz9deW0UtEZ1VtWb44paCeRo1Avuc=
X-Received: by 2002:a17:906:f810:b0:a23:44e8:81b with SMTP id
 kh16-20020a170906f81000b00a2344e8081bmr252423ejb.73.1704367514307; Thu, 04
 Jan 2024 03:25:14 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 4 Jan 2024 11:24:38 +0000
Message-ID: <CAO-mL=ybPWb_iksuryZnk=MEtog3wGTujg+fcVEwSb4JeQ4xsA@mail.gmail.com>
Subject: Xen Summit 2024
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000041e825060e1cfcec"

--00000000000041e825060e1cfcec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xen Community,

Happy New Year!

It's my pleasure to announce Xen Summit 2024.

Our annual event brings the community=E2=80=99s brilliant minds and power u=
sers
together. This conference is a celebration of idea exchange, showcasing the
latest advancements,
sharing invaluable experiences, fostering strategic planning, and
encouraging collaborative efforts. Above all, it=E2=80=99s a chance to reve=
l in the
vibrant community that defines the Xen Project=E2=80=99s
legacy.

*Join us!*
*Date: 4th-6th June 2024*
*Location: Lisbon, Portugal *
*Website: https://events.linuxfoundation.org/xen-project-summit/
<https://events.linuxfoundation.org/xen-project-summit/> *

The CFP is now open, with more details about the event to follow.
Please save the date and submit any ideas for talks ahead of time.

If you would like to sponsor this event, please contact me or
xenevents@linuxfoundation.org for further information. The community
heavily relies on your support to help make these events successful.

See you all there!

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000041e825060e1cfcec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Xen Community,<div><br></div><div>Happy New Year!=C2=A0=
</div><div><br></div><div>It&#39;s my pleasure to announce Xen Summit 2024.=
</div><div><br></div><div>Our annual event brings the community=E2=80=99s b=
rilliant minds and power users together. This conference is a celebration o=
f idea exchange, showcasing the latest advancements,<br>sharing invaluable =
experiences, fostering strategic planning, and encouraging collaborative ef=
forts. Above all, it=E2=80=99s a chance to revel in the vibrant community t=
hat defines the Xen Project=E2=80=99s<br>legacy.=C2=A0<br></div><div><br></=
div><div><b>Join us!</b></div><div><b>Date: 4th-6th June 2024</b></div><div=
><b>Location: Lisbon, Portugal=C2=A0</b></div><div><b>Website:=C2=A0<a href=
=3D"https://events.linuxfoundation.org/xen-project-summit/">https://events.=
linuxfoundation.org/xen-project-summit/</a>=C2=A0</b></div><div><br></div><=
div>The CFP is now open, with more details about the event to follow.=C2=A0=
</div><div>Please save the date and submit any ideas for talks ahead of tim=
e.</div><div><br></div><div>If you would like to sponsor this event, please=
 contact me or <a href=3D"mailto:xenevents@linuxfoundation.org">xenevents@l=
inuxfoundation.org</a> for further information. The community heavily relie=
s on your support to help make these events successful.=C2=A0</div><div><br=
></div><div>See you all there!=C2=A0</div><div><br></div><div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div=
><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D=
"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div=
></div></div>

--00000000000041e825060e1cfcec--

