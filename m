Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D173EEC67
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 14:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167814.306357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyAa-0000GJ-AF; Tue, 17 Aug 2021 12:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167814.306357; Tue, 17 Aug 2021 12:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyAa-0000EU-6y; Tue, 17 Aug 2021 12:26:16 +0000
Received: by outflank-mailman (input) for mailman id 167814;
 Tue, 17 Aug 2021 12:26:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFyAZ-0000EO-KU
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:26:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFyAZ-0005Lm-Ik
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:26:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFyAZ-0002ei-G2
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:26:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mFyAV-0003yp-LL; Tue, 17 Aug 2021 13:26:11 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=wO+NE28VTPtNM7l5Olmz96izy4be9S6rB/yTKX1pj1Y=; b=cYIA+5Zn1ihNqQ99keW3kaeEi2
	5/vcB3umy508WXzY2yv3TNTNRbLDM1wZmcjiIjRiJ8ZtyEjKMQCvwj9vt4lH2TW79+MG+RSNY1rOX
	eUZpwLavpmNs/PipjnElZvM7U3KV7zZhsNHZCtfOYNgbCF8rTpYtgJRYRT8LiVsqnRX8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24859.43747.87671.739214@mariner.uk.xensource.com>
Date: Tue, 17 Aug 2021 13:26:11 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    pdurrant@amazon.com,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Paul Durrant <pdurrant@amazon.com>,
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] libxl: Fix stubdom PCI passthrough
In-Reply-To: <20210812005700.3159-1-jandryuk@gmail.com>
References: <20210812005700.3159-1-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jason Andryuk writes ("[PATCH v2] libxl: Fix stubdom PCI passthrough"):
> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> reflected in the config" broken stubdom PCI passthrough when it moved
> libxl__create_pci_backend later in the function.  xl pci-attach for a
> running PV domain may also have been broken, but that was not verified.
> 
> The stubdomain is running (!starting) and PV, so it calls
> libxl__wait_for_backend.  With the new placement of
> libxl__create_pci_backend, the path does not exist and the call
> immediately fails.
...
> The wait is only relevant when the backend is already present.  num_devs
> is already used to determine if the backend needs to be created.  Re-use
> num_devs to determine if the backend wait is necessary.  The wait is
> necessary to avoid racing with another PCI attachment reconfiguring the
> front/back. If we are creating the backend, then we don't have to worry
> about a racing reconfigure.

Thanks for working on this.  Sorry it's taken a while for me to look
at this properly.  It seems very complicated.  I confess I am
confused.  I wonder if I actually understand properly how the code in
tree is supposed to work.  So if I seem not to be making sense, please
explain :-).


AFAICT what you are saying is that:

  In 0fdb48ffe7a1, pci-attach was moved later in the setup, until a time
  after the stubdomain is running.  So that code now always runs with
  !starting, when previously it would run with !!starting.

  libxl__wait_for_backend fails if the backend path does not exist;
  previously, when the domain is being created, the wait would be
  skipped.  Now because !starting, the wait is done, and fails because
  the backend path is missing.

  The purpose of the wait is to make sure the frontend is ready to
  accept the instructions, mostly to prevent multiple pci attach
  happening simultaneously.

You are using num_devs to see whether the backend exists already, so
as to skip the failing check.  I don't think that is right.  But I'm
not sure the old code is right either.

If you are right about the reason for the wait, it does not seem
correctly placed.  There is surely a TOCTOU race: first, we do the
wait, and then we write, non-transactionally, to xenstore.  If two of
these processes run at once, they could both decide not to wait,
then both try to create the backend and trample on each other.

This kind of thing is usually supposed to be dealt with by a
combination of the userdata lock (for the config) and xenstore
transaction but the code here doesn't seem to do that correctly.

Shouldn't all of this looking at xenstore occur within the transaction
loop ?  What this code seems to do is read some things
nontransactionally, then enter a transaction, and then make some
writes based on a combination of the pre-transaction and
within-transaction data.  In particular `num_devs` is read
nontransactionally and then written within the transaction, without, I
think being checked for subsequent modification.

Also, I think the purpose of `starting` is to avoid waiting for the
backend to be stable before the frontend is actaully unpaused, in
which case presumably the backend would never be Connected and we
would deadlock (and eventually time out).  In general when we are
hot-adding we must wait for the frontend and backend to be stable
before saying we're done, whereas with cold-adding we set up the
information and simply hope (expect) it all to sort itself out while
the domain boots.  So, I would be expecting to see the wait to happen
*after* the add.

There is also the wrinkle that the non-pci code is differently
structured, because it must not use libxl__wait_for_backend at all.
libxl__wait_for_backend is synchronous and blocking the whole libxl
process for an extended time is not allowed.  But AIUI we have made an
exception for pci because the pci backend is always in dom0 and
trusted.


I looked through the git history.

Very relevant seems
   70628d024da42eea
   libxl: Multi-device passthrough coldplug: do not wait for unstarted guest
which has some explanation from me in the commit message.  I'm not
sure why I didn't spot the anomalous transaction use problem.


Also I found
   1a734d51902dff44
   libxl: fix cold plugged PCI device with stubdomain
and, would you believe it
   18f93842ac3c2ca4
   libxl: fix cold plugged PCI devices with stubdomains
which seems at least tangentially relevant, showing that this seems
persistently to break :-(.  This suggests quite strongly that we
should add some tests for pci passthrough including at least one for
stubdom coldplug.

Also:
   b6c23c86fe5a1a02
   libxl: add all pci devices to xenstore at once (during VM create)
which seems OK.

There has been a lot of refactoring, but much of it hasn't really
changed the structure of this function.

The issue I identify above, with the inconsistent use of transactions,
seems to have existed since the very beginning.  In
   b0a1af61678b5e4c
   libxenlight: implement pci passthrough
the `retry_transaction:` label seems to me to be in the wrong place.


I have CC'd Paul and Oleksandr (committer/reviewer of 0fdb48ffe7a1),
Marek (seems to have touched a lot of the stubdom code here) and
Stefano (original author of the pci passthrough code here)
in case they would like to comment...


Thanks,
Ian.

