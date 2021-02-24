Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B603246E3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 23:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89524.168679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF2h3-0007zR-NX; Wed, 24 Feb 2021 22:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89524.168679; Wed, 24 Feb 2021 22:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF2h3-0007z4-K0; Wed, 24 Feb 2021 22:31:41 +0000
Received: by outflank-mailman (input) for mailman id 89524;
 Wed, 24 Feb 2021 22:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=icB/=H2=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1lF2h1-0007yx-R6
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 22:31:39 +0000
Received: from mail-ej1-x62e.google.com (unknown [2a00:1450:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d2da650-9233-4ec8-8fa9-33c6eb1148d7;
 Wed, 24 Feb 2021 22:31:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r17so5579689ejy.13
 for <xen-devel@lists.xenproject.org>; Wed, 24 Feb 2021 14:31:38 -0800 (PST)
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
X-Inumbo-ID: 6d2da650-9233-4ec8-8fa9-33c6eb1148d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1N+NfVeW0w/E2tmCkNoCPMbM+AAGCUx8W2J3DLeqO8A=;
        b=JtLQ0t0TOgEU6tD1Nhj43sO7Wlh75TJOa4cEGngj7ycrQKQKv+yF/rle2e9mzTreVT
         SyjSyDjDY+dYKB+CrN3U/2er0oTroOxhUph9XeLQ7lsf7Q0NyikTCxQhce9jX3qZM42P
         n7Zz3JN+srPVB2C6Oe4UwJuytN+e42dyddlyIN2z9OhxKVPtof7anFsb9RMkfqm6ITMC
         /fm4nSVXgzan0iik84DlvBOq7QzEwMp4qCRsKPo8nQJEVltBVFwtkS/qR1XCiUMFOYAi
         f1d81UlcDttmTqUgWcwz1SNesuuQA/aSCHK2JgCfR3AwlWXRvWLx2h+x/v4xH/dq4aZO
         sFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1N+NfVeW0w/E2tmCkNoCPMbM+AAGCUx8W2J3DLeqO8A=;
        b=KYlpJ5S7Jq0dQ9cejeVkIxaXhe0gPurY2k1jfl8CAiTaZpToh0yARz05qtujqWvqCg
         LA3U5H+kNxQAXzXoS1IimO4GOTt9KgAaSRwbgLFo4FEBsMRvdYTfrUQrtN/Dkt0JcVAh
         HbnZ6ihFbj9H2/9DIG94m769vywUo5/LBakyEGbU/86C1/BraLPqdqibd2d1c0Eq+Cz+
         kF9BcuYXk9DUJwgqICprksHjMahHHhuiqCLZo4vNWx46XTvUDpK6YeNqHPmegkUICMLp
         TujyuK0K+3OLwx/7kT9ZHNdJ2/rfhJf/1v+LVr3uDVNoy4RJDJYApsea+nKmTgoSJmUd
         S/Mw==
X-Gm-Message-State: AOAM5333/NAFKknEqtLFSAavRyHodIH0bw61DTu4h3JKet4koxI9joW1
	mMwE6e2jsy8y87c0QVdsujlu6RC70KBH+apQBjU=
X-Google-Smtp-Source: ABdhPJw4OhlXWUwqBA0MeBP/F3FT8oZjDTvZaS0O+o9T0MIGdgf3ktQ+VXDcBbpwDBaiHn/KOSC2YC3Egp0TISruCxI=
X-Received: by 2002:a17:906:a101:: with SMTP id t1mr31081517ejy.182.1614205897384;
 Wed, 24 Feb 2021 14:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org> <87zgzv56pm.fsf@epam.com>
 <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org> <87o8g99oal.fsf@epam.com>
In-Reply-To: <87o8g99oal.fsf@epam.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 24 Feb 2021 22:31:26 +0000
Message-ID: <CAJ=z9a0v37rc_B7xVdQECAYd52PJ0UajGzvX1DYP56Q2RXQ2Tw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Meng Xu <mengxu@cis.upenn.edu>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Feb 2021 at 20:58, Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Julien,
>
> Julien Grall writes:
>
> > On 23/02/2021 12:06, Volodymyr Babchuk wrote:
> >> Hi Julien,
> >
> > Hi Volodymyr,
> >
> >> Julien Grall writes:
> >>> On 23/02/2021 02:34, Volodymyr Babchuk wrote:
> >>> ... just rescheduling the vCPU. It will also give the opportunity for
> >>> the guest to handle interrupts.
> >>>
> >>> If you don't return to the guest, then risk to get an RCU sched stall
> >>> on that the vCPU (some hypercalls can take really really long).
> >> Ah yes, you are right. I'd only wish that hypervisor saved context
> >> of
> >> hypercall on it's side...
> >> I have example of OP-TEE before my eyes. They have special return
> >> code
> >> "task was interrupted" and they use separate call "continue execution of
> >> interrupted task", which takes opaque context handle as a
> >> parameter. With this approach state of interrupted call never leaks to > rest of the system.
> >
> > Feel free to suggest a new approach for the hypercals.
> >
>
> I believe, I suggested it right above. There are some corner cases, that
> should be addressed, of course.

If we wanted a clean break, then possibly yes.  But I meant one that doesn't
break all the existing users and doesn't put Xen at risk.

I don't believe your approach fulfill it.

>
> >>>
> >>>> This approach itself have obvious
> >>>> problems: code that executes hypercall is responsible for preemption,
> >>>> preemption checks are infrequent (because they are costly by
> >>>> themselves), hypercall execution state is stored in guest-controlled
> >>>> area, we rely on guest's good will to continue the hypercall.
> >>>
> >>> Why is it a problem to rely on guest's good will? The hypercalls
> >>> should be preempted at a boundary that is safe to continue.
> >> Yes, and it imposes restrictions on how to write hypercall
> >> handler.
> >> In other words, there are much more places in hypercall handler code
> >> where it can be preempted than where hypercall continuation can be
> >> used. For example, you can preempt hypercall that holds a mutex, but of
> >> course you can't create an continuation point in such place.
> >
> > I disagree, you can create continuation point in such place. Although
> > it will be more complex because you have to make sure you break the
> > work in a restartable place.
>
> Maybe there is some misunderstanding. You can't create hypercall
> continuation point in a place where you are holding mutex. Because,
> there is absolutely not guarantee that guest will restart the
> hypercall.

I don't think we are disagreeing here. My point is you should rarely
need to hold a mutex for a long period, so you could break your work
in smaller chunk. In which cases, you can use hypercall continuation.

>
> But you can preempt vCPU while holding mutex, because xen owns scheduler
> and it can guarantee that vCPU will be scheduled eventually to continue
> the work and release mutex.

The problem is the "eventually". If you are accounting the time spent
in the hypervisor to the vCPU A, then there is a possibility that it
has exhausted its time slice. In which case, your vCPU A may be
sleeping for a while with a mutex held.

If another vCPU B needs the mutex, it will either have to wait
potentially for a long time or we need to force vCPU A to run on
borrowed time.

>
> > I would also like to point out that preemption also have some drawbacks.
> > With RT in mind, you have to deal with priority inversion (e.g. a
> > lower priority vCPU held a mutex that is required by an higher
> > priority).
>
> Of course. This is not as simple as "just call scheduler when we want
> to".

Your e-mail made it sounds like it was easy to add preemption in Xen. ;)

>
> > Outside of RT, you have to be careful where mutex are held. In your
> > earlier answer, you suggested to held mutex for the memory
> > allocation. If you do that, then it means a domain A can block
> > allocation for domain B as it helds the mutex.
>
> As long as we do not exit to a EL1 with mutex being held, domain A can't
> block anything. Of course, we have to deal with priority inversion, but
> malicious domain can't cause DoS.

It is not really a priority inversion problem outside of RT because
all the tasks will have the same priority. It is more a time
accounting problem because each vCPU may have a different number of
credits.

> >>> I am really surprised that this is the only changes necessary in
> >>> Xen. For a first approach, we may want to be conservative when the
> >>> preemption is happening as I am not convinced that all the places are
> >>> safe to preempt.
> >>>
> >> Well, I can't say that I ran extensive tests, but I played with this
> >> for
> >> some time and it seemed quite stable. Of course, I had some problems
> >> with RTDS...
> >> As I see it, Xen is already supports SMP, so all places where races
> >> are
> >> possible should already be covered by spinlocks or taken into account by
> >> some other means.
> > That's correct for shared resources. I am more worried for any
> > hypercalls that expected to run more or less continuously (e.g not
> > taking into account interrupt) on the same pCPU.
>
> Are there many such hypercalls? They can disable preemption if they
> really need to run on the same pCPU. As I understand, they should be
> relatively fast, because they can't create continuations anyway.

Well, I never tried to make Xen preemptible... My comment is based on
the fact that the use preempt_{enable, disable}() was mostly done on a
best effort basis.

The usual suspects are anything using this_cpu() or interacting with
the per-CPU HW registers.

From a quick look here a few things (only looked at Arm):
  * map_domain_page() in particular on arm32 because this is using
per-CPU page-tables
  * guest_atomics_* as this uses this_cpu()
  * virt_to_mfn() in particular the failure path
  * Incorrect use (or missing) rcu locking. (Hopefully Juergen's
recent work in the RCU mitigate the risk)

I can provide guidance, but you will have to go through the code and
check what's happening.

Cheers,

