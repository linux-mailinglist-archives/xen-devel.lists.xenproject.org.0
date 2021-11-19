Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05F45717D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 16:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228082.394589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5bh-0001cM-D3; Fri, 19 Nov 2021 15:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228082.394589; Fri, 19 Nov 2021 15:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5bh-0001Zg-8W; Fri, 19 Nov 2021 15:15:17 +0000
Received: by outflank-mailman (input) for mailman id 228082;
 Fri, 19 Nov 2021 15:15:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo5bf-0001Za-R7
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:15:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo5bf-0001oC-Oc
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:15:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo5bf-0003r4-Nb
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:15:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mo5bd-0005oy-IF; Fri, 19 Nov 2021 15:15:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:Cc:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=6ck8Tf7Jp++28hPZcAXcmxKfhcFCVzJaWKJlm2u1XrY=; b=Q5QVO/RTxTYDaqAjFeeMspb54K
	XatHO2AawXcIUF/KEXl0TiYf5G7+hFqnEu5925aqPdMqN+wb1DwmChOrVRc9xvLCORiW4Ien4ER5X
	Fyi8JEHcM3vhlNCFpx4EI3HNbQskYZ+S0XN5xXS4mhbJ4cA000Oz0+y5jQ2tB5otYo7o=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24983.49015.777430.780265@mariner.uk.xensource.com>
Date: Fri, 19 Nov 2021 15:15:03 +0000
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
Subject: Xen 4.16 development update - tree status

Tree status
===========

We are now in deep code freeze, during which we will try to discover
and eliminate serious bugs and regressions.

All patches other than documentation patches need a Release-Ack.
Fixes for serious bugs, and test improvements, will get such an ack.

I have decided to branch on Monday at the same time as cutting RC4.
I think the release is going reasonably well.


The current planned release schedule
====================================

    Friday 12th November                  Hard code freeze [*]

      Bugfixes for serious bugs (including regressions), and low-risk
      fixes only.
      (0.5 weeks)

    Monday 22nd November **planned**     Branch off staging-4.16

      xen-unstable open again - with caveats to avoid release disruption.
      (1.5 weeks)

    Friday 26th November **tentative**    Final commits (docs/prep only)
    Week of 29th November **tentative**   Release
      (probably Tuesday or Wednesday)


Open issues and potential blockers
==================================

Here is the list of issues I am aware of that might be blockers and/or
might need a release ack for fixes.  In general, please would people
explicitly note release-blocker issues to me, so that I can see that
they are sorted out.


I am aware of one outstanding fix that has not yet been committed:

* [PATCH for-4.16 v2] efi: fix alignment of function parameters in compat
  which is an UB bug spotted due to a build failure with recent clang
  http://beefy18.nyi.freebsd.org/data/main-amd64-default/p5718aa5f2a8f_s9b8eb1c5b6/logs/xen-kernel-4.15.0_1.log


I am aware of three issues for which I don't know the current
disposition:

* "x86/IOMMU: enabled / intremap handling"
  3/3 "AMD/IOMMU: iommu_enable vs iommu_intremap"
  Last I heard this was being reworked.

* I have a note "HPET regression".  There have been number of patches in
  this area.  Most recently,
  "x86/hpet: setup HPET even when disabled due to stopping in deep C states"

* "x86/viridian: EOI MSR should always happen in affected vCPU context"
  Jan mentioned this on IRC but I don't see any discussion of it in
  my mailbox.

The last two were mentioned in my last release update, but I don't
seem to find any definitive conclusion.  x86 maintainers, can you
please confirm ?



Issues dealt with
=================

ARM/VPCI: all relevant fixes seem to have been applied now.

I have carrioed out Pre-public-disclosure testing of embargoed XSAs
385 387 388 389, together with the today-released XSA-390.

I have run through those of the release checklist items which are to
be done before branching, notably library sonames.

We have reverted "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag" as
discussed.


Patches applied to fix bugs
---------------------------

"x86/xstate: reset cached register values on resume"

"tools: disable building qemu-trad per default"

Fixes for FreeBSD build problems following "tools: disable building
qemu-trad per default".

"VT-d: misc (regression) fixes":
1/3 "VT-d: per-domain IOMMU bitmap needs to have dynamic size"
2/3 "VT-d: fix reduced page table levels support when sharing tables"

"xen/efi: Fix Grub2 boot on arm64"

"gnttab: allow setting max version per-domain" and fixes thereto

"tools/helpers: fix broken xenstore stubdom init"

"xen/arm: fix SBDF calculation for vPCI MMIO handlers"

"x86/IOMMU: enabled / intremap handling"
1/3 x86/IOMMU: mark IOMMU / intremap not in use when ACPI tables are missing
2/3 x86/APIC: avoid iommu_supports_x2apic() on error path

"x86/traps: Fix typo in do_entry_CP()"


Changes slated to be deferred to post-4.16
------------------------------------------

Discussion of the following issues and patches, since the last release
update, has resulted in me declining to give a release-ack:

* Revert "domctl: improve locking during domain destruction"

* "VT-d: misc (regression) fixes":
  3/3 "VT-d: don't needlessly engage the untrusted-MSI workaround"

* "x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12"

* "arm/efi: Improve performance requesting filesystem handle"

* "qemu build failure on release tarball with python <= 3.5"
  (mail thread, no patch exists at this time)

* "x86/x2APIC: defer probe until after IOMMU ACPI table parsing"

* "arm/smmuv1,v2: Protect smmu master list with a lock"


Note on RM decisionmaking
=========================

Release management decisions are always subject to revision on the
basis of new information or new arguments, so the list of changes
slated to be deferred should not be taken to be necessarily final.

Release management decisions usually involve much uncertainty (even
guesswork), and sometimes involve a balance of interests.  If you
think I have made a mistake and have new points, new information, or
think you can demonstrate that I have made the wrong tradeoff, please
let me know.

However, this message reflects my current understanding.


--

