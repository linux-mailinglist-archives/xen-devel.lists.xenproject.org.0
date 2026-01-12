Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813CD13500
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 15:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200453.1516366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJGw-0007s5-Bk; Mon, 12 Jan 2026 14:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200453.1516366; Mon, 12 Jan 2026 14:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJGw-0007qb-7z; Mon, 12 Jan 2026 14:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1200453;
 Mon, 12 Jan 2026 14:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvYd=7R=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1vfJGu-0007qG-Kd
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 14:51:56 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c15c848-efc6-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 15:51:54 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2a09757004cso59574805ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 06:51:54 -0800 (PST)
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
X-Inumbo-ID: 3c15c848-efc6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768229513; x=1768834313; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JmF2/VLCbeIWUuEssKcguK7EHciUZv8vmpc8vZUr/Ic=;
        b=NtGjqcc79bD4b58ybLzM9N+++6u/xUO9q0dc/+Vt1xqgeKUWg7BmWesxxs/UVDou4T
         VPZjk63aKLoDXBxT5MAEInOLbezSWZ5pLUCQXSaVPTChuI7cahOQQnnl10+jAAG3Ij+2
         hWBzBI4x0fC+43a4G65h/6LV8TJZwb9zjlSbCrZsj6IYd4jqTK22wbKpuy43jxyvTAtx
         ux6FnGZ7xHgR5J4tW4cpNl18HMQpTR3xfqf1H/EMiqDS7755SJNKFegLmREao6Vf4q6L
         tSjMceA6CDOZ83Ftm739lRbIRzkRNZLT7i1+d74f/YF4itTXeWKNiAFMbleSQZfYz3Zr
         hj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229513; x=1768834313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmF2/VLCbeIWUuEssKcguK7EHciUZv8vmpc8vZUr/Ic=;
        b=Me8W8IwKHjqQvUrfEst69d20eNQSA1zvynSaO/QSuyFD8D1TnJX+fnArY2Mdx3K3Il
         HkmQenSlCcowsBNJMNNjZKQeZ5TXGd4e/eNWHWPDj8xbe5oTWTIIG6KY+dDCAJmCE5Zp
         1bz1Rkvpb46TlYxj5OABksXql3XE4yWcJyfh6VY27/6hPGEhyPQMvUKLG2o1pz+xnA7R
         qzWarSvYRJOXvpcF6ar0QUKZK8sf9g/yXReT4e0SS22bXQwT2Bw6K2QkSzUAs7lwnI9Z
         RYZzzwi7oGhlwKAi2XmWURitEPhihUh2NmBqRXf3HaURigMk3d75o7gNmv6ZqOnYpDoE
         cqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYRa8eBcEjZ+K2wGm8mg9hRhfmMDJtAbeyFnD2Vs2XG5jYFgAvlt9rvgeycWk3lu7HPr0wJncRAGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUG665GjHkF4jGLstH/Ilen1N39qU30wmz4A6+4zl0x4bXyEFa
	9x6qZYirR09SasQX9pmFQsAY6Bl2HQ8SZaaqfpbYS+3CKuNROvD1kYdJS/bGpgxoEip9k2xzZC0
	d0M+stKPpfDOpmPGTOYWRI7ZG+wN0oWI=
X-Gm-Gg: AY/fxX4V6tTnol//xU58hwNxOwStAjqHqySp1Ml24jDWiNveM43rxfQhhTdE/dVWQ61
	dLRu3yb6TXrB8+uycj4PzwuWuugJqiakN/n+OsfSTSy1aRWw9vR7/h2m0HHWxDz6yfLcXgeBEKK
	30iikNsmBHrOxMJy+v2aBOMSTc0cHf2XHFibfZid8zzffQ7E29Px39jPYxqB8jQmDO8ddpVCqCa
	Ylw9KhqusHqFcoTGpWcSdO3YUPwkS4pcIBPg4eTBU6vNEY+b0u1rLrGJrchm8AVzN6Cghp8
