Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF46982F1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 19:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496188.766800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMCQ-0004mr-Tx; Wed, 15 Feb 2023 18:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496188.766800; Wed, 15 Feb 2023 18:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMCQ-0004ju-Qt; Wed, 15 Feb 2023 18:08:10 +0000
Received: by outflank-mailman (input) for mailman id 496188;
 Wed, 15 Feb 2023 18:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UCaW=6L=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pSMCP-0004jo-3s
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 18:08:09 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2bc2235-ad5b-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 19:08:07 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id bt8so18286598edb.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 10:08:07 -0800 (PST)
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
X-Inumbo-ID: b2bc2235-ad5b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rfo9n75pz9SXUCjFvDYPZtqowRHklY7r4BP2Nl6nvF4=;
        b=QodiedvxfbKgwcnV+lCSYQLjL9wl+OkUgr1Pvx6Ag5wWrvHhpwIa193IymTz0G9jLA
         oK8E7ygD2HIpujqJo/+dLGpE93ZjWs7R8T5UvDx45aOsT2pdmB9aMi9CtMxEEZ3myNq5
         Tl3vY+LNFjd6ltBTbLjdlvqb8lPN0gi1p67jFS87UfGoThM23c4JvSYwORaNHkIfnwuR
         kmHjIRUf90NuknaiB1CBNEBOAm1cshW0SRq5ip9nR50CRxirIGdGOUfTvsnHj71C/8rx
         5fVDiPYbSI6tvxYRFs7WIlhAafZ0Om4lhAZpxwaJwnzIdmFjhCT8FfrVhMX3ts5WMefp
         dMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfo9n75pz9SXUCjFvDYPZtqowRHklY7r4BP2Nl6nvF4=;
        b=NssB5hsnyNfHe88yMMqfMENgRmr8mLpK7dCaWVhHF8lPCpi5/lsSxxKmEHT2/ExG+Z
         Pb3dFvNYiqIg/ScSGDT4gNI8OsgmqRB+JLo0NIb603EjJ/H9ouuYenSH307OCjR39wyh
         n/Dz0BUGiTPol58UpKuYheo1gmsoUR7LW6YLLw732FmSUqKzbfFbNWdAz3t1Yz+ch3BT
         fVE49z8ww5/AZ4UedqQXnzkKk+N4tLMvPvJfVtZ2Le0AwergKCC8Q2RRLbNgJP0GzPzf
         /zQSI0sJRgtnNhXzlqfFzJeh0IiW4N0W6RXrU+UL5XyLUyQ3IHsdpb8tx8nTVHGoXooU
         chGA==
X-Gm-Message-State: AO0yUKWSKR2c0L8WGm8fF+GOQPQvhG52Vm9uz+MHLmGKBwiKbDWX8QxW
	y5rJIg8ChmyVHtsDwZrfyFFoPxGgnMH32w7uM1NA5iLiuFE=
X-Google-Smtp-Source: AK7set8dYhSa0KghXhYcoO0WDY9BKyhyHVZQzSpdC0QKKpaoRiPUzzgo4BtIu6rbFf47E/kSg0k5VOjN9QriD4Rjt4k=
X-Received: by 2002:a50:d717:0:b0:4ac:b6bc:87b7 with SMTP id
 t23-20020a50d717000000b004acb6bc87b7mr1630183edi.1.1676484486655; Wed, 15 Feb
 2023 10:08:06 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xptjWKXYeUX2yua6nsSnJOwOWOfU3TBxEQ8YC1tewvHJkQ@mail.gmail.com>
 <2981ceec-030f-12cb-4b86-b7fc1bc928fd@suse.com>
