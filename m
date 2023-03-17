Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB66BEFA3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 18:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511204.790154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdDr3-0004fQ-Ey; Fri, 17 Mar 2023 17:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511204.790154; Fri, 17 Mar 2023 17:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdDr3-0004dB-B8; Fri, 17 Mar 2023 17:27:01 +0000
Received: by outflank-mailman (input) for mailman id 511204;
 Fri, 17 Mar 2023 17:27:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FDdY=7J=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pdDr2-0004d5-E8
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 17:27:00 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa9193f-c4e8-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 18:26:57 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32HHQn6E064752
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 17 Mar 2023 13:26:54 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32HHQmNP064751;
 Fri, 17 Mar 2023 10:26:48 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: eaa9193f-c4e8-11ed-b464-930f4c7d94ae
Date: Fri, 17 Mar 2023 10:26:48 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
> On 16.03.2023 23:03, Elliott Mitchell wrote:
> > On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
> >> On 11.03.2023 01:09, Elliott Mitchell wrote:
> >>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
> >>>>
> >>>> In any event you will want to collect a serial log at maximum verbosity.
> >>>> It would also be of interest to know whether turning off the IOMMU avoids
> >>>> the issue as well (on the assumption that your system has less than 255
> >>>> CPUs).
> >>>
> >>> I think I might have figured out the situation in a different fashion.
> >>>
> >>> I was taking a look at the BIOS manual for this motherboard and noticed
> >>> a mention of a "Local APIC Mode" setting.  Four values are listed
> >>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
> >>>
> >>> That is the sort of setting I likely left at "Auto" and that may well
> >>> result in x2 functionality being disabled.  Perhaps the x2APIC
> >>> functionality on AMD is detecting whether the hardware is present, and
> >>> failing to test whether it has been enabled?  (could be useful to output
> >>> a message suggesting enabling the hardware feature)
> >>
> >> Can we please move to a little more technical terms here? What is "present"
> >> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
> >> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
> >> also left unclear what the four modes of BIOS operation evaluate to. Even
> >> if we knew that, overriding e.g. "Compatibility" (which likely means some
> >> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
> >> In "Auto" mode Xen likely should work - the only way I could interpret the
> >> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
> >> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
> >> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
> >> speculation on my part ...
> > 
> > I provided the information I had discovered.  There is a setting for this
> > motherboard (likely present on some similar motherboards) which /may/
> > effect the issue.  I doubt I've tried "compatibility", but none of the
> > values I've tried have gotten the system to boot without "x2apic=false"
> > on Xen's command-line.
> > 
> > When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
> > I see the line "(XEN) - x2APIC".  Later is the line
> > "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
> > leaves the x2APIC turned off since neither line is present.
> 
> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
> mode. Are you sure that's the case when using "Auto"?

grep -eAPIC\ driver -e-\ x2APIC:

"Auto":
(XEN) Using APIC driver default
(XEN) Overriding APIC driver with bigsmp
(XEN) Switched to APIC driver x2apic_cluster

"x2APIC":
(XEN) Using APIC driver x2apic_cluster
(XEN) - x2APIC

Yes, I'm sure.

> > Both cases the line "(XEN) Switched to APIC driver x2apic_cluster" is
> > present (so perhaps "Auto" merely doesn't activate it).
> 
> Did you also try "x2apic_phys" on the Xen command line (just to be sure
> this isn't a clustered-mode only issue)?

No.  In fact x2apic_cluster is mentioned in all failure cases.

> > Appears error_interrupt() needs locking or some concurrency handling
> > mechanism since the last error is jumbled.  With the setting "x2APIC"
> > I get a bunch of:
> > "(XEN) APIC error on CPU#: 00(08)(XEN) APIC error on CPU#: 00(08)"
> > (apparently one for each core)
> > Followed by "Receive accept error, Receive accept error," (again,
> > apparently one for each core).  Then a bunch of newlines (same pattern).
> 
> This is a known issue, but since the messages shouldn't appear in the
> first place so far no-one has bothered to address this.

I won't claim it is the best solution, but see other message.

I'm tempted to propose allowing _Static_assert() since it is valuable
functionality for preventing issues.

> > With the setting "auto" the last message is a series of
> > "(XEN) CPU#: No irq handler for vector ## (IRQ -2147483648, LAPIC)" on
> > 2 different cores.  Rather more of the lines were from one core, the
> > vector value varied some.
> > 
> > Notable both sets of final error messages appeared after the Domain 0
> > kernel thought it had been operating for >30 seconds.  Lack of
> > response to interrupt generating events (pressing keys on USB keyboard)
> > suggests interrupts weren't getting through.
> > 
> > 
> > With "x2apic=false" error messages similar to the "Local APIC Mode"
> > of "x2APIC" appear >45 seconds after Domain 0 kernel start.  Of note
> > first "(XEN) APIC error on CPU#: 00(08)(XEN) APIC error on CPU#: 00(08)"
> > appears for all cores with "Receive accept error,".
> > 
> > Yet later a variation on this message starts appearing:
> > "(XEN) APIC error on CPU#: 08(08)(XEN) APIC error on CPU#: 08(08)"
> > this one appears multiple times.
> 
> That's certainly odd, as it suggests that things were okay for a short
> while.

Note, "later" means further down the log.  Upon checking this could mean
almost immediately after.  There are a total of 6 "APIC error" lines
(first with "00(08)", rest with "08(08)") and the lines with timestamps
indicate no more than 2 seconds between them.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



