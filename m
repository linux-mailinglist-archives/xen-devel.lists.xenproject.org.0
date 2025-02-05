Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56668A288FD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 12:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882163.1292347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdNH-0001Qp-C3; Wed, 05 Feb 2025 11:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882163.1292347; Wed, 05 Feb 2025 11:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdNH-0001OO-9E; Wed, 05 Feb 2025 11:15:19 +0000
Received: by outflank-mailman (input) for mailman id 882163;
 Wed, 05 Feb 2025 11:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5r7=U4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tfdNG-0001OI-GX
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 11:15:18 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a26f65f-e3b2-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 12:15:16 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dce3763140so322355a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 03:15:16 -0800 (PST)
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
X-Inumbo-ID: 7a26f65f-e3b2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738754115; x=1739358915; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bz0F8xtFtahXPxmZ1R69be3yGYhzzHnhTpOUoLFgd2w=;
        b=FvKrYXzM3PNrM43E157dEyUxwqeqGmI+m1ELShSVTjo2J0392OfwBupBYjtA9GkavB
         Gke1i44KllIvkyN+BRR2D+lnjakAL1AyGpbonB8PckroW4zYerKrzAf7DcVLOF0SNMx8
         /Ak6jFKLsxBcQOh5kFND1xwDksHrhO3y1MqAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738754115; x=1739358915;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bz0F8xtFtahXPxmZ1R69be3yGYhzzHnhTpOUoLFgd2w=;
        b=hspBXK1MxF8H1WATtKHjHxY45BW2/5RJy9S16eFgBjpgLHBD2IdmuTXDj8HoGSNhia
         sLQpDLtCxI+hmJ8s6iELAuB6Dmbl4wYet3PQAcxH9rnoSS0T+9D/p0JCl/k/0mJILbJF
         pbz2K59KCCxaomT1JLXbrJvyS5cp/88uEPZxFyqqFQxkxBOg7kfDmfWAhRmNpqNJVzXp
         A/xq182SgaS6Rixihc5dynbC1+MMcXhXzEwFj9vFI9sxmKWcqpe4Y12FPbd8cR9V+RRz
         8FM7a7L/jgPoTScMPG+PlMBOFQTqbYgr0+B8tWKWQE+/go2hCjXLAedtuu+DynhG4CZm
         QDvQ==
X-Gm-Message-State: AOJu0Yyw6UfYKS4IcjTRpXFO4dB21VVN+J/4obiOVyTJUUjGAH8JMWOB
	he5YdQdpsvZkU8zTfAfJEHrL4/ZiD7GSaa8EEg6g2ajl5CL3FFayEp4Gp3u0EmATifDGz9sWPNt
	+BY7gK6scxGp7fP4dI6f5tJiBMR5LWlVLkB8PjyhoLzK3pTClw5QaVw==
X-Gm-Gg: ASbGnctli9V7Kf365sYvj5hf2wGL/0Wd4MOOS7NLx6FzE8jbcLvm/WrAQ1wQ37xoMlL
	kYRpR9EP2C6oETQZZ5Lf0m24lpG3wz0XtP/VDFbY/d3nBaU5EFFjmOTk6Hd1ldseBBBLlCsN8qn
	zYLQOmA/uKn4E9iGdIjZBneROrn44d
X-Google-Smtp-Source: AGHT+IFyar9wc9FIeqjzSQ7hR0sD+qR8e/Yr2l2zW4I1KLcrPxvim6skR7o7VrRl+/6K6f4UTVTH5RVm7Rr9WoOtPbg=
X-Received: by 2002:a05:6402:1ecf:b0:5dc:584e:8537 with SMTP id
 4fb4d7f45d1cf-5dcdb774929mr2300563a12.23.1738754115058; Wed, 05 Feb 2025
 03:15:15 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 5 Feb 2025 11:14:39 +0000
X-Gm-Features: AWEUYZnwkmCIFVMzB-l7aWNqF8Nz24M73UMPNACvP6Hyd64F8y4drjNtFLlc2-s
Message-ID: <CAO-mL=xJg=7iinKvLAvM7Nvv_+BgPLoWdC2pi-QdAKhxFgSqRw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items - Community Call 6th Feb 2025
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000615abc062d633d58"

