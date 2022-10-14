Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6135FE83E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 06:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422468.668508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojCix-0000rC-E5; Fri, 14 Oct 2022 04:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422468.668508; Fri, 14 Oct 2022 04:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojCix-0000oR-Aw; Fri, 14 Oct 2022 04:55:07 +0000
Received: by outflank-mailman (input) for mailman id 422468;
 Fri, 14 Oct 2022 04:55:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+2g=2P=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1ojCiu-0000lE-U8
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 04:55:05 +0000
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [2607:f8b0:4864:20::92d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d20f10e-4b7c-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 06:55:03 +0200 (CEST)
Received: by mail-ua1-x92d.google.com with SMTP id f4so1534788uav.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Oct 2022 21:55:03 -0700 (PDT)
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
X-Inumbo-ID: 5d20f10e-4b7c-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5D1Hoxeb3D8WWJwzAf/bk2+jIKQPC662C1zmp8xwPGk=;
        b=gLXLHt/qG4aVDH4wkS0NOaCemP1JUFlrXUHgIGc/wMpq2PtqQybGu0iA43fz+MEkQt
         MfWRwEeyQDCDyr8Rq6EF2sVpLqw9+Y6NbFyrYKdtfY3kDGORcF/CidXwkNhUiLz02ckK
         u3bSCvgVfolrA56HetgF1F6IUqM8we1muaQkMSR+oZwNu9iX004DakiiVfssJk5qTd1C
         YpoJdmRvCt51pukLct0ip2K7/HZinsCYfc0xtt3zrOskVDSaXRXjFuH3OvHRWeHeM8mW
         OORncsQkPG5O7n/lm9w3ejq/QcjgAo2kN4mUqp6DAm41SbYrO9loyuAhmeVvRfJtQr5u
         s+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D1Hoxeb3D8WWJwzAf/bk2+jIKQPC662C1zmp8xwPGk=;
        b=BeyxPi1u6HmTbg88xAY9RpUqDChqsjri+rcyuFhxXKi+t6cbVBBuL+PikgKk7Dtu5O
         O/+uhAevf6eUVP+rgl6eY/L5QHvlRT8um2px7E9reFIjJo01ffluQv8eD6QcrAVBwTCA
         h1a+q6/xtvBd02c7h+SZn7ekUgE3fgZ6hy6mbR2eEhtxrDggbdw91zgq2ZTrFyVByol9
         XFTQuct/0NnBhGHNJdFD6u3HaUs1ie7t/TgCRqWbLRsKFl7M5ZW7yH4vA4wZyTolSbmK
         /RptBtIMbpchZYEHDisBeneiHlbb9Quo4Q+3yyZbMnDpfvSfvv79LsAvFI0R0z4h0Z8Q
         I+NA==
X-Gm-Message-State: ACrzQf2Awah6SuICNftszyc51Tuptdb+8jbDLu660/cU00kg5XR+JlCQ
	QMEAP+Oc8o38X0e20dco4WU/chftGYNX4xLFucM=
X-Google-Smtp-Source: AMsMyM4/lqKUMS8eZRWIIaStIvlrIG17E837br1X3bHPTJDAe3JbqP5xH+Dao2aeW6eWWBJGcn2KH5Tu05HGn922F08=
X-Received: by 2002:ab0:634a:0:b0:3d7:495b:88fd with SMTP id
 f10-20020ab0634a000000b003d7495b88fdmr1691647uap.108.1665723302498; Thu, 13
 Oct 2022 21:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221007193124.20322-1-jandryuk@gmail.com> <a4524dcc-36ce-267a-afbd-5785eab73882@citrix.com>
 <AS8PR08MB7991432FC3C0643161277930925E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <CAKf6xpt3LL3tLMEQkxivqVCw-kQhLnZBfjO=kFvim9NwamNkDQ@mail.gmail.com>
In-Reply-To: <CAKf6xpt3LL3tLMEQkxivqVCw-kQhLnZBfjO=kFvim9NwamNkDQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 13 Oct 2022 21:54:51 -0700
Message-ID: <CACMJ4GYbMCHbFR7tqdpOvniX=vZ6JHkfoP4PNYQBjoJOUUSS+w@mail.gmail.com>
Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000bd54bf05eaf76dfb"

--000000000000bd54bf05eaf76dfb
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 11, 2022 at 5:18 AM Jason Andryuk <jandryuk@gmail.com> wrote:

> On Fri, Oct 7, 2022 at 9:12 PM Henry Wang <Henry.Wang@arm.com> wrote:
> >
> > Hi Andrew and Jason,
> >
> > > -----Original Message-----
> > > From: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > > Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
> > >
> > > On 07/10/2022 20:31, Jason Andryuk wrote:
> > > > I observed this ASSERT_UNREACHABLE in partner_rings_remove
> > > consistently
> > > > trip.  It was in OpenXT with the viptables patch applied.
> > > >
> > > > dom10 shuts down.
> > > > dom7 is REJECTED sending to dom10.
> > > > dom7 shuts down and this ASSERT trips for dom10.
>
> dom7 used a wildcard ring, and dom10 connected to it with a (driver
> level) stream socket.
>
> > > > The argo_send_info has a domid, but there is no refcount taken on
> > > > the domain.  Therefore it's not appropriate to ASSERT that the domain
> > > > can be looked up via domid.  Replace with a debug message.
>

I follow this - thanks for the explanation.


> > > >
> > > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>


> > >
> > > We're into the 4.17 release process now.  A bugfix like this obviously
> > > should be considered, but will need approval from the release manager.
> > > CC Henry.
>
> Thanks, Andrew.
>
> > Andrew: Thanks for the information!
> >
> > Jason: Would you mind adding a "Fixes:" tag following the rule described
> > in [1]? Thanks very much! With this tag and proper review/ack from
> > maintainers:
>
> Of course.  It would be:
> Fixes: 82a817307c5b "argo: init, destroy and soft-reset, with enable
> command line opt"
>
> > Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>
> Thanks, Henry.  We'll see what feedback Christopher provides.
>

I agree - include for 4.17.

thanks

Christopher


>
> Regards,
> Jason
>

--000000000000bd54bf05eaf76dfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 11, 2022 at 5:18 AM Jason=
 Andryuk &lt;<a href=3D"mailto:jandryuk@gmail.com">jandryuk@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, Oct 7, 2022 at 9:12 PM Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.co=
m" target=3D"_blank">Henry.Wang@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Andrew and Jason,<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Andrew Cooper &lt;<a href=3D"mailto:Andrew.Cooper3@citrix.c=
om" target=3D"_blank">Andrew.Cooper3@citrix.com</a>&gt;<br>
&gt; &gt; Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE<br=
>
&gt; &gt;<br>
&gt; &gt; On 07/10/2022 20:31, Jason Andryuk wrote:<br>
&gt; &gt; &gt; I observed this ASSERT_UNREACHABLE in partner_rings_remove<b=
r>
&gt; &gt; consistently<br>
&gt; &gt; &gt; trip.=C2=A0 It was in OpenXT with the viptables patch applie=
d.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; dom10 shuts down.<br>
&gt; &gt; &gt; dom7 is REJECTED sending to dom10.<br>
&gt; &gt; &gt; dom7 shuts down and this ASSERT trips for dom10.<br>
<br>
dom7 used a wildcard ring, and dom10 connected to it with a (driver<br>
level) stream socket.<br>
<br>
&gt; &gt; &gt; The argo_send_info has a domid, but there is no refcount tak=
en on<br>
&gt; &gt; &gt; the domain.=C2=A0 Therefore it&#39;s not appropriate to ASSE=
RT that the domain<br>
&gt; &gt; &gt; can be looked up via domid.=C2=A0 Replace with a debug messa=
ge.<br></blockquote><div><br></div><div>I=C2=A0follow this - thanks for the=
=C2=A0explanation.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Jason Andryuk &lt;<a href=3D"mailto:jandryuk@=
gmail.com" target=3D"_blank">jandryuk@gmail.com</a>&gt;<br></blockquote><di=
v><br></div><div>Reviewed-by: Christopher Clark &lt;<a href=3D"mailto:chris=
topher.w.clark@gmail.com">christopher.w.clark@gmail.com</a>&gt;</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt;<br>
&gt; &gt; We&#39;re into the 4.17 release process now.=C2=A0 A bugfix like =
this obviously<br>
&gt; &gt; should be considered, but will need approval from the release man=
ager.<br>
&gt; &gt; CC Henry.<br>
<br>
Thanks, Andrew.<br>
<br>
&gt; Andrew: Thanks for the information!<br>
&gt;<br>
&gt; Jason: Would you mind adding a &quot;Fixes:&quot; tag following the ru=
le described<br>
&gt; in [1]? Thanks very much! With this tag and proper review/ack from<br>
&gt; maintainers:<br>
<br>
Of course.=C2=A0 It would be:<br>
Fixes: 82a817307c5b &quot;argo: init, destroy and soft-reset, with enable<b=
r>
command line opt&quot;<br>
<br>
&gt; Release-acked-by: Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com"=
 target=3D"_blank">Henry.Wang@arm.com</a>&gt;<br>
<br>
Thanks, Henry.=C2=A0 We&#39;ll see what feedback Christopher provides.<br><=
/blockquote><div><br></div><div>I agree -=C2=A0include=C2=A0for 4.17.</div>=
<div><br></div><div>thanks</div><div><br></div><div>Christopher</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Jason<br>
</blockquote></div></div>

--000000000000bd54bf05eaf76dfb--