X-Google-Smtp-Source: AGHT+IFC7KL+ECw6y2Nk7292WpJiWEApxRMGhTWyIXVRzo/9co/nor4bGNKz7DfwEMe5BXBVuUoZYkQp03/0nVWwdJ0=
X-Received: by 2002:a17:903:4765:b0:2a0:c1be:f436 with SMTP id
 d9443c01a7336-2a3ee4bfe10mr182051565ad.59.1768229513048; Mon, 12 Jan 2026
 06:51:53 -0800 (PST)
MIME-Version: 1.0
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com> <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
 <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com> <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
 <6ea436ce-6ecb-47f8-8d8a-98b0badeb14e@suse.com>
In-Reply-To: <6ea436ce-6ecb-47f8-8d8a-98b0badeb14e@suse.com>
From: Anton Markov <akmarkov45@gmail.com>
Date: Mon, 12 Jan 2026 17:51:41 +0300
X-Gm-Features: AZwV_QjrZzprkref4W33SGy92BuWGFTGnuSlxk-PPYr9r2I2N5wiARzzC-sGrC8
Message-ID: <CACQYvN_dZxXmvhBd8pZ41Kws_n_TXcwp5mMQ=H0Vu89Px8M+PA@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000001b5d70648320431"

--00000000000001b5d70648320431
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Perhaps, yet it still makes dealing with things more difficult.

Sorry. I just spent too much time on this bug to stay in my mind.

That's if IPIs are sent sequentially. In the most common case, they aren't,
> though - we use the all-but-self shorthand.

Actually, even if IPIs are sent sequentially, I can't see where you spot
> this effect: Both callers of time_calibration_rendezvous_tail() signal al=
l
> secondary CPUs to continue at the same time. Hence they'll all execute
> time_calibration_rendezvous_tail() in parallel.

In parallel, but with a slight delay.

Are they? I fear I don't know which part of the code you're talking about.

In the function "time_calibration" (xen/arch/x86/time.c) Sorry, I don't
take into account that you don't stay in context, being distracted by other
threads.

One of the reasons we (iirc) don't do that is that since the scaling factor
> is also slightly imprecise, we'd prefer to avoid scaling very big values.
> IOW by changing as you suggest we'd trade one accumulating error for
> another.

As I wrote above, there will be an error when using scale_delta, but it
won't accumulate between calls to time_calibration_rendezvous_tail. In the
current version, the old error (ipi lag + rounding error) persists due to
the use of the old local_stime in the get_s_time_fixed function, and it's
added to the new error and accumulates with each call.
If

c->local_stime =3D get_s_time_fixed(old_tsc ?: new_tsc);

replaced with:

c->local_stime =3D scale_delta(old_tsc ?: new_tsc);

Then we'll only be dealing with the error due to the current ipi lag and
rough rounding, within a single call.

If I understand you correctly, you fixed the rough rounding of scale_delta
by reducing the values using get_s_time_fixed . But the problem is, that
didn't help. The error now accumulates gradually because we're relying on
old calculations. Furthermore, while the old rounding error was limited,
now the error accumulates infinitely, albeit very slowly. If this is so,
then the solution to the problem becomes less obvious.

Roughly speaking, my servers start to go crazy after a week of continuous
operation, as the time lag between cores reaches 1 millisecond or more.

