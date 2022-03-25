Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB284E72CB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 13:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294691.501186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXipR-00040c-GP; Fri, 25 Mar 2022 12:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294691.501186; Fri, 25 Mar 2022 12:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXipR-0003yG-Co; Fri, 25 Mar 2022 12:14:05 +0000
Received: by outflank-mailman (input) for mailman id 294691;
 Fri, 25 Mar 2022 12:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ci4N=UE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXipP-0003yA-SL
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 12:14:03 +0000
Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com
 [198.54.127.107]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e07d9e0-ac35-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 13:14:02 +0100 (CET)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 70D6018000A7
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 08:14:00 -0400 (EDT)
Received: from mail-ot1-f43.google.com (unknown [10.20.151.164])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 4BE2C18000A4
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 08:14:00 -0400 (EDT)
Received: by mail-ot1-f43.google.com with SMTP id
 i23-20020a9d6117000000b005cb58c354e6so5326378otj.10
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 05:14:00 -0700 (PDT)
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
X-Inumbo-ID: 0e07d9e0-ac35-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648210440;
	bh=rrGm61avDbudCrncqhzHZL3yzabp4gVQ5s1kdZTnim8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYAdufZJ0vr+s8VEoBFFBM/Ck3F59gXpBzAR8J7QsvD+68bKfClYFYV3UvkuKHCuU
	 wxf+5IOHgicz1jr/Yt7uc3TZpBGM2qC0+xBgSPkdvDvGXUDQ+rgF8W1akC5CECtacw
	 2g9EbL1MAb4sk/kkme1duVhMSmROeTPy61EAr/HQdeWGPcjXNKhGewIhs5u1mp0fvp
	 Se8vzgYxk75OmL9ALMxVB6z1969UhuQyrIzU3ERoPTzRCpXwlc15Ri2HJGAZPe8qGk
	 ZkFIoTLdLt5zmM/yjVe+7DxM03GC68QlOyXGwOIg03Hto3gQcOaHxYG3O0j5O3cMxA
	 VgjRkl4Pb9GsA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648210440;
	bh=rrGm61avDbudCrncqhzHZL3yzabp4gVQ5s1kdZTnim8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYAdufZJ0vr+s8VEoBFFBM/Ck3F59gXpBzAR8J7QsvD+68bKfClYFYV3UvkuKHCuU
	 wxf+5IOHgicz1jr/Yt7uc3TZpBGM2qC0+xBgSPkdvDvGXUDQ+rgF8W1akC5CECtacw
	 2g9EbL1MAb4sk/kkme1duVhMSmROeTPy61EAr/HQdeWGPcjXNKhGewIhs5u1mp0fvp
	 Se8vzgYxk75OmL9ALMxVB6z1969UhuQyrIzU3ERoPTzRCpXwlc15Ri2HJGAZPe8qGk
	 ZkFIoTLdLt5zmM/yjVe+7DxM03GC68QlOyXGwOIg03Hto3gQcOaHxYG3O0j5O3cMxA
	 VgjRkl4Pb9GsA==
X-Gm-Message-State: AOAM5301OgiYvozKRYk9J5OOZ2ZzXa5G0SibE5TJb5bUkARqrX3NJlBP
	6EGJpZlUiqrOlhxkBxZWnOuqG+OZWTToGRyqWg0=
X-Google-Smtp-Source: ABdhPJxeY6qKqWcUlLpiFZ6I5whIQQclLk6f6JIwYChUzeUjjUufTTL3KB1hVchp5x4Hqmhill6cS1/U0h6oHitBCYk=
X-Received: by 2002:a9d:638a:0:b0:5cd:a7fc:aa89 with SMTP id
 w10-20020a9d638a000000b005cda7fcaa89mr4087670otk.204.1648210439671; Fri, 25
 Mar 2022 05:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <Yj2ggiWlxvYdh1dJ@Air-de-Roger> <CABfawhkeRENvEJHtXCxME08eMjjAGNVdcBK8ExxgcXY=SzXStA@mail.gmail.com>
 <Yj2oE5uFPNDMszFk@Air-de-Roger>
In-Reply-To: <Yj2oE5uFPNDMszFk@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 25 Mar 2022 08:13:47 -0400
X-Gmail-Original-Message-ID: <CABfawhmTVveT1jf=dDefkgtYHT2BsO7h3ThoeR7wF=cx_ROWBg@mail.gmail.com>
Message-ID: <CABfawhmTVveT1jf=dDefkgtYHT2BsO7h3ThoeR7wF=cx_ROWBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000c5932605db09e5c1"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000c5932605db09e5c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022, 7:31 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:

