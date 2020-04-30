Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E71BF277
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 10:17:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU4NL-0002uR-24; Thu, 30 Apr 2020 08:16:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13pL=6O=gmail.com=ayushdosaj2313@srs-us1.protection.inumbo.net>)
 id 1jU4NJ-0002uM-4S
 for xen-devel@lists.xen.org; Thu, 30 Apr 2020 08:16:53 +0000
X-Inumbo-ID: f2042468-8aba-11ea-ae69-bc764e2007e4
Received: from mail-oi1-x234.google.com (unknown [2607:f8b0:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2042468-8aba-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 08:16:51 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id a2so4481227oia.11
 for <xen-devel@lists.xen.org>; Thu, 30 Apr 2020 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PSbV9BzdXx84MTWhjheATmsVhCcessEhtCWJHTsqRdY=;
 b=ouKJPbiXN4f5LLaS3L0cX5S+saFHmpCa7ITYX/xngYnkKNA53qTyPEnzuTp9mzxFSF
 ZgD/FpHyfdPXqsY/WmBOR4SQ1uUQ5TTrQTY9LEac9YGpQJnmyPtI5CGtWmrAlHi+gGsa
 Q6SsF8C3DX8+EBbHqVCYz7tSzt6FVeTy6JZVCZLJC+FLwO/jbUcABw1THZkRZS9u3/tG
 qgnvmbpYk2tU/zD7YiUfH9R4V4AWmHJABKjMViqkCbRF0616M9GLrshkk2GmagEhjmjU
 WEoG3w/SRlTj5nuUk96fm3l9N0Di7RXB0be7+HJWNZQUkLnkLat8KUh0PFYcaqqaDVrr
 yzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSbV9BzdXx84MTWhjheATmsVhCcessEhtCWJHTsqRdY=;
 b=iOEgGLPdxLgPV9dyayHz64gtCqpggTr367Dz03pgCRsOQPEhtILVypwcdYNxOx0gy9
 rNIBGdopL5kxl2jPxZ0SFbaJdXfNFzpyUT8RTJ1aHGKlsL6yuPeSaSRpkZLoNdI5+t/q
 zVqfNEa1cLStkjDmuRzWAJwW+tEtfp0govZv4T+ZOceBB0Au8SoaDUSkT1Oj76/hTBRI
 1yH+BYS90vIJjiQG6RlcyBg8pecJSn5ms4Fdcu6u3QhbxM7n3eS6QuNBBIqjvz//9lJ8
 dUR58k8FZboM4AZDshhrrEpdloM/v6xR3pEZJnk4xhpszEW7kFiC6cXMn/EJkie7NeMl
 shEA==
X-Gm-Message-State: AGi0PuYY6pSAscahzvN0yaEF2Yy4DtyzYRi4buWZE0prJxxDXYNo9o+i
 p9IE/QSmYSmJGuP56aA3iP3ZVMzWeb8kyVktIQY=
X-Google-Smtp-Source: APiQypJLsWzZb5LbKoUVfTM9sohctVRyJ5FJmzybE4/l/fHoVNbNPe++FfEma1bfm7pFoqAuCEb+ut9hUuVqW06XofM=
X-Received: by 2002:aca:c78d:: with SMTP id x135mr894063oif.91.1588234611251; 
 Thu, 30 Apr 2020 01:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAOCxVi0s5X+=Hug2_M-AyXvYpiwqfkf7G2Y66kp44MQ-xgO+KA@mail.gmail.com>
 <e92bb8ab-3dd2-bb19-d524-d78279f9508a@citrix.com>
 <CAOCxVi1PWM_9t03f=_qn0PXkKB1gN4504h+ijMpwqGU9VpR48g@mail.gmail.com>
In-Reply-To: <CAOCxVi1PWM_9t03f=_qn0PXkKB1gN4504h+ijMpwqGU9VpR48g@mail.gmail.com>
From: Ayush Dosaj <ayushdosaj2313@gmail.com>
Date: Thu, 30 Apr 2020 13:46:39 +0530
Message-ID: <CAOCxVi0=iKzeJ0gfZ8XoMTXYrZaHbok=F30pw1rNdsUhkQcXjw@mail.gmail.com>
Subject: Re: Xen Compilation Error on Ubuntu 20.04
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000d2df0805a47daf94"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000d2df0805a47daf94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew, Xen Development team.

I compiled and installed Xen by appending -fcf-protection=3Dnone to CFLAGS =
on
Ubuntu 20.04 but it still crashes on startup.

On Wed, Apr 29, 2020 at 10:58 PM Ayush Dosaj <ayushdosaj2313@gmail.com>
wrote:

> Awesome, thanks!
>
> On Wed, Apr 29, 2020 at 10:55 PM Andrew Cooper <andrew.cooper3@citrix.com=
>
> wrote:
>
>> On 29/04/2020 18:17, Ayush Dosaj wrote:
>> > Hi Xen development team,
>> >
>> > I am Ayush. I compiled Xen Hypervisor from source on Ubuntu 20.04
>> > machine running on an intel-i9 CPU.
>> > I am getting compilation error due to the following two flags.
>> > Error: error: =E2=80=98-mindirect-branch=E2=80=99 and =E2=80=98-fcf-pr=
otection=E2=80=99 are not
>> compatible.
>> >
>> > Complete Error logs can be found at
>> https://paste.ubuntu.com/p/xvvyPnhW5c/
>> >
>> > And when I compiled Xen commenting the two flags in Rules.mk file, it
>> > compiles and installs properly but on boot-up i see a blank black scre=
en
>> > and i am stuck there.
>>
>> That is a GCC bug (these options are actually fine in combination).  It
>> got fixed earlier today in master, and backported for GCC 9.4
>>
>> You can work around it by appending -fcf-protection=3Dnone to CFLAGS
>>
>> I wouldn't try editing the logic around -mindirect-branch, as that is
>> related to retpoline safety for Spectre v2, and probably relies on the
>> build matching the code.
>>
>> ~Andrew
>>
>
>
> --
> Ayush Dosaj
> VIT Vellore
>
>

--=20
Ayush Dosaj

--000000000000d2df0805a47daf94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small"><div class=3D"gmail_default">Hi Andrew,=
 Xen Development team.</div><div class=3D"gmail_default"><br></div><div cla=
ss=3D"gmail_default">I compiled and installed Xen by appending -fcf-protect=
ion=3Dnone to CFLAGS on Ubuntu 20.04 but it still crashes on startup.</div>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Apr 29, 2020 at 10:58 PM Ayush Dosaj &lt;<a href=3D"mailto:ay=
ushdosaj2313@gmail.com">ayushdosaj2313@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;font-siz=
e:small">Awesome, thanks! <br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2020 at 10:55 PM Andrew=
 Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">=
andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 29/04/2020 18:17, Ayush Dosaj wrote:<br>
&gt; Hi Xen development team,<br>
&gt; <br>
&gt; I am Ayush. I compiled Xen Hypervisor from source on Ubuntu 20.04<br>
&gt; machine running on an intel-i9 CPU.<br>
&gt; I am getting compilation error due to the following two flags.<br>
&gt; Error: error: =E2=80=98-mindirect-branch=E2=80=99 and =E2=80=98-fcf-pr=
otection=E2=80=99 are not compatible.<br>
&gt; <br>
&gt; Complete Error logs can be found at <a href=3D"https://paste.ubuntu.co=
m/p/xvvyPnhW5c/" rel=3D"noreferrer" target=3D"_blank">https://paste.ubuntu.=
com/p/xvvyPnhW5c/</a><br>
&gt; <br>
&gt; And when I compiled Xen commenting the two flags in Rules.mk file, it<=
br>
&gt; compiles and installs properly but on boot-up i see a blank black scre=
en<br>
&gt; and i am stuck there.<br>
<br>
That is a GCC bug (these options are actually fine in combination).=C2=A0 I=
t<br>
got fixed earlier today in master, and backported for GCC 9.4<br>
<br>
You can work around it by appending -fcf-protection=3Dnone to CFLAGS<br>
<br>
I wouldn&#39;t try editing the logic around -mindirect-branch, as that is<b=
r>
related to retpoline safety for Spectre v2, and probably relies on the<br>
build matching the code.<br>
<br>
~Andrew<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div style=3D"text-align:left"><div style=3D=
"font-family:arial,helvetica,sans-serif">Ayush Dosaj</div><div style=3D"fon=
t-family:arial,helvetica,sans-serif">VIT Vellore</div><div><br></div></div>=
</div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"=
text-align:left"><div style=3D"font-family:arial,helvetica,sans-serif">Ayus=
h Dosaj</div><div><br></div></div></div></div></div>

--000000000000d2df0805a47daf94--

