Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA061FEF71
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 12:13:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlrYB-0003Rd-J9; Thu, 18 Jun 2020 10:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tl4U=77=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jlrY9-0003RI-SB
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 10:13:37 +0000
X-Inumbo-ID: 5c04d526-b14c-11ea-bb8b-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c04d526-b14c-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 10:13:31 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 6F51B122804;
 Thu, 18 Jun 2020 12:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1592475210;
 bh=zRQRVQN0mJzMxDkmlI6cM+DDPW8ivpPSJOLJe/aNXLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ec8nG3maHRRkKIfLa+G76YcY9firEBI7k5QNVpH6ud61OIUtvEbpzFK88zN5iuPfF
 7NyxcGfkjt4+diE10XfI9VoDICYjKl0/8GxnMZeugNbdM2WitrV1t80d/yh3XK/fdD
 1fC0DQTrwTCc//zfXT89CIEnsS5yXXW5INYVd2kZTurmqXVWzTn5fdnnqufaRqV6PQ
 8n9CDqkNWuHcGmxrB9diLJd9iIfu78kcX+mMET87dlGlrDe9dDkbIX4Q8a3DONQGGc
 BFa+AmhOSK2udgfMTPfWbBoHF30tV0IxW7pKys+phAZvuQf8bm9Nx3519yDxx2ma79
 S4DS3Q6S/Nrtw==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 588A8265E722; Thu, 18 Jun 2020 12:13:30 +0200 (CEST)
Date: Thu, 18 Jun 2020 12:13:30 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: Event delivery and "domain blocking" on PVHv2
Message-ID: <20200618101330.GB10330@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Monday, 15.06.2020 at 17:58, Andrew Cooper wrote:
> On 15/06/2020 15:25, Martin Lucina wrote:
> > Hi,
> >
> > puzzle time: In my continuing explorations of the PVHv2 ABIs for the
> > new MirageOS Xen stack, I've run into some issues with what looks like
> > missed deliveries of events on event channels.
> >
> > While a simple unikernel that only uses the Xen console and
> > effectively does for (1..5) { printf("foo"); sleep(1); } works fine,
> > once I plug in the existing OCaml Xenstore and Netfront code, the
> > behaviour I see is that the unikernel hangs in random places, blocking
> > as if an event that should have been delivered has been missed.
> 
> You can see what is going on, event channel wise, with the 'e'
> debug-key.  This will highlight cases such as the event channel being
> masked and pending, which is a common guest bug ending up in this state.

Ok, based on your and Roger's suggestions I've made some changes:

1. I've dropped all the legacy PIC initialisation code from the Solo5
parts, written some basic APIC initialisation code and switched to using
HVMOP_set_evtchn_upcall_vector for upcall registration, along with setting
HVM_PARAM_CALLBACK_IRQ to 1 as suggested by Roger and done by Xen when
running as a guest. Commit at [1], nothing controversial there.

2. I've re-worked the "bottom half" of the event channel upcall handler to
mask the event when marking it as pending in the OCaml-side "shadow"
structure, and unmask it immediately before an OCaml-side handler would be
run, i.e. when doing a "test and clear port" operation on the OCaml-side
structure.

However, none of this seems to have fundamentally changed the behaviour.
The unikernel still gets "stuck" at random points during netfront set-up.
Now that I've extended the grant table size, *sometimes* get as far as a
fully functioning netfront and packets will flow, but things will
eventually freeze up (pretty much immediately if I do something like ping
-f).

