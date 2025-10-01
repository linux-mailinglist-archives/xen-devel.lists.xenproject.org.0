Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6541BB181E
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 20:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135025.1472450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v41eU-0002kg-Si; Wed, 01 Oct 2025 18:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135025.1472450; Wed, 01 Oct 2025 18:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v41eU-0002iu-Py; Wed, 01 Oct 2025 18:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1135025;
 Wed, 01 Oct 2025 18:34:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1v41eT-0002io-8M
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 18:34:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1v41eT-003TcL-0X
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 18:34:09 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1v41eT-00ALEU-1I
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 18:34:09 +0000
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-5523142df73so123498e0c.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Oct 2025 11:34:09 -0700 (PDT)
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
	From:MIME-Version; bh=lbAYGaVAVdXP+yPSeDU6mS37pDuHF65UHZemJbQAa/I=; b=07m2RJ4
	soW2t08Male+76jplD8edLsaZM0UNIiFVz5StSbVTE9EZEu7YAPapBw2K333Xwe79vaDsHM9Y2eTF
	d0yvcEeOVVhBtY/Ik30toypzLUrBs4EEDDbxLvRz9F43LvXbesAAun0knfqK3V2uqpX/ZuNh/avks
	9VAS9PFbUU=;
X-Gm-Message-State: AOJu0Ywxj0Th0SphS0asTldRmtqoj4g0OsvjEeZtoNEA+1lqrZqSnU0C
	VEDbQMoENDs5VZLQXQrJhQOzZUbvinvisYDHLjmf4LPx4GqArubgGA8AtWm2ut2mNkU160ao6qX
	yCij3LW8amhJqQp3NguF94sXZaRniKbw=
X-Google-Smtp-Source: AGHT+IE2c+WdvbMv7cHOm4U3ozF2Zmeeg5ZT4xJTR50lP0eoNa0A40JOtFqY1A24OVdHrdPRDTiqu8TDAUK+VRjlHkI=
X-Received: by 2002:a05:6122:4f97:b0:549:f04a:6e9e with SMTP id
 71dfb90a1353d-5522d3aef5fmr2272054e0c.13.1759343648657; Wed, 01 Oct 2025
 11:34:08 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 1 Oct 2025 20:33:57 +0200
X-Gmail-Original-Message-ID: <CAJbE=KzfPJuj8ZBbZjLtGpbHzpq_GHWs3xnrNwZTXtbFkaVMsw@mail.gmail.com>
X-Gm-Features: AS18NWA2AvLuMFui42c_XR_fIvnhUf8Ec4vRK1aDhV8fP38oz793VopFJ1CRxTA
Message-ID: <CAJbE=KzfPJuj8ZBbZjLtGpbHzpq_GHWs3xnrNwZTXtbFkaVMsw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for October 2, 2025 Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000037582c06401d1d10"

--00000000000037582c06401d1d10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for October's Xen Project Community Call on Thu=
rsday, 2
October 2025 at 15:00 UTC (4 pm UK time). We=E2=80=99d love for you to join=
. Feel
free to participate or just observe. This call is a great opportunity to
see what the community is working on, align our various efforts, and share
updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/yMV40EeEBarezw1peUIWNhWk/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc.


*Call Details:*

   - Date: Thursday, 2 October 2025
   - Time: 15:00 UTC (agenda begins at 15:05 UTC)
   - Find your local timezone here
   <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,5128581,100,265394=
1,2988507,1850147&h=3D2988507&date=3D2025-10-2&sln=3D17-18&hf=3Dundefined&c=
=3D1641>
   - Link to Join the Call: https://meet.jit.si/XenProjectCommunityCall

We plan to open the meeting room at 15:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 15:05 UTC.

Want to be CC=E2=80=99d on future calls?

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you tomorrow!
Cody Zuschlag
Xen Project - Community Manager

--00000000000037582c06401d1d10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<br><br>We=E2=80=99re getting ready for Octobe=
r&#39;s Xen Project Community Call on Thursday, 2 October 2025 at 15:00 UTC=
 (4 pm UK time). We=E2=80=99d love for you to join. Feel free to participat=
e or just observe. This call is a great opportunity to see what the communi=
ty is working on, align our various efforts, and share updates. Everyone is=
 welcome!<br><br><b>Preparation:</b><br><ul style=3D""><li style=3D"">Add a=
ny proposed agenda items or missing action items:=C2=A0<a href=3D"https://c=
ryptpad.fr/pad/#/2/pad/edit/yMV40EeEBarezw1peUIWNhWk/">https://cryptpad.fr/=
pad/#/2/pad/edit/yMV40EeEBarezw1peUIWNhWk/</a></li><li style=3D"">If any ac=
tion items have been resolved or are no longer relevant, feel free to remov=
e them from the doc.</li></ul><br><b>Call Details:</b><br><ul style=3D""><l=
i style=3D"">Date: Thursday, 2 October 2025</li><li style=3D"">Time: 15:00 =
UTC (agenda begins at 15:05 UTC)</li><li style=3D""><a href=3D"https://www.=
worldtimebuddy.com/?qm=3D1&amp;lid=3D5368361,5128581,100,2653941,2988507,18=
50147&amp;h=3D2988507&amp;date=3D2025-10-2&amp;sln=3D17-18&amp;hf=3Dundefin=
ed&amp;c=3D1641">Find your local timezone here</a></li><li style=3D"">Link =
to Join the Call: <a href=3D"https://meet.jit.si/XenProjectCommunityCall">h=
ttps://meet.jit.si/XenProjectCommunityCall</a></li></ul>We plan to open the=
 meeting room at 15:00 UTC, but to allow time for switching between meeting=
s and handling any technical issues, we=E2=80=99ll officially start discuss=
ing the agenda at 15:05 UTC.<br><br>Want to be CC=E2=80=99d on future calls=
?<br><br>Add or remove yourself from our <a href=3D"https://cryptpad.fr/pad=
/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">Sign-up Sheet</a>.<div><br></div><=
div>See you tomorrow!<br><div><img src=3D"https://ci3.googleusercontent.com=
/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4v=
ZVE2oBOqnY6IaJUrl12"></div><div><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Cody Zuschlag</div=
><div>Xen Project - Community Manager</div></div></div></div></div></div>

--00000000000037582c06401d1d10--

