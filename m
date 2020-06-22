Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210820388D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 15:59:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnMyW-00022G-T6; Mon, 22 Jun 2020 13:59:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnMyV-00022B-GC
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 13:59:03 +0000
X-Inumbo-ID: 85dc6c64-b490-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85dc6c64-b490-11ea-8496-bc764e2007e4;
 Mon, 22 Jun 2020 13:59:00 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7y4rcKvZcox4JFp72HsObqCBchKdRBPFQ+txFZgp5PYBmgG+CpJa2dAZJs5k057cPFD9L0p+9v
 bssuV7vrAiO89TodoThg07a2b9QUBMrdkiS3JZLO1ifQtw6hZE05Zw1kq/bEAOQuK0emmgKdqN
 LEdrw7WS8Lo4S05270JNP23KAQ2CR1Pt5iQttOoV26p+SQwHIKFCzns5zwUagRl2HspJApiJmQ
 3pgBxfsMdCIbovvJEsHAYblfqYcBBUa/FWRhV8okz+PMlVo11BUjLFw+EJHkFoTxlYhcCtZDNk
 wGU=
X-SBRS: 2.7
X-MesageID: 20968042
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,267,1589256000"; d="scan'208";a="20968042"
Date: Mon, 22 Jun 2020 15:58:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Event delivery and "domain blocking" on PVHv2
Message-ID: <20200622135853.GK735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
 <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
 <20200619112119.GY735@Air-de-Roger>
 <ab26d419909c1fb038b32024d457871c@lucina.net>
 <20200619165426.GD735@Air-de-Roger>
 <20200619174143.GE735@Air-de-Roger>
 <7ed4a5f98b3002f3233e02d5ce803ef0@lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ed4a5f98b3002f3233e02d5ce803ef0@lucina.net>
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

