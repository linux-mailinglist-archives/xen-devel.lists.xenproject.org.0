Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E581F9C50
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:52:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrOt-000274-T3; Mon, 15 Jun 2020 15:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=74UO=74=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jkrOs-00026z-OK
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:51:54 +0000
X-Inumbo-ID: 21272040-af20-11ea-bb8b-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21272040-af20-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 15:51:53 +0000 (UTC)
Received: from webmail.moloch.sk (w3-s.a.lucina.net [62.176.169.73])
 by smtp.lucina.net (Postfix) with ESMTPSA id 6DDC5122804;
 Mon, 15 Jun 2020 17:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1592236311;
 bh=/FpB91+u9v9wBFgEkB147d5HxiDmF56rYU3flrWJCVU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kTh5y8BamtZt5tmZe83ebu+xnp6Dw+TZROg6BfUYP6g3hQqNHcuiKAmXSyCpFZKL6
 8DuuaJeq8IZ2UYPEhhRstwyNWoMO086F+wrr91b0++VqNUvyHVa7IXmhFoC7Ewo5ei
 fKadqJ9IsNk1XUfYwIVBQ9gmhH0nr3DiSLnCveAH4Gz/yEOcSkmpnSuj1UzvefBEdX
 e/6R2DunG5goRu/VttgSD7zEoDtc8NN0fXX1RcGKLr89iLQSeue6sScfi4m1WpUbWi
 RMWMfhuS413z8TrQnZ4y0MtC+XXzpM7rJhpC+yoFOMn27opZYxZovCYeJ4g9ONJvGK
 YszBJCPolTJ/A==
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 15 Jun 2020 17:51:51 +0200
From: Martin Lucina <martin@lucina.net>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: Event delivery and "domain blocking" on PVHv2
In-Reply-To: <20200615150344.GG735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <20200615150344.GG735@Air-de-Roger>
Message-ID: <4a0bb4fa4dca2732feae4e2f825eb2a6@lucina.net>
X-Sender: martin@lucina.net
User-Agent: Roundcube Webmail/1.3.3
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

On 2020-06-15 17:03, Roger Pau Monné wrote:
> This way of event channel injection is slitgly hackish, and I would
> recommend using HVMOP_set_evtchn_upcall_vector, that way vectors will
> be properly routed using the lapic.
> 
> Using HVM_PARAM_CALLBACK_TYPE_VECTOR vectors are injected without
> setting the IRR/ISR bit in the lapic registers.

I picked HVM_PARAM_CALLBACK_TYPE_VECTOR since that seemed like the 
easiest option for a uniprocessor, PVH-only guest.

What does <vector> mean in the context of 
HVMOP_set_evtchn_upcall_vector? If it's an APIC vector number (sorry, 
not too familiar with the post-legacy i8259 world), does that imply that 
if I use HVMOP_set_evtchn_upcall_vector I need to do some APIC 
initialisation / programming?

All I need for Solo5/Mirage purposes is to have the upcall land on IDT 
vector #32 or above.

> 
>> Questions:
>> 
>> 1. Being based on the Solo5 virtio code, the low-level setup code is 
>> doing
>> the "usual" i8259 PIC setup, to remap the PIC IRQs to vectors 32 and 
>> above.
>> Should I be doing this initialisation for Xen PVH at all?
> 
> Hm, there are no IO-APICs (or legacy PICs) on a PVH domU, so there's
> not much to route. If Solo5 is thinking it's somehow configuring them
> it's likely writing to some hole in memory, or to some RAM.

Solo5 only has a very primitive understanding of hardware interrupts, so 
it's only configuring the legacy PICs via port IO.

> 
> IO-APIC presence is signaled on the ACPI MADT table on PVH domU.
> 

Hmm, it'd be very unfortunate if I had to deal with ACPI, so here's 
hoping that I don't actually need to touch the APIC.

>> I'm not interested
>> in using the PIC for anything, and all interrupts will be delivered 
>> via Xen
>> event channels.
>> 
>> 2. Related to the above, the IRQ handler code is ACKing the interrupt 
>> after
>> the handler runs. Should I be doing that? Does ACKing "IRQ" 0 on the 
>> PIC
>> have any interactions with Xen's view of event channels/pending 
>> upcalls?
> 
> Which kind of ACking it's doing? Is it writing to the lapic EOI
> register? If so that would be OK when using
> HVMOP_set_evtchn_upcall_vector. If using
> HVM_PARAM_CALLBACK_TYPE_VECTOR there's nothing to Ack I think.

Legacy PIC EOI via port IO.

> 
>> Next, for a PVHv2, uniprocessor only guest, is the following flow 
>> sufficient
>> to unmask an event channel?
>> 
>>     struct shared_info *s = SHARED_INFO();
>>     int pending = 0;
>> 
>>     atomic_sync_btc(port, &s->evtchn_mask[0]);
>>     pending = sync_bt(port, &s->evtchn_mask[0]);
> 
> You should check for pending interrupts on evtchn_pending, not
> evtchn_mask.

Ah, thanks for spotting that! Fixed, but just that change by itself does 
not seem to change the observed behaviour in any way.

