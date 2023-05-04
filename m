Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF26F69B7
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 13:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529694.824373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puX07-0005PQ-96; Thu, 04 May 2023 11:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529694.824373; Thu, 04 May 2023 11:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puX07-0005MU-5Q; Thu, 04 May 2023 11:19:55 +0000
Received: by outflank-mailman (input) for mailman id 529694;
 Thu, 04 May 2023 11:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQRW=AZ=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1puX06-0005MO-5z
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 11:19:54 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96bb6b96-ea6d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 13:19:52 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so4275701fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 May 2023 04:19:52 -0700 (PDT)
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
X-Inumbo-ID: 96bb6b96-ea6d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683199191; x=1685791191;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dRu1hub18XXS79LypLt9yhwEdFG+s3JAgEck87ztnn4=;
        b=CD2xOqKJiY64uIDLEvUdH4nrCMj1/SaotQ5Vtl3OKvSDwx8OTFxkrTBN9fAxA7HIQJ
         kwVVL3ei/6R1l7gu35MAkAglzO9aapDx6qV63dAnkB2SFHjb0POAFkirRwEJTW6ZkFgY
         pk6MJt5AQATyZvFrEnLwcdG9tHP67E/3oiWME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199191; x=1685791191;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dRu1hub18XXS79LypLt9yhwEdFG+s3JAgEck87ztnn4=;
        b=ltl2uhFlKERTRXZ/TJIu5esU+qinsbekhb0Fd8kQCxYb4mbuQ1/FazCckcqaMZqmDJ
         SVsjtD1Yzsliw2ghwAw4L06BwhiSzsHV4tzWpIH9Pwu4+B004UnpA9JyYbutlrc9tWwr
         CpoS9Oq8hjhFwxPxq/jerVwNEy6uXDpioqXIuG5mDpqAzmD4+ggwZicbyxbz2oxpwPrz
         wvlPruHAo4uphk13/r/RArEe+MZui17O/l5kVY3xzL3gU+eDPilipCiKMskp2ip7AZWx
         O36lZjzuH6PNY/i37gBNZHJSjUwaCprimLNzgvasl0x0wMX6ZO+coXza9axZYTR4pDmp
         r5uw==
X-Gm-Message-State: AC+VfDzOwvlbW+iiEbV6aJmJmkKSLf/i1tkqeKXK62YiayKlVRKkm6qO
	rpMt1np1/4rLquLhn5NML+j5lHk0NvmY/mFedCruww54N7oy8+cZpXg=
X-Google-Smtp-Source: ACHHUZ6rTR2qCy3sC0UC0jWppc45/LPmq3Oxk/pFN456EGX+D5pJJvnm0C5WyrxNeliUHm/f70ZVRtVb7sBA3YSErQg=
X-Received: by 2002:a2e:8693:0:b0:2a9:f9d2:7b44 with SMTP id
 l19-20020a2e8693000000b002a9f9d27b44mr862210lji.40.1683199191120; Thu, 04 May
 2023 04:19:51 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 4 May 2023 12:19:39 +0100
Message-ID: <CA+zSX=a5jDtELctshP_V=d+PXaOo6zy6YO2LngeraSeQv6dOwQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 4 May Community Call @ 1500 UTC
To: Xen-devel <xen-devel@lists.xenproject.org>, 
	Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>, 
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	Sergey Dyasli <sergey.dyasli@citrix.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, 
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <pdurrant@amazon.com>, "Ji, John" <john.ji@intel.com>, 
	"edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, 
	"robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, 
	Matt Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?= <cardoe@cardoe.com>, 
	George Dunlap <george.dunlap@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?= <varadgautam@gmail.com>, 
	Brian Woods <brian.woods@xilinx.com>, Robert Townley <rob.townley@gmail.com>, 
	Bobby Eshleman <bobby.eshleman@gmail.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?= <cminyard@mvista.com>, 
	Olivier Lambert <olivier.lambert@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ash Wilding <ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
	Brendan Kerrigan <brendank310@gmail.com>, insurgo@riseup.net, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Scott Davis <scottwd@gmail.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>, 
	Marc Ungeschikts <marc.ungeschikts@vates.fr>, Zhiming Shen <zshen@exotanium.io>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>, 
	Per Bilse <per.bilse@citrix.com>, Samuel Verschelde <stormi-xcp@ylix.fr>, 
	Andrei Semenov <andrei.semenov@vates.fr>, Yann Dirson <yann.dirson@vates.fr>, 
	Bernhard Kaindl <bernhard.kaindl@cloud.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLTHVjYSBGYW5jZWxsdQ==?= <luca.fancellu@arm.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="000000000000df92ab05fadc590f"

