Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701687A9E2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692470.1079642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ4m-0001Re-BJ; Wed, 13 Mar 2024 14:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692470.1079642; Wed, 13 Mar 2024 14:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ4m-0001Q9-8X; Wed, 13 Mar 2024 14:59:28 +0000
Received: by outflank-mailman (input) for mailman id 692470;
 Wed, 13 Mar 2024 14:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSGV=KT=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rkQ4l-0001Oo-Aq
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 14:59:27 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ce857b-e14a-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 15:59:26 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5683089d4bbso7271764a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 07:59:26 -0700 (PDT)
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
X-Inumbo-ID: 48ce857b-e14a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710341965; x=1710946765; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hCinrcfC+9irVXRne3N2PTAFGdJZMBrm1hz95sPNsWY=;
        b=W5ub9HYSo5V1MgW+Gq0c55BiOqEFLnXg0ob+r/tJ8N/+qfohELtBhPH60HVnHLwzXI
         +IuPVl58/tTXpQew/dWLNaVV3jjOj93wgpYZjVw5LNwtAwzUhtA6p9C0/hdKkmuP6CR+
         QMaxxLs7JQfs0dF+mIeYM5tNQB5wghhCxuG/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710341965; x=1710946765;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCinrcfC+9irVXRne3N2PTAFGdJZMBrm1hz95sPNsWY=;
        b=PypJUG2U6RzXN5ieXAB04YNASkZPjmnz14PVxanKvc2fCR3/llcVv88BPmT46ovkbZ
         lSMWf4x+RX0PkrM1YsUY8CKDyfUPf5zm6lvIW4LVJmJkH4/jYgiZpslhEg45CstXa6fK
         u37PFLm9INsD6/hhy7HwveDrjA2JeoUIOuvtObVZEEgdjrWBQ0EM1KwOYC9tKtU/o5do
         IfUFEsmVbC3/tVsVRKt4ZFbUhg4ljx+s2xlQivOyPiv20aOE+VNScxoPIJ0qNJWFW5ks
         0gXqbnE2oMeyCLujiwY+sBzHBb/Kz3gCNyxgtL9YXrObBKMfT7jDfTwQDW0wuDPM6nNJ
         yOaw==
X-Gm-Message-State: AOJu0YySCL+gkN0CjfCAJaHsA8MFybQ/x9qcd4VKBKfASqMVrUywhacH
	4PvWhw9Xx/16Rw9b0z7tasMoTU2yW805I7zF39yOIbKiG5rrQ54X7Zdj6rD2lsy8tYTveLKquad
	Ce5L4K+VjM1dmjFNw2gMz9wOj2K1v2riB03PaUfHWYhiiDONjBXY=
X-Google-Smtp-Source: AGHT+IHXpaLhuRlbbe0xRr3WNGSKgzdHHBq7QsmFWYXfAarQgLZuOI9iJptwCB2G6Xfl4uPiBhgHb/XBn5aSv+9Mtzk=
X-Received: by 2002:a50:8d55:0:b0:568:3362:ccdb with SMTP id
 t21-20020a508d55000000b005683362ccdbmr8734973edt.10.1710341965326; Wed, 13
 Mar 2024 07:59:25 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 13 Mar 2024 14:58:49 +0000
Message-ID: <CAO-mL=xXRaQUHh0HOnqm8d2FtNo8dsm8Dn1oX6Wb=qJ_4a-YNw@mail.gmail.com>
Subject: Mailing list changes
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Cc: advisory-board@lists.xenproject.org, committers@xenproject.org
Content-Type: multipart/alternative; boundary="00000000000049cf6406138c05af"

--00000000000049cf6406138c05af
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We recently discussed some mailing list changes in our last community call.

*Issue:*

   - Lists.xenproject.org software is outdated, DKIM, DMARC, ARC is no
   longer sufficient, and there's no clear update path from Mailman2 to
   Mailman3.

*Potential solution:*

   - Host them at https://subspace.kernel.org/ due to us being part of the
   Linux Foundation
   - No additional cost to the project

There was no objection to this during the call. For everyone else who was
not present, please feel free to give your feedback here on the
mailing list (should you have any).

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000049cf6406138c05af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>We recently discussed some=
 mailing list changes in our last community call.=C2=A0</div><div><br></div=
><div><b>Issue:</b></div><div><ul><li><a href=3D"http://Lists.xenproject.or=
g">Lists.xenproject.org</a> software is outdated, DKIM, DMARC, ARC is no lo=
nger sufficient, and there&#39;s no clear update path from Mailman2 to Mail=
man3.=C2=A0</li></ul><b>Potential solution:</b></div><div><ul><li>Host them=
 at=C2=A0<a href=3D"https://subspace.kernel.org/">https://subspace.kernel.o=
rg/</a>=C2=A0due to us being part of the Linux Foundation</li><li>No additi=
onal cost to the project</li></ul><div>There was no objection to this durin=
g the call. For everyone else who was not present, please feel free to give=
 your feedback here on the mailing=C2=A0list (should you have any).</div></=
div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div>=
<div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,13=
6)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Projec=
t=C2=A0<br></div></div></div></div></div></div></div>

--00000000000049cf6406138c05af--

