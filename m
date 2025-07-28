Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45365B13776
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 11:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061147.1426650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugK78-00034S-3K; Mon, 28 Jul 2025 09:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061147.1426650; Mon, 28 Jul 2025 09:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugK78-00032u-0H; Mon, 28 Jul 2025 09:25:46 +0000
Received: by outflank-mailman (input) for mailman id 1061147;
 Mon, 28 Jul 2025 09:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0z=2J=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ugK76-00032m-JN
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 09:25:44 +0000
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [2607:f8b0:4864:20::a30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d44e5c32-6b94-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 11:25:41 +0200 (CEST)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-53164bd0df3so1183003e0c.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 02:25:41 -0700 (PDT)
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
X-Inumbo-ID: d44e5c32-6b94-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753694740; x=1754299540; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCiWTLEi09+5TgijsNKH+w3lUbqoP4wo6weULehU/Ag=;
        b=Mbvbn94B2o8CdtTXlGVaumCpaMc2AH5ThCegpuqYokKg6uPxAhpCfwTcmhCFiNoFWw
         6fQyNBHJ24hJd3y7jzhbgdwlzwdFHgQqb+rQueslO9adgRKyE+0aP5XKfaxwgO1R8Sxp
         xALlrcjRZjoqKcG7H3nC5wexhIVnhhX2KMy4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753694740; x=1754299540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCiWTLEi09+5TgijsNKH+w3lUbqoP4wo6weULehU/Ag=;
        b=VnaMTOg3AinikM6QSNND826PLk/exjMXJT68jYuOmUI+KgWxWZAeq5ycH7AgmFFzbK
         dYwr0T8RGl6g4qwyAkHUoRS6C1/wLzBoZKO+eQiVSjO1wFyUlGdjsqFtoUOwrRBlm6WP
         MzMKAW8VyFMgnl+hPkd+JQC99LwoEMs+4UIk3fAfaRp3KcvQapLa6R26A8Qo75CS8nTj
         udbAD0co6DtHl/4ZnNoeVUTHC/VifkBBcTpg8ah7ye7n+Cs+hAAH8S3PPnlqIsMgAsci
         RZif8iBAvVKvVoPSDF9Sbp/kP3qYAe4p44dhhi/RUZBMdb2pOvmxC/XXHUCD2pDKgm7l
         cTfA==
X-Gm-Message-State: AOJu0YxB5NnV8o9QBLeJ/F8OuP4y9+RHgHdHgR/dW6A1ZuABGdbZbyVX
	a9dAu/eZRgUbPc1pxNSeAdq9SLABELGhAolQjKD0Md9i6VcIc39lgwiepr0lXVOo7pwcO1RT6ZK
	XZuikYGZFJGDHS2AJR1B8j1S++z5MHLv5VS4mRB7StA==
X-Gm-Gg: ASbGncv3snwhMzZXMmAJhtpGeDMcRUEEIA3VZEa1D+E6v77qx7oUrq8bS5YUCSZe8R9
	9uQ5YfaU3OyaA+vP1VZd6UjXeY1WdohbSSEruh7mRSme3d3rzMNjQ2SCgmRY7pR8RrIdSHxVP28
	wIK5Zrlz7vchz/8W29TSYGmKIlknCDrQFWoszi8i0YqGdrtgen/WV8j0cz90Brkdr7GnunZ6Dzh
	ouO7SNYkg==
X-Google-Smtp-Source: AGHT+IFzQexOXYGyfBXfNGk86YB4I773HZC997T7elrRfuV7oLeTz42rQbHZh25AYcUhttDUK44I4YpXLD99/8Sjsnc=
X-Received: by 2002:a05:6122:a13:b0:534:7f57:8e25 with SMTP id
 71dfb90a1353d-538db48ba3cmr3471262e0c.1.1753694740128; Mon, 28 Jul 2025
 02:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753372928.git.edwin.torok@cloud.com> <62bb83b9-d1d1-446a-88a8-20d11c5a0b4c@gmail.com>
In-Reply-To: <62bb83b9-d1d1-446a-88a8-20d11c5a0b4c@gmail.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Mon, 28 Jul 2025 10:25:29 +0100
X-Gm-Features: Ac12FXw_eWtAVjpzkARI_4yPUPI6BOTJeYNLzslfefC2D9t_-cSlYb-QM1ovPRM
Message-ID: <CAEfZLv=ueok--vEfNaA64hSLX6EU_MCsvmwh_uqvKO-c7hUcYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/10] Xen flamegraph (hypervisor stacktrace
 profile) support
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	andriy.sultanov@vates.tech, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 11:26=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> On 7/25/25 11:06, Edwin T=C3=B6r=C3=B6k wrote:
> > Caveats:
> >  * x86-only for now
> >  * only tested on AMD EPYC 8124P
> >  * Xen PMU support was broken to begin with on Xeon Silver 4514Y, so I
> >  wasn't able to test there ('perf top' fails to parse samples). I'll
> >  try to figure out what is wrong there separately
> >  * for now I edit the release config in xen.spec to enable frame
> >  pointers. Eventually it might be useful to have a 3rd build variant:
> >  release-fp. Or teach Xen to produce/parse ORC or SFrame formats withou=
t
> >  requiring frame pointers.
>
> That would definitely be nice.
>
> >  * perf produces raw hex addresses, and a python script is used to
> >  post-process it and obtain symbols. Eventually perf should be updated
> >  to do this processing itself (there was an old patch for Linux 3.12 by=
 Borislav Petkov)
