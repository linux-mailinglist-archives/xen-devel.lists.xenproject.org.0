Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E72B94BDAB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774011.1184522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2PH-0000bA-Ub; Thu, 08 Aug 2024 12:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774011.1184522; Thu, 08 Aug 2024 12:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2PH-0000Zg-Ra; Thu, 08 Aug 2024 12:38:15 +0000
Received: by outflank-mailman (input) for mailman id 774011;
 Thu, 08 Aug 2024 12:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QhG=PH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sc2PG-0000ZV-AY
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:38:14 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13a470f8-5583-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 14:38:13 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a309d1a788so916782a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 05:38:13 -0700 (PDT)
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
X-Inumbo-ID: 13a470f8-5583-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723120692; x=1723725492; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=55XU62OwrbRE56FeEwBbVUODmHZOLnWUZZQcJPhxs/g=;
        b=TjzMcu0FPYwZ3admPkEgaiyo+7MJz1MojbhBVkE9g4tYGkb/zk4cJ/rf74G/nivTtd
         6Es4LLIkuNgulA3ntWRDTb7pm5xo/ONGcoCoo9KGnk3vTwnNE62QACHBsbNjV1yUJMEC
         fyWnHXZj8Zk3U6w+j0gmGQE7agIXXDVI1QxGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723120692; x=1723725492;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55XU62OwrbRE56FeEwBbVUODmHZOLnWUZZQcJPhxs/g=;
        b=j0kMJrtnA2W2ddEadcQp5W0Rd7h2uyWAQjn2vEbnMLrmcf7I4SMZ5UfI6eqAlkpt8b
         AhAUAhd9Pa4USPIpcxfcCz7XtQ6pXkLNvGg6t5iLdB587Nd4KvUUloh12yWYzcEK2VHJ
         UmBqjD3BYdYtIHQXyhOq0N96yoY8k63wyVCptAXMgexBjMl0nKsYbyNxG+XHKR6eQ/Bd
         LB2lR5N3q61ZUGRL/5fNV8rMU1Uz6tCmNXKyIowQSnIGLqLXQVlPBN+8viW1lDTs6C0w
         SkxpdqvSG0ljOw+SitMLKp2R1WLRuFqpBfi3wvdVlKlkvJ9X7ACl9/9EwFEO9Go19fH/
         nfaw==
X-Gm-Message-State: AOJu0YzlUVMbotdRgRXV7h3vf+nOfpGao9oJgyBhZQVYmOQxlZWffZbI
	otgCZ2CZzBbJBIatSdOU/Aui+B7W9IybIOZR8U783FqeDfwUczPs2M+6Rd4fQXPbj6WacGN6omU
	Hw9A2eveOymYSBNL4UJ0IeSjXTHfY4egchHKwF6AewHUdeLv+S8wgZA==
X-Google-Smtp-Source: AGHT+IEF0yHfD/OfNb/iEL++ru35DvH+3RPQjcGRl9TxWNfKEUU0Hc+ff8dJR+qMlsjj806sCSt5s0Tj8zX39Hq75+k=
X-Received: by 2002:a17:907:7e8b:b0:a7a:b385:37cd with SMTP id
 a640c23a62f3a-a8090dafd3fmr136769666b.30.1723120691338; Thu, 08 Aug 2024
 05:38:11 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 8 Aug 2024 13:37:35 +0100
Message-ID: <CAO-mL=zBMvaazPHCpVDZuJ_i5bjOeJXq8T3TvwBeQSWrv6iciA@mail.gmail.com>
Subject: Call for help - Xen user documentation
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000b67dcd061f2b4c38"

--000000000000b67dcd061f2b4c38
Content-Type: text/plain; charset="UTF-8"

Hi all,

As you'll know we've been working on an initiative to update documentation
so that others in the community find it easier to learn about the Xen
Project.

@Alejandro Vallejo <alejandro.vallejo@cloud.com> has kindly started our
Sphinx user documentation but we need your help adding to this!

*All members of the community can contribute to this. *

*GitLab Link: *https://gitlab.com/xen-project/people/agvallejo/xen-userguide
*User facing link: *
https://xen-project.gitlab.io/people/agvallejo/xen-userguide/introduction.html

Once we have enough in our get started documentation, we will look to move
it into the Xen namespace.

*Why is this important?*
Documentation and user guides may take time to create, but ultimately they
help us by attracting new members into the community and getting more
people involved with Xen. As a project we want more people contributing,
helping with reviews, and engaging. To do this, we need to have guides in
place to allow them to get started!

We appreciate this is a community effort, and any time or resource you can
contribute will help the Xen Project project thrive.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000b67dcd061f2b4c38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>As you&#39;ll know we&#39;ve be=
en working on an initiative=C2=A0to update documentation so that others in =
the community find it easier to learn about the Xen Project.=C2=A0</div><di=
v><br></div><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:alejandro.vallejo@cloud.com" tabindex=3D"-1">@Alejandro Vallejo<=
/a>=C2=A0has kindly started our Sphinx user documentation=C2=A0but we need =
your help adding to this!=C2=A0</div><div><br></div><div><b>All=C2=A0member=
s=C2=A0of the community can contribute to this.=C2=A0</b></div><div><br></d=
iv><div><b>GitLab Link:=C2=A0</b><a href=3D"https://gitlab.com/xen-project/=
people/agvallejo/xen-userguide">https://gitlab.com/xen-project/people/agval=
lejo/xen-userguide</a></div><div><b>User facing link:=C2=A0</b><a href=3D"h=
ttps://xen-project.gitlab.io/people/agvallejo/xen-userguide/introduction.ht=
ml">https://xen-project.gitlab.io/people/agvallejo/xen-userguide/introducti=
on.html</a></div><div>=C2=A0</div><div>Once we have enough in our get start=
ed documentation, we will look to move it into the Xen namespace.=C2=A0</di=
v><div><br></div><div><b>Why is this important?</b></div><div>Documentation=
=C2=A0and user guides may take time to create, but ultimately=C2=A0they hel=
p us by attracting new members into the community and getting more people i=
nvolved with Xen. As a project we want more people contributing, helping wi=
th reviews, and engaging. To do this, we need to have guides in place to al=
low them to get started!=C2=A0</div><div><br></div><div>We appreciate this=
=C2=A0is a community effort, and any time or resource you can contribute wi=
ll help the Xen Project project thrive.=C2=A0</div><div><br></div><div><div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br><=
/div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div><div=
 style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></=
div></div></div></div>

--000000000000b67dcd061f2b4c38--

