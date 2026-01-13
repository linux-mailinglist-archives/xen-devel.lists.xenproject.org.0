Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3302D18C28
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:36:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201660.1517237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdci-0000qO-Gn; Tue, 13 Jan 2026 12:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201660.1517237; Tue, 13 Jan 2026 12:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdci-0000nb-Cx; Tue, 13 Jan 2026 12:35:48 +0000
Received: by outflank-mailman (input) for mailman id 1201660;
 Tue, 13 Jan 2026 12:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjkf=7S=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1vfdch-0000nV-8a
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:35:47 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60847301-f07c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 13:35:44 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2a09d981507so48547365ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 04:35:44 -0800 (PST)
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
X-Inumbo-ID: 60847301-f07c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307743; x=1768912543; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny3fIW64a8n6LNuRuq9w3JproVg2pbuStVj1bgw/1jY=;
        b=cXinUNxLUHGjGfHfhw2cEOjIdYlBawMl85hKTJIw08h8w6sU2cRWsEa1asTUAXzMPM
         N9Z/+8/gFqR3jfi6yYWajF/MbM2JuiLidLb+oBuiaN7emWaUDiHUkVW/T+caS+xlOmWx
         P+D/TqGdZVGDkWgbc4xFJdWSQrC/LXx6ox9R2aVixvcwpXoyqt2OzhKXDM4VbjIZxaqG
         dEDJNjYcx2LJDmPdBtiaAK4qDAP6ErmCvykyjISUPxAjIPel0+PsJGgIcXHdq7vwwXz7
         jIb9j+cPAYOAnTgc+ot1g8vqDqH2LKoegGsK8B+/zgVV+7Dr+vUfjkz+dBB8tMyM8WM2
         +4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307743; x=1768912543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny3fIW64a8n6LNuRuq9w3JproVg2pbuStVj1bgw/1jY=;
        b=a2SmixTS/PynEObdRSJWJ3Psh7mbPJQlIJ0u5MqNM/TYjMxYPJ9f78D3mIc7QkNvG3
         iew5XkW6xmELhStZ0BtF7jYoJuA1zRhkheiyhG37EUfdVbYcbMcuTlwsieuSMKNPFNZ8
         D35bqWPjyP3EN+FiIeO+OvmQVkj08QLiinoIjme/SiEkHDCOfLaPtZj4EmPb+po6QMnD
         xXKtOSlxVX5wpvKaHBnZ2g7rdow97NAx9g/u0OoM+rozUyYKDEEdzqojVBEGtPsJkBtI
         n8OjWxxkTBZeWedsDncoYtVXsdrrSyIR9tpb6gzm4io+4nj4rvskp3Iypz3yN1dOMTmI
         DLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8vH7gHCsnzSqLPcNHn8sgxMJ+5I9qjK5rhh3nZnpBntPh8s3z8UPp2S7hlVanVXhp/ob6SnoNf/Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5j0ETuY+RJ4Ad3t/S/M58jyXyyygS7Ga/B3lwlpl2VmdyTsJy
	mAoGSXqLONsvtwbw2IDaAJskiltwgpKK9kztQyH/ePZVEeG6+MX0uZ5x4DcWHX1+fFsdchpfR4X
	nrB71ljwZcrXygro/hn73Q973YqtjODQ=
X-Gm-Gg: AY/fxX6+p8aCTf6QUQOc7f4e9fRwS9Btv5d/k2NlpwspuY7aSGs0d59VMIuvw0ib7r+
	hb5o8kolxbbpM7lSehwCL558R7kU6FDwImEnGPhYAmw/J+4afF5mdpd6DRl/R3ZdOKevwY5XKxu
	8I70VQmv6cIzmg7Psw+THPBWA172HszEPjNdJHxzRgAkfwH1hUiq9Am3vqk8OnfUasFFs6JKUxQ
	p38JZoGDcaqzWIXOyxfKWOvQlTJt5c10kR9qutsEoT2KIFgtQZG3/XnR3kaiDssTkvemjqBtOh8
	7hrFmh8=
X-Google-Smtp-Source: AGHT+IECiNf0+0iVPZhsREN4UnvfMdi7iEU51O0n4w27xGEEEwflBKIky7oxFV7+coYJOD9CoMTJ8S4EgfpnJxqlJvk=
X-Received: by 2002:a17:902:fc84:b0:295:592f:9496 with SMTP id
 d9443c01a7336-2a58b5015afmr23183315ad.20.1768307742594; Tue, 13 Jan 2026
 04:35:42 -0800 (PST)
