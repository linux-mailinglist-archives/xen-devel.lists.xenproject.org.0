Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EB26E332
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 20:06:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIyHp-0000Bk-1O; Thu, 17 Sep 2020 18:05:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5geh=C2=gmail.com=dav.sec.lists@srs-us1.protection.inumbo.net>)
 id 1kIyHn-0000Bf-0H
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 18:05:35 +0000
X-Inumbo-ID: f20ead1e-93df-4951-8c37-9e42135af097
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f20ead1e-93df-4951-8c37-9e42135af097;
 Thu, 17 Sep 2020 18:05:33 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p9so4547174ejf.6
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QiESp9sSlZD111CaRKnVf65rDdsJkZUbmn9HDgtXacM=;
 b=CYGJaDLf2hJoLvoPDxdJQzNymOOPXbdVPIHnBEMOyr8Ry0cG4sET/JG3647ICnbdb3
 +vOTFVjnGVo9Rzh1nrHse1Dv+p0DyXS8hbotxKBfUp87QtfTlviXtBFJX/ALFXfMRN25
 FDWr3e8dtLdsUvUyhlmnQU38JxGW8brL9aFvrYNYSk3y1VcdX7c4pOCiEf8iSI7UDFie
 wpXXnTO0EvuFKmdl6KfDLHdqpuBow34DqPZC7DcKXBqFg6JmXAPXiIOrKmpRANqFdV7q
 bPYrfm23ZAxwEGL4gUumfuQLoBLJn+/vhidPUMK6cMp9WoZ+RLKnJTCJN+UqV2R0a21s
 ho1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QiESp9sSlZD111CaRKnVf65rDdsJkZUbmn9HDgtXacM=;
 b=cNX0spaeQJMiaK5vy97lpHd+RV14+1Kbj6oDkjX+2QWoCMlhbr2Ud13xK1fSD9+VLI
 g+6qbmES/0hJEEWcUyQ1sg3sZl5E6Uk8G8cYFtNKtITnwByNrrorjiqtc0km9njml4Gd
 JHxnusWWmhGO73euVbeMUC4kr9Syp5u6VVkN/C+uXmU74JXFAiEnYIgBJl3hU+aZ/7SH
 OMGCwH+tEeKNE8vTwbqvzD1pyEU5AJB88rfWPxjpyka+ql4dXo7+boS3NtBGEzFbNJaN
 heW7Qn0xOtg9dMnc14hZTu2/5OuYytohtrqyvJpIY0lj/C+JoOmsolgy8QoEXg9hfJlB
 /j1Q==
X-Gm-Message-State: AOAM531Z3UL8RL29SBxxRDsubBYNspEhWAQsXm8oyLkpNtLFVBSuF3tk
 7Q1kVCuxEjUclPJFHvVpJLh0LYBgbYOz3FYH13g=
X-Google-Smtp-Source: ABdhPJxF1yZWSwIElB0ENuffigftNb8JLeeSuGmWuV4L4hCr6b0Hwerwu4t9bLxfgGA0g0uEiNXg3seymnym+qC1u/w=
X-Received: by 2002:a17:906:8559:: with SMTP id
 h25mr31534921ejy.536.1600365933085; 
 Thu, 17 Sep 2020 11:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
 <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
 <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
 <CA+js8L=dCJkE6y=GO2WNc0ufLaOXkx1BsMg3soCw+=wyDduPMQ@mail.gmail.com>
 <CA+js8LnzTkPtQXhQ-N85rM4Qd3HC2SpRQ5ZoSzh4CVx92tNYNQ@mail.gmail.com>
 <20200916161206.GA20338@aepfle.de>
 <e68fd134-bb40-8646-89f0-dd8241737342@knorrie.org>
