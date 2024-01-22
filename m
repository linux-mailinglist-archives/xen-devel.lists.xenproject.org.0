Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA70D836298
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669795.1042226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRspM-0004B6-A8; Mon, 22 Jan 2024 11:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669795.1042226; Mon, 22 Jan 2024 11:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRspM-00049H-7W; Mon, 22 Jan 2024 11:50:56 +0000
Received: by outflank-mailman (input) for mailman id 669795;
 Mon, 22 Jan 2024 11:50:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wscu=JA=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rRspK-00047a-QT
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:50:54 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ed79c80-b91c-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 12:50:53 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-55817a12ad8so3293900a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 03:50:53 -0800 (PST)
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
X-Inumbo-ID: 7ed79c80-b91c-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705924253; x=1706529053; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=19UVWKeJFlw8622YiGJQdFJJuXBfX9IE6P3542eIXSM=;
        b=Id7NJgJRuJWHhdka4qQcvcr747rCjRwTgcLpIqbX0L6XY2M5y8uiWyA5Nzh5pDmwRS
         dOM6D6IwXSpjgO5G4xhkPJ4FQOsqJntq+uMKitjxPkOY2Vhnh7MsEX0cb9ve/bDLXLH5
         e2jD9xL/uvZTr3ilDJO8qCnnPe8CoZRRWopf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924253; x=1706529053;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19UVWKeJFlw8622YiGJQdFJJuXBfX9IE6P3542eIXSM=;
        b=Z5hdbB+WCTdiTva101IB4EMnAOzJeAsZibr22ySY+YIafOP6Ev64n6/q2hrJINA5fg
         IKhFkG3nC30R/f6h5+v7kF08zsnQP2LViK/VB+oQsJCYlECJSF4tydLa+rmLDvajUGVW
         368nvZhCyxNXjHOHYRX37Z+gV+5r+shebf1PI9liTiEBKspfRmMbJxhoV7YXruDvwYyy
         x9XUoBJDB73ifDXo47G1zi6F0ECSGXtSmfcZ/zicRJbppqVXtPJ6CVx0klneyS76ByLY
         Syv+e6GbCVzREZZMdegr8zjNM2RMFqgNxFAbpUXv+YqxVGGLh9tq6vPIdkENHzmdpbk1
         QpZg==
X-Gm-Message-State: AOJu0YyzlIVOgyWhcYD0ra6UWiF4pG++ad54E9zpA5ZMI4kJyVe78Nr+
	PpDCyN1OeSYA1e1yCzf0N+/6pPeonXLo4N+wIPklqads3+cjB9hx1GcUywqNhYbtxFyJpBf7AHg
	cIP/5JxYfadiNlD8E7Ewhp/+hkQUe6bRmhsH9wZAcBh0ZFor2MvibpZP042w=
X-Google-Smtp-Source: AGHT+IG9LwzaEVHH7JTjtvQT0q3TCkJ6+mpf0FyWNMbpdgJLuV22ol7Ua8H7vLHsredhIHKbk5rNcjzxzrJjh64UYT4=
X-Received: by 2002:a17:906:a93:b0:a30:39af:5016 with SMTP id
 y19-20020a1709060a9300b00a3039af5016mr938866ejf.104.1705924252642; Mon, 22
 Jan 2024 03:50:52 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 22 Jan 2024 11:50:16 +0000
Message-ID: <CAO-mL=zVL0+TQwgz6AzSm-E+BMPJvBo+J6=eSPYzH4bMXpVxbw@mail.gmail.com>
Subject: Community call recording: 18th January 2024
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000017c948060f877190"

--00000000000017c948060f877190
Content-Type: text/plain; charset="UTF-8"

Hi all,

After receiving community feedback, our monthly calls will be recorded.
This will enable members who couldn't attend on the day to listen in on
discussions.

Currently, these are unlisted and published on our new YouTube channel.
Only users with the specific link below will be able to access the
recording.

https://youtu.be/eIkPU6l4bzY?si=bBH2J2SF13KwAga6

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000017c948060f877190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>After receiving community=
 feedback, our monthly calls will be recorded.</div><div>This will enable m=
embers who couldn&#39;t attend on the day to listen in on discussions.=C2=
=A0</div><div><br></div><div>Currently, these are unlisted and published on=
 our new YouTube channel. Only users with the specific link below will be a=
ble to access the recording.</div><div>=C2=A0</div><div><a href=3D"https://=
youtu.be/eIkPU6l4bzY?si=3DbBH2J2SF13KwAga6">https://youtu.be/eIkPU6l4bzY?si=
=3DbBH2J2SF13KwAga6</a>=C2=A0<br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><br></div><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><di=
v><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=
=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></=
div></div></div>

--00000000000017c948060f877190--

