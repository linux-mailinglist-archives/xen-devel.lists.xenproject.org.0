Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF856F6C69
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 14:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529713.824392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYQs-00008i-9d; Thu, 04 May 2023 12:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529713.824392; Thu, 04 May 2023 12:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYQs-00005t-6x; Thu, 04 May 2023 12:51:38 +0000
Received: by outflank-mailman (input) for mailman id 529713;
 Thu, 04 May 2023 12:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OChG=AZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1puYQq-00005l-On
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 12:51:36 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 65cddc4c-ea7a-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 14:51:34 +0200 (CEST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181]) by
 075b51505512 with SMTP id 6453aa548a040ae8e21ea421 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 04 May 2023 12:51:32 GMT
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-b9e2b65d006so699408276.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 May 2023 05:51:32 -0700 (PDT)
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
X-Inumbo-ID: 65cddc4c-ea7a-11ed-b226-6b7b168915f2
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1683204692; x=1683211892; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=tkmb9S4Tg8bEdHenLjg9YyLXaYTYGV68ajT5w+c8RTk=;
 b=CRnPQ7toi6oiH0sWpacXVwrTjYHyFZMcc1eRVgXHjdOpI3NILjg89tuJ0GOOXQathIbN80qP7WIj0yC1mBM21JBI28KHNquobZl9ozflLPijQNHxFR3eNSNrXhhnasHxRIqrLox99XeFodEV77Nfageu7AwUG59ESuW5CPY3Qd/m3auQFti2NVqgydvYMyZ1Uucu/IggAmbZdarBC5aIE8il0y5vyD8NKL6MdqJXudXGgYvvGoKo9rUZvrfoEFiX21KEpD/0K78xFc/FgmuB92G9DjnGlcabq4l5EqSJvYwrQ5hRwkOaUlLraUUvqW2d+ytvZPKdogB0ofujRjVqfg==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AC+VfDz2uXMlH7itspENrfJSdwHWXJdlI4pK6zIlPSkX1Ev87IfvCWXB
	+AV7FuUUZeTpB7t/t0FtYiZgpytA/4QDxglG1FU=
X-Google-Smtp-Source: ACHHUZ4ejql2sxB+MnupfVRD4actJYR8J2/WGcWm5vTmppRT4fbnkZIRRcRhFn5GKu8P5oyvrJ0mQbm+3sD8QuODJG0=
X-Received: by 2002:a25:240c:0:b0:b99:58d3:7ea2 with SMTP id
 k12-20020a25240c000000b00b9958d37ea2mr23810039ybk.24.1683204692325; Thu, 04
 May 2023 05:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com> <CABfawhn4CRnctzV-17di4eYyNhSGTSMckZjgphS1Rg6HUGOtHw@mail.gmail.com>
 <c5f2ee35-0f5e-da04-9a28-aba49d2aba29@suse.com>
In-Reply-To: <c5f2ee35-0f5e-da04-9a28-aba49d2aba29@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 4 May 2023 08:50:55 -0400
X-Gmail-Original-Message-ID: <CABfawhnt=465mank4ye==5zbczcSeLWDSKjMoc6bxGTLqPqX-w@mail.gmail.com>
Message-ID: <CABfawhnt=465mank4ye==5zbczcSeLWDSKjMoc6bxGTLqPqX-w@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000c53e9205fadda1bd"

