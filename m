Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F43A76712
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932498.1334617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFSS-00034r-LI; Mon, 31 Mar 2025 13:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932498.1334617; Mon, 31 Mar 2025 13:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFSS-00033F-HQ; Mon, 31 Mar 2025 13:45:44 +0000
Received: by outflank-mailman (input) for mailman id 932498;
 Mon, 31 Mar 2025 13:43:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1tzFQO-0002X9-75
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:43:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1tzFQO-002NFa-08
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:43:36 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1tzFQN-00CBu0-38
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:43:35 +0000
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3f8ae3ed8f4so2673063b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 06:43:35 -0700 (PDT)
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
	From:MIME-Version; bh=U6qntZH4mdHrvVfd8V5RWLnYFbv2gICkmPcx9GEkEmw=; b=tO/4iuf
	ztX/Y13jP1QXtyUgm3VLe8b/Fw45vTmlnjxX6HbQ91RHxRIxXb5tD40gMzoeLivtRoiWQA65wgm0t
	UY8dsyVzdmK8l2Rug3lT5B4Kba3Y9/NhcJaICzr4IhWhW15fZtYWVtnTDM/wRHxvmiljiPGD0Tlue
	G1+TVCy6WA=;
X-Gm-Message-State: AOJu0Yy9bhTYJuxlM8d6kaSpW9KTK2VnGEIvQ278ih39lvioLnhPUF1j
	CYP2nG0iWlNjmRP5J0kGjQxtOmQFGjqWysB8exaHq/HGAY1QrRa1MQDAlRehbDGAhbbGQSq2WLk
	4uNVemQm9jycztH76s2mQf4ufxls=
X-Google-Smtp-Source: AGHT+IH6Wpb3qaMS6HGNZV5xTMlMMBwBymRW3fZuo7k+z+cDIsS7fzhnMYuLLgSC5jP/TbRF/FfDK2zHh8fKzDqjVNQ=
X-Received: by 2002:a05:6808:2f07:b0:3fb:85cc:9f27 with SMTP id
 5614622812f47-3ff0f3f2fb9mr4901549b6e.0.1743428615435; Mon, 31 Mar 2025
 06:43:35 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Mon, 31 Mar 2025 15:43:24 +0200
X-Gmail-Original-Message-ID: <CAJbE=KxbXVUOCHr36wbkyYH9aN2ip_6A2OtpqDR13kLA8ejrBA@mail.gmail.com>
X-Gm-Features: AQ5f1JrjQTIDYY9m5DLL8xM_Xgybf0fJ-hSUGO92jDtdOAt7g08WWoyVVQ_d3GM
Message-ID: <CAJbE=KxbXVUOCHr36wbkyYH9aN2ip_6A2OtpqDR13kLA8ejrBA@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for April 3, 2025 Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000005083860631a39bec"

--0000000000005083860631a39bec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for April=E2=80=99s Xen Project Community Call =
on *Thursday, 3
April 2025* at *15:00 UTC* (4 pm UK time). We=E2=80=99d love for you to joi=
n. Feel
free to just observe or jump in! This call is a great opportunity to see
what the community is working on, align our various efforts, and share
updates. Everyone is welcome!


*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/Hy5rqmmTsf+7LKDN2X9vbmIH/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc.


*Call Details:*

   - *Date:* Thursday, 3 April 2025
   - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
      - Find your local timezone here
      <https://www.worldtimebuddy.com/?qm=3D1&lid=3D100,2653941,2988507,536=
8361,5128581&h=3D2988507&date=3D2025-4-3&sln=3D17-17.5&hf=3D0&c=3D1067>
   - *Link to Join the Call:* https://meet.jit.si/XenProjectCommunityCall


We plan to open the meeting room at 15:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 15:05 UTC.


*Want to be CC=E2=80=99d on future calls?*

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.




See you Thursday!


Cody Zuschlag
Xen Project - Community Manager

--0000000000005083860631a39bec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div>





<p class=3D"gmail-p1">We=E2=80=99re getting ready for April=E2=80=99s Xen P=
roject Community Call on <span class=3D"gmail-s1"><b>Thursday, 3 April 2025=
</b></span> at <span class=3D"gmail-s1"><b>15:00 UTC</b></span> (4 pm UK ti=
me). We=E2=80=99d love for you to join. Feel free to just observe or jump i=
n! This call is a great opportunity to see what the community is working on=
, align our various efforts, and share updates. Everyone is welcome!</p><p =
class=3D"gmail-p1"><br></p></div><div><b>Preparation:</b></div><div><ul><li=
>Add any proposed agenda items or missing action items:=C2=A0<a href=3D"htt=
ps://cryptpad.fr/pad/#/2/pad/edit/Hy5rqmmTsf+7LKDN2X9vbmIH/">https://cryptp=
ad.fr/pad/#/2/pad/edit/Hy5rqmmTsf+7LKDN2X9vbmIH/</a></li><li>If any action =
items have been resolved or are no longer relevant, feel free to remove the=
m from the doc.=C2=A0</li></ul></div><div><b><br></b></div><div><b>Call Det=
ails:</b></div><div><ul><li><b>Date:</b> Thursday, 3 April 2025</li><li><b>=
Time:</b> 15:00 UTC (agenda begins at 15:05 UTC)</li><ul><li><a href=3D"htt=
ps://www.worldtimebuddy.com/?qm=3D1&amp;lid=3D100,2653941,2988507,5368361,5=
128581&amp;h=3D2988507&amp;date=3D2025-4-3&amp;sln=3D17-17.5&amp;hf=3D0&amp=
;c=3D1067">Find your local timezone here</a></li></ul><li><b>Link to Join t=
he Call:</b>=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityCall">h=
ttps://meet.jit.si/XenProjectCommunityCall</a></li></ul></div><div>





<p class=3D"gmail-p1"><br></p><p class=3D"gmail-p1">We plan to open the mee=
ting room at 15:00 UTC, but to allow time for switching between meetings an=
d handling any technical issues, we=E2=80=99ll officially start discussing =
the agenda at 15:05 UTC.</p>
<p class=3D"gmail-p3"><b><br></b></p><p class=3D"gmail-p3"><b>Want to be CC=
=E2=80=99d on future calls?</b><b></b></p>
<p class=3D"gmail-p1">Add or remove yourself from our <a href=3D"https://cr=
yptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">Sign-up Sheet</a>.</p=
><p class=3D"gmail-p1"><br></p><ul></ul><div>See you Thursday!</div><br></d=
iv><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/m=
ail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZV=
E2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen Project - Community=
 Manager</div></div></div></div></div>

--0000000000005083860631a39bec--

