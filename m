Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B4A5075A6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 18:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308396.524115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngr43-0002sG-7G; Tue, 19 Apr 2022 16:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308396.524115; Tue, 19 Apr 2022 16:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngr43-0002pW-3q; Tue, 19 Apr 2022 16:50:55 +0000
Received: by outflank-mailman (input) for mailman id 308396;
 Tue, 19 Apr 2022 16:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WtTZ=U5=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1ngr41-0002os-95
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 16:50:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df427cb0-c000-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 18:50:52 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id r19so5178426wmq.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 09:50:52 -0700 (PDT)
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
X-Inumbo-ID: df427cb0-c000-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSgQIztKzemVABHDhvN9/cvAvjXWOT7vnGgR2KGrhZc=;
        b=Vz/X9y6g+dewkm+Voqh58Lkg2H+XlDW4De4st0pRvhXfy/SnD9TXolzEcKlmde31+F
         Ik92791NZ9ug1Sz7JuvBM4dfw0XGkRGBiVmiCUkfiF+IoqA79BHClAzyRPWezm7K0SMY
         ulnX7hxcvn29uei8TkmyB/6oAmimL+tklkd9j+0R6JyEko7hUA+yHAxZRAGoBCqIj/4m
         fdH4dwJwcWRwae6i74iLXpdd/F5dR8XykBHQTD+3HWCcW29DzSc8Mc9liCjiMrWgaox2
         xenQeLjrfqv5vQHatEFfEPkJqxHAhZWfvrLCy69mV4CknHkPKvDhrOp9BXpq5byMcluD
         S8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSgQIztKzemVABHDhvN9/cvAvjXWOT7vnGgR2KGrhZc=;
        b=fZYazJ6wpx4wwX2AZ5JJG1Z++emBZwBWjGmRenbLqkF0yquvWeHGw5UsnTIfwS7GaF
         5vMxD0GkrAuRpQrUgSsnXl0cO5ow8Bnh+okCPXRmepQe7SZZmtFCu4AxsMftbrcQeLIW
         MhuwyS2EDo9GOsHuQuoihlmcaTFjIy0DeKCVsV31+3eJhttaJRC8OGmNUy/b9PxQxQtk
         fxVVTU9R55Of9LZNWvM+pXHip9YzkO25bYnJbIB/EJPWDAoO396sEniu+kEAG9EnLWSX
         Ng47+FoY+d2Ap36768oBpk52Es5fopYrNxpfU3bl4z6OR/tQowMIXgDZU4kV8TW4RV/P
         /e4g==
X-Gm-Message-State: AOAM531xku64wsEizwFnJ/RBBLoRxT+aF0k7jKJbcxAXCKBu+GaYJPl7
	ZDLTHUH97bQjtYrcdjI3muEBzXgB5OiKYQhlAWmACw9d
X-Google-Smtp-Source: ABdhPJxPNwqwrI/XvQgId0ytCG53gbW9GA6npzpeeiFiUh6kwJY8yX1nyylye3YDfIXgy4zntFk5W4yfK3UUxU+VU68=
X-Received: by 2002:a1c:2947:0:b0:391:8d5a:69b7 with SMTP id
 p68-20020a1c2947000000b003918d5a69b7mr16987884wmp.113.1650387051591; Tue, 19
 Apr 2022 09:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
 <CAJ=z9a37_y3B4aAfiK5C-bHJYyWqCo0+g+jB6cdDCmOzLuXLJw@mail.gmail.com> <925421bc-680b-df61-5a75-681d752c4820@gmail.com>
In-Reply-To: <925421bc-680b-df61-5a75-681d752c4820@gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 19 Apr 2022 16:50:39 +0000
Message-ID: <CAJ=z9a025PGxvdh-Yhwf342B7rVq9kZ8obgmxQmOtG8Kvu70pQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: silence ambiguous integer casting warning error
To: Paran Lee <p4ranlee@gmail.com>
Cc: austindh.kim@gmail.com, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000f3bc8005dd04ad8c"

--000000000000f3bc8005dd04ad8c
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Apr 2022, 16:31 Paran Lee, <p4ranlee@gmail.com> wrote:

> Hi, Julien Grall.
>
> Thank you for checking it out. I'm sorry I forgot to attach the make log
> as well.
>

Thanks for the logs!



> My build configuration (include CFLGAS)
>
> export ARCH=arm64
> export XEN_TARGET_ARCH=arm64
> export $(dpkg-architecture -aarm64);
> export CROSS_COMPILE=aarch64-linux-gnu-
> export CFLAGS="-g -Wall -Wextra -Wno-unused-parameter"
>

May I ask why you are modifying the flags? What's your end goal?

There reason I am asking is a lot of the helper for cpumask are using
signed int. So switching only the local variables to unsigned sounds wrong
to me.

Cheers,

--000000000000f3bc8005dd04ad8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 19 Apr 2022, 16:31 Paran Lee, &lt;<a href=3D"m=
ailto:p4ranlee@gmail.com">p4ranlee@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Hi, Julien Grall.<br>
<br>
Thank you for checking it out. I&#39;m sorry I forgot to attach the make lo=
g<br>
as well.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for the logs!</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
My build configuration (include CFLGAS)<br>
<br>
export ARCH=3Darm64<br>
export XEN_TARGET_ARCH=3Darm64<br>
export $(dpkg-architecture -aarm64);<br>
export CROSS_COMPILE=3Daarch64-linux-gnu-<br>
export CFLAGS=3D&quot;-g -Wall -Wextra -Wno-unused-parameter&quot;<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">May I ask=
 why you are modifying the flags? What&#39;s your end goal?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">There reason I am asking is a lot of =
the helper for cpumask are using signed int. So switching only the local va=
riables to unsigned sounds wrong to me.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Cheers,</div></div>

--000000000000f3bc8005dd04ad8c--