In-Reply-To: <e68fd134-bb40-8646-89f0-dd8241737342@knorrie.org>
From: David I <dav.sec.lists@gmail.com>
Date: Thu, 17 Sep 2020 20:05:22 +0200
Message-ID: <CA+js8L=53vMAEG2aU=_EoJoL2yZBRvxmKC0wkqSqv8pDEGH3Tg@mail.gmail.com>
Subject: Re: Compiling Xen from source
To: Hans van Kranenburg <hans@knorrie.org>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/alternative; boundary="000000000000f3c5f705af863a92"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000f3c5f705af863a92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.
So I have done a fresh checkout of the master branch, but unfortunately,
there's a bug in infiniband drivers.
the error is : "drivers/infiniband/flexboot_nodnic.c:368:53: error:
implicit conversion from 'enum ib_queue_pair_type' to
'nodnic_queue_pair_type' [-Werror=3Denum-conversion]".
this occurs with gcc 10 and developers seem to be aware of this:

https://lists.ipxe.org/pipermail/ipxe-devel/2020-May/007049.html

but it seems the master branch has not been patched yet.

Anyway now I will concentrate on 4.14 if I need to compile from source :-)

David


Le mer. 16 sept. 2020 =C3=A0 22:59, Hans van Kranenburg <hans@knorrie.org> =
a
=C3=A9crit :

> On 9/16/20 6:12 PM, Olaf Hering wrote:
> > On Wed, Sep 16, David I wrote:
> >
> >> So, how did the debian package was compiled ? is this the same source
> code with
> >> different options ?
> >
> > Xen 4.11 is from 2018. Use also a compiler from that year.
> > Using this years compiler will lead to errors...
>
> In Debian, Buster with Xen 4.11 uses gcc 8.
>
> The Xen 4.11 that is in Debian unstable now does not compile any more
> with gcc 10. That's why we really need to get Xen 4.14 in there now to
> un-stuck that (even with additional picked patches again already).
>
> Hans
>
>

--000000000000f3c5f705af863a92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, thanks.<div>So I have done a fresh checkout of the mas=
ter branch, but unfortunately, there&#39;s a bug in infiniband=C2=A0drivers=
.</div><div>the error is : &quot;drivers/infiniband/flexboot_nodnic.c:368:5=
3: error: implicit conversion from &#39;enum ib_queue_pair_type&#39; to &#3=
9;nodnic_queue_pair_type&#39; [-Werror=3Denum-conversion]&quot;.<br></div><=
div>this occurs with gcc 10 and developers seem to be aware of this:</div><=
div><br></div><div><a href=3D"https://lists.ipxe.org/pipermail/ipxe-devel/2=
020-May/007049.html">https://lists.ipxe.org/pipermail/ipxe-devel/2020-May/0=
07049.html</a><br></div><div><br></div><div>but it seems the master branch =
has not been patched yet.</div><div><br></div><div></div><div>Anyway now I =
will concentrate on 4.14 if I need to compile from source :-)</div><div><br=
></div><div>David</div><div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 16 sept. 2020 =C3=A0=C2=
=A022:59, Hans van Kranenburg &lt;<a href=3D"mailto:hans@knorrie.org">hans@=
knorrie.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 9/16/20 6:12 PM, Olaf Hering wrote:<br>
&gt; On Wed, Sep 16, David I wrote:<br>
&gt; <br>
&gt;&gt; So, how did the debian package was compiled ? is this the same sou=
rce code with<br>
&gt;&gt; different options ?<br>
&gt; <br>
&gt; Xen 4.11 is from 2018. Use also a compiler from that year.<br>
&gt; Using this years compiler will lead to errors...<br>
<br>
In Debian, Buster with Xen 4.11 uses gcc 8.<br>
<br>
The Xen 4.11 that is in Debian unstable now does not compile any more<br>
with gcc 10. That&#39;s why we really need to get Xen 4.14 in there now to<=
br>
un-stuck that (even with additional picked patches again already).<br>
<br>
Hans<br>
<br>
</blockquote></div>

--000000000000f3c5f705af863a92--

