Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B268362AC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669798.1042237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRssn-0005Es-PH; Mon, 22 Jan 2024 11:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669798.1042237; Mon, 22 Jan 2024 11:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRssn-0005Ch-Lo; Mon, 22 Jan 2024 11:54:29 +0000
Received: by outflank-mailman (input) for mailman id 669798;
 Mon, 22 Jan 2024 11:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBCN=JA=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rRssm-0005CZ-BQ
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:54:28 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9ded43-b91c-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 12:54:26 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50eabbc3dccso3642465e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 03:54:26 -0800 (PST)
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
X-Inumbo-ID: fd9ded43-b91c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705924465; x=1706529265; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hMDRr2Gj7AMdRs8MzyjaSCR8MRVLQkYK9KTkDbIHE4=;
        b=cIrVj30i/0SYaRMns9MYGY7Sj1Z54PT5eN9FQj8p9pZe8rlXKpc0+9gLfDbhA1qun/
         H8m4P98ude55I/j2S/LsfZMJSn9MLkw17TKmW79K1Le0ApbGhvM0HLhWyEGflsScq5lY
         nCQSz/4DOqv6IZx3lQUKAlj0usN1dMbWrqwwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924465; x=1706529265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hMDRr2Gj7AMdRs8MzyjaSCR8MRVLQkYK9KTkDbIHE4=;
        b=T3M3MjzAC20Tgpbo0pxEZN8jRxVCcjmRfy7SCV69BwDYwnwljkI5XpgH9WVTs+3Thc
         +yBg+sJesofk22QvY7BKyPA4N/8pZOINlibgkkmy7blcWTYvmwFtcnrtFzD852X+DDN2
         rUhc8d8KgxtVFVmeadw6UMSnKDgLlTvwJbXL9/n+09wFP4R9VxPpH8K8BI0dZ/Fg3vTy
         Qpo7+5wvksbg8Wke8hUiXCVUyaRFERZ4y768nrfcfxmyW27ofk0kUnsaILSfdSPwBMzn
         3j7dV4QZY4SpGY4bwL+biEV8e7CQcm/HMCKzXUn1DbEK0Ga1xrTOeCvXUHb60ZQ0yXrT
         UhbQ==
X-Gm-Message-State: AOJu0YweYVY5bynbhBYURiv6ZFzVVBqzIkMUDq+k7ScSRbOGMpe9dnwP
	S5VNFcYDk4QJOZPjYbFgqXCkgnX2WelidnCa3QN7GodFFEiNjyjnfiGnK5VfWVcw7BYverAeiz2
	tce1rRx9zGRgydF/UIafKzIAAPodJr+I2fczu9w==
X-Google-Smtp-Source: AGHT+IENROnMDG5gGWNI4BJS7D1AJwHTve1JKYC3SB1tIa2FR/qeVMK05cp6xkqNXYYSKrIYlSJaxSlJ5J/j+e8GQGU=
X-Received: by 2002:a05:6512:38ac:b0:50e:7e93:4d38 with SMTP id
 o12-20020a05651238ac00b0050e7e934d38mr601415lft.112.1705924465505; Mon, 22
 Jan 2024 03:54:25 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <Za23cKyEOl1WTvhZ@itl-email>
In-Reply-To: <Za23cKyEOl1WTvhZ@itl-email>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 22 Jan 2024 11:54:14 +0000
Message-ID: <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:31=E2=80=AFAM Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Fri, Sep 29, 2023 at 05:42:16PM +0100, George Dunlap wrote:
> > The basic credit2 algorithm goes something like this:
> >
> > 1. All vcpus start with the same number of credits; about 10ms worth
> > if everyone has the same weight
> >
> > 2. vcpus burn credits as they consume cpu, based on the relative
> > weights: higher weights burn slower, lower weights burn faster
> >
> > 3. At any given point in time, the runnable vcpu with the highest
> > credit is allowed to run
> >
> > 4. When the "next runnable vcpu" on a runqueue is negative, credit is
> > reset: everyone gets another 10ms, and can carry over at most 2ms of
> > credit over the reset.
> >
> > Generally speaking, vcpus that use less than their quota and have lots
> > of interrupts are scheduled immediately, since when they wake up they
> > always have more credit than the vcpus who are burning through their
> > slices.
> >
> > But what about a situation as described recently on Matrix, where a VM
> > uses a non-negligible amount of cpu doing un-accelerated encryption
> > and decryption, which can be delayed by a few MS, as well as handling
> > audio events?  How can we make sure that:
> >
> > 1. We can run whenever interrupts happen
> > 2. We get no more than our fair share of the cpu?
> >
> > The counter-intuitive key here is that in order to achieve the above,
> > you need to *deschedule or preempt early*, so that when the interrupt
> > comes, you have spare credit to run the interrupt handler.  How do we
> > manage that?
> >
> > The idea I'm working out comes from a phrase I used in the Matrix
> > discussion, about a vcpu that "foolishly burned all its credits".
> > Naturally the thing you want to do to have credits available is to
> > save them up.
> >
> > So the idea would be this.  Each vcpu would have a "boost credit
> > ratio" and a "default boost interval"; there would be sensible
> > defaults based on typical workloads, but these could be tweaked for
> > individual VMs.
> >
> > When credit is assigned, all VMs would get the same amount of credit,
> > but divided into two "buckets", according to the boost credit ratio.
> >
> > Under certain conditions, a vcpu would be considered "boosted"; this
> > state would last either until the default boost interval, or until
> > some other event (such as a de-boost yield).
> >
> > The queue would be sorted thus:
> >
> > * Boosted vcpus, by boost credit available
> > * Non-boosted vcpus, by non-boost credit available
> >
> > Getting more boost credit means having lower priority when not
> > boosted; and burning through your boost credit means not being
> > scheduled when you need to be.
> >
> > Other ways we could consider putting a vcpu into a boosted state (some
> > discussed on Matrix or emails linked from Matrix):
> > * Xen is about to preempt, but finds that the vcpu interrupts are
> > blocked (this sort of overlaps with the "when we deliver an interrupt"
> > one)
> > * Xen is about to preempt, but finds that the (currently out-of-tree)
> > "dont_desched" bit has been set in the shared memory area
>
> I think both of these would be good.  Another one would be when Xen is
> about to deliver an interrupt to a guest, provided that there is no
> storm of interrupts.  I=E2=80=99ve seen a USB webcam cause a system-wide =
latency
> spike through what I presume is an interrupt storm, and I suspect that
> others have observed similar behavior with USB external drives.

