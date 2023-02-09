Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C50690B33
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492483.762031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7V0-0004Rl-JQ; Thu, 09 Feb 2023 14:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492483.762031; Thu, 09 Feb 2023 14:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7V0-0004OO-GF; Thu, 09 Feb 2023 14:02:06 +0000
Received: by outflank-mailman (input) for mailman id 492483;
 Thu, 09 Feb 2023 14:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIAB=6F=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pQ7Uy-0004OI-JR
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:02:04 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5471ea57-a882-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 15:02:03 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id l3so2150600ljo.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 06:02:03 -0800 (PST)
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
X-Inumbo-ID: 5471ea57-a882-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wJAF3fyyl0empCmQtcu8CcGo550fBA1awJpNU79+SxI=;
        b=l1oQLHM2hHxZYnllFHpySXOpa94+zD85NUDHPOWieXvRCUGYrvFlvnNwWbeYTF76IO
         FTdDJEN5IQSPAHC5yrtAAwd3HsMLYcMbMs9Z4vlRKObpTC3a4kda8SKwdtKqru18RFPV
         7eM8AGdetgqaE58k/4s2ZJsr824euvTPqeZUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJAF3fyyl0empCmQtcu8CcGo550fBA1awJpNU79+SxI=;
        b=KiI8OVtBDmAu+CJd+E5/yNo+KTCMzGIl8Q0fnd83JFNd7I6nlTJD1AAOkUglWOSYfC
         Xsij9c7xHqPDRpjzlxR6bTWwBHunhYHKom6FMfGKZmCuAcewIuncbtSAcFn045nRRw04
         4Hoq3LrKMEkFwZvC//0nMq3riE8IS0UPmGuQJ3quo6k/VS2WeIYTY2NTuFFcRFRZLyZC
         C+rAjEImONNLD06IRoqQHSn8OUjDh2/IP16OjAS8zlkVg7HDMsv7OD6HZ+vM6WLqCyhw
         iH99H9PAggso8sEISfBzz2GxauEZ+C82bt06dayw+dDCZ+XhgdpEabHXcWtfEwsxW3Ws
         Vq/g==
X-Gm-Message-State: AO0yUKUR7Sp6ApTz6TEgGkrxWks8IFvdEH0E9GMSv6V0EXCkwa47GOnw
	UnGI+8d8tcYjfIGzo8PfPUFZbkT+ubjjCWGYLjZGRg==
X-Google-Smtp-Source: AK7set8aRAZDw4pYeKT480eJ7Tk5pkIroAEBhXdT3QUL1K/J7HD7iXEJbjg2TuZB14zMbvAj8xEwyybp8rdJJc3mUnM=
X-Received: by 2002:a05:651c:3c5:b0:284:6390:1f8 with SMTP id
 f5-20020a05651c03c500b00284639001f8mr2056303ljp.167.1675951323008; Thu, 09
 Feb 2023 06:02:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675889601.git.demi@invisiblethingslab.com> <75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com>
In-Reply-To: <75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 9 Feb 2023 14:01:52 +0000
Message-ID: <CA+zSX=a68fwMjAVRYC52894L4VsaHz9KACRVoewAyBTiNKJuYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Build system: Replace git:// and http:// with https://
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000044ee6605f444d3bc"

--00000000000044ee6605f444d3bc
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 8:58 PM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
>
> This patch enforces the use of secure transports in the build system.
>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>

Hey Demi,

Thanks for this series -- we definitely want the build system to use secure
transports when available.  Can you confirm that you've tested the "+s"
versions of all the URLs in this patch, and verified that they actually
work?

If you haven't, I realize that may be somewhat tedious, but I think it's
pretty important.  You should be able to automate  a lot of it using `curl
--head --fail`. [1]

 -George

[1]
https://stackoverflow.com/questions/12199059/how-to-check-if-an-url-exists-with-the-shell-and-probably-curl

--00000000000044ee6605f444d3bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 8:58 PM Demi M=
arie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com">demi@invisi=
blethingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Obtaining code over an insecure transport is a terrible ide=
a for<br>
blatently obvious reasons.=C2=A0 Even for non-executable data, insecure<br>
transports are considered deprecated.<br>
<br>
This patch enforces the use of secure transports in the build system.<br>
<br>
Signed-off-by: Demi Marie Obenour &lt;<a href=3D"mailto:demi@invisiblething=
slab.com" target=3D"_blank">demi@invisiblethingslab.com</a>&gt;<br></blockq=
uote><div><br></div><div>Hey Demi,</div><div><br></div><div>Thanks=C2=A0for=
 this series -- we definitely want the build system to use secure transport=
s when available.=C2=A0 Can you confirm that you&#39;ve tested the &quot;+s=
&quot; versions of all the URLs in this patch, and verified that they actua=
lly work?</div><div><br></div><div>If you haven&#39;t, I realize that may b=
e somewhat tedious, but I think it&#39;s pretty important.=C2=A0 You should=
 be able to automate=C2=A0 a lot of it using `curl --head --fail`. [1]</div=
><div><br></div><div>=C2=A0-George</div><div><br></div><div>[1]=C2=A0<a hre=
f=3D"https://stackoverflow.com/questions/12199059/how-to-check-if-an-url-ex=
ists-with-the-shell-and-probably-curl">https://stackoverflow.com/questions/=
12199059/how-to-check-if-an-url-exists-with-the-shell-and-probably-curl</a>=
</div><div><br></div></div></div>

--00000000000044ee6605f444d3bc--

