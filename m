Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265A5481137
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 10:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252330.433336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2V1H-0006x9-5z; Wed, 29 Dec 2021 09:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252330.433336; Wed, 29 Dec 2021 09:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2V1H-0006uS-2q; Wed, 29 Dec 2021 09:13:15 +0000
Received: by outflank-mailman (input) for mailman id 252330;
 Wed, 29 Dec 2021 09:13:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72qU=RO=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n2V1F-0006uM-RP
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 09:13:13 +0000
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bbe4bd3-6887-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 10:13:12 +0100 (CET)
Received: by mail-il1-f179.google.com with SMTP id j6so16080825ila.4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Dec 2021 01:13:12 -0800 (PST)
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
X-Inumbo-ID: 8bbe4bd3-6887-11ec-bb0b-79c175774b5d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vi7P12MwF7ouUjriCw7IKf03Y0rY27D1AIFsJZzMueo=;
        b=NKuUtY3OwyshGQZDCOp+wZAJ8Qh0kAKfHUJlyaKpUp3SmNfmZZriM2HkRL2Wb/TqJA
         FaH1gcuGLwI6AWSrlq2N6DYa9hMKpJFmGzQCi0Y/eQwa4daoFMNMdiyd++oqxft0ddRT
         jxK4WuTJ/rJmusY/dne86WqyrH4s5UZXXyPzevuC5an+qTdHu60EyTyIjj0/gi+9ToVV
         o3m8QDVpHUlVPWY1F+4Ybnpe5AWdpjCvvfjiBZchyD1UzE3Ya4hO+ZXzTMY4QvYmn9PB
         QYfjVtcclx/f3qf2/zZe9x7EtUDqoZXShOpS2PPi5Gci4MiCYN1IqrcytoE8nr4c/qSc
         enpw==
X-Gm-Message-State: AOAM531PGnuFYfN7zU3R5U7Q8FYD0SXkVZuRH26WDPuhCC6KmNltFbTG
	3EdQzchN7fDBgmvZ9xsAJ4fLBJUMOtsIN7zVIa0=
X-Google-Smtp-Source: ABdhPJzm+R8Nyf2Z/+s88CWHOKWTo9JiPmMWjOHGF14sxmGLPWGs2yJsq2+3oRniA8QEgQF6J4NuOty/VK27pSmw8fA=
X-Received: by 2002:a05:6e02:1584:: with SMTP id m4mr11678093ilu.185.1640769191184;
 Wed, 29 Dec 2021 01:13:11 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger> <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger> <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger> <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger> <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger>
In-Reply-To: <YcwdJn/Y0yncuJ/e@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Wed, 29 Dec 2021 17:13:00 +0800
Message-ID: <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000cca18805d445584a"

--000000000000cca18805d445584a
Content-Type: text/plain; charset="UTF-8"

>
> I think this is hitting a KASSERT, could you paste the text printed as
> part of the panic (not just he backtrace)?
>
> Sorry this is taking a bit of time to solve.
>
> Thanks!
>
Sorry that I didn't make it clear in the first place.
It is the same cross boundary assertion.

Also sorry about the email format if it mess up in your side. I am typing
in the Gmail app and don't find a way to switch to plain text.

>

--000000000000cca18805d445584a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">I think this is hitting a KASSERT, could you paste the text p=
rinted as<br>
part of the panic (not just he backtrace)?<br>
<br>
Sorry this is taking a bit of time to solve.<br>
<br>
Thanks!<br></blockquote></div><div dir=3D"auto">Sorry that I didn&#39;t mak=
e it clear in the first place.</div><div dir=3D"auto">It is the same cross =
boundary assertion.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Also=
 sorry about the email format if it mess up in your side. I am typing in th=
e Gmail app and don&#39;t find a way to switch to plain text.</div><div cla=
ss=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div>

--000000000000cca18805d445584a--

