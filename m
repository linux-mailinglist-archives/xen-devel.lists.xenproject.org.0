Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD560D141C8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200762.1516606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKzI-0002Mw-J2; Mon, 12 Jan 2026 16:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200762.1516606; Mon, 12 Jan 2026 16:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKzI-0002L0-Fd; Mon, 12 Jan 2026 16:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1200762;
 Mon, 12 Jan 2026 16:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvYd=7R=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1vfKzH-0002Ku-0D
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:41:51 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964531ff-efd5-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:41:48 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-34c3cb504efso5160110a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:41:48 -0800 (PST)
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
X-Inumbo-ID: 964531ff-efd5-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768236107; x=1768840907; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LmQxRaEfTzRUlFieKT5pobgQa+TD62w/YBtexOYyobY=;
        b=AyY9rUXTRke+oJ5CgKe5svf+KUOU+o1QMVTvBn8TWFWKatDXYFJasrUWO8AEpF5O4s
         HSflnd0s5n+DHXJuts8RXbglMzQEnWqrhDumQ66gvx6lhwD42TalwrfKmJwFcLDOxtzL
         QaJSB/gb8cNr4xo081PTKIVStml81kMOaELcdw0DyFIxR+S+UOo0ee0FuwYN24XLLg02
         QREyMxDd7PneweqPi2ZxpDJMiaIi4tM3R6iLXcJj6xfGtcZSA/oIEJyB3bGUkQ+6BRhL
         +gph7dqHD4QaNSqfS8yjV+Bzmg7i/tkOeeq4g9i+KWCvT6yPOoS8XU+OXfJft+jjj2MC
         GA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236107; x=1768840907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmQxRaEfTzRUlFieKT5pobgQa+TD62w/YBtexOYyobY=;
        b=pI8s7mzfDQikk66o4ELdwMHwg0HbEwp0tqCSiBMUydGcSvxGienG5cX5IXIN0myqup
         k5xehKI80oWqxP/NlAmW2wnbP3vvcIKnfx5Rw1KW52XUcs18bLQDBbHN6YT5OUKx7cYw
         a9HyrD9ennpdKlNdbgUMRdSRlphbSgg5Fm+FtqW93QTNGirbwjtDj9+En7tipawT0M5w
         Wx49Kv+5Rp40eL4hD0shx4eKA2IaDkqAQphRAMMl+S+h16p/71eA9RP1+Ce7F/i522xV
         O2Dk3hrEP8V8tJt0DTMwELblA3AsfMwqtHSgvRQQkHjxkQvi/GBX1NNtA3xuivTxPazB
         kJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSR9OVr3UcozI7WCZpwq6qV/gHmtJyzP4sCop5Z6ArOeQm5umaNpee0avrQmrNLcd9qpMvFXNoxgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZU3e/HogD0bWQnKTPTyRmsS8I0QrQNC2L/PfgZKZlkA+0avDs
	GvjWbImEFEfsNpNESbB/f2t3M32bCyuKkG014tXF8A9DOTQsQC52xY8mvWcN1+ovBrOiPir/+TJ
	YIibKuCoADJJWnEvhHgYZ+RYc13SUyag=
X-Gm-Gg: AY/fxX73auJjCNJ2SosEHuY9EHrMSxojnRu8h4KZRVtERabwUOTVn5fQ2I/EPoFTnld
	zQ374I9kUrZ0ehvW6XlBRbI5AxIboL5pYpUc0OHn4PV5+Ws1AAgJLytAGaMMLWIGeXDIVOS6BN9
	ho6o0fPHQH065sRubSzGSk/sG6Ah/CTCp9pSukAdOBVH9M8gW/Vp8Q/dK0x8+Zt5lpdtgCEvzzo
	xKU5OGLq7dEhx7ivulyZnKKAurzj43W4/eKHzssU1d6aBn95Jc3lagZ+QX+rRgzTFy4PZNKRBco
	BMO7wRw=
