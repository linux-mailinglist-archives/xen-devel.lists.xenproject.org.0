Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3A203C43
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 18:09:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnP0i-0007IZ-38; Mon, 22 Jun 2020 16:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnP0g-0007IU-LO
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 16:09:26 +0000
X-Inumbo-ID: bd055ae0-b4a2-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd055ae0-b4a2-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 16:09:24 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tDwExkz/82tywebeocbKJhBdFN3tfWzBkUEjqD0yrjau6Dgh72pmX88KugfvDvdOjp7SHWf2MZ
 DjE0YoP9SpfZ2YIIj4q+jIBvoZMLpS+qnEF4WLe1//t1s+UzNqmfgUaQC0x/Gf1si2lGDUo6Kh
 fsrbykdyUi5wlIrRUBxugyjoLSDc1Gf84PoP8UQx0hqD3VoD6rkImYBRzfPv0PDkWW9OoeyWvN
 9Eqlwo5235qYcwh060Q5TVEOI+4k9xuK+CYExK3wgMgnbMtBqte8iZVASFZOlvvtY+uEjo2SC6
 jmw=
X-SBRS: 2.7
X-MesageID: 20648870
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,267,1589256000"; d="scan'208";a="20648870"
Date: Mon, 22 Jun 2020 18:09:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Event delivery and "domain blocking" on PVHv2
Message-ID: <20200622160916.GM735@Air-de-Roger>
References: <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
 <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
 <20200619112119.GY735@Air-de-Roger>
 <ab26d419909c1fb038b32024d457871c@lucina.net>
 <20200619165426.GD735@Air-de-Roger>
 <20200619174143.GE735@Air-de-Roger>
 <7ed4a5f98b3002f3233e02d5ce803ef0@lucina.net>
 <20200622135853.GK735@Air-de-Roger>
 <745e4ac251b146480b2c6d6afbf5f34a@lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <745e4ac251b146480b2c6d6afbf5f34a@lucina.net>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 05:31:00PM +0200, Martin Lucina wrote:
