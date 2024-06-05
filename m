Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FE8FC8AB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 12:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735636.1141758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnYq-0004UO-QS; Wed, 05 Jun 2024 10:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735636.1141758; Wed, 05 Jun 2024 10:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnYq-0004S0-NE; Wed, 05 Jun 2024 10:08:04 +0000
Received: by outflank-mailman (input) for mailman id 735636;
 Wed, 05 Jun 2024 10:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19Cw=NH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sEnYp-0004Rj-2a
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 10:08:03 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7de7d43c-2323-11ef-90a2-e314d9c70b13;
 Wed, 05 Jun 2024 12:08:01 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57a3d21299aso6017086a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 03:08:01 -0700 (PDT)
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
X-Inumbo-ID: 7de7d43c-2323-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717582081; x=1718186881; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZfR2N7jU6Gmhe+jCMYZymmj8uBxt4MhcgI5sJhH2SG8=;
        b=D9hhw7lSKZKRMrL1EdzVGUvs1fiY6Xytl2KKitS6P819ntqgClig0mDV/9xKw6Fa0R
         viKC8go17wSyuGpDKR0bmVJxJxCskqgqlbIkhVdy3lYRt25FzA3vnCHNsWGOsowqodHl
         ccWjTKgGkJzj0dl85EL7h7c6c1CsZAh7dAJB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717582081; x=1718186881;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfR2N7jU6Gmhe+jCMYZymmj8uBxt4MhcgI5sJhH2SG8=;
        b=HBE6zcT39rfpOo/X2k8nIQ+U7eRAtlkb8dq6nBAL6fHCNP1+188c0TMSLRtrRk/E9C
         PID+ifd/Sru5o0sJT1XCogTshaTTwFNA10/VLUXgecNUaE5fPMpC38yQlU+rrLrYTgce
         zRQaWVTGCUkFiBONxbM6mRcCxx/8PfOgrtI5VD+J27u0kVTBr6WZJALNEVBb4JfFKTmS
         PresxSiWUB1qZNnuUWcHm1jUzxNDKzRUZVuJBwK8gbtxv/ffZLCta0n1wSUkplRTeEDG
         GcN9d86pai9FCwDm8u3dmGWuS/xhpxC7t0HHlw6/zPUB4X3inGqW21B872genamuyT+E
         f4ww==
X-Gm-Message-State: AOJu0YwbuSzaEfvNLroQzmsWUQ/DBpc/LA0wEkBNF1wPYqD7tL2s8U2U
	NXhHD56CMWOgCtEk9+OROAdO2Bi3u3gF3NyW+MNPLzY9RPx4YMdHREHjfAv077O/rQ9exxRR7Mr
	uwEdi5tIvUhaFhwZo5bKlYlSfyRzb2A7BBK741WCYIe2c4E7OVioFWg==
X-Google-Smtp-Source: AGHT+IGwwMjUQJQk/si9KlMJzkl/2O/IbwC30qKf0YSyY7CtF4WTsWozfCkfl4cH++ymAzsO3W/LvZuagtbL90ecO2A=
X-Received: by 2002:a50:aa93:0:b0:57a:212a:a21b with SMTP id
 4fb4d7f45d1cf-57a8b68797fmr1339345a12.7.1717582080668; Wed, 05 Jun 2024
 03:08:00 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 5 Jun 2024 11:07:24 +0100
Message-ID: <CAO-mL=xPmpwW9m-aT9hx9S7wm4iJf-C8C3UxGgrg8ewSQCyOHg@mail.gmail.com>
Subject: Join us for day 2 - Free virtual Xen Summit 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000caa5d1061a21bd72"

--000000000000caa5d1061a21bd72
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Please find the *schedule of talks listed here.*
<https://events.linuxfoundation.org/xen-project-summit/program/schedule/>

   - All sessions on Wednesday 5th June and Thursday 6th June will use the
   following links:
   - *DESIGN SESSION A <https://meet.jit.si/XenDesignSessionsA> *(Liberdade
      Room)
      - *DESIGN SESSION B <https://meet.jit.si/XenDesignSessionsB> *(Augusta
      Room)
      - Please look out on the schedule for the time and which session room
      it takes place in


   - Thursday design sessions will be finalized on the schedule by the end
   of day on Wednesday
   - The same links will be used throughout talks and sessions
   - (Optional) Join our Xen Summit matrix channel for updates on the day:
   https://matrix.to/#/#xen-project-summit:matrix.org

