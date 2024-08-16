Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A6954C57
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 16:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778644.1188684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sexu3-0002Mr-Ir; Fri, 16 Aug 2024 14:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778644.1188684; Fri, 16 Aug 2024 14:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sexu3-0002L6-GG; Fri, 16 Aug 2024 14:26:07 +0000
Received: by outflank-mailman (input) for mailman id 778644;
 Fri, 16 Aug 2024 14:26:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+L=PP=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sexu1-0002Kw-Fc
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 14:26:05 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76e41a6f-5bdb-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 16:26:02 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a9a369055so235741766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 07:26:02 -0700 (PDT)
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
X-Inumbo-ID: 76e41a6f-5bdb-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723818361; x=1724423161; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xbi7dqEqdd2u3TwxekB4Gc0/AJ4Lwz6c08gnuwlOWKE=;
        b=ZsgCxBxVSwax6IMLL6HzMnHakiKRaDULHEVwGQlRyD0HbMGKjTA9YURV6O1BLGyN53
         G6wBu99jfNlmTy0nOcfvaQ2Q+X69Y3ZrvWLz0MnYamLQw4YNhQjNOVT9Ix3B3H5cDysv
         JnusD1NpX6mVuUD5BOCGHE02vwnHJL4wbM29o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723818361; x=1724423161;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xbi7dqEqdd2u3TwxekB4Gc0/AJ4Lwz6c08gnuwlOWKE=;
        b=arL1lFaKHo/bZq3UJREBii4gLUYHz31wfudh5B6N2MiKUAUEknQWtWGdTvSRzMLeyw
         sSwaL6f2UtqNuLA/tiYklrzYNU9pvSe3eZQ3EMgc0yoKOEZUT9bGfBWIM1lQX83NM2Zc
         V3SUzXJGsXJ3Ng1h98mZKCChrePl5OZi3UEY5VgLE/YPPS7cFxYSOpaqXu6s7YyfifZG
         an0BDdufPa6ERPsE6dRIBBv2iN1QnJXi4lkVKGZUZTENXqnavgByguLpFnFByNFx9bJx
         n9k8XYsmHuKErKN9HMgfz6oWzk3T+z++enZX5m/YBkxaQWroiUlPjy/hTm8VQK/phU6Y
         BPTA==
X-Gm-Message-State: AOJu0YxUEqacQmfxmYtd05uepfqH3HWts10snaVpzOo3t6509UX1jz3B
	AGhLfpSgH0gJp2EG4kLtRg082JqicxNlfctqzEyd7YWckvod/DhWwNl/BqHIQGVonh8Gv62ADNj
	DucFXaiIlH8lbijlskpaedIHWKQrYElsU6IMjL+Ac8VQKA/MyYTw=
X-Google-Smtp-Source: AGHT+IH8jcgWbPryZHcOIGi7Gvc3xZzN+vKDxWduQ3fF4PAl8wIJO4RWG+A3oXn/zd9VGwycpvBGQF+aDBwlGLQgvTY=
X-Received: by 2002:a17:906:d54c:b0:a7d:e956:ad51 with SMTP id
 a640c23a62f3a-a839293010dmr255650066b.21.1723818360963; Fri, 16 Aug 2024
 07:26:00 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 16 Aug 2024 15:25:25 +0100
Message-ID: <CAO-mL=zWYsDGkBoDtc8erGfAFnaR1y+FaLKsx3pEJ3MgxKAy0Q@mail.gmail.com>
Subject: Xen Project statistics help
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="000000000000102deb061fcdbd20"

--000000000000102deb061fcdbd20
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm looking for a way to gather some statistics around our project, that
would help monitor the health of the community and show our progress so
far.

AFAIK, there used to be a dashboard on https://xen.biterg.io/ (
https://wiki.xenproject.org/wiki/Code_Review_Dashboard) which no longer
exists.

Examples of monthly data required:

   - Number of commits, reviews, authors, etc per month/release
   - Number of contributions per individual and company (we'd need to do
   some mapping of names for those with multiple email addresses)
   - Data to help identify imbalances between reviewers and contributors
   - Number of emails on xen-devel

Linux Foundation does have a dashboard
<https://insights.lfx.linuxfoundation.org/> that we're not set up on yet,
but I'm looking at possibilities to see if we can.

If there is an automated process or script that someone has or would be
able to create, that would be hugely beneficial. Open to other ideas here
too.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000102deb061fcdbd20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m looking for a way to ga=
ther some statistics around our project, that would help monitor the health=
 of the community and show our progress so far.=C2=A0</div><div><br></div><=
div>AFAIK, there used to be a dashboard on=C2=A0<a href=3D"https://xen.bite=
rg.io/">https://xen.biterg.io/</a> (<a href=3D"https://wiki.xenproject.org/=
wiki/Code_Review_Dashboard">https://wiki.xenproject.org/wiki/Code_Review_Da=
shboard</a>) which no longer exists.=C2=A0</div><div><br></div><div>Example=
s of monthly data required:</div><div><ul><li>Number of commits, reviews, a=
uthors, etc per month/release</li><li>Number of contributions per individua=
l and company (we&#39;d need to do some mapping of names for those with mul=
tiple email addresses)</li><li>Data to help identify imbalances between rev=
iewers and contributors</li><li>Number of emails on xen-devel</li></ul><div=
>Linux Foundation does have a <a href=3D"https://insights.lfx.linuxfoundati=
on.org/">dashboard</a>=C2=A0that we&#39;re not set up on yet, but I&#39;m l=
ooking at possibilities to see if we can.</div><div><br></div><div>If there=
 is an automated process or script that=C2=A0someone has or would be able t=
o create, that would be hugely beneficial. Open to other ideas here too.=C2=
=A0</div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><di=
v>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)"=
>Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=
=C2=A0<br></div></div></div></div></div></div></div>

--000000000000102deb061fcdbd20--