MIME-Version: 1.0
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com> <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
 <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com> <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
 <6ea436ce-6ecb-47f8-8d8a-98b0badeb14e@suse.com> <CACQYvN_dZxXmvhBd8pZ41Kws_n_TXcwp5mMQ=H0Vu89Px8M+PA@mail.gmail.com>
 <b70e2c0e-7e8d-41d8-97da-5b975ad0ed47@suse.com> <CACQYvN8YtN4Q5MSH4i=MPjtOaxmPwr+oOKBSsrpqBq+=xAYhuw@mail.gmail.com>
 <fcf49001-149a-48e4-b2b2-ad1f445b1405@suse.com>
In-Reply-To: <fcf49001-149a-48e4-b2b2-ad1f445b1405@suse.com>
From: Anton Markov <akmarkov45@gmail.com>
Date: Tue, 13 Jan 2026 15:35:31 +0300
X-Gm-Features: AZwV_Qgzeunb-h-9WuEQeTPRhtsdcHFLBYMj31NUMoR7eJYuWhGK_MX9B6MP7jE
Message-ID: <CACQYvN-JcSizJx8LhMeyqXW69E4+iYo1s+9cGsZmrdGxaLb8NQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d9dad50648443a5d"

--000000000000d9dad50648443a5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You did read my recurring explanation beyond the IPI sending, didn't you?
Of course IPI arrival may vary across cores / threads. Yet the term
"rendezvous" is used because CPUs having received the IPI are then held in
a waiting loop, until _all_ CPUs have made it there. Then CPU0 indicates to
all of them simultaneously to move to the next step. There's going to again
be some variance (especially on NUMA, where the memory write needs to
propagate to all nodes), but at least within a single node that should be
pretty low. The main source of variance I would expect there would by
hyperthreads competing with one another in a single core.

Yes, I saw it. I'm not trying to dispute your understanding of the
situation. The difference may be small, but it adds up.

Sure, I don't doubt you make those observations. But we're still trying to
> converge on a theory on what these may be caused by.
>
I can't tell you exactly what the main cause of the delay is. I can only
list possible factors:
1. Rounding error, which varies for each core;
2. Delay in IPI delivery speed (even at the hardware level, signal
delivery shouldn't
happen simultaneously, and some cores may have interrupts disabled);
3. CPU frequency boost, which allows some cores to execute code faster. On
modern CPUs, this doesn't affect the TSC frequency, but the problem is that
the counter will be read at different times.
4. The initial difference in TSC counter values, which for cores within a
single CPU should be no more than 100 ns. In the case of NUMA, no more than
1000 ns;
I can't speak about percentages; I wasn't involved in CPU development, but
there are many reasons not to allow cores to compete in sequence increment
speed.

The log entries aren't in CPU order, and CPUs 1 and 2 actually have
> identical values on the rhs. That doesn't quite fit what you have said so
> far. CPU3's value is also lower than CPU0's.
> While CPU numbers happen to be in sequence here, the rhs values aren't
> equally
> ordered.
> Also really here it is
> 22915730869696 - 22915730869993 =3D -297 * 3 (3.00 GHz) =3D 891 ahead
> Similarly here. Yes, the gap increases, yet that's not a lag of CPU3 past
> CPU0, but exactly the other way around.
> As per above - no, I don't think I can see that. Or maybe I'm misreading
> the
> numbers as well as what you have been saying.
>
During the first few hours, the situation can be blurred due to possible
race conditions. After two days, it becomes more or less clear:

254478162020920 (core 0) > 254478162018972 (core 1) > 254478162018429 (core
2) > 254478162017636 (core 3)

The lower the core number, the more it pulls ahead. It's possible that this
is indeed related to which core is most heavily loaded (which one activates
CPU boost more often). In my configuration, the first three cores are
dedicated to DOM0, and the fourth is reserved for virtual machines. The
first core ends up being the most heavily loaded due to interrupt handling,
etc.
I can also add that after replacing get_s_time_fixed with scale_delta, the
difference stops accumulating. At this point, it's clear to me that the
problem is the use of previous last_stime values. The nature of this CPU
behavior is unlikely to be understood at the software level. Of course, all
the processors I tested on have the constant_tsc, nonstop_tsc, and
tsc_known_freq flags.


