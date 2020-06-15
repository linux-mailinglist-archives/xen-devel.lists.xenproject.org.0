Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E741F9B5B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqeQ-0005u7-5Q; Mon, 15 Jun 2020 15:03:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkqeO-0005u1-UM
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:03:52 +0000
X-Inumbo-ID: 6bdfef6a-af19-11ea-b807-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bdfef6a-af19-11ea-b807-12813bfff9fa;
 Mon, 15 Jun 2020 15:03:51 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4lB6PxmJeYWm+XlMP7xLA7fOZ65fLTIYKq2IWee2/NV0h8GNDq8KuKRB0tw0ExAun4d0xt99+Y
 JIqAujQMNtXqgN6yl/5kju6fa+ZH+5uQdEsf4vss3b/3nUkMQm6TsKgdCTQJ+bl2Xb7cLEBCyH
 8J/vatIiDd1csX3H43MUT143iOopgZrSCJjJwLnHSSFnEtmMmZuERLWg0ttNCX4CC/OF3hXZVp
 1mEsoCFz9tEv8Ffm/tI6pnNVGNUTEwFVxcT9fe75Q3H4krSOky7EFDPt/AA0GrbT9SE+uMUU6y
 jgs=
X-SBRS: 2.7
X-MesageID: 20305325
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20305325"
Date: Mon, 15 Jun 2020 17:03:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>, <mirageos-devel@lists.xenproject.org>,
 <martin@lucina.net>
Subject: Re: Event delivery and "domain blocking" on PVHv2
Message-ID: <20200615150344.GG735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <62479d08f7650c22678d7a86851eafc4@lucina.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 04:25:57PM +0200, Martin Lucina wrote:
> Hi,
> 
> puzzle time: In my continuing explorations of the PVHv2 ABIs for the new
> MirageOS Xen stack, I've run into some issues with what looks like missed
> deliveries of events on event channels.

That would be weird, as other OSes using PVHv2 seem to be fine.

