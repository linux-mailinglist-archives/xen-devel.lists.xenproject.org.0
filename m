Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126B48A09E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 21:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255543.437929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n70sI-0005vl-5K; Mon, 10 Jan 2022 20:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255543.437929; Mon, 10 Jan 2022 20:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n70sI-0005su-1B; Mon, 10 Jan 2022 20:02:38 +0000
Received: by outflank-mailman (input) for mailman id 255543;
 Mon, 10 Jan 2022 20:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8Yb=R2=linuxfoundation.org=aweltz@srs-se1.protection.inumbo.net>)
 id 1n70sG-0005so-HQ
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 20:02:36 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fc275c5-7250-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 21:02:35 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so1594216pjb.5
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jan 2022 12:02:35 -0800 (PST)
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
X-Inumbo-ID: 3fc275c5-7250-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ef68FBAzAo6XfTycvc4YICmAVZyLVbPPKdcgVXIOcws=;
        b=Z3ou1Tzz90u6YexjN/wqhj7ll0Jo9LhJcfpZR6pbVu3iW3gcxkzgwqI0OmoEotPODS
         w7QIT+chJIlVUTxC+xrWNLYmy3AL9chrrKNpRqDNOdY0QIdC3y+87eRxL15uZ9wtyoa7
         MEtOgmn1+jNbZcU8paGxctblWu3ZkZkpQhqzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ef68FBAzAo6XfTycvc4YICmAVZyLVbPPKdcgVXIOcws=;
        b=YY/A+vsR0uJgdzqTCW1iNmFBIdevQhS+vu0j6TT/Pt0eDBXrsaC/ux10TlU42IINya
         BEhnFCvC6xN1JKfQ1yHbMe83KybJIbMzuT6QL9SkphzdMtHEXm2edUtQI9cusWeekGDB
         U/laHu/lTB7jEmVZfXf57umiF55y1jgN0OLOgn4GhMHvBgrky9YWhDgtGzuxkpGv+gBL
         Ae9TnaN8jEhtd4pndicfbGdoglGlaTAWbNKUwhmaQHhEhmXav7fpFx3D73Fq7VX3nF6I
         xkIGjffJnGo6YmhCl3sD9YasFuNb31cV55bTn8Y9BP4ZLJUkIrhnyUPC+NbrhSsu0rE7
         yY8w==
X-Gm-Message-State: AOAM532I4J/drguq+nFcXzZx4BR2BN7Einbzsa0yVKPJlqK4lMl3k0LL
	Ul2JioQCv3g+t2Td1QkFmgnjN6as6EuCtFHKxCQ/iw==
X-Google-Smtp-Source: ABdhPJwLlqPh6TANWBz9U01jExNdA/mkEVBySEldiCbvaRILW0ikUCrSavz/5NQenz/aUEFZO2t3ET6hPQ9/jN0MmMc=
X-Received: by 2002:a17:903:2341:b0:14a:5184:3ea7 with SMTP id
 c1-20020a170903234100b0014a51843ea7mr477599plh.107.1641844952731; Mon, 10 Jan
 2022 12:02:32 -0800 (PST)
MIME-Version: 1.0
From: Ashley Weltz <aweltz@linuxfoundation.org>
Date: Mon, 10 Jan 2022 15:02:17 -0500
Message-ID: <CADT4067imrLqdrO=mS8KrcdDRhtxHS3+ytgS=c8MO3WApYSaaQ@mail.gmail.com>
Subject: Call for agenda items for January 11 Community Call
To: amit@infradead.org, andrew.cooper3@citrix.com, Artem_Mygaiev@epam.com, 
	ash.j.wilding@gmail.com, ben@exotanium.io, bobby.eshleman@gmail.com, 
	brendank310@gmail.com, brian.woods@xilinx.com, cardoe@cardoe.com, 
	christopher.w.clark@gmail.com, Corey Minyard <cminyard@mvista.com>, 
	daniel.kiper@oracle.com, deepthi.m@ltts.com, dpsmith@apertussolutions.com, 
	dwmw@amazon.co.uk, edgar.iglesias@xilinx.com, Ian.Jackson@citrix.com, 
	insurgo@riseup.net, intel-xen@intel.com, Jarvis.Roach@dornerworks.com, 
	Jeff.Kubascik@dornerworks.com, jgross@suse.com, john.ji@intel.com, 
	julien@xen.org, kevin.pearson@ortmanconsulting.com, Matt.Spencer@arm.com, 
	mirela.simonovic@aggios.com, oleksandr_andrushchenko@epam.com, 
	oleksandr_tyshchenko@epam.com, olivier.lambert@vates.fr, pdurrant@amazon.com, 
	persaur@gmail.com, piotr.krol@3mdeb.com, Rahul.Singh@arm.com, 
	rianquinn@gmail.com, rob.townley@gmail.com, robin.randhawa@arm.com, 
	roger.pau@citrix.com, scottwd@gmail.com, sergey.dyasli@citrix.com, 
	sstabellini@kernel.org, Stewart.Hildebrand@dornerworks.com, 
	tamas.k.lengyel@gmail.com, varadgautam@gmail.com, volodymyr_babchuk@epam.com, 
	wl@xen.org
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000002f331005d53fd149"

--0000000000002f331005d53fd149
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Happy New Year! I hope you all enjoyed a lovely holiday.

Our next meeting is tomorrow, January 11th at 4pm UTC.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/xoyB4pnwFfULo6K+O7mi0c10/ Please add
or edit any items to this agenda. Alternatively, please feel free to email
me directly with agenda items.

Please put your name beside any items if you edit the document.

We will plan to start the meeting 5 minutes past the hour.

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Again, please let me know if you have any questions. See you on Tuesday!

Cheers,
Ashley

-- 
Ashley Weltz, Project Coordinator
The Linux Foundation
aweltz@linuxfoundation.org

--0000000000002f331005d53fd149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>Happy New Year! I hope you=
 all enjoyed a lovely holiday.=C2=A0<br><div><br></div><div><div>Our next m=
eeting is tomorrow, January 11th at 4pm UTC.=C2=A0</div><div><br></div><div=
>The proposed agenda is in=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/=
edit/xoyB4pnwFfULo6K+O7mi0c10/">https://cryptpad.fr/pad/#/2/pad/edit/xoyB4p=
nwFfULo6K+O7mi0c10/</a> Please add or edit any items to this agenda. Altern=
atively, please feel free to email me directly with agenda items.=C2=A0</di=
v><div><br>Please put your name beside any items if you edit the document.<=
br><br>We will plan to start the meeting 5 minutes past the hour.=C2=A0<br>=
<br>* If you want to be CC&#39;ed please add or remove yourself from the si=
gn-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzih=
PxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.f=
r/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a></div><div><br></div><div>A=
gain, please let me know if you have any questions. See you on Tuesday!</di=
v><div><br></div><div>Cheers,</div><div>Ashley</div></div><div><br></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr">Ashley Weltz, Project Coordinator=C2=A0<div>The Li=
nux Foundation</div><div><a href=3D"mailto:aweltz@linuxfoundation.org" targ=
et=3D"_blank">aweltz@linuxfoundation.org</a></div></div></div></div></div>

--0000000000002f331005d53fd149--