On Tue, Jan 13, 2026 at 2:21=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 12.01.2026 17:41, Anton Markov wrote:
> >>
> >> That calls on_selected_cpus(), but send_IPI_mask() may then still
> resort to
> >> all-but-self. In that case all IPIs are sent in one go.
> >
> > Plus as said, how IPIs are sent doesn't matter for the invocation of
> >> time_calibration_rendezvous_tail(). They'll all run at the same time,
> not
> >> one after the other.
> >
> > At the hardware level, no one can guarantee that the processors will
> > simultaneously respond to the signal and execute your code nanosecond
> after
> > you send the ipi. Especially when we're talking about NUMA
> configurations. I'm
> > afraid the possible and impossible in the laws of physics is also beyon=
d
> > the scope of this thread.
>
> You did read my recurring explanation beyond the IPI sending, didn't you?
> Of course IPI arrival may vary across cores / threads. Yet the term
> "rendezvous" is used because CPUs having received the IPI are then held
> in a waiting loop, until _all_ CPUs have made it there. Then CPU0
> indicates to all of them simultaneously to move to the next step. There's
> going to again be some variance (especially on NUMA, where the memory
> write needs to propagate to all nodes), but at least within a single node
> that should be pretty low. The main source of variance I would expect
> there would by hyperthreads competing with one another in a single core.
>
> > Since further down you build upon that "IPI lag", I fear we first need =
to
> >> settle on this aspect of your theory.
> >
> >  I've already provided the delay logs. It's not hard for me to repeat.
>
> Sure, I don't doubt you make those observations. But we're still trying t=
o
> converge on a theory on what these may be caused by.
>
> >  2 hours of work:
> >
> >> (XEN) update stime on time calibrate 0, 8564145820102 -> 8565145861597
> >> (8565145862216, 0)
> >> (XEN) update stime on time calibrate 1, 8564145820129 -> 8565145861609
> >> (8565145863957, 0)
> >> (XEN) update stime on time calibrate 3, 8564145819996 -> 8565145861491
> >> (8565145864800, 0)
> >> (XEN) update stime on time calibrate 2, 8564145820099 -> 8565145861609
> >> (8565145865372, 0)
> >>
> >> 8565145861609 - 8565145861491 =3D 115 * 3 (3.00 GHz) =3D 345 lag
>
> The log entries aren't in CPU order, and CPUs 1 and 2 actually have
> identical values on the rhs. That doesn't quite fit what you have said so
> far. CPU3's value is also lower than CPU0's.
>
> > 3 hours of work:
> >
> >> (XEN) update stime on time calibrate 0, 22914730829200 -> 229157308699=
93
> >> (22915730870665, 0)
> >> (XEN) update stime on time calibrate 1, 22914730829073 -> 229157308698=
89
> >> (22915730870693, 0)
> >> (XEN) update stime on time calibrate 2, 22914730829052 -> 229157308698=
41
> >> (22915730872231, 0)
> >> (XEN) update stime on time calibrate 3, 22914730828892 -> 229157308696=
96
> >> (22915730872096, 0)
> >>
> >> 22915730869993 - 22915730869696 =3D 297 * 3 (3.00 GHz) =3D 891 lag
>
> While CPU numbers happen to be in sequence here, the rhs values aren't
> equally
> ordered.
>
> Also really here it is
>
> 22915730869696 - 22915730869993 =3D -297 * 3 (3.00 GHz) =3D 891 ahead
>
> > 2-3 day of work:
> >
> >> (XEN) update stime on time calibrate 0, 254477161980127 ->
> 254478162020920
> >> (254478162021549, 0)
> >> (XEN) update stime on time calibrate 2, 254477161977638 ->
> 254478162018429
> >> (254478162022187, 0)
> >> (XEN) update stime on time calibrate 1, 254477161978192 ->
> 254478162018972
> >> (254478162022776, 0)
> >> (XEN) update stime on time calibrate 3, 254477161976832 ->
> 254478162017636
> >> (254478162021394, 0)
> >>
> >> 254478162020920 - 254478162017636 =3D 3284 * 3 (3.00 GHz) =3D 9852 lag
>
> Similarly here. Yes, the gap increases, yet that's not a lag of CPU3 past
> CPU0, but exactly the other way around.
>
> >  As you can see, the core lag is strictly determined by their sequence
> > number.
>
> As per above - no, I don't think I can see that. Or maybe I'm misreading
> the
> numbers as well as what you have been saying.
>
> Jan
>

