Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9B8FE01F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735952.1142101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7oC-0001bO-Gp; Thu, 06 Jun 2024 07:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735952.1142101; Thu, 06 Jun 2024 07:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7oC-0001Yl-D9; Thu, 06 Jun 2024 07:45:16 +0000
Received: by outflank-mailman (input) for mailman id 735952;
 Thu, 06 Jun 2024 07:45:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDjy=NI=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sF7oA-0001AU-L2
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 07:45:14 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5244c91-23d8-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 09:45:13 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e6f33150bcso6262491fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 00:45:13 -0700 (PDT)
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
X-Inumbo-ID: b5244c91-23d8-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717659912; x=1718264712; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QnBvdIAJVyhTAREsYk4qao8v/d3hMUjmboeptL4WYQE=;
        b=aAzGPmsrtEO7YVQKxIJDLYJRCFFfCd7lw5hSKEbyY8So0WO1WrAVhqXF/FEzw95gXt
         tIih7x7aiBM8Cu7WdMdRQPEkcpV1kCFqgv6/IumGVUnZkCwOCp6PxRyGgwdcBXfs3hoN
         9chGaSQGBeFvToXIUk8lH+kjlepwwxzDf7c+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717659912; x=1718264712;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnBvdIAJVyhTAREsYk4qao8v/d3hMUjmboeptL4WYQE=;
        b=QujsjvjYL2C8syPnlypTaf2shKb3L8D6ogRBX0MMYBbwS+7GQJLX04dpGwRsKab5JA
         O3NVuTXv2P0SpEEIMyY3BUeXFa+kwKLQtQyNoonnfWtg62sHRQU5Z+mHMSioI3LgeIgx
         yn4UYjJU147IYP0Asi0nR3cHt3FcbnT5N4v6P+jbhX74zRx59L52VHK65etnisH3Vhb/
         65hxOTHVYF+XlPkPFWSGp2OESzVEmj7n4wYD6ldl3dCp89ZelLyBFNR2z9BUvAPFinhL
         XQroJNqCfDsGewdWl9YDsINmwzYSpVskVPIoE95uQMKrkkX7OdHgPE7Wdp8iYZo5rgxS
         ZHvQ==
X-Gm-Message-State: AOJu0YzorA+xWxbdU1hqXGxxN7K9LECJQFr1a0BtrKTTKMd7WtctSqbx
	JFTF1MhIMfNmmR+1iFv56qc3UG4tYuXcJKkzjenMMep+I/m/MTkSiuAv1H7mkKNKbRmoJE3g4+G
	UqB0DD3ws9WE/ytZhIy8VNasiCOrBL5IEV+RmIaAXOmHfIog9JJORtA==
X-Google-Smtp-Source: AGHT+IHemNqLVUcAMWRh60pK+cqN3cSCwjd2eUCpFKPmdqGhrftjP4ZIOKxjb07Dzuc7gqJiHAstroU+sdEbDNhIJHU=
X-Received: by 2002:a2e:90d6:0:b0:2e9:881b:5f02 with SMTP id
 38308e7fff4ca-2eac7aa4f5bmr26131051fa.53.1717659912284; Thu, 06 Jun 2024
 00:45:12 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 6 Jun 2024 08:45:00 +0100
Message-ID: <CAO-mL=wF=k_8m90cg3VJR0yutAqqEU3VQmavWaKB6G=PVCTF9A@mail.gmail.com>
Subject: Join us for day 3 - Free virtual Xen Summit 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: advisory-board@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000eadab2061a33dc31"

--000000000000eadab2061a33dc31
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Please find the *schedule of talks listed here.*
<https://events.linuxfoundation.org/xen-project-summit/program/schedule/>

   - All sessions on Thursday 6th June will use the following links:
   - *DESIGN SESSION A <https://meet.jit.si/XenDesignSessionsA> *(Liberdade
      Room)
      - *DESIGN SESSION B <https://meet.jit.si/XenDesignSessionsB> *(Augusta
      Room)
      - Please look out on the schedule for the time and which session room
      it takes place in


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

--000000000000eadab2061a33dc31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>Please find the=C2=A0<a hr=
ef=3D"https://events.linuxfoundation.org/xen-project-summit/program/schedul=
e/" target=3D"_blank"><b>schedule=C2=A0of talks listed here.</b></a><br></d=
iv><div><ul><li style=3D"margin-left:15px">All sessions on Thursday 6th Jun=
e will use the following links:<br></li><ul><li style=3D"margin-left:15px">=
<b><a href=3D"https://meet.jit.si/XenDesignSessionsA" target=3D"_blank">DES=
IGN SESSION A</a>=C2=A0</b>(Liberdade Room)=C2=A0</li><li style=3D"margin-l=
eft:15px"><b><a href=3D"https://meet.jit.si/XenDesignSessionsB" target=3D"_=
blank">DESIGN SESSION=C2=A0B</a>=C2=A0</b>(Augusta Room)</li><li style=3D"m=
argin-left:15px">Please look out on the schedule for the time and which ses=
sion room it takes place in</li></ul></ul><ul><li style=3D"margin-left:15px=
">The same links will be used throughout talks and sessions</li><li style=
=3D"margin-left:15px">(Optional) Join our Xen Summit matrix channel for upd=
ates on the day:=C2=A0<a href=3D"https://matrix.to/#/%23xen-project-summit:=
matrix.org" target=3D"_blank">https://matrix.to/#/#xen-project-summit:matri=
x.org</a>=C2=A0</li></ul><div><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div><b><u>Some ground rules to follow:</u></b></div><d=
iv><ul><li style=3D"margin-left:15px">Enter your full name on Jitsi so ever=
yone knows who you are</li><li style=3D"margin-left:15px">Please mute yours=
elf upon joining=C2=A0</li><li style=3D"margin-left:15px">Turning on camera=
s is optional, but we encourage doing this for design sessions</li><li styl=
e=3D"margin-left:15px">Do=C2=A0<u>not</u>=C2=A0shout out your questions dur=
ing session presentations, instead ask these on the chat function and we wi=
ll do our best to ask on behalf of you</li><li style=3D"margin-left:15px">D=
uring design sessions, we encourage you to unmute and participate freely</l=
i><li style=3D"margin-left:15px">If multiple people wish to speak, please u=
se the &#39;raise hand&#39; function on=C2=A0Jitsi or chat</li><li style=3D=
"margin-left:15px">Should there be a need, moderators will have permission =
to remove anyone who is disruptive in sessions on=C2=A0Jitsi</li><li style=
=3D"margin-left:15px">If you face issues on the day, please let us know via=
 Matrix - we will do our best to help, but please note this is a community =
effort=C2=A0</li></ul></div></div></div></div></div></div><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><d=
iv style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"co=
lor:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></=
div>

--000000000000eadab2061a33dc31--

