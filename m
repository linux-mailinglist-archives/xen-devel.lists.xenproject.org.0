Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E4A77DDF2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584285.914802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDFJ-0006SW-FC; Wed, 16 Aug 2023 09:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584285.914802; Wed, 16 Aug 2023 09:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDFJ-0006Q3-CK; Wed, 16 Aug 2023 09:55:21 +0000
Received: by outflank-mailman (input) for mailman id 584285;
 Wed, 16 Aug 2023 09:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhFo=EB=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qWDFH-0006Px-T2
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:55:19 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d1a9ac-3c1b-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:55:18 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b9aa1d3029so98539741fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 02:55:18 -0700 (PDT)
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
X-Inumbo-ID: 01d1a9ac-3c1b-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692179718; x=1692784518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3wDfk1UAARu4sJ5rRUTJT8xAi43A6dyOE97N2rN+Cs=;
        b=iodLATAkmegDv1zPBoNZ7ho5f3TNeKOgZfRJAsDOtDcZPa2J3RCD19aWMwi2PaaVvn
         9zAHXJJn5p5UsB++xEJLw9M4TIalQKzVEVfPC2YpnrYawN6On7xG/f9tkfUbz3SIgBqF
         UJu91+I9eQ0tzp8u/EWSpXe1hkaiTK1uhO7+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692179718; x=1692784518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3wDfk1UAARu4sJ5rRUTJT8xAi43A6dyOE97N2rN+Cs=;
        b=EVGzk+Dz6OdnO/xUT+88EuKMJKMmIcm/5MtHNbBIkl3bi84DLqe+49rP4Znz9JEW7Q
         P0puTiuCxHm9N9IqPoR8O7MW9ExwBmvdiTVYSw2g/YzeucE/82abMRkMTck/bf+QN3LE
         iU5HFMc1seKvyZFNBYYrxYbuQeJzM/RWPyeL0S9rIzzVPvctuIV99D069qNcolnnr8SA
         mL7l//lo/PMxzEC9imEqQ4KB/RQwpxkmYfkWBVCrhyVMP20awgOFPNTxayLQLxc8h3cU
         l6aD0AyQxU2QSvhtMKtmi9zi0wxj8FN1UWf5tNu90SRIV+YabNDaC6hdTvynqbGRGqrp
         qU/w==
X-Gm-Message-State: AOJu0YzaR95CdtoamC4wJ8BdDlrxOcQPlocapvg2SRgibOnc79nXznEm
	GVioRC4lOQ0Rlnq9FzsxW9u8NXxVRDJBkPh+I6sdRw==
X-Google-Smtp-Source: AGHT+IF5prWtdj3wayp4JBOXKlerjBRmHWL6yGnLnYizQS5s7CjZa5jl6AO+IEjJkBIZWL7kT5RvmcoHBGem5ivlyY8=
X-Received: by 2002:a2e:94c2:0:b0:2b5:8a21:5627 with SMTP id
 r2-20020a2e94c2000000b002b58a215627mr1076799ljh.51.1692179718203; Wed, 16 Aug
 2023 02:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop>
 <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
In-Reply-To: <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 16 Aug 2023 10:55:07 +0100
Message-ID: <CA+zSX=arMnCNmckcc1a-JoQokw4nc5g7+49xhQFoxFYA3uB4_g@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jason Andryuk <jandryuk@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Henry Wang <Henry.Wang@arm.com>
Content-Type: multipart/alternative; boundary="000000000000fffb060603074a0d"

--000000000000fffb060603074a0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 3:58=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com>
wrote:

