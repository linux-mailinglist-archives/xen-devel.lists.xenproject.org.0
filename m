Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6251F9DF2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jksRY-0008MT-GI; Mon, 15 Jun 2020 16:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jksRW-0008MO-Vx
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:58:43 +0000
X-Inumbo-ID: 76887684-af29-11ea-b81b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76887684-af29-11ea-b81b-12813bfff9fa;
 Mon, 15 Jun 2020 16:58:41 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EXtZe8DLeKVW4NdhUXHJmGzS59nbanjNfuh7yl5Z6MYZ/Kz9FQVS9HiRIleskPNxIm72kqgted
 AOGB8s90YLICbqr6FjalVEdRHyP4F79zci3LGleFoo9/t2Lo7GEq6+DUYDLS5pyyGl3KAXJpAK
 uthQbNTH8WWi950siBHikKGEDc4Zoaq7mP3/iaobTRbg+UD9ootzT0VIvv52jWVx97Zn+heRu5
 iLZ9UkXvVuxmwXpEdzTlR9bW+gDx2sAAlUxKh3Qc3DHDLyn0YJhOC05c+LXpLpUyQuSb55w/TF
 pjg=
X-SBRS: 2.7
X-MesageID: 20383002
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20383002"
Subject: Re: Event delivery and "domain blocking" on PVHv2
To: <xen-devel@lists.xenproject.org>, <mirageos-devel@lists.xenproject.org>,
 <martin@lucina.net>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
Date: Mon, 15 Jun 2020 17:58:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <62479d08f7650c22678d7a86851eafc4@lucina.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

On 15/06/2020 15:25, Martin Lucina wrote:
> Hi,
>
> puzzle time: In my continuing explorations of the PVHv2 ABIs for the
> new MirageOS Xen stack, I've run into some issues with what looks like
> missed deliveries of events on event channels.
>
> While a simple unikernel that only uses the Xen console and
> effectively does for (1..5) { printf("foo"); sleep(1); } works fine,
> once I plug in the existing OCaml Xenstore and Netfront code, the
> behaviour I see is that the unikernel hangs in random places, blocking
> as if an event that should have been delivered has been missed.

You can see what is going on, event channel wise, with the 'e'
debug-key.  This will highlight cases such as the event channel being
masked and pending, which is a common guest bug ending up in this state.

>
> <snip>
> Given that I've essentially re-written the low-level event channel C
> code, I'd like to verify that the mechanisms I'm using for event
> delivery are indeed the right thing to do on PVHv2.
>
> For event delivery, I'm registering the upcall with Xen as follows:
>
>     uint64_t val = 32ULL;
>     val |= (uint64_t)HVM_PARAM_CALLBACK_TYPE_VECTOR << 56;
>     int rc = hypercall_hvm_set_param(HVM_PARAM_CALLBACK_IRQ, val);
>     assert(rc == 0);
>
> i.e. upcalls are to be delivered via IDT vector.

Don't use HVM_PARAM_CALLBACK_TYPE_VECTOR.  It is conceptually broken, as
it bypasses all queueing and IRR logic in the LAPIC.

At some point, I'm going to have to figure out a compatible way to deal
with all the guests still using this mechanism, because it is
incompatible with using hardware accelerated APIC support in
IvyBridge/Zen+ hardware.

Use HVMOP_set_evtchn_upcall_vector instead, which does the same thing,
but actually behaves like a real vector as far as the rest of the LAPIC
is concerned.

>
> Questions:
>
> 1. Being based on the Solo5 virtio code, the low-level setup code is
> doing the "usual" i8259 PIC setup, to remap the PIC IRQs to vectors 32
> and above. Should I be doing this initialisation for Xen PVH at all?
> I'm not interested in using the PIC for anything, and all interrupts
> will be delivered via Xen event channels.

PVH guests don't get a PIC by default.  Xen will just be swallowing all
your setup and doing nothing with it.

"plain" PVH guests also don't get an IO-APIC by default.  Unless you're
wanting to get PVH dom0 support working, (or PCI Passthrough in the
future), don't worry about the IO-APIC either.

>
> 2. Related to the above, the IRQ handler code is ACKing the interrupt
> after the handler runs. Should I be doing that? Does ACKing "IRQ" 0 on
> the PIC have any interactions with Xen's view of event
> channels/pending upcalls?

There's no PIC to begin with, but even then, talking to the PIC/IO-APIC
would only be correct for type INTX/GSI.

TYPE_VECTOR shouldn't have an ack at the LAPIC (it is this properly
which makes it incompatible with hardware acceleration), while
HVMOP_set_evtchn_upcall_vector should be acked at the LAPIC.

~Andrew

