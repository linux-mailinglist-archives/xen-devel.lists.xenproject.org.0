Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB20718568
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 16:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541859.845062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4NFv-0007YW-QZ; Wed, 31 May 2023 14:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541859.845062; Wed, 31 May 2023 14:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4NFv-0007VX-NG; Wed, 31 May 2023 14:56:55 +0000
Received: by outflank-mailman (input) for mailman id 541859;
 Wed, 31 May 2023 14:56:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wPyO=BU=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1q4NFu-0007VR-2v
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 14:56:54 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60be9bd9-ffc3-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 16:56:52 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af2d092d7aso64140131fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 07:56:52 -0700 (PDT)
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
X-Inumbo-ID: 60be9bd9-ffc3-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685545012; x=1688137012;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=POFEumE0VQ1zyBVsKvGoI13EBzkAX3ZgfTRWEw89yEI=;
        b=iKNI1pNxcu4qdAXBymnj4nI24pNf1JRAAeExZ6wXhLfClJhU21trw6ss+ZZQkLojwA
         vRNho8ZXK7Li20CQlFCO3zjt8UNQ99qjGNYF4TEGLkY3i/7ahC3tvBOrgcz+OL3gjycT
         GrrkoaAi5ADK1/lxceXMi4peyr2gWChwj7QqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545012; x=1688137012;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POFEumE0VQ1zyBVsKvGoI13EBzkAX3ZgfTRWEw89yEI=;
        b=c+wV6FGbPBGEsXoJmaCGQY1bw9nbJ6hWXbgoJ7UuvwxqMWsIbjjfh4rp3sNO9RJ71d
         fyV2SH9zFfG8q9xKqINJl6ZyLxgi2vOnFEvk0t9mSuYptf+DoK38W1h2py6Ru7tf1JLK
         uQPd1X0ZPeFFfokVt5Ta1lyIyr7VHT+AKRkXT38lpevZOQq1hynAExeb6w2+bu6FR644
         zHYv0R1OE9Z1iSLzpFUufE3sbZeBn9kLb+jJ9nXnBFISf9hlRX3zWebMJGV3JrAtJW0f
         9Ke5sl6wulRkDOeLEIOT5Fz0h2cVhVNdRInq6b4CPt95DXFGYY8HKmVzFEwADAbxEPbG
         kROw==
X-Gm-Message-State: AC+VfDzqjHpnxP9R9SbzybSW+qL2XJ+1a7K+JRrfvVlE1sVp3PF02sKk
	D5khVF51Km6dh5gURxMMlE3JT0Qt93Jx4oXzXBvV76W/eWPkNePNPU4=
X-Google-Smtp-Source: ACHHUZ5CrQbwENypz44WtPVIBycoZHiTOgCc2xGLsiG1PNGa0wrroloOk6ypQf8qDYwuFU17RcIr712Hw6WqRr+11k4=
X-Received: by 2002:a2e:9c92:0:b0:2af:2d77:9be1 with SMTP id
 x18-20020a2e9c92000000b002af2d779be1mr2719522lji.6.1685545011813; Wed, 31 May
 2023 07:56:51 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 31 May 2023 15:56:41 +0100
Message-ID: <CA+zSX=Z==wy0_zD61q5+OACLA+UToB5K83UGqU003-t97rhW_A@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 1 June Community Call @ 1500 UTC
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
Content-Type: multipart/alternative; boundary="000000000000aeb0a905fcfe8780"

--000000000000aeb0a905fcfe8780
Content-Type: text/plain; charset="UTF-8"

Hi all,

Sorry for the late notice on this -- somehow my reminder didn't trigger.  I
believe we had discussed at the last call to hold this meeting, and skip
the one in July.


The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/eddrScu3DyYdHZ6f0ReVGazZ/ and you can
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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=6&day=1&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

--000000000000aeb0a905fcfe8780
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,<br></p><p>Sorry for the late notice on this -- =
somehow my reminder didn&#39;t trigger.=C2=A0 I believe we had discussed at=
 the last call to hold this meeting, and skip the one in July.</p><p><br>Th=
e proposed agenda is in <a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/edd=
rScu3DyYdHZ6f0ReVGazZ/">https://cryptpad.fr/pad/#/2/pad/edit/eddrScu3DyYdHZ=
6f0ReVGazZ/</a>=C2=A0and you can edit to add items.=C2=A0 Alternatively, yo=
u can reply to this mail directly.<br></p><p>Agenda items appreciated a few=
 days before the call: please put your name besides items if you edit the d=
ocument.<br></p><p>Note the following administrative conventions for the ca=
ll:<br>* Unless, agreed in the previous meeting otherwise, the call is on t=
he 1st Thursday of each month at 1600 British Time (either GMT or BST)<br>*=
 I usually send out a meeting reminder a few days before with a provisional=
 agenda<br></p><p>* To allow time to switch between meetings, we&#39;ll pla=
n on starting the agenda at 16:05 sharp.=C2=A0 Aim to join by 16:03 if poss=
ible to allocate time to sort out technical difficulties &amp;c</p><p>* If =
you want to be CC&#39;ed please add or remove yourself from the sign-up-she=
et at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RF=
Pz0sRCf+/">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</=
a><br></p><p>Best Regards<br>George<br></p><p><br></p><p>=3D=3D Dial-in Inf=
ormation =3D=3D<br>## Meeting time<br>16:00 - 17:00 British time<br>Further=
 International meeting times:=C2=A0<a href=3D"https://www.timeanddate.com/w=
orldclock/meetingdetails.html?year=3D2020&amp;month=3D4&amp;day=3D2&amp;hou=
r=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p=
4=3D179"></a><a href=3D"https://www.timeanddate.com/worldclock/meetingdetai=
ls.html?year=3D2021&amp;month=3D04&amp;day=3D8&amp;hour=3D15&amp;min=3D0&am=
p;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=
=3D"https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2023&=
amp;month=3D6&amp;day=3D1&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D12=
34&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179">https://www.timeanddate.com/world=
clock/meetingdetails.html?year=3D2023&amp;month=3D6&amp;day=3D1&amp;hour=3D=
15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D=
179</a><br></p><p><br>## Dial in details<br>Web:=C2=A0<a href=3D"https://me=
et.jit.si/XenProjectCommunityCall">https://meet.jit.si/XenProjectCommunityC=
all</a><br></p><p>Dial-in info and pin can be found here:<br></p><p><a href=
=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCa=
ll">https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCa=
ll</a></p></div>

--000000000000aeb0a905fcfe8780--

