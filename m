Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B31FD577
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 21:32:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jldnR-0003vX-2p; Wed, 17 Jun 2020 19:32:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jldnP-0003vO-Lv
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 19:32:27 +0000
X-Inumbo-ID: 4644580e-b0d1-11ea-8496-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4644580e-b0d1-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 19:32:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so3629516wro.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+0AWIHIihw/EJzXtpDQw8ECfNVfhi3oNv71yEdx7FQ8=;
 b=DrcXo5Ya99/PijG+WJ8yk0hODEPQuiMOHbkDcitqCvy0EXZGReS7OGRt2y+QuuoU2m
 aPLX08ryH9Klt2G9xkCkoo7333FmPYalaiHfA6qTEaPj6TXa3P1QHLkF0vibTzll2U92
 lGF+heMnUDKTMQUk8QgLbkJBgt1fU+4cZjTGFjhBdXAvzFCiGphl8XxoUTQgmssswk9+
 B0vGD6ToQK8HjlDz/Kvnk0qiExG4e3SBlTKHHuE9LV0kaaxCNjbWa46Gx61zcA024pry
 ePZGdfcCD+6GWHqMvdcVzK99m44i6CWhWTUuDdu5Q6oF6cXVvpt4dtgitqyS4MwfGSWA
 dabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0AWIHIihw/EJzXtpDQw8ECfNVfhi3oNv71yEdx7FQ8=;
 b=U75fKWv4MgyMf53Y0cV8EqWFuBhfLpjW3DWOtb77jCYpjySdh+9WeO2PD/ZEbPTDEa
 BZNSpSh+JAEoJdBGAnkFa30n1zHaf5D0AemU6SITB6DBwfvP/xPeVm380EImnzNH6UKo
 OZtyvbFrFPxJDtm04BS6XVgNw3tXzWcSi/udPE1Nwel4kHvgAOe5ljS8bkFdL9cPe0Cm
 ZbgeuLPePVDCZ0SILN8eLKhHmHxjbB25U0OTby08AZT49kDTVLlVabJUvCRbEplI8XDE
 4XMmdyAGcRpVXxN9i7VYDhlTDzDQHpsgVHv39ZvlYGsdY6gBU8i0UWV8zz/gx0J3FevS
 3dAQ==
X-Gm-Message-State: AOAM532VdWci/lI+G/io5snA51K2hH6JpCP/NMT6hqtiiQ0FnKvBUcOP
 KLMU4fXDhnN72KMJZM6SVWazQr6izXdfp94xwpI=
X-Google-Smtp-Source: ABdhPJzRzt6RkYVHAywiJsyEhe5M10zMZfXeAdbbKTHPw2svNxCt0Vq8cKwVQIXM2xJv3pUwMxJR1ETO0jApnwcGamI=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr765447wrq.259.1592422345659; 
 Wed, 17 Jun 2020 12:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
 <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
 <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
 <CABfawhn3UsLo_Ffe4C47Po+gCCChGXnH6ghENSNTY3OwqnBjUg@mail.gmail.com>
 <2df6eecb-df3b-7f6e-4185-99f4244ed9d1@citrix.com>
In-Reply-To: <2df6eecb-df3b-7f6e-4185-99f4244ed9d1@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 13:31:49 -0600
Message-ID: <CABfawhmJR6c4+sv5g_4STf3k2Vif-jmtOjJzLLqKWmh6gmt4_Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 11:23 AM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 17/06/2020 17:27, Tamas K Lengyel wrote:
> >>>>>> What semantics do you want for the buffer becoming full?  Given that
> >>>>>> debugging/tracing is the goal, I presume "pause vcpu on full" is the
> >>>>>> preferred behaviour, rather than drop packets on full?
> >>>>>>
> >>>>> Right now this is a ring-style buffer and when it would become full it would simply wrap and override the old data.
> >>>> How does the consumer spot that the data has wrapped?  What happens if
> >>>> data starts getting logged, but noone is listening?  What happens if the
> >>>> consumer exits/crashes/etc and stops listening as a consequence?
> >>>>
> >>>> It's fine to simply state what will happen, and possibly even "don't do
> >>>> that then", but the corner cases do at least need thinking about.
> >>> AFAIU the current use-case is predominantly to be used in conjunction
> >>> with VMI events where you want to be able to see the trace leading up
> >>> to a particular vmexit. So in the case when the buffer is wrapped
> >>> in-between events and data is lost that's not really of concern.
> >> That's all fine.  I imagine the output here is voluminous, and needs
> >> help being cut down as much as possible.
> >>
> >> On a tangent, I presume you'd like to include VM-fork eventually, which
> >> ought to include copying the trace buffer on fork?
> > I would eventually like to use it to reconstruct the branch history so
> > we can update AFL's coverage map with that instead of having to do the
> > current breakpoint-singlestep dance. But for that I would only care
> > about the trace starting after the fork, so copying the parent's PT
> > buffer is not needed. We'll also probably only use PT if the branch
> > history is larger than what LBR can hold. I asked Michal to name the
> > hypercall interface "vmtrace" for this reason so we can add other
> > stuff like LBR later using the same interface (which I already
> > implemented in https://github.com/tklengyel/xen/commits/lbr).
>
> I was wondering when someone was going to want LBR data like this.
> Can't you borrow the LBR-stitching tricks from Linux's perf to recover
> the call trace even when its deeper than the LBR stack?

TBH I only spent like an hour putting it together so I haven't
investigated the topic too much. But thanks for the tip, first I heard
about this LBR-stitching trick ;)

>
> What about PEBS?  ISTR there is a fairly complicated matrix of which
> features work in combination.

There is also BTS.. I would assume it would take some experimentation
to figure out what works and when and in what combination. Right now I
have no plans for doing that experimentation or adding support for
additional tracers.

>
>
> As for naming, we should definitely have something fairly generic.
> AFAICT, it would be applicable to ARM's CoreSight facilities as well.

IMHO XEN_DOMCTL_vmtrace would be a good name for controlling these features.

Tamas

