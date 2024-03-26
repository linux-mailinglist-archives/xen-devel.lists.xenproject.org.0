Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A434D88C009
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 11:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698004.1089319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp4Ur-0002Uc-Oo; Tue, 26 Mar 2024 10:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698004.1089319; Tue, 26 Mar 2024 10:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp4Ur-0002Nn-L3; Tue, 26 Mar 2024 10:57:37 +0000
Received: by outflank-mailman (input) for mailman id 698004;
 Tue, 26 Mar 2024 10:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6Ae=LA=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rp4Uq-0002JT-AZ
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 10:57:36 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a66a23db-eb5f-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 11:57:34 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a46cca2a979so313226766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 03:57:34 -0700 (PDT)
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
X-Inumbo-ID: a66a23db-eb5f-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711450653; x=1712055453; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lh6B8CHuzyOOd1+Ai6KB5EaERHcxQgMVWPPoH2rBX/0=;
        b=iW2+K23Od2YpCrQ4xMxdXtWNd32YMR+vkX9yUSBvzuOmBHupnBpRwWjjib8cw7HdVW
         qcJuYo0kWrqBgrGze6HXKD7uVNyw2YQCSJ25ManWDrT+PcnMYfjnyzVEXUkJDL0DRjz4
         bc/kkdK2wJS6A8gt6W9AerwjTlcmmZNC8qfmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711450653; x=1712055453;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lh6B8CHuzyOOd1+Ai6KB5EaERHcxQgMVWPPoH2rBX/0=;
        b=tafUbTqX0kqgA6mPONhwAFy7IMKOhuF2c3W6TwpAPvbMdsma18mYhzqx25Vb0PAVJL
         SAYbwlGJXJSpcz6lZYHwsrud/QkT0HgNwEtrLyLMgwRD8RcBavKyOE3oLp46R/q7irke
         49QB2z8vB3SXKFNc4vxTj3j+TVeoSLvwnYgiWLA6no1qvgHWzaW4nba8f8aCO7X/yH/5
         En8nnZ4DSAHZe4kKVlPHuItL1PnpCOomka421mCX8gjDshY59UzKGF/N/QizvqQZFyBF
         SHoh1fRQusOMZCGISJJGPMOA3cYEKRCfej1JXytYBCdKiIdgteNHwpL24KMtZpuAfiUv
         7DNQ==
X-Gm-Message-State: AOJu0YymsUY5kYzs6hoHZ2d6XyrV3Vjf4CXpk4JGqrN4iEcu5AAzwwZR
	OUzfJFOWiExvvHoM8i3b+s6nJu5yu9o/6lyyMLQh0vsuzoueOdI2wppS8tXUH5leAlx4Z0BFpTe
	vQcIH/DIS6bk6FqpNw941f+PancDF+Fb8+Z4+Py3e7eX0jzRyfD98Nw==
X-Google-Smtp-Source: AGHT+IFLCUe8qdyPQRnk9kvh8FnKocukw1RUsoSwW2IG35UNzuxL1QyR9FTIFi1BLSbZ4ZErLTpxnDlyehLiUey/sXc=
X-Received: by 2002:a50:d651:0:b0:566:ab2b:e1ce with SMTP id
 c17-20020a50d651000000b00566ab2be1cemr8266493edj.18.1711450653418; Tue, 26
 Mar 2024 03:57:33 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 26 Mar 2024 10:56:57 +0000
Message-ID: <CAO-mL=zPdh_d6nbwU4aKKE0FCKnL74TDJmc9mzEjqi_iX23n1g@mail.gmail.com>
Subject: Join the conversation on Matrix
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003f8e9e06148e284e"

--0000000000003f8e9e06148e284e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Xen Community,

We welcome all new and existing members to join the conversation.

Other than mailing lists, most of us are active on Matrix.

Join us below:

*XenProject* <https://matrix.to/#/#XenProject:matrix.org>
For general queries and updates about the software. This channel is mainly
for users and community members.

*XenDevel* <https://matrix.to/#/#XenDevel:matrix.org>
For developers =E2=80=93 if you have submitted patches to the developer mai=
ling
lists or are otherwise active on them, this channel is for you. It=E2=80=99=
s also
the best place to ask development-related questions to the Xen Project.

*XenSocial* <https://matrix.to/#/#XenSocial:matrix.org>
For community introductions, tech news, and your watercooler chats.

Don't forget to introduce yourself!

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000003f8e9e06148e284e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Xen Community,<div><br></div><div>We welcome all new=
 and existing members to join the conversation.</div><div><br></div><div>Ot=
her than mailing lists, most of us are active on Matrix.=C2=A0</div><div><b=
r></div><div>Join us below:</div><div><br></div><div><a href=3D"https://mat=
rix.to/#/#XenProject:matrix.org"><b>XenProject</b></a></div><div>For genera=
l queries and updates about the software. This channel is mainly for users =
and community members.</div><div><br></div><div><a href=3D"https://matrix.t=
o/#/#XenDevel:matrix.org"><b>XenDevel</b></a></div><div>For developers =E2=
=80=93 if you have submitted patches to the developer mailing lists or are =
otherwise active on them, this channel is for you. It=E2=80=99s also the be=
st place to ask development-related questions to the Xen Project.</div><div=
><br></div><div><a href=3D"https://matrix.to/#/#XenSocial:matrix.org"><b>Xe=
nSocial</b></a></div><div>For community introductions, tech news, and your =
watercooler chats.</div><div><br></div><div>Don&#39;t forget to introduce y=
ourself!</div><div><br></div><div>Many thanks,</div><div><div><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(1=
36,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">X=
en Project=C2=A0<br></div></div></div></div></div></div></div>

--0000000000003f8e9e06148e284e--

