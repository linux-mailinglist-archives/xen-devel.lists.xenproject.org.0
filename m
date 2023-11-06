Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184E7E2A20
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 17:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628213.979417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02eW-0000xc-Kp; Mon, 06 Nov 2023 16:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628213.979417; Mon, 06 Nov 2023 16:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02eW-0000uc-I8; Mon, 06 Nov 2023 16:40:40 +0000
Received: by outflank-mailman (input) for mailman id 628213;
 Mon, 06 Nov 2023 16:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leKN=GT=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r02eV-0000uW-GT
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 16:40:39 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37455159-7cc3-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 17:40:38 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso692532366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 08:40:38 -0800 (PST)
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
X-Inumbo-ID: 37455159-7cc3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699288838; x=1699893638; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tDmapJXd1vsGd9OWGdQBsESQ54MAu9BnA2MHGJJm2ek=;
        b=H0qz2IH01KHToXFRERTFRvwmH++KDMZCwrL+wktHwBdRUTo+/46HbRU+tZJVAqKh5O
         PtOEcI+cCl1OkLAyaivoIVkuooeR15PDbtrl+fuaCKn2j69XYkUPXX8eGiTp7Nu2Xbaa
         lMboRkhh6UcecmiQh7mshcwqL07fxbzk72NvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699288838; x=1699893638;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDmapJXd1vsGd9OWGdQBsESQ54MAu9BnA2MHGJJm2ek=;
        b=duJwvHIaG+qFAQHzCXIrk2f0Gyv43Ato0zXEuH15xOylxbT9Qn5YRCqsdBdcZdJ4Iy
         +HzP88O+mLXYMRONBa2fEESl95dU9fG97OHUaQBrEkifOaiBXqdGj1XDh5G9vmMbX1kw
         yH3cgVl6HrqaPcyjA2f+6fCZdbV23pwN+/wDwMmN1CPNKzLRLTSuxi15tWGqQr0ZUpa3
         rFfeMKf0c0GK0D7fF1zY57poAEn9qiiXAUABSbNCnCP7P91LWBCkNhfUK6NOyTcqi3Lv
         L05x3IJo4SX2BflWOgfz5LHVvgTQEvXJmDwdm89glQNELlxT+1Fji0Y8HNCB558SlNRP
         2F3g==
X-Gm-Message-State: AOJu0YwU6RhxyKCi+gRvRg5gxOSzIPavmzbgPcbBynwVuR3DpvLnWw0j
	regO0ixxwitk+p1bcU9TcaNO0UtlUo4gJoPLJ4aBmWnwPv/JwhNCF74=
X-Google-Smtp-Source: AGHT+IEvvaK2jKI868CRglEFLlYiWXmkN/ubLFlgBWYQdWpF56+8ENOupEY5tN00gd+1fnw0Q6/6ECMU7IYRBJ9Md4s=
X-Received: by 2002:a17:907:1def:b0:9d6:d78f:cdd9 with SMTP id
 og47-20020a1709071def00b009d6d78fcdd9mr11745152ejc.35.1699288837703; Mon, 06
 Nov 2023 08:40:37 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 6 Nov 2023 16:40:01 +0000
Message-ID: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
Subject: Informal voting proposal
To: xen-devel@lists.xenproject.org, committers@xenproject.org
Content-Type: multipart/alternative; boundary="0000000000008adfaa06097e83da"

--0000000000008adfaa06097e83da
Content-Type: text/plain; charset="UTF-8"

Hi all,

As an open-source community, there will always be differences of opinion in
approaches and the way we think. It is imperative, however, that we view
this diversity as a source of strength rather than a hindrance.

Recent deliberations within our project have led to certain matters being
put on hold due to an inability to reach a consensus. While formal voting
procedures serve their purpose, they can be time-consuming and may not
always lead to meaningful progress.

Having received agreement from a few maintainers already, I would like to
propose the following:

