Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830F7FF341
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644958.1006668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ij1-0002Ot-Po; Thu, 30 Nov 2023 15:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644958.1006668; Thu, 30 Nov 2023 15:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ij1-0002ML-NB; Thu, 30 Nov 2023 15:13:11 +0000
Received: by outflank-mailman (input) for mailman id 644958;
 Thu, 30 Nov 2023 15:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZmE5=HL=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r8ij1-0002MF-4T
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:13:11 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8f355a8-8f92-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 16:13:10 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a187cd4eb91so117126166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 07:13:10 -0800 (PST)
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
X-Inumbo-ID: f8f355a8-8f92-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701357189; x=1701961989; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=en2qWV6gd6X60S07WN8Z5awnuTkrelPJjx0uApjIJAs=;
        b=GkirZllYsd+/W/U3bBb2r6cnQKyE3LT9xiPtxHymt94Qw6qVJB2ttKhx6+8vCMqr5a
         D2QVIDuRHjLNZxJFXgHZm1+niwlJmqgInEIsYTYrT5pw82NwJ7PrsTxb6NuZfrAkLIxi
         U8pHCdi3xFWdwH1ASVdsZjB4pSVC6CsnebNrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357189; x=1701961989;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=en2qWV6gd6X60S07WN8Z5awnuTkrelPJjx0uApjIJAs=;
        b=LNEfaMjUkG3kIRwAsiaAt7o3uUw5gse85ZFNdeL7qlNK+qk/gHrXWokpzNJV1epFjF
         MRZ1ORToMkIr1qBOrlrGsmWaASzYfSj6BRb29zaKsyOAa2eM08eeAkNCc5HyLZInmBAl
         u7NDLr+Tnooe6Rmu+V2DpZFpZj7upAjAmb+vZbmv6UCC4nxs80TV1rWEBr4e08j93s5Y
         o8Lu4TadUeZcUp4co085np/5dm8NdPeaALexdTD8850vaprSAn9M9m8pfnKJGZZUitL7
         eqipJS7Fc4smp9Z62karIoAK20MrYEA9RjK736fe+gYVP/eXDbMBCQVX5MIFmLmlNHoq
         Z3uA==
X-Gm-Message-State: AOJu0Ywjm0OHNkMWMSS5TznfN76k3SZCWQnDkr7r/xBI0ctamTPiE+Wq
	Zw9wUqX9DuiK5Z82i4MGdZ4dHfO4gbr8u97nj1aDkFKtyJicDDhoOylczg==
X-Google-Smtp-Source: AGHT+IG9HrOnmG3LeBZq3CrJeB1WGXpwQAKFJfUUlBsVoYPRlI3izBTje7EvnUMLF6tDWST0HMbyTMgg0r6cZb3sk1I=
X-Received: by 2002:a17:906:c08:b0:a18:ed83:ccc0 with SMTP id
 s8-20020a1709060c0800b00a18ed83ccc0mr761354ejf.28.1701357189262; Thu, 30 Nov
 2023 07:13:09 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 30 Nov 2023 15:12:33 +0000
Message-ID: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
Subject: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e71461060b601668"

--000000000000e71461060b601668
Content-Type: text/plain; charset="UTF-8"

Hi all,

There have been a few discussions about how we use documentation wording
within the community. Whilst there are differences in opinions and
perceptions of the definition, it would be helpful to see a wider consensus
of how we feel.

*Discussion: Should we use the term 'broken' in our documentation, or do
you think an alternative wording would be better? If you agree or disagree,
please vote as this will impact future discussions. *

I have purposely made the vote between two options to help us move in a
forward direction.

*PLEASE VOTE HERE. Deadline 15th December 2023.
<https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cYpZdluWo/>*
*Your name will be required but will be private. If you answer anonymously,
your vote will not count. This is to ensure it is fair and each person gets
one vote. *

As an open-source project, we need to come to a common ground, which
sometimes means we may not personally agree. To make this fair, please note
the final results will be used to determine our future actions within the
community.

If the majority votes for/against, we will respect the majority and
implement this accordingly.

Many thanks,
Kelly Choi

Xen Project Community Manager
XenServer, Cloud Software Group

--000000000000e71461060b601668
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>There have been a few dis=
cussions about how we use documentation wording within the community. Whils=
t there are differences in opinions and perceptions of the definition, it w=
ould be helpful to see a wider consensus of how we feel.=C2=A0</div><div><b=
r></div><div><b>Discussion: Should we use the term &#39;broken&#39; in our =
documentation, or do you think an alternative wording would be better? If y=
ou agree or disagree, please vote as this=C2=A0will impact future=C2=A0disc=
ussions.=C2=A0</b></div><div><b><br></b></div><div>I have purposely made th=
e vote between two options to help us move in a forward direction.</div><di=
v><br></div><div><b><font color=3D"#ff0000"><a href=3D"https://cryptpad.fr/=
form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cYpZdluWo/">PLEASE VOT=
E HERE. Deadline 15th December 2023.</a></font></b></div><div><i>Your name =
will be required but will be private. If you answer anonymously, your vote =
will not count. This is to ensure it is fair and each person gets one vote.=
=C2=A0</i><br></div><div><br></div><div>As an open-source project, we need =
to come to a common ground, which sometimes means we may not personally agr=
ee. To make this fair, please note the final results will be used to determ=
ine our future actions within the community.=C2=A0</div><div><br></div><div=
>If the majority votes for/against, we will respect the majority and implem=
ent this accordingly.=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div =
style=3D"color:rgb(136,136,136)">Xen Project Community Manager</div><div st=
yle=3D"color:rgb(136,136,136)">XenServer, Cloud Software Group</div></div><=
/div></div></div></div></div>

--000000000000e71461060b601668--

