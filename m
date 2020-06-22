Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C97203AF1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 17:31:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnOPZ-0003Xw-9w; Mon, 22 Jun 2020 15:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m+g9=AD=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jnOPX-0003X1-Su
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 15:31:04 +0000
X-Inumbo-ID: 60416c0e-b49d-11ea-bca7-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60416c0e-b49d-11ea-bca7-bc764e2007e4;
 Mon, 22 Jun 2020 15:31:01 +0000 (UTC)
Received: from webmail.moloch.sk (w3-s.a.lucina.net [62.176.169.73])
 by smtp.lucina.net (Postfix) with ESMTPSA id 2B5BA122804;
 Mon, 22 Jun 2020 17:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1592839860;
 bh=Xws8g1Wi5dE+ZjqV+LiybhYjyilm/86GEW8v+QkfRc4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pnLlAt8Do/2GfKL/HAydudr90+ZlKTYedk1C+x8MHzL7kIkx6dvtQC+5eJKDqQG64
 3hX1OUCi3hgX/4ZbWmnq2e4mlw8XR0rn87KW2c9sfo5JLObxYf/VdkkdZwsBLEO6F4
 cLxMpoIXApI2U87il2HjNj5Z+nD4pSc1fen+3IA9OJeH6b6Shugx0PId04RnY7vOEW
 GmpyQptkfw64HDbSFgopbszgq6rXhAIMywSGDsFXA02mlFm4vlyjBNdtacgJa2uigp
 041BCTREpK2FXfdqmO/nk0zpKVxEF6atSVqfcfHKT5EF8nbkDz+nzSsR7jDXMcZy6C
 7PymPZbi1Altw==
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 22 Jun 2020 17:31:00 +0200
From: Martin Lucina <martin@lucina.net>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: Event delivery and "domain blocking" on PVHv2
In-Reply-To: <20200622135853.GK735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
 <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
 <20200619112119.GY735@Air-de-Roger>
 <ab26d419909c1fb038b32024d457871c@lucina.net>
 <20200619165426.GD735@Air-de-Roger> <20200619174143.GE735@Air-de-Roger>
 <7ed4a5f98b3002f3233e02d5ce803ef0@lucina.net>
 <20200622135853.GK735@Air-de-Roger>
Message-ID: <745e4ac251b146480b2c6d6afbf5f34a@lucina.net>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-22 15:58, Roger Pau Monné wrote:
> On Mon, Jun 22, 2020 at 12:58:37PM +0200, Martin Lucina wrote:
>> Aha! Thank you for pointing this out. I think you may be right, but 
>> this
>> should be possible without doing the demuxing in interrupt context.
> 
> If you don't do the demuxing in the interrupt context (ie: making the
> interrupt handler a noop), then you don't likely need such interrupt
> anyway?

I need the/an interrupt to wake the VCPU from HLT state if we went to 
sleep.

> 
>> How about this arrangement, which appears to work for me; no hangs I 
>> can see
>> so far and domU survives ping -f fine with no packet loss:
>> 
>> CAMLprim value
>> mirage_xen_evtchn_block_domain(value v_deadline)
>> {
>>     struct vcpu_info *vi = VCPU0_INFO();
>>     solo5_time_t deadline = Int64_val(v_deadline);
>> 
>>     if (solo5_clock_monotonic() < deadline) {
>>         __asm__ __volatile__ ("cli" : : : "memory");
>>         if (vi->evtchn_upcall_pending) {
>>             __asm__ __volatile__ ("sti");
>>         }
>>         else {
>>             hypercall_set_timer_op(deadline);
> 
> What if you set a deadline so close that evtchn_upcall_pending gets
> set by Xen here and the interrupt is injected? You would execute the
> noop handler and just hlt, and could likely end up in the same blocked
> situation as before?

Why would an interrupt be injected here? Doesn't the immediately 
preceding
"cli" disable that?

Or perhaps I need to do a PV/HVM hybrid and set vi->evtchn_upcall_mask 
just
before the cli, and clear it after the sti?

>> i.e. Always go to sleep with interrupts disabled, but before doing so
>> re-check that no events have become pending since the last time
>> evtchn_demux_pending() was called. This holds, since the only thing 
>> that
>> sets vi->evtchn_upcall_pending is Xen, and the only thing that clears 
>> it is
>> evtchn_demux_pending().
>> 
>> Right?
> 
> TBH this is a hard model to get right, I think your best bet at
> attempting something along this lines is to forget about using the
> event channel interrupt and instead use SCHEDOP_poll. You could do
> something like (written in pure C as I have no idea of the ocaml
> bindings):
> [SCHEDOP_poll code snipped]

Thanks for the suggestion. This brings us full-circle -- I found [1] and
[2] way back from 2013 when Mirage/Xen was initially using SCHEDOP_poll
and then switched to the current interrupts + SCHEDOP_block approach.

Part of the motivation for the change at the time was to allow waiting
on/servicing more than 128 ports (the limit for SCHEDOP_poll). I doubt
anyone wants to do that these days, but it still makes me a bit 
reluctant
to change back to SCHEDOP_poll.

>> In an attempt to understand why the original PV code worked I re-read 
>> the PV
>> Mini-OS block_domain code again and realised that I had entirely 
>> missed one
>> part of its behaviour, which is that it intends[*] to run with
>> interrupts/upcalls disabled *all* the time and relies on SCHEDOP_block
>> atomically re-enabling them and triggering an upcall before returning 
>> (PV)
>> or "briefly enabling interrupts to allow handlers to run" (HVM). We're 
>> doing
>> the inverse, but our behaviour matches my mental model of how things 
>> should
>> work.
> 
> Not really IMO, as SCHEDOP_block is a single 'instruction' from a
> guest PoV that does the enabling of interrupts and returns if there
> are pending ones.

Indeed and this is exactly the operation I need in the HVM world with 
the
current model.

> Also SCHEDOP_block is not exactly the same on HVM, as it just checks
> for pending vectors to inject, but not for pending event channels.

... well, I don't want to use SCHEDOP_block anyway since that is not 
possible
on ARM, and I would like to keep the code at least "portable with not 
too
much effort". So there should be a non-racy "HVM way" to do this?

> HVM you cannot call hlt with interrupts disabled, or the vCPU will be
> taken down.
> 
> There are quite a lot of subtle differences between PV and HVM in this
> regard, and I think the best approach would be to use SCHEDOP_poll in
> order to implement the kind of model you describe.

I can see that now. The interactions between the "virtual hardware"
(interrupt delivery, VCPU IF) and "PV" parts (event delivery, masking) 
are
hard to understand for me, yet the two are intertwined in the way HVM
works :-(

Coming back to your earlier suggestion of moving the event demuxing (but 
not
the handling) into the upcall interrupt handler itself, perhaps that 
approach
is still worth investigating in combination with re-working the OCaml 
side array
view of pending events, or at least ensuring that atomic operations are 
used
since it would now be updated asynchronously.

Martin

[1] 
https://lists.cam.ac.uk/pipermail/cl-mirage/2013-September/msg00053.html
[2] https://github.com/mirage/mirage-platform/pull/58