*Informal voting method:*

   1. Each project should ideally have more than 2 maintainers to
   facilitate impartial discussions. Projects lacking this configuration will
   be addressed at a later stage.
   2. Anyone in the community is welcome to voice their opinions, ideas,
   and concerns about any patch or contribution.
   3. If members cannot agree, the majority informal vote of the
   maintainers will be the decision that stands. For instance, if, after
   careful consideration of all suggestions and concerns, 2 out of 3
   maintainers endorse a solution within the x86 subsystem, it shall be the
   decision we move forward with.
   4. Naturally, there may be exceptional circumstances, as such, a formal
   vote may be warranted but should happen only a few times a year for serious
   cases only.
   5. Informal votes can be as easy as 2 out of 3 maintainers providing
   their Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an
   informal vote by simply emailing the thread with "informal vote proposed,
   option 1 and option 2."
   6. *All maintainers should reply with their vote within 5 working days.*

   7. Please note that with any new process, there will always be room for
   improvement and we will reiterate where needed.

Ultimately our goal here is to prevent the project coming to a standstill
while deliberating decisions that we all cannot agree on. This may mean
compromising in the short term but I am sure the long-term benefits will
stand for themselves.

*If you have any strong objections to the informal voting, please let me
know by 30th November 2023. *
*Should I receive no objections, the process will be implemented as of 1st
December 2023.*

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--0000000000008adfaa06097e83da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br>As an open-source community, there will al=
ways be differences of opinion in approaches and the way we think. It is im=
perative, however, that we view this diversity as a source of strength rath=
er than a hindrance.<br><br>Recent deliberations within our project have le=
d to certain matters being put on hold due to an inability to reach a conse=
nsus. While formal voting procedures serve their purpose, they can be time-=
consuming and may not always lead to meaningful progress.<div><br></div><di=
v>Having received agreement from a few maintainers already, I would like to=
 propose=C2=A0the following:</div><div><br></div><div><b>Informal voting me=
thod:</b></div><div><ol><li>Each project should ideally have more than 2 ma=
intainers to facilitate impartial discussions. Projects lacking this config=
uration will be addressed at a later stage.</li><li>Anyone in the community=
 is welcome to voice their opinions, ideas, and concerns about any patch or=
 contribution.</li><li>If members cannot agree, the majority informal vote =
of the maintainers will be the decision that stands. For instance, if, afte=
r careful consideration of all suggestions and concerns, 2 out of 3 maintai=
ners endorse a solution within the x86 subsystem, it shall be the decision =
we move forward with.</li><li>Naturally, there may be exceptional circumsta=
nces, as such, a formal vote may be warranted but should happen only a few =
times a year for serious cases only.</li><li>Informal votes can be as easy =
as 2 out of 3 maintainers providing their Acked-by/Reviewed-by tag. Alterna=
tively, Maintainers can call an informal vote by simply emailing the thread=
 with &quot;informal vote proposed, option 1 and option 2.&quot;=C2=A0</li>=
<li><b>All maintainers should reply with their vote within 5 working days.<=
/b>=C2=A0=C2=A0</li><li>Please note that with any new process, there will a=
lways be room for improvement and we will reiterate where needed.</li></ol>=
<div>Ultimately=C2=A0our goal here is to prevent the project coming to a st=
andstill while deliberating decisions that=C2=A0we all cannot agree on. Thi=
s may mean compromising in the short term but I am sure the long-term benef=
its will stand for themselves.=C2=A0=C2=A0</div><div><font color=3D"#ff0000=
"><br></font></div><div><font color=3D"#ff0000"><b>If you have any strong o=
bjections to the informal voting, please let me know by <u>30th November 20=
23.=C2=A0</u></b></font></div><div><font color=3D"#ff0000"><b>Should I rece=
ive no objections, the process will be implemented as of 1st December 2023.=
</b></font></div><div><br></div></div><div><div><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Ma=
ny thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"colo=
r:rgb(136,136,136)">Open Source Community Manager</div><div style=3D"color:=
rgb(136,136,136)">XenServer, Cloud Software Group</div></div></div></div></=
div></div></div></div>

--0000000000008adfaa06097e83da--

