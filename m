Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD31A9F4CB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970868.1359427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QdU-000228-9O; Mon, 28 Apr 2025 15:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970868.1359427; Mon, 28 Apr 2025 15:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QdU-0001zQ-61; Mon, 28 Apr 2025 15:43:12 +0000
Received: by outflank-mailman (input) for mailman id 970868;
 Mon, 28 Apr 2025 15:43:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1u9QdT-0001zK-16
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:43:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1u9QdS-00AYKk-2V
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:43:10 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1u9QdS-007lsh-2M
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:43:10 +0000
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-52934f4fb23so4931707e0c.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 08:43:10 -0700 (PDT)
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
	Date:From:MIME-Version; bh=HhK/iltj1k0/ZvD6Fj3ztKY3hSS9y9+djRL+jiYNMjA=; b=1M
	0SdpJiiYgjejrXxp36XXn01ovJp0h7gwlv++pRB2gc6GpJ5gZX0GVdUdECttZ1OO5VkWFuFTaEKbN
	/wqAPYtpWtpWr0vi29nL6NJ62YMK6Mdm4K/ZBfm5BAdC7lhxY1IR5c4Ars6rVBHOS0buah5veGZ1g
	+L3KnGplf8YcusY=;
X-Gm-Message-State: AOJu0YziIGOv1XHMct+P1BaOrg8AGDdYf395c2SW0Hup85xRwx4uyR+A
	IHUR/GEtauCLHPmRU+1/D6/yUE+qNdbLYZ1KNcdbg2dHbZ7PTj4drM96+6OMNV8Q0BdxnLVAqWd
	pTyGIFGAHcMHKUqMdfiQVLc/Fww8=
X-Google-Smtp-Source: AGHT+IHNJsohIT102MEYUSinlWxsgAAS/1fnJnQcnMtvTL7gGKm1qGXEVUc1t6beoEAc3DYNdtsjJOUgidRUJotWmmo=
X-Received: by 2002:a05:6122:4693:b0:523:dd87:fe95 with SMTP id
 71dfb90a1353d-52a89f1714amr8930192e0c.9.1745854990253; Mon, 28 Apr 2025
 08:43:10 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Mon, 28 Apr 2025 17:42:58 +0200
X-Gmail-Original-Message-ID: <CAJbE=KyLMFsuHTP8Pb2wT5LcL=_uYma-RBA_Ho9tJMGPznxuHg@mail.gmail.com>
X-Gm-Features: ATxdqUGhmzk-XJ0KfdHaIpw4xSATUbhUTXu76NlrVMbdc-3p0emydrFSZytQCfE
Message-ID: <CAJbE=KyLMFsuHTP8Pb2wT5LcL=_uYma-RBA_Ho9tJMGPznxuHg@mail.gmail.com>
Subject: [ANNOUNCE] [NEW TIME] Call for agenda items for May 7, 2025 Community
 Call @ 15:00 UTC
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
	Anthony PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>, 
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
Content-Type: multipart/alternative; boundary="0000000000008613d60633d88a76"

--0000000000008613d60633d88a76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

*IMPORTANT: Due to public holidays in several countries, May's community
call has been moved to Wednesday, 7 May 2025.*

We=E2=80=99re getting ready for May's Xen Project Community Call on *Wednes=
day, 7
May 2025* at *15:00 UTC* (4 pm UK time). We=E2=80=99d love for you to join.=
 Feel
free to just observe or jump in! This call is a great opportunity to see
what the community is working on, align our various efforts, and share
updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/1cT4oJhJZAnJk9CbAogFYchM/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc.

*Call Details:*

   - *Date:* Wednesday, 7 May 2025
   - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
      - Find your local timezone here
      <https://www.worldtimebuddy.com/?qm=3D1&lid=3D100,2653941,2988507,536=
8361,5128581,1850147,123&h=3D2988507&date=3D2025-5-7&sln=3D17-17.5&hf=3Dund=
efined&c=3D1578>
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

--0000000000008613d60633d88a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,</div><div><div><p><b>IMPORTANT: Due=
 to public holidays in several countries, May&#39;s community call has been=
 moved to Wednesday, 7 May 2025.</b></p></div><p>We=E2=80=99re getting read=
y for May&#39;s Xen Project Community Call on=C2=A0<b>Wednesday, 7 May 2025=
</b>=C2=A0at=C2=A0<b>15:00 UTC</b>=C2=A0(4 pm UK time). We=E2=80=99d love f=
or you to join. Feel free to just observe or jump in! This call is a great =
opportunity to see what the community is working on, align our various effo=
rts, and share updates. Everyone is welcome!</p><p><b>Preparation:</b></p><=
/div><div><ul><li style=3D"margin-left:15px">Add any proposed agenda items =
or missing action items:=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/ed=
it/1cT4oJhJZAnJk9CbAogFYchM/">https://cryptpad.fr/pad/#/2/pad/edit/1cT4oJhJ=
ZAnJk9CbAogFYchM/</a></li><li style=3D"margin-left:15px">If any action item=
s have been resolved or are no longer relevant, feel free to remove them fr=
om the doc.=C2=A0</li></ul></div><div><b>Call Details:</b></div><div><ul><l=
i style=3D"margin-left:15px"><b>Date:</b>=C2=A0Wednesday, 7 May 2025</li><l=
i style=3D"margin-left:15px"><b>Time:</b>=C2=A015:00 UTC (agenda begins at =
15:05 UTC)</li><ul><li style=3D"margin-left:15px"><a href=3D"https://www.wo=
rldtimebuddy.com/?qm=3D1&amp;lid=3D100,2653941,2988507,5368361,5128581,1850=
147,123&amp;h=3D2988507&amp;date=3D2025-5-7&amp;sln=3D17-17.5&amp;hf=3Dunde=
fined&amp;c=3D1578" target=3D"_blank">Find your local timezone here</a></li=
></ul><li style=3D"margin-left:15px"><b>Link to Join the Call:</b>=C2=A0<a =
href=3D"https://meet.jit.si/XenProjectCommunityCall" target=3D"_blank">http=
s://meet.jit.si/XenProjectCommunityCall</a></li></ul></div><div><p>We plan =
to open the meeting room at 15:00 UTC, but to allow time for switching betw=
een meetings and handling any technical issues, we=E2=80=99ll officially st=
art discussing the agenda at 15:05 UTC.</p><p><b>Want to be CC=E2=80=99d on=
 future calls?</b><b></b></p><p>Add or remove yourself from our=C2=A0<a hre=
f=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" target=
=3D"_blank">Sign-up Sheet</a>.</p><ul></ul><div>See you next week!</div></d=
iv></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.go=
ogleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQti=
tBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xe=
n Project - Community Manager</div></div></div></div></div>

--0000000000008613d60633d88a76--