--000000000000615abc062d633d58
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please add your proposed agenda items below. If any action items are
missing or have been resolved, please add/remove them from the sheet.

https://cryptpad.fr/pad/#/2/pad/edit/Hx4MN8M+usqJSpzwd0J79x3w/

*CALL LINK:* https://meet.jit.si/XenProjectCommunityCall
<https://www.google.com/url?q=https://meet.jit.si/XenProjectCommunityCall&sa=D&source=calendar&ust=1699196661201312&usg=AOvVaw1FcogEsMjFSd1Pmi7V0cBc>

*DATE: *Thursday 6th February 2025

*TIME: *1600 UTC (4 pm UK time)
*Note the following administrative conventions for the call:*


** To allow time to switch between meetings, we plan on starting theagenda
at 16:05 UTC sharp.  Aim to join by 16:03 UTC if possible to allocatetime
to sort out technical difficulties.*








** If you want to be CC'ed please add or remove yourself from
thesign-up-sheet
at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>== Dial-in
Information ==## Meeting time16:00 - 17:00 British timeFurther
International meeting
times:*https://www.timeanddate.com/worldclock/meetingdetails.html?year=2025&month=2&day=6&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--000000000000615abc062d633d58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><p>Hi all,=C2=A0</p><p>Please add your prop=
osed agenda items below. If any action items are missing or have been resol=
ved, please add/remove them from the sheet.=C2=A0</p><p><a href=3D"https://=
cryptpad.fr/pad/#/2/pad/edit/Hx4MN8M+usqJSpzwd0J79x3w/">https://cryptpad.fr=
/pad/#/2/pad/edit/Hx4MN8M+usqJSpzwd0J79x3w/</a>=C2=A0</p><p><b><span class=
=3D"gmail-il">CALL</span>=C2=A0LINK:</b>=C2=A0<a href=3D"https://www.google=
.com/url?q=3Dhttps://meet.jit.si/XenProjectCommunityCall&amp;sa=3DD&amp;sou=
rce=3Dcalendar&amp;ust=3D1699196661201312&amp;usg=3DAOvVaw1FcogEsMjFSd1Pmi7=
V0cBc" target=3D"_blank">https://meet.jit.si/XenProjectCommunityCall</a></p=
><p><b>DATE:=C2=A0</b>Thursday 6th February 2025</p><p><b>TIME:=C2=A0</b>16=
00 UTC (4 pm UK time)</p><i>Note the following administrative conventions f=
or the=C2=A0<span class=3D"gmail-il">call</span>:</i></div><div><div><i>* T=
o allow time to switch between meetings, we plan on starting the<br>agenda =
at 16:05 UTC sharp.=C2=A0 Aim to join by 16:03 UTC if possible to allocate<=
br>time to sort out technical difficulties.</i></div><div><i><br>* If you w=
ant to be CC&#39;ed please add or remove yourself from the<br>sign-up-sheet=
 at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz=
0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.fr/pad/#/2/p=
ad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>=3D=3D=C2=A0<span class=3D"gma=
il-il">Dial</span>-in Information =3D=3D<br>## Meeting time<br>16:00 - 17:0=
0 British time<br>Further International meeting times:<br></i><a href=3D"ht=
tps://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&amp;mo=
nth=3D2&amp;day=3D6&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp=
;p2=3D37&amp;p3=3D224&amp;p4=3D179" target=3D"_blank">https://www.timeandda=
te.com/worldclock/meetingdetails.html?year=3D2025&amp;month=3D2&amp;day=3D6=
&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D2=
24&amp;p4=3D179  </a>=C2=A0<br><br>##=C2=A0<span class=3D"gmail-il">Dial</s=
pan>=C2=A0in details<br><a href=3D"https://meet.jit.si/static/dialInInfo.ht=
ml?room=3DXenProjectCommunityCall" rel=3D"noreferrer" target=3D"_blank">htt=
ps://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall</a><=
/div></div></div><div><br></div></div><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,=
</div><div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">C=
ommunity Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"http=
s://xenproject.org/" target=3D"_blank">Xen Project</a><br></div></div></div=
></div></div></div>

--000000000000615abc062d633d58--