--000000000000d9dad50648443a5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail-moz-quote-pre gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">You did read my recurring explanation beyond the IPI sending, d=
idn&#39;t you?
Of course IPI arrival may vary across cores / threads. Yet the term
&quot;rendezvous&quot; is used because CPUs having received the IPI are the=
n held
in a waiting loop, until <span class=3D"gmail-moz-txt-underscore"><span cla=
ss=3D"gmail-moz-txt-tag">_</span>all<span class=3D"gmail-moz-txt-tag">_</sp=
an></span> CPUs have made it there. Then CPU0
indicates to all of them simultaneously to move to the next step. There&#39=
;s
going to again be some variance (especially on NUMA, where the memory
write needs to propagate to all nodes), but at least within a single node
that should be pretty low. The main source of variance I would expect
there would by hyperthreads competing with one another in a single core.</b=
lockquote><div><span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail=
-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">Yes, I saw it. I&#39;m no=
t trying to dispute your understanding of the situation.</span></span> <spa=
n class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">The diffe=
rence may be small, but it adds up.</span></span></span></div><div><br></di=
v><div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Sure, I don&#39;t =
doubt you make those observations. But we&#39;re still trying to<br>
converge on a theory on what these may be caused by.<span class=3D"gmail-im=
"></span><br><span class=3D"gmail-im"></span></blockquote><span class=3D"gm=
ail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=
=3D"gmail-ryNqvb">I can&#39;t tell you exactly what the main cause of the d=
elay is.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=
=3D"gmail-ryNqvb">I can only list possible factors:</span></span></span></d=
iv><div><span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz =
gmail-ChMk0b"><span class=3D"gmail-ryNqvb">1. Rounding error, which varies =
for each core;</span></span><span class=3D"gmail-jCAhz gmail-ChMk0b"><span =
class=3D"gmail-ryNqvb"><br></span></span></span></div><div><span class=3D"g=
mail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span clas=
s=3D"gmail-ryNqvb">2. Delay in IPI=C2=A0</span></span></span>delivery<span =
class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b">=
<span class=3D"gmail-ryNqvb">=C2=A0speed (even at the hardware level, signa=
l=C2=A0</span></span></span>delivery<span class=3D"gmail-HwtZe" lang=3D"en"=
><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">=C2=
=A0shouldn&#39;t happen simultaneously, and some cores may have interrupts =
disabled);</span></span><span class=3D"gmail-jCAhz gmail-ChMk0b"><span clas=
s=3D"gmail-ryNqvb"><br></span></span></span></div><div><span class=3D"gmail=
-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D=
"gmail-ryNqvb">3. CPU frequency boost, which allows some cores to execute c=
ode faster.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b"><span cl=
ass=3D"gmail-ryNqvb">On modern CPUs, this doesn&#39;t affect the TSC freque=
ncy, but the problem is that the counter will be read at different times.</=
span></span><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-r=
yNqvb"><br></span></span></span></div><div><span class=3D"gmail-HwtZe" lang=
=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqv=
b">4. The initial difference in TSC counter values, which for cores within =
a single CPU should be no more than 100 ns.</span></span> <span class=3D"gm=
ail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">In the case of NUMA, n=
o more than 1000 ns;</span></span><span class=3D"gmail-jCAhz gmail-ChMk0b">=
<span class=3D"gmail-ryNqvb"><br></span></span></span></div><div><span clas=
s=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><spa=
n class=3D"gmail-ryNqvb">I can&#39;t speak about percentages; I wasn&#39;t =
involved in CPU development, but there are many reasons not to allow cores =
to compete in sequence increment speed.</span></span></span></div><div><spa=
n class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b=
"><span class=3D"gmail-ryNqvb"><br></span></span></span></div><div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">The log entries aren&#39;t in CPU=
 order, and CPUs 1 and 2 actually have<br>
