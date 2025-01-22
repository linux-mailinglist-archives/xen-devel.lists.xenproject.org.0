Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B097A1910D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 12:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875889.1286297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taZMK-0003qV-0u; Wed, 22 Jan 2025 11:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875889.1286297; Wed, 22 Jan 2025 11:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taZMJ-0003nZ-UG; Wed, 22 Jan 2025 11:57:23 +0000
Received: by outflank-mailman (input) for mailman id 875889;
 Wed, 22 Jan 2025 11:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzEB=UO=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1taZMH-0003nT-TK
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 11:57:21 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 085acbd6-d8b8-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 12:57:19 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so12387583a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 03:57:19 -0800 (PST)
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
X-Inumbo-ID: 085acbd6-d8b8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737547038; x=1738151838; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nm79P6NQOpbUxVOz/w/v/vi5vp2ye++U6SB3B9WBrQk=;
        b=gEmVK3uKzbgi9qWkKxuPbYHE4qO2QxPZ2Kd4RkfXE5bUxNSFAty+ALAvMRBGiISoZX
         W2W+cFNHDMkAD1T3GXslNUhu5NUg3FGeiTbn1TyM6QUIxaAD4iUYIPmKZrkTQLzbPbdg
         FitVALR+fRO9f1Ula6dCXtPETBgvu1s+VtQlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737547038; x=1738151838;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nm79P6NQOpbUxVOz/w/v/vi5vp2ye++U6SB3B9WBrQk=;
        b=AZ328GNz68J1aDWqkXjAPGOC2kW+s8joZoyUWkeHzSHryzlws9IKvvPfZTCAMKllaI
         Vb4td20kcESdFHIFxsNnkMI10EoZtZPmRbEAR/blQLb7PpMLTTyVHKBkhGQc+AX6i7E7
         8G+z/DfHes0SmWzN0LZBFcj0QSOFLcO5u73zjEOL1nnTteWPNyxqErm26FP+dAJnOf4r
         Az0Q1ogA+SLhj65qzGQDadXOnqVDyJhZkHARON4v+CYQxD9RCeqmw5kIg5JvgZFhCSZy
         ckp5/LS/kGs7TPvAFJtlUxVH16LJtLCTCgqTVquXR7Xvq2rtlrz/qZh1q0Fm3OIKcian
         J9AQ==
X-Gm-Message-State: AOJu0YyucEoaFAVrdf+2qqC8Gvp2lFElIFT7RwARVVjX3X/Onqk4istl
	TT/Ew6PR3zIOw7ktppAcPX0bmB79vu0tF+rK3atKvVlpJ5HGv/KdtSL9LPbuf7AkHrlzSbVjuei
	RL0MQAn0z13rjGvXbH1fK1KFTSlawayzZ/v/FXP2Hyq7LE3i2WYE=
X-Gm-Gg: ASbGncvog4wCAtZGjeftNahE9khvRX6k8FZJw6jxNE2+1KrYpB/qlr0acIXk3UR4nN0
	CBDQ/U+TUyIQccGiW9T4/tm5VMhJIYOi/RPp1G3llEtuK01LnLcmd4Ojk3NSXLft1jdwdk2iIi1
	wfG2lbaG7Htmue8zefkJc=
X-Google-Smtp-Source: AGHT+IFSkMgxXAIMWle+crTM+30t6YD+chTbMVe5o+Ae+vkAbLOzEzq5pUd/qOBvhXlB3vBTGieI2tRVxGwryrAyoIE=
X-Received: by 2002:a17:907:969f:b0:ab2:d721:ed8e with SMTP id
 a640c23a62f3a-ab38b42e688mr2243496866b.39.1737547038355; Wed, 22 Jan 2025
 03:57:18 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 22 Jan 2025 11:56:42 +0000
X-Gm-Features: AbW1kvZFsDqR5yA_pw6DfVgssdJoYd9tc2wolkoFRNJUZCIu9xTz9speJfu_Fo8
Message-ID: <CAO-mL=yv1MgVY+CNAf46xvTs1-cxFQo6bwL7cDOjr9ROfMZB-Q@mail.gmail.com>
Subject: Xen Project Grenoble Meetup - Schedule
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Olivier Lambert <olivier.lambert@vates.fr>
Content-Type: multipart/alternative; boundary="000000000000009ced062c4a3239"

--000000000000009ced062c4a3239
Content-Type: text/plain; charset="UTF-8"

Hi all,

The schedule for the Xen Project meetup has now been published.
https://cfp.vates.tech/xen-meetup-2025/schedule/

Hope to see you there!

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--000000000000009ced062c4a3239
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,=C2=A0</div><div><br></div><div>The schedule f=
or the Xen Project meetup has now been published.=C2=A0</div><div><a href=
=3D"https://cfp.vates.tech/xen-meetup-2025/schedule/">https://cfp.vates.tec=
h/xen-meetup-2025/schedule/</a>=C2=A0</div><div><br></div><div>Hope to see =
you there!</div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,</div><=
div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">Communit=
y Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"https://xen=
project.org/" target=3D"_blank">Xen Project</a><br></div></div></div></div>=
</div></div>

--000000000000009ced062c4a3239--

