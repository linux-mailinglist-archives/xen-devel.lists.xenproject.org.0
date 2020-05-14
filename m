Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A51D3C26
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 21:13:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZJIg-0005JU-Lb; Thu, 14 May 2020 19:13:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJsg=64=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jZJIf-0005JP-M4
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 19:13:45 +0000
X-Inumbo-ID: 0790bc62-9617-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0790bc62-9617-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 19:13:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so65032wrt.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2020 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4XZZiSfWkihRTv0z6DMjCYuLu6A8CT9yvCzKZwkeGI=;
 b=bX1rOC9u1TxHiQdjYwuUkoSg4/AVt8NU2oAZHS3AcWRcDVox81imOO6bdL2oKBZR8C
 kln3tUddjNF0f2zvNGr8108+dR8s6lc2vi4UUBhZDbiZ9v6c4bQAQnvUUjd1yzHQWFgC
 NW/5iokVf0YWp06miHz8/ZmhgqG6ic8UrxfaIg5wCnEE4tiTcDCxTJOHAHdSkyf0w8HC
 68+PGP4i3hxAuiruw7SgfmBCrZbJajmGTZAhTGKTH70JXGQUmbr8D2Q75df86ARsyIMM
 CFXGA1MaCdi/o09da62+ZdhuJZLG4/VCYQj5zlY/PsPzoRJIPNezmtgfBbkiuF/6xePj
 i7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4XZZiSfWkihRTv0z6DMjCYuLu6A8CT9yvCzKZwkeGI=;
 b=JEb477h4qBzZDWS/nG6Uxrqds+/GpipDbVGjpImgB7l8Qw7jZLW8HPkLaiUlY8bagO
 mLn+rdbQjJXhLbLRLGWGaCDaSns3rnFwWarEyfxG2KTJcUlyA+R7ng1RSWWv+OtI8YHJ
 IU4GO69vD+JoRY1E/IJR+oHwlc/B9QZWyd7q7nyZtWLjUvPC441xcjUw+UAfP6V4rbxD
 bgsn+RblaSQ6HU+BHpgCKCSW1clP6tsECt0danpTxj4EOrUeRjSIoAUNo3MOCxsO4JqQ
 j7qsXQd60fVEGgWzZUEMKLWzktjzKKObiyLaIjb5kd2wDiIoaC902+LFXPZ9kdUDsHJj
 D9Ig==
X-Gm-Message-State: AOAM5309lcxzxmIglWBmwZfbcVYfVI8YU1wMBoov7M+ptkLVCWFBY6c3
 JeGbglVvTuzZ2EL5csS2bp3JvMmwZbjp4l9CbCmwP6E3nIE=
X-Google-Smtp-Source: ABdhPJzb47H4g1vuzB6fsN96p0zIkvOYiiyDjE2xgsSAgY0t+mpPZezGKOnIZCniSUyarSJWtGeOqXdIIFNpl2G9+YM=
X-Received: by 2002:a5d:510f:: with SMTP id s15mr7558281wrt.103.1589483623835; 
 Thu, 14 May 2020 12:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
 <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