> On 2020-06-22 15:58, Roger Pau Monné wrote:
> > On Mon, Jun 22, 2020 at 12:58:37PM +0200, Martin Lucina wrote:
> > > Aha! Thank you for pointing this out. I think you may be right, but
> > > this
> > > should be possible without doing the demuxing in interrupt context.
> > 
> > If you don't do the demuxing in the interrupt context (ie: making the
> > interrupt handler a noop), then you don't likely need such interrupt
> > anyway?
> 
> I need the/an interrupt to wake the VCPU from HLT state if we went to sleep.
> 
> > 
> > > How about this arrangement, which appears to work for me; no hangs I
> > > can see
> > > so far and domU survives ping -f fine with no packet loss:
> > > 
> > > CAMLprim value
> > > mirage_xen_evtchn_block_domain(value v_deadline)
> > > {
> > >     struct vcpu_info *vi = VCPU0_INFO();
> > >     solo5_time_t deadline = Int64_val(v_deadline);
> > > 
> > >     if (solo5_clock_monotonic() < deadline) {
> > >         __asm__ __volatile__ ("cli" : : : "memory");
> > >         if (vi->evtchn_upcall_pending) {
> > >             __asm__ __volatile__ ("sti");
> > >         }
> > >         else {
> > >             hypercall_set_timer_op(deadline);
> > 
> > What if you set a deadline so close that evtchn_upcall_pending gets
> > set by Xen here and the interrupt is injected? You would execute the
> > noop handler and just hlt, and could likely end up in the same blocked
> > situation as before?
> 
> Why would an interrupt be injected here? Doesn't the immediately preceding
> "cli" disable that?

Well, I mean between the sti and the hlt instruction. I think there's
always a window for a race here, and that's the reason for having
SCHEDOP_block (see comment referring to avoiding a "wakeup waiting"
race).

> Or perhaps I need to do a PV/HVM hybrid and set vi->evtchn_upcall_mask just
> before the cli, and clear it after the sti?

I think SCHEDOP_block is broken on HVM, as as Jan points out
evtchn_upcall_mask is not used on HVM (we should really have a comment
about this in xen.h). So that hypercall is no longer useful to avoid
wakeup waiting races.

> > > i.e. Always go to sleep with interrupts disabled, but before doing so
> > > re-check that no events have become pending since the last time
> > > evtchn_demux_pending() was called. This holds, since the only thing
> > > that
> > > sets vi->evtchn_upcall_pending is Xen, and the only thing that
> > > clears it is
> > > evtchn_demux_pending().
> > > 
> > > Right?
> > 
> > TBH this is a hard model to get right, I think your best bet at
> > attempting something along this lines is to forget about using the
> > event channel interrupt and instead use SCHEDOP_poll. You could do
> > something like (written in pure C as I have no idea of the ocaml
> > bindings):
> > [SCHEDOP_poll code snipped]
> 
> Thanks for the suggestion. This brings us full-circle -- I found [1] and
> [2] way back from 2013 when Mirage/Xen was initially using SCHEDOP_poll
> and then switched to the current interrupts + SCHEDOP_block approach.
> 
> Part of the motivation for the change at the time was to allow waiting
> on/servicing more than 128 ports (the limit for SCHEDOP_poll). I doubt
> anyone wants to do that these days, but it still makes me a bit reluctant
> to change back to SCHEDOP_poll.

Right, Mirage/Xen being single processor it's not likely to use more
than 128 event channels, but I can understand the desire to not be
limited by that amount.

> > > In an attempt to understand why the original PV code worked I
> > > re-read the PV
> > > Mini-OS block_domain code again and realised that I had entirely
> > > missed one
> > > part of its behaviour, which is that it intends[*] to run with
> > > interrupts/upcalls disabled *all* the time and relies on SCHEDOP_block
> > > atomically re-enabling them and triggering an upcall before
> > > returning (PV)
> > > or "briefly enabling interrupts to allow handlers to run" (HVM).
> > > We're doing
> > > the inverse, but our behaviour matches my mental model of how things
> > > should
> > > work.
> > 
> > Not really IMO, as SCHEDOP_block is a single 'instruction' from a
> > guest PoV that does the enabling of interrupts and returns if there
> > are pending ones.
> 
> Indeed and this is exactly the operation I need in the HVM world with the
> current model.

Another option would be to consider re-purposing SCHEDOP_block for HVM
so it does a sti on behalf of the guest and then checks for pending
interrupts to inject.

> > Also SCHEDOP_block is not exactly the same on HVM, as it just checks
> > for pending vectors to inject, but not for pending event channels.
> 
> ... well, I don't want to use SCHEDOP_block anyway since that is not
> possible
> on ARM, and I would like to keep the code at least "portable with not too
> much effort". So there should be a non-racy "HVM way" to do this?

One solution (albeit it would be slightly crappy IMO) is to make sure
the timer is always fully handled in interrupt context, so that you
_never_ call hlt with a timer event pending. That way you are always
guaranteed to be woken up.

> > HVM you cannot call hlt with interrupts disabled, or the vCPU will be
> > taken down.
> > 
> > There are quite a lot of subtle differences between PV and HVM in this
> > regard, and I think the best approach would be to use SCHEDOP_poll in
> > order to implement the kind of model you describe.
> 
> I can see that now. The interactions between the "virtual hardware"
> (interrupt delivery, VCPU IF) and "PV" parts (event delivery, masking) are
> hard to understand for me, yet the two are intertwined in the way HVM
> works :-(
> 
> Coming back to your earlier suggestion of moving the event demuxing (but not
> the handling) into the upcall interrupt handler itself, perhaps that
> approach
> is still worth investigating in combination with re-working the OCaml side
> array
> view of pending events, or at least ensuring that atomic operations are used
> since it would now be updated asynchronously.

I assume you must be doing something similar for KVM in Solo5, where
you handle (at least certain) interrupts in interrupt context, or else
the same issues would arise?

Roger.

