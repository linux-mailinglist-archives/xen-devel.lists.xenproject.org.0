Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB797294FA2
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 17:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10096.26625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVFmx-0000Lg-9v; Wed, 21 Oct 2020 15:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10096.26625; Wed, 21 Oct 2020 15:12:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVFmx-0000LH-6m; Wed, 21 Oct 2020 15:12:31 +0000
Received: by outflank-mailman (input) for mailman id 10096;
 Wed, 21 Oct 2020 15:12:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WgZ=D4=gmail.com=dav.sec.lists@srs-us1.protection.inumbo.net>)
 id 1kVFmv-0000L9-Eh
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:12:29 +0000
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 705fbda5-3143-4488-8600-f762eb3d4571;
 Wed, 21 Oct 2020 15:12:28 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id h24so3747413ejg.9
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 08:12:28 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7WgZ=D4=gmail.com=dav.sec.lists@srs-us1.protection.inumbo.net>)
	id 1kVFmv-0000L9-Eh
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:12:29 +0000
X-Inumbo-ID: 705fbda5-3143-4488-8600-f762eb3d4571
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 705fbda5-3143-4488-8600-f762eb3d4571;
	Wed, 21 Oct 2020 15:12:28 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id h24so3747413ejg.9
        for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RYdevE8O7fcX49s4xRX8ALJXkbrB3dmIdvFUcG0HyOU=;
        b=tq6F7D5wyxDxGWvAPRsIFShyjSTzZXLaC5Zd67FR7446NA2CWtUS/rnMYbGp/XVanY
         rjIaJ/U3XiAw3Da4hPTb7U+BGJSnp8rJQ//VOOnmdPodeqibsPh/sy4lh9vxTz9tDLLw
         B9z/ksG3RXgSk4HhRD1A463Blc6C1oRY0hNGJz5gXaPrTLkVAmTOLQ7YO8S07l/WbYQV
         q9ORdGpVPvj3ZZmrPtJkTbs5K954Kx08hyVP7kKzMTpMGy3NVwg8EboGNtVxXahJGUoM
         mnrJDuByECNLD5QBC3uMxdVIBQUbXF0dLVK1jq/QdgKhQ4QzgSIwy8JWaLhjdhE5huDz
         WJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RYdevE8O7fcX49s4xRX8ALJXkbrB3dmIdvFUcG0HyOU=;
        b=nwx5QdclhSpUqhMnq1xp1WSTse/jOPW+TZIjsp/QngviAg4lu25oFY7W1OWWM7Af4F
         Pk0A7FGJ8ndLlU6N9f2d5Te/n/M1Fr4M7NKUTlvANRit15k6aAzLsn0Oyn2lICIzx1St
         Li0YJzjoWqYSMEx+Rj6ahOKgom8lAasku1dRdpxHrMlInu5HeLjaonIHF/9cItHQfLv8
         6FV4TxQakugOKn9F7PMGECT3PXJIOgrhntnSGt1rOI6skcNB7H9SnVQDTGql/QtryRmI
         +4SXA5bt4Ucu9VTJe5iHDwwBIuEY8NFmtghdMGtMIt/N7SxLsMzbVoFn6FDEq3eWg96S
         S59A==
X-Gm-Message-State: AOAM532MTBbym7/43aaWFW6GknPXUJZPLuWBtWay6HxnHO3htBnHDkWi
	Evt7E+sLZxAg1Byqa3sjisRakuPwa+CfaMkaSbY=
X-Google-Smtp-Source: ABdhPJyy0bU7jGp+facbpScCyQkneW5xCWcCrLFApUCsPGjRNcpw9O0XYm+0zA6yK8+GPJ2qvu3kCuIQA5uqrWd7IQY=
X-Received: by 2002:a17:906:3641:: with SMTP id r1mr3820492ejb.405.1603293147428;
 Wed, 21 Oct 2020 08:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
 <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com> <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
 <CA+js8L=dCJkE6y=GO2WNc0ufLaOXkx1BsMg3soCw+=wyDduPMQ@mail.gmail.com>
 <CA+js8LnzTkPtQXhQ-N85rM4Qd3HC2SpRQ5ZoSzh4CVx92tNYNQ@mail.gmail.com>
 <20200916161206.GA20338@aepfle.de> <e68fd134-bb40-8646-89f0-dd8241737342@knorrie.org>
In-Reply-To: <e68fd134-bb40-8646-89f0-dd8241737342@knorrie.org>
From: David I <dav.sec.lists@gmail.com>
Date: Wed, 21 Oct 2020 17:12:16 +0200
Message-ID: <CA+js8Lm9gQK_8A6zJnA6irZfVsFNAeuwGt+Jj3LsJR8MyjDd8A@mail.gmail.com>
Subject: Re: Compiling Xen from source
To: Hans van Kranenburg <hans@knorrie.org>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/alternative; boundary="00000000000085fae005b22fc6fe"

--00000000000085fae005b22fc6fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

for information, I was able to compile xen from source on Debian 10, with
the following configuration:


david@debian:~/xen/xen$ uname -a
Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64
GNU/Linux
david@debian:~/xen/xen$ gcc --version
gcc (Debian 8.4.0-4) 8.4.0
Copyright =C2=A9 2018 Free Software Foundation, Inc.
Ce logiciel est un logiciel libre; voir les sources pour les conditions de
copie.  Il n'y a
AUCUNE GARANTIE, pas m=C3=AAme pour la COMMERCIALISATION ni L'AD=C3=89QUATI=
ON =C3=80 UNE
T=C3=82CHE PARTICULI=C3=88RE.

david@debian:~/xen/xen$ git branch
  master
  stable-4.11
* stable-4.13
  stable-4.14
  staging
david@debian:~/xen/xen$

with a simple: "./configure && make dist".
But I had to modify some config files following the thread here:

http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-xen-Disable-Werror=
-when-building-td145149.html

the first build failed with a message: "configure test passed without
-werror but failed with -error".
I had to resolve this to edit these files:

xen/Config.mk:

+-HOSTCFLAGS  =3D -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointe=
r
++HOSTCFLAGS  =3D -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer

xen/xen/arch/x86/Rules.mk:

+-CFLAGS +=3D '-D__OBJECT_LABEL__=3D$(subst /,$$,$(subst -,_,$(subst
$(BASEDIR)/,,$(CURDIR))/$@))'
++CFLAGS +=3D -U__OBJECT_LABEL__ '-D__OBJECT_LABEL__=3D$(subst /,$$,$(subst
-,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))'

xen/Rules.mk:
+-CFLAGS +=3D '-D__OBJECT_FILE__=3D"$@"'
++CFLAGS +=3D -U__OBJECT_FILE__ '-D__OBJECT_FILE__=3D"$@"'

I haven't tested the binary yet.

Kind regards,

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

--00000000000085fae005b22fc6fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>for information, I was able to c=
ompile xen from source on Debian 10, with the following configuration:</div=
><div><br></div><div><br></div><div>david@debian:~/xen/xen$ uname -a<br>Lin=
ux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64 GNU/Linu=
x<br>david@debian:~/xen/xen$ gcc --version<br>gcc (Debian 8.4.0-4) 8.4.0<br=
>Copyright =C2=A9 2018 Free Software Foundation, Inc.<br>Ce logiciel est un=
 logiciel libre; voir les sources pour les conditions de copie.=C2=A0 Il n&=
#39;y a<br>AUCUNE GARANTIE, pas m=C3=AAme pour la COMMERCIALISATION ni L&#3=
9;AD=C3=89QUATION =C3=80 UNE T=C3=82CHE PARTICULI=C3=88RE.<br><br>david@deb=
ian:~/xen/xen$ git branch<br>=C2=A0 master<br>=C2=A0 stable-4.11<br>* stabl=
e-4.13<br>=C2=A0 stable-4.14<br>=C2=A0 staging<br>david@debian:~/xen/xen$=
=C2=A0<br></div><div><br></div><div>with a simple: &quot;./configure &amp;&=
amp; make dist&quot;.</div><div>But I had to modify some config files follo=
wing the thread here:</div><div><br></div><div><a href=3D"http://buildroot-=
busybox.2317881.n4.nabble.com/PATCH-1-2-xen-Disable-Werror-when-building-td=
145149.html">http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-xen-D=
isable-Werror-when-building-td145149.html</a><br></div><div><br></div><div>=
the first build failed with a message: &quot;configure test passed without =
-werror but failed with -error&quot;.</div><div>I had to resolve this to ed=
it these files:</div><div><br></div><div>xen/Config.mk:</div><div><br></div=
><div>+-HOSTCFLAGS =C2=A0=3D -Wall -Werror -Wstrict-prototypes -O2 -fomit-f=
rame-pointer<br></div><div>++HOSTCFLAGS =C2=A0=3D -Wall -Wstrict-prototypes=
 -O2 -fomit-frame-pointer<br></div><div><br></div><div>xen/xen/arch/x86/Rul=
es.mk:<br></div><div><br></div><div>+-CFLAGS +=3D &#39;-D__OBJECT_LABEL__=
=3D$(subst /,$$,$(subst -,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))&#39;<br></=
div><div>++CFLAGS +=3D -U__OBJECT_LABEL__ &#39;-D__OBJECT_LABEL__=3D$(subst=
 /,$$,$(subst -,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))&#39;<br></div><div><=
br></div><div>xen/Rules.mk:<br></div><div>+-CFLAGS +=3D &#39;-D__OBJECT_FIL=
E__=3D&quot;$@&quot;&#39;<br></div><div>++CFLAGS +=3D -U__OBJECT_FILE__ &#3=
9;-D__OBJECT_FILE__=3D&quot;$@&quot;&#39;<br></div><div><br></div><div>I ha=
ven&#39;t tested the binary yet.</div><div><br></div><div>Kind regards,</di=
v><div><br></div><div>David</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 16 sept. 2020 =C3=A0=C2=A022:=
59, Hans van Kranenburg &lt;<a href=3D"mailto:hans@knorrie.org">hans@knorri=
e.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/16/20 6:12 PM, Olaf Hering wrote:<br>
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

--00000000000085fae005b22fc6fe--