> On 16/08/2023 1:19 am, Stefano Stabellini wrote:
> > On Tue, 15 Aug 2023, Andrew Cooper wrote:
>
> >> diff --git a/xen/include/public/version.h b/xen/include/public/version=
.h
> >> index cbc4ef7a46e6..0dd6bbcb43cc 100644
> >> --- a/xen/include/public/version.h
> >> +++ b/xen/include/public/version.h
> >> @@ -19,12 +19,20 @@
> >>  /* arg =3D=3D NULL; returns major:minor (16:16). */
> >>  #define XENVER_version      0
> >>
> >> -/* arg =3D=3D xen_extraversion_t. */
> >> +/*
> >> + * arg =3D=3D xen_extraversion_t.
> >> + *
> >> + * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
> > Like Jan and Julien I also don't like the word "broken" especially
> > without explanation of why it is broken next to it.
>
> The word "broken" is an accurate and appropriate word in the English
> language to describe the situation.  I'm sorry you don't like it, but
> unless any of you can articulate why you think it is inappropriate
> phraseology, the complaint is unactionable.
>
> Specifically ...
>
> > Instead, I would say:
> >
> > "XENVER_extraversion is deprecated. Please use XENVER_extraversion2."
>
> ... depreciated is misleading.
>

Deprecated means, "It is the official position of the developers of the
project that for the moment, you *can* use it, but you *shouldn't*"; it
also implies that support for it might go away at some point.  The fact
that we're saying "you shouldn't use it" by itself implies that it is
lacking somehow.  It's a factual statement that gives you useful
information.

Neither "broken" nor "has problems" actually tell you anything above
"deprecated", other than the opinion of the developer writing the
documentation; and they are both (to different levels) emotionally
charged.  You don't deprecate things unless there's something wrong with
them.  In this particular case, I don't think anyone has an emotional
attachment to the existing hypercall, so nobody is going to be insulted;
but it's a good habit to avoid it.  (See [1] for more about this.)

[1] http://xenbits.xenproject.org/governance/communication-practice.html ,
the "Avoid inflammatory and negatively charged language" section

If I have a backlog of a million things to do, how do I prioritize
switching to and testing extraversion2?  The situation as I understand it
is: "If it works for you now with the current value you're fine, but it may
break later when you change it, in a way that's obvious".  In that
situation, you can safely put off fixing it until your build breaks.  If,
on the other hand, the situation is "It may randomly work or not work with
any given build", or "It may seem to work for you now but is actually
failing in a not-very-obvious way", then you probably need to prioritize
fixing it.

Saying "May cause truncation" gives you some the information you need to
know. "Will silently truncate past N characters" gives you even more.

We should at very least say it's deprecated.  If we can summarize the
issues briefly, then that would be helpful.

 -George

--000000000000fffb060603074a0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 16, 2023 at 3:58=E2=80=AF=
AM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.co=
oper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 16/08/2023 1:19 am, Stefano Stabellini wrote:<br>
&gt; On Tue, 15 Aug 2023, Andrew Cooper wrote:<br><br>
&gt;&gt; diff --git a/xen/include/public/version.h b/xen/include/public/ver=
sion.h<br>
&gt;&gt; index cbc4ef7a46e6..0dd6bbcb43cc 100644<br>
&gt;&gt; --- a/xen/include/public/version.h<br>
&gt;&gt; +++ b/xen/include/public/version.h<br>
&gt;&gt; @@ -19,12 +19,20 @@<br>
&gt;&gt;=C2=A0 /* arg =3D=3D NULL; returns major:minor (16:16). */<br>
&gt;&gt;=C2=A0 #define XENVER_version=C2=A0 =C2=A0 =C2=A0 0<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -/* arg =3D=3D xen_extraversion_t. */<br>
&gt;&gt; +/*<br>
&gt;&gt; + * arg =3D=3D xen_extraversion_t.<br>
&gt;&gt; + *<br>
&gt;&gt; + * This API/ABI is broken.=C2=A0 Use XENVER_extraversion2 where p=
ossible.<br>
&gt; Like Jan and Julien I also don&#39;t like the word &quot;broken&quot; =
especially<br>
&gt; without explanation of why it is broken next to it.<br>
<br>
The word &quot;broken&quot; is an accurate and appropriate word in the Engl=
ish<br>
language to describe the situation.=C2=A0 I&#39;m sorry you don&#39;t like =
it, but<br>
unless any of you can articulate why you think it is inappropriate<br>
phraseology, the complaint is unactionable.<br>
<br>
Specifically ...<br>
<br>
&gt; Instead, I would say:<br>
&gt;<br>
&gt; &quot;XENVER_extraversion is deprecated. Please use XENVER_extraversio=
n2.&quot;<br>
<br>
... depreciated is misleading.<br></blockquote><div><br></div><div>Deprecat=
ed means, &quot;It is the official position of the developers of the projec=
t that for the moment, you *can* use it, but you *shouldn&#39;t*&quot;; it =
also implies that support for it might go away at some point.=C2=A0 The fac=
t that we&#39;re saying &quot;you shouldn&#39;t use it&quot; by itself impl=
ies that it is lacking somehow.=C2=A0 It&#39;s a factual statement that giv=
es you useful information.</div><div><br></div><div>Neither &quot;broken&qu=
ot; nor &quot;has problems&quot; actually tell you anything above &quot;dep=
recated&quot;, other than the opinion of the developer writing the document=
ation; and they are both (to different=C2=A0levels) emotionally charged.=C2=
=A0 You don&#39;t deprecate things unless there&#39;s something wrong with =
them.=C2=A0 In this particular case, I don&#39;t think anyone has an emotio=
nal attachment to the existing hypercall, so nobody is going to be insulted=
; but it&#39;s a good habit to avoid it.=C2=A0 (See [1] for more about this=
.)</div><div><br></div><div>[1]=C2=A0<a href=3D"http://xenbits.xenproject.o=
rg/governance/communication-practice.html">http://xenbits.xenproject.org/go=
vernance/communication-practice.html</a> , the &quot;Avoid inflammatory and=
 negatively charged language&quot; section</div><div><br></div><div>If I ha=
ve a backlog of a million things to do, how do I prioritize switching to an=
d testing extraversion2?=C2=A0 The situation as I understand it is: &quot;I=
f it works for you now with the current value you&#39;re fine, but it may b=
reak later when you change it, in a way that&#39;s obvious&quot;.=C2=A0 In =
that situation, you can safely put off fixing it until your build breaks.=
=C2=A0 If, on the other hand, the situation is &quot;It may randomly work o=
r not work with any given build&quot;, or &quot;It may seem to work for you=
 now but is actually failing in a not-very-obvious way&quot;, then you prob=
ably need to prioritize fixing it.</div><div><br></div><div>Saying &quot;Ma=
y cause truncation&quot; gives you some the information you need to know. &=
quot;Will silently truncate past N characters&quot; gives you even more.=C2=
=A0=C2=A0</div><div>=C2=A0</div><div>We should at very least say it&#39;s d=
eprecated.=C2=A0 If we can summarize the issues briefly, then that would be=
 helpful.</div><div><br></div><div>=C2=A0-George</div></div></div>

--000000000000fffb060603074a0d--

