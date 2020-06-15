Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450161F9DDF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:54:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jksM2-00088h-Ne; Mon, 15 Jun 2020 16:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jksM1-000880-HO
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:53:01 +0000
X-Inumbo-ID: a7bbb898-af28-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7bbb898-af28-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 16:52:54 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ogwVSP6sgRf3vISs9oDIA72rmuVO3ykqi0ng0XugkFMlFYpWvSszEQrgg5rnUQlX/r3HyRrAws
 79Um+qmAsa/DJznWc5iTyejkKz9/1lWGI9etbKo4Dk1vXmSBqHpj5Qnq/y1uBFKfs61C8eJxFw
 QaPpOiVAUbx3q0IytCYwC8sovLU6KAVqBGhB8EVDU2w0ybqG5L9x8p6LyPEQy8l/OjyWloGXsE
 mlbyjVVY/vjNt0Oy4ckUKC6KtLsCqsCzlnO9m7kPQoFklgHRfGdnxhjM+oIgBNAipsKP015T6k
 REE=
X-SBRS: 2.7
X-MesageID: 20427979
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20427979"
Date: Mon, 15 Jun 2020 18:52:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Event delivery and "domain blocking" on PVHv2
Message-ID: <20200615165101.GJ735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <20200615150344.GG735@Air-de-Roger>
 <4a0bb4fa4dca2732feae4e2f825eb2a6@lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a0bb4fa4dca2732feae4e2f825eb2a6@lucina.net>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 05:51:51PM +0200, Martin Lucina wrote:
> On 2020-06-15 17:03, Roger Pau Monné wrote:
> > This way of event channel injection is slitgly hackish, and I would
> > recommend using HVMOP_set_evtchn_upcall_vector, that way vectors will
> > be properly routed using the lapic.
> > 
> > Using HVM_PARAM_CALLBACK_TYPE_VECTOR vectors are injected without
> > setting the IRR/ISR bit in the lapic registers.
> 
> I picked HVM_PARAM_CALLBACK_TYPE_VECTOR since that seemed like the easiest
> option for a uniprocessor, PVH-only guest.
> 
> What does <vector> mean in the context of HVMOP_set_evtchn_upcall_vector? If
> it's an APIC vector number (sorry, not too familiar with the post-legacy
> i8259 world), does that imply that if I use HVMOP_set_evtchn_upcall_vector I
> need to do some APIC initialisation / programming?
> 
> All I need for Solo5/Mirage purposes is to have the upcall land on IDT
> vector #32 or above.

Oh, OK. It was reported that HVM_PARAM_CALLBACK_TYPE_VECTOR doesn't
work well with migration and when using hardware APIC virtualization
IIRC, because of the fact that interrupts are not signaled in the
lapic and directly injected.

> > > Questions:
> > > 
> > > 1. Being based on the Solo5 virtio code, the low-level setup code is
> > > doing
> > > the "usual" i8259 PIC setup, to remap the PIC IRQs to vectors 32 and
> > > above.
> > > Should I be doing this initialisation for Xen PVH at all?
> > 
> > Hm, there are no IO-APICs (or legacy PICs) on a PVH domU, so there's
> > not much to route. If Solo5 is thinking it's somehow configuring them
> > it's likely writing to some hole in memory, or to some RAM.
> 
> Solo5 only has a very primitive understanding of hardware interrupts, so
> it's only configuring the legacy PICs via port IO.

Oh, then there's definitely no legacy PIC at all. Writes to the PIC IO
ports will be dropped/ignored, and reads will return ~0. I guess you
could implement some check based on that in order to avoid doing any
initialization?

I don't think it should be harmful in any way, but you are just likely
spending a bunch of time trapping into the hypervisor to handle those
reads/writes for no good reason.

> > 
> > IO-APIC presence is signaled on the ACPI MADT table on PVH domU.
> > 
> 
> Hmm, it'd be very unfortunate if I had to deal with ACPI, so here's hoping
> that I don't actually need to touch the APIC.

If you don't do any IO-APIC configuration at all then that's
completely fine.

> > > I'm not interested
> > > in using the PIC for anything, and all interrupts will be delivered
> > > via Xen
> > > event channels.
> > > 
> > > 2. Related to the above, the IRQ handler code is ACKing the
> > > interrupt after
> > > the handler runs. Should I be doing that? Does ACKing "IRQ" 0 on the
> > > PIC
> > > have any interactions with Xen's view of event channels/pending
> > > upcalls?
> > 
> > Which kind of ACking it's doing? Is it writing to the lapic EOI
> > register? If so that would be OK when using
> > HVMOP_set_evtchn_upcall_vector. If using
> > HVM_PARAM_CALLBACK_TYPE_VECTOR there's nothing to Ack I think.
> 
> Legacy PIC EOI via port IO.

