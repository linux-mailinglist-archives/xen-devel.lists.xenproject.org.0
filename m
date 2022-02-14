Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C524B5221
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272276.467052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbk9-00038A-CI; Mon, 14 Feb 2022 13:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272276.467052; Mon, 14 Feb 2022 13:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbk9-000366-9P; Mon, 14 Feb 2022 13:50:17 +0000
Received: by outflank-mailman (input) for mailman id 272276;
 Mon, 14 Feb 2022 13:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQXP=S5=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1nJbk8-00035o-1f
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:50:16 +0000
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08dee25d-8d9d-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:50:14 +0100 (CET)
Received: by mail-yb1-xb2f.google.com with SMTP id p5so46057694ybd.13
 for <xen-devel@lists.xenproject.org>; Mon, 14 Feb 2022 05:50:14 -0800 (PST)
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
X-Inumbo-ID: 08dee25d-8d9d-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1c0SH3jWUDFfTtN5hWJdEwGITkAnPbf45zrLxr5j/M0=;
        b=byE0iBaNr3JsnFQgcvHS1FkB1rD8ddasHv17b+Vy1jhn/gnyHdAx595rMreWSM0tKc
         hHfS23MQFGCBp2leMpmYaLY9zzA6CeyBJEm4UKl49Bx3eSxepg7/7EqGXkQThCUaEHPs
         u355WCZ3rmrDTaUoHixEnb7H28n9JOpTr4ojGVUZgfQa6omQRlaOZ0ZBxVqOjEDr1BL2
         OG57F6lKP7kgmVsWLrVvR8HcWsWFfVIJyhh48mHzA97WI7AYWbBn7Q5WDphUL2WEq+wF
         GEIk8DNdGIVFpsfaBPBzGh2kKudOkclXmL1hLiyDbBHNY78QpoXa8e2ZpohFv9QWq0v7
         FROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1c0SH3jWUDFfTtN5hWJdEwGITkAnPbf45zrLxr5j/M0=;
        b=MnhumPZ3qx5/XIksv53mYerUvA4wOutu79tzsM9H0IQBHCoe6HUHkUF8QLk8SAurc0
         DjQB/wnGT+v1y/o4i0TRCsUGrEsbfzyAoD42d+Rq3ac1fI+35c7XbautXdVHrQJJZp2C
         m0K4kzdxgY01HYit77w/49eyvGlaaRL6bEuY1ovL2PWgDP5Rkh1I8Acf5qsdHl8S48uj
         iw1jsj5akmSPcv7BJ2k0cLwNjbb5U82eqc6SqyKZCuOwEuHVgyX0NidDpxegKpwwl/F2
         p9GR7gZsF1LE32izu5NTcOMyuK5QZuCAaiOu1jfUaNWeBbfjV10DPwIXBqw4ZyZDWy/Y
         Vv8g==
X-Gm-Message-State: AOAM531/0Leb7UkL6eKPfOgWiJ3w111fTClkBiL+CbidAhN1wd/J8lGD
	4prso2p11KxbVzvB8U7kGGgdYbt5JRVEyzhb4eEASOcy
X-Google-Smtp-Source: ABdhPJwmOmlutN5cgAhRqxd89gJArANZFouJ3zhGvFXoBdaOUvCGUhjFY+hEvvsTCQbYt5Ngk2n9bnXj97413JSNcg0=
X-Received: by 2002:a25:40b:: with SMTP id 11mr8911838ybe.110.1644846613510;
 Mon, 14 Feb 2022 05:50:13 -0800 (PST)
MIME-Version: 1.0
References: <YgcRbq4yJlKSonzj@mattapan.m5p.com>
In-Reply-To: <YgcRbq4yJlKSonzj@mattapan.m5p.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 14 Feb 2022 13:50:02 +0000
Message-ID: <CAFLBxZZ2BaoiaEVBevYwSjQdid4uSTFj9z1Nz21x+q5=x636rg@mail.gmail.com>
Subject: Re: Development Issue of Concern
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000001bbc4705d7fab27a"

--0000000000001bbc4705d7fab27a
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 12, 2022 at 1:46 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:

> The tradition has been to name the active development branch in GIT has
> been named "master".  Quite a number of people object to the name due to
> its history.
>
> In light of such concerns, perhaps the Xen Project should join with other
> similar projects and move to have the active development branch renamed
> "main"?
>

There was a general intention to do that switch a few years ago, but there
were some technical pieces missing.  Probably time to take another look.

 -George

--0000000000001bbc4705d7fab27a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 12, 2022 at 1:46 AM Elliott M=
itchell &lt;<a href=3D"mailto:ehem%2Bxen@m5p.com">ehem+xen@m5p.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The tradi=
tion has been to name the active development branch in GIT has<br>
been named &quot;master&quot;.=C2=A0 Quite a number of people object to the=
 name due to<br>
its history.<br>
<br>
In light of such concerns, perhaps the Xen Project should join with other<b=
r>
similar projects and move to have the active development branch renamed<br>
&quot;main&quot;?<br></blockquote><div><br></div>There was a general intent=
ion to do that switch a few years ago, but there were some technical pieces=
 missing.=C2=A0 Probably time to take another look.</div><div class=3D"gmai=
l_quote"><br></div><div class=3D"gmail_quote">=C2=A0-George<br></div></div>

--0000000000001bbc4705d7fab27a--

