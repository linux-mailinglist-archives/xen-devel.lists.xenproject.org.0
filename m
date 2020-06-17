Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4194D1FD1F5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 18:28:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlauk-0004yR-RU; Wed, 17 Jun 2020 16:27:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlaui-0004yM-TA
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 16:27:48 +0000
X-Inumbo-ID: 7ac7fa32-b0b7-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ac7fa32-b0b7-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 16:27:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b82so2463558wmb.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YXHpOWeBQgiev/hCsiOwbuwRn+k6Vqsq5BwuVxCq3Uo=;
 b=Y7ujb9RZhct+nG4S8T0s77cZDkh3a5cFVT/MSM4+i4NOUBmP30hSnnFqWENt2AEE5R
 2ufDBn6RBc9gT8t3Mv3A9j6xygppOOttIuYQOLigTVV7n1Qwa8UftYFg9E/l6FDYYMb8
 YPBVkMe1aU7yXNpKmBEjyVSCKY/a7XBHlUlDtgtyI8ApSy9Amm2+V9cpEtah4oYMNOHC
 Ic3MTjOU1oeOXPyHLP7evvQBWbijp7ZuQHSMRPsrLACtqf+185exYAdb+ms92VH17exR
 Gnj9n5a0yNaikJVSzDRqGdKDkj+6bEVbUnSZxUSpFCQ7fnLIdCOWvz94XiZXYAmo6mSA
 RjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YXHpOWeBQgiev/hCsiOwbuwRn+k6Vqsq5BwuVxCq3Uo=;
 b=NZ7hU1zgcQthK9RG6exHHYC0Oyedqn/B0Y7Ko5PmdPuQIwiqKW1BT58euLIRvfJm5w
 YvFZ+r62sLTJzOsKOq/RjDNImVNmhkXCQ10o1M8WKk+Ee9rRGRpD+6fg7pt3CKo3MQ2n
 uIKSYVb0K3kgPTq6/ODkhAOUt+d/PwZ/d8UgF/ABvGiCACxps2+3V5C3633yM6OMhLMm
 myMHKl5qREb/c+tWnkyzwSwmwSNovyQ+AXvUPVb0tTlrVo/hMLO9tH7/yPONQ4/NblTa
 unlA8XNpKR1gFI6T9yEXa4RvcG7o//A+euRuHA1g25rgU7PMCxKCLzirD5LADStyFeh1
 Hzlw==
X-Gm-Message-State: AOAM5312tT7RVCY3elNZOzf2dkn8fYIFD28TKGZO+RCSO5/DYRjlMZoY
 YNVysW9IF8M+HmmjunJz6639mO1IFyI1yyuIsoI=
X-Google-Smtp-Source: ABdhPJwi3HCwBtuMe6WgdWn+DmQtRl2xUBTJAxTg46wXu4g6dc/YJZ9mCMnfJA7rVb/Mu2XWZ7xn8sW7mY1sehsLiaQ=
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr9371658wmj.186.1592411266824; 
 Wed, 17 Jun 2020 09:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <d4e37559-bf23-36a4-41d9-a6a8bfc84ac3@citrix.com>
 <CABfawhnhLKEhJFqyH97YFNiHX6vNoLDR4x52gnaNK_5B1VyWOA@mail.gmail.com>
 <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
In-Reply-To: <6da28899-25ae-7355-fa0a-70fac44f597e@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 10:27:10 -0600
Message-ID: <CABfawhn3UsLo_Ffe4C47Po+gCCChGXnH6ghENSNTY3OwqnBjUg@mail.gmail.com>
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

On Wed, Jun 17, 2020 at 10:19 AM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 17/06/2020 04:02, Tamas K Lengyel wrote:
> > On Tue, Jun 16, 2020 at 2:17 PM Andrew Cooper <andrew.cooper3@citrix.co=
m> wrote:
> >> On 16/06/2020 19:47, Micha=C5=82 Leszczy=C5=84ski wrote:
> >>> ----- 16 cze 2020 o 20:17, Andrew Cooper andrew.cooper3@citrix.com na=
pisa=C5=82(a):
> >>>
> >>>> Are there any restrictions on EPT being enabled in the first place? =
 I'm
