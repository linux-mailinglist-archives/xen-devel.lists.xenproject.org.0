Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C08A2BC0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 12:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704479.1100910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvDj8-0006xD-M8; Fri, 12 Apr 2024 10:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704479.1100910; Fri, 12 Apr 2024 10:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvDj8-0006vT-J3; Fri, 12 Apr 2024 10:01:46 +0000
Received: by outflank-mailman (input) for mailman id 704479;
 Fri, 12 Apr 2024 10:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=byEo=LR=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rvDj7-0006vI-G0
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 10:01:45 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aabee1f5-f8b3-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 12:01:44 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56fd7df9ea9so821272a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 03:01:44 -0700 (PDT)
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
X-Inumbo-ID: aabee1f5-f8b3-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712916103; x=1713520903; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rEYEG3E/bxKKNMNPRUKo9Yro6SKy06FmbafxKnDXUoI=;
        b=MZ0yM2ed4z5MCabPHlDprEucoMXg1L1VHAIp/z69mUKTVa3WtsNDVoBnbf5xpY0jUO
         gOHw0spmP6aW9lDAjtVR0e20fsOIgRJsEGQXag4h7xAMJSPGeAYLGUjReMxaWg0fcV+4
         1tQNM1C7nUqSOXfIrc/lHsn/6ZRwqbOuZYYQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712916103; x=1713520903;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEYEG3E/bxKKNMNPRUKo9Yro6SKy06FmbafxKnDXUoI=;
        b=T3fAxubnbSNXLm0Nb4Q2TdU4roJBl7Z9M7D199Qnxn65b4mTwWJobFkQJqPnmmkZYq
         VXKLAXS3ZiniuFPX20hPkkYeTETnZJXjxPTk3UfRQPFdB3zXMa34nbbgckUL8gdoLv4Q
         hWMt2sMoWf2QgUMLc4cvy9CguwTRWHYckvEoYbY/wcJSWv1327/0ScAn8c043+/d7VaU
         cJKcTzPCsAj/RwlUxj8Rsi6xGuVttoFv8jA2EUkyDbFZ3xpB8uGKFV76xLN5/i2/ud2A
         2TqATwJvpm98vVwPi6+jo3QQEXAO60JSJGlgzopc8LV/4AJ98vCGzO3lE8+rDj7ruzSw
         2ckQ==
X-Gm-Message-State: AOJu0YydIkIE/RKB/U7JWqzI8B6i7dmsT+wAkkjy37gDEjBP3cFqmzG7
	BS8gfh/fMSVyGip9gHScRWAYxHjV1llAd5ToHCNKiGTpPUPeyltyUZaO58XjMJB3vgnHEAnb1lX
	C/DjJzuxLGeP5YEgOfQnZOgYRMThVjaGXBtcJPE6ZBNaVVmxnwJfI5Q==
X-Google-Smtp-Source: AGHT+IG7HkrVYvrdbGmvSAn5UbWE2cH7/RW5fEDVGMyP1ABjY1pnN6EgrbkTtarTgKg6gtNKDoQl8ZzozFndN7yNQUw=
X-Received: by 2002:a50:d79c:0:b0:56c:3b74:ea4 with SMTP id
 w28-20020a50d79c000000b0056c3b740ea4mr1540494edi.21.1712916103467; Fri, 12
 Apr 2024 03:01:43 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 12 Apr 2024 11:01:07 +0100
Message-ID: <CAO-mL=wZeLmvE+M8XQWQ4RveraOfgnFNc1gxTFSWoh8J2SvbYA@mail.gmail.com>
Subject: Xen Summit: Travel scholarships deadline today!
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e0b4410615e35b0d"

--000000000000e0b4410615e35b0d
Content-Type: text/plain; charset="UTF-8"

Hi all,

We love to give everyone from the community a chance to join our annual
event, Xen Summit.
This is why our project has allocated a small fund to help support those
who wish to attend, who otherwise may not have been able to without
financial assistance.

Travel scholarships are still available, but the deadline is *today!*

Please apply using this link:
https://events.linuxfoundation.org/xen-project-summit/attend/scholarships-travel-funding/#scholarships

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000e0b4410615e35b0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We love to give everyone from t=
he community a chance to join our annual event, Xen Summit.</div><div>This =
is why our project has allocated a small=C2=A0fund to help support those wh=
o wish to attend,=C2=A0who=C2=A0otherwise may not have been able to without=
 financial assistance.</div><div><br></div><div>Travel scholarships=C2=A0ar=
e still available, but the deadline is <b><u>today!</u></b></div><div><br><=
/div><div>Please apply using this link:</div><div><a href=3D"https://events=
.linuxfoundation.org/xen-project-summit/attend/scholarships-travel-funding/=
#scholarships">https://events.linuxfoundation.org/xen-project-summit/attend=
/scholarships-travel-funding/#scholarships</a></div><div><br clear=3D"all">=
<div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><=
br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div>=
<div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></di=
v></div></div></div></div>

--000000000000e0b4410615e35b0d--