identical values on the rhs. That doesn&#39;t quite fit what you have said =
so<br>
far. CPU3&#39;s value is also lower than CPU0&#39;s.<span class=3D"gmail-im=
"></span><br><span class=3D"gmail-im"></span>While CPU numbers happen to be=
 in sequence here, the rhs values aren&#39;t equally<br>
ordered.<br>
Also really here it is<br>
22915730869696 - 22915730869993 =3D -297 * 3 (3.00 GHz) =3D 891 ahead<span =
class=3D"gmail-im"></span><br><span class=3D"gmail-im"></span>Similarly her=
e. Yes, the gap increases, yet that&#39;s not a lag of CPU3 past<br>
CPU0, but exactly the other way around.<span class=3D"gmail-im"></span><br>=
<span class=3D"gmail-im"></span>As per above - no, I don&#39;t think I can =
see that. Or maybe I&#39;m misreading the<br>
numbers as well as what you have been saying.<br></blockquote><span class=
=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz"><span class=3D"gma=
il-ryNqvb">During the first few hours, the situation can be blurred due to =
possible race conditions.</span></span> <span class=3D"gmail-jCAhz gmail-Ch=
Mk0b"><span class=3D"gmail-ryNqvb">After two days, it becomes more or less =
clear:</span></span></span></div><div><span class=3D"gmail-HwtZe" lang=3D"e=
n"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><b=
r></span></span></span></div><div><span class=3D"gmail-HwtZe" lang=3D"en"><=
span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">254478=
162020920 (core 0) &gt; 254478162018972 (core 1) &gt; 254478162018429 (core=
 2) &gt; 254478162017636 (core 3)</span></span></span></div><div><span clas=
s=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><spa=
n class=3D"gmail-ryNqvb"><br></span></span></span></div><div><span class=3D=
"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span cl=
ass=3D"gmail-ryNqvb">The lower the core number, the more it pulls ahead. It=
&#39;s possible that this is indeed related to which core is most heavily l=
oaded (which one activates CPU boost more often).</span></span> <span class=
=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">In my configurat=
ion, the first three cores are dedicated to DOM0, and the fourth is reserve=
d for virtual machines.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk=
0b"><span class=3D"gmail-ryNqvb">The first core ends up being the most heav=
ily loaded due to interrupt handling, etc.</span></span></span></div><div><=
span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChM=
k0b"><span class=3D"gmail-ryNqvb">I can also add that after replacing get_s=
_time_fixed with scale_delta, the difference stops accumulating.</span></sp=
an> <span class=3D"gmail-jCAhz"><span class=3D"gmail-ryNqvb">At this point,=
 it&#39;s clear to me that the problem is the use of previous last_stime va=
lues. The nature of this CPU behavior is unlikely to be understood at the s=
oftware level.</span></span> <span class=3D"gmail-jCAhz"><span class=3D"gma=
il-ryNqvb">Of course, all the processors I tested on have the constant_tsc,=
 nonstop_tsc, and tsc_known_freq flags.</span></span></span></div><br></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Jan 13, 2026 at 2:21=E2=80=AFPM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On 12.01.2026 17:41, An=
