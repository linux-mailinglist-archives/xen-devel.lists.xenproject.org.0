Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795DF908B83
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 14:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740630.1147748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI5sk-0008Mq-Hc; Fri, 14 Jun 2024 12:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740630.1147748; Fri, 14 Jun 2024 12:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI5sk-0008EX-EQ; Fri, 14 Jun 2024 12:18:14 +0000
Received: by outflank-mailman (input) for mailman id 740630;
 Fri, 14 Jun 2024 12:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ENa6=NQ=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sI5si-00086k-PC
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 12:18:12 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29bcb582-2a48-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 14:18:10 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6f1cf00b3aso331831966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 05:18:10 -0700 (PDT)
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
X-Inumbo-ID: 29bcb582-2a48-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718367489; x=1718972289; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gQ7XG3/WqyWP23l3ehKvs/mLQi2UWm2geje26JlAzdw=;
        b=AxRVbpZRjyalLQfEz4XlAQO+oAcvhfsPOelz5Yn5lNj/rTbhym4ieFM6idFHZqxHSo
         kSSxKKEBVtHuZZgVDcajT2dDVpDc9muOVDVHb7fyBOD3PpciA+3Dkh+xtSTQ2uOjZbVz
         1ZPfgsiI4FkuQkspEKiqfRUvHhZQgoe2lafrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718367489; x=1718972289;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQ7XG3/WqyWP23l3ehKvs/mLQi2UWm2geje26JlAzdw=;
        b=wnqI73BiP1OU3YqJk7A9kaF0dVmAj4wZCORPFTqadqvfkv+P5zZk8ZmQ4C33Za7+D2
         8zNWvz6z0NgsztvmbE7Jv1SX3xnrKtpxjgRzrSwBTiNcll77EC7t7oiZC9ZN3cfD6v1C
         U46a5T0KJFGkBx0V5fvm3XzCCakfE6hcl+++feAZxfU38SnqYShAK2NjIJXIG4eeGcMl
         DX3AN8R5I9+H4yga7rpxhPN2klcZomRj3cJ8sTldyjVeWOk7R4MFaRciSEhjSI0U4oC2
         m9tVwAhwlVABm5SQ2xG1VOakuzh8azTOMnIjbl0radaEYJvleAVzg1r0zwxQwRjXPDRd
         tz9w==
X-Gm-Message-State: AOJu0YzOy70Qw7C5+FISaWDzzvJCt22mk2n8qpranNLky9HQlchZ39sh
	MShij8q5G7oRbypNEWJ9UcVqfbQ1YsR8JzHoxnXjt2hCrzCHcAl7W+tW3dPJqyfKA1pz9+vHIEF
	rVX8V2aLC4+4UcuNplq2MvDgaetghJ3sjSWlHBZ4uEbytMF/qfdM=
X-Google-Smtp-Source: AGHT+IEi8nrtONktmz+LedoCsjvTQRCpwP4l8cBn2ougfq5zge/+4La6TDDUJrUaLT/ppg6VT1vEsudBpmn7INGiNp0=
X-Received: by 2002:a17:907:a70a:b0:a6f:657a:c9a2 with SMTP id
 a640c23a62f3a-a6f657acb32mr140515866b.25.1718367489053; Fri, 14 Jun 2024
 05:18:09 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 14 Jun 2024 13:17:33 +0100
Message-ID: <CAO-mL=xajGrkz7x+SFtz8U=N56TWY81N=2qsSwW0CnJeGJMaUQ@mail.gmail.com>
Subject: Xen Summit talks live on YouTube
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c77ed6061ad89b36"

--000000000000c77ed6061ad89b36
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We had a great few days filled with discussions and talks during the Xen
Summit in Lisbon.

These are now available for you to watch on YouTube!
https://www.youtube.com/playlist?list=PLQMQQsKgvLntZiKoELFs22Mtk-tBNNOMJ

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000c77ed6061ad89b36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>We had a great few days fi=
lled with discussions and talks during the Xen Summit in Lisbon.=C2=A0</div=
><div><br></div><div>These are now available=C2=A0for you to watch on YouTu=
be!=C2=A0</div><div><a href=3D"https://www.youtube.com/playlist?list=3DPLQM=
QQsKgvLntZiKoELFs22Mtk-tBNNOMJ" class=3D"gmail-linkified" target=3D"_blank"=
 rel=3D"noreferrer noopener" style=3D"box-sizing:border-box;background-imag=
e:initial;background-position:0px 0px;background-size:initial;background-re=
peat:initial;background-origin:initial;background-clip:initial;margin-botto=
m:0px">https://www.youtube.com/playlist?list=3DPLQMQQsKgvLntZiKoELFs22Mtk-t=
BNNOMJ</a><br></div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many =
thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:r=
gb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136=
)">Xen Project=C2=A0<br></div></div></div></div></div></div></div>

--000000000000c77ed6061ad89b36--

