Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082F6C19C7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 16:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511980.791480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHZq-0000AB-A1; Mon, 20 Mar 2023 15:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511980.791480; Mon, 20 Mar 2023 15:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHZq-00007b-7E; Mon, 20 Mar 2023 15:37:38 +0000
Received: by outflank-mailman (input) for mailman id 511980;
 Mon, 20 Mar 2023 15:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9b8=7M=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1peHZp-00007V-4x
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 15:37:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2251d07a-c735-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 16:37:35 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32KFbNkn086507
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 20 Mar 2023 11:37:28 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32KFbMdc086506;
 Mon, 20 Mar 2023 08:37:22 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 2251d07a-c735-11ed-87f5-c1b5be75604c
Date: Mon, 20 Mar 2023 08:37:22 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZBh9sueCbOSX8iUu@mattapan.m5p.com>
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="9vDWc6VCGySS17fs"
Content-Disposition: inline
In-Reply-To: <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com


--9vDWc6VCGySS17fs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 20, 2023 at 09:14:17AM +0100, Jan Beulich wrote:
> On 17.03.2023 18:26, Elliott Mitchell wrote:
> > On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
> >> On 16.03.2023 23:03, Elliott Mitchell wrote:
> >>> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
> >>>> On 11.03.2023 01:09, Elliott Mitchell wrote:
> >>>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
> >>>>>>
> >>>>>> In any event you will want to collect a serial log at maximum verbosity.
> >>>>>> It would also be of interest to know whether turning off the IOMMU avoids
> >>>>>> the issue as well (on the assumption that your system has less than 255
> >>>>>> CPUs).
> >>>>>
> >>>>> I think I might have figured out the situation in a different fashion.
> >>>>>
> >>>>> I was taking a look at the BIOS manual for this motherboard and noticed
> >>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
> >>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
> >>>>>
> >>>>> That is the sort of setting I likely left at "Auto" and that may well
> >>>>> result in x2 functionality being disabled.  Perhaps the x2APIC
> >>>>> functionality on AMD is detecting whether the hardware is present, and
> >>>>> failing to test whether it has been enabled?  (could be useful to output
> >>>>> a message suggesting enabling the hardware feature)
> >>>>
> >>>> Can we please move to a little more technical terms here? What is "present"
> >>>> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
> >>>> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
> >>>> also left unclear what the four modes of BIOS operation evaluate to. Even
> >>>> if we knew that, overriding e.g. "Compatibility" (which likely means some
> >>>> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
> >>>> In "Auto" mode Xen likely should work - the only way I could interpret the
> >>>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
> >>>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
> >>>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
> >>>> speculation on my part ...
> >>>
> >>> I provided the information I had discovered.  There is a setting for this
> >>> motherboard (likely present on some similar motherboards) which /may/
> >>> effect the issue.  I doubt I've tried "compatibility", but none of the
> >>> values I've tried have gotten the system to boot without "x2apic=false"
> >>> on Xen's command-line.
> >>>
> >>> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
> >>> I see the line "(XEN) - x2APIC".  Later is the line
> >>> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
> >>> leaves the x2APIC turned off since neither line is present.
> >>
> >> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
> >> mode. Are you sure that's the case when using "Auto"?
> > 
> > grep -eAPIC\ driver -e-\ x2APIC:
> > 
> > "Auto":
> > (XEN) Using APIC driver default
> > (XEN) Overriding APIC driver with bigsmp
> > (XEN) Switched to APIC driver x2apic_cluster
> > 
> > "x2APIC":
> > (XEN) Using APIC driver x2apic_cluster
> > (XEN) - x2APIC
> > 
> > Yes, I'm sure.
> 
> Okay, this then means we're running in a mode we don't mean to run
> in: When the IOMMU claims to not support x2APIC mode (which is odd in
> the first place when at the same time the CPU reports x2APIC mode as
> supported), amd_iommu_prepare() is intended to switch interrupt
> remapping mode to "restricted" (which in turn would force x2APIC mode
> to "physical", not "clustered"). I notice though that there are a
> number of error paths in the function which bypass this setting. Could
> you add a couple of printk()s to understand which path is taken (each
> time; the function can be called more than once)?

If I'm reading the logs right, this could sugggest "Local APIC Mode"
setting was modifying the IOMMU side of the APIC, not the processor side
of the APIC setting.

There is also a "Compatibility" value which I haven't tried.  Perhaps
taking a look would be interesting.

> >>> Both cases the line "(XEN) Switched to APIC driver x2apic_cluster" is
> >>> present (so perhaps "Auto" merely doesn't activate it).
> >>
> >> Did you also try "x2apic_phys" on the Xen command line (just to be sure
> >> this isn't a clustered-mode only issue)?
> > 
> > No.  In fact x2apic_cluster is mentioned in all failure cases.
> 
> Could you give physical mode a try, please?

I had taken the previous message as an implicit request to do so.  I was
stating I had not previously done so.  While "x2apic=false" is functional
as a workaround, I really would like to get to the bottom of this.

> >>> Appears error_interrupt() needs locking or some concurrency handling
> >>> mechanism since the last error is jumbled.  With the setting "x2APIC"
> >>> I get a bunch of:
> >>> "(XEN) APIC error on CPU#: 00(08)(XEN) APIC error on CPU#: 00(08)"
> >>> (apparently one for each core)
> >>> Followed by "Receive accept error, Receive accept error," (again,
> >>> apparently one for each core).  Then a bunch of newlines (same pattern).
> >>
> >> This is a known issue, but since the messages shouldn't appear in the
> >> first place so far no-one has bothered to address this.
> > 
> > I won't claim it is the best solution, but see other message.
> > 
> > I'm tempted to propose allowing _Static_assert() since it is valuable
> > functionality for preventing issues.
> 
> How does _Static_assert() come into play here? Also note that we already
> use it when available ...

This is more in relation to the patch.  Appears GCC's C90 mode disables
_Static_assert(), so the _Static_assert(ARRAY_SIZE(args) == 8) had to be
dropped.


Come to think of it, I should have copied Neowutran on this thread as
everyone else has been running into this too.  Perhaps "x2apic=false" has
gotten less attention since it is a single-shot workaround.  Whereas
"tsc_mode = 1" needs to be repeated in every domain's configuration.


Neowutran, I'm unsure whether you remain subscribed to this list or not.
As such I'm attaching a copy of Jan Beulich's proposed patch, which may
(not yet tested) solve the "x2apic=false" issue.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



--9vDWc6VCGySS17fs
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="x2apic.patch"

Date: Mon, 20 Mar 2023 09:28:20 +0100
From: Jan Beulich <jbeulich@suse.com>

AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode

An earlier change with the same title (commit 1ba66a870eba) altered only
the path where x2apic_phys was already set to false (perhaps from the
command line). The same of course needs applying when the variable
wasn't modified yet from its initial value.

Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/arch/x86/genapic/x2apic.c
+++ unstable/xen/arch/x86/genapic/x2apic.c
@@ -236,11 +236,11 @@ const struct genapic *__init apic_x2apic
     if ( x2apic_phys < 0 )
     {
         /*
-         * Force physical mode if there's no interrupt remapping support: The
-         * ID in clustered mode requires a 32 bit destination field due to
+         * Force physical mode if there's no (full) interrupt remapping support:
+         * The ID in clustered mode requires a 32 bit destination field due to
          * the usage of the high 16 bits to hold the cluster ID.
          */
-        x2apic_phys = !iommu_intremap ||
+        x2apic_phys = iommu_intremap != iommu_intremap_full ||
                       (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
                       (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) &&
                        !(acpi_gbl_FADT.flags & ACPI_FADT_APIC_CLUSTER));



--9vDWc6VCGySS17fs--

