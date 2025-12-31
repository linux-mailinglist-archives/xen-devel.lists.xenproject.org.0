Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EDECEC250
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 16:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194574.1512938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaxoG-00068s-Dp; Wed, 31 Dec 2025 15:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194574.1512938; Wed, 31 Dec 2025 15:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaxoG-00066I-Al; Wed, 31 Dec 2025 15:08:24 +0000
Received: by outflank-mailman (input) for mailman id 1194574;
 Wed, 31 Dec 2025 15:08:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vaxoE-00066C-Hi
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 15:08:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vaxoE-001Hk8-0c
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 15:08:22 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vaxoE-001CfW-1I
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 15:08:22 +0000
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-55e8c539b11so7654166e0c.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Dec 2025 07:08:22 -0800 (PST)
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
	From:MIME-Version; bh=U41R3gTQ0+/idXMOyzv5zTdUM6vSJ45ituaK+6Ib9xk=; b=c1qnG/L
	rucbbk+nxINawzWFKpuB3tDw9s1CU/JTAmGl8pJy19PG1HTB8I58n5vtpZtGRM8uZPSBorK4oi8Qw
	nX11JIZE9sw3B8BdttYqo3han0nIDRNGm2l4c6gQeuj0mPeGlwHIBeQc5iwgIpWUKJY9Ol1TqtEHZ
	5inPSa2RJQ=;
X-Gm-Message-State: AOJu0Yza9IMJ/P4C2gWne0JUxkHDOKQJrvf+VJMvLIHCynvgLlOxmZPP
	E5H7P6yc6X1W8cwk4i8ChnbrFBC2k+vxQu1eyPMayxzvLjgRcM5nskRKZRrlw9XORuBASPSwuKk
	ObyuvCBCxPHm7IuggYnRZeBJmCO11uQ4=
X-Google-Smtp-Source: AGHT+IFhqgcqYtqz08ex0f8BFZaWDkFWMRtXro1kMKM8yHap3hbLRxKViuFmmWSct+XWefHwGM4v4AhA/i39FauPWoI=
X-Received: by 2002:a05:6122:1781:b0:54b:bc2a:f58d with SMTP id
 71dfb90a1353d-5615bd19be1mr13653020e0c.3.1767193701945; Wed, 31 Dec 2025
 07:08:21 -0800 (PST)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 31 Dec 2025 16:08:09 +0100
X-Gmail-Original-Message-ID: <CAJbE=KwdDf9P-kec0zPbSQEvzARWT8LX_D=EGWGM_LPPtvyj=w@mail.gmail.com>
X-Gm-Features: AQt7F2rox-MyRHPGxhd4BJlJ-XH59UtFhRZObHT0p-uLaw_CLceQbS5qir2KAsY
Message-ID: <CAJbE=KwdDf9P-kec0zPbSQEvzARWT8LX_D=EGWGM_LPPtvyj=w@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for January 8 Xen Community Call @
 16:00 UTC
To: xen-devel@lists.xenproject.org, xen-announce@lists.xenprojet.org
Content-Type: multipart/alternative; boundary="000000000000da98c9064740d851"

--000000000000da98c9064740d851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for January's Xen Project Community Call on Thu=
rsday, 8
January 2026 at 16:00 UTC (4 pm UK time).

We=E2=80=99d love for you to join. Feel free to participate or just observe=
. This
call is a great opportunity to see what the community is working on, align
our various efforts, and share updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/Xq3h+gPoWoOOLtDIGebk+K8Q/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc. I attempted to clean up the doc, so fe=
el
   free to make any adjustments.



*Call Details:*

   - Date: Thursday, 8 January 2026
   - Time: 16:00 UTC (agenda begins at 16:05 UTC)
   - Find your local timezone here
   <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,2988507,5128581,26=
43743,100,1850147,6&h=3D2988507&date=3D2026-1-8&sln=3D17-18&hf=3Dundefined&=
c=3D1187>
   - Link to Join the Call: https://meet.jit.si/XenProjectCommunityCall


We plan to open the meeting room at 16:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 16:05 UTC.

Want to be CC=E2=80=99d on future calls?

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you Thursday! Happy new year!


Cody Zuschlag
Xen Project - Community Manager

--000000000000da98c9064740d851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,<br><br>We=E2=80=99re getting ready =
for January&#39;s Xen Project Community Call on Thursday, 8 January 2026 at=
 16:00 UTC (4 pm UK time).<br><br>We=E2=80=99d love for you to join. Feel f=
ree to participate or just observe. This call is a great opportunity to see=
 what the community is working on, align our various efforts, and share upd=
ates. Everyone is welcome!<br><br><b>Preparation:</b><br><ul><li style=3D"m=
argin-left:15px">Add any proposed agenda items or missing action items: <a =
href=3D"https://cryptpad.fr/pad/#/2/pad/edit/Xq3h+gPoWoOOLtDIGebk+K8Q/">htt=
ps://cryptpad.fr/pad/#/2/pad/edit/Xq3h+gPoWoOOLtDIGebk+K8Q/</a></li><li sty=
le=3D"margin-left:15px">If any action items have been resolved or are no lo=
nger relevant, feel free to remove them from the doc. I attempted to clean =
up the doc, so feel free to make any adjustments.</li></ul><br><b>Call Deta=
ils:<br></b><ul><li style=3D"margin-left:15px">Date: Thursday, 8 January 20=
26</li><li style=3D"margin-left:15px">Time: 16:00 UTC (agenda begins at 16:=
05 UTC)</li><li style=3D"margin-left:15px"><a href=3D"https://www.worldtime=
buddy.com/?qm=3D1&amp;lid=3D5368361,2988507,5128581,2643743,100,1850147,6&a=
mp;h=3D2988507&amp;date=3D2026-1-8&amp;sln=3D17-18&amp;hf=3Dundefined&amp;c=
=3D1187" target=3D"_blank">Find your local timezone here</a></li><li style=
=3D"margin-left:15px">Link to Join the Call:=C2=A0<a href=3D"https://meet.j=
it.si/XenProjectCommunityCall" target=3D"_blank">https://meet.jit.si/XenPro=
jectCommunityCall</a></li></ul><br></div><div>We plan to open the meeting r=
oom at 16:00 UTC, but to allow time for switching between meetings and hand=
ling any technical issues, we=E2=80=99ll officially start discussing the ag=
enda at 16:05 UTC.<br><br>Want to be CC=E2=80=99d on future calls?<br><br>A=
dd or remove yourself from our=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/=
pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" target=3D"_blank">Sign-up Sheet</a>.<br=
><br>See you Thursday! Happy new year!</div></div><div><br></div><div><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK=
4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJU=
rl12"><br><div>Cody Zuschlag</div><div>Xen Project - Community Manager</div=
></div></div></div></div>

--000000000000da98c9064740d851--