> While a simple unikernel that only uses the Xen console and effectively does
> for (1..5) { printf("foo"); sleep(1); } works fine, once I plug in the
> existing OCaml Xenstore and Netfront code, the behaviour I see is that the
> unikernel hangs in random places, blocking as if an event that should have
> been delivered has been missed.
> 
> Multiple runs of the unikernel have it block at different places during
> Netfront setup, and sometimes it will run as far as a fully setup Netfront,
> and then wait for network packets. However, even if it gets that far,
> packets are not actually being delivered:
> 
> Solo5: Xen console: port 0x2, ring @0x00000000FEFFF000
>             |      ___|
>   __|  _ \  |  _ \ __ \
> \__ \ (   | | (   |  ) |
> ____/\___/ _|\___/____/
> Solo5: Bindings version v0.6.5-6-gf4b47d11
> Solo5: Memory map: 256 MB addressable:
> Solo5:   reserved @ (0x0 - 0xfffff)
> Solo5:       text @ (0x100000 - 0x28ffff)
> Solo5:     rodata @ (0x290000 - 0x2e0fff)
> Solo5:       data @ (0x2e1000 - 0x3fafff)
> Solo5:       heap >= 0x3fb000 < stack < 0x10000000
> gnttab_init(): pages=1 entries=256
> 2020-06-15 13:42:08 -00:00: INF [net-xen frontend] connect 0
> > > > > Sometimes we hang here
> 2020-06-15 13:42:08 -00:00: INF [net-xen frontend] create: id=0 domid=0
> 2020-06-15 13:42:08 -00:00: INF [net-xen frontend]  sg:true gso_tcpv4:true
> rx_copy:true rx_flip:false smart_poll:false
> 2020-06-15 13:42:08 -00:00: INF [net-xen frontend] MAC: 00:16:3e:30:49:52
> > > > > Or here
> gnttab_grant_access(): ref=0x8, domid=0x0, addr=0x8f9000, readonly=0
> gnttab_grant_access(): ref=0x9, domid=0x0, addr=0x8fb000, readonly=0
> evtchn_alloc_unbound(remote=0x0) = 0x4
> 2020-06-15 13:42:08 -00:00: INF [ethernet] Connected Ethernet interface
> 00:16:3e:30:49:52
> 2020-06-15 13:42:08 -00:00: INF [ARP] Sending gratuitous ARP for 10.0.0.2
> (00:16:3e:30:49:52)
> gnttab_grant_access(): ref=0xa, domid=0x0, addr=0x8fd000, readonly=1
> 2020-06-15 13:42:08 -00:00: INF [udp] UDP interface connected on 10.0.0.2
> 2020-06-15 13:42:08 -00:00: INF [tcpip-stack-direct] stack assembled:
> mac=00:16:3e:30:49:52,ip=10.0.0.2
> Gntref.get(): Waiting for free grant
> Gntref.get(): Waiting for free grant
> > > > > The above are also rather odd, but not related to event
> > > > > channel delivery, so one problem at a time...
> > > > > Once we get this far, packets should be flowing but aren't
> > > > > (either way). However, Xenstore is obviously working, as we
> > > > > wouldn't get through Netfront setup without it.
> 
> Given that I've essentially re-written the low-level event channel C code,
> I'd like to verify that the mechanisms I'm using for event delivery are
> indeed the right thing to do on PVHv2.
> 
> For event delivery, I'm registering the upcall with Xen as follows:
> 
>     uint64_t val = 32ULL;
>     val |= (uint64_t)HVM_PARAM_CALLBACK_TYPE_VECTOR << 56;
>     int rc = hypercall_hvm_set_param(HVM_PARAM_CALLBACK_IRQ, val);
>     assert(rc == 0);
> 
> i.e. upcalls are to be delivered via IDT vector.

This way of event channel injection is slitgly hackish, and I would
recommend using HVMOP_set_evtchn_upcall_vector, that way vectors will
be properly routed using the lapic.

Using HVM_PARAM_CALLBACK_TYPE_VECTOR vectors are injected without
setting the IRR/ISR bit in the lapic registers.

> Questions:
> 
> 1. Being based on the Solo5 virtio code, the low-level setup code is doing
> the "usual" i8259 PIC setup, to remap the PIC IRQs to vectors 32 and above.
> Should I be doing this initialisation for Xen PVH at all?

Hm, there are no IO-APICs (or legacy PICs) on a PVH domU, so there's
not much to route. If Solo5 is thinking it's somehow configuring them
it's likely writing to some hole in memory, or to some RAM.

IO-APIC presence is signaled on the ACPI MADT table on PVH domU.

> I'm not interested
> in using the PIC for anything, and all interrupts will be delivered via Xen
> event channels.
> 
> 2. Related to the above, the IRQ handler code is ACKing the interrupt after
> the handler runs. Should I be doing that? Does ACKing "IRQ" 0 on the PIC
> have any interactions with Xen's view of event channels/pending upcalls?

Which kind of ACking it's doing? Is it writing to the lapic EOI
register? If so that would be OK when using
HVMOP_set_evtchn_upcall_vector. If using
HVM_PARAM_CALLBACK_TYPE_VECTOR there's nothing to Ack I think.

> Next, for a PVHv2, uniprocessor only guest, is the following flow sufficient
> to unmask an event channel?
> 
>     struct shared_info *s = SHARED_INFO();
>     int pending = 0;
> 
>     atomic_sync_btc(port, &s->evtchn_mask[0]);
>     pending = sync_bt(port, &s->evtchn_mask[0]);

You should check for pending interrupts on evtchn_pending, not
evtchn_mask.

>     if (pending) {
>         /*
>          * Slow path:
>          *
>          * If pending is set here, then there was a race, and we lost the
>          * upcall.  Mask the port again and force an upcall via a call to
>          * hyperspace.
>          *
>          * This should be sufficient for HVM/PVHv2 based on my understanding
> of
>          * Linux drivers/xen/events/events_2l.c.
>          */
>         atomic_sync_bts(port, &s->evtchn_mask[0]);
>         hypercall_evtchn_unmask(port);
>     }

FWIW, I use the hypercall unconditionally on FreeBSD because I didn't
see a performance difference when compared to this method.

> Lastly, the old PV-only Mini-OS based stack would do delays ("block the
> domain") by doing a HYPERVISOR_set_timer_op(deadline) followed by a
> HYPERVISOR_sched_op(SCHEDOP_block,0 ). In the new code, I'm doing the
> following (based on what Mini-OS seems to be doing for HVM):
> 
>     solo5_time_t deadline = Int64_val(v_deadline);
> 
>     if (solo5_clock_monotonic() < deadline) {
>         hypercall_set_timer_op(deadline);
>         __asm__ __volatile__ ("hlt" : : : "memory");
>         /* XXX: cancel timer_op here if woken up early? */
>     }
> 
> Again, is this the right thing to do for PVH?

hlt will trap into the hypervisor, so it's fine to use.

> As the comment says, do I need to cancel the timer_op?

I'm not sure. Keep in mind that a new call to hypercall_set_timer_op
will overwrite the previous timer, and hence should be fine I think as
long as you are using the one-shot timer.

> I understood the
> semantics to be "fire once at/after the time deadline is reached", if that
> is indeed the case then with my current VIRQ_TIMER handler which does
> nothing in the interrupt context and has no side effects I should be fine.

I have no idea how Solo5 works, maybe you should re-set the timer to
the next deadline in the handler?

Or that's fine because the timer is always set before blocking.

> I can also post the code that does the actual demuxing of events from Xen
> (i.e. the upcall handler), but I've read through that several times now and
> I don't think the problem is there; adding diagnostic prints to both the
> low-level C event channel code and higher-level OCaml Activations code
> confirms that received events are being mapped to their ports correctly.

I can take a look at the event channel handler if you want, as you
wish. The only weird think I've noticed is the error in the unmask
where you seem to use evtchn_mask instead of evtchn_pending.

I would also recommend using HVMOP_set_evtchn_upcall_vector instead of
HVM_PARAM_CALLBACK_TYPE_VECTOR. In order to make some tools happy just
set HVM_PARAM_CALLBACK_TYPE_VECTOR to 1. You can take a look at how
Xen does it when running as a guest:

http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/x86/guest/xen/xen.c;h=2ff63d370a8a12fef166677e2ded7ed82a628ce8;hb=HEAD#l205

Roger.

