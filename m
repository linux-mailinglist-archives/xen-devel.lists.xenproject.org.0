Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05D84DDF3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 11:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678067.1055124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY1Su-0001Gc-80; Thu, 08 Feb 2024 10:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678067.1055124; Thu, 08 Feb 2024 10:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY1Su-0001F5-3q; Thu, 08 Feb 2024 10:17:08 +0000
Received: by outflank-mailman (input) for mailman id 678067;
 Thu, 08 Feb 2024 10:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pa6k=JR=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rY1Ss-0001Eo-GR
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 10:17:06 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34c2c2fb-c66b-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 11:17:04 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5602500d1a6so1931436a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 02:17:04 -0800 (PST)
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
X-Inumbo-ID: 34c2c2fb-c66b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707387424; x=1707992224; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AbTGySjrskR5XP4hQZjlCOJWstAuPb2HAfUelcGxGZk=;
        b=IP8btcyJz00KIOzvLYKHSFGHr+V4/KwXdq425x6qIYTIlBfRN367/nzvtX02iTSrFT
         cPomNj1G8k8F0g6kpr2msmtgicatOwkVpWA9bVo/kKpfyUU53HXs/ienwhUcur8mcobB
         TLFh3wLkDAHWIWhJ6SOAT+YSoNWXfZj7y2/Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707387424; x=1707992224;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbTGySjrskR5XP4hQZjlCOJWstAuPb2HAfUelcGxGZk=;
        b=MWawtw5bE+fXne03kLh3S9CRM9iNq9q+OaJrVGkrJeyHx4le4B0Urhr0z5KTp8UR7+
         rGoO+XVXeUyZmTXY6GSg0IVCJ1r1e9F3ppt+ARhKAiXtEaAWK8Jwz399mWRsehH0W5oA
         HefMAj9gs3nx14JqbZP0f1Rb4qrGn7ycFL2D4xLxuufOSCFArEpTlAMbZNRroujE3ZE4
         LZShuYQBsNpYm+eX6c2LdqiRHTH1kuh3OGl+4c06cLUjIqnOVr58dnaYPBFp4v5m3L8K
         m81ip+4b9p/thc1Y2WEcPVVYVL7BE8NBUkNIA012dYerWDCU9IL1pxXI6stKQMghCfVJ
         WUNA==
X-Gm-Message-State: AOJu0YydKaEWrQrNuzBt85aW+4PTLa4BiVzN8gGlXkJXaZ6Xu2VjoMAP
	6MSEgQVK5xtF5W2aBh0NOXXMaMCFFmkQ7t2wI/6g6H5indt4aictXjyV5D/ZguOWg5Y+0lVmgMV
	cYD/mX9EfB1+S13+oE8zqTtuftjDqM0FFQMenT+hUEW30Kk1uJCgg4CrU
X-Google-Smtp-Source: AGHT+IHe6AGaed2PJn4jN/U3ncOM07HkK6LqNUDGKQihPy8aUtplZ92K1Nq9g7koR31K/hwd9Zj6lkuqHjm350FZr/A=
X-Received: by 2002:a17:906:319a:b0:a38:aa7f:bdd2 with SMTP id
 26-20020a170906319a00b00a38aa7fbdd2mr1539922ejy.59.1707387423669; Thu, 08 Feb
 2024 02:17:03 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 8 Feb 2024 11:16:28 +0100
Message-ID: <CAO-mL=wTYM8-=gUCJxew8gM+M6WvkVszroqVW8kJEiNLDZ-PHQ@mail.gmail.com>
Subject: CFP for Xen Summit 2024!
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e1d6ca0610dc1cca"

--000000000000e1d6ca0610dc1cca
Content-Type: text/plain; charset="UTF-8"

Hi all,

*A reminder that our CFP for Xen Summit 2024 closes in less than a month! *

We'd love to hear from you.

Submit your talk here:
https://events.linuxfoundation.org/xen-project-summit/

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000e1d6ca0610dc1cca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div><b>A reminder that our CF=
P for Xen Summit 2024 closes in less than a month!=C2=A0</b></div><div><br>=
</div><div>We&#39;d love to hear from you.</div><div><br></div><div>Submit =
your talk here:=C2=A0<a href=3D"https://events.linuxfoundation.org/xen-proj=
ect-summit/">https://events.linuxfoundation.org/xen-project-summit/</a></di=
v><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><d=
iv>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)=
">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=
=C2=A0<br></div></div></div></div></div></div></div>

--000000000000e1d6ca0610dc1cca--

