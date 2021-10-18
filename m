Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FDB431825
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212114.369874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRAA-0001lY-Cs; Mon, 18 Oct 2021 11:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212114.369874; Mon, 18 Oct 2021 11:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRAA-0001jl-9m; Mon, 18 Oct 2021 11:50:42 +0000
Received: by outflank-mailman (input) for mailman id 212114;
 Mon, 18 Oct 2021 11:50:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcRA8-0001jf-W5
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:50:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcRA8-00040q-Tg
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:50:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcRA8-00078E-Sb
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:50:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcRA7-0005kD-2D; Mon, 18 Oct 2021 12:50:39 +0100
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
	bh=r2tNtUv603vNZOUaqYflZkVTT277GP2mslr5k4EciqI=; b=rUjMjCk2fwWfeku1FsQJ5wM4Ft
	ZgynYY4h30rQf7SpV4pWk36EaCCXukBZwcseme92/4MzluK6Ik2viDX3O2yZ0xXIKmKySdaevO8ZB
	nBv5bfYIjUJcb4P0uELv1YnzpdJaZb6IsYwrBNAdz2oGh7BczISS/zDiWIu12ip3q3IY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24941.24462.600999.31649@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 12:50:38 +0100
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
Subject: Xen 4.16 development update - tree status
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Tree status
===========

We are now in feature freeze.

Until code freeze, straightforward bugfixes (and documentation
changes) may continue to be committed without a Release-Ack,
until the Code Freeze, which will be on Friday 29th October.[1]

Any patches introducing features should have been committed by now.
All patches containing substantial refactoring need a Release-Ack,
even if the intent is to fix bugs.

If in doubt please ask for a Release-Ack.


The current planned release schedule
====================================

    Friday 29th October                   Code freeze

      Bugfixes only, all changes to be approved by the Release Manager,
      on the basis of a (progressively stricter[*]) risk assessment.
      (2 weeks)

    Friday 12th November **tentative**    Hard code freeze [*]

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

I am aware of a number of oustanding bug fixes, particularly for x86.
I would appreciate attention from maintainers to these so that they
can be applied sooner rather than later.  I don't believe any of these
have been explicitly flagged as RC, or regressions, but I think my
information may be incomplete.

In general, please would people explicitly note release-blocker issues
to me, so that I can see that they are sorted out.

I'm aware of one thing that I definitely want to see fixed before
release: the patch "Enable the existing x86 virtual PCI support for
ARM" needs rework.  I believe this is in hand.


Ian.


[1] As previously discussed, this timescale has been compressed
    by one week.

[*] The distinction between Code Freeze and Hard Code Freeze is a
matter of degree, not kind; the Hard Code Freeze data and associated
tighter policy text is indicative rather than normative.