*Some ground rules to follow:*

   - Enter your full name on Jitsi so everyone knows who you are
   - Please mute yourself upon joining
   - Turning on cameras is optional, but we encourage doing this for design
   sessions
   - Do *not* shout out your questions during session presentations,
   instead ask these on the chat function and we will do our best to ask on
   behalf of you
   - During design sessions, we encourage you to unmute and participate
   freely
   - If multiple people wish to speak, please use the 'raise hand' function
   on Jitsi or chat
   - Should there be a need, moderators will have permission to remove
   anyone who is disruptive in sessions on Jitsi
   - If you face issues on the day, please let us know via Matrix - we will
   do our best to help, but please note this is a community effort

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000caa5d1061a21bd72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>Please find the=C2=A0<a hr=
ef=3D"https://events.linuxfoundation.org/xen-project-summit/program/schedul=
e/" target=3D"_blank"><b>schedule=C2=A0of talks listed here.</b></a><br></d=
iv><div><ul><li style=3D"margin-left:15px">All sessions on Wednesday 5th Ju=
ne and Thursday 6th June will use the following links:<br></li><ul><li styl=
e=3D"margin-left:15px"><b><a href=3D"https://meet.jit.si/XenDesignSessionsA=
" target=3D"_blank">DESIGN SESSION A</a>=C2=A0</b>(Liberdade Room)=C2=A0</l=
i><li style=3D"margin-left:15px"><b><a href=3D"https://meet.jit.si/XenDesig=
nSessionsB" target=3D"_blank">DESIGN SESSION=C2=A0B</a>=C2=A0</b>(Augusta R=
oom)</li><li style=3D"margin-left:15px">Please look out on the schedule for=
 the time and which session room it takes place in<br></li></ul></ul><ul><l=
i style=3D"margin-left:15px">Thursday design sessions will be finalized on =
the schedule by the end of day on Wednesday</li><li style=3D"margin-left:15=
px">The same links will be used throughout talks and sessions</li><li style=
=3D"margin-left:15px">(Optional) Join our Xen Summit matrix channel for upd=
ates on the day:=C2=A0<a href=3D"https://matrix.to/#/%23xen-project-summit:=
matrix.org" target=3D"_blank">https://matrix.to/#/#xen-project-summit:matri=
x.org</a>=C2=A0</li></ul><div><div dir=3D"ltr" class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div><b><u>Some grou=
nd rules to follow:</u></b></div><div><ul><li style=3D"margin-left:15px">En=
ter your full name on Jitsi so everyone knows who you are</li><li style=3D"=
margin-left:15px">Please mute yourself upon joining=C2=A0</li><li style=3D"=
margin-left:15px">Turning on cameras is optional, but we encourage doing th=
is for design sessions</li><li style=3D"margin-left:15px">Do=C2=A0<u>not</u=
>=C2=A0shout out your questions during session presentations, instead ask t=
hese on the chat function and we will do our best to ask on behalf of you</=
li><li style=3D"margin-left:15px">During design sessions, we encourage you =
to unmute and participate freely</li><li style=3D"margin-left:15px">If mult=
iple people wish to speak, please use the &#39;raise hand&#39; function on=
=C2=A0Jitsi or chat</li><li style=3D"margin-left:15px">Should there be a ne=
ed, moderators will have permission to remove anyone who is disruptive in s=
essions on=C2=A0Jitsi</li><li style=3D"margin-left:15px">If you face issues=
 on the day, please let us know via Matrix - we will do our best to help, b=
ut please note this is a community effort=C2=A0</li></ul></div></div><div>M=
any thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"col=
or:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136=
,136)">Xen Project=C2=A0<br></div></div></div></div></div></div></div>

--000000000000caa5d1061a21bd72--

