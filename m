Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4C1FCDA0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:45:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXQp-0000eR-8N; Wed, 17 Jun 2020 12:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x1tW=76=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1jlXQo-0000eM-Qa
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:44:42 +0000
X-Inumbo-ID: 4ffa9568-b098-11ea-bb8b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4ffa9568-b098-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592397881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcOIvyOd7fQsYITZLOHJF2/UCRXJ2YKpaTOVPdzzZqc=;
 b=jDNAm8tu/HCxKuK6WpzehvwWr1Yf0d2flT/t2M+wr6tWiclllBy6uaVOzUf7NcxCcgPQbt
 KkgH39pfArL3B2SqLC0n+ZqA2QcpZ5zpGygaQsYVw82zKjxRld/zHbPPVuBSsFqB0oMM6e
 csiCmcOSqlD7soxRSpb+yYeALmihTNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-rLJKltAtNA2KoiIUcSKVgA-1; Wed, 17 Jun 2020 08:44:33 -0400
X-MC-Unique: rLJKltAtNA2KoiIUcSKVgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B72181EE33;
 Wed, 17 Jun 2020 12:44:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-92.ams2.redhat.com
 [10.36.115.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB80A89261;
 Wed, 17 Jun 2020 12:44:29 +0000 (UTC)
Subject: Re: [PATCH] OvmfPkg: End timer interrupt later to avoid stack
 overflow under load
To: Igor Druzhinin <igor.druzhinin@citrix.com>, devel@edk2.groups.io,
 xen-devel <xen-devel@lists.xenproject.org>
References: <1592275782-9369-1-git-send-email-igor.druzhinin@citrix.com>
 <ee7d61de-ed38-acc4-1666-cd886d76cc14@redhat.com>
 <17ee2671-c44b-f3fb-43af-0a75f7d161fc@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <020a65b1-7923-e8d6-dd11-9325ee4e70c7@redhat.com>
Date: Wed, 17 Jun 2020 14:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <17ee2671-c44b-f3fb-43af-0a75f7d161fc@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: julien@xen.org, jordan.l.justen@intel.com, Ray Ni <ray.ni@intel.com>,
 ard.biesheuvel@arm.com, anthony.perard@citrix.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/17/20 05:16, Igor Druzhinin wrote:
> On 16/06/2020 19:42, Laszlo Ersek wrote
>> If I understand correctly, TimerInterruptHandler()
>> [OvmfPkg/8254TimerDxe/Timer.c] currently does the following:
>>
>> - RaiseTPL (TPL_HIGH_LEVEL) --> mask interrupts from being delivered
>>
>> - mLegacy8259->EndOfInterrupt() --> permit the PIC to generate further
>> interrupts (= make them pending)
>>
>> - RestoreTPL() --> unmask interrupts (allow delivery)
>>
>> RestoreTPL() is always expected to invoke handlers (on its own stack)
>> that have just been unmasked, so that behavior is not unexpected, in my
>> opinion.
> 
> Yes, this is where I'd like to have a confirmation - opening a window
> for uncontrollable number of nested interrupts with a small stack
> looks dangerous.

Sorry, I meant the above more generally. The sentence

  RestoreTPL() is always expected to invoke handlers (on its own stack)
  that have just been unmasked

doesn't only refer to actual timer hardware interrupts (in connection to
TPL_HGIH_LEVEL), but also to invoking event notification functions that
have been queued while running at the raised TPL.

Quoting "EFI_BOOT_SERVICES.CreateEvent()" from the spec:

    Events exist in one of two states, “waiting” or “signaled.” When an
    event is created, firmware puts it in the “waiting” state. When the
    event is signaled, firmware changes its state to “signaled” and, if
    EVT_NOTIFY_SIGNAL is specified, places a call to its notification
    function in a FIFO queue. There is a queue for each of the “basic”
    task priority levels defined in Section 7.1 (TPL_CALLBACK, and
    TPL_NOTIFY). The functions in these queues are invoked in FIFO
    order, starting with the highest priority level queue and proceeding
    to the lowest priority queue that is unmasked by the current TPL. If
    the current TPL is equal to or greater than the queued notification,
    it will wait until the TPL is lowered via
    EFI_BOOT_SERVICES.RestoreTPL().

