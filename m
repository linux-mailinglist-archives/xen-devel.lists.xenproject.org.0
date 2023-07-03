Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE2B745ACC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 13:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558059.871849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGHTQ-0000rt-Ta; Mon, 03 Jul 2023 11:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558059.871849; Mon, 03 Jul 2023 11:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGHTQ-0000ot-QO; Mon, 03 Jul 2023 11:12:04 +0000
Received: by outflank-mailman (input) for mailman id 558059;
 Mon, 03 Jul 2023 11:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j+Cz=CV=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qGHTQ-0000on-6H
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 11:12:04 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f521574-1992-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 13:12:02 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso6605566e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jul 2023 04:12:01 -0700 (PDT)
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
X-Inumbo-ID: 6f521574-1992-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688382721; x=1690974721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kYzErPWsWB3rFD0aCATtIB3A7HZS3HS2AIf3vRIPPHU=;
        b=YaHrG+9poWqIVAbsOQlNpvzDzimTGVOf3LGw9wMZsHMJavZVUCfu9hghGvCJLCDsQi
         SMMEVo5i/cuKgiWRz0fP5VYkr+4GDmQWXEkGPoOk/bGa+w+RWUxHsErog7AymnyRG+Tc
         cj/ktu6+Mw5UFCyZyX3eypeMEIGPRj7H9NjX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688382721; x=1690974721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYzErPWsWB3rFD0aCATtIB3A7HZS3HS2AIf3vRIPPHU=;
        b=fVyPmAhh8Zzj2+pMth28pfFIuQgYkHf1CC9eKetEKShgBtMjpWePge3JojDubxOlMM
         ub2NbV1JgXM45pAv5eLdLY6ZE3ZMkgzQKsDbu4cMhFtyHJBaL4qsD6GWzjoGpoHmEFrh
         tMltOoj3ILgCkoWiYhrhnH2qmeb3AmPO/QAgKDtb2n8H9AQCJv1f9kIdsEViNLEKII/8
         dwy1LsdoEZkJAUea1QaXD87yKdn9AZsQuZdkez6QFdGsPJWRbrD/aX0MsjQx2bhJY/9f
         LL6JAIIWkoEOxECsNuEailJB14+txspZ/XwFlexkFpOQ6MPyafXG+ggrt+VGYToM33fv
         3S3A==
X-Gm-Message-State: ABy/qLbipsktl8iQHb9hW/UZB3yyvmNRWkFgcZsfTs5FQawpj6LOqj/o
	veWiZ1jSSX6cOjMPHfBsgfvNvePYsABGSA+WzDxexA==
X-Google-Smtp-Source: APBJJlFnlgcjfesbo8EDfakDCEAhVckvXZTelqyppGLrbNvWACDOC5sxpfqvTIfIPpi+leRliRuZTJehLFbIZ3OEJQ4=
X-Received: by 2002:a05:6512:693:b0:4f8:7513:8cb0 with SMTP id
 t19-20020a056512069300b004f875138cb0mr7147082lfe.2.1688382721362; Mon, 03 Jul
 2023 04:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230630113756.672607-1-george.dunlap@cloud.com> <84197474-9ea0-d42a-b591-13821325cf89@xen.org>
In-Reply-To: <84197474-9ea0-d42a-b591-13821325cf89@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 3 Jul 2023 12:11:50 +0100
Message-ID: <CA+zSX=bAL4PbtuzrA1QNSC111xwgJxFSnLZqWXNWEWitreKZJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000005a240605ff933c7d"

--0000000000005a240605ff933c7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 6:49=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:

> Hi,
>
> The subject stay "1/2" but I don't see any "2/2" nor cover letter. Where
> can I find the rest of the series?
>

I didn't make a cover letter, but the mail archive seems to have both
messages:

https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg02298.html

 -George

--0000000000005a240605ff933c7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 30, 2023 at 6:49=E2=80=AF=
PM Julien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
The subject stay &quot;1/2&quot; but I don&#39;t see any &quot;2/2&quot; no=
r cover letter. Where <br>
can I find the rest of the series?<br></blockquote><div><br></div><div>I di=
dn&#39;t make a cover letter, but the mail archive seems to have both messa=
ges:</div><div><br></div><div><a href=3D"https://lists.xenproject.org/archi=
ves/html/xen-devel/2023-06/msg02298.html">https://lists.xenproject.org/arch=
ives/html/xen-devel/2023-06/msg02298.html</a></div><div>=C2=A0</div><div>=
=C2=A0-George</div></div></div>

--0000000000005a240605ff933c7d--