X-Google-Smtp-Source: AGHT+IFlPDAli0uXr8IAVaKgjql6bSoNIJofERIyICw5d7P0xyQfwr+VtJWCUUunM2q2vLmC7m0D71tjwDB86+YbsIM=
X-Received: by 2002:a17:90b:4f92:b0:343:f509:aa4a with SMTP id
 98e67ed59e1d1-34f68d3b229mr17293008a91.36.1768236106847; Mon, 12 Jan 2026
 08:41:46 -0800 (PST)
MIME-Version: 1.0
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com> <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
 <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com> <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
 <6ea436ce-6ecb-47f8-8d8a-98b0badeb14e@suse.com> <CACQYvN_dZxXmvhBd8pZ41Kws_n_TXcwp5mMQ=H0Vu89Px8M+PA@mail.gmail.com>
 <b70e2c0e-7e8d-41d8-97da-5b975ad0ed47@suse.com>
In-Reply-To: <b70e2c0e-7e8d-41d8-97da-5b975ad0ed47@suse.com>
From: Anton Markov <akmarkov45@gmail.com>
Date: Mon, 12 Jan 2026 19:41:35 +0300
X-Gm-Features: AZwV_QjPU3l-_ebHzf2wMLw_kWIk4rQxmVrKxU_xWi48ezWuWDoghQInI6IaLHE
Message-ID: <CACQYvN8YtN4Q5MSH4i=MPjtOaxmPwr+oOKBSsrpqBq+=xAYhuw@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000071bf40648338dfc"

--000000000000071bf40648338dfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> That calls on_selected_cpus(), but send_IPI_mask() may then still resort =
to
> all-but-self. In that case all IPIs are sent in one go.

Plus as said, how IPIs are sent doesn't matter for the invocation of
> time_calibration_rendezvous_tail(). They'll all run at the same time, not
> one after the other.

At the hardware level, no one can guarantee that the processors will
simultaneously respond to the signal and execute your code nanosecond after
you send the ipi. Especially when we're talking about NUMA configurations. =
I'm
afraid the possible and impossible in the laws of physics is also beyond
the scope of this thread.

Since further down you build upon that "IPI lag", I fear we first need to
> settle on this aspect of your theory.

 I've already provided the delay logs. It's not hard for me to repeat.

The patch:

