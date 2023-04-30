Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBF6F29DC
	for <lists+xen-devel@lfdr.de>; Sun, 30 Apr 2023 19:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527833.820473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptAfA-0000mc-1m; Sun, 30 Apr 2023 17:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527833.820473; Sun, 30 Apr 2023 17:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptAf9-0000k7-UH; Sun, 30 Apr 2023 17:16:39 +0000
Received: by outflank-mailman (input) for mailman id 527833;
 Sun, 30 Apr 2023 17:16:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3rtS=AV=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ptAf9-0000k1-3S
 for xen-devel@lists.xenproject.org; Sun, 30 Apr 2023 17:16:39 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1fd6230-e77a-11ed-8611-37d641c3527e;
 Sun, 30 Apr 2023 19:16:36 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 33UHGPvO054819
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 30 Apr 2023 13:16:31 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 33UHGPQs054818;
 Sun, 30 Apr 2023 10:16:25 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c1fd6230-e77a-11ed-8611-37d641c3527e
Date: Sun, 30 Apr 2023 10:16:25 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZE6iaaUvScHUjoKy@mattapan.m5p.com>
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

Given the patch didn't fix the problem, that wasn't the issue.  I did
though manage to try another variant of BIOS settings for this
motherboard.  Setting "Local APIC Mode" to "x2APIC" in the BIOS neither
breaks anything additional, nor fixes issues.  What was in Xen's dmesg
did change slightly and looks likely better for my purposes.  Some more
snippets from 4.17 Xen dmesg, with "x2apic_phys=true":

(XEN) AMD-Vi: IOMMU Extended Features:
(XEN) - Peripheral Page Service Request
(XEN) - x2APIC
(XEN) - NX bit
(XEN) - Guest APIC Physical Processor Interrupt
(XEN) - Invalidate All Command
(XEN) - Guest APIC
(XEN) - Performance Counters
(XEN) - Host Address Translation Size: 0x2
(XEN) - Guest Address Translation Size: 0
(XEN) - Guest CR3 Root Table Level: 0x1
(XEN) - Maximum PASID: 0xf
(XEN) - SMI Filter Register: 0x1
(XEN) - SMI Filter Register Count: 0x1
(XEN) - Guest Virtual APIC Modes: 0x1
(XEN) - Dual PPR Log: 0x2
(XEN) - Dual Event Log: 0x2
(XEN) - Secure ATS
(XEN) - User / Supervisor Page Protection
(XEN) - Device Table Segmentation: 0x3
(XEN) - PPR Log Overflow Early Warning
(XEN) - PPR Automatic Response
(XEN) - Memory Access Routing and Control: 0x1
(XEN) - Block StopMark Message
(XEN) - Performance Optimization
(XEN) - MSI Capability MMIO Access
(XEN) - Guest I/O Protection
(XEN) - Enhanced PPR Handling
(XEN) - Invalidate IOTLB Type
(XEN) - VM Table Size: 0x2
(XEN) - Guest Access Bit Update Disable
(XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) AMD-Vi: IOMMU 0 Enabled.


(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode:  Physical.  Using 2 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method


(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN)  - VMCB Clean Bits
(XEN)  - DecodeAssists
(XEN)  - Virtual VMLOAD/VMSAVE
(XEN)  - Virtual GIF
(XEN)  - Pause-Intercept Filter
(XEN)  - Pause-Intercept Filter Threshold
(XEN)  - TSC Rate MSR
(XEN)  - NPT Supervisor Shadow Stack
(XEN)  - MSR_SPEC_CTRL virtualisation
(XEN) HVM: SVM enabled

If I'm reading that correctly, everything is there for x2APIC.  As such
there seem to be 1 or 2 bugs:

The definite bug is the x2apic_cluster APIC driver fails on recent AMD
processors.

I'm unsure whether selecting the x2apic_cluster APIC driver is correct or
not.  Capabilities you used to only find a multi-socket server
motherboards are now being found on desktop motherboards.  My
understanding is this processor does NUMA on a single die, not merely a
single-socket.  As such it may well need the features of x2apic_cluster,
perhaps the driver assumes nr_socket > 1 which is untrue here?

Does appear "x2apic_phys=true" plus "tsc_mode = 'always_emulate'" are
adaquate workarounds all the way back to 4.14.  Now for the second
correct bugfix.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



