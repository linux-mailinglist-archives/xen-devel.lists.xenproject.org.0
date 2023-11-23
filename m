Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C37F5FA6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 14:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639717.997382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69LF-0005XY-9U; Thu, 23 Nov 2023 13:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639717.997382; Thu, 23 Nov 2023 13:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69LF-0005Uw-68; Thu, 23 Nov 2023 13:02:01 +0000
Received: by outflank-mailman (input) for mailman id 639717;
 Thu, 23 Nov 2023 13:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgoN=HE=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r69LE-0005Uq-Es
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 13:02:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c935877-8a00-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 14:01:59 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a03a9009572so106799466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 05:01:59 -0800 (PST)
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
X-Inumbo-ID: 7c935877-8a00-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700744518; x=1701349318; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/nk61CThOtea5xEFpqybNHgT8bhSZzhIxClozUiKtjU=;
        b=SzcL6oY8zxZubhQHF8TleKgcnoGNk8kwi5/SuZXlnhSYhjJdZZBqoR0yd84xH/wDAo
         SKEl3iUPilb59P6NbzKUm6CHKFTsxptIWs+eXiKZCFpIp+CCQ9tsknBp2IBhGgyi7CM/
         5dNpGqB6MVSAlq6gMwClkp/izyn8BDIqVQqzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700744518; x=1701349318;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nk61CThOtea5xEFpqybNHgT8bhSZzhIxClozUiKtjU=;
        b=MF//xEVoSCUI/4veE85FVlgD75/kkN8u02uULCNGrNzBt4ZIc9QD9589al10qqSpe3
         Bl9kUqEzI2brCr50MLCkF07D5h8r8ccCB/uJ7B8aqu028my8AwmYdwzo10xYt2ycQLha
         uB7J8JgnwSUv2hzchj4CsoXsFKrj+NDygIHSaazeMyqch76duwdyJ4NQFrUs8FxccUYz
         gSnYcthXcK47a+FFPiMJG8i7hCcedZ5TEebrqZ345FSosaOAA2TryhqfIqLn0LA/KMOn
         bqFUx1omWouiKITCpjDc4c9O9Arxjt7CXSdd9j2nB2Xaf3U/wfpUIxJsO5FdwWDtcHKa
         pFPQ==
X-Gm-Message-State: AOJu0Yxj7MAROIfAaBoU4hulGh8lZzlXPGN/liOfgy9sJ3eom0K8tvCw
	Mr0Oh/nK/BfiDcEUSjvMK94MpbMdOQkEEHyCGDus3A==
X-Google-Smtp-Source: AGHT+IFnRzRjHWXNuEftP4xueMU/4wZoowDeYOi40petKXnK6ZIqgaNdUhI7PmdOa0JJfHdh9oW/qD+bTaFXBy5pP7s=
X-Received: by 2002:a17:906:48c7:b0:a00:9e91:ce17 with SMTP id
 d7-20020a17090648c700b00a009e91ce17mr3570586ejt.67.1700744518502; Thu, 23 Nov
 2023 05:01:58 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 23 Nov 2023 13:01:22 +0000
Message-ID: <CAO-mL=yeRn02O9vN-fNnSuXpvWq1_cYDLPDc=Le+nC3gTnkUpw@mail.gmail.com>
Subject: =?UTF-8?Q?The_Xen_Project=E2=80=99s_20th_Anniversary_=2D_Upcoming_Soci?=
	=?UTF-8?Q?al_Event=21?=
To: advisory-board@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e12de7060ad17033"

--000000000000e12de7060ad17033
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*The Xen Project=E2=80=99s 20th Anniversary*

*Let's get together for an informal social, likely to be pizza/drinks and
getting involved with the community. I hope to run these in future
locations to give everyone a chance to attend.*

*Date placeholder: Wednesday 21st February 2024*
*Location: Cambridge*
*Details TBC - **If you're interested, please reply to me directly and I
will add you to the list.*

*Celebrating Two Decades of Innovation*

It=E2=80=99s hard to believe that two decades have passed since the incepti=
on of
the Xen Project, a trailblazing force in the world of open-source
virtualization. As we raise our glasses to commemorate this momentous
occasion, it=E2=80=99s not just a celebration of time but a reflection on t=
he
incredible journey that has defined the Xen Project=E2=80=99s legacy.

*A Legacy of Innovation*

In the year 2003, the Xen Project emerged as a pioneering open-source
hypervisor, laying the groundwork for some of the most influential cloud
infrastructures that shape our digital landscape today. Over the past 20
years, the Xen Project has not only endured but has thrived, continuously
evolving to meet the dynamic demands of the ever-changing tech landscape.

*Driving Technological Frontiers*

From data center and server virtualization to cloud computing, desktop
virtualization, and fortifying desktop security and hardware appliances,
the Xen Project has been at the forefront of driving technological
innovation. With 20 years of relentless development, it has become
synonymous with reliability, scalability, and adaptability.

*Venturing into New Horizons*

As we celebrate this milestone, we also look forward to the exciting new
territories that the Xen Project is venturing into. From embedded
virtualization to even making strides in the automotive industry, the Xen
Project continues to push boundaries and redefine what=E2=80=99s possible i=
n the
world of open-source virtualization.

*The Annual Event: Xen Project Developer and Design Summit*

