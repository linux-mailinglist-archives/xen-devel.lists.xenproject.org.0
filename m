Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32008441A45
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 11:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219134.379811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUwG-0003os-9G; Mon, 01 Nov 2021 10:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219134.379811; Mon, 01 Nov 2021 10:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUwG-0003mr-6E; Mon, 01 Nov 2021 10:53:16 +0000
Received: by outflank-mailman (input) for mailman id 219134;
 Mon, 01 Nov 2021 10:53:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUwE-0003ml-61
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:53:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUwE-0005sp-3o
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:53:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUwE-0007PP-2x
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:53:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhUwA-0004m2-HF; Mon, 01 Nov 2021 10:53:10 +0000
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
	bh=eqSXJmvGYSYN8Jbm1MOIHAN0UsdTuzQvjj8U2XBAlH4=; b=Z/biXH/9WdykyRd6SRFz9G+nlN
	4B1I2Gd0j4XoZE6HMZs4U1QTR8O6x0hOw6czfuGHSdcxbwXXCFtGmXYAQFdZB+y50yRj4pUMsOZ7s
	nMfRfteb7gX/BhUDbQPtSYb0LgQ1xgit7j2PazAjOHOUYjYxt5s86irNHllEJg5wdV/0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24959.50965.967784.441954@mariner.uk.xensource.com>
Date: Mon, 1 Nov 2021 10:53:09 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on AMD hardware
In-Reply-To: <20211028232658.20637-1-andrew.cooper3@citrix.com>
References: <20211028232658.20637-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on AMD hardware"):
> The `ljmp *mem` instruction is (famously?) not binary compatible between Intel
> and AMD CPUS.  The AMD-compatible version would require .long to be .quad in
> the second hunk.
> 
> Switch to using lretq, which is compatible between Intel and AMD, as well as
> being less logic overall.
> 
> Fixes: 5a82d5cf352d ("kexec: extend hypercall with improved load/unload ops")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> For 4.16.  This is a bugfix for rare (so rare it has probably never been
> exercised) but plain-broken usecase.
> 
> One argument against taking it says that this has been broken for 8 years
> already, so what's a few extra weeks.  Another is that this patch is only
> compile tested because I don't have a suitable setup to repro, nor the time to
> try organising one.

Thanks for being frank about testing.

The bug is a ?race? ?  Which hardly ever happens ?  Or it only affects
some strange configurations ?  Or ... ?

> On the other hand, I specifically used the point of binary incompatibility to
> persuade Intel to drop Call Gates out of the architecture in the forthcoming
> FRED spec.

I'm afraid I can't make head or tail of this.  What are the
implications ?

> The lretq pattern used here matches x86_32_switch() in
> xen/arch/x86/boot/head.S, and this codepath is executed on every MB2+EFI
> xen.gz boot, which from XenServer alone is a very wide set of testing.

AIUI this is an argument saying that the basic principle of this
change is good.  Good.

However: is there some risk of a non-catastrophic breakage here, for
example, if there was a slip in the actual implementation ?
(Catastrophic breakage would break all our tests, I think.)

Thanks,
Ian.

