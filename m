Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805FB1AA26
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 22:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069825.1433524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj1qJ-000805-PR; Mon, 04 Aug 2025 20:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069825.1433524; Mon, 04 Aug 2025 20:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj1qJ-0007yS-MD; Mon, 04 Aug 2025 20:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1069825;
 Mon, 04 Aug 2025 20:31:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uj1qI-0007yM-GG
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 20:31:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uj1qI-001D41-0r
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 20:31:34 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uj1qI-0051Uo-0g
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 20:31:34 +0000
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-539345ebfc8so1192096e0c.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 13:31:34 -0700 (PDT)
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
	From:MIME-Version; bh=H1rePiHkfAqey2t/WRsdoNGO+t3WxD5ZXuLow16apDc=; b=V6veAZ7
	FOwBaVp2msXkgNePs1wm588nQn3nks4Zgue+pywEoDJPZG0vuQCKyM7McGe7IjxpC7vO7DGB6LwnC
	g9fxN5K+IfbS1DQMoQDclOn+RnYNxg+HVttJTHn5PcKPKMI2oIx7asJBXAQPZ3cx6xg5VFIFHM+SV
	cql3DNKOro=;
X-Gm-Message-State: AOJu0YytqgiEWdX3/UIEO+QwZkyEF8fz6+cVDi16eVgwi4/jPCVUrEmJ
	FUoxRHvKGYwI/9lFfoCpUPersBfJVjugNfzl/HMN3eX56icaJzM1qRsyNOCbhFtSzg+A6HI2fds
	pCi9DXWKMW8I9BhnGzqogOtvz1xqKQw0=
X-Google-Smtp-Source: AGHT+IEXthC1bBvYUOsY1FYdAuW58wOsVVEmohxTJ2ZT7Ok01OBJk2D+RZQ0hOPkJGM9ktWoIYkWEsowgrOyQUg1h6Y=
X-Received: by 2002:a05:6122:91a:b0:539:1ddb:95c6 with SMTP id
 71dfb90a1353d-5395f101371mr4660981e0c.3.1754339493608; Mon, 04 Aug 2025
 13:31:33 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Mon, 4 Aug 2025 22:31:22 +0200
X-Gmail-Original-Message-ID: <CAJbE=KyXNMgJSs6AU1T8kdE7_ShL+60wxxJ9+yRFx_R6WBYrqQ@mail.gmail.com>
X-Gm-Features: Ac12FXy27wlWyxQ1IEmTh701mEnI2dEQ9O-txjuSR0j8EiPLGWTvN7Yn6pnKHeY
Message-ID: <CAJbE=KyXNMgJSs6AU1T8kdE7_ShL+60wxxJ9+yRFx_R6WBYrqQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for August 7, 2025 Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000005502cd063b8ffe41"

--0000000000005502cd063b8ffe41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for August's Xen Project Community Call on *Thu=
rsday, 7
August 2025* at *15:00 UTC* (4 pm UK time). We=E2=80=99d love for you to jo=
in. Feel
free to participate or just observe. This call is a great opportunity to
see what the community is working on, align our various efforts, and share
updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/ELpO7rzIdKPuQrSmizBUUf4L/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc.

*Call Details:*

   - *Date:* Thursday, 7 August 2025
   - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
      - Find your local timezone here
      <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,5128581,100,265=
3941,2988507,1850147&h=3D2988507&date=3D2025-8-7&sln=3D17-17.5&hf=3Dundefin=
ed&c=3D1639>
   - *Link to Join the Call:* https://meet.jit.si/XenProjectCommunityCall

We plan to open the meeting room at 15:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 15:05 UTC.

*Want to be CC=E2=80=99d on future calls?*

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.


See you on thursday!


Cody Zuschlag
Xen Project - Community Manager

--0000000000005502cd063b8ffe41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><div><br></div><div>We=E2=80=
=99re getting ready for August&#39;s Xen Project=C2=A0<span class=3D"gmail-=
il">Community Call</span>=C2=A0on=C2=A0<b>Thursday, 7 August 2025</b>=C2=A0=
at=C2=A0<b>15:00 UTC</b>=C2=A0(4 pm UK time). We=E2=80=99d love for you to =
join. Feel free to participate or just observe. This=C2=A0<span class=3D"gm=
ail-il">call</span>=C2=A0is a great opportunity to see what the=C2=A0<span =
class=3D"gmail-il">community</span>=C2=A0is working on, align our various e=
fforts, and share updates. Everyone is welcome!</div><div><p><b>Preparation=
:</b></p></div><div><ul><li style=3D"margin-left:15px">Add any proposed age=
nda items or missing action items:=C2=A0<a href=3D"https://cryptpad.fr/pad/=
#/2/pad/edit/ELpO7rzIdKPuQrSmizBUUf4L/" target=3D"_blank">https://cryptpad.=
fr/pad/#/2/pad/edit/ELpO7rzIdKPuQrSmizBUUf4L/</a></li><li style=3D"margin-l=
eft:15px">If any action items have been resolved or are no longer relevant,=
 feel free to remove them from the doc.=C2=A0</li></ul></div><div><b><span =
class=3D"gmail-il">Call</span>=C2=A0Details:</b></div><div><ul><li style=3D=
"margin-left:15px"><b>Date:</b>=C2=A0Thursday, 7 August 2025</li><li style=
=3D"margin-left:15px"><b>Time:</b>=C2=A015:00 UTC (agenda begins at 15:05 U=
TC)</li><ul><li style=3D"margin-left:15px"><a href=3D"https://www.worldtime=
buddy.com/?qm=3D1&amp;lid=3D5368361,5128581,100,2653941,2988507,1850147&amp=
;h=3D2988507&amp;date=3D2025-8-7&amp;sln=3D17-17.5&amp;hf=3Dundefined&amp;c=
=3D1639" target=3D"_blank">Find your local timezone here</a></li></ul><li s=
tyle=3D"margin-left:15px"><b>Link to Join the=C2=A0<span class=3D"gmail-il"=
>Call</span>:</b>=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityCa=
ll" target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></li><=
/ul></div><div><p>We plan to open the meeting room at 15:00 UTC, but to all=
ow time for switching between meetings and handling any technical issues, w=
e=E2=80=99ll officially start discussing the agenda at 15:05 UTC.</p><p><b>=
Want to be CC=E2=80=99d on future=C2=A0<span class=3D"gmail-il">calls</span=
>?</b><b></b></p><p>Add or remove yourself from our=C2=A0<a href=3D"https:/=
/cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" target=3D"_blank">=
Sign-up Sheet</a>.</p><ul></ul><div>See you on=C2=A0thursday!</div></div></=
div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.googleu=
sercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_=
0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen Pro=
ject - Community Manager</div></div></div></div></div>

--0000000000005502cd063b8ffe41--

