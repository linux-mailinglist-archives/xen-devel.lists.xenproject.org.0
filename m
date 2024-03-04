Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49726870062
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 12:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688333.1072374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6Ri-0006D2-IC; Mon, 04 Mar 2024 11:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688333.1072374; Mon, 04 Mar 2024 11:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6Ri-0006AF-Ez; Mon, 04 Mar 2024 11:25:26 +0000
Received: by outflank-mailman (input) for mailman id 688333;
 Mon, 04 Mar 2024 11:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYM3=KK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rh6Rg-0006A6-CV
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 11:25:24 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e36d1993-da19-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 12:25:22 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso5414586a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 03:25:22 -0800 (PST)
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
X-Inumbo-ID: e36d1993-da19-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709551521; x=1710156321; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MVI2Rq4LFUTalI0QvuKjB0kSKNn+gR7USDXgz7zXuJQ=;
        b=T0XgpiusnFQCgb/OBLmzn4tw7RBxzByrVgVUrx5y56W6hBU5vrYl0MwRwwbt/IBgJy
         7FW11i1VbDwWUTqiGRRtC+xsjbOSeOly7Fb04xT4JL0y5owJ/Vk5C2L/ov6dR78OFKMs
         LWu1zqWIR6tRgQwK0Kp5KfxgAnb5V01FTiF/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709551521; x=1710156321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVI2Rq4LFUTalI0QvuKjB0kSKNn+gR7USDXgz7zXuJQ=;
        b=V+Jsev1dZ/6lrEujfpQoAllsEWs2mc9zA2Fn77COiokg/Vn4Ejr+gYKyGmFT7bz/sj
         V0Yd3m+0md2UaXVpOPMK0Moj0C9doE8QdPfK/vrK3mz1JDQmnpc/s2GUn5UjBnt4wXcX
         g4tbWv9SA40lZwAC8icl1vwGTrQ179cwNrMKjZwKAc2ELRhJs6df0Bh7W5ec7zBR6pw5
         kzYkG/9NtB62wswe4V1IhMRbz50h0dUmjNWxbGbXf0noGldnPvapnL2Q/wwqgPx7NAjw
         3P9qZ8e+FqFo9/QYbQgHP8mDg3YviuF1jshbaIE2rdXhyU9h1uw4WY+31aWSITFrk8Fy
         CXbg==
X-Gm-Message-State: AOJu0YxnR8NPul6EFGdm+Q7jE3lTDXFU7Yykh68Vm+p1PZ33udxkeqtc
	okp5+huFdRa23Oo/F7iVtP76m1YcLh6htEFKWEeltUF5ZSbpwXXKZOHcqXPkEBOE7vVxppidm1D
	BysttduBnmTzOUfgmqGsaRCwyfVC7zJMKGxQgLA==
X-Google-Smtp-Source: AGHT+IFZrakKMYzLH1hlpTmZ8YjX1jzb5KrZN54pNt1bg6BHlclq9ukwriMVTr5SRheNAoh2XVyTD2e79R69+gmG7bA=
X-Received: by 2002:a05:6402:40c8:b0:567:15a6:848e with SMTP id
 z8-20020a05640240c800b0056715a6848emr3840975edb.18.1709551521589; Mon, 04 Mar
 2024 03:25:21 -0800 (PST)
MIME-Version: 1.0
References: <ZePn5zQkcwvpoTBU@mail-itl>
In-Reply-To: <ZePn5zQkcwvpoTBU@mail-itl>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 4 Mar 2024 11:24:45 +0000
Message-ID: <CAO-mL=xdvy8obxQZ4=8EP1=SwywztzfqzeGWoawcJARsGB6F5A@mail.gmail.com>
Subject: Re: Link to the 2023 xen summit schedule is broken
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000002b8db60612d3fb56"

--0000000000002b8db60612d3fb56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Try this link, it should show the sessions for 2023.
https://xen2023.sched.com/

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Sun, Mar 3, 2024 at 3:01=E2=80=AFAM Marek Marczykowski-G=C3=B3recki <
marmarek@invisiblethingslab.com> wrote:

> Hi,
>
> The link to the last year schedule at
> https://events.linuxfoundation.org/archive/2023/xen-project-summit/ is
> broken, it opens a page for upcoming "ONE summit" event that doesn't
> look to be related to Xen Summit.
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
>

--0000000000002b8db60612d3fb56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Marek,<div><br></div><div>Try this link, it should show=
 the sessions for 2023.</div><div><a href=3D"https://xen2023.sched.com/">ht=
tps://xen2023.sched.com/</a></div><div><br clear=3D"all"><div><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><d=
iv style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"co=
lor:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sun, Mar 3, 2024 at 3:01=E2=80=AFAM Marek Marczykowski-G=C3=B3re=
cki &lt;<a href=3D"mailto:marmarek@invisiblethingslab.com">marmarek@invisib=
lethingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi,<br>
<br>
The link to the last year schedule at<br>
<a href=3D"https://events.linuxfoundation.org/archive/2023/xen-project-summ=
it/" rel=3D"noreferrer" target=3D"_blank">https://events.linuxfoundation.or=
g/archive/2023/xen-project-summit/</a> is<br>
broken, it opens a page for upcoming &quot;ONE summit&quot; event that does=
n&#39;t<br>
look to be related to Xen Summit.<br>
<br>
-- <br>
Best Regards,<br>
Marek Marczykowski-G=C3=B3recki<br>
Invisible Things Lab<br>
</blockquote></div>

--0000000000002b8db60612d3fb56--

