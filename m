Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D1C308BF
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 11:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155618.1485072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEQN-0005Es-N5; Tue, 04 Nov 2025 10:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155618.1485072; Tue, 04 Nov 2025 10:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEQN-0005Bq-KZ; Tue, 04 Nov 2025 10:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1155618;
 Tue, 04 Nov 2025 10:38:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vGEQM-0005Bk-Qd
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:38:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vGEQM-000lxc-1u
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:38:02 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vGEQM-00B2pW-2O
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:38:02 +0000
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-5563c36f5dfso461769e0c.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Nov 2025 02:38:02 -0800 (PST)
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
	From:MIME-Version; bh=1g+Nw35gbIdjqKEd7PHczZmtrvfY29TwPYh6jr27U7s=; b=A5GVf7n
	hav/2DURguuXb6sAoTnreLqfOdSj87gZp+22kQaVUl6EpGRudE1DoXOI4inrBHoImKlETMP7juWyp
	YPs+VjYawQxpPxgwLWTQiXV8+M2Mg9gwV9Pyq7xRUfYPdhosdwDZo+x5TrR3A5YZCTNqyKBR5cz0X
	Fk2Md7AGdM=;
X-Gm-Message-State: AOJu0Yw8wI1WpEL+YGxqIV026VhHgedIK7xZUhy6HLsz6WqxLL8BAsQi
	agqz1od6MQKJ+MRcj/1VbuGj8e1MS45/7Sy3t/bJtRVeeJBqfP/VqHiK1yqocSTS1+O66slx0lR
	j5CGq04oJmP+hIDLrW0MDjW8VRVGjBUo=
X-Google-Smtp-Source: AGHT+IFQA7gN4QmB1Jl6w7tbmBHj+9PB6sf9LwMAUSbb7l4zqkrxVdUdAGzA3F2IcdWZWsK6BZHF4ruv9okA/jC3HqY=
X-Received: by 2002:a05:6122:4895:b0:559:59c9:5f89 with SMTP id
 71dfb90a1353d-55959c9645emr2707332e0c.0.1762252682294; Tue, 04 Nov 2025
 02:38:02 -0800 (PST)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Tue, 4 Nov 2025 11:37:51 +0100
X-Gmail-Original-Message-ID: <CAJbE=Kw6ayV1r3jtjoaaZ1Lcr0dFE4X7P_ZjJztiajnWWPM1Rw@mail.gmail.com>
X-Gm-Features: AWmQ_bkiXtg1WlLSLGBtQs63R8G-PPExZ-jYLiGE-MGc3AhtVq387d4eiDYlawY
Message-ID: <CAJbE=Kw6ayV1r3jtjoaaZ1Lcr0dFE4X7P_ZjJztiajnWWPM1Rw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for November 6, 2025 Community Call
 @ 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000021fb4c0642c26dfc"

--00000000000021fb4c0642c26dfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for November's Xen Project Community Call on Th=
ursday,
6 November 2025 at 15:00 UTC (3 pm UK time, *please account for your local
daylight savings time*).

We=E2=80=99d love for you to join. Feel free to participate or just observe=
. This
call is a great opportunity to see what the community is working on, align
our various efforts, and share updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/UgvUtRc5Gi68FxOSuye5gWH0/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc. I attempted to clean up the doc, so fe=
el
   free to make any adjustments.


*Call Details:*

   - Date: Thursday, 6 November 2025
   - Time: 15:00 UTC (agenda begins at 15:05 UTC)
   - Find your local timezone here
   <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,2988507,5128581,26=
43743,100,1850147&h=3D2988507&date=3D2025-11-6&sln=3D16-17&hf=3Dundefined&c=
=3D1901>
   - Link to Join the Call: https://meet.jit.si/XenProjectCommunityCall

We plan to open the meeting room at 15:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 15:05 UTC.

Want to be CC=E2=80=99d on future calls?

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you Thursday!


Cody Zuschlag
Xen Project - Community Manager

--00000000000021fb4c0642c26dfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br><br>We=E2=80=99re getting ready for N=
ovember&#39;s Xen Project Community Call on Thursday, 6 November 2025 at 15=
:00 UTC (3 pm UK time, <b>please account for your local daylight savings ti=
me</b>).=C2=A0</div><div><br></div><div>We=E2=80=99d love for you to join. =
Feel free to participate or just observe. This call is a great opportunity =
to see what the community is working on, align our various efforts, and sha=
re updates. Everyone is welcome!<br><br><b>Preparation:</b><br><ul><li styl=
e=3D"margin-left:15px">Add any proposed agenda items or missing action item=
s:=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/UgvUtRc5Gi68FxOSuye=
5gWH0/">https://cryptpad.fr/pad/#/2/pad/edit/UgvUtRc5Gi68FxOSuye5gWH0/</a><=
/li><li style=3D"margin-left:15px">If any action items have been resolved o=
r are no longer relevant, feel free to remove them from the doc. I attempte=
d to clean up the doc, so feel free to make any adjustments.</li></ul><br><=
b>Call Details:</b><br><ul><li style=3D"margin-left:15px">Date: Thursday, 6=
 November 2025</li><li style=3D"margin-left:15px">Time: 15:00 UTC (agenda b=
egins at 15:05 UTC)</li><li style=3D"margin-left:15px"><a href=3D"https://w=
ww.worldtimebuddy.com/?qm=3D1&amp;lid=3D5368361,2988507,5128581,2643743,100=
,1850147&amp;h=3D2988507&amp;date=3D2025-11-6&amp;sln=3D16-17&amp;hf=3Dunde=
fined&amp;c=3D1901" target=3D"_blank">Find your local timezone here</a></li=
><li style=3D"margin-left:15px">Link to Join the Call:=C2=A0<a href=3D"http=
s://meet.jit.si/XenProjectCommunityCall" target=3D"_blank">https://meet.jit=
.si/XenProjectCommunityCall</a></li></ul>We plan to open the meeting room a=
t 15:00 UTC, but to allow time for switching between meetings and handling =
any technical issues, we=E2=80=99ll officially start discussing the agenda =
at 15:05 UTC.<br><br>Want to be CC=E2=80=99d on future calls?<br><br>Add or=
 remove yourself from our=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/e=
dit/D9vGzihPxxAOe6RFPz0sRCf+/" target=3D"_blank">Sign-up Sheet</a>.</div><d=
iv><br></div><div>See you Thursday!</div><div><br></div><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCO=
FJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br=
><div>Cody Zuschlag</div><div>Xen Project - Community Manager</div></div></=
div></div></div>

--00000000000021fb4c0642c26dfc--

