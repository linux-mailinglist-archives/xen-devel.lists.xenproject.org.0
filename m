Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EB441A11
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 11:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219109.379768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUlF-0000Xc-E2; Mon, 01 Nov 2021 10:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219109.379768; Mon, 01 Nov 2021 10:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUlF-0000UN-9j; Mon, 01 Nov 2021 10:41:53 +0000
Received: by outflank-mailman (input) for mailman id 219109;
 Mon, 01 Nov 2021 10:41:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUlD-0000UH-Ec
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:41:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUlD-0005er-Ct
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:41:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUlD-0006dU-Bo
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:41:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhUlB-0004hS-AF; Mon, 01 Nov 2021 10:41:49 +0000
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
	bh=LGAY6JByyaTzbZvnRQo5adss/es5KDPguVPyVv1DFTU=; b=o99Uf5n9p+JuHDvb4UvviktUw/
	ojJbcIwpXCD8KjV9wUxOi+fC4fQ6tsHtGKntwC7FAlUJLG3059IQIAC8GI1iiumyz4Avzcv7NP5oN
	4MLE2DeZS6TbXAz6sPB6p0I0CPnb1Y7rZpmRbq1mUiIngZX7z+PGOV5GMCnKfrcVP0yA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24959.50284.690360.964111@mariner.uk.xensource.com>
Date: Mon, 1 Nov 2021 10:41:48 +0000
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
Subject: Xen 4.16 development update - commit moratorium

Tree status
===========

We are now in code freeze.

All patches which have not yet been committed, but which still need to
go into 4.16, need a release ack.

I will be cutting RC1 shortly.  Please do not commit anything, even
release-acked patches, until I let you know.


The current planned release schedule
====================================

    Friday 29th October *PASSED*          Code freeze

      Bugfixes only, all changes to be approved by the Release Manager,
      on the basis of a (progressively stricter[*]) risk assessment.
      (2 weeks)

    Friday 12th November                  Hard code freeze [*]

      Bugfixes for serious bugs (including regressions), and low-risk
      fixes only.
      (0.5 weeks)

    Tuesday 16th November **tentative**   Branch off staging-4.16

      xen-unstable open again - with caveats to avoid release disruption.
      (1.5 weeks)

    Friday 26th November **tentative**    Final commits (docs/prep only)
    Week of 29th November **tentative**   Release
      (probably Tuesday or Wednesday)


Open issues and blockers
========================

Here is the list of issues I am aware of that might be blockers and/or
might need a release ack for fixes:

In general, please would people explicitly note release-blocker issues
to me, so that I can see that they are sorted out.


* "gnttab: allow setting max version per-domain".  This would be
  nice to have, as it is a security mitigation for possible future
  bugs.  However it is not quite ready afaict.  Hopefully it will
  be ready very soon.

ARM/VPCI:

* "xen/arm: fix SBDF calculation for vPCI MMIO handlers"
  I have just sent a mail about this one.  I'm unsure of
  the merits of this for 4.16.

* "arm/smmuv1,v2: Protect smmu master list with a lock"
  Discussion is ongoing.

* "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
  which Andy had some observations about in an email on the 8th.
  This was reverted in 2075b410ee80.  I think this issue now dealt
  with as far as 4.16 goes ?

* I'm not sure if there are others.  My question about that hasn't had
  a clear answer as far as I can tell.  I would like to repeat my
  earlier comment: I am finding it hard to see the wood for the trees.

x86:

* I have a note "HPET regression".  I saw a number of patches in
  this area.  Most recently,
  "x86/hpet: setup HPET even when disabled due to stopping in deep C states"
  Does that mean this is dealt with now ?

* "x86/xstate: reset cached register values on resume"
  AFAICT an approach was agreed between Jan and Roger but I don't
  seem to see the final version posted or in tree.  Am I missing
  something ?

* "x86/viridian: EOI MSR should always happen in affected vCPU context"
  Jan mentioned this on IRC but I don't see any discussion of it in
  my mailbox.

* Disable building qemu-trad by default.
  This is on my own todo list, with my maintainer/committer hat on.


Ian.

[*] The distinction between Code Freeze and Hard Code Freeze is a
matter of degree, not kind; the Hard Code Freeze data and associated
tighter policy text is indicative rather than normative.

