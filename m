Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A81FC46B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 05:03:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlOM1-0007BU-Td; Wed, 17 Jun 2020 03:03:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlOM0-0007BP-8h
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 03:03:08 +0000
X-Inumbo-ID: 114b8b7a-b047-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 114b8b7a-b047-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 03:03:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c3so642133wru.12
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 20:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FjXM/IwLBHDK3QOT5MbqpDBMbj+8Bj45bhvyM2CJ014=;
 b=Z6M3UXff/OqFGmAWtOgpHXdFNtacX8jkQbXGLXrSaseWOFzBhbWG5Q7ULOmZaPKOGY
 6g8N8tB7F13M5etl1mOobPUvAhzoBgmGSTewdCOE5siAaRxIQNLTgmVzehlDWUPcgqNS
 kFs8HwAq47oDSrbZ2evwstbAPkCOGeR3K/vSpct2PxiQQselgkGP/ik9Fxjd4TFLqpzl
 pqyX5zFwSIz+4+dtRYe9NZ3Er9a3XvXz0oA3PmfS3AL8U3Nfg4RGYFyh112D9MdAalvR
 txE8F06CPmemK8Au7iUcnzA3LmNSHNWwExPQ3ZAGhb9DkoQErMnGh6e5nJf9gpMSk/Jj
 OGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FjXM/IwLBHDK3QOT5MbqpDBMbj+8Bj45bhvyM2CJ014=;
 b=ELilvD5MUoo9v9W1pRqPUxRLyZufYUJqTHA1PmyV9dy05iNNUGdN9CI9kLH+N4Ijh3
 i4Q2feLlj+D6EgMKHN4Z8jrbUSLYRdXaki9FiUZ5FsFu+7O57s3MrEy3VsXBZTAYKz/3
 3Z8K34wvKLPQo9GeNmHHtmmUkEr6CUw1ZecSdt2EmM/WVYO47EhhdNJhKNj8g+Eo0YNc
 lY0llEZqEprwNT+iTJIp+YIkjZ5PFMGhbGK6c10xQjaN0Rz7tdKA/9r0t9jkxTaqbJbC
 hUy9dGdUsLQtKQ454Tb7s3wJXBALDuv2G3xHdMZSyCkhkpw+WCvWB+0GYiA6oj9hibvO
 afPw==
X-Gm-Message-State: AOAM531b5ds19xvQ05BL9lTtYnkCfZiVm8ipbeZCbx2zgZKM1BCAqwua
 mXmV8ozKisKSz6iCwFROT60OXT03DHKaN2dRVMc=
X-Google-Smtp-Source: ABdhPJzTa2JS66zBqAwQsijJblHvayeP4S+qH9M5g4GLHVBkvGlktEcA672mNhOcwlDP/9txArMrEhHLFkQznWVG+aM=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr5883871wrq.259.1592362986226; 
 Tue, 16 Jun 2020 20:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
In-Reply-To: <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 16 Jun 2020 21:02:30 -0600
Message-ID: <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 16, 2020 at 2:17 PM Andrew Cooper <andrew.cooper3@citrix.com> w=
rote:
>
> On 16/06/2020 19:47, Micha=C5=82 Leszczy=C5=84ski wrote:
> > ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com napi=
sa=C5=82(a):
> >
> >> Are there any restrictions on EPT being enabled in the first place?  I=
'm
> >> not aware of any, and in principle we could use this functionality for
> >> PV guests as well (using the CPL filter).  Therefore, I think it would
> >> be helpful to not tie the functionality to HVM guests, even if that is
> >> the only option enabled to start with.
> > I think at the moment it's not required to have EPT. This patch series =
doesn't use any translation feature flags, so the output address is always =
a machine physical address, regardless of context. I will check if it could=
 be easily used with PV.
>
> If its trivial to add PV support then please do.  If its not, then don't
> feel obliged, but please do at least consider how PV support might look
> in the eventual feature.
>
> (Generally speaking, considering "how would I make this work in other
> modes where it is possible" leads to a better design.)
>
> >> The buffer mapping and creation logic is fairly problematic.  Instead =
of
> >> fighting with another opencoded example, take a look at the IOREQ
> >> server's use of "acquire resource" which is a mapping interface which
> >> supports allocating memory on behalf of the guest, outside of the gues=
t
> >> memory, for use by control tools.
> >>
> >> I think what this wants is a bit somewhere in domain_create to indicat=
e
> >> that external tracing is used for this domain (and allocate whatever
> >> structures/buffers are necessary), acquire resource to map the buffers
> >> themselves, and a domctl for any necessary runtime controls.
> >>
> > I will check this out, this sounds like a good option as it would remov=
e lots of complexity from the existing ipt_enable domctl.
>
> Xen has traditionally opted for a "and turn this extra thing on
> dynamically" model, but this has caused no end of security issues and
> broken corner cases.
>
> You can see this still existing in the difference between
> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
> required to chose the number of vcpus for the domain) and we're making
> good progress undoing this particular wart (before 4.13, it was
> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
> issuing other hypercalls between these two).
>
> There is a lot of settings which should be immutable for the lifetime of
> the domain, and external monitoring looks like another one of these.
> Specifying it at createdomain time allows for far better runtime
> behaviour (you are no longer in a situation where the first time you try
> to turn tracing on, you end up with -ENOMEM because another VM booted in
> the meantime and used the remaining memory), and it makes for rather
> more simple code in Xen itself (at runtime, you can rely on it having
> been set up properly, because a failure setting up will have killed the
> domain already).

I'm not in favor of this being a flag that gets set during domain
creation time. It could certainly be the case that some users would
want this being on from the start till the end but in other cases you
may want to enable it intermittently only for some time in-between
particular events. If it's an on/off flag during domain creation you
pretty much force that choice on the users and while the overhead of
PT is better than say MTF it's certainly not nothing. In case there is
an OOM situation enabling IPT dynamically the user can always just
pause the VM and wait till memory becomes available.

>
> >> What semantics do you want for the buffer becoming full?  Given that
> >> debugging/tracing is the goal, I presume "pause vcpu on full" is the
> >> preferred behaviour, rather than drop packets on full?
> >>
> > Right now this is a ring-style buffer and when it would become full it =
would simply wrap and override the old data.
>
> How does the consumer spot that the data has wrapped?  What happens if
> data starts getting logged, but noone is listening?  What happens if the
> consumer exits/crashes/etc and stops listening as a consequence?
>
> It's fine to simply state what will happen, and possibly even "don't do
> that then", but the corner cases do at least need thinking about.

AFAIU the current use-case is predominantly to be used in conjunction
with VMI events where you want to be able to see the trace leading up
to a particular vmexit. So in the case when the buffer is wrapped
in-between events and data is lost that's not really of concern.

Tamas