At the heart of this remarkable journey is the Xen Project Developer and
Design Summit, an annual gathering of the community=E2=80=99s brilliant min=
ds and
power users. More than just a conference, it=E2=80=99s a celebration of ide=
a
exchange, a showcase of the latest advancements, a platform for sharing
invaluable experiences, and a forum for strategic planning and
collaborative efforts. Be sure to look out for our upcoming event in 2024.

*A Vibrant Community Defining the Future*

Beyond the code and technological achievements, the Xen Project=E2=80=99s s=
trength
lies in its vibrant community. It=E2=80=99s a community that has come toget=
her to
celebrate successes, overcome challenges, and collectively shape the future
of open-source virtualization technology. Even to this day, community
contributions and reviews are still going!

*Looking Ahead*

As we commemorate 20 years of innovation, we also eagerly anticipate the
next chapter in the Xen Project=E2=80=99s journey. With gratitude for the p=
ast and
excitement for the future, we extend our deepest thanks to everyone who has
contributed to this incredible legacy.

Here=E2=80=99s to 20 years of pushing boundaries, fostering collaboration, =
and
shaping the digital landscape.

Happy anniversary, Xen Project! The best is yet to come and I can=E2=80=99t=
 wait to
see what we all achieve.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--000000000000e12de7060ad17033
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><b>The Xen Project=E2=80=99s 20th Anniversary</b></di=
v><div><br></div><div><i>Let&#39;s get=C2=A0together for an informal social=
, likely to be pizza/drinks and getting involved with the community. I hope=
 to run these in future locations to give everyone a chance to attend.</i><=
/div><div><i><br></i></div><div><i><b>Date placeholder: Wednesday 21st Febr=
uary 2024</b></i></div><div><i><b>Location: Cambridge</b></i></div><div><i>=
<b>Details TBC -=C2=A0</b></i><b><font color=3D"#ff0000"><i>If you&#39;re i=
nterested, please reply to me directly and I will add you to the list.</i><=
/font></b></div><div><br></div><div><b>Celebrating Two Decades of Innovatio=
n</b><br></div><div><b><br></b></div><div>It=E2=80=99s hard to believe that=
 two decades have passed since the inception of the Xen Project, a trailbla=
zing force in the world of open-source virtualization. As we raise our glas=
ses to commemorate this momentous occasion, it=E2=80=99s not just a celebra=
tion of time but a reflection on the incredible journey that has defined th=
e Xen Project=E2=80=99s legacy.<br><b><br>A Legacy of Innovation</b><br><br=
>In the year 2003, the Xen Project emerged as a pioneering open-source hype=
rvisor, laying the groundwork for some of the most influential cloud infras=
tructures that shape our digital landscape today. Over the past 20 years, t=
he Xen Project has not only endured but has thrived, continuously evolving =
to meet the dynamic demands of the ever-changing tech landscape.<br><b><br>=
Driving Technological Frontiers</b><br><br>From data center and server virt=
ualization to cloud computing, desktop virtualization, and fortifying deskt=
op security and hardware appliances, the Xen Project has been at the forefr=
ont of driving technological innovation. With 20 years of relentless develo=
pment, it has become synonymous with reliability, scalability, and adaptabi=
lity.<br><b><br>Venturing into New Horizons</b><br><br>As we celebrate this=
 milestone, we also look forward to the exciting new territories that the X=
en Project is venturing into. From embedded virtualization to even making s=
trides in the automotive industry, the Xen Project continues to push bounda=
ries and redefine what=E2=80=99s possible in the world of open-source virtu=
alization.<br><b><br>The Annual Event: Xen Project Developer and Design Sum=
mit</b><br><br>At the heart of this remarkable journey is the Xen Project D=
eveloper and Design Summit, an annual gathering of the community=E2=80=99s =
brilliant minds and power users. More than just a conference, it=E2=80=99s =
a celebration of idea exchange, a showcase of the latest advancements, a pl=
atform for sharing invaluable experiences, and a forum for strategic planni=
ng and collaborative efforts. Be sure to look out for our upcoming event in=
 2024.<br><b><br>A Vibrant Community Defining the Future</b><br><br>Beyond =
the code and technological achievements, the Xen Project=E2=80=99s strength=
 lies in its vibrant community. It=E2=80=99s a community that has come toge=
ther to celebrate successes, overcome challenges, and collectively shape th=
e future of open-source virtualization technology. Even to this day, commun=
ity contributions and reviews are still going!<br><br><b>Looking Ahead</b><=
br><br>As we commemorate 20 years of innovation, we also eagerly anticipate=
 the next chapter in the Xen Project=E2=80=99s journey. With gratitude for =
the past and excitement for the future, we extend our deepest thanks to eve=
ryone who has contributed to this incredible legacy.<br><br>Here=E2=80=99s =
to 20 years of pushing boundaries, fostering collaboration, and shaping the=
 digital landscape.<br><br>Happy anniversary, Xen Project! The best is yet =
to come and I can=E2=80=99t wait to see what we all achieve.<br></div><div>=
<br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</=
div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Open Source C=
ommunity Manager</div><div style=3D"color:rgb(136,136,136)">XenServer, Clou=
d Software Group</div></div></div></div></div></div>

--000000000000e12de7060ad17033--

