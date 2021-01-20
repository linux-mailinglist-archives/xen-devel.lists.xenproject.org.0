Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2552FDA8B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 21:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71748.128739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jr5-0004Np-6q; Wed, 20 Jan 2021 20:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71748.128739; Wed, 20 Jan 2021 20:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jr5-0004NT-31; Wed, 20 Jan 2021 20:13:27 +0000
Received: by outflank-mailman (input) for mailman id 71748;
 Wed, 20 Jan 2021 20:13:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rQJv=GX=todobom.com=claudemir@srs-us1.protection.inumbo.net>)
 id 1l2Jr3-0004NO-Id
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 20:13:25 +0000
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 596c6892-133f-46a7-b330-3f5f5c17acb6;
 Wed, 20 Jan 2021 20:13:23 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id c7so26628318qke.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 12:13:23 -0800 (PST)
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
X-Inumbo-ID: 596c6892-133f-46a7-b330-3f5f5c17acb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=todobom-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MbUkYxr2YIuu1ZTzfRjvtUF6TBLIQ4IID+o1pqQnrNI=;
        b=jSM0EzzChKTQOJPjV6tnqbS+10mA71iZ7NPKFW/VoJKcvKNZ3BSkSA2XUY+vhZDBYd
         TW319vamWg4G57smrxNIj26HzIFdvfceAneiHn7C0s80sVBQcPcTt/8YPw2PTU8A6CqR
         GQbZQmAeAoBJwBAAvsC/Y9BwMDUTBSPHlIPhmohY9iQd25HONjuwwuqWw6M7mmgB6/72
         7DVJF+QA6F6ZcG5HZD0lZrxtuN3leqmoH02TEnrY2zCIGU/OWPLxolqkEzbg1ch+luZZ
         O83MbJb24Rr770jgBY1Irmm2PieZL61LpnPUNrxp67zgR+dDLiX9pyf1t9ro/3MHug+O
         SBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MbUkYxr2YIuu1ZTzfRjvtUF6TBLIQ4IID+o1pqQnrNI=;
        b=SUOsZ1tmuzExRBeG/DNpnU5jKZTm53DHOa0kuuk7AfuXH7i9qJtSerXQI/tVX+hJQQ
         4E+3OJhAOt73KGdeXi3KjgDFIGc0nP+pZvLInjrJy6gQaSgxMP8VcuddEDB8z4VMziXG
         G5Y1tSyvSOWJ+yn4rDhcPlHetOOKY9GfzggLmWb20Jwccyl8vIrnBdFF+s6DIBdv55a7
         5+uoC9djS55MtYy+xmc6CXWtT6UpJ0JVgfWJbJeSUsz+VDBGUNCt9Y1BhrAwXiudE+8d
         DuQaDg7muym8G7Nnl/9OeaFSsPQW+pC4SSTtb1vT1psvNrSviIA2ZBJVO0Cmj1M+gCU/
         HBzw==
X-Gm-Message-State: AOAM5310vB1k5Jg9ZtmxKxRdPp7weqswRM0KwwlRGTOBZD06wzCq9/hp
	S7LRoX//V97C6PGuER8uf/164aLVNN5tli+0qBnq/A==
X-Google-Smtp-Source: ABdhPJwSks2i/zblEpFWqY7Btbn1SxjFFt8TbMUbJh7oHJ3zc4h6nz6cwLTxfuDBwL7SgZx8PvmCQHtgNT7rJ3NOn2Q=
X-Received: by 2002:a37:8dc7:: with SMTP id p190mr11128163qkd.308.1611173603104;
 Wed, 20 Jan 2021 12:13:23 -0800 (PST)