> >>>> not aware of any, and in principle we could use this functionality f=
or
> >>>> PV guests as well (using the CPL filter).  Therefore, I think it wou=
ld
> >>>> be helpful to not tie the functionality to HVM guests, even if that =
is
> >>>> the only option enabled to start with.
> >>> I think at the moment it's not required to have EPT. This patch serie=
s doesn't use any translation feature flags, so the output address is alway=
s a machine physical address, regardless of context. I will check if it cou=
ld be easily used with PV.
> >> If its trivial to add PV support then please do.  If its not, then don=
't
> >> feel obliged, but please do at least consider how PV support might loo=
k
> >> in the eventual feature.
> >>
> >> (Generally speaking, considering "how would I make this work in other
> >> modes where it is possible" leads to a better design.)
> >>
> >>>> The buffer mapping and creation logic is fairly problematic.  Instea=
d of
> >>>> fighting with another opencoded example, take a look at the IOREQ
> >>>> server's use of "acquire resource" which is a mapping interface whic=
h
> >>>> supports allocating memory on behalf of the guest, outside of the gu=
est
> >>>> memory, for use by control tools.
> >>>>
> >>>> I think what this wants is a bit somewhere in domain_create to indic=
ate
> >>>> that external tracing is used for this domain (and allocate whatever
> >>>> structures/buffers are necessary), acquire resource to map the buffe=
rs
> >>>> themselves, and a domctl for any necessary runtime controls.
> >>>>
> >>> I will check this out, this sounds like a good option as it would rem=
ove lots of complexity from the existing ipt_enable domctl.
> >> Xen has traditionally opted for a "and turn this extra thing on
> >> dynamically" model, but this has caused no end of security issues and
> >> broken corner cases.
> >>
> >> You can see this still existing in the difference between
> >> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
> >> required to chose the number of vcpus for the domain) and we're making
> >> good progress undoing this particular wart (before 4.13, it was
> >> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
> >> issuing other hypercalls between these two).
> >>
> >> There is a lot of settings which should be immutable for the lifetime =
of
> >> the domain, and external monitoring looks like another one of these.
> >> Specifying it at createdomain time allows for far better runtime
> >> behaviour (you are no longer in a situation where the first time you t=
ry
> >> to turn tracing on, you end up with -ENOMEM because another VM booted =
in
> >> the meantime and used the remaining memory), and it makes for rather
> >> more simple code in Xen itself (at runtime, you can rely on it having
> >> been set up properly, because a failure setting up will have killed th=
e
> >> domain already).
> > I'm not in favor of this being a flag that gets set during domain
> > creation time. It could certainly be the case that some users would
> > want this being on from the start till the end but in other cases you
> > may want to enable it intermittently only for some time in-between
> > particular events. If it's an on/off flag during domain creation you
> > pretty much force that choice on the users and while the overhead of
> > PT is better than say MTF it's certainly not nothing. In case there is
> > an OOM situation enabling IPT dynamically the user can always just
> > pause the VM and wait till memory becomes available.
>
> There is nothing wrong with having "turn tracing on/off at runtime"
> hypercalls.  It is specifically what I suggested two posts up in this
> thread, but it should be limited to the TraceEn bit in RTIT_CTL.
>
> What isn't ok is trying to allocate the buffers, write the TOPA, etc on
> first-enable or first-map, because the runtime complexity of logic like
> this large, and far too easy to get wrong in security relevant ways.
>
> The domain create flag would mean "I wish to use tracing with this
> domain", and not "I want tracing enabled from the getgo".

Gotcha, that's reasonable.

>
> >>>> What semantics do you want for the buffer becoming full?  Given that
> >>>> debugging/tracing is the goal, I presume "pause vcpu on full" is the
> >>>> preferred behaviour, rather than drop packets on full?
> >>>>
> >>> Right now this is a ring-style buffer and when it would become full i=
t would simply wrap and override the old data.
> >> How does the consumer spot that the data has wrapped?  What happens if
> >> data starts getting logged, but noone is listening?  What happens if t=
he
> >> consumer exits/crashes/etc and stops listening as a consequence?
> >>
> >> It's fine to simply state what will happen, and possibly even "don't d=
o
> >> that then", but the corner cases do at least need thinking about.
> > AFAIU the current use-case is predominantly to be used in conjunction
> > with VMI events where you want to be able to see the trace leading up
> > to a particular vmexit. So in the case when the buffer is wrapped
> > in-between events and data is lost that's not really of concern.
>
> That's all fine.  I imagine the output here is voluminous, and needs
> help being cut down as much as possible.
>
> On a tangent, I presume you'd like to include VM-fork eventually, which
> ought to include copying the trace buffer on fork?

I would eventually like to use it to reconstruct the branch history so
we can update AFL's coverage map with that instead of having to do the
current breakpoint-singlestep dance. But for that I would only care
about the trace starting after the fork, so copying the parent's PT
buffer is not needed. We'll also probably only use PT if the branch
history is larger than what LBR can hold. I asked Michal to name the
hypercall interface "vmtrace" for this reason so we can add other
stuff like LBR later using the same interface (which I already
implemented in https://github.com/tklengyel/xen/commits/lbr).

Tamas

