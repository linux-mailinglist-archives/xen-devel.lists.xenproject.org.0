Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A116D0FB2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 22:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516859.801660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phyXS-0008T3-JF; Thu, 30 Mar 2023 20:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516859.801660; Thu, 30 Mar 2023 20:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phyXS-0008Pq-Fg; Thu, 30 Mar 2023 20:06:26 +0000
Received: by outflank-mailman (input) for mailman id 516859;
 Thu, 30 Mar 2023 20:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwyT=7W=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1phyXR-0008Pk-Ir
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 20:06:25 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 578e2cae-cf36-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 22:06:22 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id y15so26026784lfa.7
 for <xen-devel@lists.xenproject.org>; Thu, 30 Mar 2023 13:06:22 -0700 (PDT)
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
X-Inumbo-ID: 578e2cae-cf36-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1680206781;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rsJJ14tsq1+UEnl8Ks5LzGINrZ9GierHl/Yqb8GLeGc=;
        b=UEDXuxANp8x6uiTo4P3h2IHw9xXNrorNKBn0/u0fdXQAE5LIoxas1ddEcI1ZO8InJn
         uODAUYgnQBuOMyP5AEO6f4IZwamWjgqbYbig0gSRdDqfqg/n8Zo7EzxstmVCJGDEhNqT
         +Sw0eJZWgmLBVSankrg7CYcEtyPTeYJySwWw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680206781;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsJJ14tsq1+UEnl8Ks5LzGINrZ9GierHl/Yqb8GLeGc=;
        b=mnhre/bw/B4kTMDeaXaFDR9uEh3OWL26GdAs8Urj1DTfmMXiWcZejgXCLrdpw7IdHK
         UzJs5x/xO3364dxaW+7+GGvPreWLK8lZQ2K7z5QFN/TaRHMRUzmbD9t8fT6BdKzDyoLm
         srFr8+ydegtdPq+k1/vD29KM8mWoxnkTR/DzWErLYvPeSLbi/7yjAsFB2lwOL1pwleQN
         BffOoegzLi3vvyDgTX2Fj/dJ5nWLnA8IS6+LvaOMQcdN7LwKa/cbeYPw8X0MpN76gKXr
         uE7oPmx5XSBx37RB05XWhLmkWVeIxvvEwt38tqVkKUkhJnFwbo1meVxYY9YLRgIgrE9v
         w8yQ==
X-Gm-Message-State: AAQBX9efnUtCbx4XKW2ih6ubsVKJCPj31H4Mv60X5oyd0NRY79lRQuZD
	yTMXac/F/xn362SMwoN9rTWO7ubdX8K2ar8kmK7pi4/yAsrlY64/OlY=
X-Google-Smtp-Source: AKy350aT68eD6IOCr7L36865sD5MsvXTA0ykHxMOSfgVHMacu/E7EeoSLvTPuREKjKKH5hAHgNPAlLnv5vDw/Ugz/v4=
X-Received: by 2002:a05:6512:507:b0:4dd:cb1d:b3d3 with SMTP id
 o7-20020a056512050700b004ddcb1db3d3mr7313688lfb.1.1680206781508; Thu, 30 Mar
 2023 13:06:21 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 30 Mar 2023 21:06:10 +0100
Message-ID: <CA+zSX=YxdNQLj1b4uC_gskzsQ=dkRipf2LnD8Cm8x7MCZoVwpQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 13 April Community Call @ 1600 UTC
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
Content-Type: multipart/alternative; boundary="0000000000005c851505f823a0ef"

--0000000000005c851505f823a0ef
Content-Type: text/plain; charset="UTF-8"

Hi all,

NOTE THE DATE CHANGE: The call has been pushed back by a week to avoid any
clashes with Easter holidays.


The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/HtfnjfjUlr9KcUC-vP2RGLXe/ and you can
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
15:00 - 16:00 UTC
Further International meeting times:
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2020&month=4&day=2&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2021&month=04&day=8&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=4&day=13&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

--0000000000005c851505f823a0ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,<br></p><p>NOTE THE DATE CHANGE: The call has be=
en pushed back by a week to avoid any clashes with Easter holidays.</p><p><=
br>The proposed agenda is in <a href=3D"https://cryptpad.fr/pad/#/2/pad/edi=
t/HtfnjfjUlr9KcUC-vP2RGLXe/">https://cryptpad.fr/pad/#/2/pad/edit/HtfnjfjUl=
r9KcUC-vP2RGLXe/</a>=C2=A0and you can edit to add items.=C2=A0 Alternativel=
y, you can reply to this mail directly.<br></p><p>Agenda items appreciated =
a few days before the call: please put your name besides items if you edit =
the document.<br></p><p>Note the following administrative conventions for t=
he call:<br>* Unless, agreed in the previous meeting otherwise, the call is=
 on the 1st Thursday of each month at 1600 British Time (either GMT or BST)=
<br>* I usually send out a meeting reminder a few days before with a provis=
ional agenda<br></p><p>* To allow time to switch between meetings, we&#39;l=
l plan on starting the agenda at 16:05 sharp.=C2=A0 Aim to join by 16:03 if=
 possible to allocate time to sort out technical difficulties &amp;c</p><p>=
* If you want to be CC&#39;ed please add or remove yourself from the sign-u=
p-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxA=
Oe6RFPz0sRCf+/">https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRC=
f+/</a><br></p><p>Best Regards<br>George<br></p><p><br></p><p>=3D=3D Dial-i=
n Information =3D=3D<br>## Meeting time<br>15:00 - 16:00 UTC<br>Further Int=
ernational meeting times:=C2=A0<a href=3D"https://www.timeanddate.com/world=
clock/meetingdetails.html?year=3D2020&amp;month=3D4&amp;day=3D2&amp;hour=3D=
15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D=
179"></a><a href=3D"https://www.timeanddate.com/worldclock/meetingdetails.h=
tml?year=3D2021&amp;month=3D04&amp;day=3D8&amp;hour=3D15&amp;min=3D0&amp;se=
c=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"h=
ttps://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2023&amp;m=
onth=3D4&amp;day=3D13&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&a=
mp;p2=3D37&amp;p3=3D224&amp;p4=3D179">https://www.timeanddate.com/worldcloc=
k/meetingdetails.html?year=3D2023&amp;month=3D4&amp;day=3D13&amp;hour=3D15&=
amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179=
</a><br></p><p><br>## Dial in details<br>Web:=C2=A0<a href=3D"https://meet.=
jit.si/XenProjectCommunityCall">https://meet.jit.si/XenProjectCommunityCall=
</a><br></p><p>Dial-in info and pin can be found here:<br></p><p><a href=3D=
"https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall"=
>https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall<=
/a></p></div>

--0000000000005c851505f823a0ef--