> @@ -1732,6 +1753,8 @@ static void cf_check local_time_calibration(void)
>
> if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )
>
> {
>
> /* Atomically read cpu_calibration struct and write cpu_time struct. */
>
> + printk("update stime on time calibrate %d, %lu -> %lu (%lu, %lu)\n",
> smp_processor_id(), t->stamp.local_stime, c->local_stime,
>
> + t->last_seen_ns, t->last_seen_tsc);
>
> local_irq_disable();
>
> t->stamp =3D *c;
>
> local_irq_enable();
>

 2 hours of work:

> (XEN) update stime on time calibrate 0, 8564145820102 -> 8565145861597
> (8565145862216, 0)
> (XEN) update stime on time calibrate 1, 8564145820129 -> 8565145861609
> (8565145863957, 0)
> (XEN) update stime on time calibrate 3, 8564145819996 -> 8565145861491
> (8565145864800, 0)
> (XEN) update stime on time calibrate 2, 8564145820099 -> 8565145861609
> (8565145865372, 0)
>
> 8565145861609 - 8565145861491 =3D 115 * 3 (3.00 GHz) =3D 345 lag
>

3 hours of work:

> (XEN) update stime on time calibrate 0, 22914730829200 -> 22915730869993
> (22915730870665, 0)
> (XEN) update stime on time calibrate 1, 22914730829073 -> 22915730869889
> (22915730870693, 0)
> (XEN) update stime on time calibrate 2, 22914730829052 -> 22915730869841
> (22915730872231, 0)
> (XEN) update stime on time calibrate 3, 22914730828892 -> 22915730869696
> (22915730872096, 0)
>
> 22915730869993 - 22915730869696 =3D 297 * 3 (3.00 GHz) =3D 891 lag
>

2-3 day of work:

> (XEN) update stime on time calibrate 0, 254477161980127 -> 25447816202092=
0
> (254478162021549, 0)
> (XEN) update stime on time calibrate 2, 254477161977638 -> 25447816201842=
9
> (254478162022187, 0)
> (XEN) update stime on time calibrate 1, 254477161978192 -> 25447816201897=
2
> (254478162022776, 0)
> (XEN) update stime on time calibrate 3, 254477161976832 -> 25447816201763=
6
> (254478162021394, 0)
>
> 254478162020920 - 254478162017636 =3D 3284 * 3 (3.00 GHz) =3D 9852 lag


 As you can see, the core lag is strictly determined by their sequence
number. I won't argue about what percentage of this delay is due to
rounding error and what percentage is due to ipi lag. To reproduce this,
simply add the patch (excluding t->last_seen_ns and t->last_seen_tsc ,
which were necessary for my own understanding). Then enable the hypervisor
with the settings cpufreq=3Dxen:performance max_cstate=3D1 . Clocksource is
left at the default (i.e., hpet).

On Mon, Jan 12, 2026 at 7:08=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 12.01.2026 15:51, Anton Markov wrote:
> > That's if IPIs are sent sequentially. In the most common case, they
> aren't,
> >> though - we use the all-but-self shorthand.
> >
> > Actually, even if IPIs are sent sequentially, I can't see where you spo=
t
> >> this effect: Both callers of time_calibration_rendezvous_tail() signal
> all
> >> secondary CPUs to continue at the same time. Hence they'll all execute
> >> time_calibration_rendezvous_tail() in parallel.
> >
> > In parallel, but with a slight delay.
> >
> > Are they? I fear I don't know which part of the code you're talking
> about.
> >
> > In the function "time_calibration" (xen/arch/x86/time.c) Sorry, I don't
> > take into account that you don't stay in context, being distracted by
> other
> > threads.
>
> That calls on_selected_cpus(), but send_IPI_mask() may then still resort =
to
> all-but-self. In that case all IPIs are sent in one go.
>
> Plus as said, how IPIs are sent doesn't matter for the invocation of
> time_calibration_rendezvous_tail(). They'll all run at the same time, not
> one after the other.
>
> Since further down you build upon that "IPI lag", I fear we first need to
> settle on this aspect of your theory.
>
> Jan
>
> > One of the reasons we (iirc) don't do that is that since the scaling
> factor
> >> is also slightly imprecise, we'd prefer to avoid scaling very big
> values.
> >> IOW by changing as you suggest we'd trade one accumulating error for
> >> another.
> >
> > As I wrote above, there will be an error when using scale_delta, but it
> > won't accumulate between calls to time_calibration_rendezvous_tail. In
> the
> > current version, the old error (ipi lag + rounding error) persists due =
to
> > the use of the old local_stime in the get_s_time_fixed function, and it=
's
> > added to the new error and accumulates with each call.
> > If
> >
> > c->local_stime =3D get_s_time_fixed(old_tsc ?: new_tsc);
> >
> > replaced with:
> >
> > c->local_stime =3D scale_delta(old_tsc ?: new_tsc);
> >
> > Then we'll only be dealing with the error due to the current ipi lag an=
d
> > rough rounding, within a single call.
> >
> > If I understand you correctly, you fixed the rough rounding of
> scale_delta
> > by reducing the values using get_s_time_fixed . But the problem is, tha=
t
> > didn't help. The error now accumulates gradually because we're relying =
on
> > old calculations. Furthermore, while the old rounding error was limited=
,
> > now the error accumulates infinitely, albeit very slowly. If this is so=
,
> > then the solution to the problem becomes less obvious.
> >
> > Roughly speaking, my servers start to go crazy after a week of continuo=
us
> > operation, as the time lag between cores reaches 1 millisecond or more.
> >
> > On Mon, Jan 12, 2026 at 5:13=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >
> >> On 12.01.2026 13:49, Anton Markov wrote:
> >>>> Btw, your prior response was too hard to properly read, due to exces=
s
> >> blank
> >>>> lines with at the same time squashed leading blanks. Together with
> your
> >>>> apparent inability to avoid top-posting, I think you really want to
> >> adjust
> >>>> your mail program's configuration.
> >>>
> >>> I suggest we skip the discussion of formatting and the number of spac=
es
> >> in
> >>> messages and instead focus on the topic of the thread. I have a very
> >>> difficult time troubleshooting difficult-to-reproduce bugs, and the
> fact
> >>> that their descriptions are difficult to read due to the number of
> spaces
> >>> is probably the least of the difficulties.
> >>
> >> Perhaps, yet it still makes dealing with things more difficult.
> >>
> >>> That invocation of get_s_time_fixed() reduces to scale_delta() (witho=
ut
> >>>> further rdtsc_ordered()), as non-zero at_tsc is passed in all cases.
> IOW
> >>>> it's not quite clear to me what change you are suggesting (that woul=
d
> >>>> actually make a functional difference).
> >>>
> >>> Replacing get_s_time_fixed with scale_delta will remove the calculati=
on
> >>> dependency on the previous local_stime value, which accumulates lag
> >> between
> >>> cores. This is because: rdtsc_ordered is not called synchronously on
> the
> >>> cores, but by the difference offset by the ipi speed. Therefore, we
> get:
> >>>
> >>> core0: current_rdtsc;
> >>> core1: current_rdtsc + ipi speed;
> >>> coreN: current_rdtsc + ipi speed * N;
> >>
> >> That's if IPIs are sent sequentially. In the most common case, they
> aren't,
> >> though - we use the all-but-self shorthand.
> >>
> >> Actually, even if IPIs are sent sequentially, I can't see where you sp=
ot
> >> this effect: Both callers of time_calibration_rendezvous_tail() signal
> all
> >> secondary CPUs to continue at the same time. Hence they'll all execute
> >> time_calibration_rendezvous_tail() in parallel.
> >>
> >>> Since ipi values are sent alternately in a loop to core0,
> >>
> >> Are they? I fear I don't know which part of the code you're talking
> about.
> >>
> >>> in the version
> >>> with get_s_time_fixed, we get the following local_stime calculation
> >> format.
> >>>
> >>> coreN: local_stime =3D local_stime + scale_delta((current_rdtsc +
> >> (ipi_speed
> >>> * N)) =E2=80=93 local_rdtsc);
> >>
> >> One of the reasons we (iirc) don't do that is that since the scaling
> factor
> >> is also slightly imprecise, we'd prefer to avoid scaling very big
> values.
> >> IOW by changing as you suggest we'd trade one accumulating error for
> >> another.
> >>
> >> Jan
> >>
> >>> This means the time on each core will differ by ipi_speed * N. And
> since
> >>> we're using the values of the previous local_stime, the difference wi=
ll
> >>> accumulate because the previous local_stime was also offset. In the
> >> version
> >>> with scale_delta, we get:
> >>>
> >>> coreN: local_stime =3D scale_delta(current_rdtsc + (ipi_speed * N));
> >>>
> >>> This means there will still be a difference, but it won't accumulate,
> and
> >>> the offsets will remain within normal limits.
> >>>
> >>> If it's still unclear: If your local_stime in get_s_time_fixed is
> offset
> >>> relative to other cores, then the fact that rdtsc_ordered and local_t=
sc
> >> are
> >>> not offset doesn't change anything, since you're using the delta
> relative
> >>> to local_stime.
> >>>
> >>> core0_local_stime + (rdtsc_ordered() - local_tsc) !=3D core1_local_st=
ime
> +
> >>> (rdtsc_ordered() - local_tsc); // Even if rdtsc_ordered() and local_t=
sc
> >> are
> >>> equal across cores.
> >>>
> >>> On 96-core configurations, up to a millisecond of latency can
> accumulate
> >> in
> >>> local_stime over a week of operation, and this is a significant
> >>> difference. This
> >>> is due to the fact that I use cpufreq=3Dxen:performance max_cstate=3D=
1 ,
> >>> meaning that in my configuration, local_stime is never overwritten by
> >>> master_stime.
> >>>
> >>> Thanks.
> >>
> >
>
>

