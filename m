Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160356C111F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511858.791212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDz3-0002an-7j; Mon, 20 Mar 2023 11:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511858.791212; Mon, 20 Mar 2023 11:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDz3-0002YD-4a; Mon, 20 Mar 2023 11:47:25 +0000
Received: by outflank-mailman (input) for mailman id 511858;
 Mon, 20 Mar 2023 11:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=noC+=7M=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1peDz1-0002Y5-O9
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:47:23 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ee1b63-c714-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 12:47:22 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id 20so4626122lju.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 04:47:22 -0700 (PDT)
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
X-Inumbo-ID: f9ee1b63-c714-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679312842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yblBtippYXTSVSq31INAX+4Px6D0HgA57v+Fc3Zbve0=;
        b=b616dmlLorOwHh4Ds3OcaKZSsDSl5P1BBSVHkSO5/ywqfv5Lgo9Th4xd8+x3SCmgr9
         zK+vTyt/cDxKD3iWRA4vlv7dA+bXyDkTqXR00AKUdxf7SbdkzfUhC6jU4b8uGbgw1JXA
         amHUP7MiYl8UPi4mTGSYUl6oE61EKg+R73EwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yblBtippYXTSVSq31INAX+4Px6D0HgA57v+Fc3Zbve0=;
        b=yh680CA/vVXNTKmZUsz5fFwWH4PQpoA1Hd47DM2O6kABu3TgkNaXXXQTgvscuf+R0B
         xTgYMvMrK/wE+6o02sxWhiMbSqM2yeX4psqIIUbplYi7O1v2GgNV36C5ci3GAhiID96X
         nDdVyz09hMMS/dH5B5KabegckKFmU4lKJaEzAgy+ztHUnDHg/nq0bH0bc/R8pzrHgeOQ
         Uu8QXNVEhwNWZQojtthT8z+9Tc2TUbwoGRZaLgwNCTA/ufgvwwrYj1rv4fe29Jx9biMn
         3cOT8seIySmGxuCFgmkpGa4iNRhwNgRh5R49x7K8+/+gpux4Ur/3kM33QU6e140RY2NJ
         WdvA==
X-Gm-Message-State: AO0yUKUHZ34Xge0MDMEVtL91sty5Rmr4neHKlzAwEyAD3aYae5bafxn9
	/H8/yD2i2mkslnSOg+51Gj4tE1nuwDwb5Zel42x0Ng==
X-Google-Smtp-Source: AK7set/aXw0GtMRGye5J+hi6R1Do4FNIxYvRyQfOcHkRDsOnb+mmqpGQr6BcMAfJ5GOEIPJ2hSYYMLicwDBqPCcPM1U=
X-Received: by 2002:a2e:7219:0:b0:299:a9db:a4 with SMTP id n25-20020a2e7219000000b00299a9db00a4mr4586782ljc.6.1679312841968;
 Mon, 20 Mar 2023 04:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <e36a472b3e58ee81e8d61e7306f0ee2068eff62a.1677356813.git.demi@invisiblethingslab.com>
 <db7d6e42-2fd5-b7f0-ec84-ca7ffcf5d105@suse.com> <Y/z6blqd1+e22B3a@itl-email>
In-Reply-To: <Y/z6blqd1+e22B3a@itl-email>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 20 Mar 2023 11:47:11 +0000
Message-ID: <CA+zSX=ZbnZbG5RoZDVmLcpWym5jaRUDsjmfr0FsMmKzJrJK9yA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] Change remaining xenbits.xen.org links to HTTPS
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000699f9905f7537d0e"

--000000000000699f9905f7537d0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 6:46=E2=80=AFPM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> On Mon, Feb 27, 2023 at 09:35:51AM +0100, Jan Beulich wrote:
> > On 25.02.2023 21:37, Demi Marie Obenour wrote:
> > > --- a/Config.mk
> > > +++ b/Config.mk
> > > @@ -191,7 +191,7 @@ APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES=
),
> -I$(i))
> > >  EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector
> -fno-stack-protector-all
> > >  EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions
> -fno-asynchronous-unwind-tables
> > >
> > > -XEN_EXTFILES_URL ?=3D http://xenbits.xen.org/xen-extfiles
> > > +XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
> > >  # All the files at that location were downloaded from elsewhere on
> > >  # the internet.  The original download URL is preserved as a comment
> > >  # near the place in the Xen Makefiles where the file is used.
> > > diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
> > > index
> 68819b2d739cea5491b53f9b944ee2bd20d92c2b..548db4b5da2691547438df5d7d58e5b=
4c3bd90d0
> 100644
> > > --- a/tools/misc/mkrpm
> > > +++ b/tools/misc/mkrpm
> > > @@ -34,7 +34,7 @@ Version: $version
> > >  Release: $release
> > >  License: GPL
> > >  Group:   System/Hypervisor
> > > -URL: http://xenbits.xenproject.org/xen.git
> > > +URL: https://xenbits.xen.org/git-http/xen.git
> >
> > Please can you not lose "project" from the URL? That's the more modern
> > form, after all. In fact, since you're touching the other URL above
> > anyway, I wonder if it wouldn't be a good idea to insert "project"
> > there as well. With at least the former adjustment (which I suppose
> > can be done while committing, as long as you agree)
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I=E2=80=99m fine with either or both of those adjustments.  I was not awa=
re that
> https://xenbits.xen.org is an alias for https://xenbits.xenproject.org.
>