--000000000000c53e9205fadda1bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 3:44=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 03.05.2023 19:14, Tamas K Lengyel wrote:
> >> @@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain
> >>
> >>   state:
> >>      if ( reset_state )
> >> +    {
> >>          rc =3D copy_settings(d, pd);
> >> +        /* TBD: What to do here with -ERESTART? */
> >
> > Ideally we could avoid hitting code-paths that are restartable during
fork
> > reset since it gets called from vm_event replies that have no concept o=
f
> > handling errors. If we start having errors like this we would just have
to
> > drop the vm_event reply optimization and issue a standalone fork reset
> > hypercall every time which isn't a big deal, it's just slower.
>
> I'm afraid I don't follow: We are in the process of fork-reset here. How
> would issuing "a standalone fork reset hypercall every time" make this
> any different? The possible need for a continuation here comes from a
> failed spin_trylock() in map_guest_area(). That won't change the next
> time round.

Why not? Who is holding the lock and why wouldn't it ever relinquish it? If
that's really true then there is a larger issue then just not being able to
report the error back to the user on vm_event_resume path and we need to
devise a way of being able to copy this from the parent bypassing this
lock. The parent is paused and its state should not be changing while forks
are active, so if the lock was turned into an rwlock of some sort so we can
acquire the read-lock would perhaps be a possible way out of this.

>
> But perhaps I should say that till now I didn't even pay much attention
> to the 2nd use of the function by vm_event_resume(); I was mainly
> focused on the one from XENMEM_sharing_op_fork_reset, where no
> continuation handling exists. Yet perhaps your comment is mainly
> related to that use?
>
> I actually notice that the comment ahead of the function already has a
> continuation related TODO, just that there thought is only of larger
> memory footprint.

With XENMEM_sharing_op_fork_reset the caller actually receives the error
code and can decide what to do next. With vm_event_resume there is no path
currently to notify the agent of an error. We could generate another
vm_event to send such an error, but the expectation with fork_reset is that
it will always work because the parent is paused, so not having that path
for an error to get back to the agent isn't a big deal.

Now, if it becomes the case that due to this locking we can get an error
even while the parent is paused, that will render the vm_event_resume path
unreliably so we would just switch to using XENMEM_sharing_op_fork_reset so
that at least it can re-try in case of an issue. Of course, only if a
reissue of the hypercall has any reasonable chance of succeeding.

>
> > My
> > preference would actually be that after the initial forking is
performed a
> > local copy of the parent's state is maintained for the fork to reset to
so
> > there would be no case of hitting an error like this. It would also
allow
> > us in the future to unpause the parent for example..
>
> Oh, I guess I didn't realize the parent was kept paused. Such state
> copying / caching may then indeed be a possibility, but that's nothing
> I can see myself deal with, even less so in the context of this series.
> I need a solution to the problem at hand within the scope of what is
> there right now (or based on what could be provided e.g. by you within
> the foreseeable future). Bubbling up the need for continuation from the
> XENMEM_sharing_op_fork_reset path is the most I could see me handle
> myself ... For vm_event_resume() bubbling state up the domctl path
> _may_ also be doable, but mem_sharing_notification() and friends don't
> even check the function's return value.

Sure, I wasn't expecting that work to be done as part of this series, just
as something I would like to get to in the future.

Tamas

--000000000000c53e9205fadda1bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, May 4, 2023 at 3:44=E2=80=AFAM Jan Beulich=
 &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<=
br>&gt;<br>&gt; On 03.05.2023 19:14, Tamas K Lengyel wrote:<br>&gt; &gt;&gt=
; @@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain<br>&gt; &=
gt;&gt;<br>&gt; &gt;&gt; =C2=A0 state:<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=
=A0if ( reset_state )<br>&gt; &gt;&gt; + =C2=A0 =C2=A0{<br>&gt; &gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D copy_settings(d, pd);<br>&gt; &gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TBD: What to do here with -ERESTART? *=
/<br>&gt; &gt;<br>&gt; &gt; Ideally we could avoid hitting code-paths that =
are restartable during fork<br>&gt; &gt; reset since it gets called from vm=
_event replies that have no concept of<br>&gt; &gt; handling errors. If we =
start having errors like this we would just have to<br>&gt; &gt; drop the v=
m_event reply optimization and issue a standalone fork reset<br>&gt; &gt; h=
ypercall every time which isn&#39;t a big deal, it&#39;s just slower.<br>&g=
t;<br>&gt; I&#39;m afraid I don&#39;t follow: We are in the process of fork=
-reset here. How<br>&gt; would issuing &quot;a standalone fork reset hyperc=
all every time&quot; make this<br>&gt; any different? The possible need for=
 a continuation here comes from a<br>&gt; failed spin_trylock() in map_gues=
t_area(). That won&#39;t change the next<br><div>&gt; time round.</div><div=
><br></div><div>Why not? Who is holding the lock and why wouldn&#39;t it ev=
er relinquish it? If that&#39;s really true then there is a larger issue th=
en just not being able to report the error back to the user on vm_event_res=
ume path and we need to devise a way of being able to copy this from the pa=
rent bypassing this lock. The parent is paused and its state should not be =
changing while forks are active, so if the lock was turned into an rwlock o=
f some sort so we can acquire the read-lock would perhaps be a possible way=
 out of this.<br></div><div><br></div>&gt;<br>&gt; But perhaps I should say=
 that till now I didn&#39;t even pay much attention<br>&gt; to the 2nd use =
of the function by vm_event_resume(); I was mainly<br>&gt; focused on the o=
ne from XENMEM_sharing_op_fork_reset, where no<br>&gt; continuation handlin=
g exists. Yet perhaps your comment is mainly<br>&gt; related to that use?<b=
r>&gt;<br>&gt; I actually notice that the comment ahead of the function alr=
eady has a<br>&gt; continuation related TODO, just that there thought is on=
ly of larger<br><div>&gt; memory footprint.</div><div><br></div><div>With=
=20
XENMEM_sharing_op_fork_reset the caller actually receives the error code an=
d can decide what to do next. With=20
vm_event_resume there is no path currently to notify the agent of an error.=
 We could generate another vm_event to send such an error, but the expectat=
ion with fork_reset is that it will always work because the parent is pause=
d, so not having that path for an error to get back to the agent isn&#39;t =
a big deal.</div><div><br></div><div>Now, if it becomes the case that due t=
o this locking we can get an error even while the parent is paused, that wi=
ll render the=20
vm_event_resume path unreliably so we would just switch to using=20
XENMEM_sharing_op_fork_reset so that at least it can re-try in case of an i=
ssue. Of course, only if a reissue of the hypercall has any reasonable chan=
ce of succeeding.<br></div><div><br></div>&gt;<br>&gt; &gt; My<br>&gt; &gt;=
 preference would actually be that after the initial forking is performed a=
<br>&gt; &gt; local copy of the parent&#39;s state is maintained for the fo=
rk to reset to so<br>&gt; &gt; there would be no case of hitting an error l=
ike this. It would also allow<br>&gt; &gt; us in the future to unpause the =
parent for example..<br>&gt;<br>&gt; Oh, I guess I didn&#39;t realize the p=
arent was kept paused. Such state<br>&gt; copying / caching may then indeed=
 be a possibility, but that&#39;s nothing<br>&gt; I can see myself deal wit=
h, even less so in the context of this series.<br>&gt; I need a solution to=
 the problem at hand within the scope of what is<br>&gt; there right now (o=
r based on what could be provided e.g. by you within<br>&gt; the foreseeabl=
e future). Bubbling up the need for continuation from the<br>&gt; XENMEM_sh=
aring_op_fork_reset path is the most I could see me handle<br>&gt; myself .=
.. For vm_event_resume() bubbling state up the domctl path<br>&gt; _may_ al=
so be doable, but mem_sharing_notification() and friends don&#39;t<br>&gt; =
even check the function&#39;s return value.<br><div><br></div><div>Sure, I =
wasn&#39;t expecting that work to be done as part of this series, just as s=
omething I would like to get to in the future.<br></div><div><br></div><div=
>Tamas<br></div></div>

--000000000000c53e9205fadda1bd--

