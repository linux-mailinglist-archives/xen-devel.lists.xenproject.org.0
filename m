Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69A2E95F5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61199.107461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPuv-00011c-Kl; Mon, 04 Jan 2021 13:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61199.107461; Mon, 04 Jan 2021 13:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPuv-00011D-H5; Mon, 04 Jan 2021 13:29:01 +0000
Received: by outflank-mailman (input) for mailman id 61199;
 Mon, 04 Jan 2021 13:29:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25yB=GH=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kwPut-000118-UJ
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:28:59 +0000
Received: from MTA-11-4.privateemail.com (unknown [198.54.127.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8714cdf-66bd-4e0b-a940-81bfb1861dd5;
 Mon, 04 Jan 2021 13:28:59 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 2E22880074
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 08:28:58 -0500 (EST)
Received: from mail-wm1-f47.google.com (unknown [10.20.151.231])
 by mta-11.privateemail.com (Postfix) with ESMTPA id EBE458004A
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 13:28:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n16so7706877wmc.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 05:28:57 -0800 (PST)
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
X-Inumbo-ID: b8714cdf-66bd-4e0b-a940-81bfb1861dd5
X-Gm-Message-State: AOAM530fEvEieh4mU9OY13QTpvKkQyvM8xSAHQ09DEHrtMHJBrNVlq+z
	79+MMc1inL0+zdRhsW1g0gLLj0wMP4/nBotEhyA=
X-Google-Smtp-Source: ABdhPJyzXbt/rSLOtEItUxdTaQq67T6JSJd5OLAY4T7B7/r9XE5AGD7+sU+7Pj1kHb2CjKZaVQ8fKLxar9lrG2UP+xs=
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr26976140wmh.51.1609766936509;
 Mon, 04 Jan 2021 05:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20210103184117.57692-1-tamas@tklengyel.com> <6a1d7087-5ae2-6a70-bee5-fdf521310d3d@citrix.com>
In-Reply-To: <6a1d7087-5ae2-6a70-bee5-fdf521310d3d@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 4 Jan 2021 08:28:20 -0500
X-Gmail-Original-Message-ID: <CABfawhmBM7nFCVm_61xJ9u5VpKaeGKoBm2i56NiqMMMoG2bVmQ@mail.gmail.com>
Message-ID: <CABfawhmBM7nFCVm_61xJ9u5VpKaeGKoBm2i56NiqMMMoG2bVmQ@mail.gmail.com>
Subject: Re: [PATCH] x86/vm_event: transfer nested p2m base info
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jan 4, 2021 at 6:57 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 03/01/2021 18:41, Tamas K Lengyel wrote:
> > Required to introspect events originating from nested VMs.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> >  xen/arch/x86/hvm/monitor.c    | 32 ++++++++++++++++++++++++++++++--
> >  xen/include/public/vm_event.h |  7 ++++++-
> >  2 files changed, 36 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> > index e4a09964a0..eb4afe81b3 100644
> > --- a/xen/arch/x86/hvm/monitor.c
> > +++ b/xen/arch/x86/hvm/monitor.c
> > @@ -26,6 +26,7 @@
> >  #include <xen/mem_access.h>
> >  #include <xen/monitor.h>
> >  #include <asm/hvm/monitor.h>
> > +#include <asm/hvm/nestedhvm.h>
> >  #include <asm/altp2m.h>
> >  #include <asm/monitor.h>
> >  #include <asm/p2m.h>
> > @@ -33,6 +34,15 @@
> >  #include <asm/vm_event.h>
> >  #include <public/vm_event.h>
> >
> > +static inline void set_npt_base(struct vcpu *curr, vm_event_request_t *req)
>
> No need for inline here.  Can fix on commit.
>
> > diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> > index fdd3ad8a30..8415bc7618 100644
> > --- a/xen/include/public/vm_event.h
> > +++ b/xen/include/public/vm_event.h
> > @@ -208,6 +212,7 @@ struct vm_event_regs_x86 {
> >      uint64_t msr_star;
> >      uint64_t msr_lstar;
> >      uint64_t gdtr_base;
> > +    uint64_t npt_base;
>
> This needs enough description to actually use it correctly.
>
> /* Guest physical address.  On Intel hardware, this is the EPT_POINTER
> field from the L1 hypervisors VMCS, including all architecturally
> defined metadata. */
>
> Except, its not.  nvmx_vcpu_eptp_base() masks out the lower metadata, so
> the walk length is missing, and the introspection agent can't
> distinguish between 4 and 5 level EPT.  Same on the AMD side (except it
> could be any paging mode, including 2 and 3 level).

AMD is AFAIK not supported for vm_events. Also, only 4L EPT is
available at this time, so that information is irrelevant anyway.

>
> Furthermore, (and more in reference to your pagewalk patch), it might be
> necessary to know whether EPT A/D is enabled for the agent to do the
> correct thing when getting a gla-not-valid fault.

Not for a translation. For use-cases where they need to know whether
the page got modified (and want to use A/D for that instead of
tracking such modifications with mem_access), sure, but I'm not aware
of such a use-case. So I would leave that up as a TODO for the time
when it's actually needed.

Tamas

