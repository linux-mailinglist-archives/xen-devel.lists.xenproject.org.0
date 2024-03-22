Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76CE886BD4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 13:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696798.1087987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rndej-0000Gv-A9; Fri, 22 Mar 2024 12:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696798.1087987; Fri, 22 Mar 2024 12:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rndej-0000Db-6p; Fri, 22 Mar 2024 12:05:53 +0000
Received: by outflank-mailman (input) for mailman id 696798;
 Fri, 22 Mar 2024 12:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3R3m=K4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rndeh-0000DF-83
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 12:05:51 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a66e1b-e844-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 13:05:49 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56bcb9640bbso2195567a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 05:05:49 -0700 (PDT)
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
X-Inumbo-ID: 85a66e1b-e844-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711109148; x=1711713948; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VgOOwUO0PR7cdXwqLatf39deNDlV09pk6dcsKAWXI9E=;
        b=j8726WT3eYSNYRd66dCVoImDyLLcg9bTVFa+madBj5j3WRzgBo+UjRCP6Mqud1ivCh
         BqSbKV26ZOyhxhjhQXNj5DXAaDhcpoda/aTyV6YQw1DjSL8c6hwoAzvJYgCn57zbIYCy
         s5LBhUr7tMefwx1vt3CrXBXGNDUqTQyXFF+do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711109148; x=1711713948;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgOOwUO0PR7cdXwqLatf39deNDlV09pk6dcsKAWXI9E=;
        b=Z7W73Rmh44wcSb3RdPGtiGjHiny/0Bl0LC46x6xMGKK2yH8bZ5An8rtH6uShmPoN9q
         06n4yRGxPXlQ6mULbZRmLtY7z12o1dSXoJ22CbqsG4VkZ48NfaEBdrsCjvY7t/QzVn9+
         qqbYMj13xMUA1O2fFoiSF2osiPqudDH0TmyIqC8Rlt+mw45tnx+V0VUDwo7IRJh2dsLa
         Q54/VsgPzj99gisOeNrjp1KQQAgHhe7YMPle+NT8mNBjMyWJ7KUvNq3HNkIQEMQg8mAP
         jx+qUxpyfQ3mgX5HzRGQlVPrKKkGRjW+MuA9qr3MqEVkoeGyPPnLGi98C/vsrAMU0co0
         SneQ==
X-Gm-Message-State: AOJu0YymEejwMX2S/IKz6MoQuC+wdgWEL34JSMGVADe/LlAVAEdnb2+7
	i5Kzr/uW+/LXXgUItWbE7Egd8Ff+fbbkAlMQitnqcjW8M9ilE7W1vSiYIA9V9HVtjHBqYmJY8dH
	YVTFdmYu4zckd5mBwLbA2ncmLxFSkL3po+IY5M3pL/FUVXwWHCDc=
X-Google-Smtp-Source: AGHT+IGo+tbU5QUEbxTmKo0YWOeBxxO8mYaq6iO0GcgHdok6BQU8glPJOi7bTqRu86k++KdOIrsWywWLtPfsvwNFyyI=
X-Received: by 2002:a50:8a84:0:b0:568:949b:e91f with SMTP id
 j4-20020a508a84000000b00568949be91fmr1439045edj.36.1711109148287; Fri, 22 Mar
 2024 05:05:48 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 22 Mar 2024 12:05:12 +0000
Message-ID: <CAO-mL=wwdrqwGYAsdjGYh7CSeyY=PYa1gQs2R+e9XOGr9g5jtQ@mail.gmail.com>
Subject: Xen Summit Schedule announced!
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000f4c65b06143ea447"

--000000000000f4c65b06143ea447
Content-Type: text/plain; charset="UTF-8"

Hi all,

The much anticipated Xen Summit schedule
<https://events.linuxfoundation.org/xen-project-summit/program/schedule/>
is live!
Check out what talks will be available. We also have plenty of slots for
design sessions at the event for you to get involved in.

*Don't forget to secure your early bird rates today! These rates will end
on 31st March 2024.*
https://events.linuxfoundation.org/xen-project-summit/register/#register-now

See you all there.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000f4c65b06143ea447
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>The much anticipated <a href=3D=
"https://events.linuxfoundation.org/xen-project-summit/program/schedule/">X=
en Summit schedule</a> is live!=C2=A0</div><div>Check out what talks will b=
e available. We also have plenty of slots for design sessions at the event =
for you to get involved in.=C2=A0=C2=A0</div><div><br></div><div><b>Don&#39=
;t forget to secure your early bird rates today! These rates will end on 31=
st March 2024.</b></div><div><a href=3D"https://events.linuxfoundation.org/=
xen-project-summit/register/#register-now">https://events.linuxfoundation.o=
rg/xen-project-summit/register/#register-now</a><br></div><div><br></div><d=
iv>See you all there.=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div =
style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color=
:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div=
></div>

--000000000000f4c65b06143ea447--

