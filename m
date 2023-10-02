Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6081B7B5111
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 13:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611444.950999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGyl-0004Sx-Bc; Mon, 02 Oct 2023 11:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611444.950999; Mon, 02 Oct 2023 11:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGyl-0004QS-8E; Mon, 02 Oct 2023 11:20:47 +0000
Received: by outflank-mailman (input) for mailman id 611444;
 Mon, 02 Oct 2023 11:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWvZ=FQ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qnGyj-0004QK-JX
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 11:20:45 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b994ac30-6115-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 13:20:43 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c189dabcc3so75744151fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Oct 2023 04:20:43 -0700 (PDT)
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
X-Inumbo-ID: b994ac30-6115-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696245643; x=1696850443; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nb7pXKnAfq4Zi0cVJR6AhJQFddioHrZZX5ql/vD72U=;
        b=NxLmnLKKj/ti5wzyTyNT/5fXfe9n3OUzVegZfcWx8ry7nJYMoAaGuTE3RyW2FjNIDu
         jJGZH98SU71yFmN9mNH6XpI/BzrYkWkR/ezXqGHqvvVWBnHsZpdTusbIzCq0kcxemv2d
         eNCdI2QhrG/i9nDiDLbh2d78X1MOw1GNdSTkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696245643; x=1696850443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nb7pXKnAfq4Zi0cVJR6AhJQFddioHrZZX5ql/vD72U=;
        b=oTZSEL6jz6Rp4HgKQg21JQdphATZmjk5UQI0Im3+q05lrRVs1/mFJJPMRwwMXzD1pH
         7s7q4g0sB36DZN5Qh52zO97gHnL/2t/heuUosSASwZVpSeDqEC/mKmMzayFZQWoB3AEr
         1LIfUeGLeIEHVs1w7wgYg0Ahdz20ikJcATPqNEMkcHYoGpcUl4jRkuU9GWQ2wBq0LarT
         YPKzrQiqg99+4vj4TbLxwOE5SzANsxYpXT9jg6MwT0MLve8GCuHNJtQil+YUjlZhpGNf
         PpoHs3LGE8U2cvlY+H2ZwA45Y1V6+NZ8V2LeOo0AN5tESHRG85T0+sLVWkKI7XWqK7CT
         fhKg==
X-Gm-Message-State: AOJu0Yxi5jMOYh6WpDhB/SUium8VjOVXxAnILemdhktWX9e6pKToRXF/
	nOvhkhbuw6ZvsRrcLc7sahUVmr+T/dVXmE4Dd2oC3g==
X-Google-Smtp-Source: AGHT+IGf/mwMiJ/MJuT8LubdHogEmzRyID+lAoQ+mXHCRoh8gin5bJrFWEkeSqkaHfVyLjLCqYBLAiGPvm9LgEobpeg=
X-Received: by 2002:a2e:8ecb:0:b0:2c1:6ede:de20 with SMTP id
 e11-20020a2e8ecb000000b002c16edede20mr8824000ljl.6.1696245642555; Mon, 02 Oct
 2023 04:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <ZRivEkG8Ox213H2A@itl-email>
In-Reply-To: <ZRivEkG8Ox213H2A@itl-email>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 2 Oct 2023 12:20:31 +0100
Message-ID: <CA+zSX=Zy0C_XMmMUxxk5TF88L0cXwFHihQdYDxaY+tMuTm3GQQ@mail.gmail.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 1, 2023 at 12:28=E2=80=AFAM Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Fri, Sep 29, 2023 at 05:42:16PM +0100, George Dunlap wrote:
> > The basic credit2 algorithm goes something like this:
> >
> > 1. All vcpus start with the same number of credits; about 10ms worth
> > if everyone has the same weight
>
> > 2. vcpus burn credits as they consume cpu, based on the relative
> > weights: higher weights burn slower, lower weights burn faster
> >
> > 3. At any given point in time, the runnable vcpu with the highest
> > credit is allowed to run
> >
> > 4. When the "next runnable vcpu" on a runqueue is negative, credit is
> > reset: everyone gets another 10ms, and can carry over at most 2ms of
> > credit over the reset.
>
> One relevant aspect of Qubes OS is that it is very very heavily
> oversubscribed: having more VMs running than physical CPUs is (at least
> in my usage) not uncommon, and each of those VMs will typically have at
> least two vCPUs.  With a credit of 10ms and 36 vCPUs, I could easily see
> a vCPU not being allowed to execute for 200ms or more.  For audio or
> video, workloads, this is a disaster.
>
> 10ms is a LOT for desktop workloads or for anyone who cares about
> latency.  At 60Hz it is 3/5 of a frame, and with a 120Hz monitor and a
> heavily contended system frame drops are guaranteed.