On Mon, Jan 12, 2026 at 5:13=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 12.01.2026 13:49, Anton Markov wrote:
> >> Btw, your prior response was too hard to properly read, due to excess
> blank
> >> lines with at the same time squashed leading blanks. Together with you=
r
> >> apparent inability to avoid top-posting, I think you really want to
> adjust
> >> your mail program's configuration.
> >
> > I suggest we skip the discussion of formatting and the number of spaces
> in
> > messages and instead focus on the topic of the thread. I have a very
> > difficult time troubleshooting difficult-to-reproduce bugs, and the fac=
t
> > that their descriptions are difficult to read due to the number of spac=
es
> > is probably the least of the difficulties.
>
> Perhaps, yet it still makes dealing with things more difficult.
>
> > That invocation of get_s_time_fixed() reduces to scale_delta() (without
> >> further rdtsc_ordered()), as non-zero at_tsc is passed in all cases. I=
OW
> >> it's not quite clear to me what change you are suggesting (that would
> >> actually make a functional difference).
> >
> > Replacing get_s_time_fixed with scale_delta will remove the calculation
> > dependency on the previous local_stime value, which accumulates lag
> between
> > cores. This is because: rdtsc_ordered is not called synchronously on th=
e
> > cores, but by the difference offset by the ipi speed. Therefore, we get=
:
> >
> > core0: current_rdtsc;
> > core1: current_rdtsc + ipi speed;
> > coreN: current_rdtsc + ipi speed * N;
>
> That's if IPIs are sent sequentially. In the most common case, they aren'=
t,
> though - we use the all-but-self shorthand.
>
> Actually, even if IPIs are sent sequentially, I can't see where you spot
> this effect: Both callers of time_calibration_rendezvous_tail() signal al=
l
> secondary CPUs to continue at the same time. Hence they'll all execute
> time_calibration_rendezvous_tail() in parallel.
>
> > Since ipi values are sent alternately in a loop to core0,
>
> Are they? I fear I don't know which part of the code you're talking about=
.
>
> > in the version
> > with get_s_time_fixed, we get the following local_stime calculation
> format.
> >
> > coreN: local_stime =3D local_stime + scale_delta((current_rdtsc +
> (ipi_speed
> > * N)) =E2=80=93 local_rdtsc);
>
> One of the reasons we (iirc) don't do that is that since the scaling fact=
or
> is also slightly imprecise, we'd prefer to avoid scaling very big values.
> IOW by changing as you suggest we'd trade one accumulating error for
> another.
>
> Jan
>
> > This means the time on each core will differ by ipi_speed * N. And sinc=
e
> > we're using the values of the previous local_stime, the difference will
> > accumulate because the previous local_stime was also offset. In the
> version
> > with scale_delta, we get:
> >
> > coreN: local_stime =3D scale_delta(current_rdtsc + (ipi_speed * N));
> >
> > This means there will still be a difference, but it won't accumulate, a=
nd
> > the offsets will remain within normal limits.
> >
> > If it's still unclear: If your local_stime in get_s_time_fixed is offse=
t
> > relative to other cores, then the fact that rdtsc_ordered and local_tsc
> are
> > not offset doesn't change anything, since you're using the delta relati=
ve
> > to local_stime.
> >
> > core0_local_stime + (rdtsc_ordered() - local_tsc) !=3D core1_local_stim=
e +
> > (rdtsc_ordered() - local_tsc); // Even if rdtsc_ordered() and local_tsc
> are
> > equal across cores.
> >
> > On 96-core configurations, up to a millisecond of latency can accumulat=
e
> in
> > local_stime over a week of operation, and this is a significant
> > difference. This
> > is due to the fact that I use cpufreq=3Dxen:performance max_cstate=3D1 =
,
> > meaning that in my configuration, local_stime is never overwritten by
> > master_stime.
> >
> > Thanks.
>

--00000000000001b5d70648320431
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Perhaps, yet it still makes dealing with things more difficult.<=
/blockquote><div>Sorry. I just spent too much time on this bug to stay in m=
y mind.=C2=A0</div><div><br></div></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">That&#39;s if IPIs are sent sequentially. In the most common=
 case, they aren&#39;t,<br>though - we use the all-but-self shorthand.</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Actually, even if=
 IPIs are sent sequentially, I can&#39;t see where you spot<br>this effect:=
 Both callers of time_calibration_rendezvous_tail() signal all<br>secondary=
 CPUs to continue at the same time. Hence they&#39;ll all execute<br>time_c=
alibration_rendezvous_tail() in parallel.</blockquote><div>In parallel, but=
 with a slight delay.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Are they? I fear I don&#39;t know which part of the code y=
