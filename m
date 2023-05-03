Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339D6F563F
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 12:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529087.823080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9lP-00005U-49; Wed, 03 May 2023 10:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529087.823080; Wed, 03 May 2023 10:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9lP-0008Uu-0T; Wed, 03 May 2023 10:31:11 +0000
Received: by outflank-mailman (input) for mailman id 529087;
 Wed, 03 May 2023 10:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDiC=AY=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pu9lN-0008Uo-7S
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:31:09 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bddfd91-e99d-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 12:31:05 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ecb137af7eso5789766e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 03:31:05 -0700 (PDT)
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
X-Inumbo-ID: 9bddfd91-e99d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683109865; x=1685701865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XH75TWJ2QK3zdQ/KOUS0feKVGadWx7stMsjQVAPoLPk=;
        b=Rb6ZOSztdPJhHIt2xej/h224+3Edu0xk4ke2X6vH/IPAL9jb/53cT5nEH28c/Hd/NS
         FBXA2zZiZDPjX3+hd0FWPEM6O5yybznZra2LbJvbY63ylhYayOIUNjFmsACgjrfZfj1R
         ax8Jj3NOCDOU1Rgzr9DtemrhagdEwAdBAkCIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683109865; x=1685701865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH75TWJ2QK3zdQ/KOUS0feKVGadWx7stMsjQVAPoLPk=;
        b=cU9+0PJj2BK7vXbtrUZPP764PfPXpNuaYmGWdV1/IVcWF3OYzLpxT7PYFQHGyTqbEE
         po7jVr5kBS69Ky4Kc31wEaDgRuXtu1HgpqdzXgoxdURIzYgYokcaP8yQJJdamp/xxJfd
         x+dl3pEtTYB0AHc68DcalGzzgf5QowWaXhDYY/svfsKzhy17Rgs2+snw3MktAACt0iuB
         6dbAnVO03pNtc4s5edn16LhIqXUGv//zD/ftDMaecDbZC4ArEBlWV76f6Qw4+bpasZ8L
         7cvVsWziOf8vlzZISb/IFk6B3qCpw7cjAvjB/fKOJ1UxuWmF8kwRk5EHCjy8NrK69hH5
         hTnA==
X-Gm-Message-State: AC+VfDxsPc3bFV4qqIFAKTAwZuWCh92FNk0Uwgvoa+BFKka3rSAWpxTQ
	oX0VAULD07BdMLBFywfl00rians+LENjRkmgyErpFw==
X-Google-Smtp-Source: ACHHUZ6hTs76I1dbN2GtIr2MCjXCJG09adCJ7BxIwzWF6znw3MNSgQAe1EX5GBuLa33kH0FpAh1BgdXq7yUDWaIdrAg=
X-Received: by 2002:ac2:5ec2:0:b0:4dd:af71:a5b7 with SMTP id
 d2-20020ac25ec2000000b004ddaf71a5b7mr819878lfq.41.1683109864742; Wed, 03 May
 2023 03:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230428081231.2464275-1-george.dunlap@cloud.com> <b5292073-c675-587e-e19c-cbbeead41a7c@suse.com>
In-Reply-To: <b5292073-c675-587e-e19c-cbbeead41a7c@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 3 May 2023 11:30:53 +0100
Message-ID: <CA+zSX=YKzn6qqie3cKd-78Q5Sqhux3eok3CDwr=jQbJed8NzHw@mail.gmail.com>
Subject: Re: [PATCH RFC] SUPPORT.md: Make all security support explicit
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper@cloud.com>, 
	Roger Pau Monne <roger.pau@cloud.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009b382e05fac78d41"