When the unikernel is in the "frozen" state, the domain is blocked (so we
think we're waiting for events), and the "e" debug key shows the relevant
event channels (Xenstore or netfront) as pending but unmasked:

Example - when hung during netfront bring-up:

(XEN) Event channel information for domain 27:
(XEN) Polling vCPUs: {}
(XEN)     port [p/m/s]
(XEN)        1 [1/0/1]: s=3 n=0 x=0 d=0 p=33
(XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
(XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0

(1 is Xenstore, 2 is console which we don't care about, 3 is VIRQ_TIMER).

When hung after hammering with "ping -f":

(XEN) Event channel information for domain 28:
(XEN) Polling vCPUs: {}
(XEN)     port [p/m/s]
(XEN)        1 [0/0/1]: s=3 n=0 x=0 d=0 p=33
(XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
(XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0
(XEN)        4 [1/0/1]: s=3 n=0 x=0 d=0 p=35

(as above, 4 is netfront)

Some more questions about the "bottom half" of the event channel upcall,
called periodically by OCaml outside of interrupt context:

static bool evtchn_demux_pending(void)
{
    struct shared_info *s = SHARED_INFO();
    struct vcpu_info *vi = VCPU0_INFO();
    bool some_pending = false;

    vi->evtchn_upcall_pending = 0;
>>>> Based on Roger's suggestion, this is now only done here and no longer
>>>> in the "top half" in interrupt context, which now only ACKs the vector
>>>> on the APIC.

    /*
     * Demux events received from Xen.
     *
     * pending_l1 is the "outer" per-VCPU selector (evtchn_pending_sel).
     * pending_l2 is the "inner" system-wide word (evtchn_pending[l1i]).
     */
    xen_ulong_t pending_l1, pending_l2;
    atomic_sync_xchg(&vi->evtchn_pending_sel, 0, &pending_l1);
    while (pending_l1 != 0) {
        xen_ulong_t l1i = ffs(pending_l1);
        pending_l1 &= ~(1UL << l1i);

        /*
         * Masking pending_l2 with ~evtchn_mask[l1i] is necessary to get the
         * *current* masked events; otherwise races like the following
         * can occur:
         *
         *     1. X is generated, upcall scheduled by Xen.
         *     2. X is masked.
         *     3. Upcall is delivered.
         *     4. X fires despite now being masked.
         */
        while ((pending_l2 =
                    (s->evtchn_pending[l1i] & ~s->evtchn_mask[l1i])) != 0) {
            xen_ulong_t l2i = ffs(pending_l2);
            pending_l2 &= ~(1UL << l2i);
>>>> Do I need the above? It doesn't make a difference and seems redundant
>>>> since pending_l2 is always reassigned in the loop, but Mini-OS and
>>>> others are doing it...?

            evtchn_port_t port = (l1i * (sizeof(xen_ulong_t) * 8)) + l2i;
            /*
             * Mark as pending on the OCaml side and mask the event until
             * just before OCaml gets around to handling it. Also, clear
             * the pending bit on the Xen side.
             */
            evtchn_callback_ml[port] = 1;
            atomic_sync_bts(l2i, &s->evtchn_mask[l1i]);
>>>> Mask added at Roger's suggestion, not in the original Mini-OS PV-based
>>>> implementation.
            atomic_sync_btc(l2i, &s->evtchn_pending[l1i]);
            some_pending = true;
        }
    }
    return some_pending;
}

The OCaml code essentially calls the above periodically, and, if
it returns true, then calls into the following "test and clear" operation
for all ports:

static inline bool evtchn_test_and_clear(evtchn_port_t port)
{
    assert(port < EVTCHN_2L_NR_CHANNELS);
    if (evtchn_callback_ml[port] > 0) {
        evtchn_callback_ml[port] = 0;
        evtchn_unmask(port);
>>>> Unmask added at Roger's suggestion, not in the original Mini-OS
>>>> PV-based implementation. I'm not entirely happy about this, since
>>>> it'll probably result in a lot more hypercalls when the event channel
>>>> is busy?
        return true;
    }
    else {
        return false;
    }
}

If this returns true, then the event handler will get run immediately after
returning from here, and before any further call to evtchn_demux_pending().

At this point I don't really have a clear idea of how to progress,
comparing my implementation side-by-side with the original PV Mini-OS-based
implementation doesn't show up any differences I can see.

AFAICT the OCaml code I've also not changed in any material way, and that
has been running in production on PV for years, so I'd be inclined to think
the problem is in my reimplementation of the C parts, but where...?

Martin

[1] https://github.com/mato/solo5/commit/42afe3a2177b9caf63d0df435391ae03a6684ac8