ou&#39;re talking about.</blockquote><div>In the function &quot;time_calibr=
ation&quot; (xen/arch/x86/time.c) Sorry, I don&#39;t take into account that=
 you don&#39;t stay in context, being distracted by other threads.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">One of the re=
asons we (iirc) don&#39;t do that is that since the scaling factor<br>is al=
so slightly imprecise, we&#39;d prefer to avoid scaling very big values.<br=
>IOW by changing as you suggest we&#39;d trade one accumulating error for<b=
r>another.</blockquote><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span =
class=3D"gmail-ryNqvb">As I wrote above, there will be an error when using =
scale_delta, but it won&#39;t accumulate between calls to time_calibration_=
rendezvous_tail.</span></span><span class=3D"gmail-jCAhz gmail-ChMk0b"><spa=
n class=3D"gmail-ryNqvb">

In the current version, the old error (ipi lag + rounding error) persists d=
ue to the use of the old local_stime in the get_s_time_fixed function, and =
it&#39;s added to the new error and accumulates with each call.</span></spa=
n></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-=
ryNqvb">If</span></span></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"=
><span class=3D"gmail-ryNqvb"><br></span></span></div><div><span class=3D"g=
mail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">c-&gt;local_stime =3D=
 get_s_time_fixed(old_tsc ?: new_tsc);</span></span></div><div><span class=
=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></spa=
n></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-=
ryNqvb">replaced with:</span></span></div><div><span class=3D"gmail-jCAhz g=
mail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></span></div><div><spa=
n class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">c-&gt;loc=
al_stime =3D scale_delta(old_tsc ?: new_tsc);</span></span></div><div><span=
 class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span=
></span></div><div><span class=3D"gmail-jCAhz"><span class=3D"gmail-ryNqvb"=
>Then we&#39;ll only be dealing with the error due to the current ipi lag a=
nd rough rounding, within a single call.</span></span></div><div><span clas=
s=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></sp=
an></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail=
-ryNqvb">If I understand you correctly, you fixed the rough rounding of sca=
le_delta by reducing the values using get_s_time_fixed .</span></span> <spa=
n class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">But the p=
roblem is, that didn&#39;t help.</span></span> <span class=3D"gmail-jCAhz g=
mail-ChMk0b"><span class=3D"gmail-ryNqvb">The error now accumulates gradual=
ly because we&#39;re relying on old calculations.</span></span> <span class=
=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">Furthermore, whi=
le the old rounding error was limited, now the error accumulates infinitely=
, albeit very slowly.=C2=A0</span></span>If this is so, then the solution t=
o the problem becomes less obvious.</div><div><span class=3D"gmail-jCAhz gm=
ail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></span></div><div><span=
 class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">Roughly sp=
eaking, my servers start to go crazy after a week of continuous operation, =
as the time lag between cores reaches 1 millisecond or more.</span></span>=
=C2=A0</div><div>=C2=A0</div><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 12, 2026 at 5:13=E2=80=
=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 12.01.2026 13:49, Anton Markov wrote:<br>
&gt;&gt; Btw, your prior response was too hard to properly read, due to exc=
ess blank<br>
&gt;&gt; lines with at the same time squashed leading blanks. Together with=
 your<br>
