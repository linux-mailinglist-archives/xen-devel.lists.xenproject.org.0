Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4888F1FF0EC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 13:46:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlt05-0002ej-JO; Thu, 18 Jun 2020 11:46:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlt03-0002dn-Ku
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 11:46:31 +0000
X-Inumbo-ID: 561f377a-b159-11ea-ba7a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 561f377a-b159-11ea-ba7a-12813bfff9fa;
 Thu, 18 Jun 2020 11:46:25 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sy/Tg8xTzfK+X5o0GbCh3t2mEwwRBxT7c/ucS7IEu41qVuoXUWhCmruU4w4/GFpz7BjSniz20p
 tr3fEW1ZfeMdDywwHNKeFNjWANYEa6arIDzMkGzEnqcZi+FvXWCxwQVebTayKMcyXMlpO62y9m
 KnC3KYbUryRbJeK5mU47Q1gdA137rXHU+NaFrmOoMXNE5zgZHDcpJatK4WKo5HhjpuuglDTpMj
 c69T+fJs5F3+aNeBRvaGKLSiNg+SNurZotH4ZqFmegQ7wz2pMeyivC/wWCQ47187U9RbaEk6yZ
 lzw=
X-SBRS: 2.7
X-MesageID: 20705463
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20705463"
Date: Thu, 18 Jun 2020 13:46:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Event delivery and "domain blocking" on PVHv2
Message-ID: <20200618114617.GJ735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200618101330.GB10330@nodbug.lucina.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Thu, Jun 18, 2020 at 12:13:30PM +0200, Martin Lucina wrote:
> On Monday, 15.06.2020 at 17:58, Andrew Cooper wrote:
> > On 15/06/2020 15:25, Martin Lucina wrote:
> > > Hi,
> > >
> > > puzzle time: In my continuing explorations of the PVHv2 ABIs for the
> > > new MirageOS Xen stack, I've run into some issues with what looks like
> > > missed deliveries of events on event channels.
> > >
> > > While a simple unikernel that only uses the Xen console and
> > > effectively does for (1..5) { printf("foo"); sleep(1); } works fine,
> > > once I plug in the existing OCaml Xenstore and Netfront code, the
> > > behaviour I see is that the unikernel hangs in random places, blocking
> > > as if an event that should have been delivered has been missed.
> > 
> > You can see what is going on, event channel wise, with the 'e'
> > debug-key.  This will highlight cases such as the event channel being
> > masked and pending, which is a common guest bug ending up in this state.
> 
> Ok, based on your and Roger's suggestions I've made some changes:
> 
> 1. I've dropped all the legacy PIC initialisation code from the Solo5
> parts, written some basic APIC initialisation code and switched to using
> HVMOP_set_evtchn_upcall_vector for upcall registration, along with setting
> HVM_PARAM_CALLBACK_IRQ to 1 as suggested by Roger and done by Xen when
> running as a guest. Commit at [1], nothing controversial there.
> 
> 2. I've re-worked the "bottom half" of the event channel upcall handler to
> mask the event when marking it as pending in the OCaml-side "shadow"
> structure, and unmask it immediately before an OCaml-side handler would be
> run, i.e. when doing a "test and clear port" operation on the OCaml-side
> structure.

As long as the unmask happens after you having cleared the bit on the
ocaml-side structure I think it should be fine, however I would unmask
the event channel once you have finished running the ocaml handler for
it.

