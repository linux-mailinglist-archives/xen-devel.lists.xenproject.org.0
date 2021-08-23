Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796F3F4FEF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170562.311387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIE8B-0002Ua-8l; Mon, 23 Aug 2021 17:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170562.311387; Mon, 23 Aug 2021 17:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIE8B-0002S6-5U; Mon, 23 Aug 2021 17:53:07 +0000
Received: by outflank-mailman (input) for mailman id 170562;
 Mon, 23 Aug 2021 17:53:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Yzi=NO=gmail.com=scottwd@srs-us1.protection.inumbo.net>)
 id 1mIE8A-0002S0-7d
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:53:06 +0000
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69215f32-e037-488b-8a4f-c296706e673e;
 Mon, 23 Aug 2021 17:53:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id cn28so27442717edb.6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Aug 2021 10:53:04 -0700 (PDT)
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
X-Inumbo-ID: 69215f32-e037-488b-8a4f-c296706e673e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZvMwkb+36TfrfpAI3Yg8Ts4UzSPrqDR905z3KcDc3ak=;
        b=ZtJ9TllUHdX7z2LHmldUj3zro8VFUh1BBYNeR66x6lYx/ckPMYTfX04b5BMqFmN+Id
         bJTB4idCFj54jqqMOKgJgMBASBe1iVu3HDEPFU1y0ZZeeaE467utbKrwEnoLHm99dH/w
         swPm+MmaoD+IgwPOnFsVnTxlBaqvTaVB4872YwJYQlWfsLxX6ciE9CXWUcca1UCoGiwg
         m4qsxbTxESc+2HzlvajCRoR5DBES2nE9Ek4VxXNueVTe4cLFu/I+mwepB5wqnctP9nz8
         PCDHrskF2QkQvGjE63SFtZCvaxG7xo33N5xNpxGHKyGcxkWhdTFOmWEJuJvzEVpD2Ha/
         V0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZvMwkb+36TfrfpAI3Yg8Ts4UzSPrqDR905z3KcDc3ak=;
        b=iZMskkVcdEg9wb/p+p8v4qIkfIGm+UbaqBZPjlob7LyNQOkvYK+TMjQfizkAeT/DR9
         ItI65nv7ZvOp/Pl5reiCf5qUTnra3E0gNQmiWOpMtl5l75+f3AZlJfKVjasnfX18Xx0u
         5wcMSs619JSgXSrT2iERNSP6PhZ3+6AMJw3q1kAz6h6cRy9UuhOczes2aEpAQvV072CZ
         VDCZTWjAqHZRRiHuoHohdjPHAXZCzPIABWWlqkKXKodph4vgkqGTllpB9WW6JIEw9NBg
         SKKw5PFCrUTwBA8OpIErj8KKvT7Ji8pgD0phlRt4rDD2qCoOUs0UqLsoDdWzijtHG9YS
         q0Lw==
X-Gm-Message-State: AOAM532baxzWEAAVv+uNhKcX6w6ltCDBQ1m8uznRwwFMockB6SH5d5Hw
	tl3eyj6mjfF6i7yj9+QdE4GD3NwJNpI1M54puD0=
X-Google-Smtp-Source: ABdhPJwxhbt6fQnLXCdSRjM4WDL6Rq4VJmBX7RZ80erJ9Erc21mo5voBJPcysx2x0EMpZJv4YFgfdcn79VwxXUm0BsM=
X-Received: by 2002:a05:6402:205:: with SMTP id t5mr14694441edv.81.1629741183542;
 Mon, 23 Aug 2021 10:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <edb72ed62c7c1154d5ed282e57e1750b6d79fa15.1627672412.git.scott.davis@starlab.io>
 <CAKf6xpuAzbz-PP-k3oNGo-3_iXWhjBF=nm4zdDb16UqB8ov_Og@mail.gmail.com>
In-Reply-To: <CAKf6xpuAzbz-PP-k3oNGo-3_iXWhjBF=nm4zdDb16UqB8ov_Og@mail.gmail.com>
From: Scott Davis <scottwd@gmail.com>
Date: Mon, 23 Aug 2021 13:52:52 -0400
Message-ID: <CAHi-UFLV0fGgBZLGzvs_PtPcYRanGiCQRZpYhGP=nZz22V1BDA@mail.gmail.com>
Subject: Re: [PATCH v2] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

Thanks for the review, Jason!

On Tue, Aug 17, 2021 at 9:15 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>> The implementation mirrors that of the 'seclabel' and 'init_seclabel'
>> options for user domains. When all used in concert, this enables the
>
> Drop all -> "When used in concert"?

Ack for v3.

>> - changed all security label lookup failures due to FLASK being disabled
>>   from warnings to hard errors based on mailing list discussion
>
> I think this should be a separate patch before this one, since it is
> distinct from adding device_model_stubdomain_init_seclabel.

Ack for v3.

>> - added discussion of relabel point to commit message
>
> I was hoping for more people's thoughts on this. I'm just going to
> write down my thoughts on this to get them out there.
>
> The non-stubdom case is very straightforward:
> <-init-><-relabel-><-unpause-><-exec->
>
> Relabeling before unpause is a nice delineation point. Since the
> guest hasn't run, it can't be mid-operation when the relabel happens.
>
> The stubdom case as implemented by the patch is this:
> Guest:
> <---------init------------->|<-relabel-><-unpause-><-exec->
> Stubdom:                    |
> <-init--><-unpause-><-exec->|<-relabel-><-exec->
>
> Here the stubdom runs for some time and then gets relabeled.
>
> The alternative would be to relabel the stubdom before unpause and
> then relabel the guest:
> Guest:
> <----------init---------------------->|<-relabel-><-unpause-><-exec->
> Stubdom:                              |
> <-init-><-relabel-><-unpause-><-exec--|--exec->
>
> Here relabel then unpause is maintained for both guest and stubdom.
>
> Relabeling the *running* stubdom gives me pause. We don't have any
> synchronization with the stubdom's & QEMU's state. QEMU wrote
> "running" to indicate it was up, but that doesn't say anything about
> the rest of the kernel. From the other side, the stubdom and QEMU
> running and having the guest label change could be surprising.
>
> Scott, you are using this, so I may be imagining concerns that don't
> exist. And you did mention your approach gives the PCI assignment
> only to the stubdom init label, which could be a nice feature. It's
> just the lack of clear delineation for the stubdom that makes me
> wonder about it.
>
> Having said that, for your approach, I think the code looks good.

As you said, there are advantages to both approaches. Relabeling the
stubdom before its launch would eliminate potential race conditions
between stubdom init and the run-time relabeling, which could cause
sporadic failures in any init steps that can fail to complete before
the relabel. On the other hand, waiting to relabel allows any
(dom0 -> stubdom) privileges that are required only for stubdom init,
particularly device passthrough setup, to be dropped from the run-time
label. (stubdom/dom0 -> domU) privileges are of less concern, since
they can be dropped by relabeling of the guest regardless.

At this point I can neither rule out synchronization issues with the late
relabeling approach nor quantify the benefits, as the policy I've been
using to verify this is fairly maximal in terms of run-time privileges.
I do intend to spend some time experimenting and shrinking it down in
the near future, though. Before that experimentation, I'll add a second
stubdom relabel point just before the stubdom is unpaused, along with a
config boolean to select which relabel point is used. That should allow
me to determine how much security benefit we'd be getting from the
later relabeling, and may be how things should go in upstream so that
users have a choice of approach.

In the meantime, input from any other devs is certainly welcome.

Good day,
    Scott

