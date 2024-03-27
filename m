Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6388DA4A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 10:32:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698365.1089979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpPcy-0002Oc-ET; Wed, 27 Mar 2024 09:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698365.1089979; Wed, 27 Mar 2024 09:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpPcy-0002M6-7y; Wed, 27 Mar 2024 09:31:24 +0000
Received: by outflank-mailman (input) for mailman id 698365;
 Wed, 27 Mar 2024 09:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QT9J=LB=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rpPcw-0002Ll-L2
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 09:31:22 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5577440-ec1c-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 10:31:21 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-515a97846b5so3791908e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 02:31:20 -0700 (PDT)
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
X-Inumbo-ID: c5577440-ec1c-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711531880; x=1712136680; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=koxJKxoDPOt/Mr2zX1QIjQHPKfAETTJMiwi2l5XKzng=;
        b=eWO9xA1QPUsTTqKEqpx59ZCSxUXppRdX53TJBHbYcLM9Z9+bephPnS6vTajAN/MP7I
         P3ZC3VAFJYqdCCdnRezVguxz3Kps0D0iTdJPymULxbeMz1MXhAyw6VZHVgAsMtKnrIie
         t2zjgHLR66WBYjU2pD3ht164A2pYWIhfJn1RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711531880; x=1712136680;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=koxJKxoDPOt/Mr2zX1QIjQHPKfAETTJMiwi2l5XKzng=;
        b=fVYlUMIxJYg8oanfOtJUrqqE+YqR9SKWFnbzX+QbSS3OjCqoJFJ9mQEuOZ4RKmfw4s
         DQAqcJ5Ko358byVgCC4hbTuHINcFKXcDP/igtvrEKNmlEMiH2m2T/QZaQMjiw8fo6P3/
         gU2j9zo0ShjLf1jaX+stdSwGX7jkiJvyIBzciF7ZlfLHhvRTYr+xEjI9+uiVGIHHpEpg
         oJC5pg72IapbBFHTsUPTzIHiKDf++2crZa0Lw+WXLESMPO4BSPhY261pHjlxoHtgdTX3
         1O/jR+arXZsisvPn+Kbt8Ie3VwDv7pl/7uFEDOKoDSrUL3tpnYHRe6V4y6A7xukZRFSz
         WfZw==
X-Gm-Message-State: AOJu0YwYbBngKljmF+x3ONPT8gP3GB/r4bExIgToa0SM/SyeB+Kv360n
	XeS+Iyhk3FvnKnGC/re5OVZksB8KeIKRNPXVlvDchWCExvhMEAj7WLxPLvAuOwu0/gFGgnoD625
	Nm6LwULNh42WT+L8WqJUILtiknndcD6TE58O1d35s1Awnj0B7uD9DSQ==
X-Google-Smtp-Source: AGHT+IGMTlNdvpN2NyBi2+ESVNeUV8/1H9Zc6V7OoCi5BOuPG3UHbaFFD3qNXWDbJfwqfZ2aiK1dJlA0bUiTdjj3bxA=
X-Received: by 2002:ac2:5b43:0:b0:513:c957:ea4d with SMTP id
 i3-20020ac25b43000000b00513c957ea4dmr459238lfp.43.1711531879990; Wed, 27 Mar
 2024 02:31:19 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 27 Mar 2024 09:30:00 +0000
Message-ID: <CAO-mL=w6CsQw4G7BOC+8EKELVNZbJBiVpntc1ib-Jyf6kt1PCA@mail.gmail.com>
Subject: Xen Summit Early Bird Rates - Ends 31st March 2024!
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000bab4a00614a111d0"

--000000000000bab4a00614a111d0
Content-Type: text/plain; charset="UTF-8"

Hey everyone,

We've just announced our schedule for Xen Summit 2024 and can't wait to see
you all.

*Make sure to grab your early-rate tickets today, these end on 31st March
2024! *
Academics can also attend the event for free.

Tickets:
https://events.linuxfoundation.org/xen-project-summit/register/

Schedule:
https://events.linuxfoundation.org/xen-project-summit/program/schedule/

See you all there!

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000bab4a00614a111d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey everyone,</div><div><br></div>We&#39;ve just anno=
unced our schedule for Xen Summit 2024 and can&#39;t wait to see you all.<d=
iv><b><br></b></div><div><b>Make sure to grab your early-rate tickets today=
,=C2=A0these end on 31st March 2024!=C2=A0</b></div><div>Academics can also=
 attend the event for free.=C2=A0</div><div><br></div><div>Tickets:=C2=A0</=
div><div><a href=3D"https://events.linuxfoundation.org/xen-project-summit/r=
egister/">https://events.linuxfoundation.org/xen-project-summit/register/</=
a></div><div><br></div><div>Schedule:</div><div><a href=3D"https://events.l=
inuxfoundation.org/xen-project-summit/program/schedule/">https://events.lin=
uxfoundation.org/xen-project-summit/program/schedule/</a><br></div><div><br=
></div><div>See you all there!</div><div><br clear=3D"all"><div><div dir=3D=
"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><d=
iv style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"co=
lor:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></=
div></div>

--000000000000bab4a00614a111d0--