--0000000000009b382e05fac78d41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 12:19=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 28.04.2023 10:12, George Dunlap wrote:
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -17,6 +17,36 @@ for the definitions of the support status levels etc=
.
> >  Release Notes
> >  : <a href=3D"
> https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
> >
> > +# General security support
> > +
> > +An XSA will always be issued for security-related bugs which are
> > +present in a "plain vanilla" configuration.  A "plain vanilla"
> > +configuration is defined as follows:
> > +
> > +* The Xen hypervisor is built from a tagged release of Xen, or a
> > +  commit which was on the tip of one of the supported stable branches.
> > +
> > +* The Xen hypervisor was built with the default config for the platfor=
m
> > +
> > +* No Xen command-line parameters were specified
> > +
> > +* No parameters for Xen-related drivers in the Linux kernel were
> specified
> > +
> > +* No modifications were made to the default xl.conf
> > +
> > +* xl.cfg files use only core functionality
> > +
> > +* Alternate toolstacks only activate functionality activated by the
> > +  core functionality of xl.cfg files.
> > +
> > +Any system outside this configuration will only be considered security
> > +supported if the functionality is explicitly listed as supported in
> > +this document.
> > +
> > +If a security-related bug exits only in a configuration listed as not
> > +security supported, the security team will generally not issue an XSA;
> > +the bug will simply be handled in public.
>
> In this last paragraph, did you perhaps mean "not listed as security
> supported"? Otherwise we wouldn't improve our situation, unless I'm
> misunderstanding and word order doesn't matter here in English. In which
> case some unambiguous wording would need to be found.
>

No, I think your wording is more accurate.

 -George

--0000000000009b382e05fac78d41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 2, 2023 at 12:19=E2=80=AF=
PM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">j=
beulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 28.04.2023 10:12, George Dunlap wrote:<br>
&gt; --- a/SUPPORT.md<br>
&gt; +++ b/SUPPORT.md<br>
&gt; @@ -17,6 +17,36 @@ for the definitions of the support status levels et=
c.<br>
&gt;=C2=A0 Release Notes<br>
&gt;=C2=A0 : &lt;a href=3D&quot;<a href=3D"https://wiki.xenproject.org/wiki=
/Xen_Project_X.YY_Release_Notes" rel=3D"noreferrer" target=3D"_blank">https=
://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes</a>&quot;&gt;RN&=
lt;/a&gt;<br>
&gt;=C2=A0 <br>
&gt; +# General security support<br>
&gt; +<br>
&gt; +An XSA will always be issued for security-related bugs which are<br>
&gt; +present in a &quot;plain vanilla&quot; configuration.=C2=A0 A &quot;p=
lain vanilla&quot;<br>
&gt; +configuration is defined as follows:<br>
&gt; +<br>
&gt; +* The Xen hypervisor is built from a tagged release of Xen, or a<br>
&gt; +=C2=A0 commit which was on the tip of one of the supported stable bra=
nches.<br>
&gt; +<br>
&gt; +* The Xen hypervisor was built with the default config for the platfo=
rm<br>
&gt; +<br>
&gt; +* No Xen command-line parameters were specified<br>
&gt; +<br>
&gt; +* No parameters for Xen-related drivers in the Linux kernel were spec=
ified<br>
&gt; +<br>
&gt; +* No modifications were made to the default xl.conf<br>
&gt; +<br>
&gt; +* xl.cfg files use only core functionality<br>
&gt; +<br>
&gt; +* Alternate toolstacks only activate functionality activated by the<b=
r>
&gt; +=C2=A0 core functionality of xl.cfg files.<br>
&gt; +<br>
&gt; +Any system outside this configuration will only be considered securit=
y<br>
&gt; +supported if the functionality is explicitly listed as supported in<b=
r>
&gt; +this document.<br>
&gt; +<br>
&gt; +If a security-related bug exits only in a configuration listed as not=
<br>
&gt; +security supported, the security team will generally not issue an XSA=
;<br>
&gt; +the bug will simply be handled in public.<br>
<br>
In this last paragraph, did you perhaps mean &quot;not listed as security<b=
r>
supported&quot;? Otherwise we wouldn&#39;t improve our situation, unless I&=
#39;m<br>
misunderstanding and word order doesn&#39;t matter here in English. In whic=
h<br>
case some unambiguous wording would need to be found.<br></blockquote><div>=
<br></div><div>No, I think your wording is more accurate.</div><div><br></d=
iv><div>=C2=A0-George=C2=A0</div></div></div>

--0000000000009b382e05fac78d41--