In-Reply-To: <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 14 May 2020 20:13:32 +0100
Message-ID: <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
Subject: Re: Error during update_runstate_area with KPTI activated
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 14 May 2020 at 19:12, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 14/05/2020 18:38, Julien Grall wrote:
> > Hi,
> >
> > On 14/05/2020 17:18, Bertrand Marquis wrote:
> >>
> >>
> >>> On 14 May 2020, at 16:57, Julien Grall <julien@xen.org> wrote:
> >>>
> >>>
> >>>
> >>> On 14/05/2020 15:28, Bertrand Marquis wrote:
> >>>> Hi,
> >>>
> >>> Hi,
> >>>
> >>>> When executing linux on arm64 with KPTI activated (in Dom0 or in a
> >>>> DomU), I have a lot of walk page table errors like this:
> >>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
> >>>> 0xffffff837ebe0cd0
> >>>> After implementing a call trace, I found that the problem was
> >>>> coming from the update_runstate_area when linux has KPTI activated.
> >>>> I have the following call trace:
> >>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
> >>>> 0xffffff837ebe0cd0
> >>>> (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
> >>>> (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
> >>>> (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
> >>>> (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
> >>>> (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
> >>>> (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
> >>>> (XEN)    [<0000000000269524>] context_switch+0x58/0x70
> >>>> (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
> >>>> (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
> >>>> (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
> >>>> (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
> >>>> Discussing this subject with Stefano, he pointed me to a discussion
> >>>> started a year ago on this subject here:
> >>>> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html
> >>>>
> >>>> And a patch was submitted:
> >>>> https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html
> >>>>
> >>>> I rebased this patch on current master and it is solving the
> >>>> problem I have seen.
> >>>> It sounds to me like a good solution to introduce a
> >>>> VCPUOP_register_runstate_phys_memory_area to not depend on the area
> >>>> actually being mapped in the guest when a context switch is being
> >>>> done (which is actually the problem happening when a context switch
> >>>> is trigger while a guest is running in EL0).
> >>>> Is there any reason why this was not merged at the end ?
> >>>
> >>> I just skimmed through the thread to remind myself the state.
> >>> AFAICT, this is blocked on the contributor to clarify the intended
> >>> interaction and provide a new version.
> >>
> >> What do you mean here by intended interaction ? How the new hyper
> >> call should be used by the guest OS ?
> >
> > From what I remember, Jan was seeking clarification on whether the two
> > hypercalls (existing and new) can be called together by the same OS
> > (and make sense).
> >
> > There was also the question of the handover between two pieces of
> > sotfware. For instance, what if the firmware is using the existing
> > interface but the OS the new one? Similar question about Kexecing a
> > different kernel.
> >
> > This part is mostly documentation so we can discuss about the approach
> > and review the implementation.
> >
> >>
> >>>
> >>> I am still in favor of the new hypercall (and still in my todo list)
> >>> but I haven't yet found time to revive the series.
> >>>
> >>> Would you be willing to take over the series? I would be happy to
> >>> bring you up to speed and provide review.
> >>
> >> Sure I can take it over.
> >>
> >> I ported it to master version of xen and I tested it on a board.
> >> I still need to do a deep review of the code myself but I have an
> >> understanding of the problem and what is the idea.
> >>
> >> Any help to get on speed would be more then welcome :-)
> > I would recommend to go through the latest version (v3) and the
> > previous (v2). I am also suggesting v2 because I think the split was
> > easier to review/understand.
> >
> > The x86 code is probably what is going to give you the most trouble as
> > there are two ABIs to support (compat and non-compat). If you don't
> > have an x86 setup, I should be able to test it/help write it.
> >
> > Feel free to ask any questions and I will try my best to remember the
> > discussion from last year :).
>
> At risk of being shouted down again, a new hypercall isn't necessarily
> necessary, and there are probably better ways of fixing it.
>
> The underlying ABI problem is that the area is registered by virtual
> address.  The only correct way this should have been done is to register
> by guest physical address, so Xen's updating of the data doesn't
> interact with the guest pagetable settings/restrictions.  x86 suffers
> the same kind of problems as ARM, except we silently squash the fallout.
>
> The logic in Xen is horrible, and I would really rather it was deleted
> completely, rather than to be kept for compatibility.
>
> The runstate area is always fixed kernel memory and doesn't move.  I
> believe it is already restricted from crossing a page boundary, and we
> can calculate the va=>pa translation when the hypercall is made.
>
> Yes - this is a technically ABI change, but nothing is going to break
> (AFAICT) and the cleanup win is large enough to make this a *very*
> attractive option.

I suggested this approach two years ago [1] but you were the one
saying that buffer could cross page-boundary on older Linux [2]:

"I'd love to do this, but we cant.  Older Linux used to have a virtual
buffer spanning a page boundary.  Changing the behaviour under that will
cause older setups to explode."

So can you explain your change of heart here?

>
> I would prefer to fix it like this, (perhaps adding a new hypercall
> which explicitly takes a guest physical address), than to keep any of
> this mess around forever more to cope with legacy guests.

What does legacy guests mean? Is it PV 32-bit or does it also include some HVM?

Cheers,

[1] <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
[2] <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com>