> On Fri, Mar 25, 2022 at 07:15:59AM -0400, Tamas K Lengyel wrote:
> > On Fri, Mar 25, 2022, 6:59 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m>
> wrote:
> >
> > > On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > > > Add option to the fork memop to skip populating the fork with speci=
al
> > > pages.
> > > > These special pages are only necessary when setting up forks to be
> fully
> > > > functional with a toolstack. For short-lived forks where no
> toolstack is
> > > active
> > > > these pages are uneccesary.
> > >
> > > Replying here because there's no cover letter AFAICT.
> > >
> > > For this kind of performance related changes it would be better if yo=
u
> > > could provide some figures about the performance impact. It would hel=
p
> > > if we knew whether avoiding mapping the vAPIC page means you can
> > > create 0.1% more forks per-minute or 20%.
> > >
> > > If you really want to speed up the forking path it might be good to
> start
> > > by perf sampling Xen in order to find the bottlenecks?
> > >
> >
> > Sure but for experiment systems I don't think its necessary to collect
> that
> > data.
>
> It helps weight whether the extra logic is worth the performance
> benefit IMO. Here it might not matter that much since you say there's
> also a non-performance reason for the change.
>
> > There is also a non-performance reason why we want to keep special page=
s
> > from being populated, in cases we really want the forks physmap to star=
t
> > empty for better control over its state. There was already a case where
> > having special pages mapped in ended up triggering unexpected Xen
> behaviors
> > leading to chain of events not easy to follow. For example if page 0 ge=
ts
> > brought in while the vCPU is being created it ends up as a misconfigure=
d
> > ept entry if nested virtualization is enabled. That leads to ept
> > misconfiguration exits instead of epf faults. Simply enforcing no entry
> in
> > the physmap until forking is complete eliminates the chance of somethin=
g
> > like that happening again and makes reasoning about the VM's behavior
> from
> > the start easier.
>
> Could we have this added to the commit message then, and the option
> renamed to 'empty_p2m' or some such. Then you should also ASSERT that
> at the end of the fork process the p2m is indeed empty, not sure if
> checking d->arch.paging.hap.p2m_pages =3D=3D 0 would accomplish that?
>

Sure, I can do that.

Thanks,
Tamas

>

--000000000000c5932605db09e5c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022, 7:31 AM Roger Pau Monn=C3=A9 &lt=
;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Fri, Mar 25, 2022 at 07:15:59A=
M -0400, Tamas K Lengyel wrote:<br>
&gt; On Fri, Mar 25, 2022, 6:59 AM Roger Pau Monn=C3=A9 &lt;<a href=3D"mail=
to:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">roger.pau@cit=
rix.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:<=
br>
&gt; &gt; &gt; Add option to the fork memop to skip populating the fork wit=
h special<br>
&gt; &gt; pages.<br>
&gt; &gt; &gt; These special pages are only necessary when setting up forks=
 to be fully<br>
&gt; &gt; &gt; functional with a toolstack. For short-lived forks where no =
toolstack is<br>
&gt; &gt; active<br>
&gt; &gt; &gt; these pages are uneccesary.<br>
&gt; &gt;<br>
&gt; &gt; Replying here because there&#39;s no cover letter AFAICT.<br>
&gt; &gt;<br>
&gt; &gt; For this kind of performance related changes it would be better i=
f you<br>
&gt; &gt; could provide some figures about the performance impact. It would=
 help<br>
&gt; &gt; if we knew whether avoiding mapping the vAPIC page means you can<=
br>
&gt; &gt; create 0.1% more forks per-minute or 20%.<br>
&gt; &gt;<br>
&gt; &gt; If you really want to speed up the forking path it might be good =
to start<br>
&gt; &gt; by perf sampling Xen in order to find the bottlenecks?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Sure but for experiment systems I don&#39;t think its necessary to col=
lect that<br>
&gt; data.<br>
<br>
It helps weight whether the extra logic is worth the performance<br>
benefit IMO. Here it might not matter that much since you say there&#39;s<b=
r>
also a non-performance reason for the change.<br>
<br>
&gt; There is also a non-performance reason why we want to keep special pag=
es<br>
&gt; from being populated, in cases we really want the forks physmap to sta=
rt<br>
&gt; empty for better control over its state. There was already a case wher=
e<br>
&gt; having special pages mapped in ended up triggering unexpected Xen beha=
viors<br>
&gt; leading to chain of events not easy to follow. For example if page 0 g=
ets<br>
&gt; brought in while the vCPU is being created it ends up as a misconfigur=
ed<br>
&gt; ept entry if nested virtualization is enabled. That leads to ept<br>
&gt; misconfiguration exits instead of epf faults. Simply enforcing no entr=
y in<br>
&gt; the physmap until forking is complete eliminates the chance of somethi=
ng<br>
&gt; like that happening again and makes reasoning about the VM&#39;s behav=
ior from<br>
&gt; the start easier.<br>
<br>
Could we have this added to the commit message then, and the option<br>
renamed to &#39;empty_p2m&#39; or some such. Then you should also ASSERT th=
at<br>
at the end of the fork process the p2m is indeed empty, not sure if<br>
checking d-&gt;arch.paging.hap.p2m_pages =3D=3D 0 would accomplish that?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sur=
e, I can do that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
,</div><div dir=3D"auto">Tamas</div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000c5932605db09e5c1--