&gt;&gt; apparent inability to avoid top-posting, I think you really want t=
o adjust<br>
&gt;&gt; your mail program&#39;s configuration.<br>
&gt; <br>
&gt; I suggest we skip the discussion of formatting and the number of space=
s in<br>
&gt; messages and instead focus on the topic of the thread. I have a very<b=
r>
&gt; difficult time troubleshooting difficult-to-reproduce bugs, and the fa=
ct<br>
&gt; that their descriptions are difficult to read due to the number of spa=
ces<br>
&gt; is probably the least of the difficulties.<br>
<br>
Perhaps, yet it still makes dealing with things more difficult.<br>
<br>
&gt; That invocation of get_s_time_fixed() reduces to scale_delta() (withou=
t<br>
&gt;&gt; further rdtsc_ordered()), as non-zero at_tsc is passed in all case=
s. IOW<br>
&gt;&gt; it&#39;s not quite clear to me what change you are suggesting (tha=
t would<br>
&gt;&gt; actually make a functional difference).<br>
&gt; <br>
&gt; Replacing get_s_time_fixed with scale_delta will remove the calculatio=
n<br>
&gt; dependency on the previous local_stime value, which accumulates lag be=
tween<br>
&gt; cores. This is because: rdtsc_ordered is not called synchronously on t=
he<br>
&gt; cores, but by the difference offset by the ipi speed. Therefore, we ge=
t:<br>
&gt; <br>
&gt; core0: current_rdtsc;<br>
&gt; core1: current_rdtsc + ipi speed;<br>
&gt; coreN: current_rdtsc + ipi speed * N;<br>
<br>
That&#39;s if IPIs are sent sequentially. In the most common case, they are=
n&#39;t,<br>
though - we use the all-but-self shorthand.<br>
<br>
Actually, even if IPIs are sent sequentially, I can&#39;t see where you spo=
t<br>
this effect: Both callers of time_calibration_rendezvous_tail() signal all<=
br>
secondary CPUs to continue at the same time. Hence they&#39;ll all execute<=
br>
time_calibration_rendezvous_tail() in parallel.<br>
<br>
&gt; Since ipi values are sent alternately in a loop to core0,<br>
<br>
Are they? I fear I don&#39;t know which part of the code you&#39;re talking=
 about.<br>
<br>
&gt; in the version<br>
&gt; with get_s_time_fixed, we get the following local_stime calculation fo=
rmat.<br>
&gt; <br>
&gt; coreN: local_stime =3D local_stime + scale_delta((current_rdtsc + (ipi=
_speed<br>
&gt; * N)) =E2=80=93 local_rdtsc);<br>
<br>
One of the reasons we (iirc) don&#39;t do that is that since the scaling fa=
ctor<br>
is also slightly imprecise, we&#39;d prefer to avoid scaling very big value=
s.<br>
IOW by changing as you suggest we&#39;d trade one accumulating error for<br=
>
another.<br>
<br>
Jan<br>
<br>
&gt; This means the time on each core will differ by ipi_speed * N. And sin=
ce<br>
&gt; we&#39;re using the values of the previous local_stime, the difference=
 will<br>
&gt; accumulate because the previous local_stime was also offset. In the ve=
rsion<br>
&gt; with scale_delta, we get:<br>
&gt; <br>
&gt; coreN: local_stime =3D scale_delta(current_rdtsc + (ipi_speed * N));<b=
r>
&gt; <br>
&gt; This means there will still be a difference, but it won&#39;t accumula=
te, and<br>
&gt; the offsets will remain within normal limits.<br>
&gt; <br>
&gt; If it&#39;s still unclear: If your local_stime in get_s_time_fixed is =
offset<br>
&gt; relative to other cores, then the fact that rdtsc_ordered and local_ts=
c are<br>
&gt; not offset doesn&#39;t change anything, since you&#39;re using the del=
ta relative<br>
&gt; to local_stime.<br>
&gt; <br>
&gt; core0_local_stime + (rdtsc_ordered() - local_tsc) !=3D core1_local_sti=
me +<br>
&gt; (rdtsc_ordered() - local_tsc); // Even if rdtsc_ordered() and local_ts=
c are<br>
&gt; equal across cores.<br>
&gt; <br>
&gt; On 96-core configurations, up to a millisecond of latency can accumula=
te in<br>
&gt; local_stime over a week of operation, and this is a significant<br>
&gt; difference. This<br>
&gt; is due to the fact that I use cpufreq=3Dxen:performance max_cstate=3D1=
 ,<br>
&gt; meaning that in my configuration, local_stime is never overwritten by<=
br>
&gt; master_stime.<br>
&gt; <br>
&gt; Thanks.<br>
</blockquote></div></div>

--00000000000001b5d70648320431--