On Mon, Jun 22, 2020 at 12:58:37PM +0200, Martin Lucina wrote:
> On 2020-06-19 19:42, Roger Pau Monné wrote:
> > On Fri, Jun 19, 2020 at 06:54:26PM +0200, Roger Pau Monné wrote:
> > > On Fri, Jun 19, 2020 at 06:41:21PM +0200, Martin Lucina wrote:
> > > > On 2020-06-19 13:21, Roger Pau Monné wrote:
> > > > > On Fri, Jun 19, 2020 at 12:28:50PM +0200, Martin Lucina wrote:
> > > > > > On 2020-06-18 13:46, Roger Pau Monné wrote:
> > > > > > > On Thu, Jun 18, 2020 at 12:13:30PM +0200, Martin Lucina wrote:
> > > > > > > > At this point I don't really have a clear idea of how to progress,
> > > > > > > > comparing my implementation side-by-side with the original PV
> > > > > > > > Mini-OS-based
> > > > > > > > implementation doesn't show up any differences I can see.
> > > > > > > >
> > > > > > > > AFAICT the OCaml code I've also not changed in any material way, and
> > > > > > > > that
> > > > > > > > has been running in production on PV for years, so I'd be inclined
> > > > > > > > to think
> > > > > > > > the problem is in my reimplementation of the C parts, but where...?
> > > > > > >
> > > > > > > A good start would be to print the ISR and IRR lapic registers when
> > > > > > > blocked, to assert there are no pending vectors there.
> > > > > > >
> > > > > > > Can you apply the following patch to your Xen, rebuild and check the
> > > > > > > output of the 'l' debug key?
> > > > > > >
> > > > > > > Also add the output of the 'v' key.
> > > > > >
> > > > > > Had to fight the Xen Debian packages a bit as I wanted to patch the
> > > > > > exact
> > > > > > same Xen (there are some failures when building on a system that has
> > > > > > Xen
> > > > > > installed due to following symlinks when fixing shebangs).
> > > > > >
> > > > > > Here you go, when stuck during netfront setup, after allocating its
> > > > > > event
> > > > > > channel, presumably waiting on Xenstore:
> > > > > >
> > > > > > 'e':
> > > > > >
> > > > > > (XEN) Event channel information for domain 3:
> > > > > > (XEN) Polling vCPUs: {}
> > > > > > (XEN)     port [p/m/s]
> > > > > > (XEN)        1 [1/0/1]: s=3 n=0 x=0 d=0 p=33
> > > > > > (XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
> > > > > > (XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0
> > > > > > (XEN)        4 [0/1/1]: s=2 n=0 x=0 d=0
> > > > > >
> > > > > > 'l':
> > > > > >
> > > > > > (XEN) d3v0 IRR:
> > > > > > ffff8301732dc200b
> > > > > > (XEN) d3v0 ISR:
> > > > > > ffff8301732dc100b
> > > > >
> > > > > Which version of Xen is this? AFAICT it doesn't have the support to
> > > > > print a bitmap.
> > > >
> > > > That in Debian 10 (stable):
> > > >
> > > > ii  xen-hypervisor-4.11-amd64            4.11.3+24-g14b62ab3e5-1~deb10u1.2
> > > > amd64        Xen Hypervisor on AMD64
> > > >
> > > > xen_major              : 4
> > > > xen_minor              : 11
> > > > xen_extra              : .4-pre
> > > > xen_version            : 4.11.4-pre
> > > >
> > > > >
> > > > > Do you think you could also pick commit
> > > > > 8cd9500958d818e3deabdd0d4164ea6fe1623d7c [0] and rebuild? (and print
> > > > > the info again).
> > > >
> > > > Done, here you go:
> > > >
> > > > (XEN) Event channel information for domain 3:
> > > > (XEN) Polling vCPUs: {}
> > > > (XEN)     port [p/m/s]
> > > > (XEN)        1 [1/0/1]: s=3 n=0 x=0 d=0 p=33
> > > > (XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
> > > > (XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0
> > > > (XEN)        4 [0/1/1]: s=3 n=0 x=0 d=0 p=35
> > > >
> > > >
> > > > (XEN) d3v0 IRR:
> > > > 00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000
> > > > (XEN) d3v0 ISR:
> > > > 00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000
> > > 
> > > So there's nothing pending on the lapic. Can you assert that you will
> > > always execute evtchn_demux_pending after you have received an event
> > > channel interrupt (ie: executed solo5__xen_evtchn_vector_handler)?
> > > 
> > > I think this would be simpler if you moved evtchn_demux_pending into
> > > solo5__xen_evtchn_vector_handler? As there would be less asynchronous
> > > processing, and thus likely less races?
> > 
> > Having though about this, I think this model of not demuxing in
> > solo5__xen_evtchn_vector_handler is always racy, as it's not possible
> > to assert that you would always call evtchn_demux_pending after
> > solo5__xen_evtchn_vector_handler?
> > 
> > Ie: if you receive an interrupt just before going to sleep (after the
> > sti and before the hlt) you will execute
> > solo5__xen_evtchn_vector_handler and EOI the vector, but then
> > evtchn_demux_pending will never get called, and thus the interrupts
> > will stay indefinitely pending?
> 
> Aha! Thank you for pointing this out. I think you may be right, but this
> should be possible without doing the demuxing in interrupt context.

If you don't do the demuxing in the interrupt context (ie: making the
interrupt handler a noop), then you don't likely need such interrupt
anyway?

> How about this arrangement, which appears to work for me; no hangs I can see
> so far and domU survives ping -f fine with no packet loss:
> 
> CAMLprim value
> mirage_xen_evtchn_block_domain(value v_deadline)
> {
>     struct vcpu_info *vi = VCPU0_INFO();
>     solo5_time_t deadline = Int64_val(v_deadline);
> 
>     if (solo5_clock_monotonic() < deadline) {
>         __asm__ __volatile__ ("cli" : : : "memory");
>         if (vi->evtchn_upcall_pending) {
>             __asm__ __volatile__ ("sti");
>         }
>         else {
>             hypercall_set_timer_op(deadline);

What if you set a deadline so close that evtchn_upcall_pending gets
set by Xen here and the interrupt is injected? You would execute the
noop handler and just hlt, and could likely end up in the same blocked
situation as before?

>             __asm__ __volatile__ ("sti; hlt");
>         }
>     }
>     return Val_unit;
> }
> 
> i.e. Always go to sleep with interrupts disabled, but before doing so
> re-check that no events have become pending since the last time
> evtchn_demux_pending() was called. This holds, since the only thing that
> sets vi->evtchn_upcall_pending is Xen, and the only thing that clears it is
> evtchn_demux_pending().
> 
> Right?

TBH this is a hard model to get right, I think your best bet at
attempting something along this lines is to forget about using the
event channel interrupt and instead use SCHEDOP_poll. You could do
something like (written in pure C as I have no idea of the ocaml
bindings):

int
mirage_xen_evtchn_block_domain(uint64_t timeout)
{
    evtchn_port_t ports[MAX_PORTS];
    struct sched_poll poll = {
    	.timeout = timeout,
	.nr_ports = 0,
    };

    set_xen_guest_handle(poll.ports, ports);

    /* Fill ports you care about (ie: all event channel ports in use) */
    ports[poll.nr_ports++] = port_1;
    ports[poll.nr_ports++] = port_2;
    [...] /* Check that you don't overrun MAX_PORTS */

    /* On return demux events and call timer handler if timeout expired. */
    return hypercall_sched_op(SCHEDOP_poll, &poll);
}

Doing something like the above you could forget about setting up the
event channel interrupt and the timer.

>             __asm__ __volatile__ ("sti; hlt");
>         }
>     }
>     return Val_unit;
> }
> 
> In an attempt to understand why the original PV code worked I re-read the PV
> Mini-OS block_domain code again and realised that I had entirely missed one
> part of its behaviour, which is that it intends[*] to run with
> interrupts/upcalls disabled *all* the time and relies on SCHEDOP_block
> atomically re-enabling them and triggering an upcall before returning (PV)
> or "briefly enabling interrupts to allow handlers to run" (HVM). We're doing
> the inverse, but our behaviour matches my mental model of how things should
> work.

Not really IMO, as SCHEDOP_block is a single 'instruction' from a
guest PoV that does the enabling of interrupts and returns if there
are pending ones.

Also SCHEDOP_block is not exactly the same on HVM, as it just checks
for pending vectors to inject, but not for pending event channels. On
HVM you cannot call hlt with interrupts disabled, or the vCPU will be
taken down.

There are quite a lot of subtle differences between PV and HVM in this
regard, and I think the best approach would be to use SCHEDOP_poll in
order to implement the kind of model you describe.

Roger.

