Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C9466AE1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 21:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236973.410987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mssdZ-00009G-Jr; Thu, 02 Dec 2021 20:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236973.410987; Thu, 02 Dec 2021 20:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mssdZ-000077-Gb; Thu, 02 Dec 2021 20:25:01 +0000
Received: by outflank-mailman (input) for mailman id 236973;
 Thu, 02 Dec 2021 20:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPEC=QT=linuxfoundation.org=aweltz@srs-se1.protection.inumbo.net>)
 id 1mssdX-00006z-MW
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 20:24:59 +0000
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea8e32e2-53ad-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 21:24:57 +0100 (CET)
Received: by mail-il1-x12c.google.com with SMTP id s11so630682ilv.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Dec 2021 12:24:57 -0800 (PST)
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
X-Inumbo-ID: ea8e32e2-53ad-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=fvwxTg2PflpBR0KQyxD4vSg7TSVp15o2bx+r/DBfZ8w=;
        b=XCZi5KATZGhRIM+eBVe9TjC33zUiJh35tFW+XiZEE6P9AczIKZUxuShAKpvGK9dpB1
         i1Pwnp3j8eZLdPGP5PntHm8lh5TV35pFZs51ps0WK6QRIUsNxtINIA24ME5n7bARuVdw
         fpmlTbqh42A2GZD1q1OiwcKj1PtWgOUBmA4PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fvwxTg2PflpBR0KQyxD4vSg7TSVp15o2bx+r/DBfZ8w=;
        b=AEDIACyBfNRnYxZ7GjT+mk7qi7lvAulLgflXIp3DVCi02IYzqgC2oKkaNJzVEOYBI1
         RYoQVOUkV8+VHVe8RRzdeqNWGjOkyQULfSVT3qXLpv0QTZJxR7rmR/zyo9Wm9VRV0JI9
         hNB1iCAJiJywLyHAJZB15fzx55ySk08CRbCdcFm3Ycn2HZVIk1kR8kvu3kzI56yx7Zry
         u6JXm1tXjng0YC/Tk7nhZGxetHjPmz7fAAbA4VAmlA5sH5h+sYZ0NaBIeANtcsv9KXi6
         BRRTRWrZxMWMJorX8fg0uMl3kyTFtBNpVudfkVXE04cI61k5ww0ujysYlpIDwHhOHmJl
         kF4A==
X-Gm-Message-State: AOAM530Bzj/btOkM+BMYkY8rIOt0G/Mt6ENQGfTLUDND0yeMZXtRYxIM
	NAk8oX79OORosViV7OaUw8rzOSrzTG1tpmjzg+ZLcNfF0ES5Sfvw
X-Google-Smtp-Source: ABdhPJwuqAxmteZnb/S16CqYQBe6giTPLfnaufcB3kM/GXYb24ScivZVykO/tSy8aA0EfgOerb5Z/3TFioSKm9egYGU=
X-Received: by 2002:a05:6e02:1583:: with SMTP id m3mr16920993ilu.294.1638476696588;
 Thu, 02 Dec 2021 12:24:56 -0800 (PST)
MIME-Version: 1.0
From: Ashley Weltz <aweltz@linuxfoundation.org>
Date: Thu, 2 Dec 2021 15:24:41 -0500
Message-ID: <CADT4066W=fGoiyCTATSM3fZozrS1NYh3aFNtw7BM044ui_RL8Q@mail.gmail.com>
Subject: Call for agenda items for December 7th Community Call @ 1500 UTC
To: xen-devel@lists.xenproject.org, amit@infradead.org, 
	andrew.cooper3@citrix.com, Artem_Mygaiev@epam.com, ash.j.wilding@gmail.com, 
	ben@exotanium.io, bobby.eshleman@gmail.com, brendank310@gmail.com, 
	brian.woods@xilinx.com, cardoe@cardoe.com, christopher.w.clark@gmail.com, 
	Corey Minyard <cminyard@mvista.com>, daniel.kiper@oracle.com, deepthi.m@ltts.com, 
	dpsmith@apertussolutions.com, dwmw@amazon.co.uk, edgar.iglesias@xilinx.com, 
	Ian.Jackson@citrix.com, insurgo@riseup.net, intel-xen@intel.com, 
	Jarvis.Roach@dornerworks.com, Jeff.Kubascik@dornerworks.com, jgross@suse.com, 
	john.ji@intel.com, julien@xen.org, kevin.pearson@ortmanconsulting.com, 
	Matt.Spencer@arm.com, =?UTF-8?Q?Mirela_Simonovi=C4=87?= <mirela.simonovic@aggios.com>, 
	oleksandr_andrushchenko@epam.com, oleksandr_tyshchenko@epam.com, 
	olivier.lambert@vates.fr, pdurrant@amazon.com, persaur@gmail.com, 
	piotr.krol@3mdeb.com, Rahul.Singh@arm.com, rianquinn@gmail.com, 
	rob.townley@gmail.com, robin.randhawa@arm.com, roger.pau@citrix.com, 
	scottwd@gmail.com, sergey.dyasli@citrix.com, sstabellini@kernel.org, 
	Stewart.Hildebrand@dornerworks.com, tamas.k.lengyel@gmail.com, 
	varadgautam@gmail.com, volodymyr_babchuk@epam.com, wl@xen.org
Content-Type: multipart/alternative; boundary="00000000000079296405d22f95f9"

--00000000000079296405d22f95f9
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Our next meeting is on Tuesday, December 7th at 1500 UTC.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/0uM9VB27hQfkyZ+A8libTu4E/ Please add
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

--00000000000079296405d22f95f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div><div>Our next meeting is o=
n Tuesday, December 7th at 1500 UTC.=C2=A0</div><div><br></div><div>The pro=
posed agenda is in=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/0uM=
9VB27hQfkyZ+A8libTu4E/">https://cryptpad.fr/pad/#/2/pad/edit/0uM9VB27hQfkyZ=
+A8libTu4E/</a>=C2=A0Please add or edit any items to this agenda. Alternati=
vely, please feel free to email me directly with agenda items.=C2=A0</div><=
div><br>Please put your name beside any items if you edit the document.<br>=
<br>We will plan to start the meeting 5 minutes past the hour.=C2=A0<br><br=
>* If you want to be CC&#39;ed please add or remove yourself from the sign-=
up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxx=
AOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/p=
ad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a></div><div><br></div><div>Agai=
n, please let me know if you have any questions. See you on Tuesday!</div><=
div><br></div><div>Cheers,</div><div>Ashley</div></div><div><br></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr">Ashley Weltz, Project Coordinator=C2=A0<div>The Linux=
 Foundation</div><div><a href=3D"mailto:aweltz@linuxfoundation.org" target=
=3D"_blank">aweltz@linuxfoundation.org</a></div></div></div></div>

--00000000000079296405d22f95f9--

