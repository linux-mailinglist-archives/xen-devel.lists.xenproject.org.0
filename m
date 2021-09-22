Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E001B4148D3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 14:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192700.343276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1Nw-0007sb-OZ; Wed, 22 Sep 2021 12:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192700.343276; Wed, 22 Sep 2021 12:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1Nw-0007py-LU; Wed, 22 Sep 2021 12:30:00 +0000
Received: by outflank-mailman (input) for mailman id 192700;
 Wed, 22 Sep 2021 12:30:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT1Nv-0007ps-VA
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:29:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT1Nv-0006y1-R7
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:29:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mT1Nv-0003f2-Q9
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:29:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mT1Nq-0003Im-Ou; Wed, 22 Sep 2021 13:29:54 +0100
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
	bh=uGnkq96b/xxN88TzuE7mpG5VNU1uPgMonjr6E+affzY=; b=gYwimMKqY3XxlLfsIrRiSYJjjb
	OMbWJf/xtiFNSdad+WONYaRlqr3+r+mOUc6y7sZt9MQoNRIi3mldbEI2xs2vc9zwRUUG3eD4nbOxs
	C6TreHk3EgkUNBDHv19zp12Kg97hOA+pxJNCMfA967qNOK8nUKrD+PR5eGfbb0vr94nA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24907.8642.479155.35952@mariner.uk.xensource.com>
Date: Wed, 22 Sep 2021 13:29:54 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org,
    dpsmith@apertussolutions.com
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
In-Reply-To: <952a9c35-39bb-d229-0bb9-a1f4e893b61a@suse.com>
References: <osstest-164996-mainreport@xen.org>
	<d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
	<24904.44119.940679.241639@mariner.uk.xensource.com>
	<alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
	<19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
	<24907.4491.895219.37845@mariner.uk.xensource.com>
	<952a9c35-39bb-d229-0bb9-a1f4e893b61a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
> Is the Dom0 kernel used here a distro one or our own build of one of
> the upstream trees? In the latter case I'd expect propagation to be
> quite a bit faster than in the former case.

It's our own build.

> >  But I'm loathe to make this change
> > because it seems to me that it would be simply masking the bug.
> > 
> > Notably, when this goes wrong, it seems to happen after the guest has
> > been started once successfully already.  So there *is* enough
> > memory...
> 
> Well, there is enough memory, sure, but (transiently as it seems) not
> enough contiguous chunks. The likelihood of higher order allocations
> failing increases with smaller overall memory amounts (in Dom0 in this
> case), afaict, unless there's (aggressive) de-fragmentation.

Indeed.

I'm not sure, though, that I fully understand the design principles
behind non-order-0 allocations, and memory sizing, and so on.  Your
earlier mail suggeted there may not be a design principle, and that
anything relying on non-order-0 atomic allocations is only working by
luck (or an embarassing excess of ram).

Ian.