> >  * I've only tested capturing Dom0 stack traces. Linux doesn't support
> >   guest stacktraces yet (it can only lookup the guest RIP)
>
> What would be needed to fix this?  Capturing guest stacktraces from the h=
ost
> or Xen seems like a really bad idea, but it might make sense to interrupt=
 the
> guest and allow it to provide a (strictly validated) stack trace for use =
by
> the host.  This would need to be done asynchronously, as Linux is moving
> towards generating stack traces outside of the NMI handler.

The way perf captures stacktraces for userspace is that it either
walks its stack by following framepointers
and copying memory from userspace, or it can take a copy of the entire
userspace stack (up to a limit of ~64KiB),
and let perf userspace construct a stacktrace from that (for --callgraph=3D=
dwarf).
I'd expect that copying from userspace is a lot faster than copying
from a guest, because for a guest you'd also need to map
the page first, which would be an additional cost (and you'd have to
be careful not to infinitely recurse if you get another interrupt
while mapping), unless you keep the entire guest address space mapped,
or have a cache of mapped stack pages.

You can let a guest profile itself though, in which case it can
process its own stacktrace, but exposing Xen's stacktrace to untrusted
guests is probably not a good idea.

You could try to also do what I've done with Xen here: have the guest
provide the stacktrace to the hypervisor, which provides it to Dom0.
But then you'd need to run some code inside the guest, and that may
not be possible if you are currently handling something on behalf of
the guest in Xen.

I'd first wait to see whether KVM implements this, and then implement
something similar for Xen. AFAICT KVM doesn't support this either.

>
> >  * the Linux patch will need to be forwarded ported to master before su=
bmission
> >  * All the caveats for using regular VPMU apply, except for the lack of
> >   stacktraces, that is fixed here!

> What would be needed to fix these limitations?

See below for my answers to each one, although others on this mailing
list might be able to provide a more correct answer.

> >     * Dom0 must run hard pinned on all host CPUs

Not sure. I think Dom0 needs to be able to run some code whenever the
NMI arrives, and that needs to run on the CPU it arrived on, unless
you define a way for one CPU to also receive and process interrupts
for CPUs that Dom0 doesn't run on.
The pinning requirement could be lifted if everything is correctly
context switched

> >     * Watchdog must be disabled

IIUC the Xen watchdog and the profiling interrupt both use NMIs, so
you can only have one of them active.
In fact even with bare metal Linux the NMI watchdog sometimes needs to
be disabled for certain perf counters to work, although basic timer
based profiling and most counters work with NMI enabled. If needed
'perf' prints a message to disable the Linux NMI watchdog, but if you
follow those instructions literally the host will panic and reboot 20s
later because the soft lockup detector won't work anymore (so that too
would need to be disabled).

> >     * not security supported

See https://xenbits.xen.org/xsa/advisory-163.html

Also even if you ignore security support, using vPMU on production
systems currently is probably not a good idea, there are probably lots
of pre-existing bugs to fix, and the bugs might be micro-architecture
specific.
E.g. with vPMU enabled running 'perf stat -ddd' in Dom0 caused one of
my (older) hosts to completely freeze (all vCPUs except one stuck in a
spinlock, and the last one not running anywhere), whereas it ran
perfectly fine on other (newer) hosts. I haven't debugged yet what is
causing it (could also be a bug in Linux, or the Linux Xen PMU driver
and not Xen).

There is a way to restrict what performance counters are exposed to
guests, and e.g. I think EC2 used to expose some of these to guests.
Initially temperatures/turbo boost could be measured from guests, but
that got disabled following an XSA:
https://www.brendangregg.com/blog/2014-09-15/the-msrs-of-ec2.html.
Later a restricted set of PMCs got exposed (vpmu=3Dipc, or vpmu=3Darch),
which then got enabled for EC2 guests (don't know whether they still
expose these): https://www.brendangregg.com/blog/2017-05-04/the-pmcs-of-ec2=
.html

If that is enabled, the stacktrace is already suitably restricted to
Dom0-only, so should be safe to use, i.e. even if you can't use
`vpmu=3Don`, you might be able to use `vpmu=3Dipc`.
Currently neither of these is security supported though.

> >     * x86 only

This one should be fixable, all it needs is a way to do a stacktrace,
which should already be present in the arch-specific traps.c (although
AFAICT only X86 and ARM implement stack traces currently), although
that of course assumes that other arches would have a PMU
implementation to begin with.
AFAICT xenpmu_op is only implemented on x86:
```
#ifdef CONFIG_X86
xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
#endif
```

> >     * secureboot needs to be disabled
>

This is because to enable vpmu you need to modify the Xen cmdline, and
that is restricted under secure boot.
If you enable vpmu at build time then it might work, but see above
about no security support.

>  With them it isn't really
> possible to do profiling on production systems, only on dedicated develop=
ment
> boxes.

I'd like to be able to do profiling on production too. But I'm taking
it one step at a time, at least now I'll have a way to do profiling on
development/test boxes.

For production use a different approach might be needed, e.g. LBR, or
a dedicated way to get just a hypervisor stacktrace on a timer,
without involving the (v)PMU at all.
That would require some new integration with `perf` too.

> That works great if you have a dev box and can create a realistic
> workload with non-sensitive data, but less great if you have a problem th=
at
> you can't reproduce on a non-production system.  It's also not usable
> for real-time monitoring of production environments.

Best regards,
--Edwin

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)

