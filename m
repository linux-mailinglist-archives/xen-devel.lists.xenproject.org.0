Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133736C2915
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 05:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512191.791975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peTTq-0001MC-1J; Tue, 21 Mar 2023 04:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512191.791975; Tue, 21 Mar 2023 04:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peTTp-0001Ka-Tq; Tue, 21 Mar 2023 04:20:13 +0000
Received: by outflank-mailman (input) for mailman id 512191;
 Tue, 21 Mar 2023 04:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rDWK=7N=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1peTTo-0001JB-6R
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 04:20:12 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9c22e56-c79f-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 05:20:09 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32L4JxMp089288
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 21 Mar 2023 00:20:04 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32L4Jwk3089287;
 Mon, 20 Mar 2023 21:19:58 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: a9c22e56-c79f-11ed-b464-930f4c7d94ae
Date: Mon, 20 Mar 2023 21:19:58 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZBkwboNcQu6ooSRC@mattapan.m5p.com>
References: <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Mar 20, 2023 at 09:28:20AM +0100, Jan Beulich wrote:
> On 20.03.2023 09:14, Jan Beulich wrote:
> > On 17.03.2023 18:26, Elliott Mitchell wrote:
> >> On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
> >>> On 16.03.2023 23:03, Elliott Mitchell wrote:
> >>>> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
> >>>>> On 11.03.2023 01:09, Elliott Mitchell wrote:
> >>>>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
> >>>>>>>
> >>>>>>> In any event you will want to collect a serial log at maximum verbosity.
> >>>>>>> It would also be of interest to know whether turning off the IOMMU avoids
> >>>>>>> the issue as well (on the assumption that your system has less than 255
> >>>>>>> CPUs).
> >>>>>>
> >>>>>> I think I might have figured out the situation in a different fashion.
> >>>>>>
> >>>>>> I was taking a look at the BIOS manual for this motherboard and noticed
> >>>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
> >>>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
> >>>>>>
> >>>>>> That is the sort of setting I likely left at "Auto" and that may well
> >>>>>> result in x2 functionality being disabled.  Perhaps the x2APIC
> >>>>>> functionality on AMD is detecting whether the hardware is present, and
> >>>>>> failing to test whether it has been enabled?  (could be useful to output
> >>>>>> a message suggesting enabling the hardware feature)
> >>>>>
> >>>>> Can we please move to a little more technical terms here? What is "present"
> >>>>> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
> >>>>> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
> >>>>> also left unclear what the four modes of BIOS operation evaluate to. Even
> >>>>> if we knew that, overriding e.g. "Compatibility" (which likely means some
> >>>>> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
> >>>>> In "Auto" mode Xen likely should work - the only way I could interpret the
> >>>>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
> >>>>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
> >>>>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
> >>>>> speculation on my part ...
> >>>>
> >>>> I provided the information I had discovered.  There is a setting for this
> >>>> motherboard (likely present on some similar motherboards) which /may/
> >>>> effect the issue.  I doubt I've tried "compatibility", but none of the
> >>>> values I've tried have gotten the system to boot without "x2apic=false"
> >>>> on Xen's command-line.
> >>>>
> >>>> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
> >>>> I see the line "(XEN) - x2APIC".  Later is the line
> >>>> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
> >>>> leaves the x2APIC turned off since neither line is present.
> >>>
> >>> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
> >>> mode. Are you sure that's the case when using "Auto"?
> >>
> >> grep -eAPIC\ driver -e-\ x2APIC:
> >>
> >> "Auto":
> >> (XEN) Using APIC driver default
> >> (XEN) Overriding APIC driver with bigsmp
> >> (XEN) Switched to APIC driver x2apic_cluster
> >>
> >> "x2APIC":
> >> (XEN) Using APIC driver x2apic_cluster
> >> (XEN) - x2APIC
> >>
> >> Yes, I'm sure.
> > 
> > Okay, this then means we're running in a mode we don't mean to run
> > in: When the IOMMU claims to not support x2APIC mode (which is odd in
> > the first place when at the same time the CPU reports x2APIC mode as
> > supported), amd_iommu_prepare() is intended to switch interrupt
> > remapping mode to "restricted" (which in turn would force x2APIC mode
> > to "physical", not "clustered"). I notice though that there are a
> > number of error paths in the function which bypass this setting. Could
> > you add a couple of printk()s to understand which path is taken (each
> > time; the function can be called more than once)?
> 
> I think I've spotted at least one issue. Could you give the patch below
> a try please? (Patch is fine for master and 4.17 but would need context
> adjustment for 4.16.)


> AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode
> 
> An earlier change with the same title (commit 1ba66a870eba) altered only
> the path where x2apic_phys was already set to false (perhaps from the
> command line). The same of course needs applying when the variable
> wasn't modified yet from its initial value.
> 
> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This does appear to be an improvement.  With this the system boots if
the "Local APIC Mode" setting is "auto".  As you may have guessed,
"(XEN) Switched to APIC driver x2apic_phys".



When I tried setting "Local APIC Mode" to "x2APIC" though things didn't
go so well.  Sometime >15 seconds after Domain 0 boots, first:

"(XEN) APIC error on CPU#: 00(08), Receive accept error" (looks to be
for every core)

Then:
"(XEN) APIC error on CPU#: 08(08), Receive accept error" (again for
every core, but *after* the above has appeared for all cores)

The above appears about twice for each core, then I start seeing
"(XEN) CPU#: No irq handler for vector ?? (IRQ -2147483648, LAPIC)"

The core doesn't vary too much with this, but the vector varies some.

Upon looking "(XEN) Using APIC driver x2apic_cluster".  Unfortunately
I didn't try booting with x2apic_phys forced with this setting.

So x2apic_cluster is looking like a <ahem> on recent AMD processors.


I'm unsure this qualifies as "Tested-by".  Certainly it IS an
improvement, but the problem certainly isn't 100% solved.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



