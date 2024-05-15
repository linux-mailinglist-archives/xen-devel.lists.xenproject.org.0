Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1A8C6523
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 12:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722147.1126048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7CDA-0000tQ-4x; Wed, 15 May 2024 10:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722147.1126048; Wed, 15 May 2024 10:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7CDA-0000rO-2P; Wed, 15 May 2024 10:50:16 +0000
Received: by outflank-mailman (input) for mailman id 722147;
 Wed, 15 May 2024 10:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=733o=MS=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1s7CD9-0000rF-7k
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 10:50:15 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e76d17a9-12a8-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 12:50:12 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-572d83e3c7eso1582221a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 03:50:11 -0700 (PDT)
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
X-Inumbo-ID: e76d17a9-12a8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715770211; x=1716375011; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRYbz1CnCBep73DA1rCnx+h16X0jJnQs+wXCW8hOioI=;
        b=HvSo2ILBsBfBV1fzk8G6KeHzupwav78h2mTsxojBRL5az800LLp2BEbD/t2eJ9Is+O
         gjjzwja1UqfYHxbO9gnngh/IIvXQch6quVIXlQr22RpRJwOykJMm23fJaS0vU8zHNv6m
         leQPQn2x9NQbZDU37nPovi3PDILxSudkWLiE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715770211; x=1716375011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRYbz1CnCBep73DA1rCnx+h16X0jJnQs+wXCW8hOioI=;
        b=ldfzgZmO1hADGqEKAo07Br7puTRARGyE1C3mdcz/hfIKHqTybVHlu/SYqSkoGy47Od
         ZFIwaNwlkvunEgttxZD9sKUCwKLFw0vdF7dO3XY7EImyGy/huQQN+0txWfsmZDv8v6Y6
         WBapzZ7w0L/haI5F4cIrW/57glF5D1jeTm8CzrxWPtdLVARzGqpOKjzqfrZXvXy/KMkr
         RhnmjQ6d5rj8Va/DGBNjIYZWh4nFT57Bx7DDozcfWqTCResxK9A06Hf/HWctaf6XRzzD
         2HgmtbEiiWqVANP7LaJYM06ghL2i3HxRpF4TUF/SiY9ktXfT7827y0aQ6oDobvt/O10M
         tztQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcDzxvbA+buXtLlxoxxIxWjgmCYSD2W3r5wlh8EETwJ+al/bt6KGmX3MvVELlfWIi7rB+I2gA+tz9K0t67h+I0+bANY41xIY6hMJcs6Ro=
X-Gm-Message-State: AOJu0Yw5hGkdFuqT29qjLQr2wi+NC04l6tNHawSz7cVrXu3mL7JziR2B
	wFdk8V8zJSnjRWrvooiOmsXW7qLY49GF+ZwgGVKmKjjvFhjPZhlkXAFLCX/AkzdiAciXIfBbRmd
	Ew8GRT62vlEkr+wnWzk/usHDrtyrrVH5egOJ89w==
X-Google-Smtp-Source: AGHT+IFJDezroE65n2WnhM7PTSrRF8xl/ULCEfNsdqblLyro66lc00Cii7rPSQSzyljOD26PPAbjVZR20jgRjrab/yo=
X-Received: by 2002:a50:870d:0:b0:572:5fff:accd with SMTP id
 4fb4d7f45d1cf-5734d590348mr10699828a12.6.1715770211310; Wed, 15 May 2024
 03:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com> <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
In-Reply-To: <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 15 May 2024 11:49:35 +0100
Message-ID: <CAO-mL=x6P3oX=FXw=3bciHPbR2RAA5GymMVNY33_xiH_vu8juQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	"committers@xenproject.org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000f6438506187be1a3"

--000000000000f6438506187be1a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

As Stefano has mentioned, we have the maintainers and committers call later
today.
Let's use this time to better collaborate and discuss any differences in
opinions we have. It will also give everyone a chance to explain their
viewpoints.

Andy, please can I remind you to keep the language clean and professional
in line with our standards as a community.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Tue, May 14, 2024 at 10:51=E2=80=AFAM Andrew Cooper <andrew.cooper3@citr=
ix.com>
wrote:

