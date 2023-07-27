Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5777655F3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571134.894245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1yh-0003kU-Ey; Thu, 27 Jul 2023 14:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571134.894245; Thu, 27 Jul 2023 14:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1yh-0003iV-Bw; Thu, 27 Jul 2023 14:28:31 +0000
Received: by outflank-mailman (input) for mailman id 571134;
 Thu, 27 Jul 2023 14:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8wl5=DN=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qP1yf-0003iP-Py
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:28:29 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da14dbbd-2c89-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 16:28:27 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso1877212e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 07:28:27 -0700 (PDT)
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
X-Inumbo-ID: da14dbbd-2c89-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690468107; x=1691072907;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s9ahMakn0xR+k1w0lDlVVqaf5hQgGYAB74KigutUxbI=;
        b=W+ZT/L/9o5MRISlsC5IbwVJAIUOREjLdvz44100YymjDCz/SEAKK9xCreGeF74ZEw3
         Nys9pu/MqZd5hHjaOIDOSUAmOZLiJSpjDHXQkdaJc1puAcXnL89ZDr3FarLgFr7QD5Nl
         I/jdCpiuWojhdOdVcvlL2TD/mLFNMoNte/7Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468107; x=1691072907;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9ahMakn0xR+k1w0lDlVVqaf5hQgGYAB74KigutUxbI=;
        b=EnJ/rmvaNTGP7JjiStPtk+fSyhh7nhnlaYR+i/hX3zwUbi6cjeZsnpwFBDkStffnrY
         Qddh0qXTy/TNiLFwfjiqgWTVGUiyszCjlea1WUEFVpjn9pwM0PBlAcujTCqbcPXENzPH
         f57erTunijtoXf+HlbEhiMB0gGexfk6vYEj70ahukVFW6e78zep2fHqEbbrMz2QqwrY5
         ZT6YzFfxZTKT7eTi9XTwD5/uMaLFjp/XqkEOrfEd+UeFFeP4HYbPvUKBPvgYu0RoA1hL
         zbep3t7qTZfFG8aPG/6xlg12LkBDIgdT+zQ6LUuG0Hk7wy49pevEq5Z8VJqIBsizIIg1
         QoEA==
X-Gm-Message-State: ABy/qLbhLDRAPedYlEQqrOO3gvq0IOHGj8dTJONZD98+VcTwtm+Gsewa
	zmbOOSm46dzwt6ct4y1JTiFzkZT+hd7HSy5SN02Bs7OmzoVxBNHKNBsBzg/L
X-Google-Smtp-Source: APBJJlErGuhybN8B7FVWJr3J2pEJo6EQU8WgVQNMM6mpeyk4pELcjF0x22Pb8TEJKP84kpHq6Uw9obRnCSNUn+y9KJY=
X-Received: by 2002:ac2:465c:0:b0:4fb:8492:83fb with SMTP id
 s28-20020ac2465c000000b004fb849283fbmr1759692lfo.68.1690468106795; Thu, 27
 Jul 2023 07:28:26 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 27 Jul 2023 15:28:15 +0100
Message-ID: <CA+zSX=ZmedcCdDi1xNjhxW-TCiuswm5+=Gd72hvEQGet5coTrA@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for 3 August Community Call @ 1500 UTC
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
	Brendan Kerrigan <brendank310@gmail.com>, Thierry Laurion <insurgo@riseup.net>, 
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
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Vikram Garhwal <vikram.garhwal@amd.com>, Kelly Choi <kelly.choi@cloud.com>
Content-Type: multipart/alternative; boundary="0000000000000291ff060178c72f"

--0000000000000291ff060178c72f
Content-Type: text/plain; charset="UTF-8"

Hi all,

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/Rk5kDLwcc7CrqFm6O7xq2Jci/ and you can
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
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=8&day=3&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

--0000000000000291ff060178c72f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,</p><p>The proposed agenda is in <a href=3D"http=
s://cryptpad.fr/pad/#/2/pad/edit/Rk5kDLwcc7CrqFm6O7xq2Jci/">https://cryptpa=
d.fr/pad/#/2/pad/edit/Rk5kDLwcc7CrqFm6O7xq2Jci/</a>=C2=A0and you can edit t=
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
6:00 - 17:00 British time<br>Further International meeting times:=C2=A0<a h=
ref=3D"https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D20=
20&amp;month=3D4&amp;day=3D2&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=
=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"https://www.t=
imeanddate.com/worldclock/meetingdetails.html?year=3D2021&amp;month=3D04&am=
p;day=3D8&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&a=
mp;p3=3D224&amp;p4=3D179"></a><a href=3D"https://www.timeanddate.com/worldc=
lock/meetingdetails.html?year=3D2023&amp;month=3D8&amp;day=3D3&amp;hour=3D1=
5&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D1=
79">https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2023&=
amp;month=3D8&amp;day=3D3&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D12=
34&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a><br></p><p><br>## Dial in detai=
ls<br>Web:=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityCall">htt=
ps://meet.jit.si/XenProjectCommunityCall</a><br></p><p>Dial-in info and pin=
 can be found here:<br></p><p><a href=3D"https://meet.jit.si/static/dialInI=
nfo.html?room=3DXenProjectCommunityCall">https://meet.jit.si/static/dialInI=
nfo.html?room=3DXenProjectCommunityCall</a></p></div>

--0000000000000291ff060178c72f--