ton Markov wrote:<br>
&gt;&gt;<br>
&gt;&gt; That calls on_selected_cpus(), but send_IPI_mask() may then still =
resort to<br>
&gt;&gt; all-but-self. In that case all IPIs are sent in one go.<br>
&gt; <br>
&gt; Plus as said, how IPIs are sent doesn&#39;t matter for the invocation =
of<br>
&gt;&gt; time_calibration_rendezvous_tail(). They&#39;ll all run at the sam=
e time, not<br>
&gt;&gt; one after the other.<br>
&gt; <br>
&gt; At the hardware level, no one can guarantee that the processors will<b=
r>
&gt; simultaneously respond to the signal and execute your code nanosecond =
after<br>
&gt; you send the ipi. Especially when we&#39;re talking about NUMA configu=
rations. I&#39;m<br>
&gt; afraid the possible and impossible in the laws of physics is also beyo=
nd<br>
&gt; the scope of this thread.<br>
<br>
You did read my recurring explanation beyond the IPI sending, didn&#39;t yo=
u?<br>
Of course IPI arrival may vary across cores / threads. Yet the term<br>
&quot;rendezvous&quot; is used because CPUs having received the IPI are the=
n held<br>
in a waiting loop, until _all_ CPUs have made it there. Then CPU0<br>
indicates to all of them simultaneously to move to the next step. There&#39=
;s<br>
going to again be some variance (especially on NUMA, where the memory<br>
write needs to propagate to all nodes), but at least within a single node<b=
r>
that should be pretty low. The main source of variance I would expect<br>
there would by hyperthreads competing with one another in a single core.<br=
>
<br>
&gt; Since further down you build upon that &quot;IPI lag&quot;, I fear we =
first need to<br>
&gt;&gt; settle on this aspect of your theory.<br>
&gt; <br>
&gt;=C2=A0 I&#39;ve already provided the delay logs. It&#39;s not hard for =
me to repeat.<br>
<br>
Sure, I don&#39;t doubt you make those observations. But we&#39;re still tr=
ying to<br>
converge on a theory on what these may be caused by.<br>
<br>
&gt;=C2=A0 2 hours of work:<br>
&gt; <br>
&gt;&gt; (XEN) update stime on time calibrate 0, 8564145820102 -&gt; 856514=
5861597<br>
&gt;&gt; (8565145862216, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 1, 8564145820129 -&gt; 856514=
5861609<br>
&gt;&gt; (8565145863957, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 3, 8564145819996 -&gt; 856514=
5861491<br>
&gt;&gt; (8565145864800, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 2, 8564145820099 -&gt; 856514=
5861609<br>
&gt;&gt; (8565145865372, 0)<br>
&gt;&gt;<br>
&gt;&gt; 8565145861609 - 8565145861491 =3D 115 * 3 (3.00 GHz) =3D 345 lag<b=
r>
<br>
The log entries aren&#39;t in CPU order, and CPUs 1 and 2 actually have<br>
identical values on the rhs. That doesn&#39;t quite fit what you have said =
so<br>
far. CPU3&#39;s value is also lower than CPU0&#39;s.<br>
<br>
&gt; 3 hours of work:<br>
&gt; <br>
&gt;&gt; (XEN) update stime on time calibrate 0, 22914730829200 -&gt; 22915=
730869993<br>
&gt;&gt; (22915730870665, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 1, 22914730829073 -&gt; 22915=
730869889<br>
&gt;&gt; (22915730870693, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 2, 22914730829052 -&gt; 22915=
730869841<br>
&gt;&gt; (22915730872231, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 3, 22914730828892 -&gt; 22915=
730869696<br>
&gt;&gt; (22915730872096, 0)<br>
&gt;&gt;<br>
&gt;&gt; 22915730869993 - 22915730869696 =3D 297 * 3 (3.00 GHz) =3D 891 lag=
<br>
<br>
While CPU numbers happen to be in sequence here, the rhs values aren&#39;t =
equally<br>
ordered.<br>
<br>
Also really here it is<br>
<br>
22915730869696 - 22915730869993 =3D -297 * 3 (3.00 GHz) =3D 891 ahead<br>
<br>
&gt; 2-3 day of work:<br>
&gt; <br>
&gt;&gt; (XEN) update stime on time calibrate 0, 254477161980127 -&gt; 2544=
78162020920<br>
&gt;&gt; (254478162021549, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 2, 254477161977638 -&gt; 2544=
78162018429<br>
&gt;&gt; (254478162022187, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 1, 254477161978192 -&gt; 2544=
78162018972<br>
&gt;&gt; (254478162022776, 0)<br>
&gt;&gt; (XEN) update stime on time calibrate 3, 254477161976832 -&gt; 2544=
78162017636<br>
&gt;&gt; (254478162021394, 0)<br>
&gt;&gt;<br>
&gt;&gt; 254478162020920 - 254478162017636 =3D 3284 * 3 (3.00 GHz) =3D 9852=
 lag<br>
<br>
Similarly here. Yes, the gap increases, yet that&#39;s not a lag of CPU3 pa=
st<br>
CPU0, but exactly the other way around.<br>
<br>
&gt;=C2=A0 As you can see, the core lag is strictly determined by their seq=
uence<br>
&gt; number.<br>
<br>
As per above - no, I don&#39;t think I can see that. Or maybe I&#39;m misre=
ading the<br>
numbers as well as what you have been saying.<br>
<br>
Jan<br>
</blockquote></div>

--000000000000d9dad50648443a5d--

