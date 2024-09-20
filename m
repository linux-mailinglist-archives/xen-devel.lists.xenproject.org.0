Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8997A97D2CE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 10:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801050.1211070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZ78-0008Ij-1d; Fri, 20 Sep 2024 08:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801050.1211070; Fri, 20 Sep 2024 08:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZ77-0008HC-VF; Fri, 20 Sep 2024 08:35:41 +0000
Received: by outflank-mailman (input) for mailman id 801050;
 Fri, 20 Sep 2024 08:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1srZ76-0008H6-Su
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 08:35:40 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d82f9b-772b-11ef-a0b8-8be0dac302b0;
 Fri, 20 Sep 2024 10:35:39 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c40942358eso2919112a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 01:35:39 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb497adsm6878429a12.14.2024.09.20.01.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 01:35:38 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 50d82f9b-772b-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726821339; x=1727426139; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3enLkPgFmb20ihbW4zPdny3rCajDxByfv0+1F7QjMuc=;
        b=UqO0EBEHOskAfjhTUEq6bGfxrkEKCAsI/nMAjvrK/BMh6lBR049SXZU/ky03tA0UyG
         BAeuJHb8H1ZWtOM5MIAsbgle+wNeh03i+2InIfoKVtw+S1BU1l4jDZm3pmpat4vb0RWB
         1YAyFyjGo2r7oz9rngEwK5fCM0xMaGS6ZAWBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726821339; x=1727426139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3enLkPgFmb20ihbW4zPdny3rCajDxByfv0+1F7QjMuc=;
        b=a58c3mT52sDdxy6lsHD3XhtqJ0s+VRN+PJ99MeyR40Ug3cTXJVROyoVLeUiJdkKjxS
         wPPiPkubzuN4uUEN0HkCEvPderpPu2ipbMjHxf2vsS+ZXhhfqU+NoZ5XdpeeHc2GnxhP
         t8f/aYhrzqmpcPgwgnO27d8GSlHUAWwtd/Ym+atuaj9FXvSFOfZEzBYCeFL2xPHKKxgh
         3Q8BnpJV8ek/E7xHmOJ7UEiYrqzqbp480Qa+KOLtwF3DovzZt6bORVS50cuCJBP7k4+u
         PTCC4t6ZKM0R6ji/85V/NfbuLzcyimTLJnx/RgHRYuZcD2NIgCMHuBpiIwbJX07f9+Db
         tJPw==
X-Gm-Message-State: AOJu0Yw8RP//tFm8wIWp3ycmEy1glCqOGhoxUY4b5XDparhlwXXLH2v0
	/0WeyJz9qRFW5KUd3pmOnn0RKBfAioyLT4oeLOb0g3ljmFSLgUFSwgLvAxere6E=
X-Google-Smtp-Source: AGHT+IFYHCxD0LzPOBeAq1K7kksPpiVgxkmCsKasfVJG+N0tDKIXK/Ky4zxKDfQTBHVnLDrtmQmi5g==
X-Received: by 2002:a05:6402:2554:b0:5c4:2362:e40a with SMTP id 4fb4d7f45d1cf-5c4637e3496mr2116049a12.15.1726821338885;
        Fri, 20 Sep 2024 01:35:38 -0700 (PDT)
Date: Fri, 20 Sep 2024 10:35:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/shutdown: mask LVTERR ahead of offlining CPUs
Message-ID: <Zu0z2ZO7lwTklq19@macbook.local>
References: <20240919142748.43821-1-roger.pau@citrix.com>
 <7a6906a2-6860-4575-a88d-90be5ec43eee@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a6906a2-6860-4575-a88d-90be5ec43eee@citrix.com>

On Thu, Sep 19, 2024 at 10:19:49PM +0200, Andrew Cooper wrote:
> On 19/09/2024 4:27 pm, Roger Pau Monne wrote:
> > Leaving active interrupt sources targeting APIC IDs that are offline can be
> > problematic on AMD machines during shutdown.
> 
> What exactly qualifies as "offline" here?
> 
> We don't self-INIT, so I'm guessing we leave the APIC in some kind of
> disabled state, especially given ...

I would think it's the APIC software disabling done in the SVR
register.  Otherwise it might be such disabling, plus putting the CPU
in the hlt loop with interrupts disabled.

