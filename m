Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127304000CE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 15:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178110.323985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM9cn-00067R-Fv; Fri, 03 Sep 2021 13:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178110.323985; Fri, 03 Sep 2021 13:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM9cn-00064t-CC; Fri, 03 Sep 2021 13:52:57 +0000
Received: by outflank-mailman (input) for mailman id 178110;
 Fri, 03 Sep 2021 13:52:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbJo=NZ=linuxfoundation.org=aweltz@srs-us1.protection.inumbo.net>)
 id 1mM9cm-00064n-8H
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 13:52:56 +0000
Received: from mail-il1-x131.google.com (unknown [2607:f8b0:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c665ad12-4d74-43bb-9d32-d5cdc038559c;
 Fri, 03 Sep 2021 13:52:55 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h29so5288303ila.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 06:52:55 -0700 (PDT)
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
X-Inumbo-ID: c665ad12-4d74-43bb-9d32-d5cdc038559c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=LcflHDuWnt22drIHcdo3+GFGrkeK5QWOt9ac+oMd6kE=;
        b=eXkEl7Rm2aiiik4kPHuU4F1OnGGRqiaujgiCkqGXG0cpstYFYWa8wiKzdF0RReoPFJ
         8D9vFRc1d2VIkVdGREBEq3UOxb/qRHAhDVT94fPuqr1Q+3f2R6fQ8yy+KR+NxRQFtBme
         a3toHvO3iNa4cOQf0GChUAxiu3HF9IFfcwHhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=LcflHDuWnt22drIHcdo3+GFGrkeK5QWOt9ac+oMd6kE=;
        b=tK/UOLulv7akLzkTJoQusSNUlKQl/DaoI2tS75dXzOWa09tYJ/Q50uoZiBroxWvfTL
         IQUY9faZ1pB/AmmsA5aNz6aw5uqli1j1g03EGwdrR+qwYFWyzwpFJ2Z+6GvnFt3XIM8/
         7oUN1asr+CP0HPqOrnzwt07Q6iNOEMUFOfyfW85PYx/QcrGv3wF2YCf9XRHPUqq0F+OT
         9Cg2jgDsDIZRP9w42dNHCUF+4vBFAwlFrtfcwzLlJ8k2BBdMhUnSsy+5klcraHg6RfRm
         ZFZhfDK86CtRgUnkcedxKtEJDKKGBQo0fmu9yCT8Dtnv6/BEwFjtZiuWvNQ+E1pd4+l9
         Taww==
X-Gm-Message-State: AOAM531MFjGaPic4U7v+PpPlcFYmoRwDDixrh3ErG6ui6GEvVlCbuWdT
	wDUJ2tbgHXTw5CgRDd6jUiYwBKPDDtFSn64UQq13MQ==
X-Google-Smtp-Source: ABdhPJx3adAS9hhK6cug5GLkwtGb1nPGLwRZ3S7Xjvj3gZC2aZvuo61R2uUSFjXy5lPujr2imEgnPUxbp5R9ru3PLIU=
X-Received: by 2002:a05:6e02:1353:: with SMTP id k19mr2671451ilr.157.1630677174665;
 Fri, 03 Sep 2021 06:52:54 -0700 (PDT)
MIME-Version: 1.0
From: Ashley Weltz <aweltz@linuxfoundation.org>
Date: Fri, 3 Sep 2021 09:52:43 -0400
Message-ID: <CADT4066k7HR=Bpcg1U0jT+w2Zt5u_4ApHXTZuAo-i3g-Z79mpQ@mail.gmail.com>
Subject: Call for agenda items for September 7th Community Call @ 1500 UTC
To: amit@infradead.org, andrew.cooper3@citrix.com, Artem_Mygaiev@epam.com, 
	ash.j.wilding@gmail.com, ben@exotanium.io, bobby.eshleman@gmail.com, 
	brendank310@gmail.com, brian.woods@xilinx.com, cardoe@cardoe.com, 
	christopher.w.clark@gmail.com, Corey Minyard <cminyard@mvista.com>, 
	daniel.kiper@oracle.com, deepthi.m@ltts.com, dpsmith@apertussolutions.com, 
	dwmw@amazon.co.uk, edgar.iglesias@xilinx.com, Ian.Jackson@citrix.com, 
	insurgo@riseup.net, intel-xen@intel.com, Jarvis.Roach@dornerworks.com, 
	Jeff.Kubascik@dornerworks.com, jgross@suse.com, john.ji@intel.com, 
	julien@xen.org, kevin.pearson@ortmanconsulting.com, Matt.Spencer@arm.com, 
	=?UTF-8?Q?Mirela_Simonovi=C4=87?= <mirela.simonovic@aggios.com>, 
	oleksandr_andrushchenko@epam.com, oleksandr_tyshchenko@epam.com, 
	olivier.lambert@vates.fr, pdurrant@amazon.com, persaur@gmail.com, 
	piotr.krol@3mdeb.com, Rahul.Singh@arm.com, rianquinn@gmail.com, 
	rob.townley@gmail.com, robin.randhawa@arm.com, roger.pau@citrix.com, 
	scottwd@gmail.com, sergey.dyasli@citrix.com, sstabellini@kernel.org, 
	Stewart.Hildebrand@dornerworks.com, tamas.k.lengyel@gmail.com, 
	varadgautam@gmail.com, volodymyr_babchuk@epam.com, wl@xen.org
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000bd5c6605cb179deb"

--000000000000bd5c6605cb179deb
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Our next meeting is this upcoming Tuesday at 1500 UTC.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/PXjRK6mJfWbUxSNW0Qt8xOqT/. Please add
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

--000000000000bd5c6605cb179deb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>Our next meetin=
g is this upcoming Tuesday at 1500 UTC.=C2=A0</div><div><br></div><div>The =
proposed agenda is in=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/=
PXjRK6mJfWbUxSNW0Qt8xOqT/">https://cryptpad.fr/pad/#/2/pad/edit/PXjRK6mJfWb=
UxSNW0Qt8xOqT/</a>. Please add or edit any items to this agenda. Alternativ=
ely, please feel free to email me directly with agenda items.=C2=A0</div><d=
iv><br>Please put your name beside any items if you edit the document.<br><=
br>We will plan to start the meeting 5 minutes past the hour.=C2=A0<br><br>=
* If you want to be CC&#39;ed please add or remove yourself from the sign-u=
p-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxA=
Oe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pa=
d/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a></div><div><br></div><div>Again=
, please let me know if you have any questions. See you on Tuesday!</div><d=
iv><br></div><div>Cheers,</div><div>Ashley</div><div><br></div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr">Ashley Weltz, Project Coordinator=C2=A0<div>The Linux Founda=
tion</div><div><a href=3D"mailto:aweltz@linuxfoundation.org" target=3D"_bla=
nk">aweltz@linuxfoundation.org</a></div></div></div></div>

--000000000000bd5c6605cb179deb--