MIME-Version: 1.0
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com> <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com> <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
In-Reply-To: <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
From: Claudemir Todo Bom <claudemir@todobom.com>
Date: Wed, 20 Jan 2021 17:13:11 -0300
Message-ID: <CANyqHYcUSoTRZ1XW9uSNFRzvzoXEkuchmjGdnAneGkr5=dU98g@mail.gmail.com>
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 20 de jan. de 2021 =C3=A0s 12:13, J=C3=BCrgen Gro=C3=9F <jgross@su=
se.com> escreveu:
>
> On 20.01.21 09:50, Jan Beulich wrote:
> > On 19.01.2021 20:36, Claudemir Todo Bom wrote:
> >> I do not have serial output on this setup, so I recorded a video with
> >> boot_delay=3D50 in order to be able to get all the kernel messages:
> >> https://youtu.be/y95h6vqoF7Y
> >
> > This doesn't show any badness afaics.
> >
> >> This is running 4.14 from debian bullseye (testing).
> >>
> >> I'm also attaching the dmesg output when booting xen 4.8 with  the sam=
e
> >> kernel version and same parameters.
> >>
> >> I visually compared all the messages, and the only thing I noticed was=
 that
> >> 4.14 used tsc as clocksource and 4.8 used xen. I tried to boot the ker=
nel
> >> with "clocksource=3Dxen" and the problem is happening with that also.
> >
> > There's some confusion here I suppose: The clock source you talk
> > about is the kernel's, not Xen's. I didn't think this would
> > change for the same kernel version with different Xen underneath,
> > but the Linux maintainers of the Xen code there may know better.
> > Cc-ing them.
>
> This might depend on CPUID bits given to dom0 by Xen, e.g. regarding
> TSC stability.

Will ignore this for now, I suppose it is not the cause of the problem.

> >> The "start" of the problem is that when the kernel gets to the "Freein=
g
> >> unused kernel image (initmem) memory: 2380K" it hangs and stays there =
for a
> >> while. After a few minutes it shows that a process (swapper) is blocke=
d for
> >> sometime (image attached)
> >
> > Now that's pretty unusual - the call trace seen in the screen
> > shot you had attached indicates the kernel didn't even make it
> > past its own initialization just yet. Just to have explored that
> > possibility - could you enable Xen's NMI watchdog (simply
> > "watchdog" on the Xen command line)? Among the boot messages
> > there ought to be one indicating whether it actually works on
> > your system. Without a serial console you wouldn't see anything
> > if it triggers, but the system would then never make it to the
> > kernel side issue.

"watchdog" parameter changed nothing.

> > As far as making sure we at least see all kernel messages -
> > are you having "ignore_loglevel" in place? I don't think I've
> > been able to spot the kernel command line anywhere in the video.

I was using loglevel=3D7, since it is the maximum level according to
documentation, should be the same, but tested with "ignore_loglevel"
and it looks pretty similar.

> > I'm afraid there's no real way around seeing the full Xen
> > messages, i.e. including possible ones while Dom0 already boots
> > (and allowing some debug keys to be issued, as the rcu_barrier
> > on the stack may suggest there's an issue with one of the
> > secondary CPUs). You could try whether "vag=3Dkeep" on the Xen
> > command line allows you to see more, but this option may have
> > quite severe an effect on the timing of Dom0's booting, which
> > may make an already bad situation worse.

already used "vga=3Dkeep", no new information. Will try to enable a
serial output in order to debug more. Is there any parameters I could
give to Xen in order to it write more information on serial line while
the dom0 is booting on the screen?

> > Alternatively the kernel may need instrumenting to figure what
> > exactly it is that prevent forward progress.
> >
> > There's one other wild guess you may want to try: "cpuidle=3Dno"
> > on the Xen command line.
> Other wild guesses are:
>
> - add "sched=3Dcredit" to the Xen command line
>
> or
>
> - add "xen.fifo_events=3D0" to the dom0 command line

all 3 suggestions changed nothing.

I noticed that Debian have a lot of distribution managed patches, so I
think that if I want to find exactly where after 4.8.5 the problem
started I will need to build Xen from sources ignoring debian helpers.

Best regards,
Claudemir

