Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE630F2F7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 13:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81281.149932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7dUk-0001Vd-D5; Thu, 04 Feb 2021 12:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81281.149932; Thu, 04 Feb 2021 12:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7dUk-0001VE-9z; Thu, 04 Feb 2021 12:12:22 +0000
Received: by outflank-mailman (input) for mailman id 81281;
 Thu, 04 Feb 2021 12:12:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7dUi-0001V9-H9
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 12:12:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7dUi-0002FQ-D5
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 12:12:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7dUi-0007lC-BR
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 12:12:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7dUf-0007yU-56; Thu, 04 Feb 2021 12:12:17 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=f+rG5AhiOwAyIRub0twvjSm4J2tj7lnP7cbhIvwtpmI=; b=Fi7A4PwySoAVQEgmY3QW+lr/52
	fjiuTOtnbh/me2rX22eeaMIfxAYg+8Ryoou95D3AMtasSH3lfJ/Tj2nbzsEjOjvc89UsvyMWyfWEi
	N0yyyth9mNwZNsI7G6oyMLCZ9PIzdZqjF5Xkfky28QCuVRbrr9qeWJNpc2o0JRrfXPs0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24603.58528.901884.980466@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 12:12:16 +0000
To: committers@xenproject.org,
    xen-devel@lists.xenproject.org
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
    Dario Faggioli <dfaggioli@suse.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    community.manager@xenproject.org
Subject: [ANNOUNCE] Xen 4.15 - call for notification/status of significant bugs
In-Reply-To: <24600.8030.769396.165224@mariner.uk.xensource.com>
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Although there are a few things outstanding, we are now firmly into
the bugfixing phase of the Xen 4.15 release.

I searched my email (and my memory) and found four open blockers which
I have listed below, and one closed blocker.

I feel there are probably more issues out there, so please let me
know, in response to this mail, of any other significant bugs you are
aware of.

Ian.


OPEN ISSUES
-----------

A. HPET/PIT issue on newer Intel systems

Information from
  Andrew Cooper <andrew.cooper3@citrix.com>

| This has had literally tens of reports across the devel and users
| mailing lists, and prevents Xen from booting at all on the past two
| generations of Intel laptop.  I've finally got a repro and posted a
| fix to the list, but still in progress.

I think Andrew is still on the case here.


B. "scheduler broken" bugs.

Information from
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>

Quoting Andrew Cooper
| We've had 4 or 5 reports of Xen not working, and very little
| investigation on whats going on.  Suspicion is that there might be
| two bugs, one with smt=0 on recent AMD hardware, and one more
| general "some workloads cause negative credit" and might or might
| not be specific to credit2 (debugging feedback differs - also might
| be 3 underlying issue).

I reviewed a thread about this and it is not clear to me where we are
with this.


C. Fallout from MSR handling behavioral change.

Information from
  Jan Beulich <jbeulich@suse.com>

I am lacking an extended desxcription of this.  What are the bug(s),
and what is the situation ?


D. Use-after-free in the IOMMU code

Information from
  Julien Grall <julien@xen.org>
References
 [PATCH for-4.15 0/4] xen/iommu: Collection of bug fixes for IOMMU teadorwn
 <20201222154338.9459-1-julien@xen.org>

Quoting the 0/:
| This series is a collection of bug fixes for the IOMMU teardown code.
| All of them are candidate for 4.15 as they can either leak memory or
| lead to host crash/host corruption.

AFAIT these patches are not yet in-tree.



CLOSED ISSUES
=============

E. zstd support

Information from
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  git

Needed to unbreak Fedora.  Needs support for both dom0 and domU.

AFAICT this seems to be in-tree as of 8169f82049ef
"libxenguest: support zstd compressed kernels"