You'd probably benefit from understanding better how the various
algorithms actually work.  I'm sorry I don't have any really good
"virtualization scheduling for dummies" resources; the best I have is
a few talks I gave on the subject; e.g.:

https://www.youtube.com/watch?v=3DC3jjvkr6fgQ

For one, when I say "oversubscribed", I don't mean "vcpus / pcpus"; I
mean "requested vcpu execution time / vcpus".  If you have 18 vcpus on
a single pcpu, and all of them *on an empty system* would have run at
5%, you're totally fine.  If you have 18 vcpus on a single pcpu, and
all of them on an empty system would have averaged 100%, there's only
so much the scheduler can do to avoid problems.

Secondly, while on credit1 a vcpu is allowed to run for 10ms without
stopping (and then must wait for 18x that time to get the same credit
back, if there are 18 other vcpus running on that same pcpu), this is
not the case for credit2.  The exact calculation can be found in
xen/common/sched/credit2.c:sched2_runtime(), but generally here's the
general algorithm from the comment:

/* General algorithm:
 * 1) Run until snext's credit will be 0.
 * 2) But if someone is waiting, run until snext's credit is equal
 *    to his.
 * 3) But, if we are capped, never run more than our budget.
 * 4) And never run longer than MAX_TIMER or shorter than MIN_TIMER or
 *    the ratelimit time.
 */

Default MIN_TIMER is 500us, and is configurable via sysctl; default
MAX_TIMER is... hmm, I'm pretty sure this started out as 2ms, but now
it seems to be 10ms.  Looks like this was changed in da92ec5bd1 ("xen:
credit2: "relax" CSCHED2_MAX_TIMER") in 2016.  (MAX_TIMER isn't
configurable, but arguably it should be; and making it configurable
should just be a matter of duplicating the logic around MIN_TIMER.)

That's not yet the last word though: If a VM that was a sleep wakes
up, and it has credit than the running vcpu, then it will generally
preempt that cpu.

All that to say, that it should be very rare for a cpu to run for a
full 10ms under credit2.

> > Other ways we could consider putting a vcpu into a boosted state (some
> > discussed on Matrix or emails linked from Matrix):
> > * Xen is about to preempt, but finds that the vcpu interrupts are
> > blocked (this sort of overlaps with the "when we deliver an interrupt"
> > one)
>
> This is also a good heuristic for "vCPU owns a spinlock", which is
> definitely a bad time to preempt.

Not all spinlocks disable IRQs, but certainly some do.

> > Getting the defaults right might take some thinking.  If you set the
> > default "boost credit ratio" to 25% and the "default boost interval"
> > to 500ms, then you'd basically have five "boosts" per scheduling
> > window.  The window depends on how active other vcpus are, but if it's
> > longer than 20ms your system is too overloaded.
>
> An interval of 500ms seems rather long to me.  Did you mean 500=CE=BCs?

Yes, I did mean 500us, sorry.

I'll respond to the other suggestions later.

> > Demi, what kinds of interrupt counts are you getting for your VM?
>
> I didn't measure it, but I can check the next time I am on a video call
> or doing audio recoring.

Running xentrace would be really interesting too; those are another
good way to nerd-snipe me. :-)

 -George

