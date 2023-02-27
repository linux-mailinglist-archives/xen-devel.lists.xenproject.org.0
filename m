Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1162F6A4D78
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 22:43:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502935.774984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWlGB-0000Wc-E3; Mon, 27 Feb 2023 21:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502935.774984; Mon, 27 Feb 2023 21:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWlGB-0000UC-Aj; Mon, 27 Feb 2023 21:42:15 +0000
Received: by outflank-mailman (input) for mailman id 502935;
 Mon, 27 Feb 2023 21:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q5sH=6X=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pWlGA-0000U6-1b
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 21:42:14 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97cc0427-b6e7-11ed-9684-2f268f93b82a;
 Mon, 27 Feb 2023 22:42:13 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id f41so10418352lfv.13
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 13:42:11 -0800 (PST)
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
X-Inumbo-ID: 97cc0427-b6e7-11ed-9684-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZF1KE9+P2rqU4dEjFWUCi5yBy445vBS0PStIV3/w0No=;
        b=R//sTUGol+MFuvT+rSqrAIt4DmcX7QqFKKREm7PQrvwIiI1iY+Wqa4bH7SJwDK/lA4
         x86Osq0G6eb6/cYHpDo1Gvb8c4LcS1un4gmWFBc7sDZT+eMP+0+bnonWLfHkoa0GwmEl
         VwUCJJhUFNU3gkEc2/6FBWlnsRA7hW4h/HmFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZF1KE9+P2rqU4dEjFWUCi5yBy445vBS0PStIV3/w0No=;
        b=cPjCPvzaJHC13eaoumzXwibiExvbugLIKE32tVtpA39iuFBhapCZAFDHh5hwkW7JYr
         qdoCYN9Fkl720q2ROTeIvlhCh6ouYKjm6p0KK5DJOQC09we4O4Oi3AzRR0q7imZTczLr
         05FVzUu4FFJaGwESnD6Z4uzLM8bWhOR5dPfDhNWjvr+9EMDUht5l2uC0f+A1cFcm/76s
         fG/U8Ull74j5xd7xq/x3AIV3n2Mos6Xs5nUVfGC09lXohqNu0uPNMwV4zFAiya35vFrt
         4BErdTHaihiwSf30Rjz0HGEXWbdLtrgkBaaTMhVY/NlszqpLCaTjRaNGWU47+fpxm7Vk
         tcxw==
X-Gm-Message-State: AO0yUKW6UmRdq+iMaLixkGmJd/6AIiVWojkdlVvuluDwD2/DVfBZ2w20
	gFDRl+wj3YtJLG+03S2E91vAV0f/uryP++0TTQN4FF4wM2iyY7cA
X-Google-Smtp-Source: AK7set9WtBYIPkxDDvsjd7UN0sBDMX7f6gOYY7RgTWrG+htcP9j4IHCJrt2WiJ1gK3kjrzv88N0aGrXoSldc3YMm3QQ=
X-Received: by 2002:ac2:51ba:0:b0:4d5:ca32:68a3 with SMTP id
 f26-20020ac251ba000000b004d5ca3268a3mr11997lfk.8.1677534130921; Mon, 27 Feb
 2023 13:42:10 -0800 (PST)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 27 Feb 2023 21:41:59 +0000
Message-ID: <CA+zSX=bwfZnssbjB=4=_r+a=w-=8i7+i8yZ5bgOrjAox0PR7pQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 3 March Community Call @ 1600 UTC
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
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLTHVjYSBGYW5jZWxsdQ==?= <luca.fancellu@arm.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="000000000000f8fb3705f5b559e4"

--000000000000f8fb3705f5b559e4
Content-Type: text/plain; charset="UTF-8"

Hi all,

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/6pAe-+J05tY4OGg2sOobRrhO/ and you can
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
16:00 - 17:00 UTC
Further International meeting times:
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2020&month=4&day=2&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2021&month=04&day=8&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=3&day=2&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

--000000000000f8fb3705f5b559e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,</p><p>The proposed agenda is in <a href=3D"http=
s://cryptpad.fr/pad/#/2/pad/edit/6pAe-+J05tY4OGg2sOobRrhO/">https://cryptpa=
d.fr/pad/#/2/pad/edit/6pAe-+J05tY4OGg2sOobRrhO/</a>=C2=A0and you can edit t=
o add items.=C2=A0 Alternatively, you can reply to this mail directly.<br><=
/p><p>Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.<br></p><p>Note the following a=
dministrative conventions for the call:<br>* Unless, agreed in the previous=
 meeting otherwise, the call is on the 1st Thursday of each month at 1600 B=
ritish Time (either GMT or BST)<br>* I usually send out a meeting reminder =
a few days before with a provisional agenda<br></p><p>* To allow time to sw=
itch between meetings, we&#39;ll plan on starting the agenda at 16:05 sharp=
.=C2=A0 Aim to join by 16:03 if possible to allocate time to sort out techn=
ical difficulties &amp;c</p><p>* If you want to be CC&#39;ed please add or =
remove yourself from the sign-up-sheet at=C2=A0<a href=3D"https://cryptpad.=
fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">https://cryptpad.fr/pad/#/2/=
pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br></p><p>Best Regards<br>George<br>=
</p><p><br></p><p>=3D=3D Dial-in Information =3D=3D<br>## Meeting time<br>1=
6:00 - 17:00 UTC<br>Further International meeting times:=C2=A0<a href=3D"ht=
tps://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2020&amp;mo=
nth=3D4&amp;day=3D2&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp=
;p2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"https://www.timeanddate.=
com/worldclock/meetingdetails.html?year=3D2021&amp;month=3D04&amp;day=3D8&a=
mp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224=
&amp;p4=3D179"></a><a href=3D"https://www.timeanddate.com/worldclock/meetin=
gdetails.html?year=3D2023&amp;month=3D3&amp;day=3D2&amp;hour=3D16&amp;min=
=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179">https=
://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2023&amp;month=
=3D3&amp;day=3D2&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=
=3D37&amp;p3=3D224&amp;p4=3D179</a><br></p><p><br>## Dial in details<br>Web=
:=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityCall">https://meet=
.jit.si/XenProjectCommunityCall</a><br></p><p>Dial-in info and pin can be f=
ound here:<br></p><p><a href=3D"https://meet.jit.si/static/dialInInfo.html?=
room=3DXenProjectCommunityCall">https://meet.jit.si/static/dialInInfo.html?=
room=3DXenProjectCommunityCall</a></p></div>

--000000000000f8fb3705f5b559e4--