--000000000000df92ab05fadc590f
Content-Type: text/plain; charset="UTF-8"

Hi all,


The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/7Vv6erX9dwCazMfCZ4Hbnf8b/ and you can
edit to add items.  Alternatively, you can reply to this mail directly.

Agenda items appreciated a few days before the call: please put your name
besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the previous meeting otherwise, the call is on the 1st
Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate time
to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George


== Dial-in Information ==
## Meeting time
16:00 - 17:00 British time
Further International meeting times:
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2020&month=4&day=2&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2021&month=04&day=8&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=5&day=4&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

--000000000000df92ab05fadc590f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,<br></p><p><br>The proposed agenda is in <a href=
=3D"https://cryptpad.fr/pad/#/2/pad/edit/7Vv6erX9dwCazMfCZ4Hbnf8b/">https:/=
/cryptpad.fr/pad/#/2/pad/edit/7Vv6erX9dwCazMfCZ4Hbnf8b/</a>=C2=A0and you ca=
n edit to add items.=C2=A0 Alternatively, you can reply to this mail direct=
ly.<br></p><p>Agenda items appreciated a few days before the call: please p=
ut your name besides items if you edit the document.<br></p><p>Note the fol=
lowing administrative conventions for the call:<br>* Unless, agreed in the =
previous meeting otherwise, the call is on the 1st Thursday of each month a=
t 1600 British Time (either GMT or BST)<br>* I usually send out a meeting r=
eminder a few days before with a provisional agenda<br></p><p>* To allow ti=
me to switch between meetings, we&#39;ll plan on starting the agenda at 16:=
05 sharp.=C2=A0 Aim to join by 16:03 if possible to allocate time to sort o=
ut technical difficulties &amp;c</p><p>* If you want to be CC&#39;ed please=
 add or remove yourself from the sign-up-sheet at=C2=A0<a href=3D"https://c=
ryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">https://cryptpad.fr/=
pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br></p><p>Best Regards<br>Ge=
orge<br></p><p><br></p><p>=3D=3D Dial-in Information =3D=3D<br>## Meeting t=
ime<br>16:00 - 17:00 British time<br>Further International meeting times:=
=C2=A0<a href=3D"https://www.timeanddate.com/worldclock/meetingdetails.html=
?year=3D2020&amp;month=3D4&amp;day=3D2&amp;hour=3D15&amp;min=3D0&amp;sec=3D=
0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"https=
://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2021&amp;month=
=3D04&amp;day=3D8&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p=
2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"https://www.timeanddate.co=
m/worldclock/meetingdetails.html?year=3D2023&amp;month=3D5&amp;day=3D4&amp;=
hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&am=
p;p4=3D179">https://www.timeanddate.com/worldclock/meetingdetails.html?year=
=3D2023&amp;month=3D5&amp;day=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp=
;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a><br></p><p><br>## Dial =
in details<br>Web:=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityC=
all">https://meet.jit.si/XenProjectCommunityCall</a><br></p><p>Dial-in info=
 and pin can be found here:<br></p><p><a href=3D"https://meet.jit.si/static=
/dialInInfo.html?room=3DXenProjectCommunityCall">https://meet.jit.si/static=
/dialInInfo.html?room=3DXenProjectCommunityCall</a></p></div>

--000000000000df92ab05fadc590f--

