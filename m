Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CDB424F7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 17:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108641.1458697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpI8-0006P8-K5; Wed, 03 Sep 2025 15:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108641.1458697; Wed, 03 Sep 2025 15:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpI8-0006Mn-HJ; Wed, 03 Sep 2025 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1108641;
 Wed, 03 Sep 2025 15:20:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1utpI7-0006Md-CN
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:20:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1utpI6-004dkF-2l
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:20:55 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1utpI7-00EUr2-02
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:20:55 +0000
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-545dccac2f9so29356e0c.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 08:20:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:MIME-Version; bh=5wLpxyT35MYjQy1lDG7ITcvMpGAAj6EgEsv9ErVZivQ=; b=X03kZDu
	4wKvX3YjDWXw4VJ7FigVrx+0NE/xBQrR0WuYmmbng8Wh2r0u4f5Mu8MckKmPQ4RcsT0QAliMUYJDI
	m6GjwdnOSg0TlDgXMg/xqSW2CmqzTtziMqvKISicg1lLTz7FYV46127qIXichr6EmtsdBprf3VnDf
	aPf0yQkvII=;
X-Gm-Message-State: AOJu0Yz9KwvwwkZc0BHWnmgY+3Amt7cl2JJnYFVlaG1LD6QU7bmeqh63
	on9jbzQg7+jj2vIV+bPwmPYvTEjHB2yOPeg36BeEYZJIR2b+bfuz5pfTibWElHdeKU1Py2NsWD5
	1Z7diKclBf2pWDCqVHmylLM+AuawHmqs=
X-Google-Smtp-Source: AGHT+IFFPDuqHwfTugBWMdaTzomUjTdWBYvoyU0mDOPAZuVA4osSDjSTRvWzDz/TIQDwqnHSY7yb0+ceipcjsIelrK0=
X-Received: by 2002:a05:6122:a27:b0:544:6eb7:d7b5 with SMTP id
 71dfb90a1353d-544a0295260mr5397251e0c.9.1756912854515; Wed, 03 Sep 2025
 08:20:54 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 3 Sep 2025 17:20:43 +0200
X-Gmail-Original-Message-ID: <CAJbE=Kye7kfrGsPccJDtHqAF1TfuH7THe8JjdGXsSBw3vgoeqQ@mail.gmail.com>
X-Gm-Features: Ac12FXz__cgvA71FYzfmoDYTuuMzYWcL4nlx3mXaWmoX2DhKPgMGHgRR8tvJ3Bk
Message-ID: <CAJbE=Kye7kfrGsPccJDtHqAF1TfuH7THe8JjdGXsSBw3vgoeqQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for September 4, 2025 Community Call
 @ 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000984cd2063de72663"

--000000000000984cd2063de72663
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for August's Xen Project Community Call on Thur=
sday, 4
September 2025 at 15:00 UTC (4 pm UK time). We=E2=80=99d love for you to jo=
in. Feel
free to participate or just observe. This call is a great opportunity to
see what the community is working on, align our various efforts, and share
updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/EEoPk+k6ZwCj4kl7j+c0F9S3/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc.



*Call Details:*

   - *Date:* Thursday, 4 September 2025
   - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
      - Find your local timezone here
      <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,5128581,100,265=
3941,2988507,1850147&h=3D2988507&date=3D2025-9-4&sln=3D17-17.5&hf=3Dundefin=
ed&c=3D1632>
   - *Link to Join the Call:* https://meet.jit.si/XenProjectCommunityCall

We plan to open the meeting room at 15:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 15:05 UTC.

Want to be CC=E2=80=99d on future calls?

Add or remove yourself from our Sign-up Sheet.

See you on thursday!

Cody Zuschlag
Xen Project - Community Manager

--000000000000984cd2063de72663
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br><br>We=E2=80=99re getting ready for A=
ugust&#39;s Xen Project Community Call on Thursday, 4 September 2025 at 15:=
00 UTC (4 pm UK time). We=E2=80=99d love for you to join. Feel free to part=
icipate or just observe. This call is a great opportunity to see what the c=
ommunity is working on, align our various efforts, and share updates. Every=
one is welcome!<br><br></div><div><b>Preparation:</b><br><ul><li>Add any pr=
oposed agenda items or missing action items:=C2=A0<a href=3D"https://cryptp=
ad.fr/pad/#/2/pad/edit/EEoPk+k6ZwCj4kl7j+c0F9S3/">https://cryptpad.fr/pad/#=
/2/pad/edit/EEoPk+k6ZwCj4kl7j+c0F9S3/</a></li><li>If any action items have =
been resolved or are no longer relevant, feel free to remove them from the =
doc. </li></ul><br></div><div><b>Call Details:<br></b><ul><li><b>Date:</b> =
Thursday, 4 September 2025</li><li><b>Time:</b> 15:00 UTC (agenda begins at=
 15:05 UTC)</li><ul><li><a href=3D"https://www.worldtimebuddy.com/?qm=3D1&a=
mp;lid=3D5368361,5128581,100,2653941,2988507,1850147&amp;h=3D2988507&amp;da=
te=3D2025-9-4&amp;sln=3D17-17.5&amp;hf=3Dundefined&amp;c=3D1632">Find your =
local timezone here</a></li></ul><li><b>Link to Join the Call:</b> <a href=
=3D"https://meet.jit.si/XenProjectCommunityCall">https://meet.jit.si/XenPro=
jectCommunityCall</a></li></ul>We plan to open the meeting room at 15:00 UT=
C, but to allow time for switching between meetings and handling any techni=
cal issues, we=E2=80=99ll officially start discussing the agenda at 15:05 U=
TC.<br><br>Want to be CC=E2=80=99d on future calls?<br><br>Add or remove yo=
urself from our Sign-up Sheet.<br><br>See you on thursday!</div><div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4=
x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUr=
l12"><br><div>Cody Zuschlag</div><div>Xen Project - Community Manager</div>=
</div></div></div></div>

--000000000000984cd2063de72663--