> On 14/05/2024 10:25 am, Jan Beulich wrote:
> > On 03.04.2024 08:16, Jan Beulich wrote:
> >> On 02.04.2024 19:06, Andrew Cooper wrote:
> >>> The commit makes a claim without any kind of justification.
> >> Well, what does "have no business" leave open?
> >>
> >>> The claim is false, and the commit broke lsevtchn in dom0.
> >> Or alternatively lsevtchn was doing something that was never meant to
> work
> >> (from Xen's perspective).
> >>
> >>>  It is also quite
> >>> obvious from XSM_TARGET that it has broken device model stubdoms too.
> >> Why would that be "obvious"? What business would a stubdom have to loo=
k
> at
> >> Xen's side of an evtchn?
> >>
> >>> Whether to return information about a xen-owned evtchn is a matter of
> policy,
> >>> and it's not acceptable to short circuit the XSM on the matter.
> >> I can certainly accept this as one possible view point. As in so many
> cases
> >> I'm afraid I dislike you putting it as if it was the only possible one=
.
> >>
> >> In summary: The supposed justification you claim is missing in the
> original
> >> change is imo also missing here then: What business would any entity i=
n
> the
> >> system have to look at Xen's side of an event channel? Back at the
> time, 3
> >> people agreed that it's "none".
> > You've never responded to this reply of mine, or its follow-up. You als=
o
> > didn't chime in on the discussion Daniel and I were having. I consider =
my
> > objections unaddressed, and in fact I continue to consider the change t=
o
> > be wrong. Therefore it was inappropriate for you to commit it; it needs
> > reverting asap. If you're not going to do so, I will.
>
> You tried defending breaking a utility with "well it shouldn't exist then=
".
>
> You don't have a leg to stand on, and two maintainers of relevant
> subsystems here just got tired of bullshit being presented in place of
> any credible argument for having done the change in the way you did.
>
> The correct response was "Sorry I broke things.  Lets revert this for
> now to unbreak, and I'll see about reworking it to not intentionally
> subvert Xen's security mechanism".
>
> As it stands, you're 2-1 outvoted, and wasted any sympathy I may have
> had for the principle of the change based on the absurdity of your
> arguments.
>
> ~Andrew
>

--000000000000f6438506187be1a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>As Stefano has mentioned,=
 we have the maintainers and committers call later today.</div><div>Let&#39=
;s use this time to better collaborate and discuss any differences in opini=
ons we have. It will also give everyone a chance to explain their viewpoint=
s.=C2=A0=C2=A0</div><div><br></div><div>Andy, please can I remind you to ke=
ep the language clean and professional in line with our standards as a comm=
unity.=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many=
 thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:=
rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,13=
6)">Xen Project=C2=A0<br></div></div></div></div></div><br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Ma=
y 14, 2024 at 10:51=E2=80=AFAM Andrew Cooper &lt;<a href=3D"mailto:andrew.c=
ooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 14/05/2024 10:25 am, Jan Beu=
lich wrote:<br>
&gt; On 03.04.2024 08:16, Jan Beulich wrote:<br>
&gt;&gt; On 02.04.2024 19:06, Andrew Cooper wrote:<br>
&gt;&gt;&gt; The commit makes a claim without any kind of justification.<br=
>
&gt;&gt; Well, what does &quot;have no business&quot; leave open?<br>
&gt;&gt;<br>
&gt;&gt;&gt; The claim is false, and the commit broke lsevtchn in dom0.<br>
&gt;&gt; Or alternatively lsevtchn was doing something that was never meant=
 to work<br>
&gt;&gt; (from Xen&#39;s perspective).<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 It is also quite<br>
&gt;&gt;&gt; obvious from XSM_TARGET that it has broken device model stubdo=
ms too.<br>
&gt;&gt; Why would that be &quot;obvious&quot;? What business would a stubd=
om have to look at<br>
&gt;&gt; Xen&#39;s side of an evtchn?<br>
&gt;&gt;<br>
&gt;&gt;&gt; Whether to return information about a xen-owned evtchn is a ma=
tter of policy,<br>
&gt;&gt;&gt; and it&#39;s not acceptable to short circuit the XSM on the ma=
tter.<br>
&gt;&gt; I can certainly accept this as one possible view point. As in so m=
any cases<br>
&gt;&gt; I&#39;m afraid I dislike you putting it as if it was the only poss=
ible one.<br>
&gt;&gt;<br>
&gt;&gt; In summary: The supposed justification you claim is missing in the=
 original<br>
&gt;&gt; change is imo also missing here then: What business would any enti=
ty in the<br>
&gt;&gt; system have to look at Xen&#39;s side of an event channel? Back at=
 the time, 3<br>
&gt;&gt; people agreed that it&#39;s &quot;none&quot;.<br>
&gt; You&#39;ve never responded to this reply of mine, or its follow-up. Yo=
u also<br>
&gt; didn&#39;t chime in on the discussion Daniel and I were having. I cons=
ider my<br>
&gt; objections unaddressed, and in fact I continue to consider the change =
to<br>
&gt; be wrong. Therefore it was inappropriate for you to commit it; it need=
s<br>
&gt; reverting asap. If you&#39;re not going to do so, I will.<br>
<br>
You tried defending breaking a utility with &quot;well it shouldn&#39;t exi=
st then&quot;.<br>
<br>
You don&#39;t have a leg to stand on, and two maintainers of relevant<br>
subsystems here just got tired of bullshit being presented in place of<br>
any credible argument for having done the change in the way you did.<br>
<br>
The correct response was &quot;Sorry I broke things.=C2=A0 Lets revert this=
 for<br>
now to unbreak, and I&#39;ll see about reworking it to not intentionally<br=
>
subvert Xen&#39;s security mechanism&quot;.<br>
<br>
As it stands, you&#39;re 2-1 outvoted, and wasted any sympathy I may have<b=
r>
had for the principle of the change based on the absurdity of your<br>
arguments.<br>
<br>
~Andrew<br>
</blockquote></div>

--000000000000f6438506187be1a3--