In practice, when the event is signaled, and the current TPL is not
masking the TPL of the associated notify function, then the notify
function is called internally to signaling the event. Otherwise, if the
unmasking occurs via RestoreTPL(), then the queued notification
functions are invoked on the stack of RestoreTPL() -- in other words,
internally to the RestoreTPL() function call itself.

So all I meant was that notification functions running internally to
RestoreTPL() was by design.

What's unexpected is the "uncontrollable number" of nested interrupts.

> 
>> What seems unexpected is the queueing of a huge number of timer
>> interrupts. I would think a timer interrupt is either pending or not
>> pending (i.e. if it's already pending, then the next generated interrupt
>> is coalesced, not queued). While there would still be a window between
>> the EOI and the unmasking, I don't think it would normally allow for a
>> *huge* number of queued interrupts (and consequently a stack overflow).
> 
> It's not a window between EOI and unmasking but the very fact vCPU is 
> descheduled for a considerable amount of time that causes backlog of
> timer interrupts to build up. This is Xen default behavior and is
> configurable (there are several timer modes including coalescing
> you mention). That is done for compatibility with some guests basing
> time accounting on the number of periodic interrupts they receive.

OK, thanks for explaining.

> 
>> So I basically see the root of the problem in the interrupts being
>> queued rather than coalesced. I'm pretty unfamiliar with this x86 area
>> (= the 8259 PIC in general), but the following wiki article seems to
>> agree with my suspicion:
>>
>> https://wiki.osdev.org/8259_PIC#How_does_the_8259_PIC_chip_work.3F
>>
>>     [...] and whether there's an interrupt already pending. If the
>>     channel is unmasked and there's no interrupt pending, the PIC will
>>     raise the interrupt line [...]
>>
>> Can we say that the interrupt queueing (as opposed to coalescing) is a
>> Xen issue?
> 
> I can admit that the whole issue might be Xen specific if that form
> of timer mode is not used in QEMU-KVM. What mode is typical there
> then?

That question is too difficult for me to answer :(

> We might consider switching Xen to a different mode if so, as I believe
> those guests are not in support for many years.

Can you perhaps test this hypothesis? If you select the coalescing timer
mode for the Xen guest in question, does the symptom go away?

> 
>> (Hmmm... maybe the hypervisor *has* to queue the timer interrupts,
>> otherwise some of them would simply be lost, and the guest would lose
>> track of time.)
>>
>> Either way, I'm not sure what the best approach is. This driver was
>> moved under OvmfPkg from PcAtChipsetPkg in commit 1a3ffdff82e6
>> ("OvmfPkg: Copy 8254TimerDxe driver from PcAtChipsetPkg", 2019-04-11).
>> HpetTimerDxe also lives under PcAtChipsetPkg.
>>
>> So I think I'll have to rely on the expertise of Ray here (CC'd).
> 
> Also note that since the issue might be Xen specific we might want to
> try to fix it in XenTimer only - I modified 8254Timer due to the
> fact Xen is still present in general config (but that should soon
> go away).

We could also modify 8254TimerDxe like this:

- provide the new variant of the TimerInterruptHandler() function for
Xen only, without touching the existent one -- simply introduce it as a
new function,

- in TimerDriverInitialize(), first call XenDetected() from
XenPlatformLib, then choose the argument for the
mCpu->RegisterInterruptHandler() call accordingly.

This wouldn't be difficult to locate and revert when
<https://bugzilla.tianocore.org/show_bug.cgi?id=2122> is addressed. (It
would be easy to find by grepping for XenDetected().)

[...]

Thanks!
Laszlo


