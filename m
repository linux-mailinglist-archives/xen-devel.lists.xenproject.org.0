Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6FAACCB8B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 18:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004711.1384431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUww-0006gu-BO; Tue, 03 Jun 2025 16:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004711.1384431; Tue, 03 Jun 2025 16:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUww-0006fT-7k; Tue, 03 Jun 2025 16:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1004711;
 Tue, 03 Jun 2025 16:57:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uMUwu-0006fN-T3
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:57:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uMUwu-000IA1-2I
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:57:16 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uMUwv-006uhk-0P
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:57:16 +0000
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6fac7147cb8so114856576d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 09:57:16 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version; bh=CEUWcAPHJA+IQYGOvV9m8IfwmlUWjF70Ql7nnAbQf0w=; b=v/
	+saA6HeXyHvfVJmQteLxtwmOpbHnBYpnQKm77q198hI5b8cxxFvRG07zmMFfYOiYnN2KUNKpxnhk0
	69ZqaWCrpTO6gCdO69dXHiszErIear0eJ1dtobjRQpOFzFQHJi+A40N1Lyug5kQ+bF119MB4wdb9X
	os/EUcLhb+0lNEQ=;
X-Gm-Message-State: AOJu0YwcBFLUxxSKl2xxfQRcGoHxxb9MiVR03I6RyJqB4Dls7/Jp5HpH
	XYod+XC7cztmxQbYnWKYyG49W8nUVcySwU50yjpjwROgPJVwFhwtoyjCZXwyueMLrSZdG3zBek4
	/IPDlMmJASNbDg/rfttOKx6N4uDRq8AE=
X-Google-Smtp-Source: AGHT+IGSX6uDlTtgDrRafX/bWlwCVPuNp6YD+HwCBaQRnJC3GuBB7jRR43xlUPaGjiEuPWADtrgY8EWvbJMBDiHTZJg=
X-Received: by 2002:a05:6122:3d0e:b0:52b:789:2d0 with SMTP id
 71dfb90a1353d-53084bdfd0cmr13570949e0c.5.1748969392025; Tue, 03 Jun 2025
 09:49:52 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Tue, 3 Jun 2025 18:49:41 +0200
X-Gmail-Original-Message-ID: <CAJbE=Kx33Nr2sMmm+V=2+7vBxfz9Pi12S-puXH+Euyyc9tsLYA@mail.gmail.com>
X-Gm-Features: AX0GCFsiuy6-heKlYCkOYatbbEjzocmXTcQYvkmlrVRkMpMec5fGUh0dg05g4RM
Message-ID: <CAJbE=Kx33Nr2sMmm+V=2+7vBxfz9Pi12S-puXH+Euyyc9tsLYA@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for June 5, 2025 Xen Community Call
 @ 15:00 UTC
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>, 
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, 
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <pdurrant@amazon.com>, Ji John <john.ji@intel.com>, 
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
	Brendan Kerrigan <brendank310@gmail.com>, Thierry Laurion <thierry.laurion@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Scott Davis <scottwd@gmail.com>, 
	Anthony PERARD <anthony@xenproject.org>, Michal Orzel <michal.orzel@amd.com>, 
	Marc Ungeschikts <marc.ungeschikts@vates.fr>, Zhiming Shen <zshen@exotanium.io>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>, 
	Samuel Verschelde <stormi-xcp@ylix.fr>, Andrei Semenov <andrei.semenov@vates.fr>, 
	Yann Dirson <yann.dirson@vates.fr>, Bernhard Kaindl <bernhard.kaindl@cloud.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLTHVjYSBGYW5jZWxsdQ==?= <luca.fancellu@arm.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Vikram Garhwal <vikram.garhwal@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	Kelly Choi <kelly.choi@cloud.com>, Thierry Escande <thierry.escande@vates.tech>, 
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>, 
	Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>, =?UTF-8?B?UmFmYcOrbCBLb29p?= <rafael_andreas@hotmail.com>, 
	Mathieu Labourier <mathieu.labourier@vates.tech>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Cody Zuschlag <cody.zuschlag@vates.tech>, 
	Alejandro Vallejo <agarciav@amd.com>
