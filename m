Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8FF1FC490
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 05:17:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlOZ7-0008Hw-Bx; Wed, 17 Jun 2020 03:16:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zn23=76=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jlOZ5-0008Hr-W4
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 03:16:40 +0000
X-Inumbo-ID: f4eb053a-b048-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4eb053a-b048-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 03:16:38 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uQjg1G0HvWxXWfGi5qH+NbnaYb7nco842zSXOWROgXsraU0tqCAnSMctSOGz8ZWTnN6Sre2lyY
 ShwG2mKWSKGsRkivYDUisV0EFyZkEQhIXs5C//Y+K2puS2TC3L1Aqeh6tOZr1vZFSsucHcImel
 OExCxLoTaRumjDNqRxUvX1F8MqUB54+IK6UTH9I5LES+ykWuTjHiW2LHocFN/b9hv6eKel4ELr
 SPRHCSqwVjEjv2xp7QifZk5E+hNxTYKkV0qrqhlk79gHDWP7E0VEtcarQGt10UJdSCvElT47NY
 HE4=
X-SBRS: 2.7
X-MesageID: 20575272
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,521,1583211600"; d="scan'208";a="20575272"
Subject: Re: [PATCH] OvmfPkg: End timer interrupt later to avoid stack
 overflow under load
To: Laszlo Ersek <lersek@redhat.com>, <devel@edk2.groups.io>, xen-devel
 <xen-devel@lists.xenproject.org>
References: <1592275782-9369-1-git-send-email-igor.druzhinin@citrix.com>
 <ee7d61de-ed38-acc4-1666-cd886d76cc14@redhat.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <17ee2671-c44b-f3fb-43af-0a75f7d161fc@citrix.com>
Date: Wed, 17 Jun 2020 04:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ee7d61de-ed38-acc4-1666-cd886d76cc14@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 16/06/2020 19:42, Laszlo Ersek wrote
> If I understand correctly, TimerInterruptHandler()
> [OvmfPkg/8254TimerDxe/Timer.c] currently does the following:
> 
> - RaiseTPL (TPL_HIGH_LEVEL) --> mask interrupts from being delivered
> 
> - mLegacy8259->EndOfInterrupt() --> permit the PIC to generate further
> interrupts (= make them pending)
> 
> - RestoreTPL() --> unmask interrupts (allow delivery)
> 
> RestoreTPL() is always expected to invoke handlers (on its own stack)
> that have just been unmasked, so that behavior is not unexpected, in my
> opinion.

Yes, this is where I'd like to have a confirmation - opening a window
for uncontrollable number of nested interrupts with a small stack
looks dangerous.

> What seems unexpected is the queueing of a huge number of timer
> interrupts. I would think a timer interrupt is either pending or not
> pending (i.e. if it's already pending, then the next generated interrupt
> is coalesced, not queued). While there would still be a window between
> the EOI and the unmasking, I don't think it would normally allow for a
> *huge* number of queued interrupts (and consequently a stack overflow).

It's not a window between EOI and unmasking but the very fact vCPU is 
descheduled for a considerable amount of time that causes backlog of
timer interrupts to build up. This is Xen default behavior and is
configurable (there are several timer modes including coalescing
you mention). That is done for compatibility with some guests basing
time accounting on the number of periodic interrupts they receive.

> So I basically see the root of the problem in the interrupts being
> queued rather than coalesced. I'm pretty unfamiliar with this x86 area
> (= the 8259 PIC in general), but the following wiki article seems to
> agree with my suspicion:
> 
> https://wiki.osdev.org/8259_PIC#How_does_the_8259_PIC_chip_work.3F
> 
>     [...] and whether there's an interrupt already pending. If the
>     channel is unmasked and there's no interrupt pending, the PIC will
>     raise the interrupt line [...]
> 
> Can we say that the interrupt queueing (as opposed to coalescing) is a
> Xen issue?

I can admit that the whole issue might be Xen specific if that form
of timer mode is not used in QEMU-KVM. What mode is typical there
then? We might consider switching Xen to a different mode if so, as I believe
those guests are not in support for many years.

> (Hmmm... maybe the hypervisor *has* to queue the timer interrupts,
> otherwise some of them would simply be lost, and the guest would lose
> track of time.)
> 
> Either way, I'm not sure what the best approach is. This driver was
> moved under OvmfPkg from PcAtChipsetPkg in commit 1a3ffdff82e6
> ("OvmfPkg: Copy 8254TimerDxe driver from PcAtChipsetPkg", 2019-04-11).
> HpetTimerDxe also lives under PcAtChipsetPkg.
> 
> So I think I'll have to rely on the expertise of Ray here (CC'd).

Also note that since the issue might be Xen specific we might want to
try to fix it in XenTimer only - I modified 8254Timer due to the
fact Xen is still present in general config (but that should soon
go away).

> Also, I recall a recent-ish QEMU commit that seems vaguely related
> (i.e., to timer interrupt coalescing -- see 7a3e29b12f5a, "mc146818rtc:
> fix timer interrupt reinjection again", 2019-11-19), so I'm CC'ing Paolo
> too.

Hmm that looks more like a RTC implementation specific issue.

> Some more comments / questions below:
> 
>>
>> diff --git a/OvmfPkg/8254TimerDxe/Timer.c b/OvmfPkg/8254TimerDxe/Timer.c
>> index 67e22f5..fd1691b 100644
>> --- a/OvmfPkg/8254TimerDxe/Timer.c
>> +++ b/OvmfPkg/8254TimerDxe/Timer.c
>> @@ -79,8 +79,6 @@ TimerInterruptHandler (
>>  
>>    OriginalTPL = gBS->RaiseTPL (TPL_HIGH_LEVEL);
>>  
>> -  mLegacy8259->EndOfInterrupt (mLegacy8259, Efi8259Irq0);
>> -
>>    if (mTimerNotifyFunction != NULL) {
>>      //
>>      // @bug : This does not handle missed timer interrupts
>> @@ -89,6 +87,9 @@ TimerInterruptHandler (
>>    }
>>  
>>    gBS->RestoreTPL (OriginalTPL);
>> +
>> +  DisableInterrupts ();
>> +  mLegacy8259->EndOfInterrupt (mLegacy8259, Efi8259Irq0);
>>  }
> 
> So this briefly (temporarily) unmasks interrupt delivery (between
> RestoreTPL() and DisableInterrupts()) while the PIC is still blocked
> from generating more, and then unblocks the PIC.
> 
> It looks plausible for preventing the unbounded recursion per se, but
> why is it safe to leave the function with interrupts disabled? Before
> the patch, that didn't use to be the case.

Quickly looking through the code it appears to me the first thing that
caller does after interrupt handler - it clears interrupt flag to make
sure those disabled. So I don't see any assumption that interrupts should
be enabled on exiting. But I might not know about all of the possible
combinations here.

Igor

