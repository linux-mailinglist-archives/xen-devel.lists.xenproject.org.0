Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A784E71A4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 11:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294654.501103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhXY-0000aN-9f; Fri, 25 Mar 2022 10:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294654.501103; Fri, 25 Mar 2022 10:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhXY-0000Xl-6c; Fri, 25 Mar 2022 10:51:32 +0000
Received: by outflank-mailman (input) for mailman id 294654;
 Fri, 25 Mar 2022 10:51:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ci4N=UE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXhXW-0000Xf-Ly
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 10:51:30 +0000
Received: from MTA-08-3.privateemail.com (mta-08-3.privateemail.com
 [198.54.127.61]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85cc85b9-ac29-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 11:51:29 +0100 (CET)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 72ADC18000A2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 06:51:27 -0400 (EDT)
Received: from mail-oa1-f48.google.com (unknown [10.20.151.145])
 by mta-08.privateemail.com (Postfix) with ESMTPA id 4E11518000A1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 06:51:27 -0400 (EDT)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so7715750fac.11
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 03:51:27 -0700 (PDT)
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
X-Inumbo-ID: 85cc85b9-ac29-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648205487;
	bh=XOuiBPyL5VTE8kxtvG/wTno3YDXq4iRbzb84h7PeGC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PKE3dguXdAIv10OTvCttx2c1TX7KMQ0XyoIpYnBuf4I0DONDuIlSlJAMjhpF0+l4n
	 ZBXnMnx1YY2z/Pm+W3yKJcIIKdzq+M8A00W9iH2tHd1ghomwvkmjjX5F1i/FmT7fTO
	 DGVBXylT5nOMbqt8KlEdyO0LdoYDZgzZ+OdO3lev+QyzfO8ZCIKZgiJ41v0Bp3R9H9
	 WCUeKl3aqTZDL6/OV+PgGsfIqeRisxprLBybKuYpW5lehBFMV+iAgUJDVVs/7mGyY3
	 H+1yJELSBtSMF3As4qyGJRw01PsioTtVQ+KChS+EgXuiQ1+8Q6h/mOdStIzO+Y7rwH
	 FC/5Sq2m/EaGA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648205487;
	bh=XOuiBPyL5VTE8kxtvG/wTno3YDXq4iRbzb84h7PeGC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PKE3dguXdAIv10OTvCttx2c1TX7KMQ0XyoIpYnBuf4I0DONDuIlSlJAMjhpF0+l4n
	 ZBXnMnx1YY2z/Pm+W3yKJcIIKdzq+M8A00W9iH2tHd1ghomwvkmjjX5F1i/FmT7fTO
	 DGVBXylT5nOMbqt8KlEdyO0LdoYDZgzZ+OdO3lev+QyzfO8ZCIKZgiJ41v0Bp3R9H9
	 WCUeKl3aqTZDL6/OV+PgGsfIqeRisxprLBybKuYpW5lehBFMV+iAgUJDVVs/7mGyY3
	 H+1yJELSBtSMF3As4qyGJRw01PsioTtVQ+KChS+EgXuiQ1+8Q6h/mOdStIzO+Y7rwH
	 FC/5Sq2m/EaGA==
X-Gm-Message-State: AOAM530TQ40W3CJ5QiCBkE3eSVnkbWMdt/eUhVlULGawpuPfOD8q9lrc
	Jp+v6d8q2J/+U/vRp4U+CG5Lm2YaSiAjIOkDfPw=
X-Google-Smtp-Source: ABdhPJz2eyjPu9VKFJdLw7R/+ykR6D6Y3HTyN+LC1BjCdLmAUxZVTCHcyS+DXjfJjkYMvt4eDquA5m+wIUvvkyUYOnc=
X-Received: by 2002:a05:6870:b250:b0:de:afd3:e1c4 with SMTP id
 b16-20020a056870b25000b000deafd3e1c4mr816058oam.128.1648205486691; Fri, 25
 Mar 2022 03:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <YjyFODl7VFJLaj0c@Air-de-Roger> <CABfawhk9n08bmXWO1iM7Sz-5uhzuT5W6BZzj+yNDW1+FFDA5GA@mail.gmail.com>
 <YjyTf4INCjKWD09n@Air-de-Roger> <CABfawhmWtxpb3E_vxRRAV6b=P7_T3Mhd+rZ=_XY+6J3-vv+-+w@mail.gmail.com>
 <Yj2Ykz2diY5RTjbS@Air-de-Roger>
In-Reply-To: <Yj2Ykz2diY5RTjbS@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 25 Mar 2022 06:51:14 -0400
X-Gmail-Original-Message-ID: <CABfawh=3i2fWhDyd3Yqg4Zt1NN3tiqYOH3KWTYFxy6L3cqHFBg@mail.gmail.com>
Message-ID: <CABfawh=3i2fWhDyd3Yqg4Zt1NN3tiqYOH3KWTYFxy6L3cqHFBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000008d16d605db08be55"
X-Virus-Scanned: ClamAV using ClamSMTP

--0000000000008d16d605db08be55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022, 6:25 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:

> On Thu, Mar 24, 2022 at 12:27:02PM -0400, Tamas K Lengyel wrote:
> > On Thu, Mar 24, 2022 at 11:51 AM Roger Pau Monn=C3=A9 <roger.pau@citrix=
.com>
> wrote:
> > >
> > > On Thu, Mar 24, 2022 at 11:15:08AM -0400, Tamas K Lengyel wrote:
> > > > On Thu, Mar 24, 2022 at 10:50 AM Roger Pau Monn=C3=A9 <
> roger.pau@citrix.com> wrote:
> > > > >
> > > > > On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > > > > > +    {
> > > > > > +        cd->arch.hvm.mem_sharing.block_interrupts =3D
> block_interrupts;
> > > > > > +        cd->arch.hvm.mem_sharing.skip_special_pages =3D
> skip_special_pages;
> > > > > > +        /* skip mapping the vAPIC page on unpause if skipping
> special pages */
> > > > > > +        cd->creation_finished =3D skip_special_pages;
> > > > >
> > > > > I think this is dangerous. While it might be true at the moment
> that
> > > > > the arch_domain_creation_finished only maps the vAPIC page,
> there's no
> > > > > guarantee it couldn't do other stuff in the future that could be
> > > > > required for the VM to be started.
> > > >
> > > > I understand this domain_creation_finished route could be expanded =
in
> > > > the future to include other stuff, but IMHO we can evaluate what to
> do
> > > > about that when and if it becomes necessary. This is all experiment=
al
> > > > to begin with.
> > >
> > > Maybe you could check the skip_special_pages field from
> > > domain_creation_finished in order to decide whether the vAPIC page
> > > needs to be mapped?
> >
> > Could certainly do that but it means adding experimental code in an
> > #ifdef to the vAPIC mapping logic. Technically nothing wrong with that
> > but I would prefer keeping all this code in a single-place if
> > possible.
>
> I see, while I agree it's best to keep the code contained when
> possible, I think in this case it's better to modify the hook,
> specially because further changes to domain_creation_finished will
> easily spot that this path is special cases for VM forks.
>
> While the code is experimental it doesn't mean it shouldn't be
> properly integrated with the rest of the code base.
>

Sure, I'm fine with moving it there.

Tamas

>

--0000000000008d16d605db08be55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022, 6:25 AM Roger Pau Monn=C3=A9 &lt=
;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Thu, Mar 24, 2022 at 12:27:02P=
M -0400, Tamas K Lengyel wrote:<br>
&gt; On Thu, Mar 24, 2022 at 11:51 AM Roger Pau Monn=C3=A9 &lt;<a href=3D"m=
ailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">roger.pau@=
citrix.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Mar 24, 2022 at 11:15:08AM -0400, Tamas K Lengyel wrote:<=
br>
&gt; &gt; &gt; On Thu, Mar 24, 2022 at 10:50 AM Roger Pau Monn=C3=A9 &lt;<a=
 href=3D"mailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">=
roger.pau@citrix.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengy=
el wrote:<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd-&gt;arch.hvm.mem_s=
haring.block_interrupts =3D block_interrupts;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd-&gt;arch.hvm.mem_s=
haring.skip_special_pages =3D skip_special_pages;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* skip mapping the v=
APIC page on unpause if skipping special pages */<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd-&gt;creation_finis=
hed =3D skip_special_pages;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I think this is dangerous. While it might be true at th=
e moment that<br>
&gt; &gt; &gt; &gt; the arch_domain_creation_finished only maps the vAPIC p=
age, there&#39;s no<br>
&gt; &gt; &gt; &gt; guarantee it couldn&#39;t do other stuff in the future =
that could be<br>
&gt; &gt; &gt; &gt; required for the VM to be started.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I understand this domain_creation_finished route could be ex=
panded in<br>
&gt; &gt; &gt; the future to include other stuff, but IMHO we can evaluate =
what to do<br>
&gt; &gt; &gt; about that when and if it becomes necessary. This is all exp=
erimental<br>
&gt; &gt; &gt; to begin with.<br>
&gt; &gt;<br>
&gt; &gt; Maybe you could check the skip_special_pages field from<br>
&gt; &gt; domain_creation_finished in order to decide whether the vAPIC pag=
e<br>
&gt; &gt; needs to be mapped?<br>
&gt; <br>
&gt; Could certainly do that but it means adding experimental code in an<br=
>
&gt; #ifdef to the vAPIC mapping logic. Technically nothing wrong with that=
<br>
&gt; but I would prefer keeping all this code in a single-place if<br>
&gt; possible.<br>
<br>
I see, while I agree it&#39;s best to keep the code contained when<br>
possible, I think in this case it&#39;s better to modify the hook,<br>
specially because further changes to domain_creation_finished will<br>
easily spot that this path is special cases for VM forks.<br>
<br>
While the code is experimental it doesn&#39;t mean it shouldn&#39;t be<br>
properly integrated with the rest of the code base.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Sure, I&#39;m fine with =
moving it there.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tamas</=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
</blockquote></div></div></div>

--0000000000008d16d605db08be55--

