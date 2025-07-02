Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A87AF15F7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031075.1404780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwpE-0001l2-Dw; Wed, 02 Jul 2025 12:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031075.1404780; Wed, 02 Jul 2025 12:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwpE-0001ib-Av; Wed, 02 Jul 2025 12:44:32 +0000
Received: by outflank-mailman (input) for mailman id 1031075;
 Wed, 02 Jul 2025 12:44:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uWwpD-0001iP-GC
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:44:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uWwpD-00Eht2-0C
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:44:31 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uWwpD-0089sf-06
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:44:31 +0000
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-531a1fad7faso1542538e0c.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:44:31 -0700 (PDT)
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
	From:MIME-Version; bh=abyrBwE0J4BIvg8iRPBxG1o2WPjEgGz32rzc7t0F/EE=; b=s+5jX3B
	8XJsxQGp9TLzH2jasaipFznzGmkt5OXcfDUBO9ZlKv/Bn17Tcy3JiGXRtnM8EMWUai12uwmIbAezJ
	62dYjbcOHIZ/DcZKz27HK54ffoVeaUqGAYNSNiIfjxqqQd2ttkceFbPFFsbMbRtkS0MJXIg6x/YcR
	TIl5nTAKQE=;
X-Gm-Message-State: AOJu0Yz/zWR8zR21fqDJ3a7nJE3Zyk3HI9LFYejwjsujamXfL9zzRa7v
	KU+RPhfibieVquA/04fChBvzEMAv3CIeOCXjwsy83eV42mTtYY+WqOagoKSJSNIaord6TmI0acZ
	kpnDq60qY6bxb7yIAONvmhD53jb/Cy7s=
X-Google-Smtp-Source: AGHT+IFi7i7fr9AwQ36UyyIBuKigwobOraEESUBcWb3o/ZwpkXFwQWXryWgoA88w4x7VZWBqAjHTnQtjI4gtS/j0YSQ=
X-Received: by 2002:a05:6122:65a0:b0:52c:4eb0:118d with SMTP id
 71dfb90a1353d-534580a7761mr1790195e0c.4.1751460270601; Wed, 02 Jul 2025
 05:44:30 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 2 Jul 2025 14:44:17 +0200
X-Gmail-Original-Message-ID: <CAJbE=KwUwKZ8VEGm-q=qa35mtmE6Givm78xBKCZ5YmBjwc51QA@mail.gmail.com>
X-Gm-Features: Ac12FXy8qpFC3x8Ne7Cw-leRSIif2470s98JE9VQa8xaqRBIrcx9IplYSFbZ2Zo
Message-ID: <CAJbE=KwUwKZ8VEGm-q=qa35mtmE6Givm78xBKCZ5YmBjwc51QA@mail.gmail.com>
Subject: [ANNOUNCE] [NEW TIME] Call for agenda items for July 10, 2025
 Community Call @ 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000447e8c0638f19f5e"

--000000000000447e8c0638f19f5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,


*IMPORTANT: Due to public holidays in several countries, July's community
call has been moved to Thursday, 10 July 2025.*
We=E2=80=99re getting ready for June's Xen Project Community Call on *Thurs=
day, 10
July 2025* at *15:00 UTC* (4 pm UK time). We=E2=80=99d love for you to join=
. Feel
free to just observe or jump in! This call is a great opportunity to see
what the community is working on, align our various efforts, and share
updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/0f4wUR0R9bQp-kOVpzVp2rJl/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc.

*Call Details:*

   - *Date:* Thursday, 10 July 2025
   - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
      - Find your local timezone here
      <https://www.worldtimebuddy.com/?qm=3D1&lid=3D100,2653941,2988507,536=
8361,5128581,1850147,123,1850147&h=3D2988507&date=3D2025-7-10&sln=3D17-18&h=
f=3Dundefined&c=3D1582>
   - *Link to Join the Call:* https://meet.jit.si/XenProjectCommunityCall

We plan to open the meeting room at 15:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 15:05 UTC.

*Want to be CC=E2=80=99d on future calls?*

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.


See you next week!

Cody Zuschlag
Xen Project - Community Manager

--000000000000447e8c0638f19f5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,</div><div><br></div><b>IMPORTANT: D=
ue to public holidays in several countries, July&#39;s community call has b=
een moved to Thursday, 10 July 2025.<br></b><br><div>We=E2=80=99re getting =
ready for June&#39;s Xen Project Community Call on=C2=A0<b>Thursday, 10 Jul=
y 2025</b>=C2=A0at=C2=A0<b>15:00 UTC</b>=C2=A0(4 pm UK time). We=E2=80=99d =
love for you to join. Feel free to just observe or jump in! This call is a =
great opportunity to see what the community is working on, align our variou=
s efforts, and share updates. Everyone is welcome!</div><div><p><b>Preparat=
ion:</b></p></div><div><ul><li style=3D"margin-left:15px">Add any proposed =
agenda items or missing action items:=C2=A0<a href=3D"https://cryptpad.fr/p=
ad/#/2/pad/edit/0f4wUR0R9bQp-kOVpzVp2rJl/">https://cryptpad.fr/pad/#/2/pad/=
edit/0f4wUR0R9bQp-kOVpzVp2rJl/</a></li><li style=3D"margin-left:15px">If an=
y action items have been resolved or are no longer relevant, feel free to r=
emove them from the doc.=C2=A0</li></ul></div><div><b>Call Details:</b></di=
v><div><ul><li style=3D"margin-left:15px"><b>Date:</b>=C2=A0Thursday, 10 Ju=
ly 2025</li><li style=3D"margin-left:15px"><b>Time:</b>=C2=A015:00 UTC (age=
nda begins at 15:05 UTC)</li><ul><li style=3D"margin-left:15px"><a href=3D"=
https://www.worldtimebuddy.com/?qm=3D1&amp;lid=3D100,2653941,2988507,536836=
1,5128581,1850147,123,1850147&amp;h=3D2988507&amp;date=3D2025-7-10&amp;sln=
=3D17-18&amp;hf=3Dundefined&amp;c=3D1582" target=3D"_blank">Find your local=
 timezone here</a></li></ul><li style=3D"margin-left:15px"><b>Link to Join =
the Call:</b>=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityCall" =
target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></li></ul>=
</div><div><p>We plan to open the meeting room at 15:00 UTC, but to allow t=
ime for switching between meetings and handling any technical issues, we=E2=
=80=99ll officially start discussing the agenda at 15:05 UTC.</p><p><b>Want=
 to be CC=E2=80=99d on future calls?</b><b></b></p><p>Add or remove yoursel=
f from our=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxA=
Oe6RFPz0sRCf+/" target=3D"_blank">Sign-up Sheet</a>.</p><ul></ul><div>See y=
ou next week!</div></div></div><div><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https:/=
/ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36J=
rwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div>=
<div>Xen Project - Community Manager</div></div></div></div></div>

--000000000000447e8c0638f19f5e--