How would you determine that a given interrupt was part of a "storm",
and what would you do differently as a result of determining that?

> > Other ways to consider de-boosting:
> > * There's a way to trigger a VMEXIT when interrupts have been
> > re-enabled; setting this up when the VM is in the boost state
>
> That=E2=80=99s a good idea, but should be conditional on =E2=80=9Cdont_de=
sched=E2=80=9D _not_
> being set.  This handles the case where the guest is running a realtime
> thread.

In which case we need some way for the "enlightened" guest to know how
to de-boost itself; a yield might do.

> Generally, I=E2=80=99d like to see something like this:
>
> - A vCPU with sufficient boost credit is boosted by Xen under the
>   following conditions:
>
>   1. Xen interrupts the guest.

I take it you mean, "delivers an interrupt to the guest"?


>   2. Xen is about to preempt, but detects that =E2=80=9Cdont_desched=E2=
=80=9D is set.
>   3. Xen is about to preempt, but detects that interrupts are disabled.
>
> - A vCPU is deboosted if:
>
>   1. It runs out of boost credit, even if =E2=80=9Cdont_desched=E2=80=9D =
is set.
>   2. An interrupt handler returns, but only if =E2=80=9Cdont_desched=E2=
=80=9D is not set.
>   3. Interrupts are re-enabled, but only if =E2=80=9Cdont_desched=E2=80=
=9D is not set.
>
>   The first case is an abnormal condition and typically means that
>   either the system is overloaded or a vCPU is running boosted for too
>   long.  To help debug this situation, Xen will log a warning and
>   increment both a system-wide and a per-domain counter.  dom0 can
>   retrieve counters for any domain, and a domain can read its own
>   counter.
>
> - When to set =E2=80=9Cdont_desched=E2=80=9D is entirely up to the guest =
kernel, but
>   there are some general rules guests should follow:
>
>   - Only set =E2=80=9Cdont_desched=E2=80=9D if there is a good reason, an=
d unset it as
>     soon as possible.  Xen gives vCPUs with =E2=80=9Cdont_desched=E2=80=
=9D set priority
>     over all other vCPUs on the system, but the amount of time a vCPU is
>     allowed to run with an elevated priority is limited.  Xen will log a
>     warning if a guest tries to run with elevated priority for too long.
>
>   - Xen boosts vCPUs before delivering an interrupt, but there should be
>     a way for a vCPU to deboost itself even before returning from the
>     interrupt handler.
>
>   - Guests should always set =E2=80=9Cdont_desched=E2=80=9D when running =
hard-realtime
>     threads (used for e.g. audio processing), even when the thread is in
>     userspace.  This ensures that Xen gives the underlying vCPU priority
>     over vCPUs
>
>   - Guests should always set =E2=80=9Cdont_desched=E2=80=9D when holding =
a spin lock,
>     but it is even better to use paravirtualized spin locks (which make
>     a hypercall into Xen and therefore allow other vCPUs to run).
>
>   - Xen does not implement priority inheritance, so guests need to do
>     that.
>
> - Max boost credits can be set by dom0 via a hypercall.
>
> The advantage of this approach is that it keeps almost all policy out of
> Xen.  The only exception is the boosting when an interrupt is received,
> but a well-behaved guest will deboost itself very quickly (by enabling
> interrupts) if the boost was not actually needed, so this should have
> very limited impact.  I think this should be enough for realtime audio,
> and it is somewhat related to (but hopefully simpler than) the KVM RFC
> from Google [1].
>
> Any thoughts on this?

Overall sounds good.  I think a good approach would be to start by
implementing it without the "dont_desched" flag, and then add that on
top later.  It sounds like you have a clear vision for what you want,
so it shouldn't be too hard to write such that adding the
"dont_desched" doesn't require a lot of pointless refactoring.

The other issue I have with this (and essentially where I got stuck
developing credit2 in the first place) is testing: how do you ensure
that it has the properties that you expect?  How do you develop a
"regression test" to make sure that server-based workloads don't have
issues in this sort of case?

 -George