No need to do that. There's no legacy PIC on PVH, and then event
channel interrupts are not routed through the PIC when using
HVM_PARAM_CALLBACK_TYPE_VECTOR.

> > I'm not sure. Keep in mind that a new call to hypercall_set_timer_op
> > will overwrite the previous timer, and hence should be fine I think as
> > long as you are using the one-shot timer.
> 
> Is there something other than a one-shot timer? hypercall_set_timer_op is
> just a single-argument hypercall with an uint64_t deadline, right? (And not
> documented in xen.h either ...)

There's also a periodic timer (see VCPUOP_{set/stop}_periodic_timer),
which was enabled by default at 100Hz for PV guests. This is not the
case for PVH.

> > > I can also post the code that does the actual demuxing of events
> > > from Xen
> > > (i.e. the upcall handler), but I've read through that several times
> > > now and
> > > I don't think the problem is there; adding diagnostic prints to both
> > > the
> > > low-level C event channel code and higher-level OCaml Activations code
> > > confirms that received events are being mapped to their ports
> > > correctly.
> > 
> > I can take a look at the event channel handler if you want, as you
> > wish. The only weird think I've noticed is the error in the unmask
> > where you seem to use evtchn_mask instead of evtchn_pending.
> 
> Thanks for the offer, this stuff is fairly subtle.
> 
> In the Mirage/Xen scenario, there are two parts to the upcall handler. The
> top half is executed in interrupt context and basically does nothing except
> acknowledge the upcall:
> 
> int solo5__xen_evtchn_vector_handler(void *arg __attribute__((unused)))
> {
>     struct vcpu_info *vi = VCPU0_INFO();
> 
>     /*
>      * All work is done outside of interrupt context by
> evtchn_demux_pending(),
>      * so all we need to do here is acknowledge the upcall from Xen.
>      */
>     vi->evtchn_upcall_pending = 0;

I think you should best avoid clearing evtchn_upcall_pending here, as
Xen will then inject more vector callbacks if a new event is signaled,
even when you have not processed the previous one?

>     return 1;
> }
> 
> The bottom half is then called periodically (and always before blocking) by
> the OCaml code:
> 
> static bool evtchn_demux_pending(void)
> {
>     struct shared_info *s = SHARED_INFO();
>     struct vcpu_info *vi = VCPU0_INFO();
>     bool some_pending = false;
> 
>     vi->evtchn_upcall_pending = 0;
> 
>     /*
>      * Demux events received from Xen.
>      *
>      * pending_l1 is the "outer" per-VCPU selector (evtchn_pending_sel).
>      * pending_l2 is the "inner" system-wide word (evtchn_pending[l1i]).
>      */
>     xen_ulong_t pending_l1, pending_l2;
>     atomic_sync_xchg(&vi->evtchn_pending_sel, 0, &pending_l1);
>     while (pending_l1 != 0) {
>         xen_ulong_t l1i = ffs(pending_l1);
> 
>         /*
>          * Masking pending_l2 with ~evtchn_mask[l1i] is necessary to get the
>          * *current* masked events; otherwise races like the following
>          * can occur:
>          *
>          *     1. X is generated, upcall scheduled by Xen.
>          *     2. X is masked.
>          *     3. Upcall is delivered.
>          *     4. X fires despite now being masked.
>          */
>         while ((pending_l2 =
>                     (s->evtchn_pending[l1i] & ~s->evtchn_mask[l1i])) != 0) {
>             xen_ulong_t l2i = ffs(pending_l2);
> 
>             evtchn_port_t port = (l1i * (sizeof(xen_ulong_t) * 8)) + l2i;
>             /*
>              * Mark as pending on the OCaml side.
>              */
>             evtchn_callback_ml[port] = 1;

How is this cleared? It must be cleared before the handler is run, or
else you will likely miss interrupts.

Also, I think you could mask the port before setting
evtchn_callback_ml and unmask it when evtchn_callback_ml is cleared?

>             some_pending = true;
> 
>             atomic_sync_btc(l2i, &s->evtchn_pending[l1i]);
>         }
> 
>         pending_l1 &= ~(1UL << l1i);
>     }
> 
>     return some_pending;
> }

If you can dump the event channel numbers and their usage from Solo5
then you can check against the 'e' debug key from Xen in order to
check if there are indeed pending events to be delivered on some of
them.

Just checking the output from the 'e' debug key will tell you if
there's anything pending and if there are any channels masked.

Roger.

