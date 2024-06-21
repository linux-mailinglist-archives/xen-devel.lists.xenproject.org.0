Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5407D912906
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 17:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745312.1152453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKfu3-0008Ar-4W; Fri, 21 Jun 2024 15:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745312.1152453; Fri, 21 Jun 2024 15:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKfu2-00088V-Uh; Fri, 21 Jun 2024 15:10:14 +0000
Received: by outflank-mailman (input) for mailman id 745312;
 Fri, 21 Jun 2024 15:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4PK=NX=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sKfu1-00084S-K0
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 15:10:13 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a32d3db-2fe0-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 17:10:10 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57d26a4ee65so1878722a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 08:10:10 -0700 (PDT)
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
X-Inumbo-ID: 5a32d3db-2fe0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718982610; x=1719587410; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wPb2b2fJ2ZScQtWz48fle1fCrQ89op+wO4Sa/WlrB0w=;
        b=T0Xz2TodYGW4U9S/QwCG29gQ2QoaGVRi9lpikPrMtr4uHsv1XPw2GN+PGFQFzAfhIt
         zUbvHuBeCPilikCH8ngJidlKSaeGU1hvzNWlgNQxwu7EyHSY1eCafLlK0f3ghwlPtYmp
         D+79uzvmAb9iGizPz8qDlWEfb/ozebDB/hD5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982610; x=1719587410;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPb2b2fJ2ZScQtWz48fle1fCrQ89op+wO4Sa/WlrB0w=;
        b=FIpIotgJT+pnKInYizXTuyqmb5O95/SJgKBrmpH8wKyaEjBbuFhCOgaLhvF3coWeIT
         ussLioG7hfy2riRXNZNmklHwZb/W/Wn4cClyfS2tOrJHBUjAH1H1DqI9Vqh9bNJYaIN8
         pvouBae/qRbMJqA1WKKpk+ca9PT3IKhtrHmR0yd+4xMdbskpasAVWM8MHCtJqc3aKhFG
         gUPht22dLvQIMXUzkj2XybXlW1Mvz6A6f+S8qUpUwdKfI0F72wk4U7X2AHh9DrWl+xXb
         OJ/ybi8HmQHJU3sFWiXMIQhEpypkHNH05JqMwssE0zf7HA9w0ffNqw9UgEah0LU/gf8s
         9MIQ==
X-Gm-Message-State: AOJu0YxOezEOMxX5vwUo8RKUVflW3mcTf/w8YUdki7h6ZJhTaMgIDo9T
	cFmckL7HquHKGfgD0VMD7i0ss6nv0KmMjZXXFF4lkUGgaeIS4cA7xugsr7NPQg+pg0IfOtypVso
	WtPH7egpqwGM82mQyMLgBkskW35lgCV4J2dRSFuYpC5r4JR74H4rSWw==
X-Google-Smtp-Source: AGHT+IELR8CKOEb0x/QUQK99GFfcyf2b+1UOWkK6oTJQ9nsCc5yGxnx6vmgo9+lQqLOY3XuGA6EtaYbEWKErc+pznl0=
X-Received: by 2002:a05:6402:1d07:b0:57d:f74:c4af with SMTP id
 4fb4d7f45d1cf-57d0f74c4c2mr4686529a12.1.1718982609502; Fri, 21 Jun 2024
 08:10:09 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 21 Jun 2024 16:09:33 +0100
Message-ID: <CAO-mL=ySoxhyXf71Qyob+3N1xuvvynjbEa8O7ERv8XeV0ouDCA@mail.gmail.com>
Subject: Check out our Xen Summit highlights video!
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d09ee1061b67d3d7"

--000000000000d09ee1061b67d3d7
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Check out our Xen Summit highlights video on YouTube:
https://www.youtube.com/watch?v=qZcCCm_PaHs&ab_channel=TheXenProject

What a great reminder of how important our summits are, and the community
behind it!

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000d09ee1061b67d3d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>Check out our Xen Summit h=
ighlights video on YouTube:</div><div><a href=3D"https://www.youtube.com/wa=
tch?v=3DqZcCCm_PaHs&amp;ab_channel=3DTheXenProject">https://www.youtube.com=
/watch?v=3DqZcCCm_PaHs&amp;ab_channel=3DTheXenProject</a>=C2=A0</div><div><=
br></div><div>What a great reminder of how important our summits are, and t=
he community behind it!</div><div><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div styl=
e=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb=
(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div></d=
iv>

--000000000000d09ee1061b67d3d7--