"xen.org" is the original.  When Xen joined the Linux Foundation, there
were some complications with the trademark: Citrix had renamed all their
products to XenFoo (even those which had nothing to do with Xen), and so
wanted to keep the trademark; but the LF felt they needed a trademark they
could own & enforce.  The solution the lawyers came up with was for Citrix
to allow the LF to own the trademark to "The Xen Project", while Citrix
retained the trademark to "Xen".  Everything was meant to have shifted over
to "xenproject.org", but of course "xen.org" was kept around to avoid
breaking links; and here we are, 10 years later.

Neither LF nor CSG are particularly trigger-happy with lawsuits, so it's
not a huge deal, but all things being equal, it's better to use "
xenproject.org"; and switching to "xen.org" is certainly a (small)
regression.

 -George

--000000000000699f9905f7537d0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 27, 2023 at 6:46=E2=80=AF=
PM Demi Marie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com">de=
mi@invisiblethingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Mon, Feb 27, 2023 at 09:35:51AM +0100, Jan Beul=
ich wrote:<br>
&gt; On 25.02.2023 21:37, Demi Marie Obenour wrote:<br>
&gt; &gt; --- a/Config.mk<br>
&gt; &gt; +++ b/Config.mk<br>
&gt; &gt; @@ -191,7 +191,7 @@ APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCL=
UDES), -I$(i))<br>
&gt; &gt;=C2=A0 EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector -f=
no-stack-protector-all<br>
&gt; &gt;=C2=A0 EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronou=
s-unwind-tables<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -XEN_EXTFILES_URL ?=3D <a href=3D"http://xenbits.xen.org/xen-extf=
iles" rel=3D"noreferrer" target=3D"_blank">http://xenbits.xen.org/xen-extfi=
les</a><br>
&gt; &gt; +XEN_EXTFILES_URL ?=3D <a href=3D"https://xenbits.xen.org/xen-ext=
files" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/xen-ext=
files</a><br>
&gt; &gt;=C2=A0 # All the files at that location were downloaded from elsew=
here on<br>
&gt; &gt;=C2=A0 # the internet.=C2=A0 The original download URL is preserve=
d as a comment<br>
&gt; &gt;=C2=A0 # near the place in the Xen Makefiles where the file is use=
d.<br>
&gt; &gt; diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm<br>
&gt; &gt; index 68819b2d739cea5491b53f9b944ee2bd20d92c2b..548db4b5da2691547=
438df5d7d58e5b4c3bd90d0 100644<br>
&gt; &gt; --- a/tools/misc/mkrpm<br>
&gt; &gt; +++ b/tools/misc/mkrpm<br>
&gt; &gt; @@ -34,7 +34,7 @@ Version: $version<br>
&gt; &gt;=C2=A0 Release: $release<br>
&gt; &gt;=C2=A0 License: GPL<br>
&gt; &gt;=C2=A0 Group:=C2=A0 =C2=A0System/Hypervisor<br>
&gt; &gt; -URL: <a href=3D"http://xenbits.xenproject.org/xen.git" rel=3D"no=
referrer" target=3D"_blank">http://xenbits.xenproject.org/xen.git</a><br>
&gt; &gt; +URL: <a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D=
"noreferrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a>=
<br>
&gt; <br>
&gt; Please can you not lose &quot;project&quot; from the URL? That&#39;s t=
he more modern<br>
&gt; form, after all. In fact, since you&#39;re touching the other URL abov=
e<br>
&gt; anyway, I wonder if it wouldn&#39;t be a good idea to insert &quot;pro=
ject&quot;<br>
&gt; there as well. With at least the former adjustment (which I suppose<br=
>
&gt; can be done while committing, as long as you agree)<br>
&gt; Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
<br>
I=E2=80=99m fine with either or both of those adjustments.=C2=A0 I was not =
aware that<br>
<a href=3D"https://xenbits.xen.org" rel=3D"noreferrer" target=3D"_blank">ht=
tps://xenbits.xen.org</a> is an alias for <a href=3D"https://xenbits.xenpro=
ject.org" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xenproject.o=
rg</a>.<br></blockquote><div><br></div><div>&quot;<a href=3D"http://xen.org=
">xen.org</a>&quot; is the original.=C2=A0 When Xen joined the Linux Founda=
tion, there were some complications with the trademark: Citrix had renamed =
all their products to XenFoo=C2=A0(even those which had nothing to do with =
Xen), and so wanted to keep the trademark; but the LF felt=C2=A0they needed=
 a trademark they could own &amp; enforce.=C2=A0 The solution the lawyers c=
ame up with was for Citrix to allow the LF to own the trademark to &quot;Th=
e Xen Project&quot;, while Citrix retained the trademark to &quot;Xen&quot;=
.=C2=A0 Everything was meant to have shifted over to &quot;<a href=3D"http:=
//xenproject.org">xenproject.org</a>&quot;, but of course &quot;<a href=3D"=
http://xen.org">xen.org</a>&quot; was kept around to avoid breaking links; =
and here we are, 10 years later.</div><div><br></div><div>Neither LF nor=C2=
=A0CSG are particularly trigger-happy with lawsuits, so it&#39;s not a huge=
 deal, but all things being equal, it&#39;s better to use &quot;<a href=3D"=
http://xenproject.org">xenproject.org</a>&quot;; and switching to &quot;<a =
href=3D"http://xen.org">xen.org</a>&quot; is certainly a (small) regression=
.</div><div><br></div><div>=C2=A0-George</div></div></div>

--000000000000699f9905f7537d0e--

