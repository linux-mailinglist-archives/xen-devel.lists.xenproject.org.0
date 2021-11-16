Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9E4534AE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226335.391084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzoA-0005rM-SH; Tue, 16 Nov 2021 14:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226335.391084; Tue, 16 Nov 2021 14:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzoA-0005oR-Nj; Tue, 16 Nov 2021 14:51:38 +0000
Received: by outflank-mailman (input) for mailman id 226335;
 Tue, 16 Nov 2021 14:51:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mmzo8-0005oH-I8
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:51:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mmzo8-0005dC-Fl
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:51:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mmzo8-0002PA-Eh
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:51:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mmzo3-0000FT-Lz; Tue, 16 Nov 2021 14:51:31 +0000
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
	bh=+I1NkhC/MlSlu0/pyrNcY+IR0W6q/gOtFnRzg1SNys8=; b=uzXKn0/Tgl3xfVKOSrOhzxkSeX
	FPCSYLXrMPh3URACPzsr5PxFQrupvnSWDRn7ks229wHHLMI3sO7RdZ4CnWfp/jgo+Sjx0pR7ewkDd
	Tm1fuA89PQdi6l769fyFCKEgjTUweBiJskydm2MveTZNY1u8b8VCbcVsHUfecSijENfg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24979.50546.997981.476430@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 14:51:30 +0000
To: Roger Pau Monne <roger.pau@citrix.com>,
    Julien Grall <julien@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Hongyan Xia <hongyxia@amazon.com>,
    Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Subject: Re: [PATCH for-4.16] Revert "domctl: improve locking during domain
 destruction" [and 2 more messages]
In-Reply-To: <YYqQjMuARXwG4/yW@Air-de-Roger>,
	<a708312d-ab1b-4784-b1fe-01dbb680e7e9@xen.org>,
	<20211112120208.74387-1-roger.pau@citrix.com>
References: <20211112120208.74387-1-roger.pau@citrix.com>
	<20211109143128.56089-1-roger.pau@citrix.com>
	<a708312d-ab1b-4784-b1fe-01dbb680e7e9@xen.org>
	<24970.36376.658415.956968@mariner.uk.xensource.com>
	<YYqQjMuARXwG4/yW@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.16] Revert "domctl: improve locking during domain destruction""):
> On Tue, Nov 09, 2021 at 03:04:56PM +0000, Ian Jackson wrote:
> > So I am going to treat this as an effectively new change.
> > 
> > AIUI it is a proposal to improve performance, not a bugfix.  Was this
> > change posted (or, proposed on-list) before the Xen 4.16 Last Posting
> > Date (24th of September) ?  Even if it was, it would need a freeze
> > exception.
> 
> It was posted here:
> 
> https://lore.kernel.org/xen-devel/de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com/
> 
> Which was missing a spin_barrier, and in a different form here:
> 
> https://lore.kernel.org/xen-devel/2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru/

Thanks.

Julien Grall writes ("Re: [PATCH for-4.16] Revert "domctl: improve locking during domain destruction""):
> For instance, in the case of Amazon our setup was:
> 
> On a 144-core server with 4TiB of memory, destroying 32 guests (each
> with 4 vcpus and 122GiB memory) simultaneously takes:
> 
> before the revert: 29 minutes
> after the revert: 6 minutes

This is quite substantial!

> > Given the current point in the release, revert the commit and
> > reinstate holding the domctl lock during domain destruction. Further
> > work should be done in order to re-add more fine grained locking to
> > the domain destruction path once a proper solution to avoid the
> > heap_lock contention is found.
...
> > Since this is a revert and not new code I think the risk is lower.
> > There's however some risk, as the original commit was from 2017, and
> > hence the surrounding code has changed a bit. It's also a possibility
> > that some other parts of the domain destruction code now rely on this
> > more fine grained locking. Local tests however haven't shown issues.

I am finding this a difficult decision.  It appears from the threads
that a number of people have been running with this revert, which
would serve to mitigate the risk, but it's not clear to me what
version(s) of Xen they had applied it to.

Ultimately, though, I think I need to refer myself to the schedule I set:

    Friday 12th November                  Hard code freeze [*]

      Bugfixes for serious bugs (including regressions), and low-risk
      fixes only.
      (0.5 weeks)

I don't see any way that this change fits into this.  The point of a
freeze is, in part, that we stop trying to *improve* things and start
trying to *unbreak* them :-).

While the perf here is clearly poor I don't think it's actually
broken.

So, I'm afraid I'm saying "no".

Ian.

