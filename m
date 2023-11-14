Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CB7EAF7F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 12:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632341.986608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ru9-0002wV-J6; Tue, 14 Nov 2023 11:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632341.986608; Tue, 14 Nov 2023 11:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ru9-0002uR-GR; Tue, 14 Nov 2023 11:48:29 +0000
Received: by outflank-mailman (input) for mailman id 632341;
 Tue, 14 Nov 2023 11:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+wK=G3=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r2ru7-0002uK-Ac
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 11:48:27 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8133d71-82e3-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 12:48:25 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-543923af573so8485486a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 03:48:25 -0800 (PST)
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
X-Inumbo-ID: b8133d71-82e3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699962504; x=1700567304; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t8/i43dB7lPu8ghuvyn17E+24IV8JGeHRB+ETSu1SZ0=;
        b=LzlrN66BEcvwlkM4VRdm6vN6rfqtUdthw9nj0CwE3VwirGfLz48nRCHF8ruqBtuMBV
         5edTpBEpEFg7Os6xoq55CVDC67k3pi4G1Z3enPXkBddwRckiFL401/VXPKBbZDMgclPI
         lbIkRhynTdMqy+s1sZmk5TZd54UitfJxqdPPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699962504; x=1700567304;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8/i43dB7lPu8ghuvyn17E+24IV8JGeHRB+ETSu1SZ0=;
        b=t/2G2Iq8rIb5wl+QfVtm7Exw3mhgAIKLkW5NklLg8Pc/Fw405OTNr8veRookZgEKRT
         m7zqPbWAZWCRctSekcni//EWXY7wMO9EdEy5tuS/6SdiinK/PRuN2Syz4CI451TtyM3m
         o9+HvPLvTjTzmcpTJEV1QCYIufohX+9GYM9dPTTqq9DmAMewk5qMS5oMLUTwl7Mb9fUm
         pmf2Emoy1KJvQqK7IN6gqCiwv4Ov8ofRdHWOUM3cLwn2cntjtF/qzc48+YUcSaya9q3p
         pz5ioKfE7zlU2/XhOUgLFiC6BucIjnS5DmxddTzqXLWU+yXIoWHBb2Cx4NuXOanu84/U
         e8hw==
X-Gm-Message-State: AOJu0YyTmhR0dx9sCK1+1tPPnt67Eq6FIMILg6K7eCS+MPdMcKYRhWNG
	qpyCZcsVWtiMUvcHCKJQu/6H7nUZWSlT5qWcor22taSBRFOe+ZWwOo6dcA==
X-Google-Smtp-Source: AGHT+IHOXcPnGayVTPhZzz8OZ+c3Lz5+BT9vxvyY7+l0IxKKgpIVR1XcGrqcpo3lf+pJ8Rge/dKKni1mCcEzD5w64tY=
X-Received: by 2002:a05:6402:1381:b0:53e:1b:15f5 with SMTP id
 b1-20020a056402138100b0053e001b15f5mr5785529edv.39.1699962504546; Tue, 14 Nov
 2023 03:48:24 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 14 Nov 2023 11:47:48 +0000
Message-ID: <CAO-mL=z3kjPgK-VkH4pqd29WDJKeTobFHG-dctRO95drqEhPaw@mail.gmail.com>
Subject: FOSDEM 2024 - CfP
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000037245a060a1b5ddc"

--00000000000037245a060a1b5ddc
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'd love to know your interest in attending/speaking at FOSDEM 2024
<https://fosdem.org/2024/>.
The event takes place on 3rd and 4th February 2024.

If you are interested and would like to speak about The Xen Project but
have travel funding restrictions, please reach out to see if we can help by
the end of this week.

*Call For Papers*


*Submission deadline: 8th December 2023Acceptance notifications: 10th
December 2023Final schedule announcement: 15th December 2023*
*Devroom: 3rd February 2024*

https://lists.fosdem.org/pipermail/fosdem/2023q4/003481.html

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--00000000000037245a060a1b5ddc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;d love to know your inter=
est in attending/speaking at <a href=3D"https://fosdem.org/2024/">FOSDEM 20=
24</a>.=C2=A0</div><div>The event takes place on 3rd and 4th February 2024.=
</div><div><br></div><div>If you are interested and would like to speak abo=
ut The Xen Project but have travel funding restrictions, please reach out t=
o see if we can help by the end of this week.</div><div><br></div><div><b><=
u><i>Call For Papers</i></u></b></div><div><b><i>Submission deadline: 8th D=
ecember 2023<br>Acceptance notifications: 10th December 2023<br>Final sched=
ule announcement: 15th December 2023</i></b></div><div><b><i>Devroom: 3rd F=
ebruary 2024</i></b><pre style=3D""><span style=3D"font-family:Arial,Helvet=
ica,sans-serif"><a href=3D"https://lists.fosdem.org/pipermail/fosdem/2023q4=
/003481.html">https://lists.fosdem.org/pipermail/fosdem/2023q4/003481.html<=
/a></span><br></pre></div><div><div><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</=
div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,13=
6,136)">Open Source Community Manager</div><div style=3D"color:rgb(136,136,=
136)">XenServer, Cloud Software Group</div></div></div></div></div></div></=
div>

--00000000000037245a060a1b5ddc--