> 
> However, none of this seems to have fundamentally changed the behaviour.
> The unikernel still gets "stuck" at random points during netfront set-up.
> Now that I've extended the grant table size, *sometimes* get as far as a
> fully functioning netfront and packets will flow, but things will
> eventually freeze up (pretty much immediately if I do something like ping
> -f).
> 
> When the unikernel is in the "frozen" state, the domain is blocked (so we
> think we're waiting for events), and the "e" debug key shows the relevant
> event channels (Xenstore or netfront) as pending but unmasked:
> 
> Example - when hung during netfront bring-up:
> 
> (XEN) Event channel information for domain 27:
> (XEN) Polling vCPUs: {}
> (XEN)     port [p/m/s]
> (XEN)        1 [1/0/1]: s=3 n=0 x=0 d=0 p=33
> (XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
> (XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0
> 
> (1 is Xenstore, 2 is console which we don't care about, 3 is VIRQ_TIMER).
> 
> When hung after hammering with "ping -f":
> 
> (XEN) Event channel information for domain 28:
> (XEN) Polling vCPUs: {}
> (XEN)     port [p/m/s]
> (XEN)        1 [0/0/1]: s=3 n=0 x=0 d=0 p=33
> (XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
> (XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0
> (XEN)        4 [1/0/1]: s=3 n=0 x=0 d=0 p=35
> 
> (as above, 4 is netfront)

So events are pending but somehow not injected.

> 
> Some more questions about the "bottom half" of the event channel upcall,
> called periodically by OCaml outside of interrupt context:
> 
> static bool evtchn_demux_pending(void)
> {
>     struct shared_info *s = SHARED_INFO();
>     struct vcpu_info *vi = VCPU0_INFO();
>     bool some_pending = false;
> 
>     vi->evtchn_upcall_pending = 0;
> >>>> Based on Roger's suggestion, this is now only done here and no longer
> >>>> in the "top half" in interrupt context, which now only ACKs the vector
> >>>> on the APIC.
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
>         pending_l1 &= ~(1UL << l1i);
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
>             pending_l2 &= ~(1UL << l2i);
> >>>> Do I need the above? It doesn't make a difference and seems redundant
> >>>> since pending_l2 is always reassigned in the loop, but Mini-OS and
> >>>> others are doing it...?

No, pending_l2 AFAICT it's only used to get the event channel to
process, so there's no point in clearing it on the local variable.
What you care about is clearing it in evtchn_pending[l1i].

> 
>             evtchn_port_t port = (l1i * (sizeof(xen_ulong_t) * 8)) + l2i;
>             /*
>              * Mark as pending on the OCaml side and mask the event until
>              * just before OCaml gets around to handling it. Also, clear
>              * the pending bit on the Xen side.
>              */
>             evtchn_callback_ml[port] = 1;
>             atomic_sync_bts(l2i, &s->evtchn_mask[l1i]);
> >>>> Mask added at Roger's suggestion, not in the original Mini-OS PV-based
> >>>> implementation.
>             atomic_sync_btc(l2i, &s->evtchn_pending[l1i]);
>             some_pending = true;
>         }
>     }
>     return some_pending;
> }
> 
> The OCaml code essentially calls the above periodically, and, if
> it returns true, then calls into the following "test and clear" operation
> for all ports:
> 
> static inline bool evtchn_test_and_clear(evtchn_port_t port)
> {
>     assert(port < EVTCHN_2L_NR_CHANNELS);
>     if (evtchn_callback_ml[port] > 0) {
>         evtchn_callback_ml[port] = 0;
>         evtchn_unmask(port);
> >>>> Unmask added at Roger's suggestion, not in the original Mini-OS
> >>>> PV-based implementation. I'm not entirely happy about this, since
> >>>> it'll probably result in a lot more hypercalls when the event channel
> >>>> is busy?

OTOH you will likely continue to get interrupts from it if you don't
mask it, so you might receive several interrupts (because you clear
the pending bit) without having executed the handler.

IMO it would be better to do the unmask after the handler has run.

>         return true;
>     }
>     else {
>         return false;
>     }
> }
> 
> If this returns true, then the event handler will get run immediately after
> returning from here, and before any further call to evtchn_demux_pending().
> 
> At this point I don't really have a clear idea of how to progress,
> comparing my implementation side-by-side with the original PV Mini-OS-based
> implementation doesn't show up any differences I can see.
> 
> AFAICT the OCaml code I've also not changed in any material way, and that
> has been running in production on PV for years, so I'd be inclined to think
> the problem is in my reimplementation of the C parts, but where...?

A good start would be to print the ISR and IRR lapic registers when
blocked, to assert there are no pending vectors there.

Can you apply the following patch to your Xen, rebuild and check the
output of the 'l' debug key?

Also add the output of the 'v' key.

Roger.
---8<---
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 7b5c633033..45b195cc05 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -23,6 +23,7 @@
 #include <xen/domain.h>
 #include <xen/domain_page.h>
 #include <xen/event.h>
+#include <xen/keyhandler.h>
 #include <xen/nospec.h>
 #include <xen/trace.h>
 #include <xen/lib.h>
@@ -1662,6 +1663,34 @@ void vlapic_destroy(struct vcpu *v)
     free_domheap_page(vlapic->regs_page);
 }
 
+static void print_lapic(unsigned char key)
+{
+    const struct domain *d;
+
+    for_each_domain ( d )
+    {
+        const struct vcpu *v;
+
+        if ( !has_vlapic(d) )
+            continue;
+
+        for_each_vcpu ( d, v )
+        {
+            const struct vlapic *vlapic = vcpu_vlapic(v);
+
+            printk("%pv IRR: %*pb\n", v, 256, &vlapic->regs->data[APIC_IRR]);
+            printk("%pv ISR: %*pb\n", v, 256, &vlapic->regs->data[APIC_ISR]);
+        }
+    }
+}
+
+static int __init print_lapic_init(void)
+{
+    register_keyhandler('l', print_lapic, "dump local APIC info", 1);
+    return 0;
+}
+__initcall(print_lapic_init);
+
 /*
  * Local variables:
  * mode: C