Content-Type: multipart/alternative; boundary="00000000000055b8530636adabaf"

--00000000000055b8530636adabaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for June's Xen Project Community Call on *Thurs=
day, 5
June 2025* at *15:00 UTC* (4 pm UK time). We=E2=80=99d love for you to join=
. Feel
free to just observe or jump in! This call is a great opportunity to see
what the community is working on, align our various efforts, and share
updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/-I2PgZ1dBxBj1JlK07sQ77VM/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc.

*Call Details:*

   - *Date:* Thursday, 5 June 2025
   - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
      - Find your local timezone here
      <https://www.worldtimebuddy.com/?qm=3D1&lid=3D100,2653941,2988507,536=
8361,5128581,1850147,123&h=3D2988507&date=3D2025-6-5&sln=3D17-18&hf=3Dundef=
ined&c=3D1321>
   - *Link to Join the Call:* https://meet.jit.si/XenProjectCommunityCall

We plan to open the meeting room at 15:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 15:05 UTC.

*Want to be CC=E2=80=99d on future calls?*

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.


See you next week!


Cody Zuschlag
Xen Project - Community Manager

--00000000000055b8530636adabaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,</div><div><div><p>We=E2=80=99re get=
ting ready for June&#39;s Xen Project Community Call on=C2=A0<b>Thursday, 5=
 June 2025</b>=C2=A0at=C2=A0<b>15:00 UTC</b>=C2=A0(4 pm UK time). We=E2=80=
=99d love for you to join. Feel free to just observe or jump in! This call =
is a great opportunity to see what the community is working on, align our v=
arious efforts, and share updates. Everyone is welcome!</p></div><p><b>Prep=
aration:</b></p></div><div><ul><li style=3D"margin-left:15px">Add any propo=
sed agenda items or missing action items:=C2=A0<a href=3D"https://cryptpad.=
fr/pad/#/2/pad/edit/-I2PgZ1dBxBj1JlK07sQ77VM/">https://cryptpad.fr/pad/#/2/=
pad/edit/-I2PgZ1dBxBj1JlK07sQ77VM/</a></li><li style=3D"margin-left:15px">I=
f any action items have been resolved or are no longer relevant, feel free =
to remove them from the doc.=C2=A0</li></ul></div><div><b>Call Details:</b>=
</div><div><ul><li style=3D"margin-left:15px"><b>Date:</b>=C2=A0Thursday, 5=
 June 2025</li><li style=3D"margin-left:15px"><b>Time:</b>=C2=A015:00 UTC (=
agenda begins at 15:05 UTC)</li><ul><li style=3D"margin-left:15px"><a href=
=3D"https://www.worldtimebuddy.com/?qm=3D1&amp;lid=3D100,2653941,2988507,53=
68361,5128581,1850147,123&amp;h=3D2988507&amp;date=3D2025-6-5&amp;sln=3D17-=
18&amp;hf=3Dundefined&amp;c=3D1321" target=3D"_blank">Find your local timez=
one here</a></li></ul><li style=3D"margin-left:15px"><b>Link to Join the Ca=
ll:</b>=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityCall" target=
=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></li></ul></div>=
<div><p>We plan to open the meeting room at 15:00 UTC, but to allow time fo=
r switching between meetings and handling any technical issues, we=E2=80=99=
ll officially start discussing the agenda at 15:05 UTC.</p><p><b>Want to be=
 CC=E2=80=99d on future calls?</b><b></b></p><p>Add or remove yourself from=
 our=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFP=
z0sRCf+/" target=3D"_blank">Sign-up Sheet</a>.</p><ul></ul><div>See you nex=
t week!</div></div></div><div><br></div><div><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><img src=
=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0m=
ghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zus=
chlag</div><div>Xen Project - Community Manager</div></div></div></div></di=
v>

--00000000000055b8530636adabaf--