> >   This is due to AMD local APICs
> > reporting Receive Accept Errors when a message is not handled by any APIC on
> > the system.
> 
> ... this.
> 
> 
> >   Note Intel SDM states that Receive Accept Errors are only reported
> > on P6 family and Pentium processors.
> >
> > If at shutdown an active interrupt source is left targeting an offline APIC ID,
> > the following can be seen on AMD boxes:
> >
> > Hardware Dom0 shutdown: rebooting machine
> > APIC error on CPU0: 00(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > APIC error on CPU0: 08(08), Receive accept error
> > [...]
> >
> > Thus preventing the shutdown.  In the above case the interrupt source that was
> > left targeting an offline APIC ID was the serial console one
> 
> While masking LVTERR might allow more progress, it's not a wise approach.
> 
> The real issue here is that the UART driver is still active as we're
> trying to tear the system down.  If nothing else, it's rude to leave an
> active interrupt source for the kexec kernel to deal with.

While we could attempt to shutdown interrupts on the clean
shutdown/reboot paths, do we want to attempt doing the same on the
crash path?

There's an increased risk of further fallout and inability to jump
into the crash kernel as more logic is added to the hand-over path.

> IMO, we should shut the UART down like other devices, and move it back
> into polled mode.

Yeah, dealing with the UART should be doable, but we have no guarantee
that dom0 will have unmapped all interrupts it owns before shutdown,
much less when crashing.  So we could attempt to mitigate, but it's
possibly a non-trivial amount of logic to be added.

> > , so printing of
> > the local APIC ESR lead to more unhandled messages on the APIC bus, leaving the
> > host unable to make progress.
> 
> Minor note, but there's not been an APIC bus in decades.  Here, I'd
> simply say "lead to more console IRQs, and more errors".

I think some of the manuals that I have still mention the "APIC bus".

> >
> > Mask LVTERR ahead of bringing any CPU offline, thus avoiding receiving
> > interrupts for any APIC reported errors.  Note that other local APIC errors
> > will also be ignored.  At the point where the masking is done it's unlikely for
> > any reported APIC errors to be meaningful anyway, the system is about to reboot
> > or power off.
> >
> > The LVTERR masking could be limited to AMD, but there's no guarantee that in
> > the future Intel parts also start reporting the error, thus hitting the same
> > issue.  Unifying behavior across vendors when possible seems more desirable.
> > The local APIC gets wholesale disabled as part of offlining the CPUs and
> > bringing the system down in __stop_this_cpu().
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Note a similar issue possibly exists in the nmi_shootdown_cpus() path, however
> > that being a crash path it is more complicated to uniformly mask the LVTERR
> > strictly ahead of offlining CPUs.  That path is also more resilient AFAICT, as
> > nmi_shootdown_cpus() disables interrupts at the start (so no LVTERR interrupt
> > will be handled) and the CPUs are stopped using an NMI, which would bypass any
> > LVTERR processing.
> > ---
> >  xen/arch/x86/smp.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> > index 04c6a0572319..399ec7491ac6 100644
> > --- a/xen/arch/x86/smp.c
> > +++ b/xen/arch/x86/smp.c
> > @@ -348,6 +348,11 @@ static void cf_check stop_this_cpu(void *dummy)
> >          halt();
> >  }
> >  
> > +static void cf_check mask_lvterr(void *dummy)
> > +{
> > +    apic_write(APIC_LVTERR, ERROR_APIC_VECTOR | APIC_LVT_MASKED);
> > +}
> > +
> >  /*
> >   * Stop all CPUs and turn off local APICs and the IO-APIC, so other OSs see a 
> >   * clean IRQ state.
> > @@ -364,6 +369,18 @@ void smp_send_stop(void)
> >          fixup_irqs(cpumask_of(cpu), 0);
> >          local_irq_enable();
> >  
> > +        /*
> > +         * Mask the local APIC error vector ahead of stopping CPUs.
> > +         *
> > +         * On AMD the local APIC will report Receive Accept Errors if the
> > +         * destination APIC ID of an interrupt message is not online.  There's
> > +         * no guarantee that fixup_irqs() will evacuate all interrupts -
> > +         * possibly because the sole CPU remaining online doesn't have enough
> > +         * vectors to accommodate all.
> > +         */
> > +        smp_call_function(mask_lvterr, NULL, true);
> > +        mask_lvterr(NULL);
> > +
> >          smp_call_function(stop_this_cpu, NULL, 0);
> 
> Irrespective of the question over approach, stop_this_cpu() should end
> up clearing LVTERR.  Why doesn't that suffice?

No, because those are no ordered.  The sequence needs to strictly be:

 - Mask LVTERR on all CPUs.
 <wait for masking to be done uniformly>
 - Stop CPUs.

Otherwise CPUs might be stopped before LVTERR has been uniformly
masked, leading to Receive accept error reported on the CPUs that
don't yet have LVTERR masked.

Thanks, Roger.