In-Reply-To: <2981ceec-030f-12cb-4b86-b7fc1bc928fd@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 15 Feb 2023 13:07:54 -0500
Message-ID: <CAKf6xpu5bJnCCCD2xAAfhhYZ0WB8Zv4Y79OQOuUpE44j99DSCw@mail.gmail.com>
Subject: Re: HWP and ACPI workarounds
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 4:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.02.2023 20:04, Jason Andryuk wrote:
> > Qubes recently incorporated my HWP patches, but there was a report of
> > a laptop, Thinkpad X1 Carbon Gen 4 with a Skylake processor, locking
> > up during boot when HWP is enabled.  A user found a kernel bug that
> > seems to be the same issue:
> > https://bugzilla.kernel.org/show_bug.cgi?id=110941.
> >
> > That bug was fixed by Linux commit a21211672c9a ("ACPI / processor:
> > Request native thermal interrupt handling via _OSC").  The commit
> > message has a good summary of the issue and is included at the end of
> > this message.  The tl;dr is SMM crashes when it receives thermal
> > interrupts, so Linux calls the ACPI _OSC method to take over interrupt
> > handling.
> >
> > Today, Linux calls the _OSC method when boot_cpu_has(X86_FEATURE_HWP),
> > but that is not exposed to the PV Dom0.  As a test, the Qubes user was
> > able to boot with the check expanded to `boot_cpu_has(X86_FEATURE_HWP)
> > || xen_initial_domain()`.
> >
> > We need some way for Xen to indicate the presence and/or use of HWP to
> > Dom0, and Dom0 needs to use that to call _OSC.
> >
> > My first idea is that Dom0 could query Xen's cpufreq driver.  However,
> > Xen exposes the cpufreq driver through the unstable sysctl ops, and
> > using an unstable hypercall seems wrong for the kernel.
> >
> > Can we add something to an existing hypercall - maybe platform_op?  Or
> > do we need a new stable hypercall?
> >
> > Linux will perform the _OSC calls unilaterally upon seeing FEATURE_HWP
> > and independent of actually using HWP via the intel_pstate driver.
> > However, not using HWP may be an untested configuration in practice.
> > The intel_pstate.c driver will not use HWP when FEATURE_HWP_EPP is not
> > found.  So we could potentially cheat and expose only HWP to Dom0.
> > That should trigger the _OSC calls without letting Dom0 think it can
> > use HWP.  This is rather fragile though, so a more explicity method
> > seems better.
>
> I agree with the "fragile" aspect, but I'd also like to point out that
> no matter what features we expose in CPUID the driver should never try
> to take control when running under Xen (or perhaps more generally when
> running virtualized).

The intel_pstate driver doesn't have any check for running virtualized.

> > Roger's ACPI Processor patches that add xen_sanitize_pdc calls could
> > be leveraged.  On the Xen side, arch_acpi_set_pdc_bits() could be
> > extended to set bit 12, which would then be passed to the evaluate
> > _PDC call. _PDC is the older interface superseded by _OSC, but they
> > can be wrappers around the same implementation.  But if linux is just
> > using _OSC, it seems more compatible to follow that implementation.
>
> Using the _PDC bit would look quite reasonable to me. Yet what's
> unclear to me is whether by the last sentence you actually mean to
> indicate that you're not in favor of doing so (in which case more work
> in Xen would likely be needed to actually support enough of _OSC).

I was trying to make a statement about mimicking others' behaviour.  I
haven't tested using _PDC vs. _OSC.  The Intel ACPI Processor guidance
defines the bits the same for the two methods, so either should work.
It was more of a concern that while it "should" work, we don't know if
we'll hit corner cases.  Since Linux is running fine calling _OSC for
this purpose, we know it's been tested.  Having dom0 use _PDC is
untested.

I mention _PDC and _OSC being wrappers around the same implementation,
but that isn't necessarily true.  The Intel ACPI Processor guidance
defines the bits the same way for the two methods, so it should work.
But, again, it's untested.

In the ACPI Processor thread, Rafael J. Wysocki wrote: "Sorry for
joining late, but first off _PDC has been deprecated since ACPI 3.0
(2004) and it is not even present in ACPI 6.5 any more."  Maybe _PDC
is hanging around because operating systems are still using it.  But
that was another point making me question using _PDC.

> What you don't touch at all is how you mean to surface the LVT based
> interrupt to Dom0; the cited commit messages looks to describe uses
> beyond the HWP driver, and it uses that as part of the justification
> to override the firmware choice. The LAPIC is hidden (PV) or properly
> disconnected from the physical one (PVH), plus Xen's MCE code (however
> broken it may be) makes use of it. Or is the plan to ignore all of
> that (at least for now) and limit things to the HWP driver's needs?

I didn't intend to surface any interrupts, and I explicitly disable
the HWP interrupt in the Xen driver.   It is used by the processor to
indicate when certain values like the guaranteed performance change,
which isn't something I wanted to support.  But the thermal interrupt
is something else, and I haven't figured out how enabling HWP
triggered whatever HWP or thermal interrupt which caused the original
issue.  I'll look at this stuff some more.

After I sent my message, I was wondering about how Linux commit
a21211672c9a adds code to clear the HWP status on thermal interrupt
via an MSR write, which wouldn't work from dom0.  But if those
interrupts aren't making their way to dom0, that is fine and we can
just have Xen handle it.

Thanks for sharing your input.

-Jason