--000000000000071bf40648338dfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">That cal=
ls on_selected_cpus(), but send_IPI_mask() may then still resort to<br>all-=
but-self. In that case all IPIs are sent in one go.</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Plus as said, how IPIs are sent does=
n&#39;t matter for the invocation of<br>time_calibration_rendezvous_tail().=
 They&#39;ll all run at the same time, not<br>one after the other.</blockqu=
ote><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNq=
vb">At the hardware level, no one can guarantee that the processors will si=
multaneously respond to the signal and execute your code nanosecond after y=
ou send the ipi.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b"><sp=
an class=3D"gmail-ryNqvb">Especially when we&#39;re talking about NUMA conf=
igurations.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b"><span cl=
ass=3D"gmail-ryNqvb">I&#39;m afraid the possible and impossible in the laws=
 of physics is also beyond the scope of this thread.</span></span></div><di=
v><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br=
></span></span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sinc=
e further down you build upon that &quot;IPI lag&quot;, I fear we first nee=
d to<br>settle on this aspect of your theory.</blockquote><div>=C2=A0<span =
class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">I&#39;ve al=
ready provided the delay logs.</span></span> <span class=3D"gmail-jCAhz gma=
il-ChMk0b"><span class=3D"gmail-ryNqvb">It&#39;s not hard for me to repeat.=
</span></span></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span cla=
ss=3D"gmail-ryNqvb"><br></span></span></div><div>The patch:</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><p style=3D"line-height:100%;margin=
-bottom:0cm;background:transparent"><code style=3D"font-family:&quot;Libera=
tion Mono&quot;,monospace"><font face=3D"Liberation Serif, serif">@@
-1732,6 +1753,8 @@ static void cf_check local_time_calibration(void)</font>=
</code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">     <font fa=
ce=3D"Liberation Serif, serif">if
( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">     <font fa=
ce=3D"Liberation Serif, serif">{</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">         <fon=
t face=3D"Liberation Serif, serif">/*
Atomically read cpu_calibration struct and write cpu_time struct. */</font>=
</code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">+
       printk(&quot;update stime on time calibrate %d, %lu -&gt; %lu
(%lu, %lu)\n&quot;, smp_processor_id(), t-&gt;stamp.local_stime,
c-&gt;local_stime,</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">+
               t-&gt;last_seen_ns, t-&gt;last_seen_tsc);</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">       =20
<font face=3D"Liberation Serif, serif">local_irq_disable();</font></code></=
p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">       =20
<font face=3D"Liberation Serif, serif">t-&gt;stamp =3D *c;</font></code></p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">       =20
<font face=3D"Liberation Serif, serif">local_irq_enable();</font></code></p=
></blockquote><div><br></div><div>=C2=A02 hours of work:</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><p style=3D"line-height:100%;margin-bo=
ttom:0cm;background:transparent">(XEN) update stime on time calibrate 0, 85=
64145820102 -&gt; 8565145861597 (8565145862216, 0)<br>(XEN) update stime on=
 time calibrate 1, 8564145820129 -&gt; 8565145861609 (8565145863957, 0)<br>=
(XEN) update stime on time calibrate 3, 8564145819996 -&gt; 8565145861491 (=
8565145864800, 0)<br>(XEN) update stime on time calibrate 2, 8564145820099 =
-&gt; 8565145861609 (8565145865372, 0)<br><br>8565145861609 - 8565145861491=
 =3D 115 * 3 (3.00 GHz) =3D 345 lag</p></blockquote><div><br></div><div>3 h=
ours of work:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><p sty=
le=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN) upda=
te stime on time calibrate 0, 22914730829200 -&gt; 22915730869993 (22915730=
870665, 0)<br>(XEN) update stime on time calibrate 1, 22914730829073 -&gt; =
22915730869889 (22915730870693, 0)<br>(XEN) update stime on time calibrate =
2, 22914730829052 -&gt; 22915730869841 (22915730872231, 0)<br>(XEN) update =
stime on time calibrate 3, 22914730828892 -&gt; 22915730869696 (22915730872=
096, 0)<br><br>22915730869993 - 22915730869696 =3D 297 * 3 (3.00 GHz) =3D 8=
91 lag</p></blockquote><div><br></div><div>2-3 day of work:</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">(XEN) update stime on time calibrat=
e 0, 254477161980127 -&gt; 254478162020920 (254478162021549, 0)<br>(XEN) up=
date stime on time calibrate 2, 254477161977638 -&gt; 254478162018429 (2544=
78162022187, 0)<br>(XEN) update stime on time calibrate 1, 254477161978192 =
-&gt; 254478162018972 (254478162022776, 0)<br>(XEN) update stime on time ca=
librate 3, 254477161976832 -&gt; 254478162017636 (254478162021394, 0)<br><b=
r>254478162020920 - 254478162017636 =3D 3284 * 3 (3.00 GHz) =3D 9852 lag</b=
lockquote><div>=C2=A0</div><div>=C2=A0<span class=3D"gmail-jCAhz gmail-ChMk=
0b"><span class=3D"gmail-ryNqvb">As you can see, the core lag is strictly d=
etermined by their sequence number.=C2=A0</span></span>I won&#39;t argue ab=
out what percentage of this delay is due to rounding error and what percent=
age is due to ipi lag.=C2=A0<span class=3D"gmail-jCAhz gmail-ChMk0b"><span =
class=3D"gmail-ryNqvb">To reproduce this, simply add the patch (excluding t=
-&gt;last_seen_ns and t-&gt;last_seen_tsc , which were necessary for my own=
 understanding).</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b"><sp=
an class=3D"gmail-ryNqvb">Then enable the hypervisor with the settings cpuf=
req=3Dxen:performance max_cstate=3D1 .</span></span> <span class=3D"gmail-j=
CAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">Clocksource is left at the =
default (i.e., hpet).</span></span></div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan =
12, 2026 at 7:08=E2=80=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse=
.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 12.01.2026 15:51, Anton Markov wrote:<br>
&gt; That&#39;s if IPIs are sent sequentially. In the most common case, the=
y aren&#39;t,<br>
&gt;&gt; though - we use the all-but-self shorthand.<br>
&gt; <br>
&gt; Actually, even if IPIs are sent sequentially, I can&#39;t see where yo=
u spot<br>
&gt;&gt; this effect: Both callers of time_calibration_rendezvous_tail() si=
gnal all<br>
&gt;&gt; secondary CPUs to continue at the same time. Hence they&#39;ll all=
 execute<br>
&gt;&gt; time_calibration_rendezvous_tail() in parallel.<br>
&gt; <br>
&gt; In parallel, but with a slight delay.<br>
&gt; <br>
&gt; Are they? I fear I don&#39;t know which part of the code you&#39;re ta=
lking about.<br>
&gt; <br>
&gt; In the function &quot;time_calibration&quot; (xen/arch/x86/time.c) Sor=
ry, I don&#39;t<br>
&gt; take into account that you don&#39;t stay in context, being distracted=
 by other<br>
&gt; threads.<br>
<br>
That calls on_selected_cpus(), but send_IPI_mask() may then still resort to=
<br>
all-but-self. In that case all IPIs are sent in one go.<br>
<br>
Plus as said, how IPIs are sent doesn&#39;t matter for the invocation of<br=
>
time_calibration_rendezvous_tail(). They&#39;ll all run at the same time, n=
ot<br>
one after the other.<br>
<br>
Since further down you build upon that &quot;IPI lag&quot;, I fear we first=
 need to<br>
settle on this aspect of your theory.<br>
<br>
Jan<br>
<br>
&gt; One of the reasons we (iirc) don&#39;t do that is that since the scali=
ng factor<br>
&gt;&gt; is also slightly imprecise, we&#39;d prefer to avoid scaling very =
big values.<br>
&gt;&gt; IOW by changing as you suggest we&#39;d trade one accumulating err=
or for<br>
&gt;&gt; another.<br>
&gt; <br>
&gt; As I wrote above, there will be an error when using scale_delta, but i=
t<br>
&gt; won&#39;t accumulate between calls to time_calibration_rendezvous_tail=
. In the<br>
&gt; current version, the old error (ipi lag + rounding error) persists due=
 to<br>
&gt; the use of the old local_stime in the get_s_time_fixed function, and i=
t&#39;s<br>
&gt; added to the new error and accumulates with each call.<br>
&gt; If<br>
&gt; <br>
&gt; c-&gt;local_stime =3D get_s_time_fixed(old_tsc ?: new_tsc);<br>
&gt; <br>
&gt; replaced with:<br>
&gt; <br>
&gt; c-&gt;local_stime =3D scale_delta(old_tsc ?: new_tsc);<br>
&gt; <br>
&gt; Then we&#39;ll only be dealing with the error due to the current ipi l=
ag and<br>
&gt; rough rounding, within a single call.<br>
&gt; <br>
&gt; If I understand you correctly, you fixed the rough rounding of scale_d=
elta<br>
&gt; by reducing the values using get_s_time_fixed . But the problem is, th=
at<br>
&gt; didn&#39;t help. The error now accumulates gradually because we&#39;re=
 relying on<br>
&gt; old calculations. Furthermore, while the old rounding error was limite=
d,<br>
&gt; now the error accumulates infinitely, albeit very slowly. If this is s=
o,<br>
&gt; then the solution to the problem becomes less obvious.<br>
&gt; <br>
&gt; Roughly speaking, my servers start to go crazy after a week of continu=
ous<br>
&gt; operation, as the time lag between cores reaches 1 millisecond or more=
.<br>
&gt; <br>
&gt; On Mon, Jan 12, 2026 at 5:13=E2=80=AFPM Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<b=
r>
&gt; <br>
&gt;&gt; On 12.01.2026 13:49, Anton Markov wrote:<br>
&gt;&gt;&gt;&gt; Btw, your prior response was too hard to properly read, du=
e to excess<br>
&gt;&gt; blank<br>
&gt;&gt;&gt;&gt; lines with at the same time squashed leading blanks. Toget=
her with your<br>
&gt;&gt;&gt;&gt; apparent inability to avoid top-posting, I think you reall=
y want to<br>
&gt;&gt; adjust<br>
&gt;&gt;&gt;&gt; your mail program&#39;s configuration.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I suggest we skip the discussion of formatting and the number =
of spaces<br>
&gt;&gt; in<br>
&gt;&gt;&gt; messages and instead focus on the topic of the thread. I have =
a very<br>
&gt;&gt;&gt; difficult time troubleshooting difficult-to-reproduce bugs, an=
d the fact<br>
&gt;&gt;&gt; that their descriptions are difficult to read due to the numbe=
r of spaces<br>
&gt;&gt;&gt; is probably the least of the difficulties.<br>
&gt;&gt;<br>
&gt;&gt; Perhaps, yet it still makes dealing with things more difficult.<br=
>
&gt;&gt;<br>
&gt;&gt;&gt; That invocation of get_s_time_fixed() reduces to scale_delta()=
 (without<br>
&gt;&gt;&gt;&gt; further rdtsc_ordered()), as non-zero at_tsc is passed in =
all cases. IOW<br>
&gt;&gt;&gt;&gt; it&#39;s not quite clear to me what change you are suggest=
ing (that would<br>
&gt;&gt;&gt;&gt; actually make a functional difference).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Replacing get_s_time_fixed with scale_delta will remove the ca=
lculation<br>
&gt;&gt;&gt; dependency on the previous local_stime value, which accumulate=
s lag<br>
&gt;&gt; between<br>
&gt;&gt;&gt; cores. This is because: rdtsc_ordered is not called synchronou=
sly on the<br>
&gt;&gt;&gt; cores, but by the difference offset by the ipi speed. Therefor=
e, we get:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; core0: current_rdtsc;<br>
&gt;&gt;&gt; core1: current_rdtsc + ipi speed;<br>
&gt;&gt;&gt; coreN: current_rdtsc + ipi speed * N;<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s if IPIs are sent sequentially. In the most common case,=
 they aren&#39;t,<br>
&gt;&gt; though - we use the all-but-self shorthand.<br>
&gt;&gt;<br>
&gt;&gt; Actually, even if IPIs are sent sequentially, I can&#39;t see wher=
e you spot<br>
&gt;&gt; this effect: Both callers of time_calibration_rendezvous_tail() si=
gnal all<br>
&gt;&gt; secondary CPUs to continue at the same time. Hence they&#39;ll all=
 execute<br>
&gt;&gt; time_calibration_rendezvous_tail() in parallel.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Since ipi values are sent alternately in a loop to core0,<br>
&gt;&gt;<br>
&gt;&gt; Are they? I fear I don&#39;t know which part of the code you&#39;r=
e talking about.<br>
&gt;&gt;<br>
&gt;&gt;&gt; in the version<br>
&gt;&gt;&gt; with get_s_time_fixed, we get the following local_stime calcul=
ation<br>
&gt;&gt; format.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; coreN: local_stime =3D local_stime + scale_delta((current_rdts=
c +<br>
&gt;&gt; (ipi_speed<br>
&gt;&gt;&gt; * N)) =E2=80=93 local_rdtsc);<br>
&gt;&gt;<br>
&gt;&gt; One of the reasons we (iirc) don&#39;t do that is that since the s=
caling factor<br>
&gt;&gt; is also slightly imprecise, we&#39;d prefer to avoid scaling very =
big values.<br>
&gt;&gt; IOW by changing as you suggest we&#39;d trade one accumulating err=
or for<br>
&gt;&gt; another.<br>
&gt;&gt;<br>
&gt;&gt; Jan<br>
&gt;&gt;<br>
&gt;&gt;&gt; This means the time on each core will differ by ipi_speed * N.=
 And since<br>
&gt;&gt;&gt; we&#39;re using the values of the previous local_stime, the di=
fference will<br>
&gt;&gt;&gt; accumulate because the previous local_stime was also offset. I=
n the<br>
&gt;&gt; version<br>
&gt;&gt;&gt; with scale_delta, we get:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; coreN: local_stime =3D scale_delta(current_rdtsc + (ipi_speed =
* N));<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This means there will still be a difference, but it won&#39;t =
accumulate, and<br>
&gt;&gt;&gt; the offsets will remain within normal limits.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If it&#39;s still unclear: If your local_stime in get_s_time_f=
ixed is offset<br>
&gt;&gt;&gt; relative to other cores, then the fact that rdtsc_ordered and =
local_tsc<br>
&gt;&gt; are<br>
&gt;&gt;&gt; not offset doesn&#39;t change anything, since you&#39;re using=
 the delta relative<br>
&gt;&gt;&gt; to local_stime.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; core0_local_stime + (rdtsc_ordered() - local_tsc) !=3D core1_l=
ocal_stime +<br>
&gt;&gt;&gt; (rdtsc_ordered() - local_tsc); // Even if rdtsc_ordered() and =
local_tsc<br>
&gt;&gt; are<br>
&gt;&gt;&gt; equal across cores.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 96-core configurations, up to a millisecond of latency can =
accumulate<br>
&gt;&gt; in<br>
&gt;&gt;&gt; local_stime over a week of operation, and this is a significan=
t<br>
&gt;&gt;&gt; difference. This<br>
&gt;&gt;&gt; is due to the fact that I use cpufreq=3Dxen:performance max_cs=
tate=3D1 ,<br>
&gt;&gt;&gt; meaning that in my configuration, local_stime is never overwri=
tten by<br>
&gt;&gt;&gt; master_stime.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks.<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000071bf40648338dfc--

