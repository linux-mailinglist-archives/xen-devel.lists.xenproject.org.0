Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5897C92766
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174999.1499923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0UY-0002R7-Sc; Fri, 28 Nov 2025 15:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174999.1499923; Fri, 28 Nov 2025 15:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0UY-0002OK-P3; Fri, 28 Nov 2025 15:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1174999;
 Fri, 28 Nov 2025 15:34:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vP0UX-0002OC-Bu
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:34:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vP0UX-00Cvby-0k
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:34:37 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vP0UX-00G5ft-0A
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:34:37 +0000
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-5597330a34fso1365860e0c.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 07:34:37 -0800 (PST)
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
	From:MIME-Version; bh=sSQ3Fv/mW9lJUG/Ma4PC/hxJQ44xtIU/ZEFLe1Tq+3w=; b=biW0alE
	Kvhh9t/0RwQKYE6cvg1vjdEfOqYxzNyWIVJwsEHrNtAnZca0me4Kb/cn/55R8MUN+59hIrGVAcjKB
	F47f2h8CaIZwueWYLE8QpA9YrSTUh2U373vwwxDecK/u12oDtVoIErmupsmAn+FsORFu5YIKRxpfO
	5S3V44AtaE=;
X-Gm-Message-State: AOJu0YzieE1UZIZ0axanIIADP27F2BkyU20or1FCWu/Vj8XbsPjAwmvD
	eTZjOIE/vk27/Eaeio9CJY03jTJ+wcGHB92Skx8+PTHQrszICpuKtlaD6PVZXZoesOfREudiiKh
	Wo5RiPaiL7MFuuqeO7URXKxmJp0XMGdM=
X-Google-Smtp-Source: AGHT+IG4lDasd+VJkgfDoPl9lGSDO006ODagf5uyfbc1VDPOWQ2QAKa3eQGwJCQVoB/6VnemJ53wPCnxdY31yJRII9M=
X-Received: by 2002:a05:6122:20a9:b0:559:85d5:bfbe with SMTP id
 71dfb90a1353d-55cd76e2796mr5657038e0c.15.1764344076760; Fri, 28 Nov 2025
 07:34:36 -0800 (PST)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Fri, 28 Nov 2025 16:34:25 +0100
X-Gmail-Original-Message-ID: <CAJbE=KwEKtVKVyWHUaT_2pi4mGx2vCSK4kV7w-fMJLzkb4zt3w@mail.gmail.com>
X-Gm-Features: AWmQ_bkjDx_XM6DmnQvbdeHx4O63ARSzVHUwjkk1VpQ_xdWlmFEfulHD-1C2Hbo
Message-ID: <CAJbE=KwEKtVKVyWHUaT_2pi4mGx2vCSK4kV7w-fMJLzkb4zt3w@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for December 4 Xen Community Call @
 16:00 UTC
To: xen-devel@lists.xenproject.org, xen-announce@lists.xenprojet.org
Content-Type: multipart/alternative; boundary="000000000000f4fda00644a95d5e"

--000000000000f4fda00644a95d5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for December's Xen Project Community Call on Th=
ursday,
4 December 2025 at 16:00 UTC (4 pm UK time).

We=E2=80=99d love for you to join. Feel free to participate or just observe=
. This
call is a great opportunity to see what the community is working on, align
our various efforts, and share updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/1RmqVAU258OzT3BYzYw2bg8f/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc. I attempted to clean up the doc, so fe=
el
   free to make any adjustments.



*Call Details:*

   - Date: Thursday, 4 December 2025
   - Time: 16:00 UTC (agenda begins at 16:05 UTC)
   - Find your local timezone here
   <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,2988507,5128581,26=
43743,100,1850147,6&h=3D2988507&date=3D2025-12-4&sln=3D17-18&hf=3Dundefined=
&c=3D1958>
   - Link to Join the Call: https://meet.jit.si/XenProjectCommunityCall


We plan to open the meeting room at 65:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 16:05 UTC.

Want to be CC=E2=80=99d on future calls?

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you Thursday!


Cody Zuschlag
Xen Project - Community Manager

--000000000000f4fda00644a95d5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,<br><br>We=E2=80=99re getting ready =
for December&#39;s Xen Project Community Call on Thursday, 4 December 2025 =
at 16:00 UTC (4 pm UK time).<br><br>We=E2=80=99d love for you to join. Feel=
 free to participate or just observe. This call is a great opportunity to s=
ee what the community is working on, align our various efforts, and share u=
pdates. Everyone is welcome!<br><br><b>Preparation:</b><br><ul><li>Add any =
proposed agenda items or missing action items:=C2=A0<a href=3D"https://cryp=
tpad.fr/pad/#/2/pad/edit/1RmqVAU258OzT3BYzYw2bg8f/">https://cryptpad.fr/pad=
/#/2/pad/edit/1RmqVAU258OzT3BYzYw2bg8f/</a></li><li>If any action items hav=
e been resolved or are no longer relevant, feel free to remove them from th=
e doc. I attempted to clean up the doc, so feel free to make any adjustment=
s.</li></ul><br><b>Call Details:<br></b><ul><li>Date: Thursday, 4 December =
2025</li><li>Time: 16:00 UTC (agenda begins at 16:05 UTC)</li><li><a href=
=3D"https://www.worldtimebuddy.com/?qm=3D1&amp;lid=3D5368361,2988507,512858=
1,2643743,100,1850147,6&amp;h=3D2988507&amp;date=3D2025-12-4&amp;sln=3D17-1=
8&amp;hf=3Dundefined&amp;c=3D1958">Find your local timezone here</a></li><l=
i>Link to Join the Call:=C2=A0<a href=3D"https://meet.jit.si/XenProjectComm=
unityCall">https://meet.jit.si/XenProjectCommunityCall</a></li></ul><br></d=
iv><div>We plan to open the meeting room at 65:00 UTC, but to allow time fo=
r switching between meetings and handling any technical issues, we=E2=80=99=
ll officially start discussing the agenda at 16:05 UTC.<br><br>Want to be C=
C=E2=80=99d on future calls?<br><br>Add or remove yourself from our=C2=A0<a=
 href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">Si=
gn-up Sheet</a>.<br><br>See you Thursday!</div></div><div><br></div><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AI=
orK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6I=
aJUrl12"><br><div>Cody Zuschlag</div><div>Xen Project - Community Manager</=
div></div></div></div></div>

--000000000000f4fda00644a95d5e--