> 
>>     if (pending) {
>>         /*
>>          * Slow path:
>>          *
>>          * If pending is set here, then there was a race, and we lost 
>> the
>>          * upcall.  Mask the port again and force an upcall via a call 
>> to
>>          * hyperspace.
>>          *
>>          * This should be sufficient for HVM/PVHv2 based on my 
>> understanding
>> of
>>          * Linux drivers/xen/events/events_2l.c.
>>          */
>>         atomic_sync_bts(port, &s->evtchn_mask[0]);
>>         hypercall_evtchn_unmask(port);
>>     }
> 
> FWIW, I use the hypercall unconditionally on FreeBSD because I didn't
> see a performance difference when compared to this method.
> 
>> Lastly, the old PV-only Mini-OS based stack would do delays ("block 
>> the
>> domain") by doing a HYPERVISOR_set_timer_op(deadline) followed by a
>> HYPERVISOR_sched_op(SCHEDOP_block,0 ). In the new code, I'm doing the
>> following (based on what Mini-OS seems to be doing for HVM):
>> 
>>     solo5_time_t deadline = Int64_val(v_deadline);
>> 
>>     if (solo5_clock_monotonic() < deadline) {
>>         hypercall_set_timer_op(deadline);
>>         __asm__ __volatile__ ("hlt" : : : "memory");
>>         /* XXX: cancel timer_op here if woken up early? */
>>     }
>> 
>> Again, is this the right thing to do for PVH?
> 
> hlt will trap into the hypervisor, so it's fine to use.
> 

Thanks for confirming.

>> As the comment says, do I need to cancel the timer_op?
> 
> I'm not sure. Keep in mind that a new call to hypercall_set_timer_op
> will overwrite the previous timer, and hence should be fine I think as
> long as you are using the one-shot timer.

Is there something other than a one-shot timer? hypercall_set_timer_op 
is just a single-argument hypercall with an uint64_t deadline, right? 
(And not documented in xen.h either ...)

> 
>> I understood the
>> semantics to be "fire once at/after the time deadline is reached", if 
>> that
>> is indeed the case then with my current VIRQ_TIMER handler which does
>> nothing in the interrupt context and has no side effects I should be 
>> fine.
> 
> I have no idea how Solo5 works, maybe you should re-set the timer to
> the next deadline in the handler?
> 
> Or that's fine because the timer is always set before blocking.

Yes, it's always set before blocking, and we always unblock after the 
first interrupt (i.e. some event) is received, so should be fine.

> 
>> I can also post the code that does the actual demuxing of events from 
>> Xen
>> (i.e. the upcall handler), but I've read through that several times 
>> now and
>> I don't think the problem is there; adding diagnostic prints to both 
>> the
>> low-level C event channel code and higher-level OCaml Activations code
>> confirms that received events are being mapped to their ports 
>> correctly.
> 
> I can take a look at the event channel handler if you want, as you
> wish. The only weird think I've noticed is the error in the unmask
> where you seem to use evtchn_mask instead of evtchn_pending.

Thanks for the offer, this stuff is fairly subtle.

In the Mirage/Xen scenario, there are two parts to the upcall handler. 
The top half is executed in interrupt context and basically does nothing 
except acknowledge the upcall:

int solo5__xen_evtchn_vector_handler(void *arg __attribute__((unused)))
{
     struct vcpu_info *vi = VCPU0_INFO();

     /*
      * All work is done outside of interrupt context by 
evtchn_demux_pending(),
      * so all we need to do here is acknowledge the upcall from Xen.
      */
     vi->evtchn_upcall_pending = 0;
     return 1;
}

The bottom half is then called periodically (and always before blocking) 
by the OCaml code:

static bool evtchn_demux_pending(void)
{
     struct shared_info *s = SHARED_INFO();
     struct vcpu_info *vi = VCPU0_INFO();
     bool some_pending = false;

     vi->evtchn_upcall_pending = 0;

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

         /*
          * Masking pending_l2 with ~evtchn_mask[l1i] is necessary to get 
the
          * *current* masked events; otherwise races like the following
          * can occur:
          *
          *     1. X is generated, upcall scheduled by Xen.
          *     2. X is masked.
          *     3. Upcall is delivered.
          *     4. X fires despite now being masked.
          */
         while ((pending_l2 =
                     (s->evtchn_pending[l1i] & ~s->evtchn_mask[l1i])) != 
0) {
             xen_ulong_t l2i = ffs(pending_l2);

             evtchn_port_t port = (l1i * (sizeof(xen_ulong_t) * 8)) + 
l2i;
             /*
              * Mark as pending on the OCaml side.
              */
             evtchn_callback_ml[port] = 1;
             some_pending = true;

             atomic_sync_btc(l2i, &s->evtchn_pending[l1i]);
         }

         pending_l1 &= ~(1UL << l1i);
     }

     return some_pending;
}

> 
> I would also recommend using HVMOP_set_evtchn_upcall_vector instead of
> HVM_PARAM_CALLBACK_TYPE_VECTOR. In order to make some tools happy just
> set HVM_PARAM_CALLBACK_TYPE_VECTOR to 1. You can take a look at how
> Xen does it when running as a guest:
> 
> http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/x86/guest/xen/xen.c;h=2ff63d370a8a12fef166677e2ded7ed82a628ce8;hb=HEAD#l205

Thanks for the pointer. As I write above, if I can use 
HVMOP_set_evtchn_upcall_vector w/o doing too much "extra work" on the 
guest side then I will go with that.

> 
> Roger.

-mato

