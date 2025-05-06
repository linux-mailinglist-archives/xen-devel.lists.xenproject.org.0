Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5295EAACE66
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 21:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978000.1364886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCOIY-00006U-VO; Tue, 06 May 2025 19:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978000.1364886; Tue, 06 May 2025 19:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCOIY-00004v-SR; Tue, 06 May 2025 19:49:50 +0000
Received: by outflank-mailman (input) for mailman id 978000;
 Tue, 06 May 2025 19:49:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uCOIX-0008WU-Il
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 19:49:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uCOIX-00CuGf-0X
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 19:49:49 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uCOIX-004jHi-0G
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 19:49:49 +0000
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-523f1b31cf8so1370051e0c.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 12:49:49 -0700 (PDT)
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
	Date:From:In-Reply-To:References:MIME-Version;
	bh=INsAmsR5Kbp6hhkQqLEUa1y4nxrMxIXH1D7gsbuNbnU=; b=s72XBR98m76s7oO4yBF8HY6aZY
	k9ez18IP7kjXkp4Tn6pkOH0Dp5x5weWckeBbduU36O7MM5fG2ayPaCqGhQpHNV2fzfefDcHVs7trw
	19DA404XpQpXQogIPYgb/fMnpVjryusFO4h5Y5wru2Szb6bcaILqRP/ek9OusKLMW/Ow=;
X-Gm-Message-State: AOJu0YxVgRKPawHXlTF4XOHVLYeAB1i9eu1XpVadSnjZMMhI4r8XyAUX
	siaggMyUUri1wR9v3eehygGHeAfHW57p3Rzoah64LZAB2zY6CUHSbUI6CSt1QEA6yJS5d7NMytj
	pWMPsddaiX1rkpaXUdeYqGiGVbFc=
X-Google-Smtp-Source: AGHT+IFiwbusS+6mVNrkAb/Y1o9LwS+3Ook7XqXitaXID89XKMQthVMX38W6SGCICije36rxVP58TR+wrwNKET5H4IE=
X-Received: by 2002:a05:6122:3102:b0:526:2210:5b64 with SMTP id
 71dfb90a1353d-52c37ab4c4amr770785e0c.9.1746560988646; Tue, 06 May 2025
 12:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAJbE=KyLMFsuHTP8Pb2wT5LcL=_uYma-RBA_Ho9tJMGPznxuHg@mail.gmail.com>
In-Reply-To: <CAJbE=KyLMFsuHTP8Pb2wT5LcL=_uYma-RBA_Ho9tJMGPznxuHg@mail.gmail.com>
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Tue, 6 May 2025 21:49:37 +0200
X-Gmail-Original-Message-ID: <CAJbE=KyQw9piCvmFRCAnNiP+O=y+AztOmzCZz6Xj2Cc5VS16fA@mail.gmail.com>
X-Gm-Features: ATxdqUF62pBGBHWTGOXvEnRRnUL9ISHI6T5tbYQ84pkw2_faM2fZgkCDdfjVyWs
Message-ID: <CAJbE=KyQw9piCvmFRCAnNiP+O=y+AztOmzCZz6Xj2Cc5VS16fA@mail.gmail.com>
Subject: Re: [ANNOUNCE] [NEW TIME] Call for agenda items for May 7, 2025
 Community Call @ 15:00 UTC
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
Content-Type: multipart/alternative; boundary="0000000000004e9c3706347ceb68"

--0000000000004e9c3706347ceb68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reminder for tomorrow=E2=80=99s community call 07 May at 15:00 UTC. See bel=
ow for a
link to the agenda.


Cody Zuschlag
Xen Project - Community Manager


On Mon, Apr 28, 2025 at 17:42 Cody Zuschlag <cody.zuschlag@xenproject.org>
wrote:

> Hi everyone,
>
> *IMPORTANT: Due to public holidays in several countries, May's community
> call has been moved to Wednesday, 7 May 2025.*
>
> We=E2=80=99re getting ready for May's Xen Project Community Call on *Wedn=
esday, 7
> May 2025* at *15:00 UTC* (4 pm UK time). We=E2=80=99d love for you to joi=
n. Feel
> free to just observe or jump in! This call is a great opportunity to see
> what the community is working on, align our various efforts, and share
> updates. Everyone is welcome!
>
> *Preparation:*
>
>    - Add any proposed agenda items or missing action items:
>    https://cryptpad.fr/pad/#/2/pad/edit/1cT4oJhJZAnJk9CbAogFYchM/
>    - If any action items have been resolved or are no longer relevant,
>    feel free to remove them from the doc.
>
> *Call Details:*
>
>    - *Date:* Wednesday, 7 May 2025
>    - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
>       - Find your local timezone here
>       <https://www.worldtimebuddy.com/?qm=3D1&lid=3D100,2653941,2988507,5=
368361,5128581,1850147,123&h=3D2988507&date=3D2025-5-7&sln=3D17-17.5&hf=3Du=
ndefined&c=3D1578>
>    - *Link to Join the Call:* https://meet.jit.si/XenProjectCommunityCall
>
> We plan to open the meeting room at 15:00 UTC, but to allow time for
> switching between meetings and handling any technical issues, we=E2=80=99=
ll
> officially start discussing the agenda at 15:05 UTC.
>
> *Want to be CC=E2=80=99d on future calls?*
>
> Add or remove yourself from our Sign-up Sheet
> <https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.
>
>
> See you next week!
>
>
> Cody Zuschlag
> Xen Project - Community Manager
>

--0000000000004e9c3706347ceb68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reminder for tomorrow=E2=80=99s community call 07 May at =
15:00 UTC. See below for a link to the agenda.=C2=A0<br clear=3D"all"><br c=
lear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.googleusercon=
tent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6=
mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen Project -=
 Community Manager</div></div></div></div></div><div><br></div><div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Apr 28, 2025 at 17:42 Cody Zuschlag &lt;<a href=3D"mailto:=
cody.zuschlag@xenproject.org">cody.zuschlag@xenproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div>Hi everyo=
ne,</div><div><div><p><b>IMPORTANT: Due to public holidays in several count=
ries, May&#39;s community call has been moved to Wednesday, 7 May 2025.</b>=
</p></div><p>We=E2=80=99re getting ready for May&#39;s Xen Project Communit=
y Call on=C2=A0<b>Wednesday, 7 May 2025</b>=C2=A0at=C2=A0<b>15:00 UTC</b>=
=C2=A0(4 pm UK time). We=E2=80=99d love for you to join. Feel free to just =
observe or jump in! This call is a great opportunity to see what the commun=
ity is working on, align our various efforts, and share updates. Everyone i=
s welcome!</p><p><b>Preparation:</b></p></div><div><ul><li style=3D"margin-=
left:15px">Add any proposed agenda items or missing action items:=C2=A0<a h=
ref=3D"https://cryptpad.fr/pad/#/2/pad/edit/1cT4oJhJZAnJk9CbAogFYchM/" targ=
et=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/1cT4oJhJZAnJk9CbAogFYchM=
/</a></li><li style=3D"margin-left:15px">If any action items have been reso=
lved or are no longer relevant, feel free to remove them from the doc.=C2=
=A0</li></ul></div><div><b>Call Details:</b></div><div><ul><li style=3D"mar=
gin-left:15px"><b>Date:</b>=C2=A0Wednesday, 7 May 2025</li><li style=3D"mar=
gin-left:15px"><b>Time:</b>=C2=A015:00 UTC (agenda begins at 15:05 UTC)</li=
><ul><li style=3D"margin-left:15px"><a href=3D"https://www.worldtimebuddy.c=
om/?qm=3D1&amp;lid=3D100,2653941,2988507,5368361,5128581,1850147,123&amp;h=
=3D2988507&amp;date=3D2025-5-7&amp;sln=3D17-17.5&amp;hf=3Dundefined&amp;c=
=3D1578" target=3D"_blank">Find your local timezone here</a></li></ul><li s=
tyle=3D"margin-left:15px"><b>Link to Join the Call:</b>=C2=A0<a href=3D"htt=
ps://meet.jit.si/XenProjectCommunityCall" target=3D"_blank">https://meet.ji=
t.si/XenProjectCommunityCall</a></li></ul></div><div><p>We plan to open the=
 meeting room at 15:00 UTC, but to allow time for switching between meeting=
s and handling any technical issues, we=E2=80=99ll officially start discuss=
ing the agenda at 15:05 UTC.</p><p><b>Want to be CC=E2=80=99d on future cal=
ls?</b><b></b></p><p>Add or remove yourself from our=C2=A0<a href=3D"https:=
//cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" target=3D"_blank"=
>Sign-up Sheet</a>.</p><ul></ul><div>See you next week!</div></div></div><d=
iv><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.googleusercon=
tent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6=
mBmJ2F4vZVE2oBOqnY6IaJUrl12"></div></div></div></div><div dir=3D"ltr"><div>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><br><div>Cody Zuschlag</div><div>Xen Project - Communit=
y Manager</div></div></div></div></div>
</blockquote></div></div>

--0000000000004e9c3706347ceb68--

